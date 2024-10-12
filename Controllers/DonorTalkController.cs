using Base.Enums;
using Base.Models;
using Base.Services;
using BaseApi.Attributes;
using BaseApi.Controllers;
using EarthAdmApi.Services;
using Microsoft.AspNetCore.Mvc;

//for 捐助人聯絡記錄
namespace EarthAdmApi.Controllers
{
    [XgLogin]
    [ApiController]
    [Route("[controller]/[action]")]
    public class DonorTalkController : BaseCtrl
    {
        const string _ctrl = "Donor";

        [HttpPost]
        [XgProgAuth(CrudEnum.Read, _ctrl)]
        public async Task<ContentResult> GetPage(EasyDtDto dt)
        {
            return JsonToCnt(await new DonorTalkR().GetPageA(Ctrl, dt));
        }

        private DonorTalkE EditService()
        {
            return new DonorTalkE(Ctrl);
        }

        [HttpPost]
        [XgProgAuth(CrudEnum.Create, _ctrl)]
        public async Task<JsonResult> Create(string json)
        {
            return Json(await EditService().CreateA(_Audit.SendAudit(_Str.ToJson(json)!)));
        }

        [HttpPost]
        [XgProgAuth(CrudEnum.Update, _ctrl)]
        public async Task<ContentResult> GetUpdJson(string key)
        {
            return JsonToCnt(await EditService().GetUpdJsonA(key));
        }

        [HttpPost]
        [XgProgAuth(CrudEnum.Update, _ctrl)]
        public async Task<JsonResult> Update(string key, string json)
        {
            return Json(await EditService().UpdateA(key, _Audit.SendAudit(_Str.ToJson(json)!)));
        }

        [HttpPost]
        [XgProgAuth(CrudEnum.Delete, _ctrl)]
        public async Task<JsonResult> Delete(string key)
        {
            return Json(await EditService().DeleteA(key));
        }

        [HttpPost]
        [XgProgAuth(CrudEnum.View, _ctrl)]
        public async Task<ContentResult> GetViewJson(string key)
        {
            return JsonToCnt(await EditService().GetViewJsonA(key));
        }

    }//class
}