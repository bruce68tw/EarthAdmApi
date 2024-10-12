using Base.Models;
using Base.Services;

namespace EarthAdmApi.Services
{
    public class ActAuditE : BaseEditSvc
    {
        public ActAuditE(string ctrl) : base(ctrl) { }

        override public EditDto GetDto()
        {
            return new EditDto
            {
                ReadSql = $@"
select a.*, CreatorName=u.Name,
    {_Fun.FidUser}=a.Creator
from dbo.Act a
join dbo.[User] u on a.Creator=u.Id
where a.Id=@Id
",
                Table = "dbo.Act",
                PkeyFid = "Id",
                Col4 = new[] { "Creator", "Created" },
                Items = new EitemDto[]
                {
                    new() { Fid = "Id" },
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
from dbo.ActItem a
join dbo.Item i on a.ItemId=i.Id
join dbo.ItemType t on i.TypeId=t.Id
where a.ActId=@Id
order by i.Id
",
                    },
                },
            };
        }

    } //class
}
