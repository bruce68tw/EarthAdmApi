using Base.Models;
using Base.Services;
using BaseApi.Attributes;
using BaseApi.Controllers;
using EarthAdmApi.Services;
using Microsoft.AspNetCore.Mvc;

namespace EarthAdmApi.Controllers
{
    [XgLogin]
    [XgProgAuth]
    [ApiController]
    [Route("[controller]/[action]")]
    public class StockController : BaseCtrl
    {
        [HttpPost]
        public async Task<ContentResult> GetPage(EasyDtDto dt)
        {
            return JsonToCnt(await new StockR().GetPageA(Ctrl, dt));
        }

        private StockE EditService()
        {
            return new StockE(Ctrl);
        }

        [HttpPost]
        public async Task<ContentResult> GetUpdJson(string key)
        {
            return JsonToCnt(await EditService().GetUpdJsonA(key));
        }

        [HttpPost]
        public async Task<JsonResult> Update(string key, string json)
        {
            return Json(await EditService().UpdateA(key, _Audit.SendAudit(_Str.ToJson(json)!)));
        }

        [HttpPost]
        public async Task<ContentResult> GetViewJson(string key)
        {
            return JsonToCnt(await EditService().GetViewJsonA(key));
        }

        //更新庫存, return error msg if any
        [HttpPost]
        public async Task<string> UpdateItem(string key)
        {
            //set Stock.Status=0, StockTime
            var error = "";
            var args = new List<object>() { "Id", key };
            var db = new Db();
            await db.BeginTranA();
            var count = await db.ExecSqlA(@$"
update dbo.Stock 
set Status=0, StockTime='{_Date.NowDbStr()}'
where Id=@Id
", args);
            if (count == 0)
            {
                error = "無法更新Stock";
                goto lab_error;
            }

            //update Item.StockAmount
            count = await db.ExecSqlA(@"
update i set i.StockAmount = s.Amount
from dbo.Item i
join dbo.StockItem s on s.StockId=@Id and i.Id=s.ItemId
", args);
            if (count == 0)
            {
                error = "無法更新Item.StockAmount";
                goto lab_error;
            }

            //set Config.StockStatus=0
            count = await db.ExecSqlA("update dbo.Config set StockStatus=0");
            if (count == 0)
            {
                error = "無法更新Config.StockStatus";
                goto lab_error;
            }

            //case of ok
            await db.CommitA();
            await db.DisposeAsync();
            return "";

        lab_error:
            await db.RollbackA();
            await db.DisposeAsync();
            return "執行失敗，" + error;
        }

    }//class
}