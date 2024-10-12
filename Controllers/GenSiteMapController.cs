using Base;
using Base.Services;
using BaseApi.Attributes;
using BaseApi.Controllers;
using Microsoft.AspNetCore.Mvc;

namespace EarthAdmApi.Controllers
{
    [XgProgAuth]
    [ApiController]
    [Route("[controller]/[action]")]
    public class GenSiteMapController : BaseCtrl
    {
        [HttpPost]
        public async Task<FileResult?> Run(string domain)
        {
            var rows = await _Db.GetRowsA(@"
select Loc=Id, LastMod=format(AuditTime, 'yyyy-MM-dd') 
from dbo.Act 
where AuditStatus='Y'
");
            var bytes = _Seo.GenSiteMapFile(domain, rows);
            return (bytes == null)
                ? null
                : File(bytes, "text/plain", "sitemap.xml");
        }

    }//class
}