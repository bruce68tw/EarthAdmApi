using Base.Models;
using Base.Services;

namespace EarthAdmApi.Services
{
    public class DonorTalkAuditE : BaseEditSvc
    {
        public DonorTalkAuditE(string ctrl) : base(ctrl) { }

        override public EditDto GetDto()
        {
            return new EditDto
            {                 
                ReadSql = $@"
select a.*, 
    DonorName=d.Name, CreatorName=u.Name,
    {_Fun.FidUser}=a.Creator
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
                    new() { Fid = "AuditNote" },
                    new() { Fid = "AuditStatus" },
                    new() { Fid = "AuditTime" },
                },
            };
        }

    } //class
}
