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
    public class MsgController : BaseCtrl
    {
        [HttpPost]
        [XgProgAuth(CrudEnum.Read)]
        public async Task<ContentResult> GetPage(EasyDtDto dt)
        {
            return JsonToCnt(await new MsgR().GetPageA(Ctrl, dt));
        }

        private MsgE EditService()
        {
            return new MsgE(Ctrl);
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
            return JsonToCnt(await EditService().GetUpdJsonA(key));
        }

        [HttpPost]
        [XgProgAuth(CrudEnum.View)]
        public async Task<ContentResult> GetViewJson(string key)
        {
            return JsonToCnt(await EditService().GetViewJsonA(key));
        }

        //領取, return error msg if any
        [HttpPost]
        public async Task<string> Take(string key)
        {
            //check是否被領取
            var args = new List<object>() { "Id", key };
            var error = "";
            var db = new Db();
            var owner = await db.GetStrA("select Owner from dbo.Msg where Id=@Id", args);
            if (owner == null)
            {
                error = "資料不存在。";
                goto lab_exit;
            } 
            else if(owner != "")
            {
                error = "此筆資料已經被領取。";
                goto lab_exit;
            }

            //update
            if (await db.ExecSqlA($"update dbo.Msg set Owner='{_Fun.UserId()}' where Id=@Id", args) != 1)
                error = "領取失敗。";
            
        lab_exit:
            await db.DisposeAsync();
            return error;
        }

    }//class
}