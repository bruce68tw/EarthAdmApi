using Base.Enums;
using Base.Models;
using Base.Services;
using BaseApi.Attributes;
using BaseApi.Controllers;
using EarthAdmApi.Services;
using EarthLib.Services;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json.Linq;

//出貨單確認
namespace EarthAdmApi.Controllers
{
    [XgLogin]
    [ApiController]
    [Route("[controller]/[action]")]
    public class OutputCheckController : BaseCtrl
    {
        [HttpPost]
        [XgProgAuth(CrudEnum.Read)]
        public async Task<ContentResult> GetPage(EasyDtDto dt)
        {
            return JsonToCnt(await new OutputCheckR().GetPageA(Ctrl, dt));
        }

        private OutputCheckE EditService()
        {
            return new OutputCheckE(Ctrl);
        }

        //出貨後確認
        [HttpPost]
        [XgProgAuth(CrudEnum.Update)]
        public async Task<JsonResult> Update(string key, string json)
        {
            //set CheckTime, Checker
            var json2 = _Str.ToJson(json)!;
            //var row = (json2[_Fun.FidRows] as JArray)![0] as JObject;
            var row = _Json.GetRows0(json2)!;
            row["CheckTime"] = _Date.NowDbStr();
            row["Checker"] = _Fun.UserId();
            return Json(await EditService().UpdateA(key, json2));
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

        /// <summary>
        /// 出貨單上鏈
        /// </summary>
        /// <param name="key"></param>
        /// <returns>error if any</returns>
        [HttpPost]
        public async Task<string> UpBlock(string key)
        {
            return _Str.ToSystemError(await _CntrAccessLog.UploadOutputA(key));
        }

        //讀取txLog source
        [HttpPost]
        public async Task<string> GetTxLogSource(string key)
        {
            return await _CntrAccessLog.GetOutputLogSourceA(key);
        }

    }//class
}