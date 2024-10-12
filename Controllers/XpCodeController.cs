using BaseApi.Attributes;
using BaseApi.Controllers;
using EarthAdmApi.Services;
using Microsoft.AspNetCore.Mvc;

namespace EarthAdmApi.Controllers
{
    [XgLogin]
    [ApiController]
    [Route("[controller]/[action]")]
    public class XpCodeController : BaseCtrl
    {
        [HttpPost]
        public async Task<JsonResult> ItemTypes()
        {
            return Json(await _XpCode.ItemTypesA());
        }

        [HttpPost]
        public async Task<JsonResult> Items()
        {
            return Json(await _XpCode.ItemsA());
        }

        [HttpPost]
        public async Task<JsonResult> Progs()
        {
            return Json(await _XpCode.ProgsA());
        }

        [HttpPost]
        public async Task<JsonResult> Roles()
        {
            return Json(await _XpCode.RolesA());
        }

        [HttpPost]
        public async Task<JsonResult> Skills()
        {
            return Json(await _XpCode.SkillsA());
        }
    }
}