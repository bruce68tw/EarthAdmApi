using Base.Models;
using Base.Services;
using Newtonsoft.Json.Linq;

namespace EarthAdmApi.Services
{
    public class MsgE : BaseEditSvc
    {
        public MsgE(string ctrl) : base(ctrl) { }

        override public EditDto GetDto()
        {
            return new EditDto
            {
                FnGetNewKeyA = async()=> await _Xp.GetTodayKeyA("Msg"),
                ReadSql = $@"
select a.*, OwnerName=u.Name, ReviserName=u2.Name,
    {_Fun.FidUser}=a.Owner
from dbo.Msg a
left join dbo.[User] u on a.Owner=u.Id
left join dbo.[User] u2 on a.Reviser=u2.Id
where a.Id=@Id
",
                Table = "dbo.Msg",
                PkeyFid = "Id",
                Col4 = new[] { null, null, "Reviser", "Revised" },  //無新增
                Items = new EitemDto[]
                {
                    new() { Fid = "Id" },
                    new() { Fid = "UserName" },
                    new() { Fid = "Phone" },
                    new() { Fid = "Note" },
                    new() { Fid = "IsClose" },
                    new() { Fid = "CloseReason" },
                },
            };
        }
        /*
        public async Task<ResultDto> UpdateA(string key, JObject json)
        {
            var service = EditService();
            var result = await service.UpdateA(key, json);
            return result;
        }
        */

    } //class
}
