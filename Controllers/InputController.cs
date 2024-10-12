using Base.Enums;
using Base.Models;
using Base.Services;
using BaseApi.Attributes;
using BaseApi.Controllers;
using EarthAdmApi.Services;
using EarthLib.Services;
using Microsoft.AspNetCore.Mvc;

namespace EarthAdmApi.Controllers
{
    [XgLogin]
    [ApiController]
    [Route("[controller]/[action]")]
    public class InputController : BaseCtrl
    {
        [HttpPost]
        [XgProgAuth(CrudEnum.Read)]
        public async Task<ContentResult> GetPage(EasyDtDto dt)
        {
            return JsonToCnt(await new InputR().GetPageA(Ctrl, dt));
        }

        private InputE EditService()
        {
            return new InputE(Ctrl);
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
        //test 入庫單上鏈
        [HttpPost]
        public async Task<string?> GetTxLog(string key)
        {
            return await _Tx.GetLogA(key);
        }
        */

        /// <summary>
        /// 入庫單上鏈, MD5驗證 en.toolpage.org/tool/md5、www.md5hashgenerator.com、www.javainuse.com/onlinemd5
        /// </summary>
        /// <param name="key"></param>
        /// <returns>error if any</returns>
        [HttpPost]
        public async Task<string> UpBlock(string key)
        {
            return _Str.ToSystemError(await _CntrAccessLog.UploadInputA(key));
        }

        //讀取txLog source
        [HttpPost]
        public async Task<string> GetTxLogSource(string key)
        {
            return await _CntrAccessLog.GetInputLogSourceA(key);
        }

    }//class
}