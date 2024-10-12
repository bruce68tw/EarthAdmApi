using Base.Services;
using BaseApi.Services;
using DocumentFormat.OpenXml.Wordprocessing;
using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;
using System.Text;

namespace EarthAdmApi.Services
{
#pragma warning disable CA2211 // 非常數欄位不應可見
    public static class _Xp
    {
        //AES & JWT key
        //private const string AesKey = "YourAesKey";
        //private const string JwtKey = "YourJwtKey";

        //cms type msg
        public const string CmsMsg = "M";

        //from config file
        //public static XpConfigDto Config = null!;
        public static bool HasEther = false;

        //dir path
        //public static string NoImagePath = _Fun.DirRoot + "_image/noImage.jpg";
        public static string DirTemplate = _Fun.Dir("_template");
        public static string DirUpload = _Fun.Dir("_upload");
        public static string DirVol = DirUpload2("Vol");
        public static string DirAct = DirUpload2("Act");

        private static string DirUpload2(string subDir, bool sep = true)
        {
            return DirUpload + subDir + (sep ? _Fun.DirSep : "");
        }

        public static SymmetricSecurityKey GetJwtKey()
        {
            //return _jwtKey16;
            return new(Encoding.UTF8.GetBytes(_Str.PreZero(16, _Http.GetIp(), true)));
        }

        public static async Task<string> GetTodayKeyA(string table, Db? db = null)
        {
            var ym = _Date.NowYm();     //yyyyMM
            var sql = $"select top 1 Id from {table} where Id like '{ym}%' order by Id desc";
            var key = await _Db.GetStrA(sql, null, db);
            key = string.IsNullOrEmpty(key)
                ? "0001"
                : _Str.PreZero(4, Convert.ToInt32(key[6..]) + 1);
            return ym + key;
        }

        public static async Task<FileResult?> ViewVolPhotoA(string key, string ext)
        {
            return await ViewFileA(DirVol, "PhotoFile", key, ext);
        }
        public static string GetVolPhotoPath(string key, string ext)
        {
            return $"{DirVol}PhotoFile_{key}.{ext}";
        }

        private static async Task<FileResult?> ViewFileA(string dir, string fid, string key, string ext)
        {
            var path = $"{dir}{fid}_{key}.{ext}";
            return await _HttpFile.ViewFileA(path, $"{fid}.{ext}");
        }

    } //class
#pragma warning restore CA2211 // 非常數欄位不應可見
}
