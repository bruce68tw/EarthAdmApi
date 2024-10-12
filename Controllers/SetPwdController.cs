using Base;
using Base.Services;
using BaseApi.Attributes;
using BaseApi.Controllers;
using Microsoft.AspNetCore.Mvc;

namespace EarthAdmApi.Controllers
{
    [XgLogin]
    [ApiController]
    [Route("[controller]/[action]")]
    public class SetPwdController : BaseCtrl
    {
        //return error msg if any
        [HttpPost]
        public async Task<string> Save(string? oldPwd, string newPwd)
        {
            //檢查密碼強度 if need
            var error = _Pwd.CheckStrong(newPwd);
            if (error != "") return error;

            oldPwd = string.IsNullOrEmpty(oldPwd)
                ? "" : _Str.Md5(oldPwd);
            var sql = $@"
update dbo.[User]
set Pwd='{_Str.Md5(newPwd)}'
where Id='{_Fun.UserId()}'
and ((@Pwd='' and Pwd is null) or Pwd=@Pwd)
";
            return (await _Db.ExecSqlA(sql, new List<object>() { "Pwd", oldPwd }) == 1)
                ? ""
                : "舊密碼輸入錯誤。";
        }

    }//class
}