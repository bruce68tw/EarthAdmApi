using Base.Models;
using Base.Services;

namespace EarthAdmApi.Services
{
    public class ItemE : BaseEditSvc
    {
        public ItemE(string ctrl) : base(ctrl) { }

        override public EditDto GetDto()
        {
            return new EditDto
            {
                ReadSql = @"
select a.*, CreatorName=u.Name 
from dbo.Item a
join dbo.[User] u on a.Creator=u.Id
where a.Id=@Id
",
				Table = "dbo.Item",
                PkeyFid = "Id",
                AutoIdLen = _Fun.AutoIdShort,
                Col4 = new[] { "Creator", "Created" },
                Items = new EitemDto[] 
				{
					new() { Fid = "Id" },
                    new() { Fid = "TypeId" },
                    new() { Fid = "Unit" },
                    new() { Fid = "Name" },
                    new() { Fid = "CountAmount" },
                    new() { Fid = "PriorAmount", Update = false },
                    new() { Fid = "StockAmount", Update = false },
                    new() { Fid = "StockWayAmount", Update = false },
                    new() { Fid = "PlanAmount", Update = false },
                    new() { Fid = "Sort" },
                    new() { Fid = "Status" },
                },
            };
        }

    } //class
}
