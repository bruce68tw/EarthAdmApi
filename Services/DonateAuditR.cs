using Base.Enums;
using Base.Models;
using Base.Services;
using Newtonsoft.Json.Linq;

namespace EarthAdmApi.Services
{
    public class DonateAuditR
    {
        private readonly ReadDto dto = new()
        {
            ReadSql = @"
select a.* 
from dbo.Donate a
join dbo.Donor d on a.DonorId=d.Id
join dbo.[User] u on a.Creator=u.Id
order by a.Id
",
            TableAs = "a",
            Items = new QitemDto[] {
                new() { Fid = "Id", Op = ItemOpEstr.Like },
                new() { Fid = "AuditStatus" },
            },
        };

        public async Task<JObject?> GetPageA(string ctrl, EasyDtDto dt)
        {
            return await new CrudReadSvc().GetPageA(dto, dt, ctrl);
        }

    } //class
}