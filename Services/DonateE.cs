using Base.Models;
using Base.Services;

namespace EarthAdmApi.Services
{
    public class DonateE : BaseEditSvc
    {
        public DonateE(string ctrl) : base(ctrl) { }

        override public EditDto GetDto()
        {
            return new EditDto
            {
                FnGetNewKeyA = async () => await _Xp.GetTodayKeyA("Donate"),
                ReadSql = $@"
select a.*, 
    d.Name as DonorName, u.Name as CreatorName,
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
                    new() { Fid = "Id" },
                    new() { Fid = "DonorId" },
                    new() { Fid = "PlanDate" },
                    new() { Fid = "Title" },
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
from dbo.DonateItem a
join dbo.Item i on a.ItemId=i.Id
where a.DonateId=@Id
order by i.Id
",
                        Table = "dbo.DonateItem",
                        PkeyFid = "Id",
                        FkeyFid = "DonateId",
                        //OrderBy = "",
                        Col4 = null,
                        Items = new EitemDto[]
                        {
                            new() { Fid = "Id" },
                            new() { Fid = "DonateId" },
                            new() { Fid = "ItemId", Required = true },
                            new() { Fid = "Amount" },
                        },
                    },
                },
            };
        }

    } //class
}
