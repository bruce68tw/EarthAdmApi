using Base.Models;
using Base.Services;
using BaseApi.Services;
using Newtonsoft.Json.Linq;

namespace EarthAdmApi.Services
{
    public class VolE : BaseEditSvc
    {
        public VolE(string ctrl) : base(ctrl) { }

        override public EditDto GetDto()
        {
            return new EditDto
            {                 
                ReadSql = $@"
select a.*, CreatorName=u.Name,
    {_Fun.FidUser}=a.Creator
from dbo.Vol a
join dbo.[User] u on a.Creator=u.Id
where a.Id=@Id
",
                Table = "dbo.Vol",
                PkeyFid = "Id",
                Col4 = new[] { "Creator", "Created" },
                Items = new EitemDto[] 
				{
					new() { Fid = "Id" },
					new() { Fid = "Name" },
                    new() { Fid = "Phone" },
                    new() { Fid = "Email" },
                    new() { Fid = "Address" },
                    new() { Fid = "EtherAddress" },
                    new() { Fid = "PhotoFile" },
                    new() { Fid = "Status" },
                },
                Childs = new EditDto[]
                {
                    new EditDto
                    {
                        Table = "dbo.VolSkill",
                        PkeyFid = "Id",
                        FkeyFid = "VolId",
                        Col4 = null,
                        Items = new EitemDto[]
                        {
                            new() { Fid = "Id" },
                            new() { Fid = "VolId" },
                            new() { Fid = "SkillId", Required = true },
                        },
                    },
                    new EditDto
                    {
                ReadSql = @"
select v.*, ActName=a.Name 
from dbo.VolAct v
join dbo.Act a on v.ActId=a.Id
where v.VolId=@Id
",
                        Table = "dbo.VolAct",
                        PkeyFid = "Id",
                        FkeyFid = "VolId",
                        Col4 = null,
                        Items = new EitemDto[]
                        {
                            new() { Fid = "Id" },
                            new() { Fid = "VolId" },
                            new() { Fid = "ActId", Required = true },
                            new() { Fid = "Note", Required = true },
                        },
                    },
                },
            };
        }

        public async Task<ResultDto> CreateA(JObject json, IFormFile t0_PhotoFile)
        {
            var service = EditService();
            var result = await service.CreateA(json);
            if (_Valid.ResultStatus(result))
                await _HttpFile.SaveCrudFileA(json, service.GetNewKeyJson(), _Xp.DirVol, t0_PhotoFile, nameof(t0_PhotoFile));
            return result;
        }

        //TODO: add your code
        //t03_FileName: t + table serial _ + fid
        public async Task<ResultDto> UpdateA(string key, JObject json, IFormFile t0_PhotoFile)
        {
            var service = EditService();
            var result = await service.UpdateA(key, json);
            if (_Valid.ResultStatus(result))
                await _HttpFile.SaveCrudFileA(json, service.GetNewKeyJson(), _Xp.DirVol, t0_PhotoFile, nameof(t0_PhotoFile));
            return result;
        }

    } //class
}
