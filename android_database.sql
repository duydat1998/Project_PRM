USE [master]
GO
/****** Object:  Database [Android_Assignment]    Script Date: 2/28/2019 9:24:47 AM ******/
CREATE DATABASE [Android_Assignment]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Android_Assignment', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\Android_Assignment.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Android_Assignment_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\Android_Assignment_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Android_Assignment] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Android_Assignment].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Android_Assignment] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Android_Assignment] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Android_Assignment] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Android_Assignment] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Android_Assignment] SET ARITHABORT OFF 
GO
ALTER DATABASE [Android_Assignment] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Android_Assignment] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Android_Assignment] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Android_Assignment] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Android_Assignment] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Android_Assignment] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Android_Assignment] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Android_Assignment] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Android_Assignment] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Android_Assignment] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Android_Assignment] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Android_Assignment] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Android_Assignment] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Android_Assignment] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Android_Assignment] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Android_Assignment] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Android_Assignment] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Android_Assignment] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Android_Assignment] SET  MULTI_USER 
GO
ALTER DATABASE [Android_Assignment] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Android_Assignment] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Android_Assignment] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Android_Assignment] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Android_Assignment] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Android_Assignment] SET QUERY_STORE = OFF
GO
USE [Android_Assignment]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [Android_Assignment]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 2/28/2019 9:24:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](10) NOT NULL,
	[lastname] [nvarchar](50) NOT NULL,
	[firstname] [nvarchar](50) NULL,
	[registerDate] [date] NULL,
 CONSTRAINT [PK_tblAdmin] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 2/28/2019 9:24:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brand](
	[brandID] [nvarchar](10) NOT NULL,
	[brandName] [nvarchar](20) NULL,
	[nation] [nvarchar](20) NULL,
 CONSTRAINT [PK_tblBrand] PRIMARY KEY CLUSTERED 
(
	[brandID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CPU]    Script Date: 2/28/2019 9:24:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CPU](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[cpuID]  AS ('cpu'+right('0000'+CONVERT([varchar](4),[ID]),(4))) PERSISTED,
	[name] [nvarchar](50) NULL,
	[brandId] [nvarchar](10) NOT NULL,
	[category] [nvarchar](50) NULL,
	[socket] [int] NULL,
	[weight] [float] NULL,
	[clockSpeed] [float] NULL,
	[TDP] [int] NULL,
	[thread] [int] NULL,
	[averagePrice] [float] NULL,
	[image1] [nvarchar](max) NULL,
	[image2] [nvarchar](max) NULL,
	[image3] [nvarchar](max) NULL,
 CONSTRAINT [PK_tblCPU] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HeadPhone]    Script Date: 2/28/2019 9:24:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HeadPhone](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[headphoneID]  AS ('hp'+right('0000'+CONVERT([varchar](4),[ID]),(4))) PERSISTED,
	[name] [nvarchar](50) NULL,
	[brandId] [nvarchar](10) NULL,
	[category] [nvarchar](50) NULL,
	[type] [nvarchar](20) NULL,
	[micro] [nvarchar](10) NULL,
	[jack] [nvarchar](10) NULL,
	[frequencyRange] [nvarchar](20) NULL,
	[bluetooth] [nvarchar](50) NULL,
	[length] [float] NULL,
	[averagePrice] [int] NULL,
	[image1] [nvarchar](max) NULL,
	[image2] [nvarchar](max) NULL,
	[image3] [nvarchar](max) NULL,
 CONSTRAINT [PK_tblHeadPhone] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Keyboard]    Script Date: 2/28/2019 9:24:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Keyboard](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[keyboardID]  AS ('kb'+right('0000'+CONVERT([varchar](4),[ID]),(4))) PERSISTED,
	[name] [nvarchar](50) NULL,
	[brandId] [nvarchar](10) NULL,
	[category] [nvarchar](50) NULL,
	[connect] [nvarchar](50) NULL,
	[bluetooth] [nvarchar](50) NULL,
	[height] [int] NULL,
	[length] [int] NULL,
	[width] [int] NULL,
	[averagePrice] [int] NULL,
	[image1] [nvarchar](max) NULL,
	[image2] [nvarchar](max) NULL,
	[image3] [nvarchar](max) NULL,
 CONSTRAINT [PK_tblKeyboard] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Laptop]    Script Date: 2/28/2019 9:24:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Laptop](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[laptopID]  AS ('lt'+right('0000'+CONVERT([varchar](4),[ID]),(4))) PERSISTED,
	[name] [nvarchar](50) NULL,
	[brandId] [nvarchar](10) NOT NULL,
	[category] [nvarchar](50) NULL,
	[type] [nvarchar](50) NOT NULL,
	[year] [int] NULL,
	[chip] [nvarchar](max) NULL,
	[ram] [nvarchar](max) NULL,
	[rom] [nvarchar](max) NULL,
	[screenSize] [float] NULL,
	[webcam] [nvarchar](50) NULL,
	[wifi] [nvarchar](50) NULL,
	[OS] [nvarchar](50) NULL,
	[weight] [float] NULL,
	[battery] [nvarchar](50) NULL,
	[averagePrice] [int] NULL,
	[image1] [nvarchar](max) NULL,
	[image2] [nvarchar](max) NULL,
	[image3] [nvarchar](max) NULL,
 CONSTRAINT [PK_tblLaptop] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mouse]    Script Date: 2/28/2019 9:24:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mouse](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[mouseID]  AS ('mouse'+right('0000'+CONVERT([varchar](4),[ID]),(4))) PERSISTED,
	[name] [nvarchar](50) NULL,
	[brandId] [nvarchar](10) NULL,
	[category] [nvarchar](50) NULL,
	[type] [nvarchar](50) NULL,
	[wireless] [nvarchar](50) NULL,
	[bluetooth] [nvarchar](50) NULL,
	[weight] [float] NULL,
	[averagePrice] [float] NULL,
	[image1] [nvarchar](max) NULL,
	[image2] [nvarchar](max) NULL,
	[image3] [nvarchar](max) NULL,
 CONSTRAINT [PK_tblMouse] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VGA]    Script Date: 2/28/2019 9:24:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VGA](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[vgaID]  AS ('vga'+right('0000'+CONVERT([varchar](4),[ID]),(4))) PERSISTED,
	[name] [nvarchar](max) NULL,
	[brandId] [nvarchar](10) NULL,
	[category] [nvarchar](50) NULL,
	[standardMemory] [int] NULL,
	[maxScreenResolution] [nvarchar](50) NULL,
	[weight] [float] NULL,
	[size] [nvarchar](2) NULL,
	[averagePrice] [float] NULL,
	[image1] [nvarchar](max) NULL,
	[image2] [nvarchar](max) NULL,
	[image3] [nvarchar](max) NULL,
 CONSTRAINT [PK_VGA] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Admin] ([username], [password], [lastname], [firstname], [registerDate]) VALUES (N'datnd', N'123', N'Dat', N'Nguyen', CAST(N'2019-02-22' AS Date))
