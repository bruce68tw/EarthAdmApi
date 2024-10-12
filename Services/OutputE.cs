using Base.Models;
using Base.Services;
using Newtonsoft.Json.Linq;

namespace EarthAdmApi.Services
{
    public class OutputE : BaseEditSvc
    {
        public OutputE(string ctrl) : base(ctrl) { }
        private string _outputId = "";

        override public EditDto GetDto()
        {
            return new EditDto
            {
                ReadSql = $@"
select a.*, CreatorName=u.Name,
    {_Fun.FidUser}=a.Creator
from dbo.Output a
join dbo.[User] u on a.Creator=u.Id
where a.Id=@Id
",
                Table = "dbo.Output",
                PkeyFid = "Id",
                Col4 = null,
                Items = new EitemDto[]
                {
                    new() { Fid = "Id" },
                    new() { Fid = "OutputStatus" },
                    new() { Fid = "OutputTime" },
                },
                Childs = new EditDto[]
                {
                    new EditDto
                    {
                        ReadSql = @"
select a.*,
    i.Name as ItemName, i.TypeId, i.Unit, 
    i.StockAmount, i.StockWayAmount, i.PlanAmount,
    t.Name as TypeName
from dbo.OutputItem a
join dbo.Item i on a.ItemId=i.Id
join dbo.ItemType t on i.TypeId=t.Id
where a.OutputId=@Id
order by i.Id
",
                    },
                },
            };
        }

        //確定出貨
        override public async Task<ResultDto> UpdateA(string key, JObject json)
        {
            //物品的實際庫存必須大於出貨數量
            var names = await _Db.GetStrsA(@$"
select i.Name
from dbo.OutputItem a
join dbo.Item i on a.ItemId=i.Id
where a.OutputId=@Id
and a.Amount > i.StockAmount
", new() { "Id", key });

            if (names != null)
                return _Model.GetError($"物品的實際庫存必須大於出貨數量({_List.ToStr(names, false)})");

            _outputId = key;
            return await EditService().UpdateA(key, json, null, FnAfterSaveA);
        }

        /// <summary>
        /// delegate for afterSaveA, 確定出貨時:
        ///   出貨後實際庫存會減少
        /// </summary>
        /// <param name="inputJson"></param>
        /// <param name="edit"></param>
        /// <returns></returns>
        private async Task<string> FnAfterSaveA(CrudEditSvc editService, Db db, JObject keyJson)
        {
            //update Item.StockAmount
            var count = await db.ExecSqlA(@$"
update i set 
    i.StockAmount = i.StockAmount - o.Amount
from dbo.Item i
join dbo.OutputItem o on o.OutputId='{_outputId}' and i.Id=o.ItemId
");
            if (count == 0)
                return "無法更新 Item.StockAmount";

            //case of ok
            return "";
        }

    } //class
}
