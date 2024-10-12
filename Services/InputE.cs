using Base.Models;
using Base.Services;

namespace EarthAdmApi.Services
{
    public class InputE : BaseEditSvc
    {
        public InputE(string ctrl) : base(ctrl) { }

        override public EditDto GetDto()
        {
            return new EditDto
            {
                FnGetNewKeyA = async () => await _Xp.GetTodayKeyA("Input"), //入庫單號
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
                    new() { Fid = "Id" },
                    new() { Fid = "DonateId" },
                    new() { Fid = "Note" },
                    new() { Fid = "AuditStatus" },
                    new() { Fid = "SendTime" },
                },
                Childs = new EditDto[]
                {
                    new EditDto
                    {
                        ReadSql = @"
select a.*,
    i.TypeId, i.Unit,
    i.StockAmount, i.StockWayAmount, i.PlanAmount
from dbo.InputItem a
join dbo.Item i on a.ItemId=i.Id
where a.InputId=@Id
order by i.Id
",
                        Table = "dbo.InputItem",
                        PkeyFid = "Id",
                        FkeyFid = "InputId",
                        //OrderBy = "",
                        Col4 = null,
                        Items = new EitemDto[]
                        {
                            new() { Fid = "Id" },
                            new() { Fid = "InputId" },
                            new() { Fid = "ItemId", Required = true },
                            new() { Fid = "Amount" },
                        },
                    },
                },
            };
        }

    } //class
}
