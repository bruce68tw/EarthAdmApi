using Base.Models;
using Base.Services;

namespace EarthAdmApi.Services
{
    public class StockE : BaseEditSvc
    {
        public StockE(string ctrl) : base(ctrl) { }

        override public EditDto GetDto()
        {
            return new EditDto
            {
                ReadSql = @"
select a.*, CreatorName=u.Name 
from dbo.Stock a
join dbo.[User] u on a.Creator=u.Id
where a.Id=@Id
",
                Table = "dbo.Stock",
                PkeyFid = "Id",
                Col4 = new[] { "Creator", "Created" },
                Items = new EitemDto[]
                {
                    new() { Fid = "Id" },
                },
                Childs = new EditDto[]
                {
                    new EditDto
                    {
                        ReadSql = @"
select a.*,
    TypeName=t.Name, ItemName=i.Name, i.Unit
from dbo.StockItem a
join dbo.Item i on a.ItemId=i.Id
join dbo.ItemType t on i.TypeId=t.Id
where a.StockId=@Id
order by t.Sort, i.Sort
",
                        Table = "dbo.StockItem",
                        PkeyFid = "Id",
                        FkeyFid = "StockId",
                        Col4 = null,
                        Items = new EitemDto[]
                        {
                            new() { Fid = "Id" },
                            new() { Fid = "Amount" },
                        },
                    },
                },
            };
        }

    } //class
}
