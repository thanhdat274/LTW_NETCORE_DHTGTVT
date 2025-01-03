USE [master]
GO
/****** Object:  Database [VanTaiHanhKhach]    Script Date: 12/16/2024 9:37:23 PM ******/
DROP DATABASE [VanTaiHanhKhach]
GO
/****** Object:  Database [VanTaiHanhKhach]    Script Date: 12/16/2024 9:37:23 PM ******/
CREATE DATABASE [VanTaiHanhKhach]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'VanTaiHanhKhach', FILENAME = N'D:\VanTaiHanhKhach.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'VanTaiHanhKhach_log', FILENAME = N'D:\VanTaiHanhKhach_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [VanTaiHanhKhach] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [VanTaiHanhKhach].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [VanTaiHanhKhach] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [VanTaiHanhKhach] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [VanTaiHanhKhach] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [VanTaiHanhKhach] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [VanTaiHanhKhach] SET ARITHABORT OFF 
GO
ALTER DATABASE [VanTaiHanhKhach] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [VanTaiHanhKhach] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [VanTaiHanhKhach] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [VanTaiHanhKhach] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [VanTaiHanhKhach] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [VanTaiHanhKhach] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [VanTaiHanhKhach] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [VanTaiHanhKhach] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [VanTaiHanhKhach] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [VanTaiHanhKhach] SET  DISABLE_BROKER 
GO
ALTER DATABASE [VanTaiHanhKhach] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [VanTaiHanhKhach] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [VanTaiHanhKhach] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [VanTaiHanhKhach] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [VanTaiHanhKhach] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [VanTaiHanhKhach] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [VanTaiHanhKhach] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [VanTaiHanhKhach] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [VanTaiHanhKhach] SET  MULTI_USER 
GO
ALTER DATABASE [VanTaiHanhKhach] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [VanTaiHanhKhach] SET DB_CHAINING OFF 
GO
ALTER DATABASE [VanTaiHanhKhach] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [VanTaiHanhKhach] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [VanTaiHanhKhach] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [VanTaiHanhKhach] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [VanTaiHanhKhach] SET QUERY_STORE = OFF
GO
USE [VanTaiHanhKhach]
GO
/****** Object:  Table [dbo].[Chuyen]    Script Date: 12/16/2024 9:37:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Chuyen](
	[MaChuyen] [int] IDENTITY(1,1) NOT NULL,
	[MaKhaiThac] [int] NULL,
	[SoXe] [nvarchar](20) NULL,
	[LaiXe] [nvarchar](50) NULL,
	[PhuXe] [nvarchar](50) NULL,
	[NgayGio] [datetime] NULL,
	[Anh] [nvarchar](50) NULL,
 CONSTRAINT [PK_Chuyen] PRIMARY KEY CLUSTERED 
(
	[MaChuyen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DatVe]    Script Date: 12/16/2024 9:37:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DatVe](
	[MaKhach] [varchar](10) NULL,
	[MaChuyen] [int] NULL,
	[SoVe] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 12/16/2024 9:37:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKhach] [varchar](10) NOT NULL,
	[HoTen] [nvarchar](50) NULL,
	[CCCD] [varchar](20) NULL,
	[DienThoai] [varchar](20) NULL,
	[Email] [nvarchar](50) NULL,
	[Anh] [nvarchar](50) NULL,
	[DiemTichLuy] [float] NULL,
	[MaLoai] [int] NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKhach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhaiThac]    Script Date: 12/16/2024 9:37:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhaiThac](
	[MaKhaiThac] [int] IDENTITY(1,1) NOT NULL,
	[MaNhaXe] [nvarchar](10) NULL,
	[MaTuyen] [nvarchar](10) NULL,
	[NgayBatDau] [date] NULL,
 CONSTRAINT [PK_KhaiThac] PRIMARY KEY CLUSTERED 
(
	[MaKhaiThac] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiKhach]    Script Date: 12/16/2024 9:37:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiKhach](
	[MaLoai] [int] IDENTITY(1,1) NOT NULL,
	[TenLoai] [nvarchar](100) NULL,
 CONSTRAINT [PK_LoaiKhach] PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiNhaXe]    Script Date: 12/16/2024 9:37:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiNhaXe](
	[MaLoaiNX] [int] IDENTITY(1,1) NOT NULL,
	[TenLoaiNX] [nvarchar](100) NULL,
 CONSTRAINT [PK_LoaiNhaXe] PRIMARY KEY CLUSTERED 
(
	[MaLoaiNX] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NavItems]    Script Date: 12/16/2024 9:37:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NavItems](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NavName] [nvarchar](50) NULL,
	[NavNameVN] [nvarchar](100) NULL,
	[Link] [nvarchar](250) NULL,
 CONSTRAINT [PK_NavItems] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhaXe]    Script Date: 12/16/2024 9:37:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaXe](
	[MaNhaXe] [nvarchar](10) NOT NULL,
	[TenNhaXe] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](250) NULL,
	[Email] [nvarchar](50) NULL,
	[DienThoai] [nvarchar](30) NULL,
	[MaLoaiNX] [int] NULL,
	[Anh] [nvarchar](50) NULL,
 CONSTRAINT [PK_NhaXe] PRIMARY KEY CLUSTERED 
(
	[MaNhaXe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TinhThanh]    Script Date: 12/16/2024 9:37:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TinhThanh](
	[MaTinhThanh] [nvarchar](10) NOT NULL,
	[TenTinhThanh] [nvarchar](100) NULL,
	[VietTat] [nvarchar](5) NULL,
 CONSTRAINT [PK_TinhThanh] PRIMARY KEY CLUSTERED 
(
	[MaTinhThanh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tuyen]    Script Date: 12/16/2024 9:37:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tuyen](
	[MaTuyen] [nvarchar](10) NOT NULL,
	[TenTuyen] [nvarchar](50) NULL,
	[MaDiemDau] [nvarchar](10) NOT NULL,
	[MaDiemCuoi] [nvarchar](10) NOT NULL,
	[TrangThai] [bit] NULL,
	[KhoangCach] [int] NULL,
 CONSTRAINT [PK_Tuyen] PRIMARY KEY CLUSTERED 
(
	[MaTuyen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Chuyen] ON 

INSERT [dbo].[Chuyen] ([MaChuyen], [MaKhaiThac], [SoXe], [LaiXe], [PhuXe], [NgayGio], [Anh]) VALUES (1, 1, N'29T274.45', N'Nguyễn Minh Hà', N'Lê Trung Hiếu', CAST(N'2023-01-11T07:00:00.000' AS DateTime), N'xe1.jpg')
INSERT [dbo].[Chuyen] ([MaChuyen], [MaKhaiThac], [SoXe], [LaiXe], [PhuXe], [NgayGio], [Anh]) VALUES (2, 1, N'29T187.34', N'Trần Văn Thành', N'Nguyễn Hoài Nam', CAST(N'2023-01-11T09:00:00.000' AS DateTime), N'xe2.jpg')
INSERT [dbo].[Chuyen] ([MaChuyen], [MaKhaiThac], [SoXe], [LaiXe], [PhuXe], [NgayGio], [Anh]) VALUES (3, 2, N'29B754.32', N'Hà Nam Anh', N'Bùi Hùng Mạnh', CAST(N'2023-01-11T11:00:00.000' AS DateTime), N'xe3.jpg')
INSERT [dbo].[Chuyen] ([MaChuyen], [MaKhaiThac], [SoXe], [LaiXe], [PhuXe], [NgayGio], [Anh]) VALUES (4, 3, N'30T098.24', N'Trần Phú Nghĩa', N'Nguyễn Hải Nam', CAST(N'2023-01-11T13:00:00.000' AS DateTime), N'xe4.jpg')
INSERT [dbo].[Chuyen] ([MaChuyen], [MaKhaiThac], [SoXe], [LaiXe], [PhuXe], [NgayGio], [Anh]) VALUES (5, 3, N'30F039.43', N'Trần Trung Nam', N'Nguyễn Hà Anh', CAST(N'2023-01-11T15:00:00.000' AS DateTime), N'xe5.jpg')
INSERT [dbo].[Chuyen] ([MaChuyen], [MaKhaiThac], [SoXe], [LaiXe], [PhuXe], [NgayGio], [Anh]) VALUES (6, 4, N'29T165.99', N'Mai Nam Hà', N'Lê Hiếu Nghĩa', CAST(N'2023-04-22T07:00:00.000' AS DateTime), N'xe6.jpg')
INSERT [dbo].[Chuyen] ([MaChuyen], [MaKhaiThac], [SoXe], [LaiXe], [PhuXe], [NgayGio], [Anh]) VALUES (7, 5, N'30L097.34', N'Hà Bình An', N'Trần Đình Hoàng', CAST(N'2023-04-22T09:00:00.000' AS DateTime), N'xe7.jpg')
INSERT [dbo].[Chuyen] ([MaChuyen], [MaKhaiThac], [SoXe], [LaiXe], [PhuXe], [NgayGio], [Anh]) VALUES (8, 5, N'29B039.33', N'Trần Nam Trực', N'Nguyễn Hà Anh', CAST(N'2023-04-15T09:00:00.000' AS DateTime), N'xe8.jpg')
INSERT [dbo].[Chuyen] ([MaChuyen], [MaKhaiThac], [SoXe], [LaiXe], [PhuXe], [NgayGio], [Anh]) VALUES (9, 6, N'16F190.56', N'Trần Đình Thức', N'Bùi Việt Anh', CAST(N'2023-04-19T09:00:00.000' AS DateTime), N'xe9.jpg')
INSERT [dbo].[Chuyen] ([MaChuyen], [MaKhaiThac], [SoXe], [LaiXe], [PhuXe], [NgayGio], [Anh]) VALUES (10, 6, N'16L876.34', N'Hà Nam Thắng', N'Nguyễn Chí Trung', CAST(N'2023-04-19T11:00:00.000' AS DateTime), N'xe1.jpg')
INSERT [dbo].[Chuyen] ([MaChuyen], [MaKhaiThac], [SoXe], [LaiXe], [PhuXe], [NgayGio], [Anh]) VALUES (11, 7, N'14F393.39', N'Bùi Mạnh Cường', N'Trần Trung Hiếu', CAST(N'2023-04-15T07:00:00.000' AS DateTime), N'xe2.jpg')
SET IDENTITY_INSERT [dbo].[Chuyen] OFF
GO
INSERT [dbo].[DatVe] ([MaKhach], [MaChuyen], [SoVe]) VALUES (N'KH001', 1, 10)
INSERT [dbo].[DatVe] ([MaKhach], [MaChuyen], [SoVe]) VALUES (N'KH001', 2, 5)
INSERT [dbo].[DatVe] ([MaKhach], [MaChuyen], [SoVe]) VALUES (N'KH001', 3, 7)
INSERT [dbo].[DatVe] ([MaKhach], [MaChuyen], [SoVe]) VALUES (N'KH002', 2, 2)
INSERT [dbo].[DatVe] ([MaKhach], [MaChuyen], [SoVe]) VALUES (N'KH003', 3, 8)
INSERT [dbo].[DatVe] ([MaKhach], [MaChuyen], [SoVe]) VALUES (N'KH003', 4, 12)
INSERT [dbo].[DatVe] ([MaKhach], [MaChuyen], [SoVe]) VALUES (N'KH004', 1, 4)
INSERT [dbo].[DatVe] ([MaKhach], [MaChuyen], [SoVe]) VALUES (N'KH004', 5, 7)
INSERT [dbo].[DatVe] ([MaKhach], [MaChuyen], [SoVe]) VALUES (N'KH005', 6, 1)
INSERT [dbo].[DatVe] ([MaKhach], [MaChuyen], [SoVe]) VALUES (N'KH006', 7, 2)
INSERT [dbo].[DatVe] ([MaKhach], [MaChuyen], [SoVe]) VALUES (N'KH005', 8, 1)
INSERT [dbo].[DatVe] ([MaKhach], [MaChuyen], [SoVe]) VALUES (N'KH006', 9, 1)
GO
INSERT [dbo].[KhachHang] ([MaKhach], [HoTen], [CCCD], [DienThoai], [Email], [Anh], [DiemTichLuy], [MaLoai]) VALUES (N'KH001', N'Nguyễn Văn An', N'031002098872', N'0987123429', N'kh1@gmail.com', N'kh1.jpg', 7.5, 3)
INSERT [dbo].[KhachHang] ([MaKhach], [HoTen], [CCCD], [DienThoai], [Email], [Anh], [DiemTichLuy], [MaLoai]) VALUES (N'KH002', N'Trần Thị Bích', N'035124098321', N'0712054374', N'kh2@gmail.com', N'kh2.jpg', 5, 1)
INSERT [dbo].[KhachHang] ([MaKhach], [HoTen], [CCCD], [DienThoai], [Email], [Anh], [DiemTichLuy], [MaLoai]) VALUES (N'KH003', N'Lê Hải Hà', N'021098645112', N'0964097126', N'kh3@gmail.com', N'kh3.jpg', 9, 3)
INSERT [dbo].[KhachHang] ([MaKhach], [HoTen], [CCCD], [DienThoai], [Email], [Anh], [DiemTichLuy], [MaLoai]) VALUES (N'KH004', N'Nguyễn Đình Hải', N'031083064874', N'0721039485', N'kh4@gmail.com', N'kh4.jpg', 7, 2)
INSERT [dbo].[KhachHang] ([MaKhach], [HoTen], [CCCD], [DienThoai], [Email], [Anh], [DiemTichLuy], [MaLoai]) VALUES (N'KH005', N'Trần Bình Minh', N'035098394948', N'0986234575', N'kh5@gmail.com', N'kh5.jpg', 4.5, 1)
INSERT [dbo].[KhachHang] ([MaKhach], [HoTen], [CCCD], [DienThoai], [Email], [Anh], [DiemTichLuy], [MaLoai]) VALUES (N'KH006', N'Lê Minh Hải', N'042058334985', N'0946383858', N'kh6@gmail.com', N'kh6.jpg', 5, 1)
GO
SET IDENTITY_INSERT [dbo].[KhaiThac] ON 

INSERT [dbo].[KhaiThac] ([MaKhaiThac], [MaNhaXe], [MaTuyen], [NgayBatDau]) VALUES (1, N'NX001PT', N'HN2ND', CAST(N'2018-03-01' AS Date))
INSERT [dbo].[KhaiThac] ([MaKhaiThac], [MaNhaXe], [MaTuyen], [NgayBatDau]) VALUES (2, N'NX001PT', N'HN2NB', CAST(N'2018-08-15' AS Date))
INSERT [dbo].[KhaiThac] ([MaKhaiThac], [MaNhaXe], [MaTuyen], [NgayBatDau]) VALUES (3, N'NX002LG', N'HN2ND', CAST(N'2019-05-10' AS Date))
INSERT [dbo].[KhaiThac] ([MaKhaiThac], [MaNhaXe], [MaTuyen], [NgayBatDau]) VALUES (4, N'NX002LG', N'HN2NB', CAST(N'2019-05-28' AS Date))
INSERT [dbo].[KhaiThac] ([MaKhaiThac], [MaNhaXe], [MaTuyen], [NgayBatDau]) VALUES (5, N'NX002LG', N'HN2TH', CAST(N'2020-01-15' AS Date))
INSERT [dbo].[KhaiThac] ([MaKhaiThac], [MaNhaXe], [MaTuyen], [NgayBatDau]) VALUES (6, N'NX003HA', N'HN2HP', CAST(N'2018-01-10' AS Date))
INSERT [dbo].[KhaiThac] ([MaKhaiThac], [MaNhaXe], [MaTuyen], [NgayBatDau]) VALUES (7, N'NX004KH', N'HN2QN', CAST(N'2017-07-10' AS Date))
SET IDENTITY_INSERT [dbo].[KhaiThac] OFF
GO
SET IDENTITY_INSERT [dbo].[LoaiKhach] ON 

INSERT [dbo].[LoaiKhach] ([MaLoai], [TenLoai]) VALUES (1, N'Đơn lẻ')
INSERT [dbo].[LoaiKhach] ([MaLoai], [TenLoai]) VALUES (2, N'Đoàn')
INSERT [dbo].[LoaiKhach] ([MaLoai], [TenLoai]) VALUES (3, N'Trường học')
INSERT [dbo].[LoaiKhach] ([MaLoai], [TenLoai]) VALUES (4, N'Công ty Du lịch')
SET IDENTITY_INSERT [dbo].[LoaiKhach] OFF
GO
SET IDENTITY_INSERT [dbo].[LoaiNhaXe] ON 

INSERT [dbo].[LoaiNhaXe] ([MaLoaiNX], [TenLoaiNX]) VALUES (1, N'Taxi')
INSERT [dbo].[LoaiNhaXe] ([MaLoaiNX], [TenLoaiNX]) VALUES (2, N'Limousine')
INSERT [dbo].[LoaiNhaXe] ([MaLoaiNX], [TenLoaiNX]) VALUES (3, N'Cars-Express')
SET IDENTITY_INSERT [dbo].[LoaiNhaXe] OFF
GO
SET IDENTITY_INSERT [dbo].[NavItems] ON 

INSERT [dbo].[NavItems] ([Id], [NavName], [NavNameVN], [Link]) VALUES (1, N'Route', N'Tuyến', NULL)
INSERT [dbo].[NavItems] ([Id], [NavName], [NavNameVN], [Link]) VALUES (2, N'Provider', N'Nhà Xe', NULL)
INSERT [dbo].[NavItems] ([Id], [NavName], [NavNameVN], [Link]) VALUES (3, N'Operating', N'Khai Thác', NULL)
INSERT [dbo].[NavItems] ([Id], [NavName], [NavNameVN], [Link]) VALUES (4, N'Bus', N'Chuyến', NULL)
SET IDENTITY_INSERT [dbo].[NavItems] OFF
GO
INSERT [dbo].[NhaXe] ([MaNhaXe], [TenNhaXe], [DiaChi], [Email], [DienThoai], [MaLoaiNX], [Anh]) VALUES (N'NX001PT', N'Phương Trang', N'277 Minh Khai, Hà Nội', N'pt@gmail.com', N'0913115764', 1, N'nx1.jpg')
INSERT [dbo].[NhaXe] ([MaNhaXe], [TenNhaXe], [DiaChi], [Email], [DienThoai], [MaLoaiNX], [Anh]) VALUES (N'NX002LG', N'Long Giang', N'111 Nguyễn Hiền, Nam Định', N'lg@gmail.com', N'0967123415', 2, N'nx2.jpg')
INSERT [dbo].[NhaXe] ([MaNhaXe], [TenNhaXe], [DiaChi], [Email], [DienThoai], [MaLoaiNX], [Anh]) VALUES (N'NX003HA', N'Hải Âu', N'01 Cầu Đất, Hải Phòng', N'ha@gmail.com', N'0978142345', 3, N'nx3.jpg')
INSERT [dbo].[NhaXe] ([MaNhaXe], [TenNhaXe], [DiaChi], [Email], [DienThoai], [MaLoaiNX], [Anh]) VALUES (N'NX004KH', N'KumHo', N'127 Trần Nhân Tông, Hạ Long', N'kh@gmail.com', N'0978334223', 3, N'nx4.jpg')
INSERT [dbo].[NhaXe] ([MaNhaXe], [TenNhaXe], [DiaChi], [Email], [DienThoai], [MaLoaiNX], [Anh]) VALUES (N'NX005HT', N'Hoàng Trung', N'117 Nguyễn Thị Định', N'ht@gmail.com', N'0986006223', 1, N'nx5.jpg')
INSERT [dbo].[NhaXe] ([MaNhaXe], [TenNhaXe], [DiaChi], [Email], [DienThoai], [MaLoaiNX], [Anh]) VALUES (N'NX006LM', N'Limousine Hà Anh', N'12A Lý Tự Trọng', N'liha@gmail.com', N'0876200129', 2, N'nx6.jpg')
GO
INSERT [dbo].[TinhThanh] ([MaTinhThanh], [TenTinhThanh], [VietTat]) VALUES (N'203', N'Quảng Ninh', N'QN')
INSERT [dbo].[TinhThanh] ([MaTinhThanh], [TenTinhThanh], [VietTat]) VALUES (N'208', N'Thái Nguyên', N'TNG')
INSERT [dbo].[TinhThanh] ([MaTinhThanh], [TenTinhThanh], [VietTat]) VALUES (N'218', N'Hòa Bình', N'HB')
INSERT [dbo].[TinhThanh] ([MaTinhThanh], [TenTinhThanh], [VietTat]) VALUES (N'225', N'Hải Phòng', N'HP')
INSERT [dbo].[TinhThanh] ([MaTinhThanh], [TenTinhThanh], [VietTat]) VALUES (N'226', N'Hà Nam', N'HNA')
INSERT [dbo].[TinhThanh] ([MaTinhThanh], [TenTinhThanh], [VietTat]) VALUES (N'228', N'Nam Định', N'NĐ')
INSERT [dbo].[TinhThanh] ([MaTinhThanh], [TenTinhThanh], [VietTat]) VALUES (N'229', N'Ninh Bình', N'NB')
INSERT [dbo].[TinhThanh] ([MaTinhThanh], [TenTinhThanh], [VietTat]) VALUES (N'237', N'Thanh Hóa', N'TH')
INSERT [dbo].[TinhThanh] ([MaTinhThanh], [TenTinhThanh], [VietTat]) VALUES (N'24', N'Hà Nội', N'HN')
GO
INSERT [dbo].[Tuyen] ([MaTuyen], [TenTuyen], [MaDiemDau], [MaDiemCuoi], [TrangThai], [KhoangCach]) VALUES (N'HB2HN', N'Hòa Bình - Hà Nội', N'218', N'24', 1, 90)
INSERT [dbo].[Tuyen] ([MaTuyen], [TenTuyen], [MaDiemDau], [MaDiemCuoi], [TrangThai], [KhoangCach]) VALUES (N'HN2HP', N'Hà Nội - Hải Phòng', N'24', N'225', 1, 95)
INSERT [dbo].[Tuyen] ([MaTuyen], [TenTuyen], [MaDiemDau], [MaDiemCuoi], [TrangThai], [KhoangCach]) VALUES (N'HN2NB', N'Hà Nội - Ninh Bình', N'24', N'229', 1, 130)
INSERT [dbo].[Tuyen] ([MaTuyen], [TenTuyen], [MaDiemDau], [MaDiemCuoi], [TrangThai], [KhoangCach]) VALUES (N'HN2ND', N'Hà Nội - Nam Định', N'24', N'228', 1, 90)
INSERT [dbo].[Tuyen] ([MaTuyen], [TenTuyen], [MaDiemDau], [MaDiemCuoi], [TrangThai], [KhoangCach]) VALUES (N'HN2QN', N'Hà Nội - Quảng Ninh', N'24', N'203', 1, 120)
INSERT [dbo].[Tuyen] ([MaTuyen], [TenTuyen], [MaDiemDau], [MaDiemCuoi], [TrangThai], [KhoangCach]) VALUES (N'HN2TH', N'Hà Nội - Thanh Hóa', N'24', N'237', 1, 190)
INSERT [dbo].[Tuyen] ([MaTuyen], [TenTuyen], [MaDiemDau], [MaDiemCuoi], [TrangThai], [KhoangCach]) VALUES (N'HNa2HN', N'Hà Nam - Hà Nội', N'226', N'24', 0, 60)
INSERT [dbo].[Tuyen] ([MaTuyen], [TenTuyen], [MaDiemDau], [MaDiemCuoi], [TrangThai], [KhoangCach]) VALUES (N'HP2HN', N'Hải Phòng - Hà Nội', N'226', N'24', 1, 95)
INSERT [dbo].[Tuyen] ([MaTuyen], [TenTuyen], [MaDiemDau], [MaDiemCuoi], [TrangThai], [KhoangCach]) VALUES (N'ND2HN', N'Nam Định - Hà Nội', N'228', N'24', 1, 90)
GO
ALTER TABLE [dbo].[Chuyen]  WITH CHECK ADD  CONSTRAINT [FK_Chuyen_KhaiThac] FOREIGN KEY([MaKhaiThac])
REFERENCES [dbo].[KhaiThac] ([MaKhaiThac])
GO
ALTER TABLE [dbo].[Chuyen] CHECK CONSTRAINT [FK_Chuyen_KhaiThac]
GO
ALTER TABLE [dbo].[DatVe]  WITH CHECK ADD  CONSTRAINT [FK_DatVe_Chuyen] FOREIGN KEY([MaChuyen])
REFERENCES [dbo].[Chuyen] ([MaChuyen])
GO
ALTER TABLE [dbo].[DatVe] CHECK CONSTRAINT [FK_DatVe_Chuyen]
GO
ALTER TABLE [dbo].[DatVe]  WITH CHECK ADD  CONSTRAINT [FK_DatVe_KhachHang] FOREIGN KEY([MaKhach])
REFERENCES [dbo].[KhachHang] ([MaKhach])
GO
ALTER TABLE [dbo].[DatVe] CHECK CONSTRAINT [FK_DatVe_KhachHang]
GO
ALTER TABLE [dbo].[KhachHang]  WITH CHECK ADD  CONSTRAINT [FK_KhachHang_LoaiKhach] FOREIGN KEY([MaLoai])
REFERENCES [dbo].[LoaiKhach] ([MaLoai])
GO
ALTER TABLE [dbo].[KhachHang] CHECK CONSTRAINT [FK_KhachHang_LoaiKhach]
GO
ALTER TABLE [dbo].[KhaiThac]  WITH CHECK ADD  CONSTRAINT [FK_KhaiThac_NhaXe] FOREIGN KEY([MaNhaXe])
REFERENCES [dbo].[NhaXe] ([MaNhaXe])
GO
ALTER TABLE [dbo].[KhaiThac] CHECK CONSTRAINT [FK_KhaiThac_NhaXe]
GO
ALTER TABLE [dbo].[KhaiThac]  WITH CHECK ADD  CONSTRAINT [FK_KhaiThac_Tuyen] FOREIGN KEY([MaTuyen])
REFERENCES [dbo].[Tuyen] ([MaTuyen])
GO
ALTER TABLE [dbo].[KhaiThac] CHECK CONSTRAINT [FK_KhaiThac_Tuyen]
GO
ALTER TABLE [dbo].[NhaXe]  WITH CHECK ADD  CONSTRAINT [FK_NhaXe_LoaiNhaXe] FOREIGN KEY([MaLoaiNX])
REFERENCES [dbo].[LoaiNhaXe] ([MaLoaiNX])
GO
ALTER TABLE [dbo].[NhaXe] CHECK CONSTRAINT [FK_NhaXe_LoaiNhaXe]
GO
ALTER TABLE [dbo].[Tuyen]  WITH CHECK ADD  CONSTRAINT [FK_Tuyen_TinhThanh_DiemCuoi] FOREIGN KEY([MaDiemCuoi])
REFERENCES [dbo].[TinhThanh] ([MaTinhThanh])
GO
ALTER TABLE [dbo].[Tuyen] CHECK CONSTRAINT [FK_Tuyen_TinhThanh_DiemCuoi]
GO
ALTER TABLE [dbo].[Tuyen]  WITH CHECK ADD  CONSTRAINT [FK_Tuyen_TinhThanh_DiemDau] FOREIGN KEY([MaDiemDau])
REFERENCES [dbo].[TinhThanh] ([MaTinhThanh])
GO
ALTER TABLE [dbo].[Tuyen] CHECK CONSTRAINT [FK_Tuyen_TinhThanh_DiemDau]
GO
USE [master]
GO
ALTER DATABASE [VanTaiHanhKhach] SET  READ_WRITE 
GO
