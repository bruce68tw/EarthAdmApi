using Base.Enums;
using Base.Models;
using Base.Services;
using BaseApi.Attributes;
using BaseApi.Controllers;
using EarthAdmApi.Services;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json.Linq;

//for 捐助人聯絡記錄
namespace EarthAdmApi.Controllers
{
    [XgLogin]
    [ApiController]
    [Route("[controller]/[action]")]
    public class DonorTalkAuditController : BaseCtrl
    {
        [HttpPost]
        [XgProgAuth(CrudEnum.Read)]
        public async Task<ContentResult> GetPage(EasyDtDto dt)
        {
            return JsonToCnt(await new DonorTalkAuditR().GetPageA(Ctrl, dt));
        }

        private DonorTalkAuditE EditService()
        {
            return new DonorTalkAuditE(Ctrl);
        }

        //修改(送審)時寫入AuditTime
        private JObject RowSetAudit(JObject json)
        {
            //var row = (json[_Fun.FidRows] as JArray)![0];
            var row = _Json.GetRows0(json)!;
            row["AuditTime"] = _Date.ToDbStr(DateTime.Now);
            return json;
        }

        [HttpPost]
        [XgProgAuth(CrudEnum.Create)]
        public async Task<JsonResult> Create(string json)
        {
            return Json(await EditService().CreateA(RowSetAudit(_Str.ToJson(json)!)));
        }

        [HttpPost]
        [XgProgAuth(CrudEnum.Update)]
        public async Task<ContentResult> GetUpdJson(string key)
        {
            return JsonToCnt(await EditService().GetUpdJsonA(key));
        }

        [HttpPost]
        [XgProgAuth(CrudEnum.Update)]
        public async Task<JsonResult> Update(string key, string json)
        {
            return Json(await EditService().UpdateA(key, RowSetAudit(_Str.ToJson(json)!)));
        }

        [HttpPost]
        [XgProgAuth(CrudEnum.Delete)]
        public async Task<JsonResult> Delete(string key)
        {
            return Json(await EditService().DeleteA(key));
        }

        [HttpPost]
        [XgProgAuth(CrudEnum.View)]
        public async Task<ContentResult> GetViewJson(string key)
        {
            return JsonToCnt(await EditService().GetViewJsonA(key));
        }

    }//class
}