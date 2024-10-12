using Base.Enums;
using Base.Models;
using Base.Services;
using BaseApi.Attributes;
using BaseApi.Controllers;
using EarthAdmApi.Services;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json.Linq;

namespace EarthAdmApi.Controllers
{
    [XgLogin]
    [ApiController]
    [Route("[controller]/[action]")]
    public class UserController : BaseCtrl
    {
        [HttpPost]
        [XgProgAuth(CrudEnum.Read)]
        public async Task<ContentResult> GetPage(EasyDtDto dt)
        {
            return JsonToCnt(await new UserR().GetPageA(Ctrl, dt));
        }

        private UserE EditService()
        {
            return new UserE(Ctrl);
        }

        [HttpPost]
        [XgProgAuth(CrudEnum.Create)]
        public async Task<JsonResult> Create(string json)
        {
            return Json(await EditService().CreateA(_Str.ToJson(json)!));
        }

        [HttpPost]
        [XgProgAuth(CrudEnum.Update)]
        public async Task<JsonResult> Update(string key, string json)
        {
            return Json(await EditService().UpdateA(key, _Str.ToJson(json)!));
        }

        [HttpPost]
        [XgProgAuth(CrudEnum.Update)]
        public async Task<ContentResult> GetUpdJson(string key)
        {
            //return JsonToCnt(await EditService().GetUpdJsonA(key));
            var json = new JObject()
            {
                ["data"] = await EditService().GetUpdJsonA(key),
                ["roles"] = await GetMurRows(key),
            };
            return JsonToCnt(json);
        }

        [HttpPost]
        [XgProgAuth(CrudEnum.Delete)]
        public async Task<JsonResult> Delete(string key)
        {
            return Json(await EditService().DeleteA(key));
        }

        private async Task<JArray?> GetMurRows(string key)
        {
            return await _ModeUR.GetValueRows("XpUserRole", "RoleId", "UserId", key);
        }

        [HttpPost]
        [XgProgAuth(CrudEnum.View)]
        public async Task<ContentResult> GetViewJson(string key)
        {
            var json = new JObject()
            {
                ["data"] = await EditService().GetViewJsonA(key),
                ["roles"] = await GetMurRows(key),
            };
            return JsonToCnt(json);
        }

        //清空密碼, return error msg if any
        [HttpPost]
        public async Task<string> ResetPwd(string key)
        {
            var sql = "update dbo.[User] set Pwd='' where Id=@Id";
            return (await _Db.ExecSqlA(sql, new() { "Id", key }) == 0)
                ? "無法清空密碼 !" : "";
        }

    }//class
}