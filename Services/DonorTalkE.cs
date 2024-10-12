using Base.Models;
using Base.Services;

namespace EarthAdmApi.Services
{
    public class DonorTalkE : BaseEditSvc
    {
        public DonorTalkE(string ctrl) : base(ctrl) { }

        override public EditDto GetDto()
        {
            return new EditDto
            {                 
                //權限由Donor控制, FidUser讀取Donor.Creator !!
                ReadSql = $@"
select a.*, CreatorName=u.Name,
    {_Fun.FidUser}=d.Creator
from dbo.DonorTalk a
join dbo.Donor d on a.DonorId=d.Id
join dbo.[User] u on a.Creator=u.Id
where a.Id=@Id
",
                AutoIdLen = _Fun.AutoIdLong,
                Table = "dbo.DonorTalk",
                PkeyFid = "Id",
                Col4 = new[] { "Creator", "Created" },
                Items = new EitemDto[] 
				{
					new() { Fid = "Id" },
                    new() { Fid = "DonorId" },
                    new() { Fid = "Note" },
                    new() { Fid = "Result" },
                    new() { Fid = "AuditStatus" },
                    new() { Fid = "SendTime" },
                },
            };
        }

    } //class
}
