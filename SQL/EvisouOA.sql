USE [master]
GO
/****** Object:  Database [EvisouOA]    Script Date: 2015/11/23 3:34:58 ******/
CREATE DATABASE [EvisouOA]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EviousOA', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\EviousOA.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'EviousOA_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\EviousOA_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [EvisouOA] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EvisouOA].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EvisouOA] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EvisouOA] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EvisouOA] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EvisouOA] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EvisouOA] SET ARITHABORT OFF 
GO
ALTER DATABASE [EvisouOA] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EvisouOA] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EvisouOA] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EvisouOA] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EvisouOA] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EvisouOA] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EvisouOA] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EvisouOA] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EvisouOA] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EvisouOA] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EvisouOA] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EvisouOA] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EvisouOA] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EvisouOA] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EvisouOA] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EvisouOA] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EvisouOA] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EvisouOA] SET RECOVERY FULL 
GO
ALTER DATABASE [EvisouOA] SET  MULTI_USER 
GO
ALTER DATABASE [EvisouOA] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EvisouOA] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EvisouOA] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EvisouOA] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [EvisouOA] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'EvisouOA', N'ON'
GO
USE [EvisouOA]
GO
/****** Object:  Table [dbo].[Branch]    Script Date: 2015/11/23 3:34:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Branch](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Desc] [nvarchar](300) NULL,
	[ParentId] [int] NOT NULL CONSTRAINT [DF_Branch_ParentId]  DEFAULT ((0)),
	[CreateTime] [datetime] NOT NULL CONSTRAINT [DF_Branch_CreateDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_Branch] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Staff]    Script Date: 2015/11/23 3:34:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[CoverPicture] [nvarchar](300) NULL,
	[Gender] [int] NOT NULL CONSTRAINT [DF_Staff_Hits]  DEFAULT ((0)),
	[Position] [int] NOT NULL CONSTRAINT [DF_Staff_IsActive]  DEFAULT ((0)),
	[BirthDate] [datetime] NULL,
	[Tel] [nvarchar](100) NOT NULL CONSTRAINT [DF_Staff_Diggs]  DEFAULT ((0)),
	[Email] [nvarchar](100) NULL,
	[Address] [nvarchar](200) NULL,
	[BranchId] [int] NOT NULL,
	[CreateTime] [datetime] NOT NULL CONSTRAINT [DF_Staff_CreateDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_Staff] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Branch] ON 

INSERT [dbo].[Branch] ([ID], [Name], [Desc], [ParentId], [CreateTime]) VALUES (1, N'总经办', NULL, 0, CAST(N'2013-12-20 23:09:46.140' AS DateTime))
INSERT [dbo].[Branch] ([ID], [Name], [Desc], [ParentId], [CreateTime]) VALUES (2, N'测试部', NULL, 6, CAST(N'2013-12-20 23:10:54.953' AS DateTime))
INSERT [dbo].[Branch] ([ID], [Name], [Desc], [ParentId], [CreateTime]) VALUES (3, N'研发部', NULL, 6, CAST(N'2013-12-21 23:06:57.147' AS DateTime))
INSERT [dbo].[Branch] ([ID], [Name], [Desc], [ParentId], [CreateTime]) VALUES (4, N'前端组', NULL, 3, CAST(N'2013-12-21 23:07:40.580' AS DateTime))
INSERT [dbo].[Branch] ([ID], [Name], [Desc], [ParentId], [CreateTime]) VALUES (5, N'后端组', NULL, 3, CAST(N'2013-12-21 23:10:15.353' AS DateTime))
INSERT [dbo].[Branch] ([ID], [Name], [Desc], [ParentId], [CreateTime]) VALUES (6, N'开发中心', NULL, 1, CAST(N'2013-12-21 23:10:44.617' AS DateTime))
INSERT [dbo].[Branch] ([ID], [Name], [Desc], [ParentId], [CreateTime]) VALUES (7, N'人力资源部', NULL, 1, CAST(N'2013-12-21 23:11:06.450' AS DateTime))
SET IDENTITY_INSERT [dbo].[Branch] OFF
SET IDENTITY_INSERT [dbo].[Staff] ON 

INSERT [dbo].[Staff] ([ID], [Name], [CoverPicture], [Gender], [Position], [BirthDate], [Tel], [Email], [Address], [BranchId], [CreateTime]) VALUES (1, N'程一冰', NULL, 2, 0, CAST(N'1981-12-02 00:00:00.000' AS DateTime), N'13876540999', NULL, NULL, 5, CAST(N'2013-12-22 13:13:50.267' AS DateTime))
INSERT [dbo].[Staff] ([ID], [Name], [CoverPicture], [Gender], [Position], [BirthDate], [Tel], [Email], [Address], [BranchId], [CreateTime]) VALUES (3, N'欧景致', NULL, 1, 0, CAST(N'1978-12-02 00:00:00.000' AS DateTime), N'13876544531', NULL, NULL, 4, CAST(N'2013-12-22 13:17:46.437' AS DateTime))
INSERT [dbo].[Staff] ([ID], [Name], [CoverPicture], [Gender], [Position], [BirthDate], [Tel], [Email], [Address], [BranchId], [CreateTime]) VALUES (4, N'李敏', NULL, 1, 0, CAST(N'1983-12-02 00:00:00.000' AS DateTime), N'13811329822', NULL, NULL, 0, CAST(N'2013-12-22 13:17:46.437' AS DateTime))
INSERT [dbo].[Staff] ([ID], [Name], [CoverPicture], [Gender], [Position], [BirthDate], [Tel], [Email], [Address], [BranchId], [CreateTime]) VALUES (5, N'宋慈', NULL, 1, 0, CAST(N'1981-12-02 00:00:00.000' AS DateTime), N'17627138777', NULL, NULL, 0, CAST(N'2013-12-22 13:17:46.437' AS DateTime))
INSERT [dbo].[Staff] ([ID], [Name], [CoverPicture], [Gender], [Position], [BirthDate], [Tel], [Email], [Address], [BranchId], [CreateTime]) VALUES (6, N'郑然', NULL, 2, 0, CAST(N'1981-12-02 00:00:00.000' AS DateTime), N'18978634571', NULL, NULL, 7, CAST(N'2013-12-22 13:17:46.437' AS DateTime))
INSERT [dbo].[Staff] ([ID], [Name], [CoverPicture], [Gender], [Position], [BirthDate], [Tel], [Email], [Address], [BranchId], [CreateTime]) VALUES (7, N'张京微', NULL, 1, 0, CAST(N'1985-12-02 00:00:00.000' AS DateTime), N'13456788765', NULL, NULL, 0, CAST(N'2013-12-22 13:17:46.437' AS DateTime))
INSERT [dbo].[Staff] ([ID], [Name], [CoverPicture], [Gender], [Position], [BirthDate], [Tel], [Email], [Address], [BranchId], [CreateTime]) VALUES (8, N'黎西', NULL, 2, 0, CAST(N'1984-12-02 00:00:00.000' AS DateTime), N'13487673000', NULL, NULL, 0, CAST(N'2013-12-22 13:17:46.437' AS DateTime))
INSERT [dbo].[Staff] ([ID], [Name], [CoverPicture], [Gender], [Position], [BirthDate], [Tel], [Email], [Address], [BranchId], [CreateTime]) VALUES (9, N'李进', NULL, 1, 0, CAST(N'1980-12-02 00:00:00.000' AS DateTime), N'14534567890', NULL, NULL, 1, CAST(N'2013-12-22 13:17:46.437' AS DateTime))
INSERT [dbo].[Staff] ([ID], [Name], [CoverPicture], [Gender], [Position], [BirthDate], [Tel], [Email], [Address], [BranchId], [CreateTime]) VALUES (10, N'张一易', NULL, 1, 2, CAST(N'1983-12-02 00:00:00.000' AS DateTime), N'13987654356', NULL, NULL, 3, CAST(N'2013-12-22 13:17:46.437' AS DateTime))
INSERT [dbo].[Staff] ([ID], [Name], [CoverPicture], [Gender], [Position], [BirthDate], [Tel], [Email], [Address], [BranchId], [CreateTime]) VALUES (11, N'名人', NULL, 1, 1, CAST(N'2014-04-23 00:00:00.000' AS DateTime), N'18927705761', N'happymama0813@gmail.com', N'NANHAI', 0, CAST(N'2014-04-23 03:22:36.607' AS DateTime))
INSERT [dbo].[Staff] ([ID], [Name], [CoverPicture], [Gender], [Position], [BirthDate], [Tel], [Email], [Address], [BranchId], [CreateTime]) VALUES (12, N'Test User', NULL, 1, 0, CAST(N'2014-04-18 00:00:00.000' AS DateTime), N'02122102106', N'vson.h@gmail.com', N'New York', 0, CAST(N'2014-04-23 03:22:51.430' AS DateTime))
INSERT [dbo].[Staff] ([ID], [Name], [CoverPicture], [Gender], [Position], [BirthDate], [Tel], [Email], [Address], [BranchId], [CreateTime]) VALUES (13, N'Anya Lee', NULL, 1, 0, CAST(N'2014-04-16 00:00:00.000' AS DateTime), N'05786227560', N'anya.lee1215@hotmail.com', N'Room 602， 20BLG， Guihua Garden, GuiC', 0, CAST(N'2014-04-23 03:23:16.417' AS DateTime))
INSERT [dbo].[Staff] ([ID], [Name], [CoverPicture], [Gender], [Position], [BirthDate], [Tel], [Email], [Address], [BranchId], [CreateTime]) VALUES (14, N'dsada', NULL, 1, 1, NULL, N'18927705761', N'happymama0813@gmail.com', N'NANHAI', 0, CAST(N'2014-04-23 03:23:34.670' AS DateTime))
SET IDENTITY_INSERT [dbo].[Staff] OFF
USE [master]
GO
ALTER DATABASE [EvisouOA] SET  READ_WRITE 
GO
