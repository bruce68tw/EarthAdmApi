using Base.Services;
using BaseApi.Attributes;
using BaseApi.Controllers;
using EarthAdmApi.Services;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json.Linq;

namespace EarthAdmApi.Controllers
{
    [XgLogin]
    [XgProgAuth]
    [ApiController]
    [Route("[controller]/[action]")]
    public class StockStatusController : BaseCtrl
    {
        //axios無法傳回number, 所以使用字串
        [HttpPost]
        public async Task<string> GetStatus()
        {
            var status = await _Db.GetIntA("select top 1 StockStatus from dbo.Config") ?? 0;
            return status.ToString();
        }

        //開始盤點
        //return error msg if any
        public async Task<string> SetStart()
        {
            return await SetStatus(true);
        }

        //取消盤點
        public async Task<string> Cancel()
        {
            return await SetStatus(false);
        }

        private async Task<string> SetStatus(bool status)
        {
            //update Config.StockStatus
            var error = "";
            var db = new Db();
            await db.BeginTranA();
            if (await db.ExecSqlA($"update dbo.Config set StockStatus={(status ? 1 : 0)}") == 0)
            {
                error = "無法更新 Config.StockStatus";
                goto lab_error;
            }

            //set all Stock.Status=0
            await db.ExecSqlA("update dbo.Stock set Status=0");

            //add Stock row
            if (status)
            {
                var stockId = await _Xp.GetTodayKeyA("dbo.Stock");
                var count = await db.ExecSqlA($@"
insert into dbo.Stock(Id, Status, Creator, Created)
values('{stockId}', 1, '{_Fun.UserId()}', '{_Date.NowDbStr()}')
");
                if (count != 1)
                {
                    error = "無法產生 Stock";
                    goto lab_error;
                }

                //get item
                var items = await db.GetRowsA("select Id, StockAmount from dbo.Item where Status=1");
                if (items == null)
                {
                    error = "找不到 Item 資料";
                    goto lab_error;
                }

                //add StockItems
                foreach (JObject item in items)
                {
                    count = await db.ExecSqlA($@"
insert into dbo.StockItem(Id, StockId, ItemId, Amount, OldAmount)
values('{_Str.NewId()}', '{stockId}', '{item["Id"]}', 0, {Convert.ToInt32(item["StockAmount"])})
");
                    if (count != 1)
                    {
                        error = "無法產生 StockItem";
                        goto lab_error;
                    }
                }
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