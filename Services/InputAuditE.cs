using Base.Models;
using Base.Services;
using Newtonsoft.Json.Linq;

namespace EarthAdmApi.Services
{
    public class InputAuditE : BaseEditSvc
    {
        public InputAuditE(string ctrl) : base(ctrl) { }

        override public EditDto GetDto()
        {
            return new EditDto
            {
                ReadSql = $@"
select a.*, 
    DonateTitle=d.Title, CreatorName=u.Name,
    {_Fun.FidUser}=a.Creator
from dbo.Input a
join dbo.Donate d on a.DonateId=d.Id
join dbo.[User] u on a.Creator=u.Id
where a.Id=@Id
",
                Table = "dbo.Input",
                PkeyFid = "Id",
                Col4 = new[] { "Creator", "Created" },
                Items = new EitemDto[]
                {
                    //new() { Fid = "Id" },
                    new() { Fid = "AuditNote" },
                    new() { Fid = "AuditStatus" },
                    new() { Fid = "AuditTime" },
                },
                Childs = new EditDto[]
                {
                    new EditDto
                    {
                        ReadSql = @"
select a.*,
    i.Name as ItemName, i.TypeId, i.Unit, 
    i.StockAmount, i.StockWayAmount, i.PlanAmount,
    t.Name as TypeName
from dbo.InputItem a
join dbo.Item i on a.ItemId=i.Id
join dbo.ItemType t on i.TypeId=t.Id
where a.InputId=@Id
order by i.Id
",
                    },
                },
            };
        }

        private string _key = "";

        //審核通過更新 Item.StockWayAmount, StockAmount, DonateItem.InputAmount 
        override public async Task<ResultDto> UpdateA(string key, JObject json)
        {
            _key = key;
            var status = (_Json.GetRows0(json)!["AuditStatus"]!.ToString() == "Y");
            //return await EditService().UpdateA(key, json, null, status ? FnAfterSaveA : null);
            return await EditService().UpdateA(key, json);
        }

        /// <summary>
        /// delegate for afterSaveA, 審核通過時:
        ///   更新Donate.InputStatus(N->P if need), DonateItem.InputAmount(入庫數量)
        ///   實際庫存＂會增加(by InputItem)、＂在途庫存＂會減少(by DonateItem)
        /// </summary>
        /// <param name="inputJson"></param>
        /// <param name="edit"></param>
        /// <returns></returns>
        private async Task<string> FnAfterSaveA(CrudEditSvc editService, Db db, JObject keyJson)
        {
            //update Donate.InputStatus if need(only InputStatus='N')
            var donateId = await db.GetStrA("select DonateId from dbo.Input where Id=@Id", new() { "Id", _key });
            await db.ExecSqlA(@$"
update dbo.Donate set InputStatus='P' 
where Id='{donateId}'
and InputStatus='N'
");
            //update DonateItem.InputAmount
            var count = await db.ExecSqlA(@$"
update a set 
    a.InputAmount = a.InputAmount + i.Amount
from dbo.DonateItem a
join dbo.InputItem i on i.InputId='{_key}' and a.ItemId=i.ItemId
where a.DonateId='{donateId}'
");
            if (count == 0)
                return "無法更新 DonateItem.InputAmount";

            //update 實際庫存(增加 by InputItem)、在途庫存(減少 by DonateItem)
            count = await db.ExecSqlA(@$"
update a set 
    a.StockAmount = a.StockAmount + i.Amount, 
    a.StockWayAmount = a.StockWayAmount - d.Amount
from dbo.Item a
join dbo.InputItem i on i.InputId='{_key}' and a.Id=i.ItemId
join dbo.DonateItem d on d.DonateId='{donateId}' and a.Id=d.ItemId
");
            if (count == 0)
                return "無法更新 Item.StockAmount, StockWayAmount";

            //case of ok
            return "";
        }

    } //class
}
