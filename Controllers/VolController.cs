using Base.Enums;
using Base.Models;
using Base.Services;
using BaseApi.Attributes;
using BaseApi.Controllers;
using BaseEther.Services;
using EarthAdmApi.Services;
using EarthLib.Services;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using SkiaSharp;
using System.IO;

namespace EarthAdmApi.Controllers
{
    [XgLogin]
    [ApiController]
    [Route("[controller]/[action]")]
    public class VolController : BaseCtrl
    {
        [HttpPost]
        [XgProgAuth(CrudEnum.Read)]
        public async Task<ContentResult> GetPage(EasyDtDto dt)
        {
            return JsonToCnt(await new VolR().GetPageA(Ctrl, dt));
        }

        private VolE EditService()
        {
            return new VolE(Ctrl);
        }

        [HttpPost]
        [XgProgAuth(CrudEnum.Create)]
        public async Task<JsonResult> Create(string json, [FromForm] IFormFile t0_PhotoFile)
        {
            return Json(await EditService().CreateA(_Str.ToJson(json)!, t0_PhotoFile));
        }

        [HttpPost]
        [XgProgAuth(CrudEnum.Update)]
        public async Task<JsonResult> Update(string key, string json, [FromForm] IFormFile t0_PhotoFile)
        {
            return Json(await EditService().UpdateA(key, _Str.ToJson(json)!, t0_PhotoFile));
        }

        [HttpPost]
        [XgProgAuth(CrudEnum.Update)]
        public async Task<ContentResult> GetUpdJson(string key)
        {
            var json = new JObject()
            {
                ["data"] = await EditService().GetUpdJsonA(key),
                ["skills"] = await GetMurRows(key),
            };
            return JsonToCnt(json);
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
            var json = new JObject()
            {
                ["data"] = await EditService().GetViewJsonA(key),
                ["skills"] = await GetMurRows(key),
            };
            return JsonToCnt(json);
        }

        //get file/image
        public async Task<FileResult?> ViewFile(string sid, string key, string ext)
        {
            return await _Xp.ViewVolPhotoA(key, ext);
        }

        //get mode-UR rows
        private async Task<JArray?> GetMurRows(string key)
        {
            return await _ModeUR.GetValueRows("VolSkill", "SkillId", "VolId", key);
        }

        /// <summary>
        /// 生NFT證書(含圖檔)
        /// </summary>
        /// <param name="key"></param>
        /// <returns>error msg if any</returns>
        [HttpPost]
        [XgProgAuth(CrudEnum.Update)]
        public async Task<string> GenNft(string key)
        {
            #region 1.讀取志工資料
            var error = "";
            var args = new List<object> { "Id", key };
            var nftPath = _Fun.DirImage + "tempNft.png";
            var db = new Db();
            var vol = await db.GetRowA("select * from dbo.Vol where Id=@Id", args);
            if (vol == null)
            {
                error = $"Can not Find Vol row.({key})";
                goto lab_error;
            }

            //Vol.EtherAddress 不可空白
            var nftReceiver = vol["EtherAddress"]!.ToString();
            if (_Str.IsEmpty(nftReceiver))
            {
                error = $"Vol.EtherAddress is Empty.({key})";
                goto lab_error;
            }

            var acts = await db.GetRowsA(@"
select v.*, ActName=a.Name 
from dbo.VolAct v
join dbo.Act a on v.ActId=a.Id
where v.VolId=@Id
", args);
            if (acts == null)
            {
                error = $"Can not Find VolAct table.({key})";
                goto lab_error;
            }
            #endregion

            #region 2.產生NFT圖檔
            const int x1 = 100;
            var service = new GenImageSvc(nftPath, 794, 1122, "標楷體");
            service.AddImage(0, 0, _Fun.DirImage + "border.jpg", 794, 1122);
            service.AddText(-1, 120, "志工服務 NFT 證書", 28);

            //add photo if need
            var photoFile = vol["PhotoFile"]!.ToString();
            if (photoFile != "")
            {
                var photoPath = _Xp.GetVolPhotoPath(key, _File.GetFileExt(photoFile));
                if (System.IO.File.Exists(photoPath))
                    service.AddImage(510, 160, photoPath, 181, 235, SKColors.Gray);
            }

            service.AddTextBlob(x1, 200, 480, $"感謝 {vol["Name"]} 君在本機構舉辦的賬災活動從事志工服務，活動方能順利推動，特頒此證以茲証明。", 24);

            const int y2 = 400;
            const int line = 40;
            const int size2 = 24;
            service.AddText(x1, y2, "以下是參與的活動內容：", size2);
            var i = 0;
            foreach (var act in acts) {
                var j = 2 * i + 1;
                service.AddText(x1, y2 + line * j, $"{i + 1}.{act["ActName"]}：", size2);
                service.AddText(x1, y2 + line * (j + 1), $"  {act["Note"]}", size2);
                i++;
            }

            const int x3 = 150;
            const int y3 = 900;
            const int size3 = 24;
            service.AddText(x3, y3, $"發證單位：{_XpLib.Config.Company}", size3);
            service.AddText(x3, y3 + line * 1, $"時間：中華民國 {_Date.ToTwDateStr(DateTime.Today, 1)}", size3);
            //service.AddText(x3, y3 + line * 1, "NFT Id：100", size3);
            //service.AddText(x3, y3 + line * 2, "NFT2：100", size3);
            service.Save();
            #endregion

            //3.上傳NFT圖檔到IPFS
            var config = _XpLib.Config;
            var cid = await _Ipfs.UploadImage(config.IpfsHost, config.IpfsApiKey, config.IpfsSecretKey, nftPath);
            if (cid == "")
            {
                error = "無法上傳圖檔到 Infura IPFS";
                goto lab_error;
            }

            //4.上傳NFT json檔到IPFS
            var json = new 
            {
	            name = "Earth NFT",
	            description = "Earth 志工服務 NFT",
	            image = $"{config.IpfsUrl}/{cid}"
            };
            cid = await _Ipfs.UploadText(config.IpfsHost, config.IpfsApiKey, config.IpfsSecretKey, JsonConvert.SerializeObject(json));
            if (cid == "")
            {
                error = "無法上傳JSON檔到 Infura IPFS";
                goto lab_error;
            }

            //5.呼叫 VolNft 合約
            //var nftReceiver = "0xEFe0E4eea8143Af0b3FBE10A1D8624d0ee36Bf8A";
            var tokenUri = $"{config.IpfsUrl}/{cid}";
            var tokenId = await _CntrVolNft.Mint(nftReceiver, tokenUri);
            if (tokenId < 0)
            {
                error = "無法建立 NFT";
                goto lab_error;
            }

            //6.寫入Vol.NftTokenId
            await db.ExecSqlA($"update dbo.Vol set NftTokenId={tokenId} where Id=@Id", args);
            await db.DisposeAsync();
            return "";

        lab_error:
            await db.DisposeAsync();
            return error;
        }

    }//class
}