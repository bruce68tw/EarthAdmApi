using Base.Models;
using Base.Services;

namespace EarthAdmApi.Services
{
    public class HouseE : BaseEditSvc
    {
        public HouseE(string ctrl) : base(ctrl) { }

        override public EditDto GetDto()
        {
            return new EditDto
            {
                ReadSql = @"
select a.*, CreatorName=u.Name 
from dbo.House a
join dbo.[User] u on a.Creator=u.Id
where a.Id=@Id
",
                Table = "dbo.House",
                PkeyFid = "Id",
                AutoIdLen = _Fun.AutoIdShort,
                Col4 = new[] { "Creator", "Created" },
                Items = new EitemDto[] 
				{
					new() { Fid = "Id" },
					new() { Fid = "Name" },
                },
            };
        }

    } //class
}
