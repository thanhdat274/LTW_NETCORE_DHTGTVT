USE [master]
GO

/****** Object:  Database [LTWeb]    Script Date: 05/07/2018 14:15:53 ******/
CREATE DATABASE [LTWeb] ON  PRIMARY 
( NAME = N'LTWeb', FILENAME = N'D:\LTWeb.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'LTWeb_log', FILENAME = N'D:\LTWeb_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO

ALTER DATABASE [LTWeb] SET COMPATIBILITY_LEVEL = 100
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LTWeb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [LTWeb] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [LTWeb] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [LTWeb] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [LTWeb] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [LTWeb] SET ARITHABORT OFF 
GO

ALTER DATABASE [LTWeb] SET AUTO_CLOSE ON 
GO

ALTER DATABASE [LTWeb] SET AUTO_CREATE_STATISTICS ON 
GO

ALTER DATABASE [LTWeb] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [LTWeb] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [LTWeb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [LTWeb] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [LTWeb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [LTWeb] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [LTWeb] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [LTWeb] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [LTWeb] SET  DISABLE_BROKER 
GO

ALTER DATABASE [LTWeb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [LTWeb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [LTWeb] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [LTWeb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [LTWeb] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [LTWeb] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [LTWeb] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [LTWeb] SET  READ_WRITE 
GO

ALTER DATABASE [LTWeb] SET RECOVERY SIMPLE 
GO

ALTER DATABASE [LTWeb] SET  MULTI_USER 
GO

ALTER DATABASE [LTWeb] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [LTWeb] SET DB_CHAINING OFF 
GO


USE [LTWeb]
GO
/****** Object:  Table [dbo].[LoaiMon]    Script Date: 05/07/2018 14:08:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LoaiMon]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LoaiMon](
	[MaLoaiMon] [int] IDENTITY(1,1) NOT NULL,
	[TenLoaiMon] [nvarchar](50) NULL,
 CONSTRAINT [PK_LoaiMon] PRIMARY KEY CLUSTERED 
(
	[MaLoaiMon] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[LoaiMon] ON
INSERT [dbo].[LoaiMon] ([MaLoaiMon], [TenLoaiMon]) VALUES (1, N'Món khai vị')
INSERT [dbo].[LoaiMon] ([MaLoaiMon], [TenLoaiMon]) VALUES (2, N'Món chính')
INSERT [dbo].[LoaiMon] ([MaLoaiMon], [TenLoaiMon]) VALUES (3, N'Món tráng miệng')
INSERT [dbo].[LoaiMon] ([MaLoaiMon], [TenLoaiMon]) VALUES (4, N'Món điểm tâm')
SET IDENTITY_INSERT [dbo].[LoaiMon] OFF
/****** Object:  Table [dbo].[NhanHieu]    Script Date: 05/07/2018 14:08:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NhanHieu]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[NhanHieu](
	[MaNhanHieu] [nchar](10) NOT NULL,
	[TenNhanHieu] [nvarchar](50) NULL,
 CONSTRAINT [PK_NhanHieu] PRIMARY KEY CLUSTERED 
(
	[MaNhanHieu] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [dbo].[NhanHieu] ([MaNhanHieu], [TenNhanHieu]) VALUES (N'BMW       ', N'BMW')
INSERT [dbo].[NhanHieu] ([MaNhanHieu], [TenNhanHieu]) VALUES (N'MAD       ', N'Mazda')
INSERT [dbo].[NhanHieu] ([MaNhanHieu], [TenNhanHieu]) VALUES (N'MED       ', N'Mercedes')
INSERT [dbo].[NhanHieu] ([MaNhanHieu], [TenNhanHieu]) VALUES (N'SUZ       ', N'Suzuki')
INSERT [dbo].[NhanHieu] ([MaNhanHieu], [TenNhanHieu]) VALUES (N'TOY       ', N'Toyota')
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 05/07/2018 14:08:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NhaCungCap]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[NhaCungCap](
	[MaNCC] [nvarchar](10) NOT NULL,
	[TenNCC] [nvarchar](50) NOT NULL,
	[LienHe] [nvarchar](100) NULL,
 CONSTRAINT [PK_NhaCungCap] PRIMARY KEY CLUSTERED 
(
	[MaNCC] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [LienHe]) VALUES (N'N001', N'Dell', N'Hoa Kỳ')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [LienHe]) VALUES (N'N002', N'Apple', N'Hoa Kỳ')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [LienHe]) VALUES (N'N003', N'Lenouvo', N'Trung Quốc')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [LienHe]) VALUES (N'N004', N'Sony', N'Nhật Bản')
/****** Object:  Table [dbo].[PhongBan]    Script Date: 05/07/2018 14:08:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PhongBan]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PhongBan](
	[MaPB] [nchar](10) NOT NULL,
	[TenPB] [nvarchar](30) NULL,
	[DiaDiem] [nvarchar](50) NULL,
 CONSTRAINT [PK_PhongBan] PRIMARY KEY CLUSTERED 
(
	[MaPB] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [dbo].[PhongBan] ([MaPB], [TenPB], [DiaDiem]) VALUES (N'ABC       ', N'dfd', N'adfa')
INSERT [dbo].[PhongBan] ([MaPB], [TenPB], [DiaDiem]) VALUES (N'PDN       ', N'Phòng đối ngoại', N'202-A1')
INSERT [dbo].[PhongBan] ([MaPB], [TenPB], [DiaDiem]) VALUES (N'PHC       ', N'Phòng hành chính', N'101-A1')
INSERT [dbo].[PhongBan] ([MaPB], [TenPB], [DiaDiem]) VALUES (N'PKH       ', N'Phòng khoa học', N'302-A1')
INSERT [dbo].[PhongBan] ([MaPB], [TenPB], [DiaDiem]) VALUES (N'PTC       ', N'Phòng tổ chức', N'405-A1')
INSERT [dbo].[PhongBan] ([MaPB], [TenPB], [DiaDiem]) VALUES (N'PTV       ', N'Phòng tài vụ', N'103-105-A1')
INSERT [dbo].[PhongBan] ([MaPB], [TenPB], [DiaDiem]) VALUES (N'PVT       ', N'Phòng vật tư', N'405-B7')
/****** Object:  Table [dbo].[NhaXuatBan]    Script Date: 05/07/2018 14:08:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NhaXuatBan]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[NhaXuatBan](
	[MaNXB] [int] IDENTITY(1,1) NOT NULL,
	[TenNXB] [nvarchar](50) NULL,
 CONSTRAINT [PK_NhaXuatBan] PRIMARY KEY CLUSTERED 
(
	[MaNXB] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[NhaXuatBan] ON
INSERT [dbo].[NhaXuatBan] ([MaNXB], [TenNXB]) VALUES (1, N'NXB Giáo Dục')
INSERT [dbo].[NhaXuatBan] ([MaNXB], [TenNXB]) VALUES (2, N'NXB Tri Thức')
INSERT [dbo].[NhaXuatBan] ([MaNXB], [TenNXB]) VALUES (3, N'NXB Lao Động')
INSERT [dbo].[NhaXuatBan] ([MaNXB], [TenNXB]) VALUES (4, N'NXB Trẻ')
INSERT [dbo].[NhaXuatBan] ([MaNXB], [TenNXB]) VALUES (5, N'NXB Sự Thật')
SET IDENTITY_INSERT [dbo].[NhaXuatBan] OFF
/****** Object:  Table [dbo].[TheLoai]    Script Date: 05/07/2018 14:08:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TheLoai]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TheLoai](
	[MaTheLoai] [int] IDENTITY(1,1) NOT NULL,
	[TenTheLoai] [nvarchar](50) NULL,
 CONSTRAINT [PK_TheLoai] PRIMARY KEY CLUSTERED 
(
	[MaTheLoai] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[TheLoai] ON
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (1, N'Trữ tình')
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (2, N'Tiền chiến')
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (3, N'Quê hương')
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (4, N'Nhạc trẻ')
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (5, N'Dân ca')
SET IDENTITY_INSERT [dbo].[TheLoai] OFF
/****** Object:  Table [dbo].[SanPham]    Script Date: 05/07/2018 14:08:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SanPham]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SanPham](
	[MaSP] [nvarchar](10) NOT NULL,
	[TenSP] [nvarchar](50) NOT NULL,
	[Gia] [decimal](18, 0) NOT NULL,
	[ConHang] [bit] NOT NULL,
	[MaNCC] [nvarchar](10) NOT NULL,
	[TenAnh] [varchar](50) NULL,
 CONSTRAINT [PK_SanPham] PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [ConHang], [MaNCC], [TenAnh]) VALUES (N'SP001', N'Vostro15', CAST(1000 AS Decimal(18, 0)), 1, N'N001', N'anh1.png')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [ConHang], [MaNCC], [TenAnh]) VALUES (N'SP002', N'Dell XPS 13', CAST(1500 AS Decimal(18, 0)), 1, N'N001', N'anh2.png')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [ConHang], [MaNCC], [TenAnh]) VALUES (N'SP003', N'Dell LCD 15', CAST(200 AS Decimal(18, 0)), 0, N'N001', N'anh3.png')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [ConHang], [MaNCC], [TenAnh]) VALUES (N'SP004', N'IPhone6', CAST(500 AS Decimal(18, 0)), 1, N'N002', N'anh4.jpg')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [ConHang], [MaNCC], [TenAnh]) VALUES (N'SP005', N'Macbook', CAST(1400 AS Decimal(18, 0)), 1, N'N002', N'anh5.jpg')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [ConHang], [MaNCC], [TenAnh]) VALUES (N'SP006', N'IPad5', CAST(1500 AS Decimal(18, 0)), 1, N'N002', N'anh6.png')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Gia], [ConHang], [MaNCC], [TenAnh]) VALUES (N'SP007', N'IPhone7', CAST(800 AS Decimal(18, 0)), 1, N'N002', N'anh7.jpg')
/****** Object:  Table [dbo].[Sach]    Script Date: 05/07/2018 14:08:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sach]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Sach](
	[MaSach] [nvarchar](10) NOT NULL,
	[TenSach] [nvarchar](50) NOT NULL,
	[SoTrang] [int] NOT NULL,
	[NgayXB] [date] NULL,
	[MaNXB] [int] NOT NULL,
 CONSTRAINT [PK_Sach] PRIMARY KEY CLUSTERED 
(
	[MaSach] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [dbo].[Sach] ([MaSach], [TenSach], [SoTrang], [NgayXB], [MaNXB]) VALUES (N'QS0001', N'Toán Cao Cấp', 435, CAST(0x38210B00 AS Date), 1)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [SoTrang], [NgayXB], [MaNXB]) VALUES (N'QS0002', N'Cơ Học', 563, CAST(0x79320B00 AS Date), 1)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [SoTrang], [NgayXB], [MaNXB]) VALUES (N'QS0003', N'Toán Rời Rạc', 546, CAST(0xEE2B0B00 AS Date), 1)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [SoTrang], [NgayXB], [MaNXB]) VALUES (N'QS0004', N'Hồ Chí Minh', 874, CAST(0x82160B00 AS Date), 2)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [SoTrang], [NgayXB], [MaNXB]) VALUES (N'QS0005', N'Việt Nam Sử Lược', 875, CAST(0xC8240B00 AS Date), 2)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [SoTrang], [NgayXB], [MaNXB]) VALUES (N'QS0006', N'Tầu Không Số', 572, CAST(0x86160B00 AS Date), 2)
/****** Object:  Table [dbo].[NhanVien]    Script Date: 05/07/2018 14:08:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NhanVien]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[NhanVien](
	[MaNV] [nchar](10) NOT NULL,
	[HoTen] [nvarchar](50) NULL,
	[NgaySinh] [date] NULL,
	[GioiTinh] [bit] NULL,
	[MaPB] [nchar](10) NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [MaPB]) VALUES (N'NV1001    ', N'Nguyễn Văn An', CAST(0x390B0B00 AS Date), 1, N'PTC       ')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [MaPB]) VALUES (N'NV1002    ', N'Trần Thị Bích', CAST(0x7F140B00 AS Date), 0, N'PTC       ')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [MaPB]) VALUES (N'NV1003    ', N'Mai Hoàng Anh', CAST(0x9C140B00 AS Date), 0, N'PTV       ')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [MaPB]) VALUES (N'NV1004    ', N'Hoàng Anh Hào', CAST(0x79120B00 AS Date), 1, N'PTV       ')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [MaPB]) VALUES (N'NV1005    ', N'Nguyễn Đình Học', CAST(0x54150B00 AS Date), 1, N'PTV       ')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [MaPB]) VALUES (N'NV1006    ', N'Bùi Hoàng Lan', CAST(0x3A150B00 AS Date), 0, N'PTC       ')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [MaPB]) VALUES (N'NV1007    ', N'Nguyen Thai Hoc', CAST(0x08110B00 AS Date), 1, N'PDN       ')
/****** Object:  Table [dbo].[MonAn]    Script Date: 05/07/2018 14:08:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MonAn]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MonAn](
	[MaMonAn] [int] IDENTITY(1,1) NOT NULL,
	[TenMonAn] [nvarchar](50) NOT NULL,
	[Gia] [int] NOT NULL,
	[KhuyenMai] [bit] NULL,
	[MaLoaiMon] [int] NOT NULL,
 CONSTRAINT [PK_MonAn] PRIMARY KEY CLUSTERED 
(
	[MaMonAn] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[MonAn] ON
INSERT [dbo].[MonAn] ([MaMonAn], [TenMonAn], [Gia], [KhuyenMai], [MaLoaiMon]) VALUES (1, N'Súp gà', 30000, 1, 1)
INSERT [dbo].[MonAn] ([MaMonAn], [TenMonAn], [Gia], [KhuyenMai], [MaLoaiMon]) VALUES (2, N'Súp hải sản', 35000, 0, 1)
INSERT [dbo].[MonAn] ([MaMonAn], [TenMonAn], [Gia], [KhuyenMai], [MaLoaiMon]) VALUES (3, N'Súp thập cẩm', 35000, 1, 1)
INSERT [dbo].[MonAn] ([MaMonAn], [TenMonAn], [Gia], [KhuyenMai], [MaLoaiMon]) VALUES (4, N'Bò sốt tiêu', 150000, 0, 2)
INSERT [dbo].[MonAn] ([MaMonAn], [TenMonAn], [Gia], [KhuyenMai], [MaLoaiMon]) VALUES (5, N'Gà rang muối', 140000, 0, 2)
INSERT [dbo].[MonAn] ([MaMonAn], [TenMonAn], [Gia], [KhuyenMai], [MaLoaiMon]) VALUES (6, N'Dê tái chanh', 150000, 1, 2)
SET IDENTITY_INSERT [dbo].[MonAn] OFF
/****** Object:  Table [dbo].[DongXe]    Script Date: 05/07/2018 14:08:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DongXe]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DongXe](
	[MaDongXe] [nchar](10) NOT NULL,
	[TenDongXe] [nvarchar](50) NOT NULL,
	[DungTich] [float] NULL,
	[Gia] [decimal](18, 0) NOT NULL,
	[MaNhanHieu] [nchar](10) NOT NULL,
	[Anh] [nvarchar](50) NULL,
 CONSTRAINT [PK_DongXe] PRIMARY KEY CLUSTERED 
(
	[MaDongXe] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [dbo].[DongXe] ([MaDongXe], [TenDongXe], [DungTich], [Gia], [MaNhanHieu], [Anh]) VALUES (N'CAM       ', N'Camrry', 3.5, CAST(2100 AS Decimal(18, 0)), N'TOY       ', N'anh1.jpg')
INSERT [dbo].[DongXe] ([MaDongXe], [TenDongXe], [DungTich], [Gia], [MaNhanHieu], [Anh]) VALUES (N'CX5       ', N'Mazda CX5', 2, CAST(899 AS Decimal(18, 0)), N'MAD       ', N'anh2.jpg')
INSERT [dbo].[DongXe] ([MaDongXe], [TenDongXe], [DungTich], [Gia], [MaNhanHieu], [Anh]) VALUES (N'E2.5      ', N'Mecerdes E2.5', 2.5, CAST(2300 AS Decimal(18, 0)), N'MED       ', N'anh3.jpg')
INSERT [dbo].[DongXe] ([MaDongXe], [TenDongXe], [DungTich], [Gia], [MaNhanHieu], [Anh]) VALUES (N'FOR       ', N'Fortuner', 2, CAST(920 AS Decimal(18, 0)), N'TOY       ', N'anh4.jpg')
INSERT [dbo].[DongXe] ([MaDongXe], [TenDongXe], [DungTich], [Gia], [MaNhanHieu], [Anh]) VALUES (N'GLA       ', N'Mecerdes GLA', 2.5, CAST(1600 AS Decimal(18, 0)), N'MED       ', N'anh5.jpg')
INSERT [dbo].[DongXe] ([MaDongXe], [TenDongXe], [DungTich], [Gia], [MaNhanHieu], [Anh]) VALUES (N'GLE       ', N'Mecerdes GLE', 2.5, CAST(1800 AS Decimal(18, 0)), N'MED       ', N'anh6.jpg')
INSERT [dbo].[DongXe] ([MaDongXe], [TenDongXe], [DungTich], [Gia], [MaNhanHieu], [Anh]) VALUES (N'INO       ', N'Innova', 2, CAST(780 AS Decimal(18, 0)), N'TOY       ', N'anh7.jpg')
INSERT [dbo].[DongXe] ([MaDongXe], [TenDongXe], [DungTich], [Gia], [MaNhanHieu], [Anh]) VALUES (N'LAND      ', N'Landcruiser', 3, CAST(1200 AS Decimal(18, 0)), N'TOY       ', N'anh7.jpg')
INSERT [dbo].[DongXe] ([MaDongXe], [TenDongXe], [DungTich], [Gia], [MaNhanHieu], [Anh]) VALUES (N'MAD3      ', N'Mazda 3', 1.5, CAST(700 AS Decimal(18, 0)), N'MAD       ', N'anh9.jpg')
INSERT [dbo].[DongXe] ([MaDongXe], [TenDongXe], [DungTich], [Gia], [MaNhanHieu], [Anh]) VALUES (N'VIO       ', N'Vios', 2, CAST(650 AS Decimal(18, 0)), N'TOY       ', N'anh10.jpg')
INSERT [dbo].[DongXe] ([MaDongXe], [TenDongXe], [DungTich], [Gia], [MaNhanHieu], [Anh]) VALUES (N'YAR       ', N'Yaris', 1.5, CAST(570 AS Decimal(18, 0)), N'TOY       ', N'anh11.jpg')
/****** Object:  Table [dbo].[BaiHat]    Script Date: 05/07/2018 14:08:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BaiHat]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[BaiHat](
	[MaBaiHat] [int] IDENTITY(1,1) NOT NULL,
	[TenBaiHat] [nvarchar](50) NOT NULL,
	[SangTac] [nvarchar](50) NULL,
	[NgayDang] [date] NULL,
	[MaTheLoai] [int] NOT NULL,
 CONSTRAINT [PK_BaiHat] PRIMARY KEY CLUSTERED 
(
	[MaBaiHat] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[BaiHat] ON
INSERT [dbo].[BaiHat] ([MaBaiHat], [TenBaiHat], [SangTac], [NgayDang], [MaTheLoai]) VALUES (1, N'Bạn Tôi', N'Võ Thiện Thanh', CAST(0x5A2A0B00 AS Date), 1)
INSERT [dbo].[BaiHat] ([MaBaiHat], [TenBaiHat], [SangTac], [NgayDang], [MaTheLoai]) VALUES (2, N'Còn tuổi nào', N'Trịnh Công Sơn', CAST(0xDF2B0B00 AS Date), 1)
INSERT [dbo].[BaiHat] ([MaBaiHat], [TenBaiHat], [SangTac], [NgayDang], [MaTheLoai]) VALUES (3, N'Duyên Phận', N'Thái Thịnh', CAST(0x12290B00 AS Date), 1)
INSERT [dbo].[BaiHat] ([MaBaiHat], [TenBaiHat], [SangTac], [NgayDang], [MaTheLoai]) VALUES (4, N'Tình Ca', N'Hoàng Việt', CAST(0x1C230B00 AS Date), 2)
INSERT [dbo].[BaiHat] ([MaBaiHat], [TenBaiHat], [SangTac], [NgayDang], [MaTheLoai]) VALUES (5, N'Cỏ Úa', N'Vũ Khanh', CAST(0x57210B00 AS Date), 2)
INSERT [dbo].[BaiHat] ([MaBaiHat], [TenBaiHat], [SangTac], [NgayDang], [MaTheLoai]) VALUES (7, N'Hoang Vu', N'Ngọc Lan', CAST(0x21210B00 AS Date), 2)
SET IDENTITY_INSERT [dbo].[BaiHat] OFF
/****** Object:  ForeignKey [FK_BaiHat_TheLoai]    Script Date: 05/07/2018 14:08:57 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BaiHat_TheLoai]') AND parent_object_id = OBJECT_ID(N'[dbo].[BaiHat]'))
ALTER TABLE [dbo].[BaiHat]  WITH CHECK ADD  CONSTRAINT [FK_BaiHat_TheLoai] FOREIGN KEY([MaTheLoai])
REFERENCES [dbo].[TheLoai] ([MaTheLoai])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BaiHat_TheLoai]') AND parent_object_id = OBJECT_ID(N'[dbo].[BaiHat]'))
ALTER TABLE [dbo].[BaiHat] CHECK CONSTRAINT [FK_BaiHat_TheLoai]
GO
/****** Object:  ForeignKey [FK_DongXe_NhanHieu]    Script Date: 05/07/2018 14:08:57 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DongXe_NhanHieu]') AND parent_object_id = OBJECT_ID(N'[dbo].[DongXe]'))
ALTER TABLE [dbo].[DongXe]  WITH CHECK ADD  CONSTRAINT [FK_DongXe_NhanHieu] FOREIGN KEY([MaNhanHieu])
REFERENCES [dbo].[NhanHieu] ([MaNhanHieu])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DongXe_NhanHieu]') AND parent_object_id = OBJECT_ID(N'[dbo].[DongXe]'))
ALTER TABLE [dbo].[DongXe] CHECK CONSTRAINT [FK_DongXe_NhanHieu]
GO
/****** Object:  ForeignKey [FK_MonAn_LoaiMon]    Script Date: 05/07/2018 14:08:57 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_MonAn_LoaiMon]') AND parent_object_id = OBJECT_ID(N'[dbo].[MonAn]'))
ALTER TABLE [dbo].[MonAn]  WITH CHECK ADD  CONSTRAINT [FK_MonAn_LoaiMon] FOREIGN KEY([MaLoaiMon])
REFERENCES [dbo].[LoaiMon] ([MaLoaiMon])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_MonAn_LoaiMon]') AND parent_object_id = OBJECT_ID(N'[dbo].[MonAn]'))
ALTER TABLE [dbo].[MonAn] CHECK CONSTRAINT [FK_MonAn_LoaiMon]
GO
/****** Object:  ForeignKey [FK_NhanVien_PhongBan]    Script Date: 05/07/2018 14:08:57 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_NhanVien_PhongBan]') AND parent_object_id = OBJECT_ID(N'[dbo].[NhanVien]'))
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_PhongBan] FOREIGN KEY([MaPB])
REFERENCES [dbo].[PhongBan] ([MaPB])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_NhanVien_PhongBan]') AND parent_object_id = OBJECT_ID(N'[dbo].[NhanVien]'))
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [FK_NhanVien_PhongBan]
GO
/****** Object:  ForeignKey [FK_Sach_NhaXuatBan]    Script Date: 05/07/2018 14:08:57 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Sach_NhaXuatBan]') AND parent_object_id = OBJECT_ID(N'[dbo].[Sach]'))
ALTER TABLE [dbo].[Sach]  WITH CHECK ADD  CONSTRAINT [FK_Sach_NhaXuatBan] FOREIGN KEY([MaNXB])
REFERENCES [dbo].[NhaXuatBan] ([MaNXB])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Sach_NhaXuatBan]') AND parent_object_id = OBJECT_ID(N'[dbo].[Sach]'))
ALTER TABLE [dbo].[Sach] CHECK CONSTRAINT [FK_Sach_NhaXuatBan]
GO
/****** Object:  ForeignKey [FK_SanPham_NhaCungCap]    Script Date: 05/07/2018 14:08:57 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SanPham_NhaCungCap]') AND parent_object_id = OBJECT_ID(N'[dbo].[SanPham]'))
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_NhaCungCap] FOREIGN KEY([MaNCC])
REFERENCES [dbo].[NhaCungCap] ([MaNCC])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SanPham_NhaCungCap]') AND parent_object_id = OBJECT_ID(N'[dbo].[SanPham]'))
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_NhaCungCap]
GO
/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2017 (14.0.1000)
    Source Database Engine Edition : Microsoft SQL Server Express Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Express Edition
    Target Database Engine Type : Standalone SQL Server
*/
USE [LTWeb]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DienThoai]') AND type in (N'U'))
ALTER TABLE [dbo].[DienThoai] DROP CONSTRAINT IF EXISTS [FK_DienThoai_ThuongHieu]
GO
/****** Object:  Table [dbo].[ThuongHieu]    Script Date: 6/15/2020 7:20:35 PM ******/
DROP TABLE IF EXISTS [dbo].[ThuongHieu]
GO
/****** Object:  Table [dbo].[DienThoai]    Script Date: 6/15/2020 7:20:35 PM ******/
DROP TABLE IF EXISTS [dbo].[DienThoai]
GO
/****** Object:  Table [dbo].[DienThoai]    Script Date: 6/15/2020 7:20:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DienThoai](
	[MaDienThoai] [varchar](20) NOT NULL,
	[MaThuongHieu] [int] NOT NULL,
	[TenDienThoai] [nvarchar](30) NOT NULL,
	[GiaTien] [int] NOT NULL,
	[ChietKhau] [int] NULL,
	[SPMoi] [bit] NULL,
	[SPBanChay] [bit] NULL,
	[Anh] [nvarchar](100) NULL,
	[MoTa] [text] NULL,
 CONSTRAINT [PK_DienThoai] PRIMARY KEY CLUSTERED 
(
	[MaDienThoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThuongHieu]    Script Date: 6/15/2020 7:20:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThuongHieu](
	[MaThuongHieu] [int] NOT NULL,
	[TenThuongHieu] [nchar](30) NOT NULL,
	[XuatXu] [nchar](100) NOT NULL,
 CONSTRAINT [PK_ThuongHieu] PRIMARY KEY CLUSTERED 
(
	[MaThuongHieu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[DienThoai] ([MaDienThoai], [MaThuongHieu], [TenDienThoai], [GiaTien], [ChietKhau], [SPMoi], [SPBanChay], [Anh], [MoTa]) VALUES (N'ip001', 2, N'iPhone 11 64G', 21900000, 10, 1, 1, N'm1.jpg', NULL)
INSERT [dbo].[DienThoai] ([MaDienThoai], [MaThuongHieu], [TenDienThoai], [GiaTien], [ChietKhau], [SPMoi], [SPBanChay], [Anh], [MoTa]) VALUES (N'ip002', 2, N'iPhone 11 Pro Max 512G', 41500000, 5, 1, 1, N'm2.jpg', NULL)
INSERT [dbo].[DienThoai] ([MaDienThoai], [MaThuongHieu], [TenDienThoai], [GiaTien], [ChietKhau], [SPMoi], [SPBanChay], [Anh], [MoTa]) VALUES (N'ip003', 2, N'iPhone 11 Pro 256G', 32000000, 10, 1, 0, N'm3.jpg', NULL)
INSERT [dbo].[DienThoai] ([MaDienThoai], [MaThuongHieu], [TenDienThoai], [GiaTien], [ChietKhau], [SPMoi], [SPBanChay], [Anh], [MoTa]) VALUES (N'ip004', 2, N'iPhone Xs 256G', 24000000, 15, 0, 0, N'm4.jpg', NULL)
INSERT [dbo].[DienThoai] ([MaDienThoai], [MaThuongHieu], [TenDienThoai], [GiaTien], [ChietKhau], [SPMoi], [SPBanChay], [Anh], [MoTa]) VALUES (N'ss001', 1, N'Samsung Galaxy A21s', 5390000, 0, 0, 0, N'm5.jpg', NULL)
INSERT [dbo].[DienThoai] ([MaDienThoai], [MaThuongHieu], [TenDienThoai], [GiaTien], [ChietKhau], [SPMoi], [SPBanChay], [Anh], [MoTa]) VALUES (N'ss002', 1, N'Samsung Galaxy A51', 7490000, 5, 1, 1, N'm6.jpg', NULL)
INSERT [dbo].[DienThoai] ([MaDienThoai], [MaThuongHieu], [TenDienThoai], [GiaTien], [ChietKhau], [SPMoi], [SPBanChay], [Anh], [MoTa]) VALUES (N'ss003', 1, N'Samsung Galaxy S10', 13000000, 10, 0, 1, N'm7.jpg', NULL)
INSERT [dbo].[DienThoai] ([MaDienThoai], [MaThuongHieu], [TenDienThoai], [GiaTien], [ChietKhau], [SPMoi], [SPBanChay], [Anh], [MoTa]) VALUES (N'ss004', 1, N'Samsung Galaxy S20', 24000000, 5, 1, 1, N'm8.jpg', NULL)
INSERT [dbo].[ThuongHieu] ([MaThuongHieu], [TenThuongHieu], [XuatXu]) VALUES (1, N'SamSung                       ', N'Hàn Quốc                                                                                            ')
INSERT [dbo].[ThuongHieu] ([MaThuongHieu], [TenThuongHieu], [XuatXu]) VALUES (2, N'Apple                         ', N'Mỹ                                                                                                  ')
INSERT [dbo].[ThuongHieu] ([MaThuongHieu], [TenThuongHieu], [XuatXu]) VALUES (3, N'VinSmart                      ', N'Việt Nam                                                                                            ')
INSERT [dbo].[ThuongHieu] ([MaThuongHieu], [TenThuongHieu], [XuatXu]) VALUES (4, N'Oppo                          ', N'Trung Quốc                                                                                          ')
INSERT [dbo].[ThuongHieu] ([MaThuongHieu], [TenThuongHieu], [XuatXu]) VALUES (5, N'Sony                          ', N'Nhật                                                                                                ')
ALTER TABLE [dbo].[DienThoai]  WITH CHECK ADD  CONSTRAINT [FK_DienThoai_ThuongHieu] FOREIGN KEY([MaThuongHieu])
REFERENCES [dbo].[ThuongHieu] ([MaThuongHieu])
GO
ALTER TABLE [dbo].[DienThoai] CHECK CONSTRAINT [FK_DienThoai_ThuongHieu]
GO


