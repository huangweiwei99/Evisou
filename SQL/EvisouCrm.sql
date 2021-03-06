USE [master]
GO
/****** Object:  Database [EvisouCrm]    Script Date: 2015/11/23 3:32:33 ******/
CREATE DATABASE [EvisouCrm]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EviousCrm', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\EviousCrm.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'EviousCrm_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\EviousCrm_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [EvisouCrm] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EvisouCrm].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EvisouCrm] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EvisouCrm] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EvisouCrm] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EvisouCrm] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EvisouCrm] SET ARITHABORT OFF 
GO
ALTER DATABASE [EvisouCrm] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EvisouCrm] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EvisouCrm] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EvisouCrm] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EvisouCrm] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EvisouCrm] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EvisouCrm] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EvisouCrm] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EvisouCrm] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EvisouCrm] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EvisouCrm] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EvisouCrm] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EvisouCrm] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EvisouCrm] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EvisouCrm] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EvisouCrm] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EvisouCrm] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EvisouCrm] SET RECOVERY FULL 
GO
ALTER DATABASE [EvisouCrm] SET  MULTI_USER 
GO
ALTER DATABASE [EvisouCrm] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EvisouCrm] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EvisouCrm] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EvisouCrm] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [EvisouCrm] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'EvisouCrm', N'ON'
GO
USE [EvisouCrm]
GO
/****** Object:  Table [dbo].[Area]    Script Date: 2015/11/23 3:32:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Area](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[CityId] [int] NOT NULL,
	[CreateTime] [datetime] NOT NULL CONSTRAINT [DF_Area_CreateTime]  DEFAULT (getdate()),
 CONSTRAINT [PK_Area] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[City]    Script Date: 2015/11/23 3:32:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[CreateTime] [datetime] NOT NULL CONSTRAINT [DF_City_CreateTime]  DEFAULT (getdate()),
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customer]    Script Date: 2015/11/23 3:32:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Tel] [nvarchar](50) NOT NULL,
	[UserId] [int] NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Number] [nvarchar](50) NOT NULL,
	[Gender] [int] NOT NULL,
	[Email] [nvarchar](50) NULL,
	[Address] [nvarchar](100) NULL,
	[Category] [int] NOT NULL,
	[Profession] [int] NOT NULL,
	[AgeGroup] [int] NOT NULL,
	[CreateTime] [datetime] NOT NULL CONSTRAINT [DF_Customer_CreateTime]  DEFAULT (getdate()),
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Project]    Script Date: 2015/11/23 3:32:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Project](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[CreateTime] [datetime] NOT NULL CONSTRAINT [DF_Project_CreateTime]  DEFAULT (getdate()),
 CONSTRAINT [PK_Project] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[VisitRecord]    Script Date: 2015/11/23 3:32:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VisitRecord](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[Username] [nvarchar](50) NOT NULL,
	[VisitWay] [int] NOT NULL,
	[CustomerId] [int] NOT NULL,
	[ProjectId] [int] NOT NULL,
	[FollowLevel] [int] NOT NULL,
	[FollowStep] [int] NOT NULL,
	[ProductType] [int] NOT NULL,
	[Probability] [int] NOT NULL,
	[Detail] [nvarchar](400) NULL,
	[VisitTime] [datetime] NOT NULL CONSTRAINT [DF_VisitRecord_VisitTime]  DEFAULT (getdate()),
	[CreateTime] [datetime] NOT NULL CONSTRAINT [DF_VisitRecord_CreateTime]  DEFAULT (getdate()),
	[AreaDemand] [int] NOT NULL,
	[PriceResponse] [int] NOT NULL,
	[CognitiveChannel] [int] NOT NULL,
	[Focus] [int] NOT NULL,
	[Motivation] [int] NOT NULL,
	[CityId] [int] NOT NULL,
	[AreaId] [int] NOT NULL,
 CONSTRAINT [PK_VisitRecord] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Area] ON 

INSERT [dbo].[Area] ([ID], [Name], [CityId], [CreateTime]) VALUES (3, N'东洲街道', 1, CAST(N'2013-12-04 10:37:21.463' AS DateTime))
INSERT [dbo].[Area] ([ID], [Name], [CityId], [CreateTime]) VALUES (4, N'富春街道', 1, CAST(N'2013-12-04 10:37:21.463' AS DateTime))
INSERT [dbo].[Area] ([ID], [Name], [CityId], [CreateTime]) VALUES (5, N'鹿山街道', 1, CAST(N'2013-12-04 10:37:21.463' AS DateTime))
INSERT [dbo].[Area] ([ID], [Name], [CityId], [CreateTime]) VALUES (6, N'春江街道', 1, CAST(N'2013-12-04 10:37:21.463' AS DateTime))
INSERT [dbo].[Area] ([ID], [Name], [CityId], [CreateTime]) VALUES (7, N'新登镇', 2, CAST(N'2013-12-04 10:37:21.463' AS DateTime))
INSERT [dbo].[Area] ([ID], [Name], [CityId], [CreateTime]) VALUES (8, N'高桥镇', 2, CAST(N'2013-12-04 10:37:21.463' AS DateTime))
INSERT [dbo].[Area] ([ID], [Name], [CityId], [CreateTime]) VALUES (9, N'受降镇', 2, CAST(N'2013-12-04 10:37:21.463' AS DateTime))
INSERT [dbo].[Area] ([ID], [Name], [CityId], [CreateTime]) VALUES (10, N'万市镇', 2, CAST(N'2013-12-04 10:37:21.463' AS DateTime))
INSERT [dbo].[Area] ([ID], [Name], [CityId], [CreateTime]) VALUES (11, N'龙门镇', 2, CAST(N'2013-12-04 10:37:21.463' AS DateTime))
INSERT [dbo].[Area] ([ID], [Name], [CityId], [CreateTime]) VALUES (12, N'大源镇', 2, CAST(N'2013-12-04 10:37:21.463' AS DateTime))
INSERT [dbo].[Area] ([ID], [Name], [CityId], [CreateTime]) VALUES (13, N'常绿镇', 2, CAST(N'2013-12-04 10:37:21.463' AS DateTime))
INSERT [dbo].[Area] ([ID], [Name], [CityId], [CreateTime]) VALUES (14, N'其他乡镇', 2, CAST(N'2013-12-04 10:37:21.463' AS DateTime))
INSERT [dbo].[Area] ([ID], [Name], [CityId], [CreateTime]) VALUES (15, N'下城区', 3, CAST(N'2013-12-04 10:37:21.463' AS DateTime))
INSERT [dbo].[Area] ([ID], [Name], [CityId], [CreateTime]) VALUES (16, N'拱墅区', 3, CAST(N'2013-12-04 10:37:21.463' AS DateTime))
INSERT [dbo].[Area] ([ID], [Name], [CityId], [CreateTime]) VALUES (17, N'江干区', 3, CAST(N'2013-12-04 10:37:21.463' AS DateTime))
INSERT [dbo].[Area] ([ID], [Name], [CityId], [CreateTime]) VALUES (18, N'上城区', 3, CAST(N'2013-12-04 10:37:21.463' AS DateTime))
INSERT [dbo].[Area] ([ID], [Name], [CityId], [CreateTime]) VALUES (19, N'西湖区', 3, CAST(N'2013-12-04 10:37:21.463' AS DateTime))
INSERT [dbo].[Area] ([ID], [Name], [CityId], [CreateTime]) VALUES (20, N'滨江区', 3, CAST(N'2013-12-04 10:37:21.463' AS DateTime))
INSERT [dbo].[Area] ([ID], [Name], [CityId], [CreateTime]) VALUES (21, N'下沙新城', 3, CAST(N'2013-12-04 10:37:21.463' AS DateTime))
INSERT [dbo].[Area] ([ID], [Name], [CityId], [CreateTime]) VALUES (22, N'余杭区', 3, CAST(N'2013-12-04 10:37:21.463' AS DateTime))
INSERT [dbo].[Area] ([ID], [Name], [CityId], [CreateTime]) VALUES (23, N'省内其他城市', 4, CAST(N'2013-12-04 10:37:21.463' AS DateTime))
INSERT [dbo].[Area] ([ID], [Name], [CityId], [CreateTime]) VALUES (24, N'外省市', 4, CAST(N'2013-12-04 10:37:21.463' AS DateTime))
INSERT [dbo].[Area] ([ID], [Name], [CityId], [CreateTime]) VALUES (25, N'港澳台地区', 4, CAST(N'2013-12-04 10:37:21.463' AS DateTime))
INSERT [dbo].[Area] ([ID], [Name], [CityId], [CreateTime]) VALUES (26, N'境外地区', 4, CAST(N'2013-12-04 10:37:21.463' AS DateTime))
SET IDENTITY_INSERT [dbo].[Area] OFF
SET IDENTITY_INSERT [dbo].[City] ON 

INSERT [dbo].[City] ([ID], [Name], [CreateTime]) VALUES (1, N'富阳市区', CAST(N'2013-12-04 10:37:59.377' AS DateTime))
INSERT [dbo].[City] ([ID], [Name], [CreateTime]) VALUES (2, N'富阳乡镇', CAST(N'2013-12-04 10:37:59.377' AS DateTime))
INSERT [dbo].[City] ([ID], [Name], [CreateTime]) VALUES (3, N'杭州', CAST(N'2013-12-04 10:37:59.377' AS DateTime))
INSERT [dbo].[City] ([ID], [Name], [CreateTime]) VALUES (4, N'其他', CAST(N'2013-12-04 10:37:59.377' AS DateTime))
SET IDENTITY_INSERT [dbo].[City] OFF
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([ID], [Name], [Tel], [UserId], [Username], [Number], [Gender], [Email], [Address], [Category], [Profession], [AgeGroup], [CreateTime]) VALUES (1, N'张一易', N'13987654356', 1, N'guozili', N'PD120', 1, NULL, NULL, 1, 3, 3, CAST(N'2013-11-25 11:34:34.233' AS DateTime))
INSERT [dbo].[Customer] ([ID], [Name], [Tel], [UserId], [Username], [Number], [Gender], [Email], [Address], [Category], [Profession], [AgeGroup], [CreateTime]) VALUES (2, N'李进', N'14534567890', 1, N'guozili', N'PS123', 1, NULL, NULL, 5, 6, 5, CAST(N'2013-11-25 12:00:07.453' AS DateTime))
INSERT [dbo].[Customer] ([ID], [Name], [Tel], [UserId], [Username], [Number], [Gender], [Email], [Address], [Category], [Profession], [AgeGroup], [CreateTime]) VALUES (3, N'黎西', N'13487673000', 2, N'guozili2', N'PD333', 2, NULL, NULL, 1, 14, 4, CAST(N'2013-11-25 12:00:24.547' AS DateTime))
INSERT [dbo].[Customer] ([ID], [Name], [Tel], [UserId], [Username], [Number], [Gender], [Email], [Address], [Category], [Profession], [AgeGroup], [CreateTime]) VALUES (4, N'张京微', N'13456788765', 2, N'guozili2', N'PA421', 1, NULL, NULL, 5, 5, 6, CAST(N'2013-11-25 12:00:48.970' AS DateTime))
INSERT [dbo].[Customer] ([ID], [Name], [Tel], [UserId], [Username], [Number], [Gender], [Email], [Address], [Category], [Profession], [AgeGroup], [CreateTime]) VALUES (5, N'郑然', N'18978634571', 4, N'guozili3', N'JD183', 2, NULL, NULL, 3, 3, 2, CAST(N'2013-11-25 12:01:07.827' AS DateTime))
INSERT [dbo].[Customer] ([ID], [Name], [Tel], [UserId], [Username], [Number], [Gender], [Email], [Address], [Category], [Profession], [AgeGroup], [CreateTime]) VALUES (6, N'宋校冰', N'17627138777', 4, N'guozili3', N'PD224', 1, NULL, NULL, 5, 5, 5, CAST(N'2013-11-25 12:01:38.077' AS DateTime))
INSERT [dbo].[Customer] ([ID], [Name], [Tel], [UserId], [Username], [Number], [Gender], [Email], [Address], [Category], [Profession], [AgeGroup], [CreateTime]) VALUES (7, N'李敏', N'13811329822', 6, N'dakongyi', N'PS133', 1, NULL, NULL, 1, 2, 2, CAST(N'2013-11-25 12:54:04.657' AS DateTime))
INSERT [dbo].[Customer] ([ID], [Name], [Tel], [UserId], [Username], [Number], [Gender], [Email], [Address], [Category], [Profession], [AgeGroup], [CreateTime]) VALUES (8, N'欧径自', N'13876544531', 6, N'dakongyi', N'ED429', 1, NULL, NULL, 1, 2, 2, CAST(N'2013-11-25 12:54:27.937' AS DateTime))
INSERT [dbo].[Customer] ([ID], [Name], [Tel], [UserId], [Username], [Number], [Gender], [Email], [Address], [Category], [Profession], [AgeGroup], [CreateTime]) VALUES (9, N'程一雪', N'13876540999', 6, N'dakongyi', N'ZD524', 2, N'g', NULL, 1, 1, 2, CAST(N'2013-11-25 12:55:03.470' AS DateTime))
SET IDENTITY_INSERT [dbo].[Customer] OFF
SET IDENTITY_INSERT [dbo].[Project] ON 

INSERT [dbo].[Project] ([ID], [Name], [CreateTime]) VALUES (1, N'燕京航城第一期', CAST(N'2013-02-04 13:59:38.733' AS DateTime))
INSERT [dbo].[Project] ([ID], [Name], [CreateTime]) VALUES (2, N'凤凰国际黄金海岸', CAST(N'2013-02-09 19:02:10.703' AS DateTime))
SET IDENTITY_INSERT [dbo].[Project] OFF
SET IDENTITY_INSERT [dbo].[VisitRecord] ON 

INSERT [dbo].[VisitRecord] ([ID], [UserId], [Username], [VisitWay], [CustomerId], [ProjectId], [FollowLevel], [FollowStep], [ProductType], [Probability], [Detail], [VisitTime], [CreateTime], [AreaDemand], [PriceResponse], [CognitiveChannel], [Focus], [Motivation], [CityId], [AreaId]) VALUES (1, 1, N'guozili', 2, 1, 1, 1, 1, 1, 10, NULL, CAST(N'2013-11-25 11:34:52.000' AS DateTime), CAST(N'2013-11-25 11:34:52.077' AS DateTime), 4, 4, 32, 8404992, 5, 2, 7)
INSERT [dbo].[VisitRecord] ([ID], [UserId], [Username], [VisitWay], [CustomerId], [ProjectId], [FollowLevel], [FollowStep], [ProductType], [Probability], [Detail], [VisitTime], [CreateTime], [AreaDemand], [PriceResponse], [CognitiveChannel], [Focus], [Motivation], [CityId], [AreaId]) VALUES (3, 1, N'guozili', 1, 2, 1, 2, 2, 1, 20, NULL, CAST(N'2013-11-25 12:56:28.000' AS DateTime), CAST(N'2013-11-25 12:56:28.843' AS DateTime), 3, 3, 8192, 532480, 3, 2, 7)
INSERT [dbo].[VisitRecord] ([ID], [UserId], [Username], [VisitWay], [CustomerId], [ProjectId], [FollowLevel], [FollowStep], [ProductType], [Probability], [Detail], [VisitTime], [CreateTime], [AreaDemand], [PriceResponse], [CognitiveChannel], [Focus], [Motivation], [CityId], [AreaId]) VALUES (4, 1, N'guozili', 1, 1, 1, 2, 2, 1, 30, NULL, CAST(N'2013-11-25 12:58:41.000' AS DateTime), CAST(N'2013-11-25 12:58:41.983' AS DateTime), 4, 3, 4, 256, 4, 1, 4)
INSERT [dbo].[VisitRecord] ([ID], [UserId], [Username], [VisitWay], [CustomerId], [ProjectId], [FollowLevel], [FollowStep], [ProductType], [Probability], [Detail], [VisitTime], [CreateTime], [AreaDemand], [PriceResponse], [CognitiveChannel], [Focus], [Motivation], [CityId], [AreaId]) VALUES (5, 1, N'guozili', 1, 1, 1, 2, 3, 1, 30, NULL, CAST(N'2013-11-25 12:58:56.000' AS DateTime), CAST(N'2013-11-25 12:58:56.733' AS DateTime), 2, 3, 260, 4, 2, 1, 3)
INSERT [dbo].[VisitRecord] ([ID], [UserId], [Username], [VisitWay], [CustomerId], [ProjectId], [FollowLevel], [FollowStep], [ProductType], [Probability], [Detail], [VisitTime], [CreateTime], [AreaDemand], [PriceResponse], [CognitiveChannel], [Focus], [Motivation], [CityId], [AreaId]) VALUES (6, 1, N'guozili', 1, 2, 1, 1, 2, 1, 30, NULL, CAST(N'2013-11-25 12:59:21.000' AS DateTime), CAST(N'2013-11-25 12:59:21.470' AS DateTime), 2, 2, 8192, 2, 1, 1, 3)
INSERT [dbo].[VisitRecord] ([ID], [UserId], [Username], [VisitWay], [CustomerId], [ProjectId], [FollowLevel], [FollowStep], [ProductType], [Probability], [Detail], [VisitTime], [CreateTime], [AreaDemand], [PriceResponse], [CognitiveChannel], [Focus], [Motivation], [CityId], [AreaId]) VALUES (7, 2, N'guozili2', 1, 3, 1, 1, 1, 1, 10, NULL, CAST(N'2013-11-25 12:59:52.000' AS DateTime), CAST(N'2013-11-25 12:59:52.687' AS DateTime), 1, 1, 1, 1, 1, 3, 16)
INSERT [dbo].[VisitRecord] ([ID], [UserId], [Username], [VisitWay], [CustomerId], [ProjectId], [FollowLevel], [FollowStep], [ProductType], [Probability], [Detail], [VisitTime], [CreateTime], [AreaDemand], [PriceResponse], [CognitiveChannel], [Focus], [Motivation], [CityId], [AreaId]) VALUES (8, 2, N'guozili2', 1, 3, 1, 1, 1, 1, 10, NULL, CAST(N'2013-11-25 18:59:32.000' AS DateTime), CAST(N'2013-11-25 18:59:32.877' AS DateTime), 3, 3, 2, 2, 4, 3, 16)
INSERT [dbo].[VisitRecord] ([ID], [UserId], [Username], [VisitWay], [CustomerId], [ProjectId], [FollowLevel], [FollowStep], [ProductType], [Probability], [Detail], [VisitTime], [CreateTime], [AreaDemand], [PriceResponse], [CognitiveChannel], [Focus], [Motivation], [CityId], [AreaId]) VALUES (9, 2, N'guozili2', 1, 4, 1, 1, 2, 1, 20, NULL, CAST(N'2013-11-25 18:59:45.000' AS DateTime), CAST(N'2013-11-25 18:59:45.423' AS DateTime), 2, 2, 1, 2, 2, 3, 15)
INSERT [dbo].[VisitRecord] ([ID], [UserId], [Username], [VisitWay], [CustomerId], [ProjectId], [FollowLevel], [FollowStep], [ProductType], [Probability], [Detail], [VisitTime], [CreateTime], [AreaDemand], [PriceResponse], [CognitiveChannel], [Focus], [Motivation], [CityId], [AreaId]) VALUES (10, 2, N'guozili2', 1, 4, 1, 2, 2, 1, 20, NULL, CAST(N'2013-11-25 18:59:55.000' AS DateTime), CAST(N'2013-11-25 18:59:55.953' AS DateTime), 2, 3, 2, 2, 2, 1, 3)
INSERT [dbo].[VisitRecord] ([ID], [UserId], [Username], [VisitWay], [CustomerId], [ProjectId], [FollowLevel], [FollowStep], [ProductType], [Probability], [Detail], [VisitTime], [CreateTime], [AreaDemand], [PriceResponse], [CognitiveChannel], [Focus], [Motivation], [CityId], [AreaId]) VALUES (11, 4, N'guozili3', 1, 5, 2, 1, 1, 1, 10, NULL, CAST(N'2013-11-25 19:01:30.000' AS DateTime), CAST(N'2013-11-25 19:01:30.453' AS DateTime), 2, 0, 128, 532480, 1, 1, 6)
INSERT [dbo].[VisitRecord] ([ID], [UserId], [Username], [VisitWay], [CustomerId], [ProjectId], [FollowLevel], [FollowStep], [ProductType], [Probability], [Detail], [VisitTime], [CreateTime], [AreaDemand], [PriceResponse], [CognitiveChannel], [Focus], [Motivation], [CityId], [AreaId]) VALUES (12, 4, N'guozili3', 1, 5, 2, 2, 1, 1, 20, NULL, CAST(N'2013-11-25 19:02:32.000' AS DateTime), CAST(N'2013-11-25 19:02:32.343' AS DateTime), 4, 0, 4, 1064960, 4, 1, 3)
INSERT [dbo].[VisitRecord] ([ID], [UserId], [Username], [VisitWay], [CustomerId], [ProjectId], [FollowLevel], [FollowStep], [ProductType], [Probability], [Detail], [VisitTime], [CreateTime], [AreaDemand], [PriceResponse], [CognitiveChannel], [Focus], [Motivation], [CityId], [AreaId]) VALUES (13, 4, N'guozili3', 1, 6, 2, 1, 1, 1, 0, NULL, CAST(N'2013-11-25 19:02:42.000' AS DateTime), CAST(N'2013-11-25 19:02:42.233' AS DateTime), 3, 3, 2, 33554692, 3, 1, 3)
INSERT [dbo].[VisitRecord] ([ID], [UserId], [Username], [VisitWay], [CustomerId], [ProjectId], [FollowLevel], [FollowStep], [ProductType], [Probability], [Detail], [VisitTime], [CreateTime], [AreaDemand], [PriceResponse], [CognitiveChannel], [Focus], [Motivation], [CityId], [AreaId]) VALUES (14, 4, N'guozili3', 1, 5, 2, 2, 1, 1, 10, NULL, CAST(N'2013-11-25 19:02:52.000' AS DateTime), CAST(N'2013-11-25 19:02:52.907' AS DateTime), 4, 3, 8, 32776, 4, 1, 5)
INSERT [dbo].[VisitRecord] ([ID], [UserId], [Username], [VisitWay], [CustomerId], [ProjectId], [FollowLevel], [FollowStep], [ProductType], [Probability], [Detail], [VisitTime], [CreateTime], [AreaDemand], [PriceResponse], [CognitiveChannel], [Focus], [Motivation], [CityId], [AreaId]) VALUES (15, 4, N'guozili3', 2, 6, 1, 2, 1, 2, 20, NULL, CAST(N'2013-11-25 19:03:08.000' AS DateTime), CAST(N'2013-11-25 19:03:08.453' AS DateTime), 2, 2, 2, 130, 2, 1, 3)
INSERT [dbo].[VisitRecord] ([ID], [UserId], [Username], [VisitWay], [CustomerId], [ProjectId], [FollowLevel], [FollowStep], [ProductType], [Probability], [Detail], [VisitTime], [CreateTime], [AreaDemand], [PriceResponse], [CognitiveChannel], [Focus], [Motivation], [CityId], [AreaId]) VALUES (16, 6, N'dakongyi', 2, 7, 1, 1, 1, 2, 10, NULL, CAST(N'2013-11-25 19:04:20.000' AS DateTime), CAST(N'2013-11-25 19:04:20.673' AS DateTime), 2, 2, 2, 2, 2, 1, 3)
INSERT [dbo].[VisitRecord] ([ID], [UserId], [Username], [VisitWay], [CustomerId], [ProjectId], [FollowLevel], [FollowStep], [ProductType], [Probability], [Detail], [VisitTime], [CreateTime], [AreaDemand], [PriceResponse], [CognitiveChannel], [Focus], [Motivation], [CityId], [AreaId]) VALUES (17, 6, N'dakongyi', 1, 8, 1, 1, 1, 2, 10, NULL, CAST(N'2013-11-25 19:04:31.000' AS DateTime), CAST(N'2013-11-25 19:04:31.203' AS DateTime), 2, 2, 2, 2, 3, 1, 3)
INSERT [dbo].[VisitRecord] ([ID], [UserId], [Username], [VisitWay], [CustomerId], [ProjectId], [FollowLevel], [FollowStep], [ProductType], [Probability], [Detail], [VisitTime], [CreateTime], [AreaDemand], [PriceResponse], [CognitiveChannel], [Focus], [Motivation], [CityId], [AreaId]) VALUES (18, 6, N'dakongyi', 1, 2, 1, 2, 1, 2, 20, N'暂时无', CAST(N'2013-11-25 19:04:47.000' AS DateTime), CAST(N'2013-11-25 19:04:47.827' AS DateTime), 2, 4, 3, 65110275, 2, 1, 3)
SET IDENTITY_INSERT [dbo].[VisitRecord] OFF
USE [master]
GO
ALTER DATABASE [EvisouCrm] SET  READ_WRITE 
GO
