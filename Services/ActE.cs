using Base.Models;
using Base.Services;
using BaseApi.Services;
using Newtonsoft.Json.Linq;

namespace EarthAdmApi.Services
{
    public class ActE : BaseEditSvc
    {
        public ActE(string ctrl) : base(ctrl) { }

        override public EditDto GetDto()
        {
            return new EditDto
            {
                FnGetNewKeyA = async()=> await _Xp.GetTodayKeyA("Act"),
                ReadSql = $@"
select a.*, CreatorName=u.Name,
    {_Fun.FidUser}=a.Creator
from dbo.Act a
join dbo.[User] u on a.Creator=u.Id
where a.Id=@Id
",
                Table = "dbo.Act",
                PkeyFid = "Id",
                Col4 = new[] { "Creator", "Created" },
                Items = new EitemDto[]
                {
                    new() { Fid = "Id" },
                    new() { Fid = "Name" },
                    new() { Fid = "StartDate" },
                    new() { Fid = "EndDate" },
                    new() { Fid = "ImageFile" },
                    new() { Fid = "Note" },
                    new() { Fid = "PlanTime" },
                    new() { Fid = "AuditStatus" },
                    new() { Fid = "SendTime" },
                },
                Childs = new EditDto[]
                {
                    new EditDto
                    {
                        ReadSql = @"
select a.*,
    i.TypeId, i.Unit,
    i.StockAmount, i.StockWayAmount, i.PlanAmount
from dbo.ActItem a
join dbo.Item i on a.ItemId=i.Id
where a.ActId=@Id
order by i.Id
",
                        Table = "dbo.ActItem",
                        PkeyFid = "Id",
                        FkeyFid = "ActId",
                        //OrderBy = "",
                        Col4 = null,
                        Items = new EitemDto[]
                        {
                            new() { Fid = "Id" },
                            new() { Fid = "ActId" },
                            new() { Fid = "ItemId", Required = true },
                            new() { Fid = "Amount" },
                            /*
                            //以下5個欄位前端會傳入, 所以設定Create/Update = false, 將不會更新, 否則會產生傳入錯誤欄位log !!
                            new() { Fid = "TypeId", Create = false, Update = false },
                            new() { Fid = "Unit", Create = false, Update = false },
                            new() { Fid = "StockAmount", Create = false, Update = false },
                            new() { Fid = "InAmount", Create = false, Update = false },
                            new() { Fid = "OutAmount", Create = false, Update = false },
                            */
                        },
                    },
                },
            };
        }
        public async Task<ResultDto> CreateA(JObject json, IFormFile? t0_ImageFile)
        {
            var service = EditService();
            var result = await service.CreateA(json);
            if (_Valid.ResultStatus(result) && t0_ImageFile != null)
                await _HttpFile.SaveCrudFileA(json, service.GetNewKeyJson(), _Xp.DirAct, t0_ImageFile, nameof(t0_ImageFile));
            return result;
        }

        public async Task<ResultDto> UpdateA(string key, JObject json, IFormFile? t0_ImageFile)
        {
            var service = EditService();
            var result = await service.UpdateA(key, json);
            if (_Valid.ResultStatus(result) && t0_ImageFile != null)
                await _HttpFile.SaveCrudFileA(json, service.GetNewKeyJson(), _Xp.DirAct, t0_ImageFile, nameof(t0_ImageFile));
            return result;
        }

    } //class
}
