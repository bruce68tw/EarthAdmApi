using Base.Enums;
using Base.Models;
using Base.Services;
using BaseApi.Attributes;
using BaseApi.Controllers;
using EarthAdmApi.Services;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json.Linq;

namespace EarthAdmApi.Controllers
{
    [XgLogin]
    [ApiController]
    [Route("[controller]/[action]")]
    public class ActController : BaseCtrl
    {
        [HttpPost]
        [XgProgAuth(CrudEnum.Read)]
        public async Task<ContentResult> GetPage(EasyDtDto dt)
        {
            return JsonToCnt(await new ActR().GetPageA(Ctrl, dt));
        }

        private ActE EditService()
        {
            return new ActE(Ctrl);
        }

        [HttpPost]
        [XgProgAuth(CrudEnum.Create)]
        public async Task<JsonResult> Create(string json, [FromForm] IFormFile? t0_ImageFile)
        {
            //新增/修改時,如果_SendAudit=1(送審核), 則寫入AuditStatus、SendTime
            return Json(await EditService().CreateA(_Audit.SendAudit(_Str.ToJson(json)!), t0_ImageFile));
        }

        [HttpPost]
        [XgProgAuth(CrudEnum.Update)]
        public async Task<JsonResult> Update(string key, string json, [FromForm] IFormFile? t0_ImageFile)
        {
            return Json(await EditService().UpdateA(key, _Audit.SendAudit(_Str.ToJson(json)!), t0_ImageFile));
        }

        [HttpPost]
        [XgProgAuth(CrudEnum.Delete)]
        public async Task<JsonResult> Delete(string key)
        {
            return Json(await EditService().DeleteA(key));
        }

        [HttpPost]
        [XgProgAuth(CrudEnum.Update)]
        public async Task<ContentResult> GetUpdJson(string key)
        {
            return JsonToCnt(await EditService().GetUpdJsonA(key));
        }

        [HttpPost]
        [XgProgAuth(CrudEnum.View)]
        public async Task<ContentResult> GetViewJson(string key)
        {
            return JsonToCnt(await EditService().GetViewJsonA(key));
        }

        //轉出貨單, return error msg if any
        [HttpPost]
        [XgProgAuth(CrudEnum.Update)]
        public async Task<string> TranOutput(string key)
        {
            //check auth first
            var tran = false;
            var db = new Db();
            var error = await _XgProg.CheckAuthUserA(Ctrl, CrudEnum.Update, "Act", "Creator", key, db);
            if (error != "") goto lab_error;

            //檢查: Item實際庫存+在途庫存必須大於ActItem.Amount
            var args = new List<object> { "Id", key };
            var names = await db.GetStrsA(@$"
select i.Name
from dbo.ActItem a
join dbo.Item i on a.ItemId=i.Id
where a.ActId=@Id
and i.StockAmount+i.StockWayAmount < a.Amount
", args);
            if (names != null)
            {
                error = $"物品的實際庫存+在途庫存必須大於活動數量({_List.ToStr(names!, false)})。";
                goto lab_error;
            }

            //寫入出貨單Output
            var userId = _Fun.UserId();
            var now = _Date.NowDbStr();
            var outputId = await _Xp.GetTodayKeyA("dbo.Output", db);

            tran = true;
            await db.BeginTranA();
            var count = await db.ExecSqlA(@$"
insert into dbo.Output(Id, ActId, PlanTime, OutputStatus, Creator, Created)
select '{outputId}', @Id, PlanTime, 0, '{userId}', '{now}'
from dbo.Act 
where Id=@Id
and AuditStatus='Y'
and TranStatus=0
", args);
            if (count == 0)
            {
                error = $"找不到 dbo.Act({key})。";
                goto lab_error;
            }

            //寫入OutputItem
            var actItems = await db.GetRowsA("select * from dbo.ActItem where ActId=@Id", args);
            if (actItems == null)
            {
                error = $"找不到 dbo.ActItem({key})。";
                goto lab_error;
            }

            foreach(JObject actItem in actItems)
            {
                //var newId = _Str.NewId();
                var itemId = actItem["ItemId"]!.ToString();
                var amount = Convert.ToInt32(actItem["Amount"]);
                count = await db.ExecSqlA(@$"
insert into dbo.OutputItem(Id, OutputId, ItemId, Amount)
values('{_Str.NewId()}', '{outputId}', '{itemId}', {amount})
");
                if (count == 0)
                {
                    error = $"無法寫入 dbo.OutputItem({itemId})。";
                    goto lab_error;
                }
            }

            //更新Act.TranStatus、TranTime
            count = await db.ExecSqlA(@$"
update dbo.Act set TranStatus=1, TranTime='{now}' where Id=@Id
", args);
            if (count == 0)
            {
                error = $"無法更新 dbo.Act({key})。";
                goto lab_error;
            }

            //(多筆)預計出貨(Item.PlanAmount)增加: 
            count = await db.ExecSqlA(@$"
update i set i.PlanAmount=i.PlanAmount+a.Amount
from dbo.Item i 
join dbo.ActItem a on i.Id=a.ItemId
where a.ActId=@Id
", args);
            if (count == 0)
            {
                error = $"無法更新 Item.PlanAmount({key})。";
                goto lab_error;
            }

            //case of ok
            await db.CommitA();
            await db.DisposeAsync();
            return "";

        lab_error:
            if (tran) await db.RollbackA();
            await db.DisposeAsync();
            return error;
        }

    }//class
}