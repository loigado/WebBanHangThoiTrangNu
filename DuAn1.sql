CREATE DATABASE [DB_DuAN1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DB_DuAN1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER01\MSSQL\DATA\DB_DuAN1.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DB_DuAN1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER01\MSSQL\DATA\DB_DuAN1_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [DB_DuAN1] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DB_DuAN1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DB_DuAN1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DB_DuAN1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DB_DuAN1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DB_DuAN1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DB_DuAN1] SET ARITHABORT OFF 
GO
ALTER DATABASE [DB_DuAN1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DB_DuAN1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DB_DuAN1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DB_DuAN1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DB_DuAN1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DB_DuAN1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DB_DuAN1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DB_DuAN1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DB_DuAN1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DB_DuAN1] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DB_DuAN1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DB_DuAN1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DB_DuAN1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DB_DuAN1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DB_DuAN1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DB_DuAN1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DB_DuAN1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DB_DuAN1] SET RECOVERY FULL 
GO
ALTER DATABASE [DB_DuAN1] SET  MULTI_USER 
GO
ALTER DATABASE [DB_DuAN1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DB_DuAN1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DB_DuAN1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DB_DuAN1] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DB_DuAN1] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DB_DuAN1] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DB_DuAN1', N'ON'
GO
ALTER DATABASE [DB_DuAN1] SET QUERY_STORE = OFF
GO
USE [DB_DuAN1]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 11/28/2025 1:31:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Fullname] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Photo] [nvarchar](50) NOT NULL,
	[Activated] [bit] NOT NULL,
	[Admin] [bit] NOT NULL,
CONSTRAINT [PK_Accounts] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Carts]    Script Date: 11/28/2025 1:31:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carts](
	[username] [nvarchar](50) NOT NULL,
	[product_id] [int] NOT NULL,
	[quantity] [int] NULL,
 CONSTRAINT [PK_Carts] PRIMARY KEY CLUSTERED 
(
	[username] ASC,
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 11/28/2025 1:31:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [char](4) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[is_delete] [bit] NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_Details]    Script Date: 11/28/2025 1:31:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Details](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[order_id] [bigint] NULL,
	[product_id] [int] NULL,
	[Price] [float] NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 11/28/2025 1:31:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[create_date] [date] NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
	[total] [float] NOT NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 11/28/2025 1:31:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Image] [nvarchar](max) NULL,
	[Price] [float] NOT NULL,
	[create_date] [date] NOT NULL,
	[Quantity] [int] NOT NULL,
	[category_id] [char](4) NOT NULL,
	[is_delete] [bit] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'loigado00@gmail.com', N'19abcf57afe', N'Tấn Lợi', N'loigado00@gmail.com', N'user.png', 0, 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'loigado2212@gmail.com', N'19ac924dc54', N'Tấn Lợi', N'loigado2212@gmail.com', N'default.png', 1, 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'loiltps33442@fpt.edu.vn', N'19abcfca904', N'Le Tan Loi (FPL HCM)', N'loiltps33442@fpt.edu.vn', N'user.png', 1, 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'NV001', N'123123', N'Lê Tấn Lợi', N'loigado00@gmail.com', N'vuong.jpg', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'NV002', N'123456', N'Admin2', N'admin123@fpt.edu.vn', N'nhat.jpg', 0, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'NV003', N'123456', N'User1', N'user1@fpt.edu.vn', N'loan.jpg', 0, 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'NV004', N'123456', N'User2', N'user2@fpt.edu.vn', N'nga.jpg', 1, 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'NV005', N'123456', N'User3', N'user3@fpt.edu.vn', N'phi.jpg', 1, 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'NV006', N'123456', N'User4', N'user4@fpt.edu.vn', N'thang.jpg', 1, 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'NV007', N'123456', N'User5', N'user5@fpt.edu.vn', N'truong.jpg', 0, 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'NV011', N'123456', N'user6', N'nv6@gmail.com', N'default.jpg', 0, 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'NV11', N'123456', N'Khách Hàng 1', N'nv11@gmail.com', N'default.jpg', 0, 0)
