using Base.Models;
using Base.Services;

namespace EarthAdmApi.Services
{
    public class DonorE : BaseEditSvc
    {
        public DonorE(string ctrl) : base(ctrl) { }

        override public EditDto GetDto()
        {
            return new EditDto
            {                 
                ReadSql = $@"
select a.*, CreatorName=u.Name,
    {_Fun.FidUser}=a.Creator
from dbo.Donor a
join dbo.[User] u on a.Creator=u.Id
where a.Id=@Id
",
                Table = "dbo.Donor",
                PkeyFid = "Id",
                Col4 = new[] { "Creator", "Created" },
                Items = new EitemDto[] 
				{
					new() { Fid = "Id" },
					new() { Fid = "Name" },
                    new() { Fid = "Phone" },
                    new() { Fid = "Email" },
                },
            };
        }

    } //class
}
