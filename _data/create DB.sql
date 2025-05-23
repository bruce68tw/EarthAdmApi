USE [Earth]
GO
/****** Object:  Table [dbo].[Act]    Script Date: 2025/4/27 下午 07:37:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Act](
	[Sn] [int] IDENTITY(1,1) NOT NULL,
	[Id] [varchar](10) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Note] [nvarchar](500) NOT NULL,
	[StartDate] [smalldatetime] NOT NULL,
	[EndDate] [smalldatetime] NOT NULL,
	[ImageFile] [nvarchar](100) NULL,
	[PlanTime] [datetime] NULL,
	[SendTime] [datetime] NULL,
	[AuditStatus] [char](1) NOT NULL,
	[AuditNote] [nvarchar](100) NULL,
	[AuditTime] [datetime] NULL,
	[Auditor] [varchar](10) NULL,
	[TranStatus] [bit] NOT NULL,
	[TranTime] [datetime] NULL,
	[Creator] [varchar](10) NOT NULL,
	[Created] [datetime] NOT NULL,
 CONSTRAINT [PK_Act] PRIMARY KEY CLUSTERED 
(
	[Sn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ActItem]    Script Date: 2025/4/27 下午 07:37:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActItem](
	[Sn] [int] IDENTITY(1,1) NOT NULL,
	[Id] [varchar](10) NOT NULL,
	[ActId] [varchar](10) NOT NULL,
	[ItemId] [varchar](6) NOT NULL,
	[Amount] [int] NOT NULL,
 CONSTRAINT [PK_ActItem] PRIMARY KEY CLUSTERED 
(
	[Sn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Config]    Script Date: 2025/4/27 下午 07:37:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Config](
	[ApName] [nchar](10) NOT NULL,
	[StockStatus] [bit] NOT NULL,
 CONSTRAINT [PK_Config] PRIMARY KEY CLUSTERED 
(
	[ApName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Donate]    Script Date: 2025/4/27 下午 07:37:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Donate](
	[Id] [varchar](10) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[DonorId] [varchar](10) NOT NULL,
	[PlanDate] [smalldatetime] NULL,
	[SendTime] [datetime] NULL,
	[AuditStatus] [char](1) NOT NULL,
	[AuditNote] [nvarchar](100) NULL,
	[AuditTime] [datetime] NULL,
	[InputStatus] [char](1) NOT NULL,
	[Creator] [varchar](10) NOT NULL,
	[Created] [datetime] NOT NULL,
 CONSTRAINT [PK_Donate] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DonateItem]    Script Date: 2025/4/27 下午 07:37:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonateItem](
	[Sn] [int] IDENTITY(1,1) NOT NULL,
	[Id] [varchar](10) NOT NULL,
	[DonateId] [varchar](10) NOT NULL,
	[ItemId] [varchar](6) NOT NULL,
	[Amount] [int] NOT NULL,
	[InputAmount] [int] NOT NULL,
 CONSTRAINT [PK_DonateItem] PRIMARY KEY CLUSTERED 
(
	[Sn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Donor]    Script Date: 2025/4/27 下午 07:37:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Donor](
	[Sn] [int] IDENTITY(1,1) NOT NULL,
	[Id] [varchar](10) NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[Email] [varchar](100) NULL,
	[Phone] [varchar](10) NULL,
	[Creator] [varchar](10) NOT NULL,
	[Created] [datetime] NOT NULL,
 CONSTRAINT [PK_Donor] PRIMARY KEY CLUSTERED 
(
	[Sn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DonorTalk]    Script Date: 2025/4/27 下午 07:37:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonorTalk](
	[Sn] [int] IDENTITY(1,1) NOT NULL,
	[Id] [varchar](16) NOT NULL,
	[DonorId] [varchar](10) NOT NULL,
	[Result] [nvarchar](100) NOT NULL,
	[Note] [nvarchar](500) NOT NULL,
	[SendTime] [datetime] NULL,
	[AuditStatus] [char](1) NOT NULL,
	[AuditNote] [nvarchar](100) NULL,
	[AuditTime] [datetime] NULL,
	[Creator] [varchar](10) NOT NULL,
	[Created] [datetime] NOT NULL,
 CONSTRAINT [PK_DonorTalk] PRIMARY KEY CLUSTERED 
(
	[Sn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[House]    Script Date: 2025/4/27 下午 07:37:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[House](
	[Sn] [int] IDENTITY(1,1) NOT NULL,
	[Id] [varchar](6) NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[Creator] [varchar](10) NOT NULL,
	[Created] [datetime] NOT NULL,
 CONSTRAINT [PK_House] PRIMARY KEY CLUSTERED 
(
	[Sn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Input]    Script Date: 2025/4/27 下午 07:37:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Input](
	[Sn] [int] IDENTITY(1,1) NOT NULL,
	[Id] [varchar](10) NOT NULL,
	[DonateId] [varchar](10) NOT NULL,
	[Note] [nvarchar](100) NOT NULL,
	[SendTime] [datetime] NULL,
	[AuditStatus] [char](1) NOT NULL,
	[AuditNote] [nvarchar](100) NULL,
	[AuditTime] [datetime] NULL,
	[TxUpTime] [datetime] NULL,
	[TxHash] [varchar](100) NULL,
	[TxLog] [varchar](100) NULL,
	[Creator] [varchar](10) NOT NULL,
	[Created] [datetime] NOT NULL,
 CONSTRAINT [PK_StockIn] PRIMARY KEY CLUSTERED 
(
	[Sn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InputItem]    Script Date: 2025/4/27 下午 07:37:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InputItem](
	[Sn] [int] IDENTITY(1,1) NOT NULL,
	[Id] [varchar](10) NOT NULL,
	[InputId] [varchar](10) NOT NULL,
	[ItemId] [varchar](6) NOT NULL,
	[Amount] [int] NOT NULL,
 CONSTRAINT [PK_InputItem] PRIMARY KEY CLUSTERED 
(
	[Sn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Item]    Script Date: 2025/4/27 下午 07:37:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Item](
	[Sn] [int] IDENTITY(1,1) NOT NULL,
	[Id] [varchar](6) NOT NULL,
	[TypeId] [varchar](6) NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[Unit] [nvarchar](20) NOT NULL,
	[CountAmount] [numeric](5, 1) NOT NULL,
	[PriorAmount] [int] NOT NULL,
	[StockAmount] [int] NOT NULL,
	[StockWayAmount] [int] NOT NULL,
	[PlanAmount] [int] NOT NULL,
	[Sort] [smallint] NOT NULL,
	[Status] [bit] NOT NULL,
	[Creator] [varchar](10) NOT NULL,
	[Created] [datetime] NOT NULL,
 CONSTRAINT [PK_Item] PRIMARY KEY CLUSTERED 
(
	[Sn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ItemType]    Script Date: 2025/4/27 下午 07:37:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemType](
	[Sn] [int] IDENTITY(1,1) NOT NULL,
	[Id] [varchar](6) NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[CountName] [nvarchar](20) NOT NULL,
	[Sort] [smallint] NOT NULL,
	[Status] [bit] NOT NULL,
	[Creator] [varchar](10) NOT NULL,
	[Created] [datetime] NOT NULL,
 CONSTRAINT [PK_ItemType] PRIMARY KEY CLUSTERED 
(
	[Sn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Login]    Script Date: 2025/4/27 下午 07:37:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Login](
	[Sn] [int] IDENTITY(1,1) NOT NULL,
	[Account] [varchar](20) NOT NULL,
	[FailCount] [tinyint] NOT NULL,
	[LoginStatus] [bit] NOT NULL,
	[LoginTime] [datetime] NOT NULL,
 CONSTRAINT [PK_Login] PRIMARY KEY CLUSTERED 
(
	[Sn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Msg]    Script Date: 2025/4/27 下午 07:37:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Msg](
	[Sn] [int] IDENTITY(1,1) NOT NULL,
	[Id] [varchar](16) NOT NULL,
	[IsDonate] [bit] NOT NULL,
	[UserName] [nvarchar](30) NOT NULL,
	[Phone] [varchar](15) NOT NULL,
	[Note] [nvarchar](500) NOT NULL,
	[Owner] [varchar](10) NULL,
	[IsClose] [bit] NOT NULL,
	[CloseReason] [nvarchar](100) NULL,
	[Created] [datetime] NOT NULL,
	[Reviser] [varchar](10) NULL,
	[Revised] [datetime] NULL,
 CONSTRAINT [PK_Msg] PRIMARY KEY CLUSTERED 
(
	[Sn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Output]    Script Date: 2025/4/27 下午 07:37:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Output](
	[Sn] [int] IDENTITY(1,1) NOT NULL,
	[Id] [varchar](10) NOT NULL,
	[ActId] [varchar](10) NULL,
	[Note] [nvarchar](100) NULL,
	[Block] [varchar](255) NULL,
	[PlanTime] [datetime] NULL,
	[OutputStatus] [bit] NOT NULL,
	[OutputTime] [datetime] NULL,
	[CheckTime] [datetime] NULL,
	[Checker] [varchar](10) NULL,
	[TxUpTime] [datetime] NULL,
	[TxHash] [varchar](100) NULL,
	[TxLog] [varchar](100) NULL,
	[Creator] [varchar](10) NOT NULL,
	[Created] [datetime] NOT NULL,
 CONSTRAINT [PK_Output] PRIMARY KEY CLUSTERED 
(
	[Sn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OutputItem]    Script Date: 2025/4/27 下午 07:37:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OutputItem](
	[Sn] [int] IDENTITY(1,1) NOT NULL,
	[Id] [varchar](10) NOT NULL,
	[OutputId] [varchar](10) NOT NULL,
	[ItemId] [varchar](6) NOT NULL,
	[Amount] [int] NOT NULL,
 CONSTRAINT [PK_OutputItem] PRIMARY KEY CLUSTERED 
(
	[Sn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Skill]    Script Date: 2025/4/27 下午 07:37:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Skill](
	[Sn] [int] IDENTITY(1,1) NOT NULL,
	[Id] [varchar](6) NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[Creator] [varchar](10) NOT NULL,
	[Created] [datetime] NOT NULL,
 CONSTRAINT [PK_Skill] PRIMARY KEY CLUSTERED 
(
	[Sn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stock]    Script Date: 2025/4/27 下午 07:37:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stock](
	[Sn] [int] IDENTITY(1,1) NOT NULL,
	[Id] [varchar](10) NOT NULL,
	[StockTime] [datetime] NULL,
	[Status] [bit] NOT NULL,
	[Creator] [varchar](10) NOT NULL,
	[Created] [datetime] NOT NULL,
 CONSTRAINT [PK_Stock] PRIMARY KEY CLUSTERED 
(
	[Sn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StockItem]    Script Date: 2025/4/27 下午 07:37:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StockItem](
	[Sn] [int] IDENTITY(1,1) NOT NULL,
	[Id] [varchar](10) NOT NULL,
	[StockId] [varchar](10) NOT NULL,
	[ItemId] [varchar](6) NOT NULL,
	[Amount] [int] NOT NULL,
	[OldAmount] [int] NOT NULL,
 CONSTRAINT [PK_StockItem] PRIMARY KEY CLUSTERED 
(
	[Sn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 2025/4/27 下午 07:37:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Sn] [int] IDENTITY(1,1) NOT NULL,
	[Id] [varchar](10) NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[Account] [varchar](20) NOT NULL,
	[Pwd] [varchar](32) NULL,
	[Phone] [varchar](10) NULL,
	[Email] [varchar](50) NULL,
	[PhotoFile] [nvarchar](100) NULL,
	[IsLock] [bit] NOT NULL,
	[Status] [bit] NOT NULL,
	[Creator] [varchar](10) NOT NULL,
	[Created] [datetime] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Sn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vol]    Script Date: 2025/4/27 下午 07:37:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vol](
	[Sn] [int] IDENTITY(1,1) NOT NULL,
	[Id] [varchar](10) NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Phone] [varchar](10) NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
	[EtherAddress] [varchar](100) NULL,
	[NftTokenId] [smallint] NULL,
	[PhotoFile] [nvarchar](100) NULL,
	[Status] [bit] NOT NULL,
	[Creator] [varchar](10) NOT NULL,
	[Created] [datetime] NOT NULL,
 CONSTRAINT [PK_Vol] PRIMARY KEY CLUSTERED 
(
	[Sn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VolAct]    Script Date: 2025/4/27 下午 07:37:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VolAct](
	[Sn] [int] IDENTITY(1,1) NOT NULL,
	[Id] [varchar](10) NOT NULL,
	[VolId] [varchar](10) NOT NULL,
	[ActId] [varchar](10) NOT NULL,
	[Note] [nvarchar](500) NULL,
 CONSTRAINT [PK_VolAct] PRIMARY KEY CLUSTERED 
(
	[Sn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VolSkill]    Script Date: 2025/4/27 下午 07:37:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VolSkill](
	[Sn] [int] IDENTITY(1,1) NOT NULL,
	[Id] [varchar](10) NOT NULL,
	[VolId] [varchar](10) NOT NULL,
	[SkillId] [varchar](6) NOT NULL,
 CONSTRAINT [PK_VolSkill] PRIMARY KEY CLUSTERED 
(
	[Sn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[XpProg]    Script Date: 2025/4/27 下午 07:37:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[XpProg](
	[Sn] [int] IDENTITY(1,1) NOT NULL,
	[Id] [varchar](10) NOT NULL,
	[Code] [varchar](30) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[Icon] [varchar](20) NULL,
	[Url] [varchar](100) NULL,
	[Sort] [smallint] NOT NULL,
	[AuthRow] [tinyint] NOT NULL,
	[FunCreate] [tinyint] NOT NULL,
	[FunRead] [tinyint] NOT NULL,
	[FunUpdate] [tinyint] NOT NULL,
	[FunDelete] [tinyint] NOT NULL,
	[FunPrint] [tinyint] NOT NULL,
	[FunExport] [tinyint] NOT NULL,
	[FunView] [tinyint] NOT NULL,
	[FunOther] [tinyint] NOT NULL,
 CONSTRAINT [PK_XpProg] PRIMARY KEY CLUSTERED 
(
	[Sn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[XpRole]    Script Date: 2025/4/27 下午 07:37:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[XpRole](
	[Sn] [int] IDENTITY(1,1) NOT NULL,
	[Id] [varchar](6) NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[Sort] [smallint] NOT NULL,
 CONSTRAINT [PK_XpRole] PRIMARY KEY CLUSTERED 
(
	[Sn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[XpRoleProg]    Script Date: 2025/4/27 下午 07:37:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[XpRoleProg](
	[Sn] [int] IDENTITY(1,1) NOT NULL,
	[Id] [varchar](10) NOT NULL,
	[RoleId] [varchar](6) NOT NULL,
	[ProgId] [varchar](10) NOT NULL,
	[FunCreate] [tinyint] NOT NULL,
	[FunRead] [tinyint] NOT NULL,
	[FunUpdate] [tinyint] NOT NULL,
	[FunDelete] [tinyint] NOT NULL,
	[FunPrint] [tinyint] NOT NULL,
	[FunExport] [tinyint] NOT NULL,
	[FunView] [tinyint] NOT NULL,
	[FunOther] [tinyint] NOT NULL,
 CONSTRAINT [PK_XpRoleProg] PRIMARY KEY CLUSTERED 
(
	[Sn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[XpUserRole]    Script Date: 2025/4/27 下午 07:37:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[XpUserRole](
	[Sn] [int] IDENTITY(1,1) NOT NULL,
	[Id] [varchar](10) NOT NULL,
	[UserId] [varchar](10) NOT NULL,
	[RoleId] [varchar](6) NOT NULL,
 CONSTRAINT [PK_XpUserRole] PRIMARY KEY CLUSTERED 
(
	[Sn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Act] ON 

INSERT [dbo].[Act] ([Sn], [Id], [Name], [Note], [StartDate], [EndDate], [ImageFile], [PlanTime], [SendTime], [AuditStatus], [AuditNote], [AuditTime], [Auditor], [TranStatus], [TranTime], [Creator], [Created]) VALUES (20, N'2023080001', N'8/5 中午共餐', N'test', CAST(N'2023-08-04T00:00:00' AS SmallDateTime), CAST(N'2023-08-05T00:00:00' AS SmallDateTime), N'map.png', CAST(N'2023-08-05T10:00:00.000' AS DateTime), CAST(N'2023-08-09T10:07:32.000' AS DateTime), N'Y', NULL, CAST(N'2023-08-09T10:40:45.000' AS DateTime), NULL, 1, CAST(N'2023-08-09T16:52:06.000' AS DateTime), N'2kDcWJR9JH', CAST(N'2023-08-03T23:20:52.000' AS DateTime))
INSERT [dbo].[Act] ([Sn], [Id], [Name], [Note], [StartDate], [EndDate], [ImageFile], [PlanTime], [SendTime], [AuditStatus], [AuditNote], [AuditTime], [Auditor], [TranStatus], [TranTime], [Creator], [Created]) VALUES (21, N'2023080002', N'棉被、衣服發放', N'棉被發放', CAST(N'2023-08-06T00:00:00' AS SmallDateTime), CAST(N'2023-08-06T00:00:00' AS SmallDateTime), N'', CAST(N'2023-08-06T10:00:00.000' AS DateTime), CAST(N'2023-08-09T10:13:20.000' AS DateTime), N'Y', NULL, CAST(N'2023-08-09T10:40:52.000' AS DateTime), NULL, 1, CAST(N'2023-08-09T15:55:17.000' AS DateTime), N'2kDcWJR9JH', CAST(N'2023-08-09T10:13:20.000' AS DateTime))
INSERT [dbo].[Act] ([Sn], [Id], [Name], [Note], [StartDate], [EndDate], [ImageFile], [PlanTime], [SendTime], [AuditStatus], [AuditNote], [AuditTime], [Auditor], [TranStatus], [TranTime], [Creator], [Created]) VALUES (22, N'2023080003', N'8/7 晚上共餐', N'8/7 晚上共餐', CAST(N'2023-08-07T00:00:00' AS SmallDateTime), CAST(N'2023-08-07T00:00:00' AS SmallDateTime), N'eat together.jpg', CAST(N'2023-08-07T15:00:00.000' AS DateTime), CAST(N'2023-08-09T13:11:23.000' AS DateTime), N'Y', NULL, CAST(N'2023-08-09T13:13:55.000' AS DateTime), NULL, 1, CAST(N'2023-08-09T13:59:45.000' AS DateTime), N'2kDcWJR9JH', CAST(N'2023-08-09T13:11:24.000' AS DateTime))
INSERT [dbo].[Act] ([Sn], [Id], [Name], [Note], [StartDate], [EndDate], [ImageFile], [PlanTime], [SendTime], [AuditStatus], [AuditNote], [AuditTime], [Auditor], [TranStatus], [TranTime], [Creator], [Created]) VALUES (23, N'2023080004', N'手電筒、衛生用品發放', N'手電筒、衛生用品發放', CAST(N'2023-08-08T00:00:00' AS SmallDateTime), CAST(N'2023-08-08T00:00:00' AS SmallDateTime), N'', CAST(N'2023-08-08T12:00:00.000' AS DateTime), CAST(N'2023-08-09T13:12:37.000' AS DateTime), N'Y', NULL, CAST(N'2023-08-09T13:14:23.000' AS DateTime), NULL, 0, NULL, N'2kDcWJR9JH', CAST(N'2023-08-09T13:12:37.000' AS DateTime))
INSERT [dbo].[Act] ([Sn], [Id], [Name], [Note], [StartDate], [EndDate], [ImageFile], [PlanTime], [SendTime], [AuditStatus], [AuditNote], [AuditTime], [Auditor], [TranStatus], [TranTime], [Creator], [Created]) VALUES (24, N'2023080005', N'乾糧發放', N'乾糧發放', CAST(N'2023-08-09T00:00:00' AS SmallDateTime), CAST(N'2023-08-09T00:00:00' AS SmallDateTime), N'', CAST(N'2023-08-09T15:00:00.000' AS DateTime), CAST(N'2023-08-09T13:13:47.000' AS DateTime), N'Y', NULL, CAST(N'2023-08-09T13:14:14.000' AS DateTime), NULL, 0, NULL, N'2kDcWJR9JH', CAST(N'2023-08-09T13:13:47.000' AS DateTime))
INSERT [dbo].[Act] ([Sn], [Id], [Name], [Note], [StartDate], [EndDate], [ImageFile], [PlanTime], [SendTime], [AuditStatus], [AuditNote], [AuditTime], [Auditor], [TranStatus], [TranTime], [Creator], [Created]) VALUES (25, N'2023080006', N'食用米、餐具', N'食用米、餐具', CAST(N'2023-08-10T00:00:00' AS SmallDateTime), CAST(N'2023-08-10T00:00:00' AS SmallDateTime), N'', CAST(N'2023-08-10T10:00:00.000' AS DateTime), CAST(N'2023-08-09T16:43:19.000' AS DateTime), N'Y', NULL, CAST(N'2023-08-09T16:43:27.000' AS DateTime), NULL, 0, NULL, N'2kDcWJR9JH', CAST(N'2023-08-09T16:43:19.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Act] OFF
GO
SET IDENTITY_INSERT [dbo].[ActItem] ON 

INSERT [dbo].[ActItem] ([Sn], [Id], [ActId], [ItemId], [Amount]) VALUES (1005, N'zJNfJa5DJk', N'2023080001', N'rVZvR7', 30)
INSERT [dbo].[ActItem] ([Sn], [Id], [ActId], [ItemId], [Amount]) VALUES (1006, N'lgOeCv4po0', N'2023080001', N'A1XTN0', 15)
INSERT [dbo].[ActItem] ([Sn], [Id], [ActId], [ItemId], [Amount]) VALUES (1007, N'rMcgjK95Xw', N'2023080002', N'YBcurn', 58)
INSERT [dbo].[ActItem] ([Sn], [Id], [ActId], [ItemId], [Amount]) VALUES (1008, N'vk09qM9cqO', N'2023080002', N'JaIapY', 68)
INSERT [dbo].[ActItem] ([Sn], [Id], [ActId], [ItemId], [Amount]) VALUES (1009, N'jTCrekYd8F', N'2023080002', N'2gRU9R', 88)
INSERT [dbo].[ActItem] ([Sn], [Id], [ActId], [ItemId], [Amount]) VALUES (1010, N'LtlDVUOWyZ', N'2023080003', N'rVZvR7', 32)
INSERT [dbo].[ActItem] ([Sn], [Id], [ActId], [ItemId], [Amount]) VALUES (1011, N'wnuyEYmTw2', N'2023080003', N'xf1fqW', 59)
INSERT [dbo].[ActItem] ([Sn], [Id], [ActId], [ItemId], [Amount]) VALUES (1012, N'zwTHTfqpZg', N'2023080004', N'pbolm0', 63)
INSERT [dbo].[ActItem] ([Sn], [Id], [ActId], [ItemId], [Amount]) VALUES (1013, N'L9j4dw9OpG', N'2023080004', N'c29TF7', 86)
INSERT [dbo].[ActItem] ([Sn], [Id], [ActId], [ItemId], [Amount]) VALUES (1014, N'VvxR406Rzx', N'2023080005', N'BVKydO', 77)
INSERT [dbo].[ActItem] ([Sn], [Id], [ActId], [ItemId], [Amount]) VALUES (1015, N'ZdBKi5auhG', N'2023080005', N'6nRXwQ', 92)
INSERT [dbo].[ActItem] ([Sn], [Id], [ActId], [ItemId], [Amount]) VALUES (1016, N'iJ5SXnhrRJ', N'2023080006', N'A1XTN0', 10)
INSERT [dbo].[ActItem] ([Sn], [Id], [ActId], [ItemId], [Amount]) VALUES (1017, N'RmSvsXd5f6', N'2023080006', N'6nRXwQ', 30)
SET IDENTITY_INSERT [dbo].[ActItem] OFF
GO
INSERT [dbo].[Config] ([ApName], [StockStatus]) VALUES (N'Earth救助系統 ', 0)
GO
INSERT [dbo].[Donate] ([Id], [Title], [DonorId], [PlanDate], [SendTime], [AuditStatus], [AuditNote], [AuditTime], [InputStatus], [Creator], [Created]) VALUES (N'2023080001', N'飲用水、白米', N'BU3vc1YMbI', CAST(N'2023-08-04T00:00:00' AS SmallDateTime), CAST(N'2023-08-03T13:34:40.000' AS DateTime), N'Y', NULL, CAST(N'2023-08-03T16:51:02.000' AS DateTime), N'P', N'V3h1vhjsQg', CAST(N'2023-08-03T13:34:40.000' AS DateTime))
INSERT [dbo].[Donate] ([Id], [Title], [DonorId], [PlanDate], [SendTime], [AuditStatus], [AuditNote], [AuditTime], [InputStatus], [Creator], [Created]) VALUES (N'2023080002', N'衣物、白米', N'3qnmor8upy', CAST(N'2023-08-05T00:00:00' AS SmallDateTime), CAST(N'2023-08-03T13:59:25.000' AS DateTime), N'Y', NULL, CAST(N'2023-08-03T16:51:36.000' AS DateTime), N'P', N'V3h1vhjsQg', CAST(N'2023-08-03T13:59:25.000' AS DateTime))
INSERT [dbo].[Donate] ([Id], [Title], [DonorId], [PlanDate], [SendTime], [AuditStatus], [AuditNote], [AuditTime], [InputStatus], [Creator], [Created]) VALUES (N'2023080003', N'寢具、衛生用品', N'HYSyIo1B57', CAST(N'2023-08-06T00:00:00' AS SmallDateTime), CAST(N'2023-08-03T14:08:43.000' AS DateTime), N'Y', NULL, CAST(N'2023-08-03T16:51:40.000' AS DateTime), N'P', N'V3h1vhjsQg', CAST(N'2023-08-03T14:08:43.000' AS DateTime))
INSERT [dbo].[Donate] ([Id], [Title], [DonorId], [PlanDate], [SendTime], [AuditStatus], [AuditNote], [AuditTime], [InputStatus], [Creator], [Created]) VALUES (N'2023080004', N'食物、手電筒', N'234', CAST(N'2023-08-05T00:00:00' AS SmallDateTime), CAST(N'2023-08-03T14:12:05.000' AS DateTime), N'Y', NULL, CAST(N'2023-08-03T16:51:43.000' AS DateTime), N'P', N'V3h1vhjsQg', CAST(N'2023-08-03T14:12:05.000' AS DateTime))
INSERT [dbo].[Donate] ([Id], [Title], [DonorId], [PlanDate], [SendTime], [AuditStatus], [AuditNote], [AuditTime], [InputStatus], [Creator], [Created]) VALUES (N'2023080005', N'餐具、水、米', N'123', CAST(N'2023-08-06T00:00:00' AS SmallDateTime), CAST(N'2023-08-03T14:14:38.000' AS DateTime), N'Y', NULL, CAST(N'2023-08-03T16:51:47.000' AS DateTime), N'P', N'V3h1vhjsQg', CAST(N'2023-08-03T14:14:38.000' AS DateTime))
INSERT [dbo].[Donate] ([Id], [Title], [DonorId], [PlanDate], [SendTime], [AuditStatus], [AuditNote], [AuditTime], [InputStatus], [Creator], [Created]) VALUES (N'2023080006', N'飲用水', N'BU3vc1YMbI', CAST(N'2023-08-09T00:00:00' AS SmallDateTime), CAST(N'2023-08-09T13:33:48.000' AS DateTime), N'Y', NULL, CAST(N'2023-08-09T13:35:57.000' AS DateTime), N'N', N'2kDcWJR9JH', CAST(N'2023-08-09T13:33:48.000' AS DateTime))
INSERT [dbo].[Donate] ([Id], [Title], [DonorId], [PlanDate], [SendTime], [AuditStatus], [AuditNote], [AuditTime], [InputStatus], [Creator], [Created]) VALUES (N'2023080007', N'食用米', N'HYSyIo1B57', CAST(N'2023-08-09T00:00:00' AS SmallDateTime), CAST(N'2023-08-09T13:34:16.000' AS DateTime), N'Y', NULL, CAST(N'2023-08-09T13:36:01.000' AS DateTime), N'P', N'2kDcWJR9JH', CAST(N'2023-08-09T13:34:16.000' AS DateTime))
INSERT [dbo].[Donate] ([Id], [Title], [DonorId], [PlanDate], [SendTime], [AuditStatus], [AuditNote], [AuditTime], [InputStatus], [Creator], [Created]) VALUES (N'2023080008', N'女短袖', N'123', CAST(N'2023-08-10T00:00:00' AS SmallDateTime), CAST(N'2023-08-09T13:34:44.000' AS DateTime), N'Y', NULL, CAST(N'2023-08-09T13:36:04.000' AS DateTime), N'N', N'2kDcWJR9JH', CAST(N'2023-08-09T13:34:44.000' AS DateTime))
INSERT [dbo].[Donate] ([Id], [Title], [DonorId], [PlanDate], [SendTime], [AuditStatus], [AuditNote], [AuditTime], [InputStatus], [Creator], [Created]) VALUES (N'2023080009', N'餅乾', N'234', CAST(N'2023-08-10T00:00:00' AS SmallDateTime), CAST(N'2023-08-09T13:35:11.000' AS DateTime), N'Y', NULL, CAST(N'2023-08-09T13:36:10.000' AS DateTime), N'N', N'2kDcWJR9JH', CAST(N'2023-08-09T13:35:11.000' AS DateTime))
INSERT [dbo].[Donate] ([Id], [Title], [DonorId], [PlanDate], [SendTime], [AuditStatus], [AuditNote], [AuditTime], [InputStatus], [Creator], [Created]) VALUES (N'2023080010', N'餐具', N'3qnmor8upy', CAST(N'2023-08-11T00:00:00' AS SmallDateTime), CAST(N'2023-08-09T13:35:39.000' AS DateTime), N'Y', NULL, CAST(N'2023-08-09T13:36:14.000' AS DateTime), N'N', N'2kDcWJR9JH', CAST(N'2023-08-09T13:35:39.000' AS DateTime))
INSERT [dbo].[Donate] ([Id], [Title], [DonorId], [PlanDate], [SendTime], [AuditStatus], [AuditNote], [AuditTime], [InputStatus], [Creator], [Created]) VALUES (N'2023080011', N'男女衣物', N'BU3vc1YMbI', CAST(N'2023-08-09T00:00:00' AS SmallDateTime), CAST(N'2023-08-09T15:43:22.000' AS DateTime), N'Y', NULL, CAST(N'2023-08-09T15:43:40.000' AS DateTime), N'P', N'2kDcWJR9JH', CAST(N'2023-08-09T15:43:22.000' AS DateTime))
INSERT [dbo].[Donate] ([Id], [Title], [DonorId], [PlanDate], [SendTime], [AuditStatus], [AuditNote], [AuditTime], [InputStatus], [Creator], [Created]) VALUES (N'2023080012', N'棉被', N'123', CAST(N'2023-08-09T00:00:00' AS SmallDateTime), CAST(N'2023-08-09T15:47:17.000' AS DateTime), N'Y', NULL, CAST(N'2023-08-09T15:47:26.000' AS DateTime), N'P', N'2kDcWJR9JH', CAST(N'2023-08-09T15:47:18.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[DonateItem] ON 

INSERT [dbo].[DonateItem] ([Sn], [Id], [DonateId], [ItemId], [Amount], [InputAmount]) VALUES (2002, N'k6Ux5g95Lw', N'2023080001', N'rVZvR7', 30, 45)
INSERT [dbo].[DonateItem] ([Sn], [Id], [DonateId], [ItemId], [Amount], [InputAmount]) VALUES (2003, N'hbrZgOVfhD', N'2023080001', N'avWI2F', 10, 10)
INSERT [dbo].[DonateItem] ([Sn], [Id], [DonateId], [ItemId], [Amount], [InputAmount]) VALUES (2004, N'OrfCzNkqUb', N'2023080001', N'xf1fqW', 10, 40)
INSERT [dbo].[DonateItem] ([Sn], [Id], [DonateId], [ItemId], [Amount], [InputAmount]) VALUES (2005, N'b7I0yRBWK4', N'2023080001', N'A1XTN0', 10, 15)
INSERT [dbo].[DonateItem] ([Sn], [Id], [DonateId], [ItemId], [Amount], [InputAmount]) VALUES (2006, N'Nxz5X4rFzF', N'2023080002', N'JaIapY', 30, 30)
INSERT [dbo].[DonateItem] ([Sn], [Id], [DonateId], [ItemId], [Amount], [InputAmount]) VALUES (2007, N'B5ShMXLOZK', N'2023080002', N'2gRU9R', 50, 50)
INSERT [dbo].[DonateItem] ([Sn], [Id], [DonateId], [ItemId], [Amount], [InputAmount]) VALUES (2008, N'PVus9L6AFr', N'2023080002', N'xf1fqW', 10, 10)
INSERT [dbo].[DonateItem] ([Sn], [Id], [DonateId], [ItemId], [Amount], [InputAmount]) VALUES (2009, N'nyBymtd7zo', N'2023080003', N'ahREw7', 10, 10)
INSERT [dbo].[DonateItem] ([Sn], [Id], [DonateId], [ItemId], [Amount], [InputAmount]) VALUES (2010, N'tokTioEb2t', N'2023080003', N'IEzOVK', 20, 20)
INSERT [dbo].[DonateItem] ([Sn], [Id], [DonateId], [ItemId], [Amount], [InputAmount]) VALUES (2011, N'jb1Qd1kNcF', N'2023080003', N'c29TF7', 50, 50)
INSERT [dbo].[DonateItem] ([Sn], [Id], [DonateId], [ItemId], [Amount], [InputAmount]) VALUES (2012, N'veEXaTl93z', N'2023080004', N'ofD4kE', 30, 30)
INSERT [dbo].[DonateItem] ([Sn], [Id], [DonateId], [ItemId], [Amount], [InputAmount]) VALUES (2013, N'hoDU62Nfd4', N'2023080004', N'BVKydO', 50, 50)
INSERT [dbo].[DonateItem] ([Sn], [Id], [DonateId], [ItemId], [Amount], [InputAmount]) VALUES (2014, N'rHUgP22gL4', N'2023080004', N'pbolm0', 30, 30)
INSERT [dbo].[DonateItem] ([Sn], [Id], [DonateId], [ItemId], [Amount], [InputAmount]) VALUES (2015, N'oM4hBEYsaB', N'2023080005', N'6nRXwQ', 50, 50)
INSERT [dbo].[DonateItem] ([Sn], [Id], [DonateId], [ItemId], [Amount], [InputAmount]) VALUES (2016, N'37rX3mc9Nm', N'2023080005', N'rVZvR7', 20, 20)
INSERT [dbo].[DonateItem] ([Sn], [Id], [DonateId], [ItemId], [Amount], [InputAmount]) VALUES (2017, N'DeDLdHGv9b', N'2023080005', N'xf1fqW', 20, 20)
INSERT [dbo].[DonateItem] ([Sn], [Id], [DonateId], [ItemId], [Amount], [InputAmount]) VALUES (2018, N'2AtrjDaOBn', N'2023080006', N'FSVCuk', 30, 0)
INSERT [dbo].[DonateItem] ([Sn], [Id], [DonateId], [ItemId], [Amount], [InputAmount]) VALUES (2019, N'IwzDSImwpK', N'2023080007', N'xf1fqW', 20, 30)
INSERT [dbo].[DonateItem] ([Sn], [Id], [DonateId], [ItemId], [Amount], [InputAmount]) VALUES (2020, N'GyooMF5IPZ', N'2023080008', N'UMOrOV', 0, 0)
INSERT [dbo].[DonateItem] ([Sn], [Id], [DonateId], [ItemId], [Amount], [InputAmount]) VALUES (2021, N'JGfyGqr63B', N'2023080009', N'BVKydO', 30, 0)
INSERT [dbo].[DonateItem] ([Sn], [Id], [DonateId], [ItemId], [Amount], [InputAmount]) VALUES (2022, N'0DEIBZrYtU', N'2023080010', N'6nRXwQ', 25, 0)
INSERT [dbo].[DonateItem] ([Sn], [Id], [DonateId], [ItemId], [Amount], [InputAmount]) VALUES (2023, N'wopQid2JUc', N'2023080011', N'JaIapY', 80, 80)
INSERT [dbo].[DonateItem] ([Sn], [Id], [DonateId], [ItemId], [Amount], [InputAmount]) VALUES (2024, N'eZVb31CJtf', N'2023080011', N'2gRU9R', 100, 120)
INSERT [dbo].[DonateItem] ([Sn], [Id], [DonateId], [ItemId], [Amount], [InputAmount]) VALUES (2025, N'yBxMGW0rZC', N'2023080012', N'YBcurn', 80, 85)
SET IDENTITY_INSERT [dbo].[DonateItem] OFF
GO
SET IDENTITY_INSERT [dbo].[Donor] ON 

INSERT [dbo].[Donor] ([Sn], [Id], [Name], [Email], [Phone], [Creator], [Created]) VALUES (1, N'BU3vc1YMbI', N'台北-王先生', N'a3@bb.cc', N'34567', N'Alex', CAST(N'2023-02-05T18:29:54.000' AS DateTime))
INSERT [dbo].[Donor] ([Sn], [Id], [Name], [Email], [Phone], [Creator], [Created]) VALUES (3, N'123', N'花蓮-陳先生', N'a1@bb.cc', N'12345', N'Alex', CAST(N'2023-02-20T12:00:00.000' AS DateTime))
INSERT [dbo].[Donor] ([Sn], [Id], [Name], [Email], [Phone], [Creator], [Created]) VALUES (1002, N'234', N'高雄-李小姐', N'a2@bb.cc', N'23456', N'Alex', CAST(N'2323-02-03T12:00:00.000' AS DateTime))
INSERT [dbo].[Donor] ([Sn], [Id], [Name], [Email], [Phone], [Creator], [Created]) VALUES (1004, N'3qnmor8upy', N'台中-張小姐', N'a5@bb.cc', N'12789', N'oE2LLiJ9ie', CAST(N'2023-08-03T02:02:42.000' AS DateTime))
INSERT [dbo].[Donor] ([Sn], [Id], [Name], [Email], [Phone], [Creator], [Created]) VALUES (1005, N'HYSyIo1B57', N'新竹-高先生', N'', N'23789', N'oE2LLiJ9ie', CAST(N'2023-08-03T02:03:19.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Donor] OFF
GO
SET IDENTITY_INSERT [dbo].[DonorTalk] ON 

INSERT [dbo].[DonorTalk] ([Sn], [Id], [DonorId], [Result], [Note], [SendTime], [AuditStatus], [AuditNote], [AuditTime], [Creator], [Created]) VALUES (4, N'IkQqYoUZ8OsdZKj4', N'BU3vc1YMbI', N'討論捐飲水數量', N'test', CAST(N'2023-02-06T13:36:45.000' AS DateTime), N'1', N'test', NULL, N'Alex', CAST(N'2023-02-06T13:36:45.000' AS DateTime))
INSERT [dbo].[DonorTalk] ([Sn], [Id], [DonorId], [Result], [Note], [SendTime], [AuditStatus], [AuditNote], [AuditTime], [Creator], [Created]) VALUES (5, N'hWjLVKYbDb0hOjZn', N'BU3vc1YMbI', N'詢問志工事項', N'test-abc123', NULL, N'0', NULL, NULL, N'Alex', CAST(N'2023-02-06T16:26:10.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[DonorTalk] OFF
GO
SET IDENTITY_INSERT [dbo].[House] ON 

INSERT [dbo].[House] ([Sn], [Id], [Name], [Creator], [Created]) VALUES (1, N'76AR4y', N'倉庫1', N'Alex', CAST(N'2023-02-05T01:07:48.000' AS DateTime))
INSERT [dbo].[House] ([Sn], [Id], [Name], [Creator], [Created]) VALUES (2, N'PEImNE', N'倉庫2', N'Alex', CAST(N'2023-02-05T01:08:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[House] OFF
GO
SET IDENTITY_INSERT [dbo].[Input] ON 

INSERT [dbo].[Input] ([Sn], [Id], [DonateId], [Note], [SendTime], [AuditStatus], [AuditNote], [AuditTime], [TxUpTime], [TxHash], [TxLog], [Creator], [Created]) VALUES (1005, N'2023080001', N'2023080001', N'飲用水、白米', CAST(N'2023-08-03T17:52:32.000' AS DateTime), N'Y', NULL, CAST(N'2023-08-03T17:52:46.000' AS DateTime), CAST(N'2023-12-10T23:25:55.777' AS DateTime), N'0xde698b9e3f8cdcb1326a5d0f687eee59b3cda208bace50e4c8c8dc26888f40f0', N'f06f19a5436b8ab23c2af370988c0b79', N'2kDcWJR9JH', CAST(N'2023-08-03T17:01:17.000' AS DateTime))
INSERT [dbo].[Input] ([Sn], [Id], [DonateId], [Note], [SendTime], [AuditStatus], [AuditNote], [AuditTime], [TxUpTime], [TxHash], [TxLog], [Creator], [Created]) VALUES (1006, N'2023080002', N'2023080002', N'衣物、白米', CAST(N'2023-08-04T16:47:53.000' AS DateTime), N'Y', NULL, CAST(N'2023-08-04T17:20:27.000' AS DateTime), NULL, NULL, NULL, N'2kDcWJR9JH', CAST(N'2023-08-04T16:47:53.000' AS DateTime))
INSERT [dbo].[Input] ([Sn], [Id], [DonateId], [Note], [SendTime], [AuditStatus], [AuditNote], [AuditTime], [TxUpTime], [TxHash], [TxLog], [Creator], [Created]) VALUES (1007, N'2023080003', N'2023080003', N'寢具、衛生用品', CAST(N'2023-08-04T17:20:18.000' AS DateTime), N'Y', NULL, CAST(N'2023-08-04T17:20:35.000' AS DateTime), NULL, NULL, NULL, N'2kDcWJR9JH', CAST(N'2023-08-04T17:20:18.000' AS DateTime))
INSERT [dbo].[Input] ([Sn], [Id], [DonateId], [Note], [SendTime], [AuditStatus], [AuditNote], [AuditTime], [TxUpTime], [TxHash], [TxLog], [Creator], [Created]) VALUES (1008, N'2023080004', N'2023080004', N'食物、手電筒', CAST(N'2023-08-04T17:21:52.000' AS DateTime), N'Y', NULL, CAST(N'2023-08-04T17:22:45.000' AS DateTime), NULL, NULL, NULL, N'2kDcWJR9JH', CAST(N'2023-08-04T17:21:52.000' AS DateTime))
INSERT [dbo].[Input] ([Sn], [Id], [DonateId], [Note], [SendTime], [AuditStatus], [AuditNote], [AuditTime], [TxUpTime], [TxHash], [TxLog], [Creator], [Created]) VALUES (1009, N'2023080005', N'2023080005', N'餐具、水、米', CAST(N'2023-08-04T17:22:39.000' AS DateTime), N'Y', NULL, CAST(N'2023-08-04T17:22:51.000' AS DateTime), NULL, NULL, NULL, N'2kDcWJR9JH', CAST(N'2023-08-04T17:22:39.000' AS DateTime))
INSERT [dbo].[Input] ([Sn], [Id], [DonateId], [Note], [SendTime], [AuditStatus], [AuditNote], [AuditTime], [TxUpTime], [TxHash], [TxLog], [Creator], [Created]) VALUES (1010, N'2023080006', N'2023080007', N'食用米', CAST(N'2023-08-09T14:02:56.000' AS DateTime), N'Y', NULL, CAST(N'2023-08-09T14:03:04.000' AS DateTime), NULL, NULL, NULL, N'2kDcWJR9JH', CAST(N'2023-08-09T14:02:44.000' AS DateTime))
INSERT [dbo].[Input] ([Sn], [Id], [DonateId], [Note], [SendTime], [AuditStatus], [AuditNote], [AuditTime], [TxUpTime], [TxHash], [TxLog], [Creator], [Created]) VALUES (1011, N'2023080007', N'2023080011', N'男女衣物', CAST(N'2023-08-09T15:44:57.000' AS DateTime), N'Y', NULL, CAST(N'2023-08-09T15:45:06.000' AS DateTime), NULL, NULL, NULL, N'2kDcWJR9JH', CAST(N'2023-08-09T15:44:57.000' AS DateTime))
INSERT [dbo].[Input] ([Sn], [Id], [DonateId], [Note], [SendTime], [AuditStatus], [AuditNote], [AuditTime], [TxUpTime], [TxHash], [TxLog], [Creator], [Created]) VALUES (1012, N'2023080008', N'2023080012', N'棉被', CAST(N'2023-08-09T15:48:15.000' AS DateTime), N'Y', NULL, CAST(N'2023-08-09T15:48:28.000' AS DateTime), NULL, NULL, NULL, N'2kDcWJR9JH', CAST(N'2023-08-09T15:48:15.000' AS DateTime))
INSERT [dbo].[Input] ([Sn], [Id], [DonateId], [Note], [SendTime], [AuditStatus], [AuditNote], [AuditTime], [TxUpTime], [TxHash], [TxLog], [Creator], [Created]) VALUES (1013, N'2023080009', N'2023080001', N'飲用水、白米', CAST(N'2023-08-09T16:48:21.000' AS DateTime), N'Y', NULL, CAST(N'2023-08-09T16:48:30.000' AS DateTime), NULL, NULL, NULL, N'2kDcWJR9JH', CAST(N'2023-08-09T16:48:21.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Input] OFF
GO
SET IDENTITY_INSERT [dbo].[InputItem] ON 

INSERT [dbo].[InputItem] ([Sn], [Id], [InputId], [ItemId], [Amount]) VALUES (2002, N'BvHHbtVsJb', N'2023080001', N'rVZvR7', 25)
INSERT [dbo].[InputItem] ([Sn], [Id], [InputId], [ItemId], [Amount]) VALUES (2003, N'olNafE9MnH', N'2023080001', N'avWI2F', 10)
INSERT [dbo].[InputItem] ([Sn], [Id], [InputId], [ItemId], [Amount]) VALUES (2004, N'4w8qatg1Qe', N'2023080001', N'A1XTN0', 15)
INSERT [dbo].[InputItem] ([Sn], [Id], [InputId], [ItemId], [Amount]) VALUES (2005, N'n4u6l9zwqr', N'2023080001', N'xf1fqW', 10)
INSERT [dbo].[InputItem] ([Sn], [Id], [InputId], [ItemId], [Amount]) VALUES (2006, N'hj1VSSfa2d', N'2023080002', N'2gRU9R', 50)
INSERT [dbo].[InputItem] ([Sn], [Id], [InputId], [ItemId], [Amount]) VALUES (2007, N'W6UDF1fci7', N'2023080002', N'JaIapY', 30)
INSERT [dbo].[InputItem] ([Sn], [Id], [InputId], [ItemId], [Amount]) VALUES (2008, N'tOfDySXGvu', N'2023080002', N'xf1fqW', 10)
INSERT [dbo].[InputItem] ([Sn], [Id], [InputId], [ItemId], [Amount]) VALUES (2009, N'ow89xnzx0c', N'2023080003', N'ahREw7', 10)
INSERT [dbo].[InputItem] ([Sn], [Id], [InputId], [ItemId], [Amount]) VALUES (2010, N'QaH0fyxn6h', N'2023080003', N'IEzOVK', 20)
INSERT [dbo].[InputItem] ([Sn], [Id], [InputId], [ItemId], [Amount]) VALUES (2011, N'RTdMBBFZj7', N'2023080003', N'c29TF7', 50)
INSERT [dbo].[InputItem] ([Sn], [Id], [InputId], [ItemId], [Amount]) VALUES (2012, N'EyeliUgww8', N'2023080004', N'BVKydO', 50)
INSERT [dbo].[InputItem] ([Sn], [Id], [InputId], [ItemId], [Amount]) VALUES (2013, N'G1O061ysWV', N'2023080004', N'ofD4kE', 30)
INSERT [dbo].[InputItem] ([Sn], [Id], [InputId], [ItemId], [Amount]) VALUES (2014, N'kkMjSrovoS', N'2023080004', N'pbolm0', 30)
INSERT [dbo].[InputItem] ([Sn], [Id], [InputId], [ItemId], [Amount]) VALUES (2015, N'8jAuByMUr5', N'2023080005', N'6nRXwQ', 50)
INSERT [dbo].[InputItem] ([Sn], [Id], [InputId], [ItemId], [Amount]) VALUES (2016, N'X4F37sZ1cA', N'2023080005', N'rVZvR7', 20)
INSERT [dbo].[InputItem] ([Sn], [Id], [InputId], [ItemId], [Amount]) VALUES (2017, N'41ozVMSgWu', N'2023080005', N'xf1fqW', 20)
INSERT [dbo].[InputItem] ([Sn], [Id], [InputId], [ItemId], [Amount]) VALUES (2018, N'V9i5FaIGcw', N'2023080006', N'xf1fqW', 30)
INSERT [dbo].[InputItem] ([Sn], [Id], [InputId], [ItemId], [Amount]) VALUES (2019, N'tCtbHPNTP2', N'2023080007', N'JaIapY', 80)
INSERT [dbo].[InputItem] ([Sn], [Id], [InputId], [ItemId], [Amount]) VALUES (2020, N'eq94F66kXa', N'2023080007', N'2gRU9R', 120)
INSERT [dbo].[InputItem] ([Sn], [Id], [InputId], [ItemId], [Amount]) VALUES (2021, N'uEBoND8JWf', N'2023080008', N'YBcurn', 85)
INSERT [dbo].[InputItem] ([Sn], [Id], [InputId], [ItemId], [Amount]) VALUES (2022, N'Ev93BhIRra', N'2023080009', N'rVZvR7', 20)
INSERT [dbo].[InputItem] ([Sn], [Id], [InputId], [ItemId], [Amount]) VALUES (2023, N'UcRjWeLBtL', N'2023080009', N'xf1fqW', 30)
SET IDENTITY_INSERT [dbo].[InputItem] OFF
GO
SET IDENTITY_INSERT [dbo].[Item] ON 

INSERT [dbo].[Item] ([Sn], [Id], [TypeId], [Name], [Unit], [CountAmount], [PriorAmount], [StockAmount], [StockWayAmount], [PlanAmount], [Sort], [Status], [Creator], [Created]) VALUES (1, N'TOLsoD', N'II6eSP', N'男短袖-S', N'件', CAST(1.0 AS Numeric(5, 1)), 0, 0, 0, 0, 4, 1, N'Alex', CAST(N'2023-02-02T18:19:24.000' AS DateTime))
INSERT [dbo].[Item] ([Sn], [Id], [TypeId], [Name], [Unit], [CountAmount], [PriorAmount], [StockAmount], [StockWayAmount], [PlanAmount], [Sort], [Status], [Creator], [Created]) VALUES (2, N'rVZvR7', N'5VKtfm', N'瓶裝水-1500 cc', N'瓶', CAST(1.5 AS Numeric(5, 1)), 0, 3, 10, 62, 2, 1, N'Alex', CAST(N'2023-02-02T21:46:19.000' AS DateTime))
INSERT [dbo].[Item] ([Sn], [Id], [TypeId], [Name], [Unit], [CountAmount], [PriorAmount], [StockAmount], [StockWayAmount], [PlanAmount], [Sort], [Status], [Creator], [Created]) VALUES (3, N'6nRXwQ', N'ZeOURx', N'免洗餐具', N'套', CAST(1.0 AS Numeric(5, 1)), 0, 35, 25, 0, 9, 1, N'Alex', CAST(N'2023-05-26T01:48:35.000' AS DateTime))
INSERT [dbo].[Item] ([Sn], [Id], [TypeId], [Name], [Unit], [CountAmount], [PriorAmount], [StockAmount], [StockWayAmount], [PlanAmount], [Sort], [Status], [Creator], [Created]) VALUES (4, N'FSVCuk', N'5VKtfm', N'瓶裝水-500 cc', N'瓶', CAST(0.5 AS Numeric(5, 1)), 0, 0, 30, 0, 1, 1, N'Alex', CAST(N'2023-05-26T01:50:59.000' AS DateTime))
INSERT [dbo].[Item] ([Sn], [Id], [TypeId], [Name], [Unit], [CountAmount], [PriorAmount], [StockAmount], [StockWayAmount], [PlanAmount], [Sort], [Status], [Creator], [Created]) VALUES (5, N'avWI2F', N'5VKtfm', N'瓶裝水-6000 cc', N'瓶', CAST(6.0 AS Numeric(5, 1)), 0, 10, 0, 0, 3, 1, N'Alex', CAST(N'2023-05-26T01:51:38.000' AS DateTime))
INSERT [dbo].[Item] ([Sn], [Id], [TypeId], [Name], [Unit], [CountAmount], [PriorAmount], [StockAmount], [StockWayAmount], [PlanAmount], [Sort], [Status], [Creator], [Created]) VALUES (6, N'ztrLVL', N'II6eSP', N'男短袖-L', N'件', CAST(1.0 AS Numeric(5, 1)), 0, 0, 0, 0, 6, 1, N'Alex', CAST(N'2023-05-26T01:53:27.000' AS DateTime))
INSERT [dbo].[Item] ([Sn], [Id], [TypeId], [Name], [Unit], [CountAmount], [PriorAmount], [StockAmount], [StockWayAmount], [PlanAmount], [Sort], [Status], [Creator], [Created]) VALUES (7, N'2gRU9R', N'II6eSP', N'男短袖-M', N'件', CAST(1.0 AS Numeric(5, 1)), 0, 20, 0, 88, 5, 1, N'Alex', CAST(N'2023-05-26T01:53:41.000' AS DateTime))
INSERT [dbo].[Item] ([Sn], [Id], [TypeId], [Name], [Unit], [CountAmount], [PriorAmount], [StockAmount], [StockWayAmount], [PlanAmount], [Sort], [Status], [Creator], [Created]) VALUES (8, N'hTLgQ2', N'II6eSP', N'女短袖-S', N'件', CAST(1.0 AS Numeric(5, 1)), 0, 0, 0, 0, 1, 1, N'Alex', CAST(N'2023-05-26T01:54:54.000' AS DateTime))
INSERT [dbo].[Item] ([Sn], [Id], [TypeId], [Name], [Unit], [CountAmount], [PriorAmount], [StockAmount], [StockWayAmount], [PlanAmount], [Sort], [Status], [Creator], [Created]) VALUES (9, N'UMOrOV', N'II6eSP', N'女短袖-L', N'件', CAST(1.0 AS Numeric(5, 1)), 0, 0, 0, 0, 3, 1, N'Alex', CAST(N'2023-05-26T01:55:09.000' AS DateTime))
INSERT [dbo].[Item] ([Sn], [Id], [TypeId], [Name], [Unit], [CountAmount], [PriorAmount], [StockAmount], [StockWayAmount], [PlanAmount], [Sort], [Status], [Creator], [Created]) VALUES (10, N'JaIapY', N'II6eSP', N'女短袖-M', N'件', CAST(1.0 AS Numeric(5, 1)), 0, 15, 0, 68, 2, 1, N'Alex', CAST(N'2023-05-26T01:55:24.000' AS DateTime))
INSERT [dbo].[Item] ([Sn], [Id], [TypeId], [Name], [Unit], [CountAmount], [PriorAmount], [StockAmount], [StockWayAmount], [PlanAmount], [Sort], [Status], [Creator], [Created]) VALUES (11, N'c29TF7', N'UtOJck', N'衛生紙', N'包', CAST(1.0 AS Numeric(5, 1)), 0, 33, 0, 0, 9, 1, N'Alex', CAST(N'2023-05-26T02:02:31.000' AS DateTime))
INSERT [dbo].[Item] ([Sn], [Id], [TypeId], [Name], [Unit], [CountAmount], [PriorAmount], [StockAmount], [StockWayAmount], [PlanAmount], [Sort], [Status], [Creator], [Created]) VALUES (12, N'ahREw7', N'mhscpJ', N'睡袋', N'件', CAST(1.0 AS Numeric(5, 1)), 0, 10, 0, 0, 9, 1, N'Alex', CAST(N'2023-05-26T02:04:30.000' AS DateTime))
INSERT [dbo].[Item] ([Sn], [Id], [TypeId], [Name], [Unit], [CountAmount], [PriorAmount], [StockAmount], [StockWayAmount], [PlanAmount], [Sort], [Status], [Creator], [Created]) VALUES (13, N'IEzOVK', N'mhscpJ', N'毛毯', N'件', CAST(1.0 AS Numeric(5, 1)), 0, 20, 0, 0, 9, 1, N'Alex', CAST(N'2023-05-26T02:04:45.000' AS DateTime))
INSERT [dbo].[Item] ([Sn], [Id], [TypeId], [Name], [Unit], [CountAmount], [PriorAmount], [StockAmount], [StockWayAmount], [PlanAmount], [Sort], [Status], [Creator], [Created]) VALUES (14, N'YBcurn', N'mhscpJ', N'棉被', N'件', CAST(1.0 AS Numeric(5, 1)), 0, 27, 0, 58, 9, 1, N'Alex', CAST(N'2023-05-26T02:05:19.000' AS DateTime))
INSERT [dbo].[Item] ([Sn], [Id], [TypeId], [Name], [Unit], [CountAmount], [PriorAmount], [StockAmount], [StockWayAmount], [PlanAmount], [Sort], [Status], [Creator], [Created]) VALUES (15, N'A1XTN0', N'0I6Xvv', N'白米-1公斤', N'包', CAST(1.0 AS Numeric(5, 1)), 0, 0, 0, 15, 1, 1, N'Alex', CAST(N'2023-05-26T23:22:48.000' AS DateTime))
INSERT [dbo].[Item] ([Sn], [Id], [TypeId], [Name], [Unit], [CountAmount], [PriorAmount], [StockAmount], [StockWayAmount], [PlanAmount], [Sort], [Status], [Creator], [Created]) VALUES (16, N'xf1fqW', N'0I6Xvv', N'白米-2公斤', N'包', CAST(2.0 AS Numeric(5, 1)), 0, 41, 5, 59, 2, 1, N'Alex', CAST(N'2023-05-26T23:23:09.000' AS DateTime))
INSERT [dbo].[Item] ([Sn], [Id], [TypeId], [Name], [Unit], [CountAmount], [PriorAmount], [StockAmount], [StockWayAmount], [PlanAmount], [Sort], [Status], [Creator], [Created]) VALUES (17, N'pbolm0', N'dWpXAo', N'手電筒', N'支', CAST(1.0 AS Numeric(5, 1)), 0, 30, 0, 0, 1, 1, N'2kDcWJR9JH', CAST(N'2023-08-02T19:34:41.000' AS DateTime))
INSERT [dbo].[Item] ([Sn], [Id], [TypeId], [Name], [Unit], [CountAmount], [PriorAmount], [StockAmount], [StockWayAmount], [PlanAmount], [Sort], [Status], [Creator], [Created]) VALUES (18, N'ofD4kE', N'sAB3q5', N'罐頭', N'盒', CAST(1.0 AS Numeric(5, 1)), 0, 30, 0, 0, 1, 1, N'oE2LLiJ9ie', CAST(N'2023-08-03T14:02:47.000' AS DateTime))
INSERT [dbo].[Item] ([Sn], [Id], [TypeId], [Name], [Unit], [CountAmount], [PriorAmount], [StockAmount], [StockWayAmount], [PlanAmount], [Sort], [Status], [Creator], [Created]) VALUES (19, N'BVKydO', N'sAB3q5', N'餅乾', N'盒', CAST(1.0 AS Numeric(5, 1)), 0, 25, 30, 0, 2, 1, N'oE2LLiJ9ie', CAST(N'2023-08-03T14:04:44.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Item] OFF
GO
SET IDENTITY_INSERT [dbo].[ItemType] ON 

INSERT [dbo].[ItemType] ([Sn], [Id], [Name], [CountName], [Sort], [Status], [Creator], [Created]) VALUES (1, N'0I6Xvv', N'食用米', N'公斤', 2, 1, N'Alex', CAST(N'2023-02-02T18:19:24.000' AS DateTime))
INSERT [dbo].[ItemType] ([Sn], [Id], [Name], [CountName], [Sort], [Status], [Creator], [Created]) VALUES (2, N'mhscpJ', N'睡眠用品', N'件', 5, 1, N'Alex', CAST(N'2023-02-02T18:19:24.000' AS DateTime))
INSERT [dbo].[ItemType] ([Sn], [Id], [Name], [CountName], [Sort], [Status], [Creator], [Created]) VALUES (3, N'II6eSP', N'衣物', N'件', 3, 1, N'Alex', CAST(N'2023-02-02T18:19:24.000' AS DateTime))
INSERT [dbo].[ItemType] ([Sn], [Id], [Name], [CountName], [Sort], [Status], [Creator], [Created]) VALUES (4, N'5VKtfm', N'飲用水', N'公升', 1, 1, N'Alex', CAST(N'2023-02-02T18:19:24.000' AS DateTime))
INSERT [dbo].[ItemType] ([Sn], [Id], [Name], [CountName], [Sort], [Status], [Creator], [Created]) VALUES (5, N'UtOJck', N'衛生用品', N'件/包', 8, 1, N'Alex', CAST(N'2023-05-26T01:42:23.000' AS DateTime))
INSERT [dbo].[ItemType] ([Sn], [Id], [Name], [CountName], [Sort], [Status], [Creator], [Created]) VALUES (6, N'08i6he', N'其他', N'件/包', 99, 1, N'Alex', CAST(N'2023-05-26T01:42:45.000' AS DateTime))
INSERT [dbo].[ItemType] ([Sn], [Id], [Name], [CountName], [Sort], [Status], [Creator], [Created]) VALUES (7, N'ZeOURx', N'飲食用具', N'件/包', 4, 1, N'Alex', CAST(N'2023-05-26T01:59:24.000' AS DateTime))
INSERT [dbo].[ItemType] ([Sn], [Id], [Name], [CountName], [Sort], [Status], [Creator], [Created]) VALUES (8, N'dWpXAo', N'照明用具', N'件/包', 9, 1, N'Alex', CAST(N'2023-05-26T02:07:45.000' AS DateTime))
INSERT [dbo].[ItemType] ([Sn], [Id], [Name], [CountName], [Sort], [Status], [Creator], [Created]) VALUES (9, N'sAB3q5', N'食物', N'件/包', 4, 1, N'oE2LLiJ9ie', CAST(N'2023-08-03T14:01:37.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[ItemType] OFF
GO
SET IDENTITY_INSERT [dbo].[Login] ON 

INSERT [dbo].[Login] ([Sn], [Account], [FailCount], [LoginStatus], [LoginTime]) VALUES (1, N'it', 0, 1, CAST(N'2024-02-19T23:21:45.463' AS DateTime))
INSERT [dbo].[Login] ([Sn], [Account], [FailCount], [LoginStatus], [LoginTime]) VALUES (2, N'aa', 0, 1, CAST(N'2025-04-27T19:23:15.503' AS DateTime))
SET IDENTITY_INSERT [dbo].[Login] OFF
GO
SET IDENTITY_INSERT [dbo].[Output] ON 

INSERT [dbo].[Output] ([Sn], [Id], [ActId], [Note], [Block], [PlanTime], [OutputStatus], [OutputTime], [CheckTime], [Checker], [TxUpTime], [TxHash], [TxLog], [Creator], [Created]) VALUES (10, N'2023080006', N'2023080003', NULL, NULL, CAST(N'2023-08-07T15:00:00.000' AS DateTime), 1, CAST(N'2024-01-01T14:03:14.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, N'2kDcWJR9JH', CAST(N'2023-08-09T13:59:45.000' AS DateTime))
INSERT [dbo].[Output] ([Sn], [Id], [ActId], [Note], [Block], [PlanTime], [OutputStatus], [OutputTime], [CheckTime], [Checker], [TxUpTime], [TxHash], [TxLog], [Creator], [Created]) VALUES (14, N'2023080007', N'2023080002', NULL, NULL, CAST(N'2023-08-06T10:00:00.000' AS DateTime), 1, CAST(N'2024-01-02T15:57:14.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, N'2kDcWJR9JH', CAST(N'2023-08-09T15:55:17.000' AS DateTime))
INSERT [dbo].[Output] ([Sn], [Id], [ActId], [Note], [Block], [PlanTime], [OutputStatus], [OutputTime], [CheckTime], [Checker], [TxUpTime], [TxHash], [TxLog], [Creator], [Created]) VALUES (15, N'2023080008', N'2023080001', NULL, NULL, CAST(N'2023-08-05T10:00:00.000' AS DateTime), 1, CAST(N'2024-01-03T16:55:41.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, N'2kDcWJR9JH', CAST(N'2023-08-09T16:52:06.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Output] OFF
GO
SET IDENTITY_INSERT [dbo].[OutputItem] ON 

INSERT [dbo].[OutputItem] ([Sn], [Id], [OutputId], [ItemId], [Amount]) VALUES (2002, N'DRO3ktOUnZ', N'2023080006', N'rVZvR7', 32)
INSERT [dbo].[OutputItem] ([Sn], [Id], [OutputId], [ItemId], [Amount]) VALUES (2003, N'wG5FgtpHfe', N'2023080006', N'xf1fqW', 28)
INSERT [dbo].[OutputItem] ([Sn], [Id], [OutputId], [ItemId], [Amount]) VALUES (2004, N'F2yCKAi4nR', N'2023080007', N'YBcurn', 22)
INSERT [dbo].[OutputItem] ([Sn], [Id], [OutputId], [ItemId], [Amount]) VALUES (2005, N'3gpK5jFono', N'2023080007', N'JaIapY', 26)
INSERT [dbo].[OutputItem] ([Sn], [Id], [OutputId], [ItemId], [Amount]) VALUES (2006, N'dNS3NpWCWa', N'2023080007', N'2gRU9R', 41)
INSERT [dbo].[OutputItem] ([Sn], [Id], [OutputId], [ItemId], [Amount]) VALUES (2007, N'IkVNmneMJQ', N'2023080008', N'rVZvR7', 30)
INSERT [dbo].[OutputItem] ([Sn], [Id], [OutputId], [ItemId], [Amount]) VALUES (2008, N'b7OPxuMePG', N'2023080008', N'A1XTN0', 15)
SET IDENTITY_INSERT [dbo].[OutputItem] OFF
GO
SET IDENTITY_INSERT [dbo].[Skill] ON 

INSERT [dbo].[Skill] ([Sn], [Id], [Name], [Creator], [Created]) VALUES (1, N'X4JB0A', N'電腦文書', N'Alex', CAST(N'2023-02-03T09:32:55.000' AS DateTime))
INSERT [dbo].[Skill] ([Sn], [Id], [Name], [Creator], [Created]) VALUES (2, N'GTeyyl', N'搬運', N'Alex', CAST(N'2023-02-03T09:33:50.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Skill] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Sn], [Id], [Name], [Account], [Pwd], [Phone], [Email], [PhotoFile], [IsLock], [Status], [Creator], [Created]) VALUES (2, N'Alex', N'Alex Wang', N'aa', N'QSS8CpM1wn8IbyS6IHpJEg', N'12345', NULL, N'', 0, 1, N'Alex', CAST(N'2023-02-03T12:00:26.000' AS DateTime))
INSERT [dbo].[User] ([Sn], [Id], [Name], [Account], [Pwd], [Phone], [Email], [PhotoFile], [IsLock], [Status], [Creator], [Created]) VALUES (10, N'oE2LLiJ9ie', N'IT 管理者', N'it', N'DRSbkOc5QpcwHJAZGud18A', N'123', N'', NULL, 0, 1, N'Alex', CAST(N'2023-06-18T22:03:44.000' AS DateTime))
INSERT [dbo].[User] ([Sn], [Id], [Name], [Account], [Pwd], [Phone], [Email], [PhotoFile], [IsLock], [Status], [Creator], [Created]) VALUES (11, N'rrleSoYVnC', N'Bruce Lee', N'bb', N'Ia0L2Da5DQj0z2QLTCmOfA', N'125', N'', NULL, 0, 1, N'Alex', CAST(N'2023-06-18T22:05:16.000' AS DateTime))
INSERT [dbo].[User] ([Sn], [Id], [Name], [Account], [Pwd], [Phone], [Email], [PhotoFile], [IsLock], [Status], [Creator], [Created]) VALUES (12, N'2kDcWJR9JH', N'主管1', N'm1', N'rnvibNqnQsoUgGjVrJDqyg', N'123', N'', NULL, 0, 1, N'Alex', CAST(N'2023-06-18T22:06:04.000' AS DateTime))
INSERT [dbo].[User] ([Sn], [Id], [Name], [Account], [Pwd], [Phone], [Email], [PhotoFile], [IsLock], [Status], [Creator], [Created]) VALUES (13, N'f9JoL57uoQ', N'主管2', N'm2', N'qvL4mZI3lwXayETAoqHUXw', N'123', N'', NULL, 0, 1, N'Alex', CAST(N'2023-06-18T22:06:16.000' AS DateTime))
INSERT [dbo].[User] ([Sn], [Id], [Name], [Account], [Pwd], [Phone], [Email], [PhotoFile], [IsLock], [Status], [Creator], [Created]) VALUES (14, N'V3h1vhjsQg', N'客服1', N'c1', N'qffpeWXWz3maUpECqXO4uQ', N'123', N'', NULL, 0, 1, N'Alex', CAST(N'2023-06-18T22:10:59.000' AS DateTime))
INSERT [dbo].[User] ([Sn], [Id], [Name], [Account], [Pwd], [Phone], [Email], [PhotoFile], [IsLock], [Status], [Creator], [Created]) VALUES (15, N'LZCNeVkWez', N'倉管1', N's1', N'jd-HgDm3B2fEpbz08MT2Xg', N'123', N'', NULL, 0, 1, N'Alex', CAST(N'2023-06-18T22:12:59.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[User] OFF
GO
SET IDENTITY_INSERT [dbo].[XpProg] ON 

INSERT [dbo].[XpProg] ([Sn], [Id], [Code], [Name], [Icon], [Url], [Sort], [AuthRow], [FunCreate], [FunRead], [FunUpdate], [FunDelete], [FunPrint], [FunExport], [FunView], [FunOther]) VALUES (1, N'ItemType', N'ItemType', N'物品類別維護-基本', NULL, N'/ItemType', 1, 0, 1, 1, 1, 1, 0, 0, 1, 0)
INSERT [dbo].[XpProg] ([Sn], [Id], [Code], [Name], [Icon], [Url], [Sort], [AuthRow], [FunCreate], [FunRead], [FunUpdate], [FunDelete], [FunPrint], [FunExport], [FunView], [FunOther]) VALUES (2, N'Item', N'Item', N'物品維護-基本', NULL, N'/Item', 2, 0, 1, 1, 1, 1, 0, 0, 1, 0)
INSERT [dbo].[XpProg] ([Sn], [Id], [Code], [Name], [Icon], [Url], [Sort], [AuthRow], [FunCreate], [FunRead], [FunUpdate], [FunDelete], [FunPrint], [FunExport], [FunView], [FunOther]) VALUES (1002, N'Skill', N'Skill', N'志工專長維護-基本', NULL, N'/Skill', 3, 0, 1, 1, 1, 1, 0, 0, 1, 0)
INSERT [dbo].[XpProg] ([Sn], [Id], [Code], [Name], [Icon], [Url], [Sort], [AuthRow], [FunCreate], [FunRead], [FunUpdate], [FunDelete], [FunPrint], [FunExport], [FunView], [FunOther]) VALUES (1003, N'Vol', N'Vol', N'志工管理-基本', NULL, N'/Vol', 4, 0, 1, 1, 1, 1, 0, 0, 1, 0)
INSERT [dbo].[XpProg] ([Sn], [Id], [Code], [Name], [Icon], [Url], [Sort], [AuthRow], [FunCreate], [FunRead], [FunUpdate], [FunDelete], [FunPrint], [FunExport], [FunView], [FunOther]) VALUES (1004, N'House', N'House', N'倉庫維護-基本', NULL, N'/House', 5, 0, 1, 1, 1, 1, 0, 0, 1, 0)
INSERT [dbo].[XpProg] ([Sn], [Id], [Code], [Name], [Icon], [Url], [Sort], [AuthRow], [FunCreate], [FunRead], [FunUpdate], [FunDelete], [FunPrint], [FunExport], [FunView], [FunOther]) VALUES (1005, N'Donor', N'Donor', N'捐贈人管理-捐贈', NULL, N'/Donor', 11, 1, 1, 1, 1, 1, 0, 0, 1, 0)
INSERT [dbo].[XpProg] ([Sn], [Id], [Code], [Name], [Icon], [Url], [Sort], [AuthRow], [FunCreate], [FunRead], [FunUpdate], [FunDelete], [FunPrint], [FunExport], [FunView], [FunOther]) VALUES (1006, N'Donate', N'Donate', N'捐贈單維護-捐贈', NULL, N'/Donate', 12, 1, 1, 1, 1, 1, 0, 0, 1, 0)
INSERT [dbo].[XpProg] ([Sn], [Id], [Code], [Name], [Icon], [Url], [Sort], [AuthRow], [FunCreate], [FunRead], [FunUpdate], [FunDelete], [FunPrint], [FunExport], [FunView], [FunOther]) VALUES (1010, N'DonateAdt', N'DonateAudit', N'捐贈單審核-捐贈', NULL, N'/DonateAudit', 13, 1, 1, 1, 1, 1, 0, 0, 1, 0)
INSERT [dbo].[XpProg] ([Sn], [Id], [Code], [Name], [Icon], [Url], [Sort], [AuthRow], [FunCreate], [FunRead], [FunUpdate], [FunDelete], [FunPrint], [FunExport], [FunView], [FunOther]) VALUES (1011, N'Act', N'Act', N'活動單維護-活動單', NULL, N'/Act', 21, 1, 1, 1, 1, 1, 0, 0, 1, 0)
INSERT [dbo].[XpProg] ([Sn], [Id], [Code], [Name], [Icon], [Url], [Sort], [AuthRow], [FunCreate], [FunRead], [FunUpdate], [FunDelete], [FunPrint], [FunExport], [FunView], [FunOther]) VALUES (1012, N'ActAudit', N'ActAudit', N'活動單審核-活動單', NULL, N'/ActAudit', 22, 1, 1, 1, 1, 1, 0, 0, 1, 0)
INSERT [dbo].[XpProg] ([Sn], [Id], [Code], [Name], [Icon], [Url], [Sort], [AuthRow], [FunCreate], [FunRead], [FunUpdate], [FunDelete], [FunPrint], [FunExport], [FunView], [FunOther]) VALUES (1013, N'Input', N'Input', N'入庫單維護-入庫', NULL, N'/Input', 31, 1, 1, 1, 1, 1, 0, 0, 1, 0)
INSERT [dbo].[XpProg] ([Sn], [Id], [Code], [Name], [Icon], [Url], [Sort], [AuthRow], [FunCreate], [FunRead], [FunUpdate], [FunDelete], [FunPrint], [FunExport], [FunView], [FunOther]) VALUES (1014, N'InputAudit', N'InputAudit', N'入庫單審核-入庫', NULL, N'/InputAudit', 32, 1, 1, 1, 1, 1, 0, 0, 1, 0)
INSERT [dbo].[XpProg] ([Sn], [Id], [Code], [Name], [Icon], [Url], [Sort], [AuthRow], [FunCreate], [FunRead], [FunUpdate], [FunDelete], [FunPrint], [FunExport], [FunView], [FunOther]) VALUES (1015, N'Output', N'Output', N'倉庫出貨-出貨', NULL, N'/Output', 41, 1, 1, 1, 1, 1, 0, 0, 1, 0)
INSERT [dbo].[XpProg] ([Sn], [Id], [Code], [Name], [Icon], [Url], [Sort], [AuthRow], [FunCreate], [FunRead], [FunUpdate], [FunDelete], [FunPrint], [FunExport], [FunView], [FunOther]) VALUES (1016, N'OutputChk', N'OutputCheck', N'出貨後確認-出貨', NULL, N'/OutputCheck', 42, 1, 1, 1, 1, 1, 0, 0, 1, 0)
INSERT [dbo].[XpProg] ([Sn], [Id], [Code], [Name], [Icon], [Url], [Sort], [AuthRow], [FunCreate], [FunRead], [FunUpdate], [FunDelete], [FunPrint], [FunExport], [FunView], [FunOther]) VALUES (1017, N'StockStat', N'StockStatus', N'設定盤點狀態-庫存', NULL, N'/StockStatus', 51, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[XpProg] ([Sn], [Id], [Code], [Name], [Icon], [Url], [Sort], [AuthRow], [FunCreate], [FunRead], [FunUpdate], [FunDelete], [FunPrint], [FunExport], [FunView], [FunOther]) VALUES (1018, N'Stock', N'Stock', N'盤點單維護-庫存', NULL, N'/Stock', 52, 1, 1, 1, 1, 1, 0, 0, 1, 0)
INSERT [dbo].[XpProg] ([Sn], [Id], [Code], [Name], [Icon], [Url], [Sort], [AuthRow], [FunCreate], [FunRead], [FunUpdate], [FunDelete], [FunPrint], [FunExport], [FunView], [FunOther]) VALUES (1019, N'RptItemAct', N'RptItemAct', N'物品需求統計-報表', NULL, N'/RptItemAct', 61, 0, 0, 1, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[XpProg] ([Sn], [Id], [Code], [Name], [Icon], [Url], [Sort], [AuthRow], [FunCreate], [FunRead], [FunUpdate], [FunDelete], [FunPrint], [FunExport], [FunView], [FunOther]) VALUES (1022, N'RptItemDon', N'RptItemDonate', N'物品捐贈統計-報表', NULL, N'/RptItemDonate', 62, 0, 0, 1, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[XpProg] ([Sn], [Id], [Code], [Name], [Icon], [Url], [Sort], [AuthRow], [FunCreate], [FunRead], [FunUpdate], [FunDelete], [FunPrint], [FunExport], [FunView], [FunOther]) VALUES (1023, N'User', N'User', N'用戶管理-系統', NULL, N'/User', 71, 0, 1, 1, 1, 1, 0, 0, 1, 0)
INSERT [dbo].[XpProg] ([Sn], [Id], [Code], [Name], [Icon], [Url], [Sort], [AuthRow], [FunCreate], [FunRead], [FunUpdate], [FunDelete], [FunPrint], [FunExport], [FunView], [FunOther]) VALUES (1024, N'XpRole', N'XpRole', N'角色維護-系統', NULL, N'/XpRole', 72, 0, 1, 1, 1, 1, 0, 0, 1, 0)
INSERT [dbo].[XpProg] ([Sn], [Id], [Code], [Name], [Icon], [Url], [Sort], [AuthRow], [FunCreate], [FunRead], [FunUpdate], [FunDelete], [FunPrint], [FunExport], [FunView], [FunOther]) VALUES (1025, N'XpProg', N'XpProg', N'系統功能維護-系統', NULL, N'/XpProg', 73, 0, 1, 1, 1, 1, 0, 0, 1, 0)
INSERT [dbo].[XpProg] ([Sn], [Id], [Code], [Name], [Icon], [Url], [Sort], [AuthRow], [FunCreate], [FunRead], [FunUpdate], [FunDelete], [FunPrint], [FunExport], [FunView], [FunOther]) VALUES (1026, N'SetPwd', N'SetPwd', N'設定密碼-系統', NULL, N'/SetPwd', 74, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[XpProg] ([Sn], [Id], [Code], [Name], [Icon], [Url], [Sort], [AuthRow], [FunCreate], [FunRead], [FunUpdate], [FunDelete], [FunPrint], [FunExport], [FunView], [FunOther]) VALUES (2002, N'Msg', N'Msg', N'民眾留言維護-捐贈', NULL, N'/Msg', 10, 1, 0, 1, 1, 0, 0, 0, 1, 0)
INSERT [dbo].[XpProg] ([Sn], [Id], [Code], [Name], [Icon], [Url], [Sort], [AuthRow], [FunCreate], [FunRead], [FunUpdate], [FunDelete], [FunPrint], [FunExport], [FunView], [FunOther]) VALUES (2003, N'GenSiteMap', N'GenSiteMap', N'產生SiteMap-系統', NULL, N'/GenSiteMap', 75, 0, 0, 0, 0, 0, 0, 0, 0, 0)
SET IDENTITY_INSERT [dbo].[XpProg] OFF
GO
SET IDENTITY_INSERT [dbo].[XpRole] ON 

INSERT [dbo].[XpRole] ([Sn], [Id], [Name], [Sort]) VALUES (1, N'IT', N'IT管理員', 9)
INSERT [dbo].[XpRole] ([Sn], [Id], [Name], [Sort]) VALUES (3, N'House', N'倉管員', 2)
INSERT [dbo].[XpRole] ([Sn], [Id], [Name], [Sort]) VALUES (4, N'Cust', N'客服', 1)
INSERT [dbo].[XpRole] ([Sn], [Id], [Name], [Sort]) VALUES (5, N'Mgr', N'主管', 4)
INSERT [dbo].[XpRole] ([Sn], [Id], [Name], [Sort]) VALUES (8, N'sx1ZBx', N'活動專員', 3)
SET IDENTITY_INSERT [dbo].[XpRole] OFF
GO
SET IDENTITY_INSERT [dbo].[XpRoleProg] ON 

INSERT [dbo].[XpRoleProg] ([Sn], [Id], [RoleId], [ProgId], [FunCreate], [FunRead], [FunUpdate], [FunDelete], [FunPrint], [FunExport], [FunView], [FunOther]) VALUES (1002, N'tLTZLiH8cQ', N'Cust', N'Donor', 1, 9, 1, 1, 0, 0, 9, 0)
INSERT [dbo].[XpRoleProg] ([Sn], [Id], [RoleId], [ProgId], [FunCreate], [FunRead], [FunUpdate], [FunDelete], [FunPrint], [FunExport], [FunView], [FunOther]) VALUES (2003, N'aTUX27cGU8', N'IT', N'User', 1, 9, 9, 9, 0, 0, 9, 0)
INSERT [dbo].[XpRoleProg] ([Sn], [Id], [RoleId], [ProgId], [FunCreate], [FunRead], [FunUpdate], [FunDelete], [FunPrint], [FunExport], [FunView], [FunOther]) VALUES (2004, N'GwRPpHydxe', N'IT', N'XpRole', 1, 9, 9, 9, 0, 0, 9, 0)
INSERT [dbo].[XpRoleProg] ([Sn], [Id], [RoleId], [ProgId], [FunCreate], [FunRead], [FunUpdate], [FunDelete], [FunPrint], [FunExport], [FunView], [FunOther]) VALUES (2005, N'i4UCqY2Y83', N'IT', N'XpProg', 0, 9, 9, 9, 0, 0, 9, 0)
INSERT [dbo].[XpRoleProg] ([Sn], [Id], [RoleId], [ProgId], [FunCreate], [FunRead], [FunUpdate], [FunDelete], [FunPrint], [FunExport], [FunView], [FunOther]) VALUES (2006, N'gz5nauQnEh', N'IT', N'SetPwd', 0, 9, 0, 0, 0, 0, 9, 0)
INSERT [dbo].[XpRoleProg] ([Sn], [Id], [RoleId], [ProgId], [FunCreate], [FunRead], [FunUpdate], [FunDelete], [FunPrint], [FunExport], [FunView], [FunOther]) VALUES (3002, N'DxNWGq8FEe', N'Cust', N'Donate', 1, 9, 1, 1, 0, 0, 9, 0)
INSERT [dbo].[XpRoleProg] ([Sn], [Id], [RoleId], [ProgId], [FunCreate], [FunRead], [FunUpdate], [FunDelete], [FunPrint], [FunExport], [FunView], [FunOther]) VALUES (3003, N'tELGpAkp7J', N'House', N'Output', 1, 9, 9, 9, 0, 0, 9, 0)
INSERT [dbo].[XpRoleProg] ([Sn], [Id], [RoleId], [ProgId], [FunCreate], [FunRead], [FunUpdate], [FunDelete], [FunPrint], [FunExport], [FunView], [FunOther]) VALUES (4002, N'1XhmMb174p', N'sx1ZBx', N'ItemType', 0, 9, 0, 0, 0, 0, 9, 0)
INSERT [dbo].[XpRoleProg] ([Sn], [Id], [RoleId], [ProgId], [FunCreate], [FunRead], [FunUpdate], [FunDelete], [FunPrint], [FunExport], [FunView], [FunOther]) VALUES (4003, N'fEv3w2mLLx', N'sx1ZBx', N'Item', 0, 9, 0, 0, 0, 0, 9, 0)
INSERT [dbo].[XpRoleProg] ([Sn], [Id], [RoleId], [ProgId], [FunCreate], [FunRead], [FunUpdate], [FunDelete], [FunPrint], [FunExport], [FunView], [FunOther]) VALUES (4004, N'SCrPt1hDH1', N'sx1ZBx', N'Skill', 1, 9, 1, 1, 0, 0, 9, 0)
INSERT [dbo].[XpRoleProg] ([Sn], [Id], [RoleId], [ProgId], [FunCreate], [FunRead], [FunUpdate], [FunDelete], [FunPrint], [FunExport], [FunView], [FunOther]) VALUES (4005, N'hn296p3bli', N'sx1ZBx', N'Vol', 1, 9, 1, 1, 0, 0, 9, 0)
INSERT [dbo].[XpRoleProg] ([Sn], [Id], [RoleId], [ProgId], [FunCreate], [FunRead], [FunUpdate], [FunDelete], [FunPrint], [FunExport], [FunView], [FunOther]) VALUES (4006, N'tzpO7g6C0r', N'sx1ZBx', N'House', 0, 9, 0, 0, 0, 0, 9, 0)
INSERT [dbo].[XpRoleProg] ([Sn], [Id], [RoleId], [ProgId], [FunCreate], [FunRead], [FunUpdate], [FunDelete], [FunPrint], [FunExport], [FunView], [FunOther]) VALUES (5002, N'7QVjZzdAAW', N'sx1ZBx', N'Act', 1, 9, 1, 1, 0, 0, 9, 0)
INSERT [dbo].[XpRoleProg] ([Sn], [Id], [RoleId], [ProgId], [FunCreate], [FunRead], [FunUpdate], [FunDelete], [FunPrint], [FunExport], [FunView], [FunOther]) VALUES (5003, N'YD1LucRuyl', N'sx1ZBx', N'Input', 1, 9, 1, 1, 0, 0, 9, 0)
INSERT [dbo].[XpRoleProg] ([Sn], [Id], [RoleId], [ProgId], [FunCreate], [FunRead], [FunUpdate], [FunDelete], [FunPrint], [FunExport], [FunView], [FunOther]) VALUES (5004, N'CFZhfBpa3Z', N'sx1ZBx', N'OutputChk', 1, 9, 1, 1, 0, 0, 9, 0)
INSERT [dbo].[XpRoleProg] ([Sn], [Id], [RoleId], [ProgId], [FunCreate], [FunRead], [FunUpdate], [FunDelete], [FunPrint], [FunExport], [FunView], [FunOther]) VALUES (5005, N'yuseLqjvoB', N'sx1ZBx', N'SetPwd', 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[XpRoleProg] ([Sn], [Id], [RoleId], [ProgId], [FunCreate], [FunRead], [FunUpdate], [FunDelete], [FunPrint], [FunExport], [FunView], [FunOther]) VALUES (5006, N'5aCVwxnBj6', N'Mgr', N'ItemType', 1, 9, 9, 9, 0, 0, 9, 0)
INSERT [dbo].[XpRoleProg] ([Sn], [Id], [RoleId], [ProgId], [FunCreate], [FunRead], [FunUpdate], [FunDelete], [FunPrint], [FunExport], [FunView], [FunOther]) VALUES (5007, N'fD72MBvzoZ', N'Mgr', N'Item', 1, 9, 9, 9, 0, 0, 9, 0)
INSERT [dbo].[XpRoleProg] ([Sn], [Id], [RoleId], [ProgId], [FunCreate], [FunRead], [FunUpdate], [FunDelete], [FunPrint], [FunExport], [FunView], [FunOther]) VALUES (5008, N'rjmjGvhx04', N'Mgr', N'Skill', 1, 9, 9, 9, 0, 0, 9, 0)
INSERT [dbo].[XpRoleProg] ([Sn], [Id], [RoleId], [ProgId], [FunCreate], [FunRead], [FunUpdate], [FunDelete], [FunPrint], [FunExport], [FunView], [FunOther]) VALUES (5009, N'YlJPTJ2M1k', N'Mgr', N'Vol', 1, 9, 9, 9, 0, 0, 9, 0)
INSERT [dbo].[XpRoleProg] ([Sn], [Id], [RoleId], [ProgId], [FunCreate], [FunRead], [FunUpdate], [FunDelete], [FunPrint], [FunExport], [FunView], [FunOther]) VALUES (5010, N'4DGJMScvL2', N'Mgr', N'House', 1, 9, 9, 9, 0, 0, 9, 0)
INSERT [dbo].[XpRoleProg] ([Sn], [Id], [RoleId], [ProgId], [FunCreate], [FunRead], [FunUpdate], [FunDelete], [FunPrint], [FunExport], [FunView], [FunOther]) VALUES (5011, N'N8a8dK0cq1', N'Mgr', N'Donor', 1, 9, 9, 9, 0, 0, 9, 0)
INSERT [dbo].[XpRoleProg] ([Sn], [Id], [RoleId], [ProgId], [FunCreate], [FunRead], [FunUpdate], [FunDelete], [FunPrint], [FunExport], [FunView], [FunOther]) VALUES (5012, N'Hx4g4PGbq9', N'Mgr', N'Donate', 1, 9, 9, 9, 0, 0, 9, 0)
INSERT [dbo].[XpRoleProg] ([Sn], [Id], [RoleId], [ProgId], [FunCreate], [FunRead], [FunUpdate], [FunDelete], [FunPrint], [FunExport], [FunView], [FunOther]) VALUES (5013, N'ZgsQ62Rrr0', N'Mgr', N'DonateAdt', 1, 9, 9, 9, 0, 0, 9, 0)
INSERT [dbo].[XpRoleProg] ([Sn], [Id], [RoleId], [ProgId], [FunCreate], [FunRead], [FunUpdate], [FunDelete], [FunPrint], [FunExport], [FunView], [FunOther]) VALUES (5014, N'HjeWN7NQLs', N'Mgr', N'Act', 1, 9, 9, 9, 0, 0, 9, 0)
INSERT [dbo].[XpRoleProg] ([Sn], [Id], [RoleId], [ProgId], [FunCreate], [FunRead], [FunUpdate], [FunDelete], [FunPrint], [FunExport], [FunView], [FunOther]) VALUES (5015, N'95iEe4k35D', N'Mgr', N'ActAudit', 1, 9, 9, 9, 0, 0, 9, 0)
INSERT [dbo].[XpRoleProg] ([Sn], [Id], [RoleId], [ProgId], [FunCreate], [FunRead], [FunUpdate], [FunDelete], [FunPrint], [FunExport], [FunView], [FunOther]) VALUES (5016, N'RC1JLCJ9Rd', N'Mgr', N'Input', 1, 9, 9, 9, 0, 0, 9, 0)
INSERT [dbo].[XpRoleProg] ([Sn], [Id], [RoleId], [ProgId], [FunCreate], [FunRead], [FunUpdate], [FunDelete], [FunPrint], [FunExport], [FunView], [FunOther]) VALUES (5017, N'Gc4cdj2HxU', N'Mgr', N'InputAudit', 1, 9, 9, 9, 0, 0, 9, 0)
INSERT [dbo].[XpRoleProg] ([Sn], [Id], [RoleId], [ProgId], [FunCreate], [FunRead], [FunUpdate], [FunDelete], [FunPrint], [FunExport], [FunView], [FunOther]) VALUES (5018, N'BlnxGaPO3S', N'Mgr', N'Output', 1, 9, 9, 9, 0, 0, 9, 0)
INSERT [dbo].[XpRoleProg] ([Sn], [Id], [RoleId], [ProgId], [FunCreate], [FunRead], [FunUpdate], [FunDelete], [FunPrint], [FunExport], [FunView], [FunOther]) VALUES (5019, N'EH9AlCiM8e', N'Mgr', N'OutputChk', 1, 9, 9, 9, 0, 0, 9, 0)
INSERT [dbo].[XpRoleProg] ([Sn], [Id], [RoleId], [ProgId], [FunCreate], [FunRead], [FunUpdate], [FunDelete], [FunPrint], [FunExport], [FunView], [FunOther]) VALUES (5020, N'h62M9Bkvwq', N'Mgr', N'StockStat', 1, 9, 9, 9, 0, 0, 9, 0)
INSERT [dbo].[XpRoleProg] ([Sn], [Id], [RoleId], [ProgId], [FunCreate], [FunRead], [FunUpdate], [FunDelete], [FunPrint], [FunExport], [FunView], [FunOther]) VALUES (5021, N'W3SvFcnGIq', N'Mgr', N'Stock', 1, 9, 9, 9, 0, 0, 9, 0)
INSERT [dbo].[XpRoleProg] ([Sn], [Id], [RoleId], [ProgId], [FunCreate], [FunRead], [FunUpdate], [FunDelete], [FunPrint], [FunExport], [FunView], [FunOther]) VALUES (5022, N'RbUVFBs46U', N'Mgr', N'SetPwd', 1, 9, 9, 9, 0, 0, 9, 0)
INSERT [dbo].[XpRoleProg] ([Sn], [Id], [RoleId], [ProgId], [FunCreate], [FunRead], [FunUpdate], [FunDelete], [FunPrint], [FunExport], [FunView], [FunOther]) VALUES (7002, N'njoxyS5zJE', N'Cust', N'Msg', 1, 9, 1, 0, 0, 0, 9, 0)
INSERT [dbo].[XpRoleProg] ([Sn], [Id], [RoleId], [ProgId], [FunCreate], [FunRead], [FunUpdate], [FunDelete], [FunPrint], [FunExport], [FunView], [FunOther]) VALUES (7003, N'f7In5zsesq', N'Mgr', N'Msg', 1, 9, 9, 0, 0, 0, 9, 0)
INSERT [dbo].[XpRoleProg] ([Sn], [Id], [RoleId], [ProgId], [FunCreate], [FunRead], [FunUpdate], [FunDelete], [FunPrint], [FunExport], [FunView], [FunOther]) VALUES (7004, N'oNSMldWqe2', N'IT', N'GenSiteMap', 0, 0, 0, 0, 0, 0, 0, 0)
SET IDENTITY_INSERT [dbo].[XpRoleProg] OFF
GO
SET IDENTITY_INSERT [dbo].[XpUserRole] ON 

INSERT [dbo].[XpUserRole] ([Sn], [Id], [UserId], [RoleId]) VALUES (3005, N'rJau9tkwot', N'f9JoL57uoQ', N'Mgr')
INSERT [dbo].[XpUserRole] ([Sn], [Id], [UserId], [RoleId]) VALUES (3008, N'VCGLHsl0oC', N'LZCNeVkWez', N'House')
INSERT [dbo].[XpUserRole] ([Sn], [Id], [UserId], [RoleId]) VALUES (3012, N'5beFGZEWvd', N'Alex', N'sx1ZBx')
INSERT [dbo].[XpUserRole] ([Sn], [Id], [UserId], [RoleId]) VALUES (3018, N'ZRm3bRZDGB', N'oE2LLiJ9ie', N'IT')
INSERT [dbo].[XpUserRole] ([Sn], [Id], [UserId], [RoleId]) VALUES (3024, N'Lh2VLTyNnP', N'2kDcWJR9JH', N'Mgr')
INSERT [dbo].[XpUserRole] ([Sn], [Id], [UserId], [RoleId]) VALUES (3027, N'gvG78ZfWUK', N'V3h1vhjsQg', N'Cust')
INSERT [dbo].[XpUserRole] ([Sn], [Id], [UserId], [RoleId]) VALUES (4002, N'dmHaxsdtBj', N'rrleSoYVnC', N'sx1ZBx')
INSERT [dbo].[XpUserRole] ([Sn], [Id], [UserId], [RoleId]) VALUES (5003, N'xBwvk460tT', N'oE2LLiJ9ie', N'Mgr')
SET IDENTITY_INSERT [dbo].[XpUserRole] OFF
GO
ALTER TABLE [dbo].[Act] ADD  CONSTRAINT [DF_Act_AuditStatus]  DEFAULT ('0') FOR [AuditStatus]
GO
ALTER TABLE [dbo].[Act] ADD  CONSTRAINT [DF_Act_OutStatus]  DEFAULT ((0)) FOR [TranStatus]
GO
ALTER TABLE [dbo].[Donate] ADD  CONSTRAINT [DF_Donate_AuditStatus]  DEFAULT ('0') FOR [AuditStatus]
GO
ALTER TABLE [dbo].[Donate] ADD  CONSTRAINT [DF_Donate_InputStatus]  DEFAULT ('N') FOR [InputStatus]
GO
ALTER TABLE [dbo].[DonateItem] ADD  CONSTRAINT [DF_DonateItem_InputAmount]  DEFAULT ((0)) FOR [InputAmount]
GO
ALTER TABLE [dbo].[Input] ADD  CONSTRAINT [DF_Input_AuditStatus]  DEFAULT ('0') FOR [AuditStatus]
GO
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_PriorAmount]  DEFAULT ((0)) FOR [PriorAmount]
GO
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_StockAmount]  DEFAULT ((0)) FOR [StockAmount]
GO
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_BookAmount]  DEFAULT ((0)) FOR [StockWayAmount]
GO
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_OutAmount]  DEFAULT ((0)) FOR [PlanAmount]
GO
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Login] ADD  CONSTRAINT [DF_Login_FailCount]  DEFAULT ((0)) FOR [FailCount]
GO
ALTER TABLE [dbo].[Msg] ADD  CONSTRAINT [DF_Ticket_Status]  DEFAULT ((0)) FOR [IsClose]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_IsLock]  DEFAULT ((0)) FOR [IsLock]
GO
ALTER TABLE [dbo].[XpProg] ADD  CONSTRAINT [DF_XpProg_AuthRow]  DEFAULT ((0)) FOR [AuthRow]
GO
ALTER TABLE [dbo].[XpProg] ADD  CONSTRAINT [DF_XpProg_FunCreate]  DEFAULT ((0)) FOR [FunCreate]
GO
ALTER TABLE [dbo].[XpProg] ADD  CONSTRAINT [DF_XpProg_FunRead]  DEFAULT ((0)) FOR [FunRead]
GO
ALTER TABLE [dbo].[XpProg] ADD  CONSTRAINT [DF_XpProg_FunUpdate]  DEFAULT ((0)) FOR [FunUpdate]
GO
ALTER TABLE [dbo].[XpProg] ADD  CONSTRAINT [DF_XpProg_FunDelete]  DEFAULT ((0)) FOR [FunDelete]
GO
ALTER TABLE [dbo].[XpProg] ADD  CONSTRAINT [DF_XpProg_FunPrint]  DEFAULT ((0)) FOR [FunPrint]
GO
ALTER TABLE [dbo].[XpProg] ADD  CONSTRAINT [DF_XpProg_FunExport]  DEFAULT ((0)) FOR [FunExport]
GO
ALTER TABLE [dbo].[XpProg] ADD  CONSTRAINT [DF_XpProg_FunView]  DEFAULT ((0)) FOR [FunView]
GO
ALTER TABLE [dbo].[XpProg] ADD  CONSTRAINT [DF_XpProg_FunOther]  DEFAULT ((0)) FOR [FunOther]
GO
ALTER TABLE [dbo].[XpRoleProg] ADD  CONSTRAINT [DF_XpRoleProg_FunCreate]  DEFAULT ((0)) FOR [FunCreate]
GO
ALTER TABLE [dbo].[XpRoleProg] ADD  CONSTRAINT [DF_XpRoleProg_FunRead]  DEFAULT ((0)) FOR [FunRead]
GO
ALTER TABLE [dbo].[XpRoleProg] ADD  CONSTRAINT [DF_XpRoleProg_FunUpdate]  DEFAULT ((0)) FOR [FunUpdate]
GO
ALTER TABLE [dbo].[XpRoleProg] ADD  CONSTRAINT [DF_XpRoleProg_FunDelete]  DEFAULT ((0)) FOR [FunDelete]
GO
ALTER TABLE [dbo].[XpRoleProg] ADD  CONSTRAINT [DF_XpRoleProg_FunPrint]  DEFAULT ((0)) FOR [FunPrint]
GO
ALTER TABLE [dbo].[XpRoleProg] ADD  CONSTRAINT [DF_XpRoleProg_FunExport]  DEFAULT ((0)) FOR [FunExport]
GO
ALTER TABLE [dbo].[XpRoleProg] ADD  CONSTRAINT [DF_XpRoleProg_FunView]  DEFAULT ((0)) FOR [FunView]
GO
ALTER TABLE [dbo].[XpRoleProg] ADD  CONSTRAINT [DF_XpRoleProg_FunOther]  DEFAULT ((0)) FOR [FunOther]
GO
ALTER TABLE [dbo].[Act]  WITH CHECK ADD  CONSTRAINT [FK_Act_User] FOREIGN KEY([Creator])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Act] CHECK CONSTRAINT [FK_Act_User]
GO
ALTER TABLE [dbo].[ActItem]  WITH CHECK ADD  CONSTRAINT [FK_ActItem_Act] FOREIGN KEY([ActId])
REFERENCES [dbo].[Act] ([Id])
GO
ALTER TABLE [dbo].[ActItem] CHECK CONSTRAINT [FK_ActItem_Act]
GO
ALTER TABLE [dbo].[ActItem]  WITH CHECK ADD  CONSTRAINT [FK_ActItem_Item] FOREIGN KEY([ItemId])
REFERENCES [dbo].[Item] ([Id])
GO
ALTER TABLE [dbo].[ActItem] CHECK CONSTRAINT [FK_ActItem_Item]
GO
ALTER TABLE [dbo].[Donate]  WITH CHECK ADD  CONSTRAINT [FK_Donate_Donor] FOREIGN KEY([DonorId])
REFERENCES [dbo].[Donor] ([Id])
GO
ALTER TABLE [dbo].[Donate] CHECK CONSTRAINT [FK_Donate_Donor]
GO
ALTER TABLE [dbo].[Donate]  WITH CHECK ADD  CONSTRAINT [FK_Donate_User] FOREIGN KEY([Creator])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Donate] CHECK CONSTRAINT [FK_Donate_User]
GO
ALTER TABLE [dbo].[DonateItem]  WITH CHECK ADD  CONSTRAINT [FK_DonateItem_Donate] FOREIGN KEY([DonateId])
REFERENCES [dbo].[Donate] ([Id])
GO
ALTER TABLE [dbo].[DonateItem] CHECK CONSTRAINT [FK_DonateItem_Donate]
GO
ALTER TABLE [dbo].[DonateItem]  WITH CHECK ADD  CONSTRAINT [FK_DonateItem_Item] FOREIGN KEY([ItemId])
REFERENCES [dbo].[Item] ([Id])
GO
ALTER TABLE [dbo].[DonateItem] CHECK CONSTRAINT [FK_DonateItem_Item]
GO
ALTER TABLE [dbo].[Donor]  WITH CHECK ADD  CONSTRAINT [FK_Donor_User] FOREIGN KEY([Creator])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Donor] CHECK CONSTRAINT [FK_Donor_User]
GO
ALTER TABLE [dbo].[DonorTalk]  WITH CHECK ADD  CONSTRAINT [FK_DonorTalk_Donor] FOREIGN KEY([DonorId])
REFERENCES [dbo].[Donor] ([Id])
GO
ALTER TABLE [dbo].[DonorTalk] CHECK CONSTRAINT [FK_DonorTalk_Donor]
GO
ALTER TABLE [dbo].[DonorTalk]  WITH CHECK ADD  CONSTRAINT [FK_DonorTalk_User] FOREIGN KEY([Creator])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[DonorTalk] CHECK CONSTRAINT [FK_DonorTalk_User]
GO
ALTER TABLE [dbo].[House]  WITH CHECK ADD  CONSTRAINT [FK_House_User] FOREIGN KEY([Creator])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[House] CHECK CONSTRAINT [FK_House_User]
GO
ALTER TABLE [dbo].[Input]  WITH CHECK ADD  CONSTRAINT [FK_Input_Donate] FOREIGN KEY([DonateId])
REFERENCES [dbo].[Donate] ([Id])
GO
ALTER TABLE [dbo].[Input] CHECK CONSTRAINT [FK_Input_Donate]
GO
ALTER TABLE [dbo].[Input]  WITH CHECK ADD  CONSTRAINT [FK_Input_User] FOREIGN KEY([Creator])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Input] CHECK CONSTRAINT [FK_Input_User]
GO
ALTER TABLE [dbo].[InputItem]  WITH CHECK ADD  CONSTRAINT [FK_InputItem_Input] FOREIGN KEY([InputId])
REFERENCES [dbo].[Input] ([Id])
GO
ALTER TABLE [dbo].[InputItem] CHECK CONSTRAINT [FK_InputItem_Input]
GO
ALTER TABLE [dbo].[InputItem]  WITH CHECK ADD  CONSTRAINT [FK_InputItem_Item] FOREIGN KEY([ItemId])
REFERENCES [dbo].[Item] ([Id])
GO
ALTER TABLE [dbo].[InputItem] CHECK CONSTRAINT [FK_InputItem_Item]
GO
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_Item_ItemType] FOREIGN KEY([TypeId])
REFERENCES [dbo].[ItemType] ([Id])
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK_Item_ItemType]
GO
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_Item_User] FOREIGN KEY([Creator])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK_Item_User]
GO
ALTER TABLE [dbo].[ItemType]  WITH CHECK ADD  CONSTRAINT [FK_ItemType_User] FOREIGN KEY([Creator])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[ItemType] CHECK CONSTRAINT [FK_ItemType_User]
GO
ALTER TABLE [dbo].[Output]  WITH CHECK ADD  CONSTRAINT [FK_Output_Act] FOREIGN KEY([ActId])
REFERENCES [dbo].[Act] ([Id])
GO
ALTER TABLE [dbo].[Output] CHECK CONSTRAINT [FK_Output_Act]
GO
ALTER TABLE [dbo].[Output]  WITH CHECK ADD  CONSTRAINT [FK_Output_User] FOREIGN KEY([Creator])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Output] CHECK CONSTRAINT [FK_Output_User]
GO
ALTER TABLE [dbo].[OutputItem]  WITH CHECK ADD  CONSTRAINT [FK_OutputItem_Item] FOREIGN KEY([ItemId])
REFERENCES [dbo].[Item] ([Id])
GO
ALTER TABLE [dbo].[OutputItem] CHECK CONSTRAINT [FK_OutputItem_Item]
GO
ALTER TABLE [dbo].[OutputItem]  WITH CHECK ADD  CONSTRAINT [FK_OutputItem_Output] FOREIGN KEY([OutputId])
REFERENCES [dbo].[Output] ([Id])
GO
ALTER TABLE [dbo].[OutputItem] CHECK CONSTRAINT [FK_OutputItem_Output]
GO
ALTER TABLE [dbo].[StockItem]  WITH CHECK ADD  CONSTRAINT [FK_StockItem_Item] FOREIGN KEY([ItemId])
REFERENCES [dbo].[Item] ([Id])
GO
ALTER TABLE [dbo].[StockItem] CHECK CONSTRAINT [FK_StockItem_Item]
GO
ALTER TABLE [dbo].[StockItem]  WITH CHECK ADD  CONSTRAINT [FK_StockItem_Stock] FOREIGN KEY([StockId])
REFERENCES [dbo].[Stock] ([Id])
GO
ALTER TABLE [dbo].[StockItem] CHECK CONSTRAINT [FK_StockItem_Stock]
GO
ALTER TABLE [dbo].[VolAct]  WITH CHECK ADD  CONSTRAINT [FK_VolAct_Act] FOREIGN KEY([ActId])
REFERENCES [dbo].[Act] ([Id])
GO
ALTER TABLE [dbo].[VolAct] CHECK CONSTRAINT [FK_VolAct_Act]
GO
ALTER TABLE [dbo].[VolAct]  WITH CHECK ADD  CONSTRAINT [FK_VolAct_Vol] FOREIGN KEY([VolId])
REFERENCES [dbo].[Vol] ([Id])
GO
ALTER TABLE [dbo].[VolAct] CHECK CONSTRAINT [FK_VolAct_Vol]
GO
ALTER TABLE [dbo].[VolSkill]  WITH CHECK ADD  CONSTRAINT [FK_VolSkill_Skill] FOREIGN KEY([SkillId])
REFERENCES [dbo].[Skill] ([Id])
GO
ALTER TABLE [dbo].[VolSkill] CHECK CONSTRAINT [FK_VolSkill_Skill]
GO
ALTER TABLE [dbo].[VolSkill]  WITH CHECK ADD  CONSTRAINT [FK_VolSkill_Vol] FOREIGN KEY([VolId])
REFERENCES [dbo].[Vol] ([Id])
GO
ALTER TABLE [dbo].[VolSkill] CHECK CONSTRAINT [FK_VolSkill_Vol]
GO
ALTER TABLE [dbo].[XpProg]  WITH CHECK ADD  CONSTRAINT [FK_XpProg_XpProg] FOREIGN KEY([Sn])
REFERENCES [dbo].[XpProg] ([Sn])
GO
ALTER TABLE [dbo].[XpProg] CHECK CONSTRAINT [FK_XpProg_XpProg]
GO
ALTER TABLE [dbo].[XpRoleProg]  WITH CHECK ADD  CONSTRAINT [FK_XpRoleProg_XpProg] FOREIGN KEY([ProgId])
REFERENCES [dbo].[XpProg] ([Id])
GO
ALTER TABLE [dbo].[XpRoleProg] CHECK CONSTRAINT [FK_XpRoleProg_XpProg]
GO
ALTER TABLE [dbo].[XpRoleProg]  WITH CHECK ADD  CONSTRAINT [FK_XpRoleProg_XpRole] FOREIGN KEY([RoleId])
REFERENCES [dbo].[XpRole] ([Id])
GO
ALTER TABLE [dbo].[XpRoleProg] CHECK CONSTRAINT [FK_XpRoleProg_XpRole]
GO
ALTER TABLE [dbo].[XpUserRole]  WITH CHECK ADD  CONSTRAINT [FK_XpUserRole_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[XpUserRole] CHECK CONSTRAINT [FK_XpUserRole_User]
GO
ALTER TABLE [dbo].[XpUserRole]  WITH CHECK ADD  CONSTRAINT [FK_XpUserRole_XpRole] FOREIGN KEY([RoleId])
REFERENCES [dbo].[XpRole] ([Id])
GO
ALTER TABLE [dbo].[XpUserRole] CHECK CONSTRAINT [FK_XpUserRole_XpRole]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'資料內容為活動單號, YYYYMM+4碼流水號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Act', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0(不必審核)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Act', @level2type=N'COLUMN',@level2name=N'AuditStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否轉出庫單' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Act', @level2type=N'COLUMN',@level2name=N'TranStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'轉出庫單日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Act', @level2type=N'COLUMN',@level2name=N'TranTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'捐贈說明' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Donate', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'預計到貨日' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Donate', @level2type=N'COLUMN',@level2name=N'PlanDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'入庫狀態 Y(已入庫) N(未入庫) P(部分入庫)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Donate', @level2type=N'COLUMN',@level2name=N'InputStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0(不必審核)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DonorTalk', @level2type=N'COLUMN',@level2name=N'AuditStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'資料內容為活動單號, YYYYMM+4碼流水號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Input', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0(不必審核)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Input', @level2type=N'COLUMN',@level2name=N'AuditStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'上鏈時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Input', @level2type=N'COLUMN',@level2name=N'TxUpTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'交易Hash' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Input', @level2type=N'COLUMN',@level2name=N'TxHash'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'交易Log' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Input', @level2type=N'COLUMN',@level2name=N'TxLog'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'前期餘額' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Item', @level2type=N'COLUMN',@level2name=N'PriorAmount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'庫存數量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Item', @level2type=N'COLUMN',@level2name=N'StockAmount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'在途庫存(未沖銷only)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Item', @level2type=N'COLUMN',@level2name=N'StockWayAmount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'潛在出貨保留' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Item', @level2type=N'COLUMN',@level2name=N'PlanAmount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'資料內容為活動單號, YYYYMM+4碼流水號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Output', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'上鏈時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Output', @level2type=N'COLUMN',@level2name=N'TxUpTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'交易Hash' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Output', @level2type=N'COLUMN',@level2name=N'TxHash'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'交易Log' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Output', @level2type=N'COLUMN',@level2name=N'TxLog'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'資料內容為活動單號, YYYYMM+4碼流水號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock', @level2type=N'COLUMN',@level2name=N'Id'
GO
