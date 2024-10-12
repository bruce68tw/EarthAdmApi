
-- 注意!! 有建立外部鍵, 刪除的順序不可改變 -- 

-- Input
delete from dbo.InputItem
delete from dbo.Input

-- Output
delete from dbo.OutputItem
delete from dbo.Output

-- Donate
delete from dbo.DonateItem
delete from dbo.Donate

-- Vol
delete from dbo.VolAct
delete from dbo.VolSkill
delete from dbo.Vol

-- Act
delete from dbo.ActItem
delete from dbo.Act

-- 其他異動檔
delete from dbo.Msg
delete from dbo.StockItem
delete from dbo.Stock

-- 清除 Item 庫存數量
update dbo.Item set
	PriorAmount = 0,
	StockAmount = 0,
	StockWayAmount = 0,
	PlanAmount = 0
	
-- Donor
/*
delete from dbo.DonorTalk
delete from dbo.Donor
*/

-- 主檔
/*
delete from dbo.Item
delete from dbo.ItemType
delete from dbo.House
delete from dbo.Skill
*/

-- 權限
/*
delete from dbo.XpUserRole
delete from dbo.XpRoleProg
delete from dbo.XpProg
delete from dbo.XpRole
delete from dbo.[User]
*/