INSERT [dbo].[Admin] ([username], [password], [lastname], [firstname], [registerDate]) VALUES (N'hoang', N'123', N'Hoang', N'Duong', CAST(N'2019-02-22' AS Date))
INSERT [dbo].[Brand] ([brandID], [brandName], [nation]) VALUES (N'brandAKG', N'AKG', N'USA')
INSERT [dbo].[Brand] ([brandID], [brandName], [nation]) VALUES (N'brandApple', N'Apple', N'USA')
INSERT [dbo].[Brand] ([brandID], [brandName], [nation]) VALUES (N'brandASUS', N'ASUS', N'Taiwan')
INSERT [dbo].[Brand] ([brandID], [brandName], [nation]) VALUES (N'brandDell', N'Dell', N'USA')
INSERT [dbo].[Brand] ([brandID], [brandName], [nation]) VALUES (N'brandIntel', N'Intel', N'USA')
INSERT [dbo].[Brand] ([brandID], [brandName], [nation]) VALUES (N'brandLogi', N'Logitech', N'USA')
INSERT [dbo].[Brand] ([brandID], [brandName], [nation]) VALUES (N'brandMSI', N'MSI', N'Taiwan')
INSERT [dbo].[Brand] ([brandID], [brandName], [nation]) VALUES (N'brandPalit', N'Palit', N'Taiwan')
INSERT [dbo].[Brand] ([brandID], [brandName], [nation]) VALUES (N'brandSam', N'Samsung', N'Korea')
INSERT [dbo].[Brand] ([brandID], [brandName], [nation]) VALUES (N'brandSony', N'Sony', N'Japan')
INSERT [dbo].[Brand] ([brandID], [brandName], [nation]) VALUES (N'brandSteel', N'SteelSeries', N'Danish')
SET IDENTITY_INSERT [dbo].[CPU] ON 

