using Base.Models;
using Base.Services;

namespace EarthAdmApi.Services
{
    public class UserE : BaseEditSvc
    {
        public UserE(string ctrl) : base(ctrl) { }

        override public EditDto GetDto()
        {
            return new EditDto
            {
                //只讀取user table, roles的部分由ModeUR處理
                ReadSql = @"
select a.*, CreatorName=u.Name 
from dbo.[User] a
join dbo.[User] u on a.Creator=u.Id
where a.Id=@Id
",
                Table = "dbo.[User]",
                PkeyFid = "Id",
                Col4 = new[] { "Creator", "Created" },
                Items = new EitemDto[] 
				{
					new() { Fid = "Id" },
					new() { Fid = "Account" },
					new() { Fid = "Name" },
                    new() { Fid = "Phone" },
                    new() { Fid = "Email" },
					//new() { Fid = "Pwd" },
					new() { Fid = "Status" },
                },
                Childs = new EditDto[]
                {
                    new EditDto
                    {
                        Table = "dbo.XpUserRole",
                        PkeyFid = "Id",
                        FkeyFid = "UserId",
                        Col4 = null,
                        Items = new EitemDto[] 
						{
							new() { Fid = "Id" },
							new() { Fid = "UserId" },
							new() { Fid = "RoleId", Required = true },
                        },
                    },
                },
            };
        }

    } //class
}