GO
INSERT [dbo].[Carts] ([username], [product_id], [quantity]) VALUES (N'loiltps33442@fpt.edu.vn', 8, 1)
INSERT [dbo].[Carts] ([username], [product_id], [quantity]) VALUES (N'NV002', 31, 1)
GO
INSERT [dbo].[Categories] ([Id], [Name], [is_delete]) VALUES (N'ca01', N'Áo thun', 0)
INSERT [dbo].[Categories] ([Id], [Name], [is_delete]) VALUES (N'ca02', N'Áo khoác', 0)
INSERT [dbo].[Categories] ([Id], [Name], [is_delete]) VALUES (N'ca03', N'Quần short', 0)
INSERT [dbo].[Categories] ([Id], [Name], [is_delete]) VALUES (N'ca04', N'Quần dài', 0)
INSERT [dbo].[Categories] ([Id], [Name], [is_delete]) VALUES (N'ca05', N'Váy', 0)
INSERT [dbo].[Categories] ([Id], [Name], [is_delete]) VALUES (N'ca06', N'Giày', 0)
GO
SET IDENTITY_INSERT [dbo].[Order_Details] ON 

INSERT [dbo].[Order_Details] ([Id], [order_id], [product_id], [Price], [Quantity]) VALUES (1, 1, 5, 165000, 1)
INSERT [dbo].[Order_Details] ([Id], [order_id], [product_id], [Price], [Quantity]) VALUES (2, 1, 7, 159000, 1)
INSERT [dbo].[Order_Details] ([Id], [order_id], [product_id], [Price], [Quantity]) VALUES (3, 1, 8, 159000, 1)
INSERT [dbo].[Order_Details] ([Id], [order_id], [product_id], [Price], [Quantity]) VALUES (4, 2, 10, 132000, 1)
INSERT [dbo].[Order_Details] ([Id], [order_id], [product_id], [Price], [Quantity]) VALUES (5, 2, 11, 129000, 1)
INSERT [dbo].[Order_Details] ([Id], [order_id], [product_id], [Price], [Quantity]) VALUES (6, 3, 15, 175000, 2)
INSERT [dbo].[Order_Details] ([Id], [order_id], [product_id], [Price], [Quantity]) VALUES (7, 6, 20, 325000, 1)
INSERT [dbo].[Order_Details] ([Id], [order_id], [product_id], [Price], [Quantity]) VALUES (8, 7, 20, 325000, 1)
INSERT [dbo].[Order_Details] ([Id], [order_id], [product_id], [Price], [Quantity]) VALUES (9, 7, 36, 75000, 1)
INSERT [dbo].[Order_Details] ([Id], [order_id], [product_id], [Price], [Quantity]) VALUES (10, 8, 29, 69000, 1)
INSERT [dbo].[Order_Details] ([Id], [order_id], [product_id], [Price], [Quantity]) VALUES (11, 8, 30, 63000, 1)
INSERT [dbo].[Order_Details] ([Id], [order_id], [product_id], [Price], [Quantity]) VALUES (12, 8, 31, 29000, 1)
INSERT [dbo].[Order_Details] ([Id], [order_id], [product_id], [Price], [Quantity]) VALUES (13, 8, 42, 99000, 1)
INSERT [dbo].[Order_Details] ([Id], [order_id], [product_id], [Price], [Quantity]) VALUES (14, 8, 43, 127000, 1)
INSERT [dbo].[Order_Details] ([Id], [order_id], [product_id], [Price], [Quantity]) VALUES (15, 8, 44, 139000, 1)
INSERT [dbo].[Order_Details] ([Id], [order_id], [product_id], [Price], [Quantity]) VALUES (16, 8, 45, 239000, 6)
INSERT [dbo].[Order_Details] ([Id], [order_id], [product_id], [Price], [Quantity]) VALUES (17, 8, 46, 105000, 1)
INSERT [dbo].[Order_Details] ([Id], [order_id], [product_id], [Price], [Quantity]) VALUES (18, 9, 7, 159000, 2)
INSERT [dbo].[Order_Details] ([Id], [order_id], [product_id], [Price], [Quantity]) VALUES (19, 10, 12, 133000, 1)
INSERT [dbo].[Order_Details] ([Id], [order_id], [product_id], [Price], [Quantity]) VALUES (20, 11, 31, 29000, 1)
SET IDENTITY_INSERT [dbo].[Order_Details] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [Username], [create_date], [Address], [total], [status]) VALUES (1, N'NV001', CAST(N'2023-05-26' AS Date), N'965 Quang Trung', 483000, 1)
INSERT [dbo].[Orders] ([Id], [Username], [create_date], [Address], [total], [status]) VALUES (2, N'NV002', CAST(N'2023-05-26' AS Date), N'Gò Vấp', 261000, 0)
INSERT [dbo].[Orders] ([Id], [Username], [create_date], [Address], [total], [status]) VALUES (3, N'NV001', CAST(N'2023-05-26' AS Date), N'965 Quang Trung', 350000, 1)
INSERT [dbo].[Orders] ([Id], [Username], [create_date], [Address], [total], [status]) VALUES (6, N'NV001', CAST(N'2023-05-29' AS Date), N'965/45/14 Quang Trung HC', 325000, 0)
INSERT [dbo].[Orders] ([Id], [Username], [create_date], [Address], [total], [status]) VALUES (7, N'NV001', CAST(N'2023-05-29' AS Date), N'965/45/14 Quang Trung HC', 400000, 0)
INSERT [dbo].[Orders] ([Id], [Username], [create_date], [Address], [total], [status]) VALUES (8, N'NV001', CAST(N'2023-05-30' AS Date), N'965/45/14 Quang Trung HC', 2065000, 0)
INSERT [dbo].[Orders] ([Id], [Username], [create_date], [Address], [total], [status]) VALUES (9, N'NV001', CAST(N'2025-08-13' AS Date), N'215 Hoàng Ngân P16 Q8', 318000, 0)
INSERT [dbo].[Orders] ([Id], [Username], [create_date], [Address], [total], [status]) VALUES (10, N'NV001', CAST(N'2025-08-13' AS Date), N'215 Hoàng Ngân P16 Q8', 133000, 0)
INSERT [dbo].[Orders] ([Id], [Username], [create_date], [Address], [total], [status]) VALUES (11, N'NV011', CAST(N'2025-11-17' AS Date), N'địa chỉ 1', 29000, 0)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [create_date], [Quantity], [category_id], [is_delete]) VALUES (5, N'Áo thun tay lỡ nam nữ, áo phông rộng unisex Sani', N'aothun001_01.jpg,aothun001_02.jpg,aothun001_03.jpg,aothun001_04.jpg', 165000, CAST(N'2023-05-26' AS Date), 100, N'ca01', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [create_date], [Quantity], [category_id], [is_delete]) VALUES (7, N'Áo thun tay lỡ HADES ALTERNATIVE TEE', N'aothun002_01.jpg,aothun002_02.jpg,aothun002_03.jpg,aothun002_04.jpg', 159000, CAST(N'2023-05-26' AS Date), 198, N'ca01', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [create_date], [Quantity], [category_id], [is_delete]) VALUES (8, N'Áo Thun Ngắn Tay Cổ Tròn Họa Tiết Kẻ Sọc', N'aothun003_01.jpg,aothun003_02.jpg,aothun003_03.jpg,aothun003_04.jpg', 159000, CAST(N'2023-05-16' AS Date), 150, N'ca01', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [create_date], [Quantity], [category_id], [is_delete]) VALUES (10, N'Áo phông unisex nam nữ CaMa', N'aothun004_01.jpg,aothun004_02.jpg,aothun004_03.jpg,aothun004_04.jpg', 132000, CAST(N'2023-05-15' AS Date), 500, N'ca01', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [create_date], [Quantity], [category_id], [is_delete]) VALUES (11, N'Áo thun Imagine', N'aothun005_01.jpg,aothun005_02.jpg,aothun005_03.jpg,aothun005_04.jpg', 129000, CAST(N'2023-05-12' AS Date), 130, N'ca01', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [create_date], [Quantity], [category_id], [is_delete]) VALUES (12, N'Áo Thun Nữ Cổ màu đặc Tròn', N'aothun006_01.jpg,aothun006_02.jpg,aothun006_03.jpg,aothun006_04.jpg', 133000, CAST(N'2023-05-13' AS Date), 119, N'ca01', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [create_date], [Quantity], [category_id], [is_delete]) VALUES (13, N'Áo thun phông logo tay nam nữ PINK', N'aothun007_01.jpg,aothun007_02.jpg,aothun007_03.jpg,aothun007_04..jpg', 177000, CAST(N'2023-05-26' AS Date), 190, N'ca01', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [create_date], [Quantity], [category_id], [is_delete]) VALUES (14, N'Áo Thun Tay Lỡ Nam Nữ Make Unisex RIMFS', N'aothun008_01.jpg,aothun008_02.jpg,aothun008_03.jpg,aothun008_04.jpg', 175000, CAST(N'2023-05-16' AS Date), 123, N'ca01', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [create_date], [Quantity], [category_id], [is_delete]) VALUES (15, N'Áo Thun Tay Lỡ Nam Nữ CITY LOCO WOLRD', N'aothun009_01.jpg,aothun009_02.jpg,aothun009_03.jpg,aothun009_04.jpg', 175000, CAST(N'2023-05-16' AS Date), 125, N'ca01', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [create_date], [Quantity], [category_id], [is_delete]) VALUES (16, N'Áo Thun Tay Lỡ Nữ Nam Mashier Tulip', N'aothun010_01.jpg,aothun010_02.jpg,aothun010_03.jpg,aothun010_04.jpg', 165000, CAST(N'2023-05-16' AS Date), 150, N'ca01', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [create_date], [Quantity], [category_id], [is_delete]) VALUES (17, N'Áo Thun Tay Lỡ Nam Nữ SHEEP', N'aothun011_01.jpg,aothun011_02.jpg,aothun011_03.jpg,aothun011_04.jpg', 185000, CAST(N'2023-05-16' AS Date), 170, N'ca01', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [create_date], [Quantity], [category_id], [is_delete]) VALUES (18, N'Áo Thun Nữ Tay Lỡ Form Rộng CAUSE', N'aothun012_01.jpg,aothun012_02.jpg,aothun012_03.jpg,aothun012_04.jpg', 235000, CAST(N'2023-05-16' AS Date), 335, N'ca01', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [create_date], [Quantity], [category_id], [is_delete]) VALUES (19, N'Áo Thun Tay Lỡ Nam Nữ World Wide', N'aothun013_01.jpg,aothun013_02.jpg,aothun013_03.jpg,aothun013_04.jpg', 255000, CAST(N'2023-05-17' AS Date), 325, N'ca01', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [create_date], [Quantity], [category_id], [is_delete]) VALUES (20, N'Áo Thun Tay Lỡ Nam Nữ HZNLL', N'aothun014_01.jpg,aothun014_02.jpg,aothun014_03.jpg,aothun014_04.jpg', 325000, CAST(N'2023-05-17' AS Date), 175, N'ca01', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [create_date], [Quantity], [category_id], [is_delete]) VALUES (21, N'Áo Khoác Cardigan Trái Tim Swe', N'aokhoac001_01.jpg,aokhoac001_02.jpg,aokhoac001_03.jpg,aokhoac001_04.jpg', 355000, CAST(N'2023-05-17' AS Date), 100, N'ca02', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [create_date], [Quantity], [category_id], [is_delete]) VALUES (23, N'Áo Khoác Cardigan M Tay Hoa Màu Be Ulzzang', N'aokhoac002_01.jpg,aokhoac002_02.jpg,aokhoac002_03.jpg,aokhoac002_04.jpg', 268000, CAST(N'2023-05-18' AS Date), 150, N'ca02', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [create_date], [Quantity], [category_id], [is_delete]) VALUES (24, N'Áo bomber nữ form rộng', N'aokhoac001_01.jpg,aokhoac003_02.jpg,aokhoac003_03.jpg,aokhoac003_04.jpg', 350000, CAST(N'2023-05-18' AS Date), 250, N'ca02', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [create_date], [Quantity], [category_id], [is_delete]) VALUES (25, N'Áo KHOÁC Hoodie TRƠN', N'aokhoac004_01.jpg,aokhoac004_02.jpg,aokhoac004_03.jpg,aokhoac004_04.jpg', 550000, CAST(N'2023-05-18' AS Date), 350, N'ca02', 1)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [create_date], [Quantity], [category_id], [is_delete]) VALUES (26, N'Áo Khoác Cardigan 2 Sọc Tay', N'aokhoac005_01.jpg,aokhoac005_02.jpg,aokhoac005_03.jpg,aokhoac005_04.jpg', 349000, CAST(N'2023-05-18' AS Date), 99, N'ca02', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [create_date], [Quantity], [category_id], [is_delete]) VALUES (27, N'Quần short jean ngố', N'quanshort001_01.jpg,quanshort001_02.jpg,quanshort001_03.jpg,quanshort001_04.jpg', 89000, CAST(N'2023-05-26' AS Date), 75, N'ca03', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [create_date], [Quantity], [category_id], [is_delete]) VALUES (28, N'Quần Short Ngố Kaki Nữ Lưng Cao', N'quanshort002_01.jpg,quanshort002_02.jpg,quanshort002_03.jpg,quanshort002_04.jpg', 99000, CAST(N'2023-05-26' AS Date), 125, N'ca03', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [create_date], [Quantity], [category_id], [is_delete]) VALUES (29, N'Quần đùi nữ, quần short nữ ống rộng', N'quanshort003_01.jpg,quanshort003_02.jpg,quanshort003_03.jpg,quanshort003_04.jpg', 69000, CAST(N'2023-05-18' AS Date), 76, N'ca03', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [create_date], [Quantity], [category_id], [is_delete]) VALUES (30, N'Quần Short Cạp Cao', N'quanshort004_01.jpg,quanshort004_02.jpg,quanshort004_03.jpg,quanshort004_04.jpg', 63000, CAST(N'2023-05-19' AS Date), 19, N'ca03', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [create_date], [Quantity], [category_id], [is_delete]) VALUES (31, N'Quần đùi Unisex cạp chun', N'quanshort005_01.jpg,quanshort005_02.jpg,quanshort005_03.jpg,quanshort005_04.jpg', 29000, CAST(N'2023-05-19' AS Date), 8, N'ca03', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [create_date], [Quantity], [category_id], [is_delete]) VALUES (32, N'Quần vải suông ống rộng lưng cao', N'quandai001_01.jpg,quandai001_02.jpg,quandai001_03.jpg,quandai001_04.jpg', 128000, CAST(N'2023-05-19' AS Date), 15, N'ca04', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [create_date], [Quantity], [category_id], [is_delete]) VALUES (33, N'Quần hộp kaki KA Closet', N'quandai002_01.jpg,quandai002_02.jpg,quandai002_03.jpg,quandai002_04.jpg', 175000, CAST(N'2023-05-19' AS Date), 100, N'ca04', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [create_date], [Quantity], [category_id], [is_delete]) VALUES (34, N'Quần ống loe siêu tôn dáng', N'quandai003_01.jpg,quandai003_02.jpg,quandai003_03.jpg,quandai003_04.jpg', 235000, CAST(N'2023-05-19' AS Date), 150, N'ca04', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [create_date], [Quantity], [category_id], [is_delete]) VALUES (35, N'Quần ống suông dài nỉ nhung tăm', N'quandai004_01.jpg,quandai004_02.jpg,quandai004_03.jpg,quandai004_04.jpg', 199000, CAST(N'2023-05-19' AS Date), 200, N'ca04', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [create_date], [Quantity], [category_id], [is_delete]) VALUES (36, N'Quần ống rộng suông khoá trước', N'quandai005_01.jpg,quandai005_02.jpg,quandai005_03.jpg,quandai005_04.jpg', 75000, CAST(N'2023-05-26' AS Date), 250, N'ca04', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [create_date], [Quantity], [category_id], [is_delete]) VALUES (37, N'Váy Buộc Dây Chéo Cổ Khóa Lưng', N'vay001_01.jpg,vay001_02.jpg,vay001_03.jpg,vay001_04.jpg', 359000, CAST(N'2023-05-20' AS Date), 300, N'ca05', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [create_date], [Quantity], [category_id], [is_delete]) VALUES (38, N'Váy Cổ Yếm, Đầm Trắng Chất Xốp', N'vay002_01.jpg,vay002_02.jpg,vay002_03.jpg,vay002_04.jpg', 349000, CAST(N'2023-05-20' AS Date), 190, N'ca05', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [create_date], [Quantity], [category_id], [is_delete]) VALUES (39, N'Váy 2 dây maxi đi biển buộc nơ vai cao cấp', N'vay003_01.jpg,vay003_02.jpg,vay003_03.jpg,vay003_04.jpg', 459000, CAST(N'2023-05-20' AS Date), 300, N'ca05', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [create_date], [Quantity], [category_id], [is_delete]) VALUES (40, N'Váy Babydoll Tơ Óng 3 Tầng', N'vay004_01.jpg,vay004_02.jpg,vay004_03.jpg,vay004_04.jpg', 359000, CAST(N'2023-05-20' AS Date), 150, N'ca05', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [create_date], [Quantity], [category_id], [is_delete]) VALUES (41, N'Váy 2 Dây Cổ Yếm Màu Đen Có Mút Ngực', N'vay005_01.jpg,vay005_02.jpg,vay005_03.jpg,vay005_04.jpg', 499000, CAST(N'2023-05-20' AS Date), 325, N'ca05', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [create_date], [Quantity], [category_id], [is_delete]) VALUES (42, N'Giày thể thao vải nam nữ độn đế mũi viền kẻ Caro', N'giay001_01.jpg,giay001_02.jpg,giay001_03.jpg,giay001_04.jpg', 99000, CAST(N'2023-05-21' AS Date), 299, N'ca06', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [create_date], [Quantity], [category_id], [is_delete]) VALUES (43, N'Giày thể Thao Nữ Basicc Bông Lúa', N'giay002_01.jpg,giay002_02.jpg,giay002_03.jpg,giay002_04.jpg', 127000, CAST(N'2023-05-21' AS Date), 99, N'ca06', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [create_date], [Quantity], [category_id], [is_delete]) VALUES (44, N'Giày thể thao nữ TED viền lúa', N'giay003_01.jpg,giay003_02.jpg,giay003_03.jpg,giay003_04.jpg', 139000, CAST(N'2023-05-21' AS Date), 49, N'ca06', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [create_date], [Quantity], [category_id], [is_delete]) VALUES (45, N'Giày Nữ Lolita Dây Cài 5cm Phong Cách Hàn Quốc', N'giay004_01.jpg,giay004_02.jpg,giay004_03.jpg,giay004_04.jpg', 239000, CAST(N'2023-05-21' AS Date), 4, N'ca06', 1)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [create_date], [Quantity], [category_id], [is_delete]) VALUES (46, N'Giày Lolita Nữ Quai Ngọc Mũi Nơ', N'giay005_01.jpg,giay005_02.jpg,giay005_03.jpg,giay005_04.jpg', 105000, CAST(N'2025-11-19' AS Date), 4, N'ca06', 0)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD  CONSTRAINT [FK_Carts_Accounts] FOREIGN KEY([username])
REFERENCES [dbo].[Accounts] ([Username])
GO
ALTER TABLE [dbo].[Carts] CHECK CONSTRAINT [FK_Carts_Accounts]
GO
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD  CONSTRAINT [FK_Carts_Products] FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[Carts] CHECK CONSTRAINT [FK_Carts_Products]
GO
ALTER TABLE [dbo].[Order_Details]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([order_id])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[Order_Details] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [dbo].[Order_Details]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products] FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[Order_Details] CHECK CONSTRAINT [FK_OrderDetails_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Accounts] FOREIGN KEY([Username])
REFERENCES [dbo].[Accounts] ([Username])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Accounts]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([category_id])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
USE [master]
GO
ALTER DATABASE [DB_DuAN1] SET  READ_WRITE 
GO
