using Base.Models;
using Base.Services;
using Newtonsoft.Json.Linq;

namespace EarthAdmApi.Services
{
    public class DonateAuditE : BaseEditSvc
    {
        public DonateAuditE(string ctrl) : base(ctrl) { }

        override public EditDto GetDto()
        {
            return new EditDto
            {
                ReadSql = $@"
select a.*, 
    d.Name as DonorName,
    u.Name as CreatorName,
    {_Fun.FidUser}=a.Creator
from dbo.Donate a
join dbo.Donor d on a.DonorId=d.Id
join dbo.[User] u on a.Creator=u.Id
where a.Id=@Id
",
                Table = "dbo.Donate",
                PkeyFid = "Id",
                Col4 = new[] { "Creator", "Created" },
                Items = new EitemDto[]
                {
                    new() { Fid = "Note" },
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
from dbo.DonateItem a
join dbo.Item i on a.ItemId=i.Id
join dbo.ItemType t on i.TypeId=t.Id
where a.DonateId=@Id
order by i.Id
",
                    },
                },
            };
        }

        private string _key = "";

        //審核通過更新 Item.StockWayAmount 
        override public async Task<ResultDto> UpdateA(string key, JObject json)
        {
            _key = key;
            var status = (_Json.GetRows0(json)!["AuditStatus"]!.ToString() == "Y");
            //return await EditService().UpdateA(key, json, null, status ? FnAfterSaveA : null);
            return await EditService().UpdateA(key, json);
        }

        //update item.StockWayAmount(在途庫存) if AuditStatus=1
        //delegate function of FnAfterSave
        //return error msg if any
        private async Task<string> FnAfterSaveA(CrudEditSvc editService, Db db, JObject newKeyJson)
        {
            //update item.StockWayAmount
            var sql = @"
update i
set i.StockWayAmount = i.StockWayAmount + d.Amount
from dbo.Item i
join dbo.DonateItem d on d.DonateId=@Id and i.Id=d.ItemId
";
            var count = await db.ExecSqlA(sql, new() { "Id", _key });
            return (count > 0)
                ? ""
                : "無法更新 Item.StockWayAmount";
        }

    } //class
}
