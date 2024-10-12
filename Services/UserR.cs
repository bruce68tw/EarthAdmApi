using Base.Enums;
using Base.Models;
using Base.Services;
using Newtonsoft.Json.Linq;
using System.Threading.Tasks;

namespace EarthAdmApi.Services
{
    public class UserR
    {
        private readonly ReadDto dto = new()
        {
            ReadSql = @"
select Id, Account, Name, Status
from dbo.[User]
order by Name
",
            Items = new QitemDto[] {
                new() { Fid = "Account", Op = ItemOpEstr.Like },
                new() { Fid = "Name", Op = ItemOpEstr.Like },
            },
        };

        public async Task<JObject?> GetPageA(string ctrl, EasyDtDto dt)
        {
            return await new CrudReadSvc().GetPageA(dto, dt, ctrl);
        }

    } //class
}