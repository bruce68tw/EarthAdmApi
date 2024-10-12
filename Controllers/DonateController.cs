using Base.Enums;
using Base.Models;
using Base.Services;
using BaseApi.Attributes;
using BaseApi.Controllers;
using DocumentFormat.OpenXml.Wordprocessing;
using EarthAdmApi.Services;
using Microsoft.AspNetCore.Mvc;

namespace EarthAdmApi.Controllers
{
    [XgLogin]
    [ApiController]
    [Route("[controller]/[action]")]
    public class DonateController : BaseCtrl
    {
        [HttpPost]
        [XgProgAuth(CrudEnum.Read)]
        public async Task<ContentResult> GetPage(EasyDtDto dt)
        {
            return JsonToCnt(await new DonateR().GetPageA(Ctrl, dt));
        }

        private DonateE EditService()
        {
            return new DonateE(Ctrl);
        }

        [HttpPost]
        [XgProgAuth(CrudEnum.Create)]
        public async Task<JsonResult> Create(string json)
        {
            //新增/修改時,如果AuditStatus=1(送審核), 則寫入SendTime
            return Json(await EditService().CreateA(_Audit.SendAudit(_Str.ToJson(json)!)));
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
            return Json(await EditService().UpdateA(key, _Audit.SendAudit(_Str.ToJson(json)!)));
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

        /*
        [HttpPost]
        public async Task<string> SendAudit(string key)
        {
            //審核後, 數量加入 Item.StockWayAmount
            //return await _Audit.AuditRowA("dbo.Donate", "dbo.DonateItem", "DonateId", key, "StockWayAmount", "");
            return await _Audit.SendAuditA("dbo.Donate", key);
        }
        */

    }//class
}