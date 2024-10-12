using Base;
using Base.Models;
using Base.Services;
using BaseApi.Controllers;
using EarthAdmApi.Services;
using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;
using Newtonsoft.Json.Linq;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;

namespace EarthAdmApi.Controllers
{
    [ApiController]
    [Route("[controller]/[action]")]
    public class LoginController : BaseCtrl
    {
        [HttpPost]
        public async Task<ContentResult> Login(string account, string? pwd)
        {
            #region 1.check DB password & lock status
            var sql = @"
select Id as UserId, Name as UserName, Pwd, IsLock
from dbo.[User]
where Account=@Account
";
            JObject result;
            var db = new Db();
            var row = await db.GetRowA(sql, new(){ "Account", account });
            if (row == null || row["Pwd"]!.ToString() != _Str.Md5(pwd) || row["IsLock"]!.ToString() == "1") {
                var msg = (row != null && row["IsLock"]!.ToString() == "1") ? "�b���w�g�Q��w�A�L�k�n�J�C" :
                    await _Login.LogFailA(account, db) ? "��ƿ�J���~�C" :
                    $"��J���~�W�L {_Fun.MaxLoginFail} ���A�b���w�g�Q��w�C";
                result = _Json.GetError(msg);
                goto lab_exit;
            }
            #endregion

            //login ok
            await _Login.LogOkA(account, db);

            #region 2.get base user info and write into session
            var userId = row["UserId"]!.ToString();
            var userName = row["UserName"]!.ToString();
            var authStrs = await _XgProg.GetAuthStrsA(userId, db);
            var userInfo = new BaseUserDto()
            {
                UserId = userId,
                UserName = userName,
                //DeptId = row["DeptId"]!.ToString(),
                //DeptName = row["DeptName"]!.ToString(),
                Locale = _Fun.Config.Locale,
                ProgAuthStrs = authStrs,   //for�ˬd�v��
                //IsLogin = true,
            };

            //write cache server for base user info
            //_Http.GetSession().Set(_Fun.FidBaseUser, userInfo);   //extension method
            _Cache.SetModel(userId, _Fun.FidBaseUser, userInfo);
            #endregion

            //return JWT token
            var token = new JwtSecurityToken(
                claims: new[] {
                    new Claim(ClaimTypes.Name, userId), //userId as session key
                },
                signingCredentials: new SigningCredentials(
                    _Xp.GetJwtKey(),
                    SecurityAlgorithms.HmacSha256
                ),
                expires: DateTime.Now.AddMinutes(_Fun.TimeOut)
            );

            result = new JObject()
            {
                ["token"] = new JwtSecurityTokenHandler().WriteToken(token),
                ["authStrs"] = authStrs,  //for filter client menu
                ["userName"] = userName,
            };

        lab_exit:
            await db.DisposeAsync();
            return JsonToCnt(result);
        }

    }
}