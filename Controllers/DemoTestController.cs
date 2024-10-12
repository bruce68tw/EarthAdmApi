using Base.Models;
using BaseApi.Controllers;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json.Linq;

namespace EarthAdmApi.Controllers
{
    [ApiController]
    [Route("[controller]/[action]")]
    public class DemoTestController : BaseCtrl
    {
        [HttpPost]
        public string GetStr() {
            return "Hello World !";
        }
        [HttpPost]
        public ContentResult GetJson(string Id, int Num) {
            return JsonToCnt(new JObject(){
                ["Id"] = Id,
                ["Num"] = Num,
            });
        }
        [HttpPost]
        public JsonResult GetModel(string Id, int Num) {
            return Json(new IdNumDto(){
                Id = Id,
                Num = Num,
            });
        }
        [HttpPost]
        public JsonResult GetModel2(JObject json) {
            return Json(new IdNumDto() {
                Id = json["Id"]!.ToString(),
                Num = Convert.ToInt32(json["Num"]),
            });
        }
        [HttpPost]
        public JsonResult GetModel3(IdNumDto json) {
            return Json(json);
        }

    }//class
}