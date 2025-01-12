/****** Object:  Table [dbo].[Act]    Script Date: 2023/8/2 下午 10:51:47 ******/
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
/****** Object:  Table [dbo].[ActItem]    Script Date: 2023/8/2 下午 10:51:47 ******/
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
/****** Object:  Table [dbo].[Config]    Script Date: 2023/8/2 下午 10:51:47 ******/
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
/****** Object:  Table [dbo].[Donate]    Script Date: 2023/8/2 下午 10:51:47 ******/
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
/****** Object:  Table [dbo].[DonateItem]    Script Date: 2023/8/2 下午 10:51:47 ******/
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
/****** Object:  Table [dbo].[Donor]    Script Date: 2023/8/2 下午 10:51:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Donor](
	[Sn] [int] IDENTITY(1,1) NOT NULL,
	[Id] [varchar](10) NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[ShowName] [nvarchar](20) NOT NULL,
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
/****** Object:  Table [dbo].[DonorTalk]    Script Date: 2023/8/2 下午 10:51:47 ******/
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
/****** Object:  Table [dbo].[House]    Script Date: 2023/8/2 下午 10:51:47 ******/
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
/****** Object:  Table [dbo].[Input]    Script Date: 2023/8/2 下午 10:51:47 ******/
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
/****** Object:  Table [dbo].[InputItem]    Script Date: 2023/8/2 下午 10:51:47 ******/
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
/****** Object:  Table [dbo].[Item]    Script Date: 2023/8/2 下午 10:51:47 ******/
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
/****** Object:  Table [dbo].[ItemType]    Script Date: 2023/8/2 下午 10:51:47 ******/
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
/****** Object:  Table [dbo].[Msg]    Script Date: 2023/8/2 下午 10:51:47 ******/
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
/****** Object:  Table [dbo].[Output]    Script Date: 2023/8/2 下午 10:51:48 ******/
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
/****** Object:  Table [dbo].[OutputItem]    Script Date: 2023/8/2 下午 10:51:48 ******/
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
/****** Object:  Table [dbo].[Skill]    Script Date: 2023/8/2 下午 10:51:48 ******/
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
/****** Object:  Table [dbo].[Stock]    Script Date: 2023/8/2 下午 10:51:48 ******/
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
/****** Object:  Table [dbo].[StockItem]    Script Date: 2023/8/2 下午 10:51:48 ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 2023/8/2 下午 10:51:48 ******/
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
	[Status] [bit] NOT NULL,
	[Creator] [varchar](10) NOT NULL,
	[Created] [datetime] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Sn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vol]    Script Date: 2023/8/2 下午 10:51:48 ******/
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
/****** Object:  Table [dbo].[VolAct]    Script Date: 2023/8/2 下午 10:51:48 ******/
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
/****** Object:  Table [dbo].[VolSkill]    Script Date: 2023/8/2 下午 10:51:48 ******/
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
/****** Object:  Table [dbo].[XpProg]    Script Date: 2023/8/2 下午 10:51:48 ******/
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
/****** Object:  Table [dbo].[XpRole]    Script Date: 2023/8/2 下午 10:51:48 ******/
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
/****** Object:  Table [dbo].[XpRoleProg]    Script Date: 2023/8/2 下午 10:51:48 ******/
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
/****** Object:  Table [dbo].[XpUserRole]    Script Date: 2023/8/2 下午 10:51:48 ******/
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

