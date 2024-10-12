using Base.Models;
using Base.Services;

namespace EarthAdmApi.Services
{
    public class OutputCheckE : BaseEditSvc
    {
        public OutputCheckE(string ctrl) : base(ctrl) { }
        //private string _outputId = "";

        override public EditDto GetDto()
        {
            return new EditDto
            {
                ReadSql = $@"
select a.*, CreatorName=u.Name, CheckerName=u2.Name,
    {_Fun.FidUser}=a.Creator
from dbo.Output a
join dbo.[User] u on a.Creator=u.Id
left join dbo.[User] u2 on a.Checker=u2.Id
where a.Id=@Id
",
                Table = "dbo.Output",
                PkeyFid = "Id",
                Col4 = null,
                Items = new EitemDto[]
                {
                    new() { Fid = "Id" },
                    new() { Fid = "CheckTime" },
                    new() { Fid = "Checker" },
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
from dbo.OutputItem a
join dbo.Item i on a.ItemId=i.Id
join dbo.ItemType t on i.TypeId=t.Id
where a.OutputId=@Id
order by i.Id
",
                    },
                },
            };
        }

    } //class
}
