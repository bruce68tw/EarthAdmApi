using Base.Enums;
using Base.Models;
using Base.Services;
using Newtonsoft.Json.Linq;

namespace EarthAdmApi.Services
{
    public class ItemR
    {
        private readonly ReadDto dto = new()
        {
            ReadSql = @"
select a.*, TypeName=t.Name 
from dbo.Item a
join dbo.ItemType t on a.TypeId=t.Id
order by t.Sort, a.Sort
",
            TableAs = "a",
            Items = new QitemDto[] {
                new() { Fid = "TypeId" },
                new() { Fid = "Name", Op = ItemOpEstr.Like },
            },
        };

        public async Task<JObject?> GetPageA(string ctrl, EasyDtDto dt)
        {
            return await new CrudReadSvc().GetPageA(dto, dt, ctrl);
        }

    } //class
}