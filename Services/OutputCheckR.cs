using Base.Enums;
using Base.Models;
using Base.Services;
using Newtonsoft.Json.Linq;

namespace EarthAdmApi.Services
{
    public class OutputCheckR
    {
        private readonly ReadDto dto = new()
        {
            ReadSql = @"
select a.*, u.Name as CreatorName, u2.Name as CheckerName
from dbo.Output a
join dbo.[User] u on a.Creator=u.Id
left join dbo.[User] u2 on a.Checker=u2.Id
order by a.Id
",
            TableAs = "a",
            Items = new QitemDto[] {
                new() { Fid = "Id", Op = ItemOpEstr.Like },
            },
        };

        public async Task<JObject?> GetPageA(string ctrl, EasyDtDto dt)
        {
            return await new CrudReadSvc().GetPageA(dto, dt, ctrl);
        }

    } //class
}