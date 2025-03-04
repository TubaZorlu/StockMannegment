USE [master]
GO
/****** Object:  Database [StockManagment]    Script Date: 27.09.2024 20:47:44 ******/
CREATE DATABASE [StockManagment]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'StockManagment', FILENAME = N'C:\Users\tuba.zorlu\StockManagment.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'StockManagment_log', FILENAME = N'C:\Users\tuba.zorlu\StockManagment_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [StockManagment] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StockManagment].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StockManagment] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [StockManagment] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [StockManagment] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [StockManagment] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [StockManagment] SET ARITHABORT OFF 
GO
ALTER DATABASE [StockManagment] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [StockManagment] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [StockManagment] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [StockManagment] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [StockManagment] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [StockManagment] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [StockManagment] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [StockManagment] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [StockManagment] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [StockManagment] SET  ENABLE_BROKER 
GO
ALTER DATABASE [StockManagment] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [StockManagment] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [StockManagment] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [StockManagment] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [StockManagment] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [StockManagment] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [StockManagment] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [StockManagment] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [StockManagment] SET  MULTI_USER 
GO
ALTER DATABASE [StockManagment] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [StockManagment] SET DB_CHAINING OFF 
GO
ALTER DATABASE [StockManagment] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [StockManagment] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [StockManagment] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [StockManagment] SET QUERY_STORE = OFF
GO
USE [StockManagment]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [StockManagment]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 27.09.2024 20:47:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](100) NOT NULL,
	[CreateDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
	[DeleteDate] [datetime] NULL,
	[Status] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Currency]    Script Date: 27.09.2024 20:47:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Currency](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CurrencyName] [nvarchar](50) NOT NULL,
	[ShortName] [nvarchar](10) NOT NULL,
	[Status] [int] NOT NULL,
	[Description] [nvarchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 27.09.2024 20:47:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gender](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[GenderName] [nvarchar](25) NOT NULL,
	[Status] [int] NOT NULL,
	[Description] [nvarchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 27.09.2024 20:47:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](100) NOT NULL,
	[CategoryID] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[CreateDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
	[DeleteDate] [datetime] NULL,
	[Description] [nvarchar](250) NULL,
	[SizeID] [int] NULL,
	[GenderID] [int] NULL,
	[CurrentStock] [float] NULL,
	[WarningQuantity] [float] NULL,
	[CurrentPrice] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCost]    Script Date: 27.09.2024 20:47:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCost](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CostPrice] [decimal](10, 2) NULL,
	[ProductID] [int] NOT NULL,
	[CurrencyID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductPrice]    Script Date: 27.09.2024 20:47:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductPrice](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Price] [decimal](10, 2) NULL,
	[ProductID] [int] NOT NULL,
	[CurrencyID] [int] NOT NULL,
	[PriceChancingDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Size]    Script Date: 27.09.2024 20:47:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Size](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SizeName] [nvarchar](100) NOT NULL,
	[ShortName] [nvarchar](100) NOT NULL,
	[Status] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stock_Enter]    Script Date: 27.09.2024 20:47:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stock_Enter](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Stock] [float] NULL,
	[ProductID] [int] NOT NULL,
	[UnitID] [int] NOT NULL,
	[EnterDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stock_Exit]    Script Date: 27.09.2024 20:47:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stock_Exit](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Stock] [float] NULL,
	[ProductID] [int] NOT NULL,
	[UnitID] [int] NOT NULL,
	[ExitDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Unit]    Script Date: 27.09.2024 20:47:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Unit](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UnitName] [nvarchar](25) NOT NULL,
	[Status] [int] NOT NULL,
	[Description] [nvarchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([ID], [CategoryName], [CreateDate], [UpdateDate], [DeleteDate], [Status], [Description]) VALUES (1, N'Men''s T-Shirts', CAST(N'2024-09-21T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL)
INSERT [dbo].[Category] ([ID], [CategoryName], [CreateDate], [UpdateDate], [DeleteDate], [Status], [Description]) VALUES (2, N'Women''s T-Shirts', CAST(N'2024-09-21T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL)
INSERT [dbo].[Category] ([ID], [CategoryName], [CreateDate], [UpdateDate], [DeleteDate], [Status], [Description]) VALUES (3, N'Men''s Jeans', CAST(N'2024-09-21T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL)
INSERT [dbo].[Category] ([ID], [CategoryName], [CreateDate], [UpdateDate], [DeleteDate], [Status], [Description]) VALUES (4, N'Women''s Jeans', CAST(N'2024-09-21T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL)
INSERT [dbo].[Category] ([ID], [CategoryName], [CreateDate], [UpdateDate], [DeleteDate], [Status], [Description]) VALUES (5, N'Men''s Jackets', CAST(N'2024-09-21T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL)
INSERT [dbo].[Category] ([ID], [CategoryName], [CreateDate], [UpdateDate], [DeleteDate], [Status], [Description]) VALUES (6, N'Women''s Jackets', CAST(N'2024-09-21T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL)
INSERT [dbo].[Category] ([ID], [CategoryName], [CreateDate], [UpdateDate], [DeleteDate], [Status], [Description]) VALUES (7, N'Men''s Shoes', CAST(N'2024-09-21T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL)
INSERT [dbo].[Category] ([ID], [CategoryName], [CreateDate], [UpdateDate], [DeleteDate], [Status], [Description]) VALUES (8, N'Women''s Shoes', CAST(N'2024-09-21T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL)
INSERT [dbo].[Category] ([ID], [CategoryName], [CreateDate], [UpdateDate], [DeleteDate], [Status], [Description]) VALUES (9, N'Men''s Accessories', CAST(N'2024-09-21T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL)
INSERT [dbo].[Category] ([ID], [CategoryName], [CreateDate], [UpdateDate], [DeleteDate], [Status], [Description]) VALUES (10, N'Women''s Accessories', CAST(N'2024-09-21T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL)
INSERT [dbo].[Category] ([ID], [CategoryName], [CreateDate], [UpdateDate], [DeleteDate], [Status], [Description]) VALUES (11, N'Men''s Sweaters', CAST(N'2024-09-21T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL)
INSERT [dbo].[Category] ([ID], [CategoryName], [CreateDate], [UpdateDate], [DeleteDate], [Status], [Description]) VALUES (12, N'Women''s Sweaters', CAST(N'2024-09-21T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL)
INSERT [dbo].[Category] ([ID], [CategoryName], [CreateDate], [UpdateDate], [DeleteDate], [Status], [Description]) VALUES (13, N'Men''s Shorts', CAST(N'2024-09-21T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL)
INSERT [dbo].[Category] ([ID], [CategoryName], [CreateDate], [UpdateDate], [DeleteDate], [Status], [Description]) VALUES (14, N'Women''s Shorts', CAST(N'2024-09-21T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL)
INSERT [dbo].[Category] ([ID], [CategoryName], [CreateDate], [UpdateDate], [DeleteDate], [Status], [Description]) VALUES (15, N'Men''s Suits', CAST(N'2024-09-21T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL)
INSERT [dbo].[Category] ([ID], [CategoryName], [CreateDate], [UpdateDate], [DeleteDate], [Status], [Description]) VALUES (16, N'Women''s Dresses', CAST(N'2024-09-21T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL)
INSERT [dbo].[Category] ([ID], [CategoryName], [CreateDate], [UpdateDate], [DeleteDate], [Status], [Description]) VALUES (17, N'Men''s Hats', CAST(N'2024-09-21T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL)
INSERT [dbo].[Category] ([ID], [CategoryName], [CreateDate], [UpdateDate], [DeleteDate], [Status], [Description]) VALUES (18, N'Women''s Hats', CAST(N'2024-09-21T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL)
INSERT [dbo].[Category] ([ID], [CategoryName], [CreateDate], [UpdateDate], [DeleteDate], [Status], [Description]) VALUES (19, N'Men''s Socks', CAST(N'2024-09-21T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL)
INSERT [dbo].[Category] ([ID], [CategoryName], [CreateDate], [UpdateDate], [DeleteDate], [Status], [Description]) VALUES (20, N'Women''s Socks', CAST(N'2024-09-21T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL)
INSERT [dbo].[Category] ([ID], [CategoryName], [CreateDate], [UpdateDate], [DeleteDate], [Status], [Description]) VALUES (25, N'Unixex Coat', NULL, CAST(N'2024-09-22T16:27:33.860' AS DateTime), NULL, 1, N'')
INSERT [dbo].[Category] ([ID], [CategoryName], [CreateDate], [UpdateDate], [DeleteDate], [Status], [Description]) VALUES (26, N'Woman''s Coat', CAST(N'2024-09-22T15:16:51.603' AS DateTime), NULL, CAST(N'2024-09-22T16:28:06.327' AS DateTime), 0, N'')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Currency] ON 

INSERT [dbo].[Currency] ([ID], [CurrencyName], [ShortName], [Status], [Description]) VALUES (1, N'Euro', N'EUR', 1, NULL)
INSERT [dbo].[Currency] ([ID], [CurrencyName], [ShortName], [Status], [Description]) VALUES (2, N'Amerikan Dolari', N'USD', 1, NULL)
INSERT [dbo].[Currency] ([ID], [CurrencyName], [ShortName], [Status], [Description]) VALUES (3, N'Türk Lirasi', N'TRY', 1, NULL)
SET IDENTITY_INSERT [dbo].[Currency] OFF
GO
SET IDENTITY_INSERT [dbo].[Gender] ON 

INSERT [dbo].[Gender] ([ID], [GenderName], [Status], [Description]) VALUES (1, N'Kadin', 1, NULL)
INSERT [dbo].[Gender] ([ID], [GenderName], [Status], [Description]) VALUES (2, N'Erkek', 1, NULL)
INSERT [dbo].[Gender] ([ID], [GenderName], [Status], [Description]) VALUES (3, N'Unisex', 1, NULL)
SET IDENTITY_INSERT [dbo].[Gender] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ID], [ProductName], [CategoryID], [Status], [CreateDate], [UpdateDate], [DeleteDate], [Description], [SizeID], [GenderID], [CurrentStock], [WarningQuantity], [CurrentPrice]) VALUES (1, N'Men''s Basic T-Shirt-2', 1, 1, CAST(N'2024-09-21T00:00:00.000' AS DateTime), CAST(N'2024-09-27T11:00:54.430' AS DateTime), NULL, N'test
                                                          
                                                          
                                                          
                                                          
    ', 2, 2, 5, 30, NULL)
INSERT [dbo].[Product] ([ID], [ProductName], [CategoryID], [Status], [CreateDate], [UpdateDate], [DeleteDate], [Description], [SizeID], [GenderID], [CurrentStock], [WarningQuantity], [CurrentPrice]) VALUES (2, N'Women''s Basic T-Shirt', 2, 0, CAST(N'2024-09-21T00:00:00.000' AS DateTime), CAST(N'2024-09-24T20:07:56.547' AS DateTime), NULL, N'     test                                                     ', 1, 1, 31, 35, NULL)
INSERT [dbo].[Product] ([ID], [ProductName], [CategoryID], [Status], [CreateDate], [UpdateDate], [DeleteDate], [Description], [SizeID], [GenderID], [CurrentStock], [WarningQuantity], [CurrentPrice]) VALUES (3, N'Men''s Slim Jeans', 3, 1, CAST(N'2024-09-21T00:00:00.000' AS DateTime), CAST(N'2024-09-27T10:50:45.767' AS DateTime), CAST(N'2024-09-27T10:50:29.657' AS DateTime), N' test                                 ', 2, 2, 0, 35, NULL)
INSERT [dbo].[Product] ([ID], [ProductName], [CategoryID], [Status], [CreateDate], [UpdateDate], [DeleteDate], [Description], [SizeID], [GenderID], [CurrentStock], [WarningQuantity], [CurrentPrice]) VALUES (4, N'Women''s Skinny Jeans', 4, 1, CAST(N'2024-09-21T00:00:00.000' AS DateTime), NULL, NULL, NULL, 2, 1, 17, 25, NULL)
INSERT [dbo].[Product] ([ID], [ProductName], [CategoryID], [Status], [CreateDate], [UpdateDate], [DeleteDate], [Description], [SizeID], [GenderID], [CurrentStock], [WarningQuantity], [CurrentPrice]) VALUES (5, N'Men''s Bomber Jacket', 5, 0, CAST(N'2024-09-21T00:00:00.000' AS DateTime), CAST(N'2024-09-26T12:11:47.910' AS DateTime), CAST(N'2024-09-26T12:12:13.250' AS DateTime), N'test                                                          ', 3, 2, 12, 15, NULL)
INSERT [dbo].[Product] ([ID], [ProductName], [CategoryID], [Status], [CreateDate], [UpdateDate], [DeleteDate], [Description], [SizeID], [GenderID], [CurrentStock], [WarningQuantity], [CurrentPrice]) VALUES (6, N'Women''s Leather Jacket', 6, 1, CAST(N'2024-09-21T00:00:00.000' AS DateTime), NULL, NULL, NULL, 3, 1, 27, 15, NULL)
INSERT [dbo].[Product] ([ID], [ProductName], [CategoryID], [Status], [CreateDate], [UpdateDate], [DeleteDate], [Description], [SizeID], [GenderID], [CurrentStock], [WarningQuantity], [CurrentPrice]) VALUES (7, N'Men''s Running Shoes', 7, 0, CAST(N'2024-09-21T00:00:00.000' AS DateTime), NULL, CAST(N'2024-09-24T20:14:29.943' AS DateTime), NULL, 5, 2, 24, 15, NULL)
INSERT [dbo].[Product] ([ID], [ProductName], [CategoryID], [Status], [CreateDate], [UpdateDate], [DeleteDate], [Description], [SizeID], [GenderID], [CurrentStock], [WarningQuantity], [CurrentPrice]) VALUES (8, N'Women''s Running Shoes', 8, 1, CAST(N'2024-09-21T00:00:00.000' AS DateTime), NULL, NULL, NULL, 5, 1, 34, 36, NULL)
INSERT [dbo].[Product] ([ID], [ProductName], [CategoryID], [Status], [CreateDate], [UpdateDate], [DeleteDate], [Description], [SizeID], [GenderID], [CurrentStock], [WarningQuantity], [CurrentPrice]) VALUES (9, N'Men''s Watch', 9, 1, CAST(N'2024-09-21T00:00:00.000' AS DateTime), NULL, NULL, NULL, 5, 2, 19, 20, NULL)
INSERT [dbo].[Product] ([ID], [ProductName], [CategoryID], [Status], [CreateDate], [UpdateDate], [DeleteDate], [Description], [SizeID], [GenderID], [CurrentStock], [WarningQuantity], [CurrentPrice]) VALUES (10, N'Women''s Watch', 10, 0, CAST(N'2024-09-21T00:00:00.000' AS DateTime), NULL, CAST(N'2024-09-25T07:51:34.020' AS DateTime), NULL, 5, 1, 9, 15, NULL)
INSERT [dbo].[Product] ([ID], [ProductName], [CategoryID], [Status], [CreateDate], [UpdateDate], [DeleteDate], [Description], [SizeID], [GenderID], [CurrentStock], [WarningQuantity], [CurrentPrice]) VALUES (11, N'Men''s Cotton Sweater', 1, 1, CAST(N'2024-09-21T00:00:00.000' AS DateTime), NULL, NULL, NULL, 4, 2, 40, 50, NULL)
INSERT [dbo].[Product] ([ID], [ProductName], [CategoryID], [Status], [CreateDate], [UpdateDate], [DeleteDate], [Description], [SizeID], [GenderID], [CurrentStock], [WarningQuantity], [CurrentPrice]) VALUES (12, N'Women''s Wool Sweater', 12, 1, CAST(N'2024-09-21T00:00:00.000' AS DateTime), NULL, NULL, NULL, 4, 1, 10, 15, NULL)
INSERT [dbo].[Product] ([ID], [ProductName], [CategoryID], [Status], [CreateDate], [UpdateDate], [DeleteDate], [Description], [SizeID], [GenderID], [CurrentStock], [WarningQuantity], [CurrentPrice]) VALUES (13, N'Men''s Casual Shorts', 13, 1, CAST(N'2024-09-21T00:00:00.000' AS DateTime), NULL, NULL, NULL, 4, 2, 15, 15, NULL)
INSERT [dbo].[Product] ([ID], [ProductName], [CategoryID], [Status], [CreateDate], [UpdateDate], [DeleteDate], [Description], [SizeID], [GenderID], [CurrentStock], [WarningQuantity], [CurrentPrice]) VALUES (14, N'Women''s Linen Shorts', 14, 0, CAST(N'2024-09-21T00:00:00.000' AS DateTime), NULL, CAST(N'2024-09-25T08:34:35.613' AS DateTime), NULL, 4, 1, 25, 24, NULL)
INSERT [dbo].[Product] ([ID], [ProductName], [CategoryID], [Status], [CreateDate], [UpdateDate], [DeleteDate], [Description], [SizeID], [GenderID], [CurrentStock], [WarningQuantity], [CurrentPrice]) VALUES (15, N'Men''s Business Suit', 15, 1, CAST(N'2024-09-21T00:00:00.000' AS DateTime), NULL, NULL, NULL, 4, 2, 21, 22, NULL)
INSERT [dbo].[Product] ([ID], [ProductName], [CategoryID], [Status], [CreateDate], [UpdateDate], [DeleteDate], [Description], [SizeID], [GenderID], [CurrentStock], [WarningQuantity], [CurrentPrice]) VALUES (16, N'Women''s Cocktail Dress', 16, 1, CAST(N'2024-09-21T00:00:00.000' AS DateTime), NULL, NULL, NULL, 4, 1, 16, 15, NULL)
INSERT [dbo].[Product] ([ID], [ProductName], [CategoryID], [Status], [CreateDate], [UpdateDate], [DeleteDate], [Description], [SizeID], [GenderID], [CurrentStock], [WarningQuantity], [CurrentPrice]) VALUES (17, N'Men''s Fedora Hat', 17, 1, CAST(N'2024-09-21T00:00:00.000' AS DateTime), NULL, NULL, NULL, 5, 2, 14, 20, NULL)
INSERT [dbo].[Product] ([ID], [ProductName], [CategoryID], [Status], [CreateDate], [UpdateDate], [DeleteDate], [Description], [SizeID], [GenderID], [CurrentStock], [WarningQuantity], [CurrentPrice]) VALUES (18, N'Women''s Sun Hat', 18, 1, CAST(N'2024-09-21T00:00:00.000' AS DateTime), NULL, NULL, NULL, 5, 1, 18, 20, NULL)
INSERT [dbo].[Product] ([ID], [ProductName], [CategoryID], [Status], [CreateDate], [UpdateDate], [DeleteDate], [Description], [SizeID], [GenderID], [CurrentStock], [WarningQuantity], [CurrentPrice]) VALUES (19, N'Men''s Hiking Socks', 19, 1, CAST(N'2024-09-21T00:00:00.000' AS DateTime), NULL, NULL, NULL, 5, 2, 28, 30, NULL)
INSERT [dbo].[Product] ([ID], [ProductName], [CategoryID], [Status], [CreateDate], [UpdateDate], [DeleteDate], [Description], [SizeID], [GenderID], [CurrentStock], [WarningQuantity], [CurrentPrice]) VALUES (20, N'Women''s Running Socks', 20, 1, CAST(N'2024-09-21T00:00:00.000' AS DateTime), NULL, NULL, NULL, 5, 1, 8, 5, NULL)
INSERT [dbo].[Product] ([ID], [ProductName], [CategoryID], [Status], [CreateDate], [UpdateDate], [DeleteDate], [Description], [SizeID], [GenderID], [CurrentStock], [WarningQuantity], [CurrentPrice]) VALUES (21, N'Men''s Polo Shirt', 1, 1, CAST(N'2024-09-21T00:00:00.000' AS DateTime), NULL, NULL, NULL, 4, 2, 13, 15, NULL)
INSERT [dbo].[Product] ([ID], [ProductName], [CategoryID], [Status], [CreateDate], [UpdateDate], [DeleteDate], [Description], [SizeID], [GenderID], [CurrentStock], [WarningQuantity], [CurrentPrice]) VALUES (22, N'Women''s Blouse', 2, 1, CAST(N'2024-09-21T00:00:00.000' AS DateTime), NULL, NULL, NULL, 4, 1, 18, 20, NULL)
INSERT [dbo].[Product] ([ID], [ProductName], [CategoryID], [Status], [CreateDate], [UpdateDate], [DeleteDate], [Description], [SizeID], [GenderID], [CurrentStock], [WarningQuantity], [CurrentPrice]) VALUES (23, N'Men''s Cargo Pants', 3, 1, CAST(N'2024-09-21T00:00:00.000' AS DateTime), NULL, NULL, NULL, 4, 2, 18, 15, NULL)
INSERT [dbo].[Product] ([ID], [ProductName], [CategoryID], [Status], [CreateDate], [UpdateDate], [DeleteDate], [Description], [SizeID], [GenderID], [CurrentStock], [WarningQuantity], [CurrentPrice]) VALUES (24, N'Women''s Skirt', 4, 1, CAST(N'2024-09-21T00:00:00.000' AS DateTime), NULL, NULL, NULL, 4, 1, 23, 25, NULL)
INSERT [dbo].[Product] ([ID], [ProductName], [CategoryID], [Status], [CreateDate], [UpdateDate], [DeleteDate], [Description], [SizeID], [GenderID], [CurrentStock], [WarningQuantity], [CurrentPrice]) VALUES (25, N'Men''s Windbreaker', 5, 1, CAST(N'2024-09-21T00:00:00.000' AS DateTime), NULL, NULL, NULL, 4, 2, 28, 15, NULL)
INSERT [dbo].[Product] ([ID], [ProductName], [CategoryID], [Status], [CreateDate], [UpdateDate], [DeleteDate], [Description], [SizeID], [GenderID], [CurrentStock], [WarningQuantity], [CurrentPrice]) VALUES (26, N'Women''s Raincoat', 6, 1, CAST(N'2024-09-21T00:00:00.000' AS DateTime), NULL, NULL, NULL, 4, 1, 33, 15, NULL)
INSERT [dbo].[Product] ([ID], [ProductName], [CategoryID], [Status], [CreateDate], [UpdateDate], [DeleteDate], [Description], [SizeID], [GenderID], [CurrentStock], [WarningQuantity], [CurrentPrice]) VALUES (27, N'Men''s Oxford Shoes', 7, 1, CAST(N'2024-09-21T00:00:00.000' AS DateTime), NULL, NULL, NULL, 5, 2, 43, 30, NULL)
INSERT [dbo].[Product] ([ID], [ProductName], [CategoryID], [Status], [CreateDate], [UpdateDate], [DeleteDate], [Description], [SizeID], [GenderID], [CurrentStock], [WarningQuantity], [CurrentPrice]) VALUES (28, N'Women''s Flats', 8, 1, CAST(N'2024-09-21T00:00:00.000' AS DateTime), NULL, NULL, NULL, 5, 1, 18, 15, NULL)
INSERT [dbo].[Product] ([ID], [ProductName], [CategoryID], [Status], [CreateDate], [UpdateDate], [DeleteDate], [Description], [SizeID], [GenderID], [CurrentStock], [WarningQuantity], [CurrentPrice]) VALUES (29, N'Men''s Beanie', 9, 1, CAST(N'2024-09-21T00:00:00.000' AS DateTime), NULL, NULL, NULL, 5, 2, 23, 25, NULL)
INSERT [dbo].[Product] ([ID], [ProductName], [CategoryID], [Status], [CreateDate], [UpdateDate], [DeleteDate], [Description], [SizeID], [GenderID], [CurrentStock], [WarningQuantity], [CurrentPrice]) VALUES (30, N'Women''s Scarf', 10, 1, CAST(N'2024-09-21T00:00:00.000' AS DateTime), NULL, NULL, NULL, 5, 1, 8, 10, NULL)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductCost] ON 

INSERT [dbo].[ProductCost] ([ID], [CostPrice], [ProductID], [CurrencyID]) VALUES (1, CAST(100.00 AS Decimal(10, 2)), 1, 3)
INSERT [dbo].[ProductCost] ([ID], [CostPrice], [ProductID], [CurrencyID]) VALUES (3, CAST(120.00 AS Decimal(10, 2)), 2, 3)
INSERT [dbo].[ProductCost] ([ID], [CostPrice], [ProductID], [CurrencyID]) VALUES (4, CAST(200.00 AS Decimal(10, 2)), 3, 3)
INSERT [dbo].[ProductCost] ([ID], [CostPrice], [ProductID], [CurrencyID]) VALUES (5, CAST(300.00 AS Decimal(10, 2)), 4, 3)
INSERT [dbo].[ProductCost] ([ID], [CostPrice], [ProductID], [CurrencyID]) VALUES (6, CAST(200.00 AS Decimal(10, 2)), 5, 3)
INSERT [dbo].[ProductCost] ([ID], [CostPrice], [ProductID], [CurrencyID]) VALUES (7, CAST(150.00 AS Decimal(10, 2)), 6, 3)
INSERT [dbo].[ProductCost] ([ID], [CostPrice], [ProductID], [CurrencyID]) VALUES (8, CAST(400.00 AS Decimal(10, 2)), 7, 3)
INSERT [dbo].[ProductCost] ([ID], [CostPrice], [ProductID], [CurrencyID]) VALUES (9, CAST(250.00 AS Decimal(10, 2)), 8, 3)
INSERT [dbo].[ProductCost] ([ID], [CostPrice], [ProductID], [CurrencyID]) VALUES (10, CAST(180.00 AS Decimal(10, 2)), 9, 3)
INSERT [dbo].[ProductCost] ([ID], [CostPrice], [ProductID], [CurrencyID]) VALUES (11, CAST(200.00 AS Decimal(10, 2)), 10, 3)
INSERT [dbo].[ProductCost] ([ID], [CostPrice], [ProductID], [CurrencyID]) VALUES (12, CAST(150.00 AS Decimal(10, 2)), 11, 3)
INSERT [dbo].[ProductCost] ([ID], [CostPrice], [ProductID], [CurrencyID]) VALUES (13, CAST(500.00 AS Decimal(10, 2)), 12, 3)
INSERT [dbo].[ProductCost] ([ID], [CostPrice], [ProductID], [CurrencyID]) VALUES (14, CAST(150.00 AS Decimal(10, 2)), 13, 3)
INSERT [dbo].[ProductCost] ([ID], [CostPrice], [ProductID], [CurrencyID]) VALUES (15, CAST(200.00 AS Decimal(10, 2)), 14, 3)
INSERT [dbo].[ProductCost] ([ID], [CostPrice], [ProductID], [CurrencyID]) VALUES (16, CAST(200.00 AS Decimal(10, 2)), 15, 3)
INSERT [dbo].[ProductCost] ([ID], [CostPrice], [ProductID], [CurrencyID]) VALUES (17, CAST(200.00 AS Decimal(10, 2)), 16, 3)
INSERT [dbo].[ProductCost] ([ID], [CostPrice], [ProductID], [CurrencyID]) VALUES (18, CAST(150.00 AS Decimal(10, 2)), 17, 3)
INSERT [dbo].[ProductCost] ([ID], [CostPrice], [ProductID], [CurrencyID]) VALUES (19, CAST(150.00 AS Decimal(10, 2)), 18, 3)
INSERT [dbo].[ProductCost] ([ID], [CostPrice], [ProductID], [CurrencyID]) VALUES (20, CAST(200.00 AS Decimal(10, 2)), 19, 3)
INSERT [dbo].[ProductCost] ([ID], [CostPrice], [ProductID], [CurrencyID]) VALUES (21, CAST(200.00 AS Decimal(10, 2)), 20, 3)
INSERT [dbo].[ProductCost] ([ID], [CostPrice], [ProductID], [CurrencyID]) VALUES (22, CAST(200.00 AS Decimal(10, 2)), 21, 3)
INSERT [dbo].[ProductCost] ([ID], [CostPrice], [ProductID], [CurrencyID]) VALUES (23, CAST(600.00 AS Decimal(10, 2)), 22, 3)
INSERT [dbo].[ProductCost] ([ID], [CostPrice], [ProductID], [CurrencyID]) VALUES (24, CAST(180.00 AS Decimal(10, 2)), 23, 3)
INSERT [dbo].[ProductCost] ([ID], [CostPrice], [ProductID], [CurrencyID]) VALUES (25, CAST(160.00 AS Decimal(10, 2)), 24, 3)
INSERT [dbo].[ProductCost] ([ID], [CostPrice], [ProductID], [CurrencyID]) VALUES (26, CAST(200.00 AS Decimal(10, 2)), 25, 3)
INSERT [dbo].[ProductCost] ([ID], [CostPrice], [ProductID], [CurrencyID]) VALUES (27, CAST(170.00 AS Decimal(10, 2)), 26, 3)
INSERT [dbo].[ProductCost] ([ID], [CostPrice], [ProductID], [CurrencyID]) VALUES (28, CAST(200.00 AS Decimal(10, 2)), 27, 3)
INSERT [dbo].[ProductCost] ([ID], [CostPrice], [ProductID], [CurrencyID]) VALUES (29, CAST(275.00 AS Decimal(10, 2)), 28, 3)
INSERT [dbo].[ProductCost] ([ID], [CostPrice], [ProductID], [CurrencyID]) VALUES (30, CAST(250.00 AS Decimal(10, 2)), 29, 3)
INSERT [dbo].[ProductCost] ([ID], [CostPrice], [ProductID], [CurrencyID]) VALUES (31, CAST(200.00 AS Decimal(10, 2)), 30, 3)
SET IDENTITY_INSERT [dbo].[ProductCost] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductPrice] ON 

INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (1, CAST(290.99 AS Decimal(10, 2)), 1, 3, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (2, CAST(250.49 AS Decimal(10, 2)), 2, 3, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (3, CAST(490.99 AS Decimal(10, 2)), 3, 3, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (4, CAST(540.99 AS Decimal(10, 2)), 4, 3, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (5, CAST(490.99 AS Decimal(10, 2)), 5, 3, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (6, CAST(120.00 AS Decimal(10, 2)), 6, 3, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (7, CAST(590.99 AS Decimal(10, 2)), 7, 3, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (8, CAST(340.99 AS Decimal(10, 2)), 8, 3, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (9, CAST(150.00 AS Decimal(10, 2)), 9, 3, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (10, CAST(135.00 AS Decimal(10, 2)), 10, 3, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (11, CAST(580.99 AS Decimal(10, 2)), 11, 3, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (12, CAST(990.99 AS Decimal(10, 2)), 12, 3, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (13, CAST(405.00 AS Decimal(10, 2)), 13, 3, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (14, CAST(505.00 AS Decimal(10, 2)), 14, 3, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (15, CAST(250.00 AS Decimal(10, 2)), 15, 3, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (16, CAST(405.00 AS Decimal(10, 2)), 16, 3, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (17, CAST(350.00 AS Decimal(10, 2)), 17, 3, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (18, CAST(120.00 AS Decimal(10, 2)), 18, 3, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (19, CAST(180.00 AS Decimal(10, 2)), 19, 3, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (20, CAST(400.00 AS Decimal(10, 2)), 20, 3, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (21, CAST(550.00 AS Decimal(10, 2)), 21, 3, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (22, CAST(300.00 AS Decimal(10, 2)), 22, 3, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (23, CAST(800.00 AS Decimal(10, 2)), 23, 3, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (24, CAST(110.00 AS Decimal(10, 2)), 24, 3, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (25, CAST(120.00 AS Decimal(10, 2)), 25, 3, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (26, CAST(500.00 AS Decimal(10, 2)), 26, 3, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (27, CAST(150.00 AS Decimal(10, 2)), 27, 3, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (28, CAST(250.00 AS Decimal(10, 2)), 28, 3, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (29, CAST(350.00 AS Decimal(10, 2)), 29, 3, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (30, CAST(450.00 AS Decimal(10, 2)), 30, 3, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (39, CAST(250.00 AS Decimal(10, 2)), 1, 3, CAST(N'2024-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (40, CAST(300.00 AS Decimal(10, 2)), 2, 3, CAST(N'2024-02-02T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (41, CAST(92.00 AS Decimal(10, 2)), 22, 3, CAST(N'2024-05-29T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (42, CAST(147.00 AS Decimal(10, 2)), 21, 3, CAST(N'2024-06-11T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (43, CAST(564.00 AS Decimal(10, 2)), 14, 3, CAST(N'2024-09-17T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (44, CAST(561.00 AS Decimal(10, 2)), 22, 3, CAST(N'2024-01-31T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (45, CAST(32.00 AS Decimal(10, 2)), 13, 3, CAST(N'2024-06-09T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (46, CAST(21.00 AS Decimal(10, 2)), 3, 3, CAST(N'2024-03-29T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (47, CAST(569.00 AS Decimal(10, 2)), 18, 3, CAST(N'2024-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (48, CAST(155.00 AS Decimal(10, 2)), 6, 3, CAST(N'2024-03-16T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (49, CAST(164.00 AS Decimal(10, 2)), 5, 3, CAST(N'2024-02-09T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (50, CAST(83.00 AS Decimal(10, 2)), 1, 3, CAST(N'2024-06-11T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (51, CAST(685.00 AS Decimal(10, 2)), 4, 3, CAST(N'2024-05-28T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (52, CAST(73.00 AS Decimal(10, 2)), 30, 3, CAST(N'2024-05-29T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (53, CAST(331.00 AS Decimal(10, 2)), 22, 3, CAST(N'2024-04-28T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (54, CAST(592.00 AS Decimal(10, 2)), 16, 3, CAST(N'2024-06-03T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (55, CAST(150.00 AS Decimal(10, 2)), 4, 3, CAST(N'2024-08-14T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (56, CAST(251.00 AS Decimal(10, 2)), 23, 3, CAST(N'2024-07-02T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (57, CAST(684.00 AS Decimal(10, 2)), 6, 3, CAST(N'2024-07-06T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (58, CAST(595.00 AS Decimal(10, 2)), 28, 3, CAST(N'2024-02-25T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (59, CAST(24.00 AS Decimal(10, 2)), 19, 3, CAST(N'2024-04-28T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (60, CAST(9.00 AS Decimal(10, 2)), 2, 3, CAST(N'2024-05-15T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (61, CAST(646.00 AS Decimal(10, 2)), 14, 3, CAST(N'2024-08-18T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (62, CAST(225.00 AS Decimal(10, 2)), 21, 3, CAST(N'2024-01-10T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (63, CAST(401.00 AS Decimal(10, 2)), 6, 3, CAST(N'2024-04-16T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (64, CAST(685.00 AS Decimal(10, 2)), 7, 3, CAST(N'2024-08-29T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (65, CAST(770.00 AS Decimal(10, 2)), 25, 3, CAST(N'2024-09-02T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (66, CAST(326.00 AS Decimal(10, 2)), 17, 3, CAST(N'2024-03-03T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (67, CAST(629.00 AS Decimal(10, 2)), 19, 3, CAST(N'2024-08-03T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (68, CAST(245.00 AS Decimal(10, 2)), 28, 3, CAST(N'2024-04-18T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (69, CAST(793.00 AS Decimal(10, 2)), 27, 3, CAST(N'2024-01-25T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (70, CAST(441.00 AS Decimal(10, 2)), 20, 3, CAST(N'2024-10-16T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (71, CAST(21.00 AS Decimal(10, 2)), 28, 3, CAST(N'2024-06-14T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (72, CAST(471.00 AS Decimal(10, 2)), 14, 3, CAST(N'2024-10-08T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (73, CAST(414.00 AS Decimal(10, 2)), 6, 3, CAST(N'2024-05-16T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (74, CAST(454.00 AS Decimal(10, 2)), 12, 3, CAST(N'2024-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (75, CAST(477.00 AS Decimal(10, 2)), 20, 3, CAST(N'2024-06-09T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (76, CAST(610.00 AS Decimal(10, 2)), 12, 3, CAST(N'2024-07-05T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (77, CAST(174.00 AS Decimal(10, 2)), 17, 3, CAST(N'2024-10-22T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (78, CAST(237.00 AS Decimal(10, 2)), 3, 3, CAST(N'2024-05-07T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (79, CAST(300.00 AS Decimal(10, 2)), 12, 3, CAST(N'2024-01-14T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (80, CAST(458.00 AS Decimal(10, 2)), 1, 3, CAST(N'2024-03-16T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (81, CAST(4.00 AS Decimal(10, 2)), 19, 3, CAST(N'2024-02-25T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (82, CAST(388.00 AS Decimal(10, 2)), 23, 3, CAST(N'2024-02-15T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (83, CAST(161.00 AS Decimal(10, 2)), 6, 3, CAST(N'2024-07-17T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (84, CAST(206.00 AS Decimal(10, 2)), 23, 3, CAST(N'2024-02-28T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (85, CAST(276.00 AS Decimal(10, 2)), 8, 3, CAST(N'2024-03-14T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (86, CAST(174.00 AS Decimal(10, 2)), 6, 3, CAST(N'2024-05-15T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (87, CAST(496.00 AS Decimal(10, 2)), 17, 3, CAST(N'2024-06-07T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (88, CAST(601.00 AS Decimal(10, 2)), 26, 3, CAST(N'2024-10-16T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (89, CAST(516.00 AS Decimal(10, 2)), 7, 3, CAST(N'2024-06-01T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (90, CAST(604.00 AS Decimal(10, 2)), 12, 3, CAST(N'2024-05-21T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (91, CAST(101.00 AS Decimal(10, 2)), 24, 3, CAST(N'2024-09-08T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (92, CAST(789.00 AS Decimal(10, 2)), 7, 3, CAST(N'2024-01-04T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (93, CAST(347.00 AS Decimal(10, 2)), 17, 3, CAST(N'2024-01-07T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (94, CAST(362.00 AS Decimal(10, 2)), 22, 3, CAST(N'2024-05-17T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (95, CAST(273.00 AS Decimal(10, 2)), 12, 3, CAST(N'2024-04-10T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (96, CAST(375.00 AS Decimal(10, 2)), 14, 3, CAST(N'2024-05-12T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (97, CAST(548.00 AS Decimal(10, 2)), 7, 3, CAST(N'2024-09-05T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (98, CAST(118.00 AS Decimal(10, 2)), 5, 3, CAST(N'2024-10-15T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (99, CAST(732.00 AS Decimal(10, 2)), 26, 3, CAST(N'2024-01-16T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (100, CAST(356.00 AS Decimal(10, 2)), 13, 3, CAST(N'2024-10-23T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (101, CAST(113.00 AS Decimal(10, 2)), 21, 3, CAST(N'2024-10-20T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (102, CAST(515.00 AS Decimal(10, 2)), 19, 3, CAST(N'2024-07-03T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (103, CAST(381.00 AS Decimal(10, 2)), 18, 3, CAST(N'2024-03-23T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (104, CAST(8.00 AS Decimal(10, 2)), 22, 3, CAST(N'2024-08-30T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (105, CAST(745.00 AS Decimal(10, 2)), 23, 3, CAST(N'2024-04-20T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (106, CAST(362.00 AS Decimal(10, 2)), 20, 3, CAST(N'2024-07-19T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (107, CAST(246.00 AS Decimal(10, 2)), 7, 3, CAST(N'2024-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (108, CAST(124.00 AS Decimal(10, 2)), 26, 3, CAST(N'2024-04-22T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (109, CAST(382.00 AS Decimal(10, 2)), 9, 3, CAST(N'2024-04-10T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (110, CAST(259.00 AS Decimal(10, 2)), 25, 3, CAST(N'2024-04-23T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (111, CAST(52.00 AS Decimal(10, 2)), 27, 3, CAST(N'2024-02-19T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (112, CAST(235.00 AS Decimal(10, 2)), 18, 3, CAST(N'2024-03-28T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (113, CAST(322.00 AS Decimal(10, 2)), 26, 3, CAST(N'2024-02-14T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (114, CAST(652.00 AS Decimal(10, 2)), 15, 3, CAST(N'2024-09-06T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (115, CAST(101.00 AS Decimal(10, 2)), 20, 3, CAST(N'2024-03-24T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (116, CAST(507.00 AS Decimal(10, 2)), 11, 3, CAST(N'2024-02-16T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (117, CAST(192.00 AS Decimal(10, 2)), 5, 3, CAST(N'2024-08-04T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (118, CAST(77.00 AS Decimal(10, 2)), 3, 3, CAST(N'2024-08-02T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (119, CAST(208.00 AS Decimal(10, 2)), 13, 3, CAST(N'2024-01-02T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (120, CAST(324.00 AS Decimal(10, 2)), 13, 3, CAST(N'2024-05-09T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (121, CAST(526.00 AS Decimal(10, 2)), 14, 3, CAST(N'2024-02-11T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (122, CAST(313.00 AS Decimal(10, 2)), 18, 3, CAST(N'2024-07-24T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (123, CAST(308.00 AS Decimal(10, 2)), 10, 3, CAST(N'2024-10-12T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (124, CAST(40.00 AS Decimal(10, 2)), 1, 3, CAST(N'2024-07-23T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (125, CAST(380.00 AS Decimal(10, 2)), 2, 3, CAST(N'2024-08-25T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (126, CAST(20.00 AS Decimal(10, 2)), 7, 3, CAST(N'2024-06-01T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (127, CAST(195.00 AS Decimal(10, 2)), 12, 3, CAST(N'2024-05-27T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (128, CAST(556.00 AS Decimal(10, 2)), 19, 3, CAST(N'2024-01-30T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (129, CAST(293.00 AS Decimal(10, 2)), 14, 3, CAST(N'2024-05-26T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (130, CAST(241.00 AS Decimal(10, 2)), 2, 3, CAST(N'2024-09-12T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (131, CAST(537.00 AS Decimal(10, 2)), 13, 3, CAST(N'2024-09-11T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (132, CAST(339.00 AS Decimal(10, 2)), 27, 3, CAST(N'2024-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (133, CAST(144.00 AS Decimal(10, 2)), 15, 3, CAST(N'2024-08-15T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (134, CAST(513.00 AS Decimal(10, 2)), 28, 3, CAST(N'2024-05-29T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (135, CAST(7.00 AS Decimal(10, 2)), 28, 3, CAST(N'2024-07-16T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (136, CAST(199.00 AS Decimal(10, 2)), 25, 3, CAST(N'2024-08-08T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (137, CAST(137.00 AS Decimal(10, 2)), 9, 3, CAST(N'2024-06-18T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (138, CAST(461.00 AS Decimal(10, 2)), 20, 3, CAST(N'2024-04-27T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (139, CAST(758.00 AS Decimal(10, 2)), 4, 3, CAST(N'2024-06-26T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (140, CAST(480.00 AS Decimal(10, 2)), 30, 3, CAST(N'2024-04-05T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (141, CAST(279.00 AS Decimal(10, 2)), 13, 3, CAST(N'2024-07-02T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (142, CAST(388.00 AS Decimal(10, 2)), 30, 3, CAST(N'2024-03-13T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (143, CAST(3.00 AS Decimal(10, 2)), 19, 3, CAST(N'2024-03-14T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (144, CAST(385.00 AS Decimal(10, 2)), 6, 3, CAST(N'2024-04-19T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (145, CAST(344.00 AS Decimal(10, 2)), 21, 3, CAST(N'2024-07-16T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (146, CAST(78.00 AS Decimal(10, 2)), 12, 3, CAST(N'2024-06-03T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (147, CAST(308.00 AS Decimal(10, 2)), 26, 3, CAST(N'2024-04-10T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (148, CAST(412.00 AS Decimal(10, 2)), 17, 3, CAST(N'2024-01-24T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (149, CAST(262.00 AS Decimal(10, 2)), 6, 3, CAST(N'2024-07-29T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (150, CAST(737.00 AS Decimal(10, 2)), 22, 3, CAST(N'2024-05-29T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (151, CAST(268.00 AS Decimal(10, 2)), 7, 3, CAST(N'2024-04-16T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (152, CAST(164.00 AS Decimal(10, 2)), 10, 3, CAST(N'2024-07-21T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (153, CAST(101.00 AS Decimal(10, 2)), 3, 3, CAST(N'2024-04-26T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (154, CAST(748.00 AS Decimal(10, 2)), 2, 3, CAST(N'2024-08-10T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (155, CAST(12.00 AS Decimal(10, 2)), 8, 3, CAST(N'2024-03-18T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (156, CAST(3.00 AS Decimal(10, 2)), 5, 3, CAST(N'2024-08-23T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (157, CAST(628.00 AS Decimal(10, 2)), 28, 3, CAST(N'2024-07-08T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (158, CAST(621.00 AS Decimal(10, 2)), 25, 3, CAST(N'2024-06-13T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (159, CAST(689.00 AS Decimal(10, 2)), 29, 3, CAST(N'2024-06-03T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (160, CAST(495.00 AS Decimal(10, 2)), 27, 3, CAST(N'2024-06-09T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (161, CAST(66.00 AS Decimal(10, 2)), 26, 3, CAST(N'2024-04-11T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (162, CAST(1.00 AS Decimal(10, 2)), 9, 3, CAST(N'2024-04-21T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (163, CAST(108.00 AS Decimal(10, 2)), 14, 3, CAST(N'2024-09-22T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (164, CAST(235.00 AS Decimal(10, 2)), 12, 3, CAST(N'2024-05-08T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (165, CAST(191.00 AS Decimal(10, 2)), 13, 3, CAST(N'2024-04-25T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (166, CAST(585.00 AS Decimal(10, 2)), 9, 3, CAST(N'2024-05-03T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (167, CAST(724.00 AS Decimal(10, 2)), 18, 3, CAST(N'2024-06-02T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (168, CAST(562.00 AS Decimal(10, 2)), 6, 3, CAST(N'2024-07-29T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (169, CAST(653.00 AS Decimal(10, 2)), 6, 3, CAST(N'2024-10-12T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (170, CAST(288.00 AS Decimal(10, 2)), 21, 3, CAST(N'2024-04-28T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (171, CAST(602.00 AS Decimal(10, 2)), 21, 3, CAST(N'2024-04-30T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (172, CAST(30.00 AS Decimal(10, 2)), 30, 3, CAST(N'2024-05-14T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (173, CAST(109.00 AS Decimal(10, 2)), 24, 3, CAST(N'2024-04-03T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (174, CAST(747.00 AS Decimal(10, 2)), 7, 3, CAST(N'2024-09-21T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (175, CAST(509.00 AS Decimal(10, 2)), 14, 3, CAST(N'2024-04-07T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (176, CAST(633.00 AS Decimal(10, 2)), 27, 3, CAST(N'2024-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (177, CAST(559.00 AS Decimal(10, 2)), 10, 3, CAST(N'2024-10-13T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (178, CAST(152.00 AS Decimal(10, 2)), 25, 3, CAST(N'2024-01-12T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (179, CAST(39.00 AS Decimal(10, 2)), 22, 3, CAST(N'2024-02-26T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (180, CAST(723.00 AS Decimal(10, 2)), 5, 3, CAST(N'2024-04-28T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (181, CAST(194.00 AS Decimal(10, 2)), 14, 3, CAST(N'2024-09-21T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (182, CAST(246.00 AS Decimal(10, 2)), 1, 3, CAST(N'2024-08-09T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (183, CAST(192.00 AS Decimal(10, 2)), 2, 3, CAST(N'2024-02-06T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductPrice] ([ID], [Price], [ProductID], [CurrencyID], [PriceChancingDate]) VALUES (184, CAST(199.00 AS Decimal(10, 2)), 5, 3, CAST(N'2024-05-07T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[ProductPrice] OFF
GO
SET IDENTITY_INSERT [dbo].[Size] ON 

INSERT [dbo].[Size] ([ID], [SizeName], [ShortName], [Status]) VALUES (1, N'Small', N'S', 1)
INSERT [dbo].[Size] ([ID], [SizeName], [ShortName], [Status]) VALUES (2, N'Medium', N'M', 1)
INSERT [dbo].[Size] ([ID], [SizeName], [ShortName], [Status]) VALUES (3, N'Large', N'L', 1)
INSERT [dbo].[Size] ([ID], [SizeName], [ShortName], [Status]) VALUES (4, N'XLarge', N'XL', 1)
INSERT [dbo].[Size] ([ID], [SizeName], [ShortName], [Status]) VALUES (5, N'Standart', N'ST', 1)
SET IDENTITY_INSERT [dbo].[Size] OFF
GO
SET IDENTITY_INSERT [dbo].[Stock_Enter] ON 

INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (1, 50, 1, 1, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (2, 45, 2, 1, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (3, 60, 3, 1, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (4, 30, 4, 1, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (5, 25, 5, 1, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (6, 40, 6, 1, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (7, 35, 7, 1, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (8, 45, 8, 1, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (9, 30, 9, 1, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (10, 20, 10, 1, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (11, 55, 11, 1, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (12, 25, 12, 1, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (13, 30, 13, 1, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (14, 40, 14, 1, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (15, 35, 15, 1, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (16, 30, 16, 1, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (17, 28, 17, 1, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (18, 32, 18, 1, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (19, 40, 19, 1, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (20, 20, 20, 1, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (21, 25, 21, 1, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (22, 30, 22, 1, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (23, 35, 23, 1, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (24, 40, 24, 1, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (25, 45, 25, 1, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (26, 50, 26, 1, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (27, 55, 27, 1, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (28, 30, 28, 1, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (29, 35, 29, 1, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (30, 20, 30, 1, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (31, 50, 1, 1, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (32, 45, 2, 1, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (33, 45, 3, 1, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (34, 30, 4, 1, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (35, 20, 5, 1, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (36, 30, 6, 1, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (37, 10, 7, 1, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (38, 15, 8, 1, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (39, 15, 9, 1, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (40, 13, 10, 1, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (41, 7, 11, 1, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (42, 9, 12, 1, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (43, 45, 13, 1, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (44, 5, 14, 1, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (45, 25, 15, 1, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (46, 14, 16, 1, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (47, 35, 17, 1, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (48, 12, 18, 1, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (49, 10, 19, 1, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (50, 40, 20, 1, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (51, 18, 21, 1, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (52, 22, 22, 1, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (53, 18, 23, 1, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (54, 11, 24, 1, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (55, 12, 25, 1, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (56, 5, 26, 1, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (57, 15, 27, 1, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (58, 25, 28, 1, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (59, 10, 29, 1, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (60, 5, 30, 1, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (61, 45, 1, 1, CAST(N'2024-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (62, 35, 2, 1, CAST(N'2024-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (63, 55, 3, 1, CAST(N'2024-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (64, 28, 4, 1, CAST(N'2024-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (65, 22, 5, 1, CAST(N'2024-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (66, 38, 6, 1, CAST(N'2024-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (67, 30, 7, 1, CAST(N'2024-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (68, 50, 8, 1, CAST(N'2024-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (69, 25, 9, 1, CAST(N'2024-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (70, 45, 10, 1, CAST(N'2024-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (71, 32, 11, 1, CAST(N'2024-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (72, 40, 12, 1, CAST(N'2024-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (73, 28, 13, 1, CAST(N'2024-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (74, 50, 14, 1, CAST(N'2024-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (75, 55, 15, 1, CAST(N'2024-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (76, 42, 16, 1, CAST(N'2024-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (77, 35, 17, 1, CAST(N'2024-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (78, 28, 18, 1, CAST(N'2024-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (79, 33, 19, 1, CAST(N'2024-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (80, 40, 20, 1, CAST(N'2024-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (81, 25, 21, 1, CAST(N'2024-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (82, 30, 22, 1, CAST(N'2024-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (83, 35, 23, 1, CAST(N'2024-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (84, 40, 24, 1, CAST(N'2024-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (85, 45, 25, 1, CAST(N'2024-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (86, 50, 26, 1, CAST(N'2024-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (87, 55, 27, 1, CAST(N'2024-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (88, 30, 28, 1, CAST(N'2024-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (89, 35, 29, 1, CAST(N'2024-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (90, 20, 30, 1, CAST(N'2024-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (91, 20, 1, 1, CAST(N'2024-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (92, 10, 2, 1, CAST(N'2024-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (93, 12, 3, 1, CAST(N'2024-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (94, 10, 4, 1, CAST(N'2024-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (95, 11, 5, 1, CAST(N'2024-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (96, 12, 6, 1, CAST(N'2024-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (97, 32, 7, 1, CAST(N'2024-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (98, 41, 8, 1, CAST(N'2024-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (99, 54, 9, 1, CAST(N'2024-03-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (100, 11, 10, 1, CAST(N'2024-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (101, 12, 11, 1, CAST(N'2024-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (102, 13, 12, 1, CAST(N'2024-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (103, 45, 13, 1, CAST(N'2024-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (104, 21, 14, 1, CAST(N'2024-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (105, 23, 15, 1, CAST(N'2024-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (106, 12, 16, 1, CAST(N'2024-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (107, 22, 17, 1, CAST(N'2024-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (108, 10, 18, 1, CAST(N'2024-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (109, 25, 19, 1, CAST(N'2024-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (110, 42, 20, 1, CAST(N'2024-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (111, 23, 21, 1, CAST(N'2024-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (112, 21, 22, 1, CAST(N'2024-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (113, 11, 23, 1, CAST(N'2024-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (114, 14, 24, 1, CAST(N'2024-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (115, 45, 25, 1, CAST(N'2024-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (116, 41, 26, 1, CAST(N'2024-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (117, 4, 27, 1, CAST(N'2024-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (118, 10, 28, 1, CAST(N'2024-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (119, 10, 29, 1, CAST(N'2024-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (120, 13, 30, 1, CAST(N'2024-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (121, 48, 1, 1, CAST(N'2024-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (122, 42, 2, 1, CAST(N'2024-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (123, 58, 3, 1, CAST(N'2024-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (124, 33, 4, 1, CAST(N'2024-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (125, 27, 5, 1, CAST(N'2024-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (126, 35, 6, 1, CAST(N'2024-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (127, 38, 7, 1, CAST(N'2024-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (128, 52, 8, 1, CAST(N'2024-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (129, 45, 9, 1, CAST(N'2024-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (130, 40, 10, 1, CAST(N'2024-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (131, 32, 11, 1, CAST(N'2024-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (132, 28, 12, 1, CAST(N'2024-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (133, 40, 13, 1, CAST(N'2024-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (134, 50, 14, 1, CAST(N'2024-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (135, 60, 15, 1, CAST(N'2024-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (136, 48, 16, 1, CAST(N'2024-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (137, 45, 17, 1, CAST(N'2024-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (138, 42, 18, 1, CAST(N'2024-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (139, 33, 19, 1, CAST(N'2024-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (140, 50, 20, 1, CAST(N'2024-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (141, 25, 21, 1, CAST(N'2024-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (142, 35, 22, 1, CAST(N'2024-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (143, 38, 23, 1, CAST(N'2024-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (144, 40, 24, 1, CAST(N'2024-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (145, 55, 25, 1, CAST(N'2024-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (146, 60, 26, 1, CAST(N'2024-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (147, 40, 27, 1, CAST(N'2024-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (148, 30, 28, 1, CAST(N'2024-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (149, 35, 29, 1, CAST(N'2024-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (150, 22, 30, 1, CAST(N'2024-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (151, 9, 1, 1, CAST(N'2024-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (152, 9, 2, 1, CAST(N'2024-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (153, 9, 3, 1, CAST(N'2024-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (154, 9, 4, 1, CAST(N'2024-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (155, 9, 5, 1, CAST(N'2024-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (156, 9, 6, 1, CAST(N'2024-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (157, 9, 7, 1, CAST(N'2024-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (158, 9, 8, 1, CAST(N'2024-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (159, 9, 9, 1, CAST(N'2024-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (160, 9, 10, 1, CAST(N'2024-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (161, 9, 11, 1, CAST(N'2024-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (162, 11, 12, 1, CAST(N'2024-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (163, 11, 13, 1, CAST(N'2024-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (164, 11, 14, 1, CAST(N'2024-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (165, 11, 15, 1, CAST(N'2024-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (166, 11, 16, 1, CAST(N'2024-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (167, 11, 17, 1, CAST(N'2024-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (168, 11, 18, 1, CAST(N'2024-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (169, 11, 19, 1, CAST(N'2024-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (170, 11, 20, 1, CAST(N'2024-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (171, 11, 21, 1, CAST(N'2024-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (172, 11, 22, 1, CAST(N'2024-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (173, 12, 23, 1, CAST(N'2024-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (174, 12, 24, 1, CAST(N'2024-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (175, 12, 25, 1, CAST(N'2024-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (176, 12, 26, 1, CAST(N'2024-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (177, 12, 27, 1, CAST(N'2024-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (178, 12, 28, 1, CAST(N'2024-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (179, 12, 29, 1, CAST(N'2024-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (180, 12, 30, 1, CAST(N'2024-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (181, 15, 1, 1, CAST(N'2024-06-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (182, 15, 2, 1, CAST(N'2024-06-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (183, 15, 3, 1, CAST(N'2024-06-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (184, 15, 4, 1, CAST(N'2024-06-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (185, 15, 5, 1, CAST(N'2024-06-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (186, 15, 6, 1, CAST(N'2024-06-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (187, 15, 7, 1, CAST(N'2024-06-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (188, 15, 8, 1, CAST(N'2024-06-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (189, 15, 9, 1, CAST(N'2024-06-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (190, 15, 10, 1, CAST(N'2024-06-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (191, 15, 11, 1, CAST(N'2024-06-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (192, 11, 12, 1, CAST(N'2024-06-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (193, 11, 13, 1, CAST(N'2024-06-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (194, 11, 14, 1, CAST(N'2024-06-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (195, 11, 15, 1, CAST(N'2024-06-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (196, 11, 16, 1, CAST(N'2024-06-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (197, 11, 17, 1, CAST(N'2024-06-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (198, 11, 18, 1, CAST(N'2024-06-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (199, 11, 19, 1, CAST(N'2024-06-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (200, 11, 20, 1, CAST(N'2024-06-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (201, 11, 21, 1, CAST(N'2024-06-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (202, 11, 22, 1, CAST(N'2024-06-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (203, 12, 23, 1, CAST(N'2024-06-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (204, 12, 24, 1, CAST(N'2024-06-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (205, 12, 25, 1, CAST(N'2024-06-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (206, 12, 26, 1, CAST(N'2024-06-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (207, 12, 27, 1, CAST(N'2024-06-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (208, 12, 28, 1, CAST(N'2024-06-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (209, 12, 29, 1, CAST(N'2024-06-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (210, 12, 30, 1, CAST(N'2024-06-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (211, 1, 1, 1, CAST(N'2024-09-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (212, 2, 2, 1, CAST(N'2024-09-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (213, 3, 3, 1, CAST(N'2024-09-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (214, 3, 4, 1, CAST(N'2024-09-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (215, 3, 5, 1, CAST(N'2024-09-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (216, 3, 6, 1, CAST(N'2024-09-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (217, 5, 7, 1, CAST(N'2024-09-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (218, 5, 8, 1, CAST(N'2024-09-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (219, 5, 9, 1, CAST(N'2024-09-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (220, 5, 10, 1, CAST(N'2024-09-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (221, 1, 11, 1, CAST(N'2024-09-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (222, 1, 12, 1, CAST(N'2024-09-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (223, 1, 13, 1, CAST(N'2024-09-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (224, 1, 14, 1, CAST(N'2024-09-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (225, 2, 15, 1, CAST(N'2024-09-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (226, 2, 16, 1, CAST(N'2024-09-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (227, 2, 17, 1, CAST(N'2024-09-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (228, 2, 18, 1, CAST(N'2024-09-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (229, 1, 19, 1, CAST(N'2024-09-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (230, 1, 20, 1, CAST(N'2024-09-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (231, 1, 21, 1, CAST(N'2024-09-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (232, 1, 22, 1, CAST(N'2024-09-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (233, 1, 23, 1, CAST(N'2024-09-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (234, 1, 24, 1, CAST(N'2024-09-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (235, 1, 25, 1, CAST(N'2024-09-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (236, 1, 26, 1, CAST(N'2024-09-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (237, 1, 27, 1, CAST(N'2024-09-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (238, 1, 28, 1, CAST(N'2024-09-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (239, 1, 29, 1, CAST(N'2024-09-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (240, 1, 30, 1, CAST(N'2024-09-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (241, 5, 1, 1, CAST(N'2024-08-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (242, 5, 2, 1, CAST(N'2024-08-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (243, 5, 3, 1, CAST(N'2024-08-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (244, 5, 4, 1, CAST(N'2024-08-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (245, 5, 5, 1, CAST(N'2024-08-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (246, 5, 6, 1, CAST(N'2024-08-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (247, 5, 7, 1, CAST(N'2024-08-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (248, 5, 8, 1, CAST(N'2024-08-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (249, 5, 9, 1, CAST(N'2024-08-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (250, 5, 10, 1, CAST(N'2024-08-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (251, 5, 11, 1, CAST(N'2024-08-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (252, 5, 12, 1, CAST(N'2024-08-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (253, 5, 13, 1, CAST(N'2024-08-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (254, 5, 14, 1, CAST(N'2024-08-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (255, 5, 15, 1, CAST(N'2024-08-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (256, 5, 16, 1, CAST(N'2024-08-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (257, 5, 17, 1, CAST(N'2024-08-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (258, 5, 18, 1, CAST(N'2024-08-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (259, 8, 19, 1, CAST(N'2024-08-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (260, 8, 20, 1, CAST(N'2024-08-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (261, 8, 21, 1, CAST(N'2024-08-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (262, 8, 22, 1, CAST(N'2024-08-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (263, 3, 23, 1, CAST(N'2024-08-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (264, 3, 24, 1, CAST(N'2024-08-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (265, 3, 25, 1, CAST(N'2024-08-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (266, 3, 26, 1, CAST(N'2024-08-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (267, 8, 27, 1, CAST(N'2024-08-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (268, 8, 28, 1, CAST(N'2024-08-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (269, 8, 29, 1, CAST(N'2024-08-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (270, 8, 30, 1, CAST(N'2024-08-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (271, 13, 1, 1, CAST(N'2024-07-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (272, 13, 2, 1, CAST(N'2024-07-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (273, 13, 3, 1, CAST(N'2024-07-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (274, 13, 4, 1, CAST(N'2024-07-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (275, 13, 5, 1, CAST(N'2024-07-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (276, 13, 6, 1, CAST(N'2024-07-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (277, 13, 7, 1, CAST(N'2024-07-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (278, 13, 8, 1, CAST(N'2024-07-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (279, 13, 9, 1, CAST(N'2024-07-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (280, 13, 10, 1, CAST(N'2024-07-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (281, 13, 11, 1, CAST(N'2024-07-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (282, 13, 12, 1, CAST(N'2024-07-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (283, 13, 13, 1, CAST(N'2024-07-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (284, 13, 14, 1, CAST(N'2024-07-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (285, 13, 15, 1, CAST(N'2024-07-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (286, 13, 16, 1, CAST(N'2024-07-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (287, 13, 17, 1, CAST(N'2024-07-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (288, 13, 18, 1, CAST(N'2024-07-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (289, 13, 19, 1, CAST(N'2024-07-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (290, 13, 20, 1, CAST(N'2024-07-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (291, 13, 21, 1, CAST(N'2024-07-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (292, 13, 22, 1, CAST(N'2024-07-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (293, 13, 23, 1, CAST(N'2024-07-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (294, 13, 24, 1, CAST(N'2024-07-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (295, 13, 25, 1, CAST(N'2024-07-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (296, 13, 26, 1, CAST(N'2024-07-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (297, 13, 27, 1, CAST(N'2024-07-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (298, 13, 28, 1, CAST(N'2024-07-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (299, 13, 29, 1, CAST(N'2024-07-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (300, 13, 30, 1, CAST(N'2024-07-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (301, 4, 1, 1, CAST(N'2024-09-26T12:58:10.970' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (302, 5, 1, 1, CAST(N'2024-09-26T13:01:33.840' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (303, 5, 1, 1, CAST(N'2024-09-26T13:12:04.880' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (304, 5, 1, 1, CAST(N'2024-09-26T13:24:11.140' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (305, 5, 1, 1, CAST(N'2024-09-26T13:25:13.100' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (306, 5, 1, 1, CAST(N'2024-09-26T13:28:07.173' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (307, 5, 1, 1, CAST(N'2024-09-26T13:29:49.363' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (308, 5, 1, 1, CAST(N'2024-09-26T14:53:04.100' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (309, 5, 1, 1, CAST(N'2024-09-26T14:57:43.753' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (310, 5, 1, 1, CAST(N'2024-09-26T15:05:29.097' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (311, 5, 1, 1, CAST(N'2024-09-26T15:06:26.190' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (312, 5, 1, 1, CAST(N'2024-09-26T15:10:19.060' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (313, 5, 1, 1, CAST(N'2024-09-27T10:00:23.193' AS DateTime))
INSERT [dbo].[Stock_Enter] ([ID], [Stock], [ProductID], [UnitID], [EnterDate]) VALUES (314, 5, 1, 1, CAST(N'2024-09-27T11:00:46.360' AS DateTime))
SET IDENTITY_INSERT [dbo].[Stock_Enter] OFF
GO
SET IDENTITY_INSERT [dbo].[Stock_Exit] ON 

INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (1, 50, 1, 1, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (2, 45, 2, 1, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (3, 45, 3, 1, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (4, 30, 4, 1, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (5, 20, 5, 1, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (6, 30, 6, 1, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (7, 10, 7, 1, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (8, 15, 8, 1, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (9, 15, 9, 1, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (10, 13, 10, 1, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (11, 7, 11, 1, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (12, 9, 12, 1, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (13, 45, 13, 1, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (14, 5, 14, 1, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (15, 25, 15, 1, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (16, 14, 16, 1, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (17, 35, 17, 1, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (18, 12, 18, 1, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (19, 10, 19, 1, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (20, 40, 20, 1, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (21, 18, 21, 1, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (22, 22, 22, 1, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (23, 18, 23, 1, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (24, 11, 24, 1, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (25, 12, 25, 1, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (26, 5, 26, 1, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (27, 15, 27, 1, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (28, 25, 28, 1, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (29, 10, 29, 1, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (30, 5, 30, 1, CAST(N'2024-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (37, 45, 1, 1, CAST(N'2024-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (38, 35, 2, 1, CAST(N'2024-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (39, 55, 3, 1, CAST(N'2024-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (40, 28, 4, 1, CAST(N'2024-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (41, 22, 5, 1, CAST(N'2024-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (42, 38, 6, 1, CAST(N'2024-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (43, 30, 7, 1, CAST(N'2024-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (44, 50, 8, 1, CAST(N'2024-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (45, 25, 9, 1, CAST(N'2024-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (46, 45, 10, 1, CAST(N'2024-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (47, 32, 11, 1, CAST(N'2024-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (48, 40, 12, 1, CAST(N'2024-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (49, 28, 13, 1, CAST(N'2024-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (50, 50, 14, 1, CAST(N'2024-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (51, 55, 15, 1, CAST(N'2024-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (52, 42, 16, 1, CAST(N'2024-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (53, 35, 17, 1, CAST(N'2024-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (54, 28, 18, 1, CAST(N'2024-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (55, 33, 19, 1, CAST(N'2024-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (56, 40, 20, 1, CAST(N'2024-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (57, 25, 21, 1, CAST(N'2024-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (58, 30, 22, 1, CAST(N'2024-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (59, 35, 23, 1, CAST(N'2024-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (60, 40, 24, 1, CAST(N'2024-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (61, 45, 25, 1, CAST(N'2024-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (62, 50, 26, 1, CAST(N'2024-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (63, 55, 27, 1, CAST(N'2024-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (64, 30, 28, 1, CAST(N'2024-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (65, 35, 29, 1, CAST(N'2024-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (66, 20, 30, 1, CAST(N'2024-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (68, 20, 1, 1, CAST(N'2024-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (69, 10, 2, 1, CAST(N'2024-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (70, 12, 3, 1, CAST(N'2024-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (71, 10, 4, 1, CAST(N'2024-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (72, 11, 5, 1, CAST(N'2024-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (73, 12, 6, 1, CAST(N'2024-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (74, 32, 7, 1, CAST(N'2024-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (75, 41, 8, 1, CAST(N'2024-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (76, 54, 9, 1, CAST(N'2024-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (77, 11, 10, 1, CAST(N'2024-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (78, 12, 11, 1, CAST(N'2024-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (79, 13, 12, 1, CAST(N'2024-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (80, 45, 13, 1, CAST(N'2024-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (81, 21, 14, 1, CAST(N'2024-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (82, 23, 15, 1, CAST(N'2024-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (83, 12, 16, 1, CAST(N'2024-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (84, 22, 17, 1, CAST(N'2024-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (85, 10, 18, 1, CAST(N'2024-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (86, 25, 19, 1, CAST(N'2024-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (87, 42, 20, 1, CAST(N'2024-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (88, 23, 21, 1, CAST(N'2024-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (89, 21, 22, 1, CAST(N'2024-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (90, 11, 23, 1, CAST(N'2024-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (91, 14, 24, 1, CAST(N'2024-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (92, 45, 25, 1, CAST(N'2024-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (93, 41, 26, 1, CAST(N'2024-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (94, 4, 27, 1, CAST(N'2024-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (95, 10, 28, 1, CAST(N'2024-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (96, 10, 29, 1, CAST(N'2024-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (97, 13, 30, 1, CAST(N'2024-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (98, 48, 1, 1, CAST(N'2024-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (99, 42, 2, 1, CAST(N'2024-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (100, 58, 3, 1, CAST(N'2024-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (101, 33, 4, 1, CAST(N'2024-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (102, 27, 5, 1, CAST(N'2024-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (103, 35, 6, 1, CAST(N'2024-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (104, 38, 7, 1, CAST(N'2024-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (105, 52, 8, 1, CAST(N'2024-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (106, 45, 9, 1, CAST(N'2024-04-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (107, 40, 10, 1, CAST(N'2024-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (108, 32, 11, 1, CAST(N'2024-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (109, 28, 12, 1, CAST(N'2024-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (110, 40, 13, 1, CAST(N'2024-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (111, 50, 14, 1, CAST(N'2024-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (112, 60, 15, 1, CAST(N'2024-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (113, 48, 16, 1, CAST(N'2024-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (114, 45, 17, 1, CAST(N'2024-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (115, 42, 18, 1, CAST(N'2024-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (116, 33, 19, 1, CAST(N'2024-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (117, 50, 20, 1, CAST(N'2024-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (118, 25, 21, 1, CAST(N'2024-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (119, 35, 22, 1, CAST(N'2024-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (120, 38, 23, 1, CAST(N'2024-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (121, 40, 24, 1, CAST(N'2024-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (122, 55, 25, 1, CAST(N'2024-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (123, 60, 26, 1, CAST(N'2024-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (124, 40, 27, 1, CAST(N'2024-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (125, 30, 28, 1, CAST(N'2024-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (126, 35, 29, 1, CAST(N'2024-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (127, 22, 30, 1, CAST(N'2024-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (128, 9, 1, 1, CAST(N'2024-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (129, 9, 2, 1, CAST(N'2024-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (130, 9, 3, 1, CAST(N'2024-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (131, 9, 4, 1, CAST(N'2024-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (132, 9, 5, 1, CAST(N'2024-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (133, 9, 6, 1, CAST(N'2024-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (134, 9, 7, 1, CAST(N'2024-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (135, 9, 8, 1, CAST(N'2024-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (136, 9, 9, 1, CAST(N'2024-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (137, 9, 10, 1, CAST(N'2024-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (138, 9, 11, 1, CAST(N'2024-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (139, 11, 12, 1, CAST(N'2024-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (140, 11, 13, 1, CAST(N'2024-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (141, 11, 14, 1, CAST(N'2024-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (142, 11, 15, 1, CAST(N'2024-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (143, 11, 16, 1, CAST(N'2024-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (144, 11, 17, 1, CAST(N'2024-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (145, 11, 18, 1, CAST(N'2024-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (146, 11, 19, 1, CAST(N'2024-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (147, 11, 20, 1, CAST(N'2024-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (148, 11, 21, 1, CAST(N'2024-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (149, 11, 22, 1, CAST(N'2024-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (150, 12, 23, 1, CAST(N'2024-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (151, 12, 24, 1, CAST(N'2024-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (152, 12, 25, 1, CAST(N'2024-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (153, 12, 26, 1, CAST(N'2024-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (154, 12, 27, 1, CAST(N'2024-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (155, 12, 28, 1, CAST(N'2024-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (156, 12, 29, 1, CAST(N'2024-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (157, 12, 30, 1, CAST(N'2024-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (158, 15, 1, 1, CAST(N'2024-06-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (159, 15, 2, 1, CAST(N'2024-06-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (160, 15, 3, 1, CAST(N'2024-06-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (161, 15, 4, 1, CAST(N'2024-06-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (162, 15, 5, 1, CAST(N'2024-06-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (163, 15, 6, 1, CAST(N'2024-06-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (164, 15, 7, 1, CAST(N'2024-06-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (165, 15, 8, 1, CAST(N'2024-06-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (166, 15, 9, 1, CAST(N'2024-06-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (167, 15, 10, 1, CAST(N'2024-06-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (168, 15, 11, 1, CAST(N'2024-06-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (169, 11, 12, 1, CAST(N'2024-06-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (170, 11, 13, 1, CAST(N'2024-06-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (171, 11, 14, 1, CAST(N'2024-06-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (172, 11, 15, 1, CAST(N'2024-06-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (173, 11, 16, 1, CAST(N'2024-06-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (174, 11, 17, 1, CAST(N'2024-06-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (175, 11, 18, 1, CAST(N'2024-06-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (176, 11, 19, 1, CAST(N'2024-06-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (177, 11, 20, 1, CAST(N'2024-06-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (178, 11, 21, 1, CAST(N'2024-06-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (179, 11, 22, 1, CAST(N'2024-06-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (180, 12, 23, 1, CAST(N'2024-06-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (181, 12, 24, 1, CAST(N'2024-06-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (182, 12, 25, 1, CAST(N'2024-06-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (183, 12, 26, 1, CAST(N'2024-06-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (184, 12, 27, 1, CAST(N'2024-06-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (185, 12, 28, 1, CAST(N'2024-06-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (186, 12, 29, 1, CAST(N'2024-06-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (187, 12, 30, 1, CAST(N'2024-06-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (188, 8, 1, 1, CAST(N'2024-09-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (189, 8, 2, 1, CAST(N'2024-09-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (190, 8, 3, 1, CAST(N'2024-09-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (191, 8, 4, 1, CAST(N'2024-09-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (192, 8, 5, 1, CAST(N'2024-09-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (193, 8, 6, 1, CAST(N'2024-09-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (194, 8, 7, 1, CAST(N'2024-09-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (195, 8, 8, 1, CAST(N'2024-09-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (196, 8, 9, 1, CAST(N'2024-09-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (197, 8, 10, 1, CAST(N'2024-09-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (198, 8, 11, 1, CAST(N'2024-09-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (199, 8, 12, 1, CAST(N'2024-09-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (200, 8, 13, 1, CAST(N'2024-09-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (201, 8, 14, 1, CAST(N'2024-09-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (202, 8, 15, 1, CAST(N'2024-09-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (203, 8, 16, 1, CAST(N'2024-09-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (204, 8, 17, 1, CAST(N'2024-09-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (205, 8, 18, 1, CAST(N'2024-09-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (206, 8, 19, 1, CAST(N'2024-09-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (207, 8, 20, 1, CAST(N'2024-09-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (208, 8, 21, 1, CAST(N'2024-09-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (209, 8, 22, 1, CAST(N'2024-09-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (210, 8, 23, 1, CAST(N'2024-09-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (211, 8, 24, 1, CAST(N'2024-09-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (212, 8, 25, 1, CAST(N'2024-09-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (213, 8, 26, 1, CAST(N'2024-09-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (214, 8, 27, 1, CAST(N'2024-09-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (215, 8, 28, 1, CAST(N'2024-09-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (216, 8, 29, 1, CAST(N'2024-09-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (217, 8, 30, 1, CAST(N'2024-09-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (218, 13, 1, 1, CAST(N'2024-08-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (219, 13, 2, 1, CAST(N'2024-08-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (220, 13, 3, 1, CAST(N'2024-08-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (221, 13, 4, 1, CAST(N'2024-08-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (222, 13, 5, 1, CAST(N'2024-08-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (223, 13, 6, 1, CAST(N'2024-08-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (224, 13, 7, 1, CAST(N'2024-08-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (225, 13, 8, 1, CAST(N'2024-08-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (226, 13, 9, 1, CAST(N'2024-08-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (227, 13, 10, 1, CAST(N'2024-08-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (228, 13, 11, 1, CAST(N'2024-08-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (229, 13, 12, 1, CAST(N'2024-08-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (230, 13, 13, 1, CAST(N'2024-08-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (231, 13, 14, 1, CAST(N'2024-08-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (232, 13, 15, 1, CAST(N'2024-08-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (233, 13, 16, 1, CAST(N'2024-08-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (234, 13, 17, 1, CAST(N'2024-08-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (235, 13, 18, 1, CAST(N'2024-08-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (236, 13, 19, 1, CAST(N'2024-08-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (237, 13, 20, 1, CAST(N'2024-08-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (238, 13, 21, 1, CAST(N'2024-08-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (239, 13, 22, 1, CAST(N'2024-08-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (240, 13, 23, 1, CAST(N'2024-08-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (241, 13, 24, 1, CAST(N'2024-08-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (242, 13, 25, 1, CAST(N'2024-08-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (243, 13, 26, 1, CAST(N'2024-08-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (244, 13, 27, 1, CAST(N'2024-08-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (245, 13, 28, 1, CAST(N'2024-08-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (246, 13, 29, 1, CAST(N'2024-08-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (247, 13, 30, 1, CAST(N'2024-08-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (248, 13, 1, 1, CAST(N'2024-07-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (249, 13, 2, 1, CAST(N'2024-07-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (250, 13, 3, 1, CAST(N'2024-07-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (251, 13, 4, 1, CAST(N'2024-07-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (252, 13, 5, 1, CAST(N'2024-07-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (253, 13, 6, 1, CAST(N'2024-07-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (254, 13, 7, 1, CAST(N'2024-07-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (255, 13, 8, 1, CAST(N'2024-07-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (256, 13, 9, 1, CAST(N'2024-07-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (257, 13, 10, 1, CAST(N'2024-07-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (258, 13, 11, 1, CAST(N'2024-07-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (259, 13, 12, 1, CAST(N'2024-07-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (260, 13, 13, 1, CAST(N'2024-07-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (261, 13, 14, 1, CAST(N'2024-07-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (262, 13, 15, 1, CAST(N'2024-07-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (263, 13, 16, 1, CAST(N'2024-07-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (264, 13, 17, 1, CAST(N'2024-07-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (265, 13, 18, 1, CAST(N'2024-07-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (266, 13, 19, 1, CAST(N'2024-07-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (267, 13, 20, 1, CAST(N'2024-07-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (268, 13, 21, 1, CAST(N'2024-07-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (269, 13, 22, 1, CAST(N'2024-07-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (270, 13, 23, 1, CAST(N'2024-07-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (271, 13, 24, 1, CAST(N'2024-07-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (272, 13, 25, 1, CAST(N'2024-07-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (273, 13, 26, 1, CAST(N'2024-07-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (274, 13, 27, 1, CAST(N'2024-07-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (275, 13, 28, 1, CAST(N'2024-07-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (276, 13, 29, 1, CAST(N'2024-07-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (277, 13, 30, 1, CAST(N'2024-07-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (278, 5, 1, 1, CAST(N'2024-09-26T13:52:21.317' AS DateTime))
INSERT [dbo].[Stock_Exit] ([ID], [Stock], [ProductID], [UnitID], [ExitDate]) VALUES (279, 10, 1, 1, CAST(N'2024-09-26T14:16:14.890' AS DateTime))
SET IDENTITY_INSERT [dbo].[Stock_Exit] OFF
GO
SET IDENTITY_INSERT [dbo].[Unit] ON 

INSERT [dbo].[Unit] ([ID], [UnitName], [Status], [Description]) VALUES (1, N'Adet', 1, NULL)
SET IDENTITY_INSERT [dbo].[Unit] OFF
GO
/****** Object:  Index [UQ__ProductC__B40CC6EC394D12B4]    Script Date: 27.09.2024 20:47:45 ******/
ALTER TABLE [dbo].[ProductCost] ADD UNIQUE NONCLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Gender] FOREIGN KEY([GenderID])
REFERENCES [dbo].[Gender] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Gender]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Size] FOREIGN KEY([SizeID])
REFERENCES [dbo].[Size] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Size]
GO
ALTER TABLE [dbo].[ProductCost]  WITH CHECK ADD  CONSTRAINT [FK_ProductCost_Currency] FOREIGN KEY([CurrencyID])
REFERENCES [dbo].[Currency] ([ID])
GO
ALTER TABLE [dbo].[ProductCost] CHECK CONSTRAINT [FK_ProductCost_Currency]
GO
ALTER TABLE [dbo].[ProductPrice]  WITH CHECK ADD  CONSTRAINT [FK_PProductPrice_Currency] FOREIGN KEY([CurrencyID])
REFERENCES [dbo].[Currency] ([ID])
GO
ALTER TABLE [dbo].[ProductPrice] CHECK CONSTRAINT [FK_PProductPrice_Currency]
GO
ALTER TABLE [dbo].[ProductPrice]  WITH CHECK ADD  CONSTRAINT [FK_ProductPrice_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductPrice] CHECK CONSTRAINT [FK_ProductPrice_Product]
GO
ALTER TABLE [dbo].[Stock_Enter]  WITH CHECK ADD  CONSTRAINT [FK_Stock_Product2] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[Stock_Enter] CHECK CONSTRAINT [FK_Stock_Product2]
GO
ALTER TABLE [dbo].[Stock_Enter]  WITH CHECK ADD  CONSTRAINT [FK_Stock_Unit2] FOREIGN KEY([UnitID])
REFERENCES [dbo].[Unit] ([ID])
GO
ALTER TABLE [dbo].[Stock_Enter] CHECK CONSTRAINT [FK_Stock_Unit2]
GO
ALTER TABLE [dbo].[Stock_Exit]  WITH CHECK ADD  CONSTRAINT [FK_Stock_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[Stock_Exit] CHECK CONSTRAINT [FK_Stock_Product]
GO
ALTER TABLE [dbo].[Stock_Exit]  WITH CHECK ADD  CONSTRAINT [FK_Stock_Unit] FOREIGN KEY([UnitID])
REFERENCES [dbo].[Unit] ([ID])
GO
ALTER TABLE [dbo].[Stock_Exit] CHECK CONSTRAINT [FK_Stock_Unit]
GO
/****** Object:  StoredProcedure [dbo].[GetAllProductSummary]    Script Date: 27.09.2024 20:47:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllProductSummary]
AS
BEGIN
    SELECT 
        p.ID AS ProductID,               
        p.ProductName,                   
        c.CategoryName,                  
        gs.GelenStok,                    
        qs.ÇıkanStok,                    
        sp.AvgSalesPrice,                
        sp.AvgCostPrice ,
		sp.AvgCostPrice*gs.GelenStok as ToplamAlışMaliyeti,
		sp.AvgSalesPrice*qs.ÇıkanStok as ToplamSatışBedeli,
		(sp.AvgSalesPrice*qs.ÇıkanStok-sp.AvgCostPrice*gs.GelenStok) as ToplamKarZarar
    FROM 
        Product p                       
    JOIN
        Category c ON p.CategoryID = c.ID 
    LEFT JOIN
        (SELECT ProductID, SUM(Stock) AS GelenStok
         FROM Stock_Enter
         GROUP BY ProductID) gs           
    ON p.ID = gs.ProductID
    LEFT JOIN
        (SELECT ProductID, SUM(Stock) AS ÇıkanStok
         FROM Stock_Exit
         GROUP BY ProductID) qs          
    ON p.ID = qs.ProductID
    LEFT JOIN
        (SELECT 
            pp.ProductID,
            CAST(AVG(CAST(pp.Price AS DECIMAL(10,2))) AS DECIMAL(10,2)) AS AvgSalesPrice,
            CAST(AVG(CAST(pc.CostPrice AS DECIMAL(10,2))) AS DECIMAL(10,2)) AS AvgCostPrice
         FROM 
            ProductPrice pp
         JOIN 
            ProductCost pc ON pp.ProductID = pc.ProductID
         GROUP BY 
            pp.ProductID) sp              
    ON p.ID = sp.ProductID;
	end
GO
/****** Object:  StoredProcedure [dbo].[GEtAllProductsWithPrice]    Script Date: 27.09.2024 20:47:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GEtAllProductsWithPrice]
AS
BEGIN
    WITH LatestPrices AS (
        SELECT 
            pr.ProductID,
            pr.Price,
            pr.CurrencyID,
            pr.PriceChancingDate,
            ROW_NUMBER() OVER (PARTITION BY pr.ProductID ORDER BY pr.PriceChancingDate DESC) AS RowNum
        FROM 
            ProductPrice pr
    )
    SELECT 
        p.Status, 
        p.ID ,
        p.ProductName, 
        si.ShortName AS Size, 
        c.CategoryName, 
        lp.Price,                           -- En son fiyat
        cr.ShortName AS Currency, 
        p.CurrentStock, 
        p.WarningQuantity,
        p.CreateDate, 
        p.UpdateDate, 
        p.Status, 
        p.Description
    FROM 
        Product p
    JOIN 
        Category c ON p.CategoryID = c.ID
    JOIN 
        (SELECT * FROM LatestPrices WHERE RowNum = 1) lp ON lp.ProductID = p.ID -- Sadece en son fiyatları alıyoruz
    JOIN 
        Currency cr ON lp.CurrencyID = cr.ID
    JOIN 
        Size si ON si.ID = p.SizeID;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetLatestProductPricesByCategory]    Script Date: 27.09.2024 20:47:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetLatestProductPricesByCategory]
    @CategoryID INT  -- Kategori ID'sini parametre olarak alıyoruz
AS
BEGIN
    WITH LatestPrices AS (
        SELECT 
            pr.ProductID,
            pr.Price,
            pr.CurrencyID,
            pr.PriceChancingDate,
            ROW_NUMBER() OVER (PARTITION BY pr.ProductID ORDER BY pr.PriceChancingDate DESC) AS RowNum
        FROM 
            ProductPrice pr
    )
    SELECT 
        p.Status, 
        p.ID AS ProductID, 
        p.ProductName, 
        si.ShortName AS Size, 
        c.CategoryName, 
        lp.Price,                           -- En son fiyat
        cr.ShortName AS Currency, 
        p.CurrentStock, 
        p.WarningQuantity,
        p.CreateDate, 
        p.UpdateDate, 
        p.Status, 
        p.Description
    FROM 
        Product p
    JOIN 
        Category c ON p.CategoryID = c.ID
    JOIN 
        (SELECT * FROM LatestPrices WHERE RowNum = 1) lp ON lp.ProductID = p.ID -- Sadece en son fiyatları alıyoruz
    JOIN 
        Currency cr ON lp.CurrencyID = cr.ID
    JOIN 
        Size si ON si.ID = p.SizeID
    WHERE 
        p.CategoryID = @CategoryID;  -- Kategoriye göre filtreleme
END;
GO
/****** Object:  StoredProcedure [dbo].[GetProductStockAll]    Script Date: 27.09.2024 20:47:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetProductStockAll]
AS
BEGIN

    WITH TotalEnterCTE AS (
        SELECT 
            p.ID AS ProductID,
            COALESCE(SUM(E.Stock), 0) AS TotalEnter   
        FROM 
            Product p
        LEFT OUTER JOIN 
            Stock_Enter E ON p.ID = E.ProductID
        GROUP BY 
            p.ID
    ),
  
    TotalExitCTE AS (
        SELECT 
            p.ID AS ProductID,
            COALESCE(SUM(X.Stock), 0) AS TotalExit   
        FROM 
            Product p
        LEFT OUTER JOIN 
            Stock_Exit X ON p.ID = X.ProductID
        GROUP BY 
            p.ID
    )
    

    SELECT 
        p.ID AS ProductID,
        p.ProductName,
        COALESCE(TotalEnterCTE.TotalEnter, 0) AS TotalEnter,  
        COALESCE(TotalExitCTE.TotalExit, 0) AS TotalExit,     
        COALESCE(TotalEnterCTE.TotalEnter, 0) - COALESCE(TotalExitCTE.TotalExit, 0) AS CurrentStok 
    FROM 
        Product p
    LEFT JOIN 
        TotalEnterCTE ON p.ID = TotalEnterCTE.ProductID
    LEFT JOIN 
        TotalExitCTE ON p.ID = TotalExitCTE.ProductID
    ORDER BY 
        p.ID;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetProductStockAll_ProductId]    Script Date: 27.09.2024 20:47:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetProductStockAll_ProductId]
 @productID INT
AS
BEGIN

    WITH TotalEnterCTE AS (
        SELECT 
            p.ID AS ProductID,
            COALESCE(SUM(E.Stock), 0) AS TotalEnter   
        FROM 
            Product p
        LEFT OUTER JOIN 
            Stock_Enter E ON p.ID = E.ProductID
        GROUP BY 
            p.ID
    ),
  
    TotalExitCTE AS (
        SELECT 
            p.ID AS ProductID,
            COALESCE(SUM(X.Stock), 0) AS TotalExit   
        FROM 
            Product p
        LEFT OUTER JOIN 
            Stock_Exit X ON p.ID = X.ProductID
        GROUP BY 
            p.ID
    )
    

    SELECT 
        p.ID AS ProductID,
        p.ProductName,
        COALESCE(TotalEnterCTE.TotalEnter, 0) AS TotalEnter,  
        COALESCE(TotalExitCTE.TotalExit, 0) AS TotalExit,     
        COALESCE(TotalEnterCTE.TotalEnter, 0) - COALESCE(TotalExitCTE.TotalExit, 0) AS CurrentStok 
    FROM 
        Product p
    LEFT JOIN 
        TotalEnterCTE ON p.ID = TotalEnterCTE.ProductID
    LEFT JOIN 
        TotalExitCTE ON p.ID = TotalExitCTE.ProductID
   where p.ID=@productID
END;
GO
/****** Object:  StoredProcedure [dbo].[GetProdutcPriceSummary]    Script Date: 27.09.2024 20:47:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetProdutcPriceSummary]
    @productId INT
AS
BEGIN
    SELECT 
        gs.ProductID,
        gs.GelenStok,                  
        qs.ÇıkanStok,                   
        sp.AvgSalesPrice,               
        sp.AvgCostPrice                
    FROM 
        (SELECT ProductID, SUM(Stock) AS GelenStok
         FROM Stock_Enter
         WHERE ProductID = @productId
         GROUP BY ProductID) gs          
    CROSS JOIN
        (SELECT ProductID, SUM(Stock) AS ÇıkanStok
         FROM Stock_Exit
         WHERE ProductID = @productId
         GROUP BY ProductID) qs         
    CROSS JOIN
        (SELECT 
            CAST(AVG(CAST(pp.Price AS DECIMAL(10,2))) AS DECIMAL(10,2)) AS AvgSalesPrice,
            CAST(AVG(CAST(pc.CostPrice AS DECIMAL(10,2))) AS DECIMAL(10,2)) AS AvgCostPrice
         FROM 
            ProductPrice pp
         JOIN 
            ProductCost pc ON pp.ProductID = pc.ProductID
         WHERE 
            pp.ProductID = @productId) sp          
END;
GO
/****** Object:  StoredProcedure [dbo].[GetStockMovementDetails]    Script Date: 27.09.2024 20:47:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetStockMovementDetails]
AS
BEGIN
   SELECT 
    p.ID AS ProductId,
    p.ProductName,
	p.Status,
	u.UnitName,
    si.ShortName AS Size, 
    c.CategoryName,
    c.ID AS CategoryId, 
    SUM(s.Stock) AS TotalEntryQuantity,    
	p.CurrentStock,
	p.WarningQuantity,
    MAX(s.EnterDate) AS LastEntryDate   
FROM Product p
JOIN Category c ON p.CategoryID = c.ID
JOIN Stock_Enter s ON s.ProductID = p.ID
JOIN Unit u ON s.UnitID = u.ID
JOIN Size si ON si.ID = p.SizeID
GROUP BY p.ID, p.ProductName, si.ShortName, c.CategoryName, c.ID,p.CurrentStock,p.WarningQuantity,u.UnitName,P.Status
ORDER BY p.ID;

END
GO
USE [master]
GO
ALTER DATABASE [StockManagment] SET  READ_WRITE 
GO
