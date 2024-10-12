using Base.Enums;
using Base.Models;
using Base.Services;
using Newtonsoft.Json.Linq;

namespace EarthAdmApi.Services
{
    public class ItemTypeR
    {
        private readonly ReadDto dto = new()
        {
            ReadSql = @"
select a.*, CreatorName=u.Name 
from dbo.ItemType a
join dbo.[User] u on a.Creator=u.Id
order by a.Sort
",
            Items = new QitemDto[] {
                new() { Fid = "Name", Op = ItemOpEstr.Like },
            },
        };

        public async Task<JObject?> GetPageA(string ctrl, EasyDtDto dt)
        {
            return await new CrudReadSvc().GetPageA(dto, dt, ctrl);
        }

    } //class
}