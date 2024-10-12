using Base.Models;
using Base.Services;

namespace EarthAdmApi.Services
{
    public class XpProgE : BaseEditSvc
    {
        public XpProgE(string ctrl) : base(ctrl) { }

        override public EditDto GetDto()
        {
            return new EditDto
            {
                ReadSql = "select * from dbo.XpProg where Id=@Id",
				Table = "dbo.XpProg",
                PkeyFid = "Id",
                Col4 = null,
                Items = new EitemDto[] 
				{
					new() { Fid = "Id" },
                    /*
					new() { Fid = "Code" },
                    new() { Fid = "Name" },
                    new() { Fid = "AuthRow" },
                    new() { Fid = "Url" },
                    new() { Fid = "Sort" },
                    */
                },
                Childs = new EditDto[]
                {
                    new EditDto
                    {
                        ReadSql = @"
select a.*
from dbo.XpRoleProg a
join dbo.XpProg p on a.ProgId=p.Id
where a.ProgId=@Id
order by p.Sort
",
                        Table = "dbo.XpRoleProg",
                        PkeyFid = "Id",
                        FkeyFid = "ProgId",
                        //OrderBy = "",
                        Col4 = null,
                        Items = new EitemDto[] 
						{
							new() { Fid = "Id" },
							new() { Fid = "RoleId", Required = true },
							new() { Fid = "ProgId" },
                            new() { Fid = "FunCreate" },
                            new() { Fid = "FunRead" },
                            new() { Fid = "FunUpdate" },
                            new() { Fid = "FunDelete" },
                            new() { Fid = "FunPrint" },
                            new() { Fid = "FunExport" },
                            new() { Fid = "FunView" },
                        },
                    },
                },
            };
        }

    } //class
}
