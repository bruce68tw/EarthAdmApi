using Base.Services;
using Newtonsoft.Json.Linq;

namespace EarthAdmApi.Services
{
    //for dropdown input
    public static class _Audit
    {
        /*
        //set auditStatus、sendTime
        public static async Task<string> SendAuditA(string table, string key)
        {
            //狀態為[未審核]、[拒絶]才能送審核
            var sql = $"update {table} set AuditStatus='1', SendTime=getdate() where Id=@Id and AuditStatus in ('0','N')";
            return (await _Db.ExecSqlA(sql, new() { "Id", key }) == 1)
                ? ""
                : "狀態為[未審核]、[拒絶]才能送審核。";
        }
        */

        //set auditStatus、sendTime，固定讀取 _SendAudit 欄位來判斷
        public static JObject SendAudit(JObject json)
        {
            var row = _Json.GetRows0(json);
            //var rows = json[_Fun.FidRows] as JArray;
            if (row != null && row["_SendAudit"] != null && row["_SendAudit"]!.ToString() == "1")
            {
                row["AuditStatus"] = 1;
                row["SendTime"] = _Date.NowDbStr();
            }                
            return json;
        }

        //set auditTime
        public static JObject SetAuditTime(JObject json)
        {
            var row = _Json.GetRows0(json);
            if (row != null)
                row["AuditTime"] = _Date.NowDbStr();
            return json;
        }

        /*
        public static async Task<string> AuditRowA(string table, string itemTable, string fidFkey, 
            string id, string fidAdd, string fidMinus)
        {
            //get row & check
            var error = "";
            var trans = false;
            await using var db = new Db();
            var sql = $"select AuditStatus from {table} where Id=@Id";
            List<object> args = new() { "Id", id };
            var status = await db.GetStrA(sql, args);
            if (string.IsNullOrEmpty(status))
            {
                error = "找不到此筆資料。";
                goto lab_exit;
            }
            if (status != "0" && status != "N")
            {
                error = "此筆資料的狀態必須是 [未送審]、[拒絶]。";
                goto lab_exit;
            }

            //update table AuditStatus
            trans = true;
            await db.BeginTranA();
            sql = $"update {table} set AuditStatus='1' where Id=@Id";
            var count = await db.ExecSqlA(sql, args);
            if (count != 1)
            {
                error = "無法更新資料。";
                goto lab_exit;
            }

            if (itemTable == "") goto lab_exit;

            //get itemTable rows
            sql = $"select ItemId, Amount from {itemTable} where {fidFkey}=@Id";
            var rows = await db.GetJsonsA(sql, args);
            if (rows == null || rows.Count == 0) goto lab_exit;

            try
            {
                //update item amount
                foreach (JObject row in rows)
                {
                    //add item amount if need //StockWayAmount
                    var amount = Convert.ToInt32(row["Amount"]);
                    if (amount == 0) continue;

                    var itemId = row["ItemId"]!.ToString();
                    if (!string.IsNullOrEmpty(fidAdd))
                    {
                        sql = $"update dbo.Item set {fidAdd}={fidAdd}+{amount} where Id='{itemId}'";
                        if (await db.ExecSqlA(sql) != 1)
                        {
                            error = $"無法更新 Item.{fidAdd}。";
                            goto lab_exit;
                        }
                    }

                    //minus item amount if need
                    if (!string.IsNullOrEmpty(fidMinus))
                    {
                        sql = $"update dbo.Item set {fidMinus}={fidMinus}-{amount} where Id='{itemId}'";
                        if (await db.ExecSqlA(sql) != 1)
                        {
                            error = $"無法更新 Item.{fidMinus}。";
                            goto lab_exit;
                        }
                    }
                }
            }
            catch(Exception ex)
            {
                await _Log.ErrorRootA("_Audit.cs AuditRow() failed: " + ex.Message);
                error = "審核失敗。";
                goto lab_exit;
            }

        lab_exit:
            if (trans)
            {
                if (string.IsNullOrEmpty(error))
                    await db.CommitA();
                else
                    await db.RollbackA();
            }
            await db.DisposeAsync();
            return error;        
        }
        */

    }//class
}
