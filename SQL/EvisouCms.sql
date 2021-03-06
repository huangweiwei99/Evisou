USE [master]
GO
/****** Object:  Database [EvisouCms]    Script Date: 2015/11/23 3:04:00 ******/
CREATE DATABASE [EvisouCms]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EviousCms', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\EviousCms.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'EviousCms_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\EviousCms_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [EvisouCms] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EvisouCms].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EvisouCms] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EvisouCms] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EvisouCms] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EvisouCms] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EvisouCms] SET ARITHABORT OFF 
GO
ALTER DATABASE [EvisouCms] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EvisouCms] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EvisouCms] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EvisouCms] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EvisouCms] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EvisouCms] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EvisouCms] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EvisouCms] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EvisouCms] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EvisouCms] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EvisouCms] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EvisouCms] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EvisouCms] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EvisouCms] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EvisouCms] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EvisouCms] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EvisouCms] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EvisouCms] SET RECOVERY FULL 
GO
ALTER DATABASE [EvisouCms] SET  MULTI_USER 
GO
ALTER DATABASE [EvisouCms] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EvisouCms] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EvisouCms] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EvisouCms] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [EvisouCms] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'EvisouCms', N'ON'
GO
USE [EvisouCms]
GO
/****** Object:  Table [dbo].[Article]    Script Date: 2015/11/23 3:04:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Article](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Content] [nvarchar](max) NULL,
	[ChannelId] [int] NOT NULL,
	[CoverPicture] [nvarchar](300) NULL,
	[Hits] [int] NOT NULL CONSTRAINT [DF_Article_Hits]  DEFAULT ((0)),
	[Diggs] [int] NOT NULL CONSTRAINT [DF_Article_Diggs]  DEFAULT ((0)),
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_Article_IsActive]  DEFAULT ((0)),
	[UserId] [int] NOT NULL,
	[UserName] [nvarchar](100) NULL CONSTRAINT [DF_Article_ExternalId]  DEFAULT ((0)),
	[CreateTime] [datetime] NOT NULL CONSTRAINT [DF_Article_CreateDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_Article] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ArticleTag]    Script Date: 2015/11/23 3:04:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArticleTag](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ArticleId] [int] NOT NULL CONSTRAINT [DF_ArticleTag_ArticleId]  DEFAULT ((0)),
	[TagId] [int] NOT NULL CONSTRAINT [DF_ArticleTag_TagId]  DEFAULT ((0)),
 CONSTRAINT [PK_ArticleTag] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Channel]    Script Date: 2015/11/23 3:04:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Channel](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Desc] [nvarchar](300) NULL,
	[CoverPicture] [nvarchar](300) NULL,
	[Hits] [int] NOT NULL CONSTRAINT [DF_Channel_Hits]  DEFAULT ((0)),
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_Channel_IsActive]  DEFAULT ((0)),
	[CreateTime] [datetime] NOT NULL CONSTRAINT [DF_Channel_CreateDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_Channel] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tag]    Script Date: 2015/11/23 3:04:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tag](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Hits] [int] NOT NULL CONSTRAINT [DF_Tag_Hits]  DEFAULT ((0)),
	[CreateTime] [datetime] NOT NULL CONSTRAINT [DF_Tag_CreateDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_Tag] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Article] ON 

INSERT [dbo].[Article] ([ID], [Title], [Content], [ChannelId], [CoverPicture], [Hits], [Diggs], [IsActive], [UserId], [UserName], [CreateTime]) VALUES (16, N'吉林"最狠拆迁女市长"被双开 曾称有"尚方宝剑"', N'<p class="f_center"><img alt="韩迎新资料图" src="http://img6.cache.netease.com/cnews/2013/12/29/201312290432079cb70.jpg" /><br />
韩迎新资料图</p>

<p>晨报讯 吉林省舒兰市原市委常委、副市长韩迎新昨天被证实开除党籍、公职，其涉嫌犯罪问题已移送司法机关依法处理。2011年，韩迎新曾因辖区内拆迁户到中央上访而受到舆论关注。</p>

<p>经查，韩迎新利用职务便利和职权影响，为他人牟取利益，收受他人贿赂数额较大。其行为已构成严重违纪。公开资料显示，韩迎新任副市长期间曾分管市监察局、市财政局、市审计局。并协助市长分管市政府办公室、市住房和城乡建设局、市城市管理局、市棚户区改造管理办公室、市政府采购中心等重要部门。</p>

<p>公开报道称，韩迎新曾说过&ldquo;我不懂拆迁法，不按拆迁法办&rdquo;、&ldquo;我有尚方宝剑！你们随便告，我不怕&rdquo;等言论，而被称为&ldquo;史上最美最狠拆迁女市长&rdquo;。2011年，韩迎新更是成为焦点人物。那一年，因门面房被无理强拆，舒兰市市民许桂芹到中央上访，并得到了时任总理温家宝的亲自接待。</p>
<!--EndFragment-->', 2, NULL, 0, 0, 1, 1, N'guozili', CAST(N'2013-12-29 17:51:29.017' AS DateTime))
SET IDENTITY_INSERT [dbo].[Article] OFF
SET IDENTITY_INSERT [dbo].[ArticleTag] ON 

INSERT [dbo].[ArticleTag] ([ID], [ArticleId], [TagId]) VALUES (26, 16, 18)
INSERT [dbo].[ArticleTag] ([ID], [ArticleId], [TagId]) VALUES (27, 16, 19)
SET IDENTITY_INSERT [dbo].[ArticleTag] OFF
SET IDENTITY_INSERT [dbo].[Channel] ON 

INSERT [dbo].[Channel] ([ID], [Name], [Desc], [CoverPicture], [Hits], [IsActive], [CreateTime]) VALUES (1, N'公司动态', N'暂时无', NULL, 0, 1, CAST(N'2013-12-01 14:05:45.407' AS DateTime))
INSERT [dbo].[Channel] ([ID], [Name], [Desc], [CoverPicture], [Hits], [IsActive], [CreateTime]) VALUES (2, N'最新通知', N'暂时无', NULL, 0, 1, CAST(N'2013-12-01 14:06:06.050' AS DateTime))
INSERT [dbo].[Channel] ([ID], [Name], [Desc], [CoverPicture], [Hits], [IsActive], [CreateTime]) VALUES (3, N'业界新闻', N'暂时没有', NULL, 0, 1, CAST(N'2013-12-01 19:40:47.517' AS DateTime))
SET IDENTITY_INSERT [dbo].[Channel] OFF
SET IDENTITY_INSERT [dbo].[Tag] ON 

INSERT [dbo].[Tag] ([ID], [Name], [Hits], [CreateTime]) VALUES (15, N'最新', 2, CAST(N'2013-12-02 23:37:32.047' AS DateTime))
INSERT [dbo].[Tag] ([ID], [Name], [Hits], [CreateTime]) VALUES (16, N'最热', 1, CAST(N'2013-12-02 23:37:32.047' AS DateTime))
INSERT [dbo].[Tag] ([ID], [Name], [Hits], [CreateTime]) VALUES (18, N'反腐', 1, CAST(N'2013-12-29 17:51:29.030' AS DateTime))
INSERT [dbo].[Tag] ([ID], [Name], [Hits], [CreateTime]) VALUES (19, N'温家宝', 1, CAST(N'2013-12-29 17:51:29.030' AS DateTime))
SET IDENTITY_INSERT [dbo].[Tag] OFF
USE [master]
GO
ALTER DATABASE [EvisouCms] SET  READ_WRITE 
GO