INSERT [dbo].[Act] ([Sn], [Id], [Name], [Note], [StartDate], [EndDate], [ImageFile], [PlanTime], [SendTime], [AuditStatus], [AuditNote], [AuditTime], [Auditor], [TranStatus], [TranTime], [Creator], [Created]) VALUES (1, N'2023030001', N'3/20 中午共餐', N'邀請65歲以上長者共餐', CAST(N'2023-03-01T00:00:00' AS SmallDateTime), CAST(N'2023-04-01T00:00:00' AS SmallDateTime), N'eat together.jpg', CAST(N'2023-03-20T10:00:00.000' AS DateTime), CAST(N'2023-03-25T19:23:00.000' AS DateTime), N'Y', N'test2', CAST(N'2023-03-23T23:28:46.000' AS DateTime), NULL, 1, CAST(N'2023-03-25T23:38:09.000' AS DateTime), N'Alex', CAST(N'2023-02-07T01:11:26.000' AS DateTime))
INSERT [dbo].[Act] ([Sn], [Id], [Name], [Note], [StartDate], [EndDate], [ImageFile], [PlanTime], [SendTime], [AuditStatus], [AuditNote], [AuditTime], [Auditor], [TranStatus], [TranTime], [Creator], [Created]) VALUES (2, N'2023030002', N'童衣需求調查', N'test', CAST(N'2023-03-01T00:00:00' AS SmallDateTime), CAST(N'2023-04-01T00:00:00' AS SmallDateTime), NULL, CAST(N'2023-03-01T09:00:00.000' AS DateTime), CAST(N'2023-03-21T11:48:57.000' AS DateTime), N'Y', NULL, NULL, NULL, 0, NULL, N'Alex', CAST(N'2023-03-11T11:48:57.000' AS DateTime))
INSERT [dbo].[Act] ([Sn], [Id], [Name], [Note], [StartDate], [EndDate], [ImageFile], [PlanTime], [SendTime], [AuditStatus], [AuditNote], [AuditTime], [Auditor], [TranStatus], [TranTime], [Creator], [Created]) VALUES (18, N'2023030003', N'3/30 晚上共餐', N'test', CAST(N'2023-03-02T00:00:00' AS SmallDateTime), CAST(N'2023-04-02T00:00:00' AS SmallDateTime), N'FileName_2E67010C.jpg', CAST(N'2023-03-30T13:00:00.000' AS DateTime), CAST(N'2023-07-23T22:07:23.000' AS DateTime), N'1', N'test2', NULL, NULL, 0, NULL, N'Alex', CAST(N'2023-03-25T18:50:55.000' AS DateTime))
INSERT [dbo].[Act] ([Sn], [Id], [Name], [Note], [StartDate], [EndDate], [ImageFile], [PlanTime], [SendTime], [AuditStatus], [AuditNote], [AuditTime], [Auditor], [TranStatus], [TranTime], [Creator], [Created]) VALUES (19, N'2023070001', N'環境清潔整理', N'環境清潔整理', CAST(N'2023-07-21T00:00:00' AS SmallDateTime), CAST(N'2023-07-31T00:00:00' AS SmallDateTime), N'FileName_86AAA8AC.jpg', CAST(N'2023-07-21T10:00:00.000' AS DateTime), CAST(N'2023-07-23T22:07:39.000' AS DateTime), N'1', NULL, NULL, NULL, 0, NULL, N'Alex', CAST(N'2023-07-23T22:06:42.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Act] OFF
GO
SET IDENTITY_INSERT [dbo].[ActItem] ON 

INSERT [dbo].[ActItem] ([Sn], [Id], [ActId], [ItemId], [Amount]) VALUES (2, N'ESzLGcrwW0', N'2023030001', N'rVZvR7', 20)
INSERT [dbo].[ActItem] ([Sn], [Id], [ActId], [ItemId], [Amount]) VALUES (3, N'amK57eNrX5', N'2023030002', N'TOLsoD', 20)
INSERT [dbo].[ActItem] ([Sn], [Id], [ActId], [ItemId], [Amount]) VALUES (1002, N'j3Hgzbo9gA', N'2023030003', N'rVZvR7', 10)
INSERT [dbo].[ActItem] ([Sn], [Id], [ActId], [ItemId], [Amount]) VALUES (1003, N'WvKhf08OlW', N'2023070001', N'FSVCuk', 10)
INSERT [dbo].[ActItem] ([Sn], [Id], [ActId], [ItemId], [Amount]) VALUES (1004, N'9ecygv61c4', N'2023070001', N'A1XTN0', 5)
SET IDENTITY_INSERT [dbo].[ActItem] OFF
GO
INSERT [dbo].[Config] ([ApName], [StockStatus]) VALUES (N'Earth救助系統 ', 0)
GO
INSERT [dbo].[Donate] ([Id], [Title], [DonorId], [PlanDate], [SendTime], [AuditStatus], [AuditNote], [AuditTime], [InputStatus], [Creator], [Created]) VALUES (N'2023020001', N'小瓶飲用水', N'123', CAST(N'2023-02-17T00:00:00' AS SmallDateTime), CAST(N'2023-02-28T14:02:48.000' AS DateTime), N'Y', NULL, CAST(N'2023-05-26T23:26:54.000' AS DateTime), N'P', N'Alex', CAST(N'2023-02-18T14:02:48.000' AS DateTime))
INSERT [dbo].[Donate] ([Id], [Title], [DonorId], [PlanDate], [SendTime], [AuditStatus], [AuditNote], [AuditTime], [InputStatus], [Creator], [Created]) VALUES (N'2023020002', N'小號女裝', N'234', CAST(N'2023-03-31T00:00:00' AS SmallDateTime), CAST(N'2023-05-26T23:25:55.000' AS DateTime), N'Y', NULL, CAST(N'2023-05-26T23:27:03.000' AS DateTime), N'N', N'Alex', CAST(N'2023-02-19T00:40:03.000' AS DateTime))
INSERT [dbo].[Donate] ([Id], [Title], [DonorId], [PlanDate], [SendTime], [AuditStatus], [AuditNote], [AuditTime], [InputStatus], [Creator], [Created]) VALUES (N'2023020003', N'白米', N'BU3vc1YMbI', CAST(N'2023-03-31T00:00:00' AS SmallDateTime), NULL, N'0', NULL, NULL, N'N', N'Alex', CAST(N'2023-02-28T14:02:48.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[DonateItem] ON 

INSERT [dbo].[DonateItem] ([Sn], [Id], [DonateId], [ItemId], [Amount], [InputAmount]) VALUES (1, N'wOvmBgIxxS', N'2023020001', N'rVZvR7', 15, 50)
INSERT [dbo].[DonateItem] ([Sn], [Id], [DonateId], [ItemId], [Amount], [InputAmount]) VALUES (2, N'WDVooqu8Ot', N'2023020002', N'hTLgQ2', 20, 0)
INSERT [dbo].[DonateItem] ([Sn], [Id], [DonateId], [ItemId], [Amount], [InputAmount]) VALUES (1002, N'4Uz7cvxFWr', N'2023020003', N'A1XTN0', 20, 0)
SET IDENTITY_INSERT [dbo].[DonateItem] OFF
GO
SET IDENTITY_INSERT [dbo].[Donor] ON 

INSERT [dbo].[Donor] ([Sn], [Id], [Name], [ShowName], [Email], [Phone], [Creator], [Created]) VALUES (1, N'BU3vc1YMbI', N'王先生', N'王先生', N'a3@bb.cc', N'1235', N'Alex', CAST(N'2023-02-05T18:29:54.000' AS DateTime))
INSERT [dbo].[Donor] ([Sn], [Id], [Name], [ShowName], [Email], [Phone], [Creator], [Created]) VALUES (3, N'123', N'陳先生', N'陳先生', N'a1@bb.cc', N'1234', N'Alex', CAST(N'2023-02-20T12:00:00.000' AS DateTime))
INSERT [dbo].[Donor] ([Sn], [Id], [Name], [ShowName], [Email], [Phone], [Creator], [Created]) VALUES (1002, N'234', N'李小姐', N'李小姐', N'a2@bb.cc', N'1236', N'Alex', CAST(N'2323-02-03T12:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Donor] OFF
GO
SET IDENTITY_INSERT [dbo].[DonorTalk] ON 

INSERT [dbo].[DonorTalk] ([Sn], [Id], [DonorId], [Result], [Note], [SendTime], [AuditStatus], [AuditNote], [AuditTime], [Creator], [Created]) VALUES (4, N'IkQqYoUZ8OsdZKj4', N'BU3vc1YMbI', N'討論捐飲水數量', N'test', CAST(N'2023-02-06T13:36:45.000' AS DateTime), N'1', N'test', NULL, N'Alex', CAST(N'2023-02-06T13:36:45.000' AS DateTime))
INSERT [dbo].[DonorTalk] ([Sn], [Id], [DonorId], [Result], [Note], [SendTime], [AuditStatus], [AuditNote], [AuditTime], [Creator], [Created]) VALUES (5, N'hWjLVKYbDb0hOjZn', N'BU3vc1YMbI', N'詢問志工事項', N'test2', NULL, N'0', NULL, NULL, N'Alex', CAST(N'2023-02-06T16:26:10.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[DonorTalk] OFF
GO
SET IDENTITY_INSERT [dbo].[House] ON 

INSERT [dbo].[House] ([Sn], [Id], [Name], [Creator], [Created]) VALUES (1, N'76AR4y', N'倉庫1', N'Alex', CAST(N'2023-02-05T01:07:48.000' AS DateTime))
INSERT [dbo].[House] ([Sn], [Id], [Name], [Creator], [Created]) VALUES (2, N'PEImNE', N'倉庫2', N'Alex', CAST(N'2023-02-05T01:08:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[House] OFF
GO
SET IDENTITY_INSERT [dbo].[Input] ON 

INSERT [dbo].[Input] ([Sn], [Id], [DonateId], [Note], [SendTime], [AuditStatus], [AuditNote], [AuditTime], [TxUpTime], [TxHash], [TxLog], [Creator], [Created]) VALUES (3, N'2023030001', N'2023020001', N'test', CAST(N'2023-05-27T12:20:39.000' AS DateTime), N'Y', NULL, CAST(N'2023-05-27T14:04:02.000' AS DateTime), CAST(N'2023-06-23T16:43:15.597' AS DateTime), N'0x262c97988216963472f2f4c94339af7be3688a4040156d51da31021510e145bc', N'71817499554f408481ba2e5eabf99e2f', N'Alex', CAST(N'2023-03-12T02:04:33.000' AS DateTime))
INSERT [dbo].[Input] ([Sn], [Id], [DonateId], [Note], [SendTime], [AuditStatus], [AuditNote], [AuditTime], [TxUpTime], [TxHash], [TxLog], [Creator], [Created]) VALUES (4, N'2023030002', N'2023020002', N'test2', CAST(N'2023-06-22T12:14:40.000' AS DateTime), N'1', NULL, NULL, NULL, NULL, NULL, N'Alex', CAST(N'2023-03-12T02:05:12.000' AS DateTime))
INSERT [dbo].[Input] ([Sn], [Id], [DonateId], [Note], [SendTime], [AuditStatus], [AuditNote], [AuditTime], [TxUpTime], [TxHash], [TxLog], [Creator], [Created]) VALUES (5, N'2023030003', N'2023020001', N'test3', NULL, N'0', NULL, NULL, NULL, NULL, NULL, N'rrleSoYVnC', CAST(N'2023-03-22T12:10:52.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Input] OFF
GO
SET IDENTITY_INSERT [dbo].[InputItem] ON 

INSERT [dbo].[InputItem] ([Sn], [Id], [InputId], [ItemId], [Amount]) VALUES (1, N'9Fejy0ubAf', N'2023030001', N'rVZvR7', 50)
INSERT [dbo].[InputItem] ([Sn], [Id], [InputId], [ItemId], [Amount]) VALUES (2, N'GjGvCCCGa6', N'2023030002', N'hTLgQ2', 50)
INSERT [dbo].[InputItem] ([Sn], [Id], [InputId], [ItemId], [Amount]) VALUES (1002, N'PW7wedJQB3', N'2023030002', N'rVZvR7', 10)
INSERT [dbo].[InputItem] ([Sn], [Id], [InputId], [ItemId], [Amount]) VALUES (1003, N'8r1ZZvJaVZ', N'2023030002', N'A1XTN0', 5)
SET IDENTITY_INSERT [dbo].[InputItem] OFF
GO
SET IDENTITY_INSERT [dbo].[Item] ON 

INSERT [dbo].[Item] ([Sn], [Id], [TypeId], [Name], [Unit], [CountAmount], [PriorAmount], [StockAmount], [StockWayAmount], [PlanAmount], [Sort], [Status], [Creator], [Created]) VALUES (1, N'TOLsoD', N'II6eSP', N'男短袖-S', N'件', CAST(1.0 AS Numeric(5, 1)), 0, 0, 0, 10, 4, 1, N'Alex', CAST(N'2023-02-02T18:19:24.000' AS DateTime))
INSERT [dbo].[Item] ([Sn], [Id], [TypeId], [Name], [Unit], [CountAmount], [PriorAmount], [StockAmount], [StockWayAmount], [PlanAmount], [Sort], [Status], [Creator], [Created]) VALUES (2, N'rVZvR7', N'5VKtfm', N'瓶裝水-1500 cc', N'瓶', CAST(1.5 AS Numeric(5, 1)), 15, 60, 10, 40, 2, 1, N'Alex', CAST(N'2023-02-02T21:46:19.000' AS DateTime))
INSERT [dbo].[Item] ([Sn], [Id], [TypeId], [Name], [Unit], [CountAmount], [PriorAmount], [StockAmount], [StockWayAmount], [PlanAmount], [Sort], [Status], [Creator], [Created]) VALUES (3, N'6nRXwQ', N'ZeOURx', N'免洗餐具', N'套', CAST(1.0 AS Numeric(5, 1)), 0, 0, 0, 0, 9, 1, N'Alex', CAST(N'2023-05-26T01:48:35.000' AS DateTime))
INSERT [dbo].[Item] ([Sn], [Id], [TypeId], [Name], [Unit], [CountAmount], [PriorAmount], [StockAmount], [StockWayAmount], [PlanAmount], [Sort], [Status], [Creator], [Created]) VALUES (4, N'FSVCuk', N'5VKtfm', N'瓶裝水-500 cc', N'瓶', CAST(0.5 AS Numeric(5, 1)), 0, 0, 0, 0, 1, 1, N'Alex', CAST(N'2023-05-26T01:50:59.000' AS DateTime))
INSERT [dbo].[Item] ([Sn], [Id], [TypeId], [Name], [Unit], [CountAmount], [PriorAmount], [StockAmount], [StockWayAmount], [PlanAmount], [Sort], [Status], [Creator], [Created]) VALUES (5, N'avWI2F', N'5VKtfm', N'瓶裝水-6000 cc', N'瓶', CAST(6.0 AS Numeric(5, 1)), 0, 0, 0, 0, 3, 1, N'Alex', CAST(N'2023-05-26T01:51:38.000' AS DateTime))
INSERT [dbo].[Item] ([Sn], [Id], [TypeId], [Name], [Unit], [CountAmount], [PriorAmount], [StockAmount], [StockWayAmount], [PlanAmount], [Sort], [Status], [Creator], [Created]) VALUES (6, N'ztrLVL', N'II6eSP', N'男短袖-L', N'件', CAST(1.0 AS Numeric(5, 1)), 0, 0, 0, 0, 6, 1, N'Alex', CAST(N'2023-05-26T01:53:27.000' AS DateTime))
INSERT [dbo].[Item] ([Sn], [Id], [TypeId], [Name], [Unit], [CountAmount], [PriorAmount], [StockAmount], [StockWayAmount], [PlanAmount], [Sort], [Status], [Creator], [Created]) VALUES (7, N'2gRU9R', N'II6eSP', N'男短袖-M', N'件', CAST(1.0 AS Numeric(5, 1)), 0, 0, 0, 0, 5, 1, N'Alex', CAST(N'2023-05-26T01:53:41.000' AS DateTime))
INSERT [dbo].[Item] ([Sn], [Id], [TypeId], [Name], [Unit], [CountAmount], [PriorAmount], [StockAmount], [StockWayAmount], [PlanAmount], [Sort], [Status], [Creator], [Created]) VALUES (8, N'hTLgQ2', N'II6eSP', N'女短袖-S', N'件', CAST(1.0 AS Numeric(5, 1)), 0, 0, 0, 0, 1, 1, N'Alex', CAST(N'2023-05-26T01:54:54.000' AS DateTime))
INSERT [dbo].[Item] ([Sn], [Id], [TypeId], [Name], [Unit], [CountAmount], [PriorAmount], [StockAmount], [StockWayAmount], [PlanAmount], [Sort], [Status], [Creator], [Created]) VALUES (9, N'UMOrOV', N'II6eSP', N'女短袖-L', N'件', CAST(1.0 AS Numeric(5, 1)), 0, 0, 0, 0, 3, 1, N'Alex', CAST(N'2023-05-26T01:55:09.000' AS DateTime))
INSERT [dbo].[Item] ([Sn], [Id], [TypeId], [Name], [Unit], [CountAmount], [PriorAmount], [StockAmount], [StockWayAmount], [PlanAmount], [Sort], [Status], [Creator], [Created]) VALUES (10, N'JaIapY', N'II6eSP', N'女短袖-M', N'件', CAST(1.0 AS Numeric(5, 1)), 0, 0, 0, 0, 2, 1, N'Alex', CAST(N'2023-05-26T01:55:24.000' AS DateTime))
INSERT [dbo].[Item] ([Sn], [Id], [TypeId], [Name], [Unit], [CountAmount], [PriorAmount], [StockAmount], [StockWayAmount], [PlanAmount], [Sort], [Status], [Creator], [Created]) VALUES (11, N'c29TF7', N'UtOJck', N'衛生紙', N'包', CAST(1.0 AS Numeric(5, 1)), 0, 0, 0, 0, 9, 1, N'Alex', CAST(N'2023-05-26T02:02:31.000' AS DateTime))
INSERT [dbo].[Item] ([Sn], [Id], [TypeId], [Name], [Unit], [CountAmount], [PriorAmount], [StockAmount], [StockWayAmount], [PlanAmount], [Sort], [Status], [Creator], [Created]) VALUES (12, N'ahREw7', N'mhscpJ', N'睡袋', N'件', CAST(1.0 AS Numeric(5, 1)), 0, 0, 0, 0, 9, 1, N'Alex', CAST(N'2023-05-26T02:04:30.000' AS DateTime))
INSERT [dbo].[Item] ([Sn], [Id], [TypeId], [Name], [Unit], [CountAmount], [PriorAmount], [StockAmount], [StockWayAmount], [PlanAmount], [Sort], [Status], [Creator], [Created]) VALUES (13, N'IEzOVK', N'mhscpJ', N'毛毯', N'件', CAST(1.0 AS Numeric(5, 1)), 0, 0, 0, 0, 9, 1, N'Alex', CAST(N'2023-05-26T02:04:45.000' AS DateTime))
INSERT [dbo].[Item] ([Sn], [Id], [TypeId], [Name], [Unit], [CountAmount], [PriorAmount], [StockAmount], [StockWayAmount], [PlanAmount], [Sort], [Status], [Creator], [Created]) VALUES (14, N'YBcurn', N'mhscpJ', N'棉被', N'件', CAST(1.0 AS Numeric(5, 1)), 0, 0, 0, 0, 9, 1, N'Alex', CAST(N'2023-05-26T02:05:19.000' AS DateTime))
INSERT [dbo].[Item] ([Sn], [Id], [TypeId], [Name], [Unit], [CountAmount], [PriorAmount], [StockAmount], [StockWayAmount], [PlanAmount], [Sort], [Status], [Creator], [Created]) VALUES (15, N'A1XTN0', N'0I6Xvv', N'白米-1公斤', N'包', CAST(1.0 AS Numeric(5, 1)), 0, 0, 0, 0, 1, 1, N'Alex', CAST(N'2023-05-26T23:22:48.000' AS DateTime))
INSERT [dbo].[Item] ([Sn], [Id], [TypeId], [Name], [Unit], [CountAmount], [PriorAmount], [StockAmount], [StockWayAmount], [PlanAmount], [Sort], [Status], [Creator], [Created]) VALUES (16, N'xf1fqW', N'0I6Xvv', N'白米-2公斤', N'包', CAST(2.0 AS Numeric(5, 1)), 0, 0, 0, 0, 2, 1, N'Alex', CAST(N'2023-05-26T23:23:09.000' AS DateTime))
INSERT [dbo].[Item] ([Sn], [Id], [TypeId], [Name], [Unit], [CountAmount], [PriorAmount], [StockAmount], [StockWayAmount], [PlanAmount], [Sort], [Status], [Creator], [Created]) VALUES (17, N'pbolm0', N'dWpXAo', N'手電筒', N'支', CAST(1.0 AS Numeric(5, 1)), 0, 0, 0, 0, 1, 1, N'2kDcWJR9JH', CAST(N'2023-08-02T19:34:41.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Item] OFF
GO
SET IDENTITY_INSERT [dbo].[ItemType] ON 

INSERT [dbo].[ItemType] ([Sn], [Id], [Name], [CountName], [Sort], [Status], [Creator], [Created]) VALUES (1, N'0I6Xvv', N'食用米', N'公斤', 2, 1, N'Alex', CAST(N'2023-02-02T18:19:24.000' AS DateTime))
INSERT [dbo].[ItemType] ([Sn], [Id], [Name], [CountName], [Sort], [Status], [Creator], [Created]) VALUES (2, N'mhscpJ', N'睡眠用品', N'件', 5, 1, N'Alex', CAST(N'2023-02-02T18:19:24.000' AS DateTime))
INSERT [dbo].[ItemType] ([Sn], [Id], [Name], [CountName], [Sort], [Status], [Creator], [Created]) VALUES (3, N'II6eSP', N'衣物', N'件', 3, 1, N'Alex', CAST(N'2023-02-02T18:19:24.000' AS DateTime))
INSERT [dbo].[ItemType] ([Sn], [Id], [Name], [CountName], [Sort], [Status], [Creator], [Created]) VALUES (4, N'5VKtfm', N'飲用水', N'公升', 1, 1, N'Alex', CAST(N'2023-02-02T18:19:24.000' AS DateTime))
INSERT [dbo].[ItemType] ([Sn], [Id], [Name], [CountName], [Sort], [Status], [Creator], [Created]) VALUES (5, N'UtOJck', N'衛生用品', N'件/包/盒', 8, 1, N'Alex', CAST(N'2023-05-26T01:42:23.000' AS DateTime))
INSERT [dbo].[ItemType] ([Sn], [Id], [Name], [CountName], [Sort], [Status], [Creator], [Created]) VALUES (6, N'08i6he', N'其他', N'件/包/盒', 99, 1, N'Alex', CAST(N'2023-05-26T01:42:45.000' AS DateTime))
INSERT [dbo].[ItemType] ([Sn], [Id], [Name], [CountName], [Sort], [Status], [Creator], [Created]) VALUES (7, N'ZeOURx', N'飲食用具', N'件/包/盒', 4, 1, N'Alex', CAST(N'2023-05-26T01:59:24.000' AS DateTime))
INSERT [dbo].[ItemType] ([Sn], [Id], [Name], [CountName], [Sort], [Status], [Creator], [Created]) VALUES (8, N'dWpXAo', N'照明用具', N'件/包/盒', 9, 1, N'Alex', CAST(N'2023-05-26T02:07:45.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[ItemType] OFF
GO
SET IDENTITY_INSERT [dbo].[Msg] ON 

INSERT [dbo].[Msg] ([Sn], [Id], [IsDonate], [UserName], [Phone], [Note], [Owner], [IsClose], [CloseReason], [Created], [Reviser], [Revised]) VALUES (1, N'm10ac2LeEw', 1, N'台北-王先生', N'12345', N'飲用水6000CC * 10', N'V3h1vhjsQg', 1, N'已確認', CAST(N'2023-07-31T02:18:30.000' AS DateTime), N'V3h1vhjsQg', CAST(N'2023-08-01T01:03:52.000' AS DateTime))
INSERT [dbo].[Msg] ([Sn], [Id], [IsDonate], [UserName], [Phone], [Note], [Owner], [IsClose], [CloseReason], [Created], [Reviser], [Revised]) VALUES (2, N'nF3jsG01rVGolbIp', 0, N'台中-張小姐', N'123456', N'每週六日有空', NULL, 0, NULL, CAST(N'2023-08-01T10:56:33.000' AS DateTime), NULL, NULL)
INSERT [dbo].[Msg] ([Sn], [Id], [IsDonate], [UserName], [Phone], [Note], [Owner], [IsClose], [CloseReason], [Created], [Reviser], [Revised]) VALUES (3, N'v99hlFwAJJAmCtiK', 0, N'三重-林先生', N'234567', N'週六日有空', NULL, 0, NULL, CAST(N'2023-08-01T10:58:48.000' AS DateTime), NULL, NULL)
INSERT [dbo].[Msg] ([Sn], [Id], [IsDonate], [UserName], [Phone], [Note], [Owner], [IsClose], [CloseReason], [Created], [Reviser], [Revised]) VALUES (4, N'BmZfLCvaSPKq4W3P', 0, N'彰化-王先生', N'34567', N'週三有空', NULL, 0, NULL, CAST(N'2023-08-01T11:01:05.000' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Msg] OFF
GO
SET IDENTITY_INSERT [dbo].[Output] ON 

INSERT [dbo].[Output] ([Sn], [Id], [ActId], [Note], [Block], [PlanTime], [OutputStatus], [OutputTime], [CheckTime], [Checker], [TxUpTime], [TxHash], [TxLog], [Creator], [Created]) VALUES (3, N'2023030001', N'2023030001', N'test1', N'001', CAST(N'2023-04-01T10:00:00.000' AS DateTime), 1, CAST(N'2023-04-02T00:00:00.000' AS DateTime), CAST(N'2023-05-27T23:40:35.000' AS DateTime), N'Alex', CAST(N'2023-06-17T17:35:52.180' AS DateTime), N'0xeab6205b80b10c2243b2e2a19b364ccba64b7408abec5115795b9a928bcae6e6', N'1bf683000c0ac7a7acf6a80a6a2602a4', N'Alex', CAST(N'2023-03-21T12:01:11.000' AS DateTime))
INSERT [dbo].[Output] ([Sn], [Id], [ActId], [Note], [Block], [PlanTime], [OutputStatus], [OutputTime], [CheckTime], [Checker], [TxUpTime], [TxHash], [TxLog], [Creator], [Created]) VALUES (6, N'2023030002', N'2023030002', N'test2', NULL, CAST(N'2023-04-02T11:00:00.000' AS DateTime), 1, CAST(N'2023-05-27T22:23:26.000' AS DateTime), CAST(N'2023-06-17T17:36:04.000' AS DateTime), N'Alex', NULL, NULL, NULL, N'Alex', CAST(N'2023-03-22T12:20:23.000' AS DateTime))
INSERT [dbo].[Output] ([Sn], [Id], [ActId], [Note], [Block], [PlanTime], [OutputStatus], [OutputTime], [CheckTime], [Checker], [TxUpTime], [TxHash], [TxLog], [Creator], [Created]) VALUES (9, N'2023030003', N'2023030003', NULL, NULL, CAST(N'2023-03-20T10:00:00.000' AS DateTime), 0, CAST(N'2023-06-23T19:48:22.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, N'Alex', CAST(N'2023-03-25T23:38:09.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Output] OFF
GO
SET IDENTITY_INSERT [dbo].[OutputItem] ON 

INSERT [dbo].[OutputItem] ([Sn], [Id], [OutputId], [ItemId], [Amount]) VALUES (1, N'001', N'2023030001', N'rVZvR7', 50)
INSERT [dbo].[OutputItem] ([Sn], [Id], [OutputId], [ItemId], [Amount]) VALUES (2, N'002', N'2023030002', N'TOLsoD', 30)
INSERT [dbo].[OutputItem] ([Sn], [Id], [OutputId], [ItemId], [Amount]) VALUES (1004, N'emH4H5ScWz', N'2023030003', N'rVZvR7', 20)
SET IDENTITY_INSERT [dbo].[OutputItem] OFF
GO
SET IDENTITY_INSERT [dbo].[Skill] ON 

INSERT [dbo].[Skill] ([Sn], [Id], [Name], [Creator], [Created]) VALUES (1, N'X4JB0A', N'電腦文書', N'Alex', CAST(N'2023-02-03T09:32:55.000' AS DateTime))
INSERT [dbo].[Skill] ([Sn], [Id], [Name], [Creator], [Created]) VALUES (2, N'GTeyyl', N'搬運', N'Alex', CAST(N'2023-02-03T09:33:50.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Skill] OFF
GO
SET IDENTITY_INSERT [dbo].[Stock] ON 

INSERT [dbo].[Stock] ([Sn], [Id], [StockTime], [Status], [Creator], [Created]) VALUES (2, N'2023050001', CAST(N'2023-05-29T17:48:27.000' AS DateTime), 0, N'Alex', CAST(N'2023-05-28T18:27:15.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Stock] OFF
GO
SET IDENTITY_INSERT [dbo].[StockItem] ON 

INSERT [dbo].[StockItem] ([Sn], [Id], [StockId], [ItemId], [Amount], [OldAmount]) VALUES (2, N'QBLsWploPB', N'2023050001', N'TOLsoD', 0, 20)
INSERT [dbo].[StockItem] ([Sn], [Id], [StockId], [ItemId], [Amount], [OldAmount]) VALUES (3, N'k2oN4HMYgl', N'2023050001', N'rVZvR7', 0, 60)
INSERT [dbo].[StockItem] ([Sn], [Id], [StockId], [ItemId], [Amount], [OldAmount]) VALUES (4, N'CtOpuMy3QP', N'2023050001', N'6nRXwQ', 0, 0)
INSERT [dbo].[StockItem] ([Sn], [Id], [StockId], [ItemId], [Amount], [OldAmount]) VALUES (5, N'CUbCIz7fa3', N'2023050001', N'FSVCuk', 0, 0)
INSERT [dbo].[StockItem] ([Sn], [Id], [StockId], [ItemId], [Amount], [OldAmount]) VALUES (6, N'Na1l8bb5RK', N'2023050001', N'avWI2F', 0, 0)
INSERT [dbo].[StockItem] ([Sn], [Id], [StockId], [ItemId], [Amount], [OldAmount]) VALUES (7, N'3JrtdkmErN', N'2023050001', N'ztrLVL', 0, 0)
INSERT [dbo].[StockItem] ([Sn], [Id], [StockId], [ItemId], [Amount], [OldAmount]) VALUES (8, N'Xz8lOTVBzh', N'2023050001', N'2gRU9R', 0, 0)
INSERT [dbo].[StockItem] ([Sn], [Id], [StockId], [ItemId], [Amount], [OldAmount]) VALUES (9, N'Y6AuuMew9W', N'2023050001', N'hTLgQ2', 0, 0)
INSERT [dbo].[StockItem] ([Sn], [Id], [StockId], [ItemId], [Amount], [OldAmount]) VALUES (10, N'C1lRYkE38w', N'2023050001', N'UMOrOV', 0, 0)
INSERT [dbo].[StockItem] ([Sn], [Id], [StockId], [ItemId], [Amount], [OldAmount]) VALUES (11, N'HBKoYecHBB', N'2023050001', N'JaIapY', 0, 0)
INSERT [dbo].[StockItem] ([Sn], [Id], [StockId], [ItemId], [Amount], [OldAmount]) VALUES (12, N'DBuIdhan8L', N'2023050001', N'c29TF7', 0, 0)
INSERT [dbo].[StockItem] ([Sn], [Id], [StockId], [ItemId], [Amount], [OldAmount]) VALUES (13, N'mt8gd1Yp1k', N'2023050001', N'ahREw7', 0, 0)
INSERT [dbo].[StockItem] ([Sn], [Id], [StockId], [ItemId], [Amount], [OldAmount]) VALUES (14, N'e207qzXNtu', N'2023050001', N'IEzOVK', 0, 0)
INSERT [dbo].[StockItem] ([Sn], [Id], [StockId], [ItemId], [Amount], [OldAmount]) VALUES (15, N'kHvzsChweE', N'2023050001', N'YBcurn', 0, 0)
INSERT [dbo].[StockItem] ([Sn], [Id], [StockId], [ItemId], [Amount], [OldAmount]) VALUES (16, N'R0zbnXC1ZQ', N'2023050001', N'A1XTN0', 0, 0)
SET IDENTITY_INSERT [dbo].[StockItem] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Sn], [Id], [Name], [Account], [Pwd], [Phone], [Email], [PhotoFile], [Status], [Creator], [Created]) VALUES (2, N'Alex', N'Alex Wang', N'aa', N'QSS8CpM1wn8IbyS6IHpJEg', N'123', NULL, N'', 1, N'Alex', CAST(N'2023-02-03T12:00:26.000' AS DateTime))
INSERT [dbo].[User] ([Sn], [Id], [Name], [Account], [Pwd], [Phone], [Email], [PhotoFile], [Status], [Creator], [Created]) VALUES (10, N'oE2LLiJ9ie', N'IT', N'it', N'DRSbkOc5QpcwHJAZGud18A', N'123', N'', NULL, 1, N'Alex', CAST(N'2023-06-18T22:03:44.000' AS DateTime))
INSERT [dbo].[User] ([Sn], [Id], [Name], [Account], [Pwd], [Phone], [Email], [PhotoFile], [Status], [Creator], [Created]) VALUES (11, N'rrleSoYVnC', N'Bruce Lee', N'bb', N'Ia0L2Da5DQj0z2QLTCmOfA', N'125', N'', NULL, 1, N'Alex', CAST(N'2023-06-18T22:05:16.000' AS DateTime))
INSERT [dbo].[User] ([Sn], [Id], [Name], [Account], [Pwd], [Phone], [Email], [PhotoFile], [Status], [Creator], [Created]) VALUES (12, N'2kDcWJR9JH', N'主管1', N'm1', N'rnvibNqnQsoUgGjVrJDqyg', N'123', N'', NULL, 1, N'Alex', CAST(N'2023-06-18T22:06:04.000' AS DateTime))
INSERT [dbo].[User] ([Sn], [Id], [Name], [Account], [Pwd], [Phone], [Email], [PhotoFile], [Status], [Creator], [Created]) VALUES (13, N'f9JoL57uoQ', N'主管2', N'm2', N'qvL4mZI3lwXayETAoqHUXw', N'123', N'', NULL, 1, N'Alex', CAST(N'2023-06-18T22:06:16.000' AS DateTime))
INSERT [dbo].[User] ([Sn], [Id], [Name], [Account], [Pwd], [Phone], [Email], [PhotoFile], [Status], [Creator], [Created]) VALUES (14, N'V3h1vhjsQg', N'客服1', N'c1', N'qffpeWXWz3maUpECqXO4uQ', N'123', N'', NULL, 1, N'Alex', CAST(N'2023-06-18T22:10:59.000' AS DateTime))
INSERT [dbo].[User] ([Sn], [Id], [Name], [Account], [Pwd], [Phone], [Email], [PhotoFile], [Status], [Creator], [Created]) VALUES (15, N'LZCNeVkWez', N'倉管1', N's1', N'jd-HgDm3B2fEpbz08MT2Xg', N'123', N'', NULL, 1, N'Alex', CAST(N'2023-06-18T22:12:59.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[User] OFF
GO
SET IDENTITY_INSERT [dbo].[Vol] ON 

INSERT [dbo].[Vol] ([Sn], [Id], [Name], [Email], [Phone], [Address], [EtherAddress], [NftTokenId], [PhotoFile], [Status], [Creator], [Created]) VALUES (1, N'ztXemj0Sa8', N'John 王', N'a1@aa.bb', N'123', N'台北市', NULL, NULL, N'Photo.png', 1, N'Alex', CAST(N'2023-02-03T12:00:26.000' AS DateTime))
INSERT [dbo].[Vol] ([Sn], [Id], [Name], [Email], [Phone], [Address], [EtherAddress], [NftTokenId], [PhotoFile], [Status], [Creator], [Created]) VALUES (2, N'abDemj0Sa8', N'David 陳', N'a2@aa.bb', N'2345', N'台中市', N'0xEFe0E4eea8143Af0b3FBE10A1D8624d0ee36Bf8A', 10, N'Photo.png', 1, N'Alex', CAST(N'2023-03-10T12:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Vol] OFF
GO
SET IDENTITY_INSERT [dbo].[VolAct] ON 

INSERT [dbo].[VolAct] ([Sn], [Id], [VolId], [ActId], [Note]) VALUES (1, N'T645w5enEK', N'abDemj0Sa8', N'2023030001', N'負責食料清洗與準備，工作認真。')
INSERT [dbo].[VolAct] ([Sn], [Id], [VolId], [ActId], [Note]) VALUES (1002, N'3xX2AafC0S', N'abDemj0Sa8', N'2023030002', N'負責文書處理，工作認真。')
INSERT [dbo].[VolAct] ([Sn], [Id], [VolId], [ActId], [Note]) VALUES (1003, N'sc7vRlwEsf', N'abDemj0Sa8', N'2023030003', N'負責場地佈置與清潔，工作認真。')
SET IDENTITY_INSERT [dbo].[VolAct] OFF
GO
SET IDENTITY_INSERT [dbo].[VolSkill] ON 

INSERT [dbo].[VolSkill] ([Sn], [Id], [VolId], [SkillId]) VALUES (4047, N'ZDKXj52gT7', N'abDemj0Sa8', N'X4JB0A')
INSERT [dbo].[VolSkill] ([Sn], [Id], [VolId], [SkillId]) VALUES (4048, N'8Zz1Wj1D2I', N'abDemj0Sa8', N'GTeyyl')
INSERT [dbo].[VolSkill] ([Sn], [Id], [VolId], [SkillId]) VALUES (5002, N'3hufBhgYsy', N'ztXemj0Sa8', N'X4JB0A')
SET IDENTITY_INSERT [dbo].[VolSkill] OFF
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
SET IDENTITY_INSERT [dbo].[XpProg] OFF
GO
SET IDENTITY_INSERT [dbo].[XpRole] ON 

INSERT [dbo].[XpRole] ([Sn], [Id], [Name], [Sort]) VALUES (1, N'IT', N'IT管理員', 9)
INSERT [dbo].[XpRole] ([Sn], [Id], [Name], [Sort]) VALUES (3, N'House', N'倉管員', 2)
INSERT [dbo].[XpRole] ([Sn], [Id], [Name], [Sort]) VALUES (4, N'Cust', N'客服', 1)
INSERT [dbo].[XpRole] ([Sn], [Id], [Name], [Sort]) VALUES (5, N'Mgr', N'主管', 4)
INSERT [dbo].[XpRole] ([Sn], [Id], [Name], [Sort]) VALUES (8, N'sx1ZBx', N'辦事員', 3)
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
INSERT [dbo].[XpRoleProg] ([Sn], [Id], [RoleId], [ProgId], [FunCreate], [FunRead], [FunUpdate], [FunDelete], [FunPrint], [FunExport], [FunView], [FunOther]) VALUES (4002, N'1XhmMb174p', N'sx1ZBx', N'ItemType', 0, 1, 0, 0, 0, 0, 1, 0)
INSERT [dbo].[XpRoleProg] ([Sn], [Id], [RoleId], [ProgId], [FunCreate], [FunRead], [FunUpdate], [FunDelete], [FunPrint], [FunExport], [FunView], [FunOther]) VALUES (4003, N'fEv3w2mLLx', N'sx1ZBx', N'Item', 0, 1, 0, 0, 0, 0, 1, 0)
INSERT [dbo].[XpRoleProg] ([Sn], [Id], [RoleId], [ProgId], [FunCreate], [FunRead], [FunUpdate], [FunDelete], [FunPrint], [FunExport], [FunView], [FunOther]) VALUES (4004, N'SCrPt1hDH1', N'sx1ZBx', N'Skill', 1, 9, 1, 1, 0, 0, 9, 0)
INSERT [dbo].[XpRoleProg] ([Sn], [Id], [RoleId], [ProgId], [FunCreate], [FunRead], [FunUpdate], [FunDelete], [FunPrint], [FunExport], [FunView], [FunOther]) VALUES (4005, N'hn296p3bli', N'sx1ZBx', N'Vol', 1, 9, 1, 1, 0, 0, 9, 0)
INSERT [dbo].[XpRoleProg] ([Sn], [Id], [RoleId], [ProgId], [FunCreate], [FunRead], [FunUpdate], [FunDelete], [FunPrint], [FunExport], [FunView], [FunOther]) VALUES (4006, N'tzpO7g6C0r', N'sx1ZBx', N'House', 0, 1, 0, 0, 0, 0, 1, 0)
INSERT [dbo].[XpRoleProg] ([Sn], [Id], [RoleId], [ProgId], [FunCreate], [FunRead], [FunUpdate], [FunDelete], [FunPrint], [FunExport], [FunView], [FunOther]) VALUES (5002, N'7QVjZzdAAW', N'sx1ZBx', N'Act', 1, 9, 1, 1, 0, 0, 9, 0)
INSERT [dbo].[XpRoleProg] ([Sn], [Id], [RoleId], [ProgId], [FunCreate], [FunRead], [FunUpdate], [FunDelete], [FunPrint], [FunExport], [FunView], [FunOther]) VALUES (5003, N'YD1LucRuyl', N'sx1ZBx', N'Input', 1, 9, 1, 1, 0, 0, 9, 0)
INSERT [dbo].[XpRoleProg] ([Sn], [Id], [RoleId], [ProgId], [FunCreate], [FunRead], [FunUpdate], [FunDelete], [FunPrint], [FunExport], [FunView], [FunOther]) VALUES (5004, N'CFZhfBpa3Z', N'sx1ZBx', N'OutputChk', 1, 9, 1, 1, 0, 0, 9, 0)
INSERT [dbo].[XpRoleProg] ([Sn], [Id], [RoleId], [ProgId], [FunCreate], [FunRead], [FunUpdate], [FunDelete], [FunPrint], [FunExport], [FunView], [FunOther]) VALUES (5005, N'yuseLqjvoB', N'sx1ZBx', N'SetPwd', 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[XpRoleProg] ([Sn], [Id], [RoleId], [ProgId], [FunCreate], [FunRead], [FunUpdate], [FunDelete], [FunPrint], [FunExport], [FunView], [FunOther]) VALUES (5006, N'5aCVwxnBj6', N'Mgr', N'ItemType', 1, 1, 1, 1, 1, 1, 1, 0)
INSERT [dbo].[XpRoleProg] ([Sn], [Id], [RoleId], [ProgId], [FunCreate], [FunRead], [FunUpdate], [FunDelete], [FunPrint], [FunExport], [FunView], [FunOther]) VALUES (5007, N'fD72MBvzoZ', N'Mgr', N'Item', 1, 1, 1, 1, 1, 1, 1, 0)
INSERT [dbo].[XpRoleProg] ([Sn], [Id], [RoleId], [ProgId], [FunCreate], [FunRead], [FunUpdate], [FunDelete], [FunPrint], [FunExport], [FunView], [FunOther]) VALUES (5008, N'rjmjGvhx04', N'Mgr', N'Skill', 1, 1, 1, 1, 1, 1, 1, 0)
INSERT [dbo].[XpRoleProg] ([Sn], [Id], [RoleId], [ProgId], [FunCreate], [FunRead], [FunUpdate], [FunDelete], [FunPrint], [FunExport], [FunView], [FunOther]) VALUES (5009, N'YlJPTJ2M1k', N'Mgr', N'Vol', 1, 1, 1, 1, 1, 1, 1, 0)
INSERT [dbo].[XpRoleProg] ([Sn], [Id], [RoleId], [ProgId], [FunCreate], [FunRead], [FunUpdate], [FunDelete], [FunPrint], [FunExport], [FunView], [FunOther]) VALUES (5010, N'4DGJMScvL2', N'Mgr', N'House', 1, 1, 1, 1, 1, 1, 1, 0)
INSERT [dbo].[XpRoleProg] ([Sn], [Id], [RoleId], [ProgId], [FunCreate], [FunRead], [FunUpdate], [FunDelete], [FunPrint], [FunExport], [FunView], [FunOther]) VALUES (5011, N'N8a8dK0cq1', N'Mgr', N'Donor', 1, 9, 9, 9, 1, 1, 9, 0)
INSERT [dbo].[XpRoleProg] ([Sn], [Id], [RoleId], [ProgId], [FunCreate], [FunRead], [FunUpdate], [FunDelete], [FunPrint], [FunExport], [FunView], [FunOther]) VALUES (5012, N'Hx4g4PGbq9', N'Mgr', N'Donate', 1, 9, 9, 9, 1, 1, 9, 0)
INSERT [dbo].[XpRoleProg] ([Sn], [Id], [RoleId], [ProgId], [FunCreate], [FunRead], [FunUpdate], [FunDelete], [FunPrint], [FunExport], [FunView], [FunOther]) VALUES (5013, N'ZgsQ62Rrr0', N'Mgr', N'DonateAdt', 1, 9, 9, 9, 1, 1, 9, 0)
INSERT [dbo].[XpRoleProg] ([Sn], [Id], [RoleId], [ProgId], [FunCreate], [FunRead], [FunUpdate], [FunDelete], [FunPrint], [FunExport], [FunView], [FunOther]) VALUES (5014, N'HjeWN7NQLs', N'Mgr', N'Act', 1, 9, 9, 9, 1, 1, 9, 0)
INSERT [dbo].[XpRoleProg] ([Sn], [Id], [RoleId], [ProgId], [FunCreate], [FunRead], [FunUpdate], [FunDelete], [FunPrint], [FunExport], [FunView], [FunOther]) VALUES (5015, N'95iEe4k35D', N'Mgr', N'ActAudit', 1, 9, 9, 9, 1, 1, 9, 0)
INSERT [dbo].[XpRoleProg] ([Sn], [Id], [RoleId], [ProgId], [FunCreate], [FunRead], [FunUpdate], [FunDelete], [FunPrint], [FunExport], [FunView], [FunOther]) VALUES (5016, N'RC1JLCJ9Rd', N'Mgr', N'Input', 1, 9, 9, 9, 1, 1, 9, 0)
INSERT [dbo].[XpRoleProg] ([Sn], [Id], [RoleId], [ProgId], [FunCreate], [FunRead], [FunUpdate], [FunDelete], [FunPrint], [FunExport], [FunView], [FunOther]) VALUES (5017, N'Gc4cdj2HxU', N'Mgr', N'InputAudit', 1, 9, 9, 9, 1, 1, 9, 0)
INSERT [dbo].[XpRoleProg] ([Sn], [Id], [RoleId], [ProgId], [FunCreate], [FunRead], [FunUpdate], [FunDelete], [FunPrint], [FunExport], [FunView], [FunOther]) VALUES (5018, N'BlnxGaPO3S', N'Mgr', N'Output', 1, 9, 9, 9, 1, 1, 9, 0)
INSERT [dbo].[XpRoleProg] ([Sn], [Id], [RoleId], [ProgId], [FunCreate], [FunRead], [FunUpdate], [FunDelete], [FunPrint], [FunExport], [FunView], [FunOther]) VALUES (5019, N'EH9AlCiM8e', N'Mgr', N'OutputChk', 1, 9, 9, 9, 1, 1, 9, 0)
INSERT [dbo].[XpRoleProg] ([Sn], [Id], [RoleId], [ProgId], [FunCreate], [FunRead], [FunUpdate], [FunDelete], [FunPrint], [FunExport], [FunView], [FunOther]) VALUES (5020, N'h62M9Bkvwq', N'Mgr', N'StockStat', 0, 9, 1, 1, 1, 1, 1, 0)
INSERT [dbo].[XpRoleProg] ([Sn], [Id], [RoleId], [ProgId], [FunCreate], [FunRead], [FunUpdate], [FunDelete], [FunPrint], [FunExport], [FunView], [FunOther]) VALUES (5021, N'W3SvFcnGIq', N'Mgr', N'Stock', 1, 1, 1, 1, 1, 1, 1, 0)
INSERT [dbo].[XpRoleProg] ([Sn], [Id], [RoleId], [ProgId], [FunCreate], [FunRead], [FunUpdate], [FunDelete], [FunPrint], [FunExport], [FunView], [FunOther]) VALUES (5022, N'RbUVFBs46U', N'Mgr', N'SetPwd', 0, 1, 1, 1, 1, 1, 1, 0)
INSERT [dbo].[XpRoleProg] ([Sn], [Id], [RoleId], [ProgId], [FunCreate], [FunRead], [FunUpdate], [FunDelete], [FunPrint], [FunExport], [FunView], [FunOther]) VALUES (6002, N'iI8K5MnFV1', N'IT', N'Act', 0, 9, 0, 0, 0, 0, 9, 0)
INSERT [dbo].[XpRoleProg] ([Sn], [Id], [RoleId], [ProgId], [FunCreate], [FunRead], [FunUpdate], [FunDelete], [FunPrint], [FunExport], [FunView], [FunOther]) VALUES (6003, N'P6XiG5QevB', N'IT', N'ActAudit', 0, 9, 0, 0, 0, 0, 9, 0)
INSERT [dbo].[XpRoleProg] ([Sn], [Id], [RoleId], [ProgId], [FunCreate], [FunRead], [FunUpdate], [FunDelete], [FunPrint], [FunExport], [FunView], [FunOther]) VALUES (7002, N'njoxyS5zJE', N'Cust', N'Msg', 1, 9, 1, 0, 0, 0, 9, 0)
INSERT [dbo].[XpRoleProg] ([Sn], [Id], [RoleId], [ProgId], [FunCreate], [FunRead], [FunUpdate], [FunDelete], [FunPrint], [FunExport], [FunView], [FunOther]) VALUES (7003, N'f7In5zsesq', N'Mgr', N'Msg', 1, 9, 9, 0, 0, 0, 9, 0)
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
SET IDENTITY_INSERT [dbo].[XpUserRole] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Act_Id]    Script Date: 2023/8/2 下午 10:51:48 ******/
CREATE UNIQUE NONCLUSTERED INDEX [Act_Id] ON [dbo].[Act]
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ActItem_Id]    Script Date: 2023/8/2 下午 10:51:48 ******/
CREATE UNIQUE NONCLUSTERED INDEX [ActItem_Id] ON [dbo].[ActItem]
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Donate_Id]    Script Date: 2023/8/2 下午 10:51:48 ******/
CREATE UNIQUE NONCLUSTERED INDEX [Donate_Id] ON [dbo].[Donate]
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [DonateItem_Id]    Script Date: 2023/8/2 下午 10:51:48 ******/
CREATE UNIQUE NONCLUSTERED INDEX [DonateItem_Id] ON [dbo].[DonateItem]
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Donor_Id]    Script Date: 2023/8/2 下午 10:51:48 ******/
CREATE UNIQUE NONCLUSTERED INDEX [Donor_Id] ON [dbo].[Donor]
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [DonorTalk_Id]    Script Date: 2023/8/2 下午 10:51:48 ******/
CREATE UNIQUE NONCLUSTERED INDEX [DonorTalk_Id] ON [dbo].[DonorTalk]
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [House_Id]    Script Date: 2023/8/2 下午 10:51:48 ******/
CREATE UNIQUE NONCLUSTERED INDEX [House_Id] ON [dbo].[House]
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Input_Id]    Script Date: 2023/8/2 下午 10:51:48 ******/
CREATE UNIQUE NONCLUSTERED INDEX [Input_Id] ON [dbo].[Input]
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [InputItem_Id]    Script Date: 2023/8/2 下午 10:51:48 ******/
CREATE UNIQUE NONCLUSTERED INDEX [InputItem_Id] ON [dbo].[InputItem]
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Item_Id]    Script Date: 2023/8/2 下午 10:51:48 ******/
CREATE UNIQUE NONCLUSTERED INDEX [Item_Id] ON [dbo].[Item]
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ItemType_Id]    Script Date: 2023/8/2 下午 10:51:48 ******/
CREATE UNIQUE NONCLUSTERED INDEX [ItemType_Id] ON [dbo].[ItemType]
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Msg_Id]    Script Date: 2023/8/2 下午 10:51:48 ******/
CREATE UNIQUE NONCLUSTERED INDEX [Msg_Id] ON [dbo].[Msg]
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Output_Id]    Script Date: 2023/8/2 下午 10:51:48 ******/
CREATE UNIQUE NONCLUSTERED INDEX [Output_Id] ON [dbo].[Output]
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [OutputItem_Id]    Script Date: 2023/8/2 下午 10:51:48 ******/
CREATE UNIQUE NONCLUSTERED INDEX [OutputItem_Id] ON [dbo].[OutputItem]
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Skill_Id]    Script Date: 2023/8/2 下午 10:51:48 ******/
CREATE UNIQUE NONCLUSTERED INDEX [Skill_Id] ON [dbo].[Skill]
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Stock_Id]    Script Date: 2023/8/2 下午 10:51:48 ******/
CREATE UNIQUE NONCLUSTERED INDEX [Stock_Id] ON [dbo].[Stock]
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [StockItem_Id]    Script Date: 2023/8/2 下午 10:51:48 ******/
CREATE UNIQUE NONCLUSTERED INDEX [StockItem_Id] ON [dbo].[StockItem]
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [User_Id]    Script Date: 2023/8/2 下午 10:51:48 ******/
CREATE UNIQUE NONCLUSTERED INDEX [User_Id] ON [dbo].[User]
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Vol_Id]    Script Date: 2023/8/2 下午 10:51:48 ******/
CREATE UNIQUE NONCLUSTERED INDEX [Vol_Id] ON [dbo].[Vol]
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [VolAct_Id]    Script Date: 2023/8/2 下午 10:51:48 ******/
CREATE UNIQUE NONCLUSTERED INDEX [VolAct_Id] ON [dbo].[VolAct]
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [VolSkill_Id]    Script Date: 2023/8/2 下午 10:51:48 ******/
CREATE UNIQUE NONCLUSTERED INDEX [VolSkill_Id] ON [dbo].[VolSkill]
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [VolSkill_vs]    Script Date: 2023/8/2 下午 10:51:48 ******/
CREATE UNIQUE NONCLUSTERED INDEX [VolSkill_vs] ON [dbo].[VolSkill]
(
	[VolId] ASC,
	[SkillId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [XpProg_Id]    Script Date: 2023/8/2 下午 10:51:48 ******/
CREATE UNIQUE NONCLUSTERED INDEX [XpProg_Id] ON [dbo].[XpProg]
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [XpRole_Id]    Script Date: 2023/8/2 下午 10:51:48 ******/
CREATE UNIQUE NONCLUSTERED INDEX [XpRole_Id] ON [dbo].[XpRole]
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [XpRoleProg_Id]    Script Date: 2023/8/2 下午 10:51:48 ******/
CREATE UNIQUE NONCLUSTERED INDEX [XpRoleProg_Id] ON [dbo].[XpRoleProg]
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [XpUserRole_Id]    Script Date: 2023/8/2 下午 10:51:48 ******/
CREATE UNIQUE NONCLUSTERED INDEX [XpUserRole_Id] ON [dbo].[XpUserRole]
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
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
ALTER TABLE [dbo].[Msg] ADD  CONSTRAINT [DF_Ticket_Status]  DEFAULT ((0)) FOR [IsClose]
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
