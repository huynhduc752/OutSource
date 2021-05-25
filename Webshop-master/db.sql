USE [master]
GO
/****** Object:  Database [WebShop]    Script Date: 25/05/2021 2:28:24 CH ******/
CREATE DATABASE [WebShop] ON  PRIMARY 
( NAME = N'WebShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER01\MSSQL\DATA\WebShop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'WebShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER01\MSSQL\DATA\WebShop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WebShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WebShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WebShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WebShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WebShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WebShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [WebShop] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [WebShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WebShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WebShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WebShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WebShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WebShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WebShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WebShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WebShop] SET  ENABLE_BROKER 
GO
ALTER DATABASE [WebShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WebShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WebShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WebShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WebShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WebShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WebShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WebShop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [WebShop] SET  MULTI_USER 
GO
ALTER DATABASE [WebShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WebShop] SET DB_CHAINING OFF 
GO
EXEC sys.sp_db_vardecimal_storage_format N'WebShop', N'ON'
GO
USE [WebShop]
GO
/****** Object:  Table [dbo].[Admins]    Script Date: 25/05/2021 2:28:25 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admins](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](300) NULL,
	[UserName] [nvarchar](300) NULL,
	[Password] [nvarchar](300) NULL,
	[Gender] [bit] NULL,
	[Address] [nvarchar](300) NULL,
	[Email] [nvarchar](300) NULL,
	[Phone] [nvarchar](250) NULL,
	[IsAdmins] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](250) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](250) NULL,
	[Status] [bit] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK__Admins__3214EC070870385C] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Banner]    Script Date: 25/05/2021 2:28:25 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Banner](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Tilte] [nvarchar](300) NULL,
	[SubTilte] [nvarchar](300) NULL,
	[Image] [nvarchar](max) NULL,
	[Slug] [nvarchar](300) NULL,
	[OrderBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](250) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](250) NULL,
	[Status] [bit] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK__Banner__3214EC07E88B68E0] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 25/05/2021 2:28:25 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](300) NULL,
	[Name] [nvarchar](300) NULL,
	[Slug] [nvarchar](300) NULL,
	[ParentId] [int] NULL,
	[OrderBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](250) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](250) NULL,
	[Status] [bit] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK__Category__3214EC07E68A4F0C] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Config]    Script Date: 25/05/2021 2:28:25 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Config](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[Logo] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[Email] [nvarchar](250) NULL,
	[Phone] [nvarchar](250) NULL,
	[Guarantee] [nvarchar](max) NULL,
	[Returrn] [nvarchar](max) NULL,
	[OrderBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](250) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](250) NULL,
	[Status] [bit] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK__Config__3214EC0720B57000] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 25/05/2021 2:28:25 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](300) NULL,
	[UserName] [nvarchar](300) NULL,
	[Password] [nvarchar](300) NULL,
	[Gender] [bit] NULL,
	[Address] [nvarchar](300) NULL,
	[Email] [nvarchar](300) NULL,
	[Phone] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](250) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](250) NULL,
	[Status] [bit] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK__Customer__3214EC07D04CF5FF] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 25/05/2021 2:28:25 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AdminId] [int] NULL,
	[CustomerId] [int] NULL,
	[Note] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](250) NULL,
	[UpdatedDate] [datetime] NULL,
	[Status] [int] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK__Order__3214EC078F3EFC18] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 25/05/2021 2:28:25 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NULL,
	[ProductId] [int] NULL,
	[Stock] [int] NULL,
	[Price] [decimal](18, 0) NULL,
 CONSTRAINT [PK__OrderDet__3214EC07A3670C20] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 25/05/2021 2:28:25 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](300) NULL,
	[Name] [nvarchar](300) NULL,
	[Image] [nvarchar](max) NULL,
	[Slug] [nvarchar](300) NULL,
	[CategoryId] [int] NULL,
	[Price] [decimal](19, 0) NULL,
	[Description] [nvarchar](max) NULL,
	[Content] [nvarchar](max) NULL,
	[OrderBy] [int] NULL,
	[Stock] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](250) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](250) NULL,
	[Status] [bit] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK__Product__3214EC07BBFD3E2A] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_Image]    Script Date: 25/05/2021 2:28:25 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Image](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NULL,
	[Image] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductSize]    Script Date: 25/05/2021 2:28:25 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSize](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NULL,
	[Size] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Size]    Script Date: 25/05/2021 2:28:25 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Size](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Admins] ON 

INSERT [dbo].[Admins] ([Id], [Name], [UserName], [Password], [Gender], [Address], [Email], [Phone], [IsAdmins], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Status], [IsDeleted]) VALUES (1, N'Khuất Văn Chung ', N'Chungdz', N'admin', 1, N'Hà nội', N'khuatchung1012@gmail.com', N'0962165244', 1, CAST(N'2021-02-03T16:25:56.760' AS DateTime), N'Admin', CAST(N'2021-02-06T16:54:10.960' AS DateTime), N'Admin', 1, 1)
INSERT [dbo].[Admins] ([Id], [Name], [UserName], [Password], [Gender], [Address], [Email], [Phone], [IsAdmins], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Status], [IsDeleted]) VALUES (2, N'admin', N'admin', N'admin', 1, N'hà nội', N'admin', N'0962165244', 1, CAST(N'2021-02-06T16:51:07.190' AS DateTime), N'Admin', CAST(N'2021-02-06T16:54:06.913' AS DateTime), N'Admin', 1, 1)
INSERT [dbo].[Admins] ([Id], [Name], [UserName], [Password], [Gender], [Address], [Email], [Phone], [IsAdmins], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Status], [IsDeleted]) VALUES (3, N'admin', N'admin', N'admin', 1, N'Hà Nội', N'maihongduc0957@gmail.com', N'0326437333', 1, CAST(N'2021-05-17T19:32:02.713' AS DateTime), N'admin', NULL, NULL, 1, 0)
INSERT [dbo].[Admins] ([Id], [Name], [UserName], [Password], [Gender], [Address], [Email], [Phone], [IsAdmins], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Status], [IsDeleted]) VALUES (4, N'Lê Quang Dương', NULL, NULL, 1, NULL, NULL, NULL, 0, CAST(N'2021-05-17T19:34:04.907' AS DateTime), N'admin', NULL, NULL, 1, 1)
INSERT [dbo].[Admins] ([Id], [Name], [UserName], [Password], [Gender], [Address], [Email], [Phone], [IsAdmins], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Status], [IsDeleted]) VALUES (5, N'Lê Quang Dương', N'Quản lí', NULL, 1, NULL, N'quangduongle0123@gmail.com', N'0989095118', 0, CAST(N'2021-05-17T19:34:56.367' AS DateTime), N'admin', CAST(N'2021-05-17T19:35:17.700' AS DateTime), N'admin', 1, 1)
INSERT [dbo].[Admins] ([Id], [Name], [UserName], [Password], [Gender], [Address], [Email], [Phone], [IsAdmins], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Status], [IsDeleted]) VALUES (6, N'Lê Quang Dương', N'Quản Lí', NULL, 1, NULL, N'quangduongle0123@gmail.com', N'0989095118', 0, CAST(N'2021-05-17T19:36:00.437' AS DateTime), N'admin', NULL, NULL, 1, 0)
INSERT [dbo].[Admins] ([Id], [Name], [UserName], [Password], [Gender], [Address], [Email], [Phone], [IsAdmins], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Status], [IsDeleted]) VALUES (7, N'Mai Quang Hiếu', N'NV Kiểm hàng', NULL, 1, NULL, N'hieulac039@gmail.com', N'0979865116', 0, CAST(N'2021-05-17T19:38:34.770' AS DateTime), N'admin', NULL, NULL, 1, 0)
INSERT [dbo].[Admins] ([Id], [Name], [UserName], [Password], [Gender], [Address], [Email], [Phone], [IsAdmins], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Status], [IsDeleted]) VALUES (8, N'Hoàng Quang Huy', N'NV Thanh Toán', NULL, 1, NULL, N'huyngao098@gmail.com', N'0326538543', 0, CAST(N'2021-05-17T19:39:44.127' AS DateTime), N'admin', NULL, NULL, 1, 0)
INSERT [dbo].[Admins] ([Id], [Name], [UserName], [Password], [Gender], [Address], [Email], [Phone], [IsAdmins], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Status], [IsDeleted]) VALUES (9, N'Lã Thị Minh Hồng', N'NV Tư Vấn ', NULL, 0, NULL, N'hongmatmam078@gmail.com', N'0976768553', 0, CAST(N'2021-05-17T19:40:44.053' AS DateTime), N'admin', NULL, NULL, 1, 0)
INSERT [dbo].[Admins] ([Id], [Name], [UserName], [Password], [Gender], [Address], [Email], [Phone], [IsAdmins], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Status], [IsDeleted]) VALUES (10, N'Nguyễn Thủy Tiên', N'NV Tư Vấn', NULL, 0, NULL, N'thuytien543@gmail.com', N'032543876', 0, CAST(N'2021-05-17T19:43:02.613' AS DateTime), N'admin', NULL, NULL, 1, 0)
SET IDENTITY_INSERT [dbo].[Admins] OFF
GO
SET IDENTITY_INSERT [dbo].[Banner] ON 

INSERT [dbo].[Banner] ([Id], [Tilte], [SubTilte], [Image], [Slug], [OrderBy], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Status], [IsDeleted]) VALUES (1, NULL, NULL, N'/Content/Upload/product/552581fd9b556b0b3244.jpg', NULL, 0, CAST(N'2021-02-04T21:59:17.787' AS DateTime), N'Admin', NULL, NULL, 1, 1)
INSERT [dbo].[Banner] ([Id], [Tilte], [SubTilte], [Image], [Slug], [OrderBy], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Status], [IsDeleted]) VALUES (2, N'123234', N'123', N'/Content/Upload/product/552581fd9b556b0b3244.jpg', NULL, 1, CAST(N'2021-02-04T22:04:04.527' AS DateTime), N'Admin', CAST(N'2021-02-04T22:15:04.463' AS DateTime), N'Admin', 1, 1)
INSERT [dbo].[Banner] ([Id], [Tilte], [SubTilte], [Image], [Slug], [OrderBy], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Status], [IsDeleted]) VALUES (3, N'Mẫu', N'Mẫu', N'/Content/Upload/product/HPT_3520.jpg', NULL, 0, CAST(N'2021-02-17T09:43:21.880' AS DateTime), N'Khuất Văn Chung ', CAST(N'2021-02-17T09:43:27.780' AS DateTime), N'Khuất Văn Chung ', 1, 1)
INSERT [dbo].[Banner] ([Id], [Tilte], [SubTilte], [Image], [Slug], [OrderBy], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Status], [IsDeleted]) VALUES (4, N'3', N'3', N'/Content/Upload/product/banner03.jpg', NULL, 2, CAST(N'2021-02-17T09:44:22.300' AS DateTime), N'Khuất Văn Chung ', NULL, NULL, 1, 1)
INSERT [dbo].[Banner] ([Id], [Tilte], [SubTilte], [Image], [Slug], [OrderBy], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Status], [IsDeleted]) VALUES (5, N'234', N'234', N'/Content/Upload/product/banner01.jpg', NULL, 3, CAST(N'2021-02-17T09:44:34.567' AS DateTime), N'Khuất Văn Chung ', NULL, NULL, 1, 1)
INSERT [dbo].[Banner] ([Id], [Tilte], [SubTilte], [Image], [Slug], [OrderBy], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Status], [IsDeleted]) VALUES (6, N'Men Watch', N'Watch', N'/Content/Upload/news/about-us-wmP(1).jpg', NULL, 1, CAST(N'2021-05-13T22:16:00.340' AS DateTime), N'admin', CAST(N'2021-05-17T19:45:11.657' AS DateTime), N'admin', 1, 0)
INSERT [dbo].[Banner] ([Id], [Tilte], [SubTilte], [Image], [Slug], [OrderBy], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Status], [IsDeleted]) VALUES (7, N'Woman Watch', N'Watch', N'/Content/Upload/news/banner_desktop-tSo.jpg', NULL, 2, CAST(N'2021-05-13T22:16:26.730' AS DateTime), N'admin', CAST(N'2021-05-17T19:45:37.757' AS DateTime), N'admin', 1, 0)
INSERT [dbo].[Banner] ([Id], [Tilte], [SubTilte], [Image], [Slug], [OrderBy], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Status], [IsDeleted]) VALUES (8, N'banner03', N'b3', N'/Content/Upload/news/about-us-wmP.jpg', NULL, 3, CAST(N'2021-05-13T22:16:59.460' AS DateTime), N'admin', NULL, NULL, 1, 1)
INSERT [dbo].[Banner] ([Id], [Tilte], [SubTilte], [Image], [Slug], [OrderBy], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Status], [IsDeleted]) VALUES (9, N'Accessories', N'ACS', N'/Content/Upload/news/Banner-menu-Aura.jpg', NULL, 3, CAST(N'2021-05-17T19:47:03.607' AS DateTime), N'admin', CAST(N'2021-05-17T20:31:24.930' AS DateTime), N'admin', 1, 0)
INSERT [dbo].[Banner] ([Id], [Tilte], [SubTilte], [Image], [Slug], [OrderBy], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Status], [IsDeleted]) VALUES (10, NULL, NULL, N'/Content/Upload/Image/no-image.png', NULL, NULL, CAST(N'2021-05-17T20:31:06.730' AS DateTime), N'admin', NULL, NULL, 1, 1)
SET IDENTITY_INSERT [dbo].[Banner] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [Code], [Name], [Slug], [ParentId], [OrderBy], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Status], [IsDeleted]) VALUES (1, N'C01', N'Đồng hồ', N'dong-ho', 0, 0, CAST(N'2021-02-01T10:56:00.023' AS DateTime), N'Admin', CAST(N'2021-02-01T22:14:45.460' AS DateTime), N'Admin', 1, 1)
INSERT [dbo].[Category] ([Id], [Code], [Name], [Slug], [ParentId], [OrderBy], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Status], [IsDeleted]) VALUES (2, N'CS01', N'Đồng hồ nam', N'dong-ho-nam', 0, 1, CAST(N'2021-02-01T10:57:04.170' AS DateTime), N'Admin', CAST(N'2021-02-01T11:34:26.557' AS DateTime), N'Admin', 1, 1)
INSERT [dbo].[Category] ([Id], [Code], [Name], [Slug], [ParentId], [OrderBy], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Status], [IsDeleted]) VALUES (14, N'CS02', N'Đồng hồ nữ', N'dong-ho-nu', 0, 2, CAST(N'2021-02-01T11:19:29.697' AS DateTime), N'Admin', CAST(N'2021-02-01T11:34:31.977' AS DateTime), N'Admin', 1, 1)
INSERT [dbo].[Category] ([Id], [Code], [Name], [Slug], [ParentId], [OrderBy], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Status], [IsDeleted]) VALUES (20, N'C02', N'Phụ kiện', N'phu-kien', 0, 1, CAST(N'2021-02-01T11:32:09.113' AS DateTime), N'Admin', CAST(N'2021-02-01T12:01:35.360' AS DateTime), N'Admin', 1, 1)
INSERT [dbo].[Category] ([Id], [Code], [Name], [Slug], [ParentId], [OrderBy], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Status], [IsDeleted]) VALUES (21, N'CS01', N'Phụ kiện nam', N'phu-kien-nam', 0, 1, CAST(N'2021-02-01T11:32:23.217' AS DateTime), N'Admin', NULL, NULL, 1, 1)
INSERT [dbo].[Category] ([Id], [Code], [Name], [Slug], [ParentId], [OrderBy], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Status], [IsDeleted]) VALUES (22, N'CS02', N'Phụ kiện nữ', N'phu-kien-nu', 0, 2, CAST(N'2021-02-01T11:32:34.903' AS DateTime), N'Admin', NULL, NULL, 1, 1)
INSERT [dbo].[Category] ([Id], [Code], [Name], [Slug], [ParentId], [OrderBy], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Status], [IsDeleted]) VALUES (26, NULL, N'a', N'a', 0, 0, CAST(N'2021-02-01T12:14:00.370' AS DateTime), N'Admin', NULL, NULL, 1, 1)
INSERT [dbo].[Category] ([Id], [Code], [Name], [Slug], [ParentId], [OrderBy], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Status], [IsDeleted]) VALUES (27, N'C03', N'Thương hiệu', N'thuong-hieu', 0, 2, CAST(N'2021-02-01T21:59:02.203' AS DateTime), N'Admin', NULL, NULL, 1, 1)
INSERT [dbo].[Category] ([Id], [Code], [Name], [Slug], [ParentId], [OrderBy], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Status], [IsDeleted]) VALUES (28, N'CS03', N'Dây đồng hồ', N'day-dong-ho', 0, 2, CAST(N'2021-02-01T21:59:27.507' AS DateTime), N'Admin', NULL, NULL, 1, 1)
INSERT [dbo].[Category] ([Id], [Code], [Name], [Slug], [ParentId], [OrderBy], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Status], [IsDeleted]) VALUES (29, N'1231', N'123123', N'123123', 0, 12, CAST(N'2021-02-01T22:14:55.023' AS DateTime), N'Admin', NULL, NULL, 1, 1)
INSERT [dbo].[Category] ([Id], [Code], [Name], [Slug], [ParentId], [OrderBy], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Status], [IsDeleted]) VALUES (30, N'ASM', N'ÁO SƠ MI', N'ao-so-mi', 0, 0, CAST(N'2021-02-17T09:40:15.640' AS DateTime), N'Khuất Văn Chung ', NULL, NULL, 1, 1)
INSERT [dbo].[Category] ([Id], [Code], [Name], [Slug], [ParentId], [OrderBy], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Status], [IsDeleted]) VALUES (31, N'AV', N'ÁO VEST', N'ao-vest', 0, 1, CAST(N'2021-02-17T09:40:27.480' AS DateTime), N'Khuất Văn Chung ', NULL, NULL, 1, 1)
INSERT [dbo].[Category] ([Id], [Code], [Name], [Slug], [ParentId], [OrderBy], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Status], [IsDeleted]) VALUES (32, N'AMT', N'ÁO MĂNG TÔ', N'ao-mang-to', 0, 2, CAST(N'2021-02-17T09:40:57.330' AS DateTime), N'Khuất Văn Chung ', NULL, NULL, 1, 1)
INSERT [dbo].[Category] ([Id], [Code], [Name], [Slug], [ParentId], [OrderBy], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Status], [IsDeleted]) VALUES (33, N'DT', N'ĐẦM TRƠN', N'dam-tron', 0, 3, CAST(N'2021-02-17T09:41:20.400' AS DateTime), N'Khuất Văn Chung ', NULL, NULL, 1, 1)
INSERT [dbo].[Category] ([Id], [Code], [Name], [Slug], [ParentId], [OrderBy], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Status], [IsDeleted]) VALUES (34, N'DR', N'ĐẦM REN', N'dam-ren', 0, 4, CAST(N'2021-02-17T09:41:34.807' AS DateTime), N'Khuất Văn Chung ', NULL, NULL, 1, 1)
INSERT [dbo].[Category] ([Id], [Code], [Name], [Slug], [ParentId], [OrderBy], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Status], [IsDeleted]) VALUES (35, N'JSSB', N'JUMPSUIT/ SET BỘ', N'jumpsuit/-set-bo', 0, 5, CAST(N'2021-02-17T09:41:47.133' AS DateTime), N'Khuất Văn Chung ', NULL, NULL, 1, 1)
INSERT [dbo].[Category] ([Id], [Code], [Name], [Slug], [ParentId], [OrderBy], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Status], [IsDeleted]) VALUES (36, N'CV', N'CHÂN VÁY', N'chan-vay', 0, 6, CAST(N'2021-02-17T09:41:58.347' AS DateTime), N'Khuất Văn Chung ', NULL, NULL, 1, 1)
INSERT [dbo].[Category] ([Id], [Code], [Name], [Slug], [ParentId], [OrderBy], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Status], [IsDeleted]) VALUES (37, N'Q', N'QUẦN', N'quan', 0, 7, CAST(N'2021-02-17T09:42:07.190' AS DateTime), N'Khuất Văn Chung ', NULL, NULL, 1, 1)
INSERT [dbo].[Category] ([Id], [Code], [Name], [Slug], [ParentId], [OrderBy], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Status], [IsDeleted]) VALUES (38, N'PK', N'PHỤ KIỆN', N'phu-kien', 0, 8, CAST(N'2021-02-17T09:42:16.947' AS DateTime), N'Khuất Văn Chung ', NULL, NULL, 1, 1)
INSERT [dbo].[Category] ([Id], [Code], [Name], [Slug], [ParentId], [OrderBy], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Status], [IsDeleted]) VALUES (39, N'DH.001', N'Đồng hồ nam', N'dong-ho-nam', 0, 1, CAST(N'2021-05-13T12:32:58.940' AS DateTime), N'admin', CAST(N'2021-05-17T19:49:26.673' AS DateTime), N'admin', 1, 0)
INSERT [dbo].[Category] ([Id], [Code], [Name], [Slug], [ParentId], [OrderBy], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Status], [IsDeleted]) VALUES (40, N'DH.002', N'Đồng hồ nữ', N'dong-ho-nu', 0, 2, CAST(N'2021-05-13T12:33:38.587' AS DateTime), N'admin', CAST(N'2021-05-17T19:47:59.727' AS DateTime), N'admin', 1, 0)
INSERT [dbo].[Category] ([Id], [Code], [Name], [Slug], [ParentId], [OrderBy], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Status], [IsDeleted]) VALUES (41, N'Accesories', N'Best Saller và phụ kiện', N'best-saller-va-phu-kien', 0, 3, CAST(N'2021-05-13T12:40:29.030' AS DateTime), N'admin', CAST(N'2021-05-24T09:56:00.117' AS DateTime), N'admin', 1, 0)
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Config] ON 

INSERT [dbo].[Config] ([Id], [Name], [Logo], [Address], [Email], [Phone], [Guarantee], [Returrn], [OrderBy], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Status], [IsDeleted]) VALUES (1, N'Mai Hồng Đức', N'/Content/Upload/news/logo-mWb.png', N'Hà nội', N'maihongduc0957@gmail.com', N'0326437333', N'- Sản phẩm quần áo nếu khách hàng nhận được nhưng bị lỗi hình in, phai màu ( không có sự can thiệp của chất tẩy ) sẽ được Candles kiểm tra và tiến hành đổi sản phẩm cho khách. Nếu sản phẩm bị lỗi do quá trình vận chuyển Curnon xin phép thu hồi và đổi hàng mới cho khách.', NULL, 0, CAST(N'2021-02-17T16:32:54.140' AS DateTime), N'Khuất Văn Chung ', CAST(N'2021-05-13T22:18:39.517' AS DateTime), N'admin', 1, 0)
INSERT [dbo].[Config] ([Id], [Name], [Logo], [Address], [Email], [Phone], [Guarantee], [Returrn], [OrderBy], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Status], [IsDeleted]) VALUES (2, NULL, N'/Content/Upload/Image/no-image.png', NULL, NULL, NULL, N'- Sản phẩm quần áo nếu khách hàng nhận được nhưng bị lỗi hình in, phai màu ( không có sự can thiệp của chất tẩy ) sẽ được Candles kiểm tra và tiến hành đổi sản phẩm cho khách. Nếu sản phẩm bị lỗi do quá trình vận chuyển Candles xin phép thu hồi và đổi hàng mới cho khách.', NULL, NULL, CAST(N'2021-02-17T16:38:31.060' AS DateTime), N'Khuất Văn Chung ', NULL, NULL, 1, 1)
INSERT [dbo].[Config] ([Id], [Name], [Logo], [Address], [Email], [Phone], [Guarantee], [Returrn], [OrderBy], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Status], [IsDeleted]) VALUES (3, NULL, N'/Content/Upload/Image/no-image.png', NULL, NULL, NULL, N'- Sản phẩm quần áo nếu khách hàng nhận được nhưng bị lỗi hình in, phai màu ( không có sự can thiệp của chất tẩy ) sẽ được Candles kiểm tra và tiến hành đổi sản phẩm cho khách. Nếu sản phẩm bị lỗi do quá trình vận chuyển Candles xin phép thu hồi và đổi hàng mới cho khách.', NULL, NULL, CAST(N'2021-02-17T16:38:31.457' AS DateTime), N'Khuất Văn Chung ', NULL, NULL, 1, 1)
INSERT [dbo].[Config] ([Id], [Name], [Logo], [Address], [Email], [Phone], [Guarantee], [Returrn], [OrderBy], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Status], [IsDeleted]) VALUES (4, NULL, N'/Content/Upload/news/logo-mWb(1).png', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2021-05-19T09:29:36.390' AS DateTime), N'admin', NULL, NULL, 1, 1)
SET IDENTITY_INSERT [dbo].[Config] OFF
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([Id], [Name], [UserName], [Password], [Gender], [Address], [Email], [Phone], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Status], [IsDeleted]) VALUES (1, N'Khuất văn chung', N'Chungdz', N'123456', 1, N'Hà nội', N'khuatchung1012@gmail.com', N'0962165244', NULL, NULL, CAST(N'2021-02-18T19:43:19.237' AS DateTime), N'Admin', 1, 1)
INSERT [dbo].[Customer] ([Id], [Name], [UserName], [Password], [Gender], [Address], [Email], [Phone], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Status], [IsDeleted]) VALUES (2, N'Bùi Thị Khanh', N'1', N'123456', 0, NULL, N'khanhbeo123@gmail.com', N'0962165244', CAST(N'2021-02-03T15:56:01.393' AS DateTime), N'Admin', CAST(N'2021-05-17T19:50:59.367' AS DateTime), N'admin', 1, 0)
INSERT [dbo].[Customer] ([Id], [Name], [UserName], [Password], [Gender], [Address], [Email], [Phone], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Status], [IsDeleted]) VALUES (3, N'Mai Hồng Đức', N'2', NULL, 1, N'hà nội', N'ducduc012@gmaiil.com', N'0323456789', CAST(N'2021-05-13T22:43:39.917' AS DateTime), NULL, CAST(N'2021-05-17T19:51:35.087' AS DateTime), N'admin', 1, 0)
INSERT [dbo].[Customer] ([Id], [Name], [UserName], [Password], [Gender], [Address], [Email], [Phone], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Status], [IsDeleted]) VALUES (4, N'Nguyễn Huỳnh Đức', N'3', NULL, 1, N'Hai Phong', N'huynhduc752@gmail.com', N'0398025988', CAST(N'2021-05-13T22:47:27.690' AS DateTime), NULL, CAST(N'2021-05-17T19:54:01.687' AS DateTime), N'admin', 1, 0)
INSERT [dbo].[Customer] ([Id], [Name], [UserName], [Password], [Gender], [Address], [Email], [Phone], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Status], [IsDeleted]) VALUES (5, N'Phạm Xuân Quỳnh', N'4', NULL, 0, NULL, N'quynhpham123@gmail.com', N'0989897115', CAST(N'2021-05-17T19:52:37.483' AS DateTime), N'admin', CAST(N'2021-05-17T19:54:18.050' AS DateTime), N'admin', 1, 0)
INSERT [dbo].[Customer] ([Id], [Name], [UserName], [Password], [Gender], [Address], [Email], [Phone], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Status], [IsDeleted]) VALUES (6, N'Tôn Thu Trang', N'5', NULL, 0, NULL, N'trangton098@gmail.com', N'0856799228', CAST(N'2021-05-17T19:53:07.510' AS DateTime), N'admin', NULL, NULL, 1, 0)
INSERT [dbo].[Customer] ([Id], [Name], [UserName], [Password], [Gender], [Address], [Email], [Phone], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Status], [IsDeleted]) VALUES (7, N'Hồng Đức', NULL, NULL, NULL, N'nhân hòa', N'maihongduc0957@gmail.com', N'0326437333', CAST(N'2021-05-21T15:12:34.493' AS DateTime), NULL, NULL, NULL, 1, 0)
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([Id], [AdminId], [CustomerId], [Note], [CreatedDate], [UpdatedBy], [UpdatedDate], [Status], [IsDeleted]) VALUES (1, 1, 2, N'chung', CAST(N'2021-02-06T16:12:44.147' AS DateTime), NULL, NULL, 0, 1)
INSERT [dbo].[Order] ([Id], [AdminId], [CustomerId], [Note], [CreatedDate], [UpdatedBy], [UpdatedDate], [Status], [IsDeleted]) VALUES (2, 2, 1, N'chung', CAST(N'2021-02-06T16:12:54.307' AS DateTime), N'admin', CAST(N'2021-05-19T09:34:39.857' AS DateTime), 0, 0)
INSERT [dbo].[Order] ([Id], [AdminId], [CustomerId], [Note], [CreatedDate], [UpdatedBy], [UpdatedDate], [Status], [IsDeleted]) VALUES (3, 1, 2, N'cccc', CAST(N'2021-02-07T00:11:27.177' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[Order] ([Id], [AdminId], [CustomerId], [Note], [CreatedDate], [UpdatedBy], [UpdatedDate], [Status], [IsDeleted]) VALUES (6, NULL, 2, NULL, CAST(N'2021-02-18T19:43:22.960' AS DateTime), NULL, NULL, 1, 1)
INSERT [dbo].[Order] ([Id], [AdminId], [CustomerId], [Note], [CreatedDate], [UpdatedBy], [UpdatedDate], [Status], [IsDeleted]) VALUES (7, NULL, 2, NULL, CAST(N'2021-02-18T19:44:28.323' AS DateTime), NULL, NULL, 1, 1)
INSERT [dbo].[Order] ([Id], [AdminId], [CustomerId], [Note], [CreatedDate], [UpdatedBy], [UpdatedDate], [Status], [IsDeleted]) VALUES (8, NULL, 2, NULL, CAST(N'2021-02-18T19:44:35.590' AS DateTime), NULL, NULL, 1, 1)
INSERT [dbo].[Order] ([Id], [AdminId], [CustomerId], [Note], [CreatedDate], [UpdatedBy], [UpdatedDate], [Status], [IsDeleted]) VALUES (9, 1, 2, NULL, CAST(N'2021-02-18T19:46:17.903' AS DateTime), N'Khuất Văn Chung ', CAST(N'2021-02-18T19:53:49.470' AS DateTime), 0, 1)
INSERT [dbo].[Order] ([Id], [AdminId], [CustomerId], [Note], [CreatedDate], [UpdatedBy], [UpdatedDate], [Status], [IsDeleted]) VALUES (10, 2, 2, NULL, CAST(N'2021-02-18T19:49:57.250' AS DateTime), N'admin', CAST(N'2021-05-19T09:34:54.843' AS DateTime), 1, 0)
INSERT [dbo].[Order] ([Id], [AdminId], [CustomerId], [Note], [CreatedDate], [UpdatedBy], [UpdatedDate], [Status], [IsDeleted]) VALUES (11, NULL, 3, NULL, CAST(N'2021-05-13T22:43:45.543' AS DateTime), NULL, NULL, 1, 1)
INSERT [dbo].[Order] ([Id], [AdminId], [CustomerId], [Note], [CreatedDate], [UpdatedBy], [UpdatedDate], [Status], [IsDeleted]) VALUES (12, 2, 3, NULL, CAST(N'2021-05-13T22:45:48.070' AS DateTime), N'admin', CAST(N'2021-05-17T19:59:21.507' AS DateTime), 1, 0)
INSERT [dbo].[Order] ([Id], [AdminId], [CustomerId], [Note], [CreatedDate], [UpdatedBy], [UpdatedDate], [Status], [IsDeleted]) VALUES (13, 2, 4, NULL, CAST(N'2021-05-13T22:47:35.397' AS DateTime), N'admin', CAST(N'2021-05-17T16:37:18.907' AS DateTime), 0, 0)
INSERT [dbo].[Order] ([Id], [AdminId], [CustomerId], [Note], [CreatedDate], [UpdatedBy], [UpdatedDate], [Status], [IsDeleted]) VALUES (14, NULL, 7, NULL, CAST(N'2021-05-21T15:12:51.210' AS DateTime), NULL, NULL, 1, 1)
INSERT [dbo].[Order] ([Id], [AdminId], [CustomerId], [Note], [CreatedDate], [UpdatedBy], [UpdatedDate], [Status], [IsDeleted]) VALUES (15, NULL, 7, NULL, CAST(N'2021-05-21T15:13:58.540' AS DateTime), NULL, NULL, 1, 1)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Stock], [Price]) VALUES (1, 1, 1, 1, CAST(100000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Stock], [Price]) VALUES (2, 1, 2, 1, CAST(1111 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Stock], [Price]) VALUES (7, 2, 1, 1, CAST(100000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Stock], [Price]) VALUES (8, 2, 2, 1, CAST(1111 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Stock], [Price]) VALUES (9, 3, 1, 1, CAST(100000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Stock], [Price]) VALUES (10, 3, 1, 1, CAST(100000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Stock], [Price]) VALUES (11, 3, 1, 1, CAST(100000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Stock], [Price]) VALUES (12, 3, 1, 1, CAST(100000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Stock], [Price]) VALUES (13, 3, 1, 1, CAST(100000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Stock], [Price]) VALUES (14, 3, 1, 1, CAST(100000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Stock], [Price]) VALUES (15, 3, 1, 1, CAST(100000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Stock], [Price]) VALUES (16, 3, 1, 1, CAST(100000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Stock], [Price]) VALUES (17, 3, 1, 1, CAST(100000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Stock], [Price]) VALUES (18, 3, 1, 1, CAST(100000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Stock], [Price]) VALUES (19, 3, 2, 3, CAST(1111 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Stock], [Price]) VALUES (24, 6, NULL, 1, NULL)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Stock], [Price]) VALUES (25, 6, NULL, 1, NULL)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Stock], [Price]) VALUES (26, 7, NULL, 1, NULL)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Stock], [Price]) VALUES (27, 7, NULL, 1, NULL)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Stock], [Price]) VALUES (28, 8, 12, 1, CAST(1000000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Stock], [Price]) VALUES (29, 8, 12, 1, CAST(1000000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Stock], [Price]) VALUES (32, 10, 12, 1, CAST(1000000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Stock], [Price]) VALUES (33, 10, 10, 1, CAST(1000000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Stock], [Price]) VALUES (36, 9, 12, 1, CAST(1000000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Stock], [Price]) VALUES (37, 9, 12, 1, CAST(1000000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Stock], [Price]) VALUES (38, 11, 23, 1, CAST(50000000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Stock], [Price]) VALUES (43, 13, 21, 2, CAST(5000000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Stock], [Price]) VALUES (44, 12, 23, 1, CAST(50000000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Stock], [Price]) VALUES (45, 12, 20, 1, CAST(7000000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Stock], [Price]) VALUES (46, 14, 26, 1, CAST(8600000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Stock], [Price]) VALUES (47, 15, 26, 1, CAST(8600000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Stock], [Price]) VALUES (48, 15, 26, 100, CAST(8600000 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Id], [Code], [Name], [Image], [Slug], [CategoryId], [Price], [Description], [Content], [OrderBy], [Stock], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Status], [IsDeleted]) VALUES (19, N'DHA', N'Curnon ', N'/Content/Upload/news/serene.png', N'curnon-', 39, CAST(20000000 AS Decimal(19, 0)), N'<p>Chống nước 3ATM</p>
', NULL, 4, 20, CAST(N'2021-05-13T12:35:12.150' AS DateTime), N'admin', CAST(N'2021-05-13T22:40:28.720' AS DateTime), N'admin', 1, 1)
INSERT [dbo].[Product] ([Id], [Code], [Name], [Image], [Slug], [CategoryId], [Price], [Description], [Content], [OrderBy], [Stock], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Status], [IsDeleted]) VALUES (20, N'DH001', N'Đồng hồ chống nước', N'/Content/Upload/news/6mile-01_1.png', N'dong-ho-chong-nuoc', 39, NULL, N'<p>D&acirc;y Cao Su&nbsp;</p>

<p>Chống Nước</p>

<p>Automatic</p>
', NULL, 1, 55, CAST(N'2021-05-13T12:41:36.453' AS DateTime), N'admin', CAST(N'2021-05-17T20:04:52.950' AS DateTime), N'admin', 1, 1)
INSERT [dbo].[Product] ([Id], [Code], [Name], [Image], [Slug], [CategoryId], [Price], [Description], [Content], [OrderBy], [Stock], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Status], [IsDeleted]) VALUES (21, N'DH01', N'Katana', N'/Content/Upload/news/serene.png', N'katana', 39, CAST(5000000 AS Decimal(19, 0)), N'<p>aaaaaaaaaaaaaaaaaaaaaaaaaa</p>
', NULL, 1, 50, CAST(N'2021-05-13T22:32:11.970' AS DateTime), N'admin', NULL, NULL, 1, 1)
INSERT [dbo].[Product] ([Id], [Code], [Name], [Image], [Slug], [CategoryId], [Price], [Description], [Content], [OrderBy], [Stock], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Status], [IsDeleted]) VALUES (22, N'dh02', N'Đồng hồ dây kim lại', N'/Content/Upload/news/6mile-01_1.png', N'dong-ho-day-kim-lai', 40, CAST(3300000 AS Decimal(19, 0)), N'<p>aaaaa</p>
', NULL, 4, 52, CAST(N'2021-05-13T22:38:48.480' AS DateTime), N'admin', NULL, NULL, 1, 1)
INSERT [dbo].[Product] ([Id], [Code], [Name], [Image], [Slug], [CategoryId], [Price], [Description], [Content], [OrderBy], [Stock], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Status], [IsDeleted]) VALUES (23, N'11', N'AMILY', N'/Content/Upload/news/autumn_1.png', N'amily', 41, CAST(50000000 AS Decimal(19, 0)), N'<p>aaaaaaa</p>
', NULL, 4, 50, CAST(N'2021-05-13T22:39:24.433' AS DateTime), N'admin', NULL, NULL, 1, 1)
INSERT [dbo].[Product] ([Id], [Code], [Name], [Image], [Slug], [CategoryId], [Price], [Description], [Content], [OrderBy], [Stock], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Status], [IsDeleted]) VALUES (24, N'DH.001', N'Curnon XI', N'/Content/Upload/news/6mile-01_1.png', N'curnon-xi', 39, CAST(9000000 AS Decimal(19, 0)), N'<p>D&acirc;y cao su</p>

<p>Chống nước</p>

<p>Automatic</p>
', NULL, 1, 99, CAST(N'2021-05-17T20:06:21.667' AS DateTime), N'admin', CAST(N'2021-05-17T20:26:05.563' AS DateTime), N'admin', 1, 0)
INSERT [dbo].[Product] ([Id], [Code], [Name], [Image], [Slug], [CategoryId], [Price], [Description], [Content], [OrderBy], [Stock], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Status], [IsDeleted]) VALUES (25, N'DH.002', N'Curnon I', N'/Content/Upload/news/t1_fix_color-fix_1_(1).png', N'curnon-i', 39, CAST(8000000 AS Decimal(19, 0)), N'<p>D&acirc;y sắt</p>

<p>Chống nước</p>

<p>Automatic</p>
', NULL, 2, 99, CAST(N'2021-05-17T20:10:03.200' AS DateTime), N'admin', CAST(N'2021-05-17T20:16:28.767' AS DateTime), N'admin', 1, 0)
INSERT [dbo].[Product] ([Id], [Code], [Name], [Image], [Slug], [CategoryId], [Price], [Description], [Content], [OrderBy], [Stock], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Status], [IsDeleted]) VALUES (26, N'DH.003', N'Curnon IV', N'/Content/Upload/news/t5-3-min.png', N'curnon-iv', 39, CAST(8600000 AS Decimal(19, 0)), N'<p>D&acirc;y da</p>

<p>Chống nước</p>

<p>Automatic</p>
', NULL, 3, 99, CAST(N'2021-05-17T20:11:32.143' AS DateTime), N'admin', CAST(N'2021-05-17T20:26:15.237' AS DateTime), N'admin', 1, 0)
INSERT [dbo].[Product] ([Id], [Code], [Name], [Image], [Slug], [CategoryId], [Price], [Description], [Content], [OrderBy], [Stock], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Status], [IsDeleted]) VALUES (27, N'DH.004', N'Curnon X', N'/Content/Upload/news/t4_fix_color-fix_1_.png', N'curnon-x', 39, CAST(7900000 AS Decimal(19, 0)), N'<p>Chống nước</p>

<p>Quai mềm</p>

<p>Automatic</p>
', NULL, 4, 99, CAST(N'2021-05-17T20:13:30.317' AS DateTime), N'admin', CAST(N'2021-05-17T20:26:23.410' AS DateTime), N'admin', 1, 0)
INSERT [dbo].[Product] ([Id], [Code], [Name], [Image], [Slug], [CategoryId], [Price], [Description], [Content], [OrderBy], [Stock], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Status], [IsDeleted]) VALUES (28, N'DH.005', N'Curnon V', N'/Content/Upload/news/autumn_1.png', N'curnon-v', 40, CAST(9800000 AS Decimal(19, 0)), N'<p>Automatic</p>

<p>Chống nước</p>
', NULL, 5, 99, CAST(N'2021-05-17T20:18:11.027' AS DateTime), N'admin', CAST(N'2021-05-17T20:26:29.590' AS DateTime), N'admin', 1, 0)
INSERT [dbo].[Product] ([Id], [Code], [Name], [Image], [Slug], [CategoryId], [Price], [Description], [Content], [OrderBy], [Stock], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Status], [IsDeleted]) VALUES (29, N'DH.006', N'Curnon IX', N'/Content/Upload/news/cora.1.png', N'curnon-ix', 40, CAST(5700000 AS Decimal(19, 0)), N'<p>Automatic</p>

<p>Chống nước</p>
', NULL, 6, 99, CAST(N'2021-05-17T20:19:24.270' AS DateTime), N'admin', CAST(N'2021-05-17T20:26:37.273' AS DateTime), N'admin', 1, 0)
INSERT [dbo].[Product] ([Id], [Code], [Name], [Image], [Slug], [CategoryId], [Price], [Description], [Content], [OrderBy], [Stock], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Status], [IsDeleted]) VALUES (30, N'DH.007', N'Curnon 7', N'/Content/Upload/news/serene.png', N'curnon-7', 40, CAST(4700000 AS Decimal(19, 0)), N'<p>Automatic</p>

<p>Chống nước</p>

<p>D&acirc;y kim loại</p>
', NULL, 7, 99, CAST(N'2021-05-17T20:21:49.847' AS DateTime), N'admin', CAST(N'2021-05-17T20:26:42.940' AS DateTime), N'admin', 1, 0)
INSERT [dbo].[Product] ([Id], [Code], [Name], [Image], [Slug], [CategoryId], [Price], [Description], [Content], [OrderBy], [Stock], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Status], [IsDeleted]) VALUES (31, N'ACS.001', N'Accessories 1', N'/Content/Upload/news/MenCuff-1.jpg', N'accessories-1', 41, CAST(100000 AS Decimal(19, 0)), N'<p>V&ograve;ng tay</p>
', NULL, 10, 99, CAST(N'2021-05-17T20:23:19.107' AS DateTime), N'admin', NULL, NULL, 1, 1)
INSERT [dbo].[Product] ([Id], [Code], [Name], [Image], [Slug], [CategoryId], [Price], [Description], [Content], [OrderBy], [Stock], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Status], [IsDeleted]) VALUES (32, N'ACS.001', N'Accessories 1', N'/Content/Upload/news/MenCuff-1.jpg', N'accessories-1', 41, CAST(100000 AS Decimal(19, 0)), N'<p>V&ograve;ng tay</p>
', NULL, 10, 99, CAST(N'2021-05-17T20:23:40.657' AS DateTime), N'admin', NULL, NULL, 1, 1)
INSERT [dbo].[Product] ([Id], [Code], [Name], [Image], [Slug], [CategoryId], [Price], [Description], [Content], [OrderBy], [Stock], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Status], [IsDeleted]) VALUES (33, N'DH.008', N'Curnon VII', N'/Content/Upload/news/cora.1.png', N'curnon-vii', 40, CAST(7800000 AS Decimal(19, 0)), N'<p>Automatic</p>

<p>Chống nước</p>
', NULL, 8, 99, CAST(N'2021-05-17T20:25:30.507' AS DateTime), N'admin', CAST(N'2021-05-17T20:28:19.057' AS DateTime), N'admin', 1, 0)
INSERT [dbo].[Product] ([Id], [Code], [Name], [Image], [Slug], [CategoryId], [Price], [Description], [Content], [OrderBy], [Stock], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Status], [IsDeleted]) VALUES (34, N'ACS.001', N'Phụ Kiện ', N'/Content/Upload/news/WomenCuffs.jpg', N'phu-kien-', 41, CAST(150000 AS Decimal(19, 0)), N'<p>Kim Loại</p>
', NULL, 10, 99, CAST(N'2021-05-17T20:33:23.940' AS DateTime), N'admin', NULL, NULL, 1, 1)
INSERT [dbo].[Product] ([Id], [Code], [Name], [Image], [Slug], [CategoryId], [Price], [Description], [Content], [OrderBy], [Stock], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Status], [IsDeleted]) VALUES (35, N'1', N'1', N'/Content/Upload/news/about-us-wmP.jpg', N'1', 39, CAST(1111111 AS Decimal(19, 0)), NULL, NULL, 1, 11, CAST(N'2021-05-24T09:13:02.290' AS DateTime), N'admin', NULL, NULL, 1, 1)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Product_Image] ON 

INSERT [dbo].[Product_Image] ([Id], [ProductId], [Image]) VALUES (21, 4, N'/Content/Upload/product/Screenshot%20(2).png')
INSERT [dbo].[Product_Image] ([Id], [ProductId], [Image]) VALUES (25, 1, N'/Content/Upload/product/552581fd9b556b0b3244.jpg')
INSERT [dbo].[Product_Image] ([Id], [ProductId], [Image]) VALUES (26, 1, N'/Content/Upload/product/Screenshot%20(2).png')
INSERT [dbo].[Product_Image] ([Id], [ProductId], [Image]) VALUES (27, 1, N'/Content/Upload/product/552581fd9b556b0b3244.jpg')
INSERT [dbo].[Product_Image] ([Id], [ProductId], [Image]) VALUES (28, 7, N'/Content/Upload/product/636995949380038633-chan-vay.jpg')
INSERT [dbo].[Product_Image] ([Id], [ProductId], [Image]) VALUES (29, 7, N'/Content/Upload/product/637081193496541818-DSC09555.jpg')
INSERT [dbo].[Product_Image] ([Id], [ProductId], [Image]) VALUES (30, 7, N'/Content/Upload/product/637081194382012274-DSC09377.jpg')
INSERT [dbo].[Product_Image] ([Id], [ProductId], [Image]) VALUES (31, 8, N'/Content/Upload/product/636995949380038633-chan-vay.jpg')
INSERT [dbo].[Product_Image] ([Id], [ProductId], [Image]) VALUES (32, 8, N'/Content/Upload/product/637081193496541818-DSC09555.jpg')
INSERT [dbo].[Product_Image] ([Id], [ProductId], [Image]) VALUES (33, 8, N'/Content/Upload/product/637081194382012274-DSC09377.jpg')
INSERT [dbo].[Product_Image] ([Id], [ProductId], [Image]) VALUES (34, 8, N'/Content/Upload/product/637081195078263748-DSC09308.jpg')
INSERT [dbo].[Product_Image] ([Id], [ProductId], [Image]) VALUES (35, 9, N'/Content/Upload/product/636995949380038633-chan-vay.jpg')
INSERT [dbo].[Product_Image] ([Id], [ProductId], [Image]) VALUES (36, 9, N'/Content/Upload/product/637081193496541818-DSC09555.jpg')
INSERT [dbo].[Product_Image] ([Id], [ProductId], [Image]) VALUES (37, 9, N'/Content/Upload/product/637081194382012274-DSC09377.jpg')
INSERT [dbo].[Product_Image] ([Id], [ProductId], [Image]) VALUES (38, 9, N'/Content/Upload/product/637081195078263748-DSC09308.jpg')
INSERT [dbo].[Product_Image] ([Id], [ProductId], [Image]) VALUES (39, 10, N'/Content/Upload/product/636995949380038633-chan-vay.jpg')
INSERT [dbo].[Product_Image] ([Id], [ProductId], [Image]) VALUES (40, 10, N'/Content/Upload/product/637081193496541818-DSC09555.jpg')
INSERT [dbo].[Product_Image] ([Id], [ProductId], [Image]) VALUES (41, 10, N'/Content/Upload/product/637081194382012274-DSC09377.jpg')
INSERT [dbo].[Product_Image] ([Id], [ProductId], [Image]) VALUES (42, 10, N'/Content/Upload/product/637081195078263748-DSC09308.jpg')
INSERT [dbo].[Product_Image] ([Id], [ProductId], [Image]) VALUES (43, 11, N'/Content/Upload/product/636995949380038633-chan-vay.jpg')
INSERT [dbo].[Product_Image] ([Id], [ProductId], [Image]) VALUES (44, 11, N'/Content/Upload/product/637081193496541818-DSC09555.jpg')
INSERT [dbo].[Product_Image] ([Id], [ProductId], [Image]) VALUES (45, 11, N'/Content/Upload/product/637081194382012274-DSC09377.jpg')
INSERT [dbo].[Product_Image] ([Id], [ProductId], [Image]) VALUES (46, 11, N'/Content/Upload/product/637081195078263748-DSC09308.jpg')
INSERT [dbo].[Product_Image] ([Id], [ProductId], [Image]) VALUES (47, 12, N'/Content/Upload/product/636995949380038633-chan-vay.jpg')
INSERT [dbo].[Product_Image] ([Id], [ProductId], [Image]) VALUES (48, 12, N'/Content/Upload/product/637081193496541818-DSC09555.jpg')
INSERT [dbo].[Product_Image] ([Id], [ProductId], [Image]) VALUES (49, 12, N'/Content/Upload/product/637081194382012274-DSC09377.jpg')
INSERT [dbo].[Product_Image] ([Id], [ProductId], [Image]) VALUES (50, 12, N'/Content/Upload/product/637081195078263748-DSC09308.jpg')
INSERT [dbo].[Product_Image] ([Id], [ProductId], [Image]) VALUES (51, 13, N'/Content/Upload/product/636995949380038633-chan-vay.jpg')
INSERT [dbo].[Product_Image] ([Id], [ProductId], [Image]) VALUES (52, 13, N'/Content/Upload/product/637081193496541818-DSC09555.jpg')
INSERT [dbo].[Product_Image] ([Id], [ProductId], [Image]) VALUES (53, 13, N'/Content/Upload/product/637081194382012274-DSC09377.jpg')
INSERT [dbo].[Product_Image] ([Id], [ProductId], [Image]) VALUES (54, 13, N'/Content/Upload/product/637081195078263748-DSC09308.jpg')
INSERT [dbo].[Product_Image] ([Id], [ProductId], [Image]) VALUES (55, 14, N'/Content/Upload/product/636995949380038633-chan-vay.jpg')
INSERT [dbo].[Product_Image] ([Id], [ProductId], [Image]) VALUES (56, 14, N'/Content/Upload/product/637081193496541818-DSC09555.jpg')
INSERT [dbo].[Product_Image] ([Id], [ProductId], [Image]) VALUES (57, 14, N'/Content/Upload/product/637081194382012274-DSC09377.jpg')
INSERT [dbo].[Product_Image] ([Id], [ProductId], [Image]) VALUES (58, 14, N'/Content/Upload/product/637081195078263748-DSC09308.jpg')
INSERT [dbo].[Product_Image] ([Id], [ProductId], [Image]) VALUES (59, 15, N'/Content/Upload/product/636995949380038633-chan-vay.jpg')
INSERT [dbo].[Product_Image] ([Id], [ProductId], [Image]) VALUES (60, 15, N'/Content/Upload/product/637081193496541818-DSC09555.jpg')
INSERT [dbo].[Product_Image] ([Id], [ProductId], [Image]) VALUES (61, 15, N'/Content/Upload/product/637081194382012274-DSC09377.jpg')
INSERT [dbo].[Product_Image] ([Id], [ProductId], [Image]) VALUES (62, 15, N'/Content/Upload/product/637081195078263748-DSC09308.jpg')
INSERT [dbo].[Product_Image] ([Id], [ProductId], [Image]) VALUES (63, 16, N'/Content/Upload/product/636995949380038633-chan-vay.jpg')
INSERT [dbo].[Product_Image] ([Id], [ProductId], [Image]) VALUES (64, 16, N'/Content/Upload/product/637081193496541818-DSC09555.jpg')
INSERT [dbo].[Product_Image] ([Id], [ProductId], [Image]) VALUES (65, 16, N'/Content/Upload/product/637081194382012274-DSC09377.jpg')
INSERT [dbo].[Product_Image] ([Id], [ProductId], [Image]) VALUES (66, 16, N'/Content/Upload/product/637081195078263748-DSC09308.jpg')
INSERT [dbo].[Product_Image] ([Id], [ProductId], [Image]) VALUES (67, 17, N'/Content/Upload/product/636995949380038633-chan-vay.jpg')
INSERT [dbo].[Product_Image] ([Id], [ProductId], [Image]) VALUES (68, 17, N'/Content/Upload/product/637081193496541818-DSC09555.jpg')
INSERT [dbo].[Product_Image] ([Id], [ProductId], [Image]) VALUES (69, 17, N'/Content/Upload/product/637081194382012274-DSC09377.jpg')
INSERT [dbo].[Product_Image] ([Id], [ProductId], [Image]) VALUES (70, 17, N'/Content/Upload/product/637081195078263748-DSC09308.jpg')
INSERT [dbo].[Product_Image] ([Id], [ProductId], [Image]) VALUES (75, 21, N'/Content/Upload/news/autumn_1.png')
INSERT [dbo].[Product_Image] ([Id], [ProductId], [Image]) VALUES (76, 21, N'/Content/Upload/news/autumn_1.png')
INSERT [dbo].[Product_Image] ([Id], [ProductId], [Image]) VALUES (77, 21, N'/Content/Upload/news/autumn_1.png')
INSERT [dbo].[Product_Image] ([Id], [ProductId], [Image]) VALUES (78, 22, N'/Content/Upload/news/black_s_1.png')
INSERT [dbo].[Product_Image] ([Id], [ProductId], [Image]) VALUES (79, 22, N'/Content/Upload/news/black_s_1.png')
INSERT [dbo].[Product_Image] ([Id], [ProductId], [Image]) VALUES (80, 22, N'/Content/Upload/news/autumn_1.png')
INSERT [dbo].[Product_Image] ([Id], [ProductId], [Image]) VALUES (81, 19, N'/Content/Upload/news/ssblack.png')
INSERT [dbo].[Product_Image] ([Id], [ProductId], [Image]) VALUES (82, 19, N'/Content/Upload/news/black_s_1.png')
INSERT [dbo].[Product_Image] ([Id], [ProductId], [Image]) VALUES (85, 20, N'/Content/Upload/news/Florenge_2000px_1x1_1.png')
INSERT [dbo].[Product_Image] ([Id], [ProductId], [Image]) VALUES (97, 25, N'/Content/Upload/news/Beverly_2000px_1x1.png')
INSERT [dbo].[Product_Image] ([Id], [ProductId], [Image]) VALUES (98, 25, N'/Content/Upload/news/logo-mWb(1).png')
INSERT [dbo].[Product_Image] ([Id], [ProductId], [Image]) VALUES (109, 24, N'/Content/Upload/news/Moraine_2000px_1x1.png')
INSERT [dbo].[Product_Image] ([Id], [ProductId], [Image]) VALUES (110, 24, N'/Content/Upload/news/logo_small-2Xe.png')
INSERT [dbo].[Product_Image] ([Id], [ProductId], [Image]) VALUES (111, 26, N'/Content/Upload/news/Beverly_2000px_1x1.png')
INSERT [dbo].[Product_Image] ([Id], [ProductId], [Image]) VALUES (112, 26, N'/Content/Upload/news/logo-mWb.png')
INSERT [dbo].[Product_Image] ([Id], [ProductId], [Image]) VALUES (113, 27, N'/Content/Upload/news/Weimar_2000px_1x1.png')
INSERT [dbo].[Product_Image] ([Id], [ProductId], [Image]) VALUES (114, 27, N'/Content/Upload/news/logo-mWb.png')
INSERT [dbo].[Product_Image] ([Id], [ProductId], [Image]) VALUES (115, 28, N'/Content/Upload/news/Florenge_2000px_1x1_1.png')
INSERT [dbo].[Product_Image] ([Id], [ProductId], [Image]) VALUES (116, 28, N'/Content/Upload/news/logo-mWb(1).png')
INSERT [dbo].[Product_Image] ([Id], [ProductId], [Image]) VALUES (117, 29, N'/Content/Upload/news/Hamilton_2000px_1x1.png')
INSERT [dbo].[Product_Image] ([Id], [ProductId], [Image]) VALUES (118, 29, N'/Content/Upload/news/logo-mWb(1).png')
INSERT [dbo].[Product_Image] ([Id], [ProductId], [Image]) VALUES (119, 30, N'/Content/Upload/news/Florenge_2000px_1x1_1.png')
INSERT [dbo].[Product_Image] ([Id], [ProductId], [Image]) VALUES (120, 30, N'/Content/Upload/news/logo-mWb(1).png')
INSERT [dbo].[Product_Image] ([Id], [ProductId], [Image]) VALUES (121, 33, N'/Content/Upload/news/Mykonos_2000px_1x1.png')
INSERT [dbo].[Product_Image] ([Id], [ProductId], [Image]) VALUES (122, 33, N'/Content/Upload/news/logo_small-2Xe.png')
SET IDENTITY_INSERT [dbo].[Product_Image] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductSize] ON 

INSERT [dbo].[ProductSize] ([Id], [ProductId], [Size]) VALUES (8, 5, 2)
INSERT [dbo].[ProductSize] ([Id], [ProductId], [Size]) VALUES (9, 5, 5)
INSERT [dbo].[ProductSize] ([Id], [ProductId], [Size]) VALUES (10, 5, 7)
INSERT [dbo].[ProductSize] ([Id], [ProductId], [Size]) VALUES (33, 4, 2)
INSERT [dbo].[ProductSize] ([Id], [ProductId], [Size]) VALUES (34, 4, 3)
INSERT [dbo].[ProductSize] ([Id], [ProductId], [Size]) VALUES (35, 4, 5)
INSERT [dbo].[ProductSize] ([Id], [ProductId], [Size]) VALUES (39, 2, 1)
INSERT [dbo].[ProductSize] ([Id], [ProductId], [Size]) VALUES (40, 2, 2)
INSERT [dbo].[ProductSize] ([Id], [ProductId], [Size]) VALUES (41, 2, 3)
INSERT [dbo].[ProductSize] ([Id], [ProductId], [Size]) VALUES (42, 2, 4)
INSERT [dbo].[ProductSize] ([Id], [ProductId], [Size]) VALUES (43, 2, 5)
INSERT [dbo].[ProductSize] ([Id], [ProductId], [Size]) VALUES (44, 2, 6)
INSERT [dbo].[ProductSize] ([Id], [ProductId], [Size]) VALUES (45, 2, 7)
INSERT [dbo].[ProductSize] ([Id], [ProductId], [Size]) VALUES (46, 1, 2)
INSERT [dbo].[ProductSize] ([Id], [ProductId], [Size]) VALUES (47, 1, 3)
INSERT [dbo].[ProductSize] ([Id], [ProductId], [Size]) VALUES (48, 1, 4)
INSERT [dbo].[ProductSize] ([Id], [ProductId], [Size]) VALUES (49, 7, 2)
INSERT [dbo].[ProductSize] ([Id], [ProductId], [Size]) VALUES (50, 7, 4)
INSERT [dbo].[ProductSize] ([Id], [ProductId], [Size]) VALUES (51, 7, 6)
INSERT [dbo].[ProductSize] ([Id], [ProductId], [Size]) VALUES (52, 8, 2)
INSERT [dbo].[ProductSize] ([Id], [ProductId], [Size]) VALUES (53, 8, 4)
INSERT [dbo].[ProductSize] ([Id], [ProductId], [Size]) VALUES (54, 8, 6)
INSERT [dbo].[ProductSize] ([Id], [ProductId], [Size]) VALUES (55, 9, 2)
INSERT [dbo].[ProductSize] ([Id], [ProductId], [Size]) VALUES (56, 9, 4)
INSERT [dbo].[ProductSize] ([Id], [ProductId], [Size]) VALUES (57, 9, 6)
INSERT [dbo].[ProductSize] ([Id], [ProductId], [Size]) VALUES (58, 10, 2)
INSERT [dbo].[ProductSize] ([Id], [ProductId], [Size]) VALUES (59, 10, 4)
INSERT [dbo].[ProductSize] ([Id], [ProductId], [Size]) VALUES (60, 10, 6)
INSERT [dbo].[ProductSize] ([Id], [ProductId], [Size]) VALUES (61, 11, 2)
INSERT [dbo].[ProductSize] ([Id], [ProductId], [Size]) VALUES (62, 11, 4)
INSERT [dbo].[ProductSize] ([Id], [ProductId], [Size]) VALUES (63, 11, 6)
INSERT [dbo].[ProductSize] ([Id], [ProductId], [Size]) VALUES (64, 12, 2)
INSERT [dbo].[ProductSize] ([Id], [ProductId], [Size]) VALUES (65, 12, 4)
INSERT [dbo].[ProductSize] ([Id], [ProductId], [Size]) VALUES (66, 12, 6)
INSERT [dbo].[ProductSize] ([Id], [ProductId], [Size]) VALUES (67, 13, 2)
INSERT [dbo].[ProductSize] ([Id], [ProductId], [Size]) VALUES (68, 13, 4)
INSERT [dbo].[ProductSize] ([Id], [ProductId], [Size]) VALUES (69, 13, 6)
INSERT [dbo].[ProductSize] ([Id], [ProductId], [Size]) VALUES (70, 14, 2)
INSERT [dbo].[ProductSize] ([Id], [ProductId], [Size]) VALUES (71, 14, 4)
INSERT [dbo].[ProductSize] ([Id], [ProductId], [Size]) VALUES (72, 14, 6)
INSERT [dbo].[ProductSize] ([Id], [ProductId], [Size]) VALUES (73, 15, 2)
INSERT [dbo].[ProductSize] ([Id], [ProductId], [Size]) VALUES (74, 15, 4)
INSERT [dbo].[ProductSize] ([Id], [ProductId], [Size]) VALUES (75, 15, 6)
INSERT [dbo].[ProductSize] ([Id], [ProductId], [Size]) VALUES (76, 16, 2)
INSERT [dbo].[ProductSize] ([Id], [ProductId], [Size]) VALUES (77, 16, 4)
INSERT [dbo].[ProductSize] ([Id], [ProductId], [Size]) VALUES (78, 16, 6)
INSERT [dbo].[ProductSize] ([Id], [ProductId], [Size]) VALUES (79, 17, 2)
INSERT [dbo].[ProductSize] ([Id], [ProductId], [Size]) VALUES (80, 17, 4)
INSERT [dbo].[ProductSize] ([Id], [ProductId], [Size]) VALUES (81, 17, 6)
INSERT [dbo].[ProductSize] ([Id], [ProductId], [Size]) VALUES (87, 21, 8)
INSERT [dbo].[ProductSize] ([Id], [ProductId], [Size]) VALUES (88, 21, 9)
INSERT [dbo].[ProductSize] ([Id], [ProductId], [Size]) VALUES (89, 22, 9)
INSERT [dbo].[ProductSize] ([Id], [ProductId], [Size]) VALUES (90, 22, 11)
INSERT [dbo].[ProductSize] ([Id], [ProductId], [Size]) VALUES (91, 23, 10)
INSERT [dbo].[ProductSize] ([Id], [ProductId], [Size]) VALUES (92, 23, 11)
INSERT [dbo].[ProductSize] ([Id], [ProductId], [Size]) VALUES (96, 19, 8)
INSERT [dbo].[ProductSize] ([Id], [ProductId], [Size]) VALUES (97, 19, 9)
INSERT [dbo].[ProductSize] ([Id], [ProductId], [Size]) VALUES (108, 20, 12)
INSERT [dbo].[ProductSize] ([Id], [ProductId], [Size]) VALUES (109, 20, 13)
INSERT [dbo].[ProductSize] ([Id], [ProductId], [Size]) VALUES (110, 20, 14)
INSERT [dbo].[ProductSize] ([Id], [ProductId], [Size]) VALUES (111, 20, 15)
INSERT [dbo].[ProductSize] ([Id], [ProductId], [Size]) VALUES (112, 20, 16)
INSERT [dbo].[ProductSize] ([Id], [ProductId], [Size]) VALUES (152, 25, 12)
INSERT [dbo].[ProductSize] ([Id], [ProductId], [Size]) VALUES (153, 25, 13)
INSERT [dbo].[ProductSize] ([Id], [ProductId], [Size]) VALUES (154, 25, 14)
INSERT [dbo].[ProductSize] ([Id], [ProductId], [Size]) VALUES (155, 25, 15)
INSERT [dbo].[ProductSize] ([Id], [ProductId], [Size]) VALUES (176, 31, 12)
INSERT [dbo].[ProductSize] ([Id], [ProductId], [Size]) VALUES (177, 31, 13)
INSERT [dbo].[ProductSize] ([Id], [ProductId], [Size]) VALUES (178, 32, 12)
INSERT [dbo].[ProductSize] ([Id], [ProductId], [Size]) VALUES (179, 32, 13)
INSERT [dbo].[ProductSize] ([Id], [ProductId], [Size]) VALUES (184, 24, 12)
INSERT [dbo].[ProductSize] ([Id], [ProductId], [Size]) VALUES (185, 24, 13)
INSERT [dbo].[ProductSize] ([Id], [ProductId], [Size]) VALUES (186, 24, 14)
INSERT [dbo].[ProductSize] ([Id], [ProductId], [Size]) VALUES (187, 24, 15)
INSERT [dbo].[ProductSize] ([Id], [ProductId], [Size]) VALUES (188, 26, 12)
INSERT [dbo].[ProductSize] ([Id], [ProductId], [Size]) VALUES (189, 26, 13)
INSERT [dbo].[ProductSize] ([Id], [ProductId], [Size]) VALUES (190, 26, 14)
INSERT [dbo].[ProductSize] ([Id], [ProductId], [Size]) VALUES (191, 26, 15)
INSERT [dbo].[ProductSize] ([Id], [ProductId], [Size]) VALUES (192, 27, 12)
INSERT [dbo].[ProductSize] ([Id], [ProductId], [Size]) VALUES (193, 27, 13)
INSERT [dbo].[ProductSize] ([Id], [ProductId], [Size]) VALUES (194, 27, 14)
INSERT [dbo].[ProductSize] ([Id], [ProductId], [Size]) VALUES (195, 27, 15)
INSERT [dbo].[ProductSize] ([Id], [ProductId], [Size]) VALUES (196, 28, 12)
INSERT [dbo].[ProductSize] ([Id], [ProductId], [Size]) VALUES (197, 28, 13)
INSERT [dbo].[ProductSize] ([Id], [ProductId], [Size]) VALUES (198, 28, 14)
INSERT [dbo].[ProductSize] ([Id], [ProductId], [Size]) VALUES (199, 28, 15)
INSERT [dbo].[ProductSize] ([Id], [ProductId], [Size]) VALUES (200, 29, 12)
INSERT [dbo].[ProductSize] ([Id], [ProductId], [Size]) VALUES (201, 29, 13)
INSERT [dbo].[ProductSize] ([Id], [ProductId], [Size]) VALUES (202, 29, 14)
INSERT [dbo].[ProductSize] ([Id], [ProductId], [Size]) VALUES (203, 29, 15)
INSERT [dbo].[ProductSize] ([Id], [ProductId], [Size]) VALUES (204, 30, 12)
INSERT [dbo].[ProductSize] ([Id], [ProductId], [Size]) VALUES (205, 30, 13)
INSERT [dbo].[ProductSize] ([Id], [ProductId], [Size]) VALUES (206, 30, 14)
INSERT [dbo].[ProductSize] ([Id], [ProductId], [Size]) VALUES (207, 30, 15)
INSERT [dbo].[ProductSize] ([Id], [ProductId], [Size]) VALUES (208, 33, 12)
INSERT [dbo].[ProductSize] ([Id], [ProductId], [Size]) VALUES (209, 33, 13)
INSERT [dbo].[ProductSize] ([Id], [ProductId], [Size]) VALUES (210, 33, 14)
INSERT [dbo].[ProductSize] ([Id], [ProductId], [Size]) VALUES (211, 33, 15)
INSERT [dbo].[ProductSize] ([Id], [ProductId], [Size]) VALUES (212, 34, 12)
GO
INSERT [dbo].[ProductSize] ([Id], [ProductId], [Size]) VALUES (213, 34, 13)
INSERT [dbo].[ProductSize] ([Id], [ProductId], [Size]) VALUES (214, 35, 12)
INSERT [dbo].[ProductSize] ([Id], [ProductId], [Size]) VALUES (215, 35, 13)
SET IDENTITY_INSERT [dbo].[ProductSize] OFF
GO
SET IDENTITY_INSERT [dbo].[Size] ON 

INSERT [dbo].[Size] ([Id], [Name]) VALUES (12, N'30mm')
INSERT [dbo].[Size] ([Id], [Name]) VALUES (13, N'35mm')
INSERT [dbo].[Size] ([Id], [Name]) VALUES (14, N'40mm')
INSERT [dbo].[Size] ([Id], [Name]) VALUES (15, N'45mm')
INSERT [dbo].[Size] ([Id], [Name]) VALUES (16, N'50mm')
SET IDENTITY_INSERT [dbo].[Size] OFF
GO
USE [master]
GO
ALTER DATABASE [WebShop] SET  READ_WRITE 
GO
