using Base.Enums;
using Base.Models;
using Base.Services;
using Newtonsoft.Json.Linq;

namespace EarthAdmApi.Services
{
    public class MsgR
    {
        //領取狀態, 1(已領取),0(未領取),(-1)表示沒有傳入
        private int _status = -1;   

        private ReadDto GetDto()
        {
            var cond = (_status == 0) ? "a.Owner is null" : 
                (_status == 1) ? "a.Owner is not null" :
                "1=1";
            return new ()
            {
                ReadSql = $@"
select a.*, OwnerName=u.Name
from dbo.Msg a
left join dbo.[User] u on a.Owner=u.Id
where {cond}
order by a.Id
",
                TableAs = "a",
                Items = new QitemDto[] {
                    new() { Fid = "UserName", Op = ItemOpEstr.Like },
                    new() { Fid = "Phone", Op = ItemOpEstr.Like },
                    new() { Fid = "IsClose" },
                },
            };
        }

        public async Task<JObject?> GetPageA(string ctrl, EasyDtDto dt)
        {
            if (_Str.NotEmpty(dt.findJson))
            {
                var findJson = _Str.ToJson(dt.findJson)!;
                _status = _Num.TryParse(findJson["_TakeStatus"], -1);
            }
            return await new CrudReadSvc().GetPageA(GetDto(), dt, ctrl);
        }

    } //class
}