INSERT [dbo].[CPU] ([ID], [name], [brandId], [category], [socket], [weight], [clockSpeed], [TDP], [thread], [averagePrice], [image1], [image2], [image3]) VALUES (1, N'INTEL® PENTIUM® PROCESSOR G4560', N'brandIntel', N'cpu', 1151, 0.74, 3.5, 54, 2, 95.7, N'https://salt.tikicdn.com/cache/w1200/ts/product/85/ea/6d/8ec1a47a208dcdc05f5905a0bd4cbe6a.png', N'https://salt.tikicdn.com/cache/w1200/ts/product/85/ea/6d/8ec1a47a208dcdc05f5905a0bd4cbe6a.png', N'https://salt.tikicdn.com/cache/w1200/ts/product/03/19/e9/4aac9273db2547737550879bdf0301d9.png')
INSERT [dbo].[CPU] ([ID], [name], [brandId], [category], [socket], [weight], [clockSpeed], [TDP], [thread], [averagePrice], [image1], [image2], [image3]) VALUES (3, N'INTEL CORE I5-8600K', N'brandIntel', N'cpu', 1151, 2.3, 4.3, 95, 6, 259.89, N'https://azcd.harveynorman.com.au/media/catalog/product/cache/21/image/992x558/9df78eab33525d08d6e5fb8d27136e95/1/_/1_38_2678.jpg', N'https://azcd.harveynorman.com.au/media/catalog/product/cache/21/image/992x558/9df78eab33525d08d6e5fb8d27136e95/1/_/1_38_2678.jpg', NULL)
SET IDENTITY_INSERT [dbo].[CPU] OFF
SET IDENTITY_INSERT [dbo].[HeadPhone] ON 

INSERT [dbo].[HeadPhone] ([ID], [name], [brandId], [category], [type], [micro], [jack], [frequencyRange], [bluetooth], [length], [averagePrice], [image1], [image2], [image3]) VALUES (1, N'AKG N40', N'brandAKG', N'headphone', N'in-ear', N'yes', N'3.5', N'10Hz - 40kHz', N'No', 1.3, 7500000, N'https://cdn.mos.cms.futurecdn.net/RyXh5ApSpEk3sytPA2iSW6-480-80.jpg', N'https://nerdtechy.com/wp-content/uploads/bfi_thumb/AKG-N40-Review-33fuunc0m6pwuxq6rh9ukq.jpg', NULL)
INSERT [dbo].[HeadPhone] ([ID], [name], [brandId], [category], [type], [micro], [jack], [frequencyRange], [bluetooth], [length], [averagePrice], [image1], [image2], [image3]) VALUES (2, N'AKG K141 MKII', N'brandAKG', N'headphone', N'over-ear', N'no', N'USB 3.0', N'18Hz - 24kHz', N'No', 2.3, 4000000, N'https://images-na.ssl-images-amazon.com/images/I/41vShYPdPKL.jpg', N'https://images-na.ssl-images-amazon.com/images/I/81hmf32n-vL._SX425_.jpg', NULL)
SET IDENTITY_INSERT [dbo].[HeadPhone] OFF
SET IDENTITY_INSERT [dbo].[Keyboard] ON 

INSERT [dbo].[Keyboard] ([ID], [name], [brandId], [category], [connect], [bluetooth], [height], [length], [width], [averagePrice], [image1], [image2], [image3]) VALUES (1, N'Logitech G213 Prodigy RGB Membrane', N'brandLogi', N'keyboard', N'USB 3.0', N'No', 0, 45, 21, 1000000, N'https://www.logitechg.com/content/dam/products/gaming/keyboards/g213-rgb-gaming-keyboard/g213-prodigy-gaming-keyboard15.png', N'https://www.logitechg.com/content/dam/gaming/en/products/g213/g213-brown-hero.png.imgw.2000.2000.png', NULL)
INSERT [dbo].[Keyboard] ([ID], [name], [brandId], [category], [connect], [bluetooth], [height], [length], [width], [averagePrice], [image1], [image2], [image3]) VALUES (3, N'Logitech K270 ', N'brandLogi', N'keyboard', N'Wireless 2.4Ghz', N'Yes', 5, 50, 20, 360000, N'https://assets.logitech.com/assets/55135/k270-gallery.png', N'https://brain-images-ssl.cdn.dixons.com/3/2/10139223/l_10139223_001.jpg', NULL)
SET IDENTITY_INSERT [dbo].[Keyboard] OFF
SET IDENTITY_INSERT [dbo].[Laptop] ON 

INSERT [dbo].[Laptop] ([ID], [name], [brandId], [category], [type], [year], [chip], [ram], [rom], [screenSize], [webcam], [wifi], [OS], [weight], [battery], [averagePrice], [image1], [image2], [image3]) VALUES (1, N'Asus Zenbook 13', N'brandASUS', N'laptop', N'zenbook', 2018, N'Intel Core i5-8265U (1.60GHz Up to 3.90 GHz, 4Cores, 8Threads, 6MB Cache, FSB 4GT/s)', N'8GB LPDDR3-2133Mhz (Onboard)', N'256GB SSD M.2 PCIe', 13.3, N'HD Web Camera', N'802.11ac', N'Windows 10', 1.09, N'3-Cell 50WHr ', 20700000, N'https://salt.tikicdn.com/cache/w1200/ts/product/98/a9/0f/5b3e90c38c5645995fc00331047d3bb7.jpg', N'https://salt.tikicdn.com/cache/w1200/ts/product/1a/23/b8/36ac508658442fd06d0dba1a4ab726e9.jpg', N'https://salt.tikicdn.com/cache/w1200/ts/product/36/00/4f/e2f27217a9618c9bafe04a712e7524ae.jpg')
INSERT [dbo].[Laptop] ([ID], [name], [brandId], [category], [type], [year], [chip], [ram], [rom], [screenSize], [webcam], [wifi], [OS], [weight], [battery], [averagePrice], [image1], [image2], [image3]) VALUES (2, N'Vivobook S15', N'brandASUS', N'laptop', N'vivobook', 2017, N'Intel Core i3-8130U (2.2GHz up to 3.4GHz 4MB)', N'4GB DDR4 2400MHz (2x SO-DIMM socket, up to 24GB SDRAM)', N'HDD 1TB 5400rpm, x1 slot SSD M.2 SATA', 15.6, N'HD Web Camera', N'802.11 AC (2X2)', N'Windows 10', 1.8, N'3-Cell 42WHr ', 12400000, N'https://salt.tikicdn.com/cache/w1200/ts/product/42/3c/e4/c7de28fd1ab78d85438c78e5fbe540a1.jpg', N'https://salt.tikicdn.com/cache/w1200/ts/product/52/44/53/a87bdbb02d8ac54e458ae252c2250c51.jpg', N'https://salt.tikicdn.com/cache/w1200/ts/product/2b/63/56/73dbbe80be8d19dbfce60f9cf6235b18.jpg')
SET IDENTITY_INSERT [dbo].[Laptop] OFF
SET IDENTITY_INSERT [dbo].[Mouse] ON 

INSERT [dbo].[Mouse] ([ID], [name], [brandId], [category], [type], [wireless], [bluetooth], [weight], [averagePrice], [image1], [image2], [image3]) VALUES (1, N'LOGITECH G102', N'brandLogi', N'mouse', N'gaming', N'yes', N'yes', 2.9, 20, N'https://salt.tikicdn.com/cache/w1200/ts/product/c1/87/f1/8cd5fabbc67f3b05b0054c3b7a553d04.jpg', N'https://salt.tikicdn.com/cache/w1200/ts/product/80/24/81/7bc770cc94c97f56b7a0f0291af15fd0.jpg', N'https://salt.tikicdn.com/cache/w1200/ts/product/42/7a/cc/b2fbc54fad6cab52c52592ac6ad8bc59.jpg')
INSERT [dbo].[Mouse] ([ID], [name], [brandId], [category], [type], [wireless], [bluetooth], [weight], [averagePrice], [image1], [image2], [image3]) VALUES (2, N'STEELSERIES RIVAL 650', N'brandSteel', N'mouse', N'gaming', N'yes', N'yes', 5.8, 92.99, N'https://media.steelseriescdn.com/thumbs/filer_public/9c/5f/9c5f0245-cde9-4f41-b1ba-f8fa12037bd6/650wl_web_gallery_001.jpg__1920x1920_q100_crop-fit_optimize_subsampling-2.jpg', N'https://www.evetech.co.za/repository/ProductImages/steelseries-rival-650-wireless-optical-gaming-mouse-1000px-v1-0005.jpg', NULL)
SET IDENTITY_INSERT [dbo].[Mouse] OFF
SET IDENTITY_INSERT [dbo].[VGA] ON 

INSERT [dbo].[VGA] ([ID], [name], [brandId], [category], [standardMemory], [maxScreenResolution], [weight], [size], [averagePrice], [image1], [image2], [image3]) VALUES (1, N'MSI Gaming GeForce GTX 1080 8GB', N'brandMSI', N'vga', 8, N'3840 x 2160', 3.7, N'L', 840, N'https://images-na.ssl-images-amazon.com/images/I/51Avu5iodlL._SX425_.jpg', N'https://www.bhphotovideo.com/images/images2500x2500/msi_gtx_1070_gaming_x_8g_geforce_gtx_1070_gaming_1260393.jpg', NULL)
INSERT [dbo].[VGA] ([ID], [name], [brandId], [category], [standardMemory], [maxScreenResolution], [weight], [size], [averagePrice], [image1], [image2], [image3]) VALUES (2, N'PALIT GTX 1060 DUAL FAN 6GB', N'brandPalit', N'vga', 6, N'3840 x 2160', 4.45, N'L', 279.99, N'https://c.76.my/Malaysia/palit-gtx1060-dual-fan-6gb-ddr5-192-bit-graphic-card-occasin-1806-28-F1027603_1.jpg', N'https://images-na.ssl-images-amazon.com/images/I/81ku-vSnYnL._SY355_.jpg', NULL)
SET IDENTITY_INSERT [dbo].[VGA] OFF
USE [master]
GO
ALTER DATABASE [Android_Assignment] SET  READ_WRITE 
GO
