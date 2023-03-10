USE [master]
GO
/****** Object:  Database [BanHangTrucTuyen2]    Script Date: 12/23/2022 5:32:19 PM ******/
CREATE DATABASE [BanHangTrucTuyen2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BanHangTrucTuyen2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MAYAO\MSSQL\DATA\BanHangTrucTuyen2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BanHangTrucTuyen2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MAYAO\MSSQL\DATA\BanHangTrucTuyen2.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BanHangTrucTuyen2] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BanHangTrucTuyen2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BanHangTrucTuyen2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BanHangTrucTuyen2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BanHangTrucTuyen2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BanHangTrucTuyen2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BanHangTrucTuyen2] SET ARITHABORT OFF 
GO
ALTER DATABASE [BanHangTrucTuyen2] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [BanHangTrucTuyen2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BanHangTrucTuyen2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BanHangTrucTuyen2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BanHangTrucTuyen2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BanHangTrucTuyen2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BanHangTrucTuyen2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BanHangTrucTuyen2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BanHangTrucTuyen2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BanHangTrucTuyen2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BanHangTrucTuyen2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BanHangTrucTuyen2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BanHangTrucTuyen2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BanHangTrucTuyen2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BanHangTrucTuyen2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BanHangTrucTuyen2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BanHangTrucTuyen2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BanHangTrucTuyen2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BanHangTrucTuyen2] SET  MULTI_USER 
GO
ALTER DATABASE [BanHangTrucTuyen2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BanHangTrucTuyen2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BanHangTrucTuyen2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BanHangTrucTuyen2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BanHangTrucTuyen2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BanHangTrucTuyen2] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'BanHangTrucTuyen2', N'ON'
GO
ALTER DATABASE [BanHangTrucTuyen2] SET QUERY_STORE = OFF
GO
USE [BanHangTrucTuyen2]
GO
/****** Object:  UserDefinedFunction [dbo].[TuTangMaKHang]    Script Date: 12/23/2022 5:32:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[TuTangMaKHang]()
RETURNs nvarchar(10)
AS 
BEGIN 
DECLARE @magv NVARCHAR(10)
	
SELECT @magv = MaKH FROM dbo.KhachHang
IF @magv IS NULL
SET @magv = 0
ELSE 
SELECT @magv = MAX(CONVERT(INT, substring(MaKH,3,len(MaKH)-2))) FROM dbo.KhachHang
SELECT @magv = CASE
	WHEN @magv >=0 AND @magv <9 THEN  'KH00'+CONVERT(CHAR,@magv +1)
	WHEN @magv >=9 AND @magv <99 THEN  'KH'+CONVERT(CHAR,@magv +1)
	WHEN @magv >=99  THEN 'KH'+CONVERT(CHAR,@magv +1)
	
	END 
RETURN @magv

END
GO
/****** Object:  UserDefinedFunction [dbo].[TuTangMaSanPham]    Script Date: 12/23/2022 5:32:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[TuTangMaSanPham]()
RETURNs nvarchar(10)
AS 
BEGIN 
DECLARE @masp NVARCHAR(10)
	
SELECT @masp = MaSP FROM dbo.SanPham
IF @masp IS NULL
SET @masp = 0
ELSE 
SELECT @masp = MAX(CONVERT(INT, substring(MaSP,3,len(MaSP)-2))) FROM dbo.SanPham
SELECT @masp = CASE
	WHEN @masp >=0 AND @masp <9 THEN  'SP00000'+CONVERT(CHAR,@masp +1)
	WHEN @masp >=9 AND @masp <99 THEN  'SP0000'+CONVERT(CHAR,@masp +1)
	WHEN @masp >=99 AND @masp <999 THEN  'SP000'+CONVERT(CHAR,@masp +1)
	WHEN @masp >=999 AND @masp <9999 THEN  'SP00'+CONVERT(CHAR,@masp +1)
	WHEN @masp >=9999 AND @masp <99999 THEN  'SP0'+CONVERT(CHAR,@masp +1)
	WHEN @masp >=99999  THEN 'SP'+CONVERT(CHAR,@masp +1)
	
	END 
RETURN @masp

END
GO
/****** Object:  Table [dbo].[ChiTietOrder]    Script Date: 12/23/2022 5:32:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietOrder](
	[MaChiTietDon] [int] IDENTITY(1,1) NOT NULL,
	[GiaTien] [money] NOT NULL,
	[Soluong] [int] NULL,
	[Mausac] [nvarchar](255) NULL,
	[Khuyenmai] [nvarchar](255) NULL,
	[MaDon] [int] NULL,
	[MaSP] [nvarchar](50) NULL,
	[NgayShip] [date] NULL,
 CONSTRAINT [PK_ChiTietOrder] PRIMARY KEY CLUSTERED 
(
	[MaChiTietDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietThuocTinh]    Script Date: 12/23/2022 5:32:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietThuocTinh](
	[MaChiTiet] [int] IDENTITY(1,1) NOT NULL,
	[MaTT] [int] NOT NULL,
	[Chitiet] [nvarchar](50) NULL,
 CONSTRAINT [PK__Attribut__7C2DE57297D158D1] PRIMARY KEY CLUSTERED 
(
	[MaChiTiet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DaiLy]    Script Date: 12/23/2022 5:32:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DaiLy](
	[MaDL] [nvarchar](10) NOT NULL,
	[Ten] [nvarchar](255) NULL,
	[DiaChi] [nvarchar](255) NULL,
	[Ngaymo] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Danhmuc]    Script Date: 12/23/2022 5:32:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Danhmuc](
	[MaDM] [nvarchar](10) NOT NULL,
	[TenDM] [nvarchar](255) NULL,
	[Anh] [nvarchar](255) NULL,
	[MoTa] [nvarchar](max) NULL,
	[ParentID] [int] NULL,
	[Levels] [int] NULL,
	[Published] [bit] NULL,
	[TieuDe] [nvarchar](255) NULL,
	[Picture] [nvarchar](255) NULL,
	[MetaDecs] [nvarchar](255) NULL,
	[MetaKey] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DonHang]    Script Date: 12/23/2022 5:32:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonHang](
	[MaDon] [int] IDENTITY(1,1) NOT NULL,
	[NgayDatDon] [date] NULL,
	[Ngayship] [date] NULL,
	[Deleted] [bit] NULL,
	[TraHang] [bit] NULL,
	[Ngaytra] [date] NULL,
	[MaKH] [nvarchar](10) NULL,
	[MaShipper] [nvarchar](10) NULL,
	[MaThanhToan] [nvarchar](10) NULL,
	[Thue] [float] NULL,
	[ShortDesc] [nchar](10) NULL,
	[Ghichu] [nvarchar](max) NULL,
	[MaTrangThai] [nvarchar](10) NULL,
	[TongTien] [money] NULL,
 CONSTRAINT [PK__Orders__C3905BAF2DA3C6B2] PRIMARY KEY CLUSTERED 
(
	[MaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 12/23/2022 5:32:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [nvarchar](10) NOT NULL,
	[TenKH] [nvarchar](255) NULL,
	[NgaySinh] [date] NULL,
	[CCCD_CMT] [nvarchar](255) NULL,
	[SĐT] [nvarchar](255) NULL,
	[MaVT] [nvarchar](10) NULL,
	[DiaChi] [nvarchar](255) NULL,
	[CreateDate] [date] NULL,
	[Password] [nvarchar](50) NULL,
	[Salt] [nchar](8) NULL,
	[LastLogin] [date] NULL,
	[Active] [bit] NULL,
	[Tendangnhap] [nvarchar](50) NOT NULL,
	[MaQuyen] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK__KhachHan__A4AE64B857D78D72] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PictureProduct]    Script Date: 12/23/2022 5:32:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PictureProduct](
	[MaA] [char](10) NOT NULL,
	[Anh1] [nvarchar](200) NULL,
	[Anh2] [nvarchar](200) NULL,
	[Anh3] [nvarchar](200) NULL,
	[Anh4] [nvarchar](200) NULL,
	[Anh5] [nvarchar](200) NULL,
	[MaSP] [nvarchar](50) NULL,
 CONSTRAINT [PK__PictureP__C7977BB7C77BF61E] PRIMARY KEY CLUSTERED 
(
	[MaA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuyenTC]    Script Date: 12/23/2022 5:32:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuyenTC](
	[MaQuyen] [nvarchar](10) NOT NULL,
	[MaKH] [nvarchar](255) NULL,
	[MieuTa] [int] NULL,
 CONSTRAINT [PK__Roles__8AFACE3A1AC2B04D] PRIMARY KEY CLUSTERED 
(
	[MaQuyen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 12/23/2022 5:32:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSP] [nvarchar](50) NOT NULL,
	[TenSP] [nvarchar](255) NULL,
	[MoTa] [nvarchar](255) NULL,
	[Trangthai] [nvarchar](100) NULL,
	[Diachi] [nvarchar](255) NULL,
	[MaDL] [nvarchar](10) NULL,
	[MaDM] [nvarchar](10) NULL,
	[Thumb] [nvarchar](255) NULL,
	[Video] [nvarchar](255) NULL,
	[DateCreated] [date] NULL,
	[DateModified] [date] NULL,
	[BestSellers] [bit] NULL,
	[Homeflag] [bit] NULL,
	[Active] [bit] NULL,
	[Tags] [nvarchar](max) NULL,
	[Tieude] [nvarchar](max) NULL,
	[Alias] [nvarchar](255) NULL,
	[MetaDesc] [nvarchar](255) NULL,
	[MetaKey] [nvarchar](255) NULL,
	[SoLo] [int] NULL,
	[Gia] [money] NULL,
 CONSTRAINT [PK__SanPham__B40CC6ED56E2CB80] PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shipper]    Script Date: 12/23/2022 5:32:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shipper](
	[MaShipper] [nvarchar](10) NOT NULL,
	[TenShipper] [nvarchar](255) NULL,
	[SĐT] [nvarchar](255) NULL,
	[CongTy] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaShipper] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SP_Danhgia]    Script Date: 12/23/2022 5:32:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SP_Danhgia](
	[Madanhgia_sp] [int] IDENTITY(1,1) NOT NULL,
	[MaSP] [nvarchar](50) NOT NULL,
	[noidung_danhgia] [nvarchar](max) NULL,
	[MaKH] [nvarchar](10) NOT NULL,
	[NgayDanhgia] [date] NULL,
	[Sao] [int] NULL,
 CONSTRAINT [PK__SP_Danhg__A365E01F1AB52B6A] PRIMARY KEY CLUSTERED 
(
	[Madanhgia_sp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SP_Danhgia1]    Script Date: 12/23/2022 5:32:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SP_Danhgia1](
	[Madanhgia_sp] [int] IDENTITY(1,1) NOT NULL,
	[MaSP] [int] NOT NULL,
	[noidung_danhgia] [nvarchar](max) NULL,
	[MaKH] [int] NOT NULL,
	[NgayDanhgia] [date] NULL,
	[Sao] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Madanhgia_sp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SP_ThuocTinh]    Script Date: 12/23/2022 5:32:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SP_ThuocTinh](
	[Ma_SP_TT] [int] IDENTITY(1,1) NOT NULL,
	[MaSP] [nvarchar](50) NOT NULL,
	[MaChiTiet] [int] NOT NULL,
 CONSTRAINT [PK__SP_Thuoc__605B42DAB3F8CE70] PRIMARY KEY CLUSTERED 
(
	[Ma_SP_TT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 12/23/2022 5:32:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[AccountID] [nvarchar](10) NOT NULL,
	[TenDangNhap] [nvarchar](10) NULL,
	[SĐT] [nvarchar](255) NULL,
	[Password] [nvarchar](50) NULL,
	[Mahoa] [nchar](6) NULL,
	[Kichhoat] [int] NULL,
	[Ngaytao] [datetime] NULL,
	[LastLogin] [datetime] NULL,
	[MaQuyen] [nvarchar](10) NULL,
 CONSTRAINT [PK__Account__349DA586C498A2C3] PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThanhToan]    Script Date: 12/23/2022 5:32:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThanhToan](
	[MaThanhToan] [nvarchar](10) NOT NULL,
	[HinhThuc] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaThanhToan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThuocTinh]    Script Date: 12/23/2022 5:32:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThuocTinh](
	[MaTT] [int] IDENTITY(1,1) NOT NULL,
	[Tenthuoctinh] [nvarchar](255) NULL,
 CONSTRAINT [PK__Attribut__C189298A0D548599] PRIMARY KEY CLUSTERED 
(
	[MaTT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Trang]    Script Date: 12/23/2022 5:32:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trang](
	[PageID] [nvarchar](10) NOT NULL,
	[PageName] [nvarchar](255) NULL,
	[Noidung] [nvarchar](max) NULL,
	[Thumb] [nvarchar](255) NULL,
	[DuocRaDoi] [int] NULL,
	[TieuDe] [nvarchar](255) NULL,
	[MetaDesc] [nvarchar](255) NULL,
	[MetaKey] [nvarchar](255) NULL,
	[Alias] [nvarchar](255) NULL,
	[Ngaytaotrang] [date] NULL,
	[ThuTu] [int] NULL,
 CONSTRAINT [PK_Pages] PRIMARY KEY CLUSTERED 
(
	[PageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TrangThaiDon]    Script Date: 12/23/2022 5:32:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrangThaiDon](
	[MaTrangThai] [nvarchar](10) NOT NULL,
	[TrangThai] [nvarchar](255) NULL,
	[MoTa] [nvarchar](max) NULL,
 CONSTRAINT [PK_TransactStatus] PRIMARY KEY CLUSTERED 
(
	[MaTrangThai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vitri]    Script Date: 12/23/2022 5:32:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vitri](
	[MaVT] [nvarchar](10) NOT NULL,
	[TenVT] [nvarchar](255) NULL,
	[Loai] [nvarchar](20) NULL,
	[NameWithType] [nvarchar](255) NULL,
	[PathWithType] [nvarchar](255) NULL,
	[ParentCode] [int] NULL,
	[Mucdo] [int] NULL,
 CONSTRAINT [PK_Locations] PRIMARY KEY CLUSTERED 
(
	[MaVT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ChiTietOrder] ON 

INSERT [dbo].[ChiTietOrder] ([MaChiTietDon], [GiaTien], [Soluong], [Mausac], [Khuyenmai], [MaDon], [MaSP], [NgayShip]) VALUES (1, 10000.0000, 2, NULL, NULL, 1, N'SP000001', NULL)
INSERT [dbo].[ChiTietOrder] ([MaChiTietDon], [GiaTien], [Soluong], [Mausac], [Khuyenmai], [MaDon], [MaSP], [NgayShip]) VALUES (2, 100000.0000, 1, NULL, NULL, 1, N'SP000002', NULL)
INSERT [dbo].[ChiTietOrder] ([MaChiTietDon], [GiaTien], [Soluong], [Mausac], [Khuyenmai], [MaDon], [MaSP], [NgayShip]) VALUES (3, 40000000.0000, 2, NULL, NULL, 9, N'SP000003', NULL)
INSERT [dbo].[ChiTietOrder] ([MaChiTietDon], [GiaTien], [Soluong], [Mausac], [Khuyenmai], [MaDon], [MaSP], [NgayShip]) VALUES (4, 15400000.0000, 1, NULL, NULL, 9, N'SP000004', NULL)
INSERT [dbo].[ChiTietOrder] ([MaChiTietDon], [GiaTien], [Soluong], [Mausac], [Khuyenmai], [MaDon], [MaSP], [NgayShip]) VALUES (5, 17400000.0000, 1, NULL, NULL, 10, N'SP000001', NULL)
INSERT [dbo].[ChiTietOrder] ([MaChiTietDon], [GiaTien], [Soluong], [Mausac], [Khuyenmai], [MaDon], [MaSP], [NgayShip]) VALUES (6, 22000000.0000, 1, NULL, NULL, 10, N'SP000002', NULL)
INSERT [dbo].[ChiTietOrder] ([MaChiTietDon], [GiaTien], [Soluong], [Mausac], [Khuyenmai], [MaDon], [MaSP], [NgayShip]) VALUES (7, 20000000.0000, 1, NULL, NULL, 10, N'SP000003', NULL)
INSERT [dbo].[ChiTietOrder] ([MaChiTietDon], [GiaTien], [Soluong], [Mausac], [Khuyenmai], [MaDon], [MaSP], [NgayShip]) VALUES (8, 34800000.0000, 2, NULL, NULL, 11, N'SP000001', NULL)
SET IDENTITY_INSERT [dbo].[ChiTietOrder] OFF
GO
SET IDENTITY_INSERT [dbo].[ChiTietThuocTinh] ON 

INSERT [dbo].[ChiTietThuocTinh] ([MaChiTiet], [MaTT], [Chitiet]) VALUES (1, 1, N'23.8 inch, Full HD')
INSERT [dbo].[ChiTietThuocTinh] ([MaChiTiet], [MaTT], [Chitiet]) VALUES (2, 1, N'24 inch, 4.5K')
INSERT [dbo].[ChiTietThuocTinh] ([MaChiTiet], [MaTT], [Chitiet]) VALUES (3, 1, N'32 inch, Full HD')
INSERT [dbo].[ChiTietThuocTinh] ([MaChiTiet], [MaTT], [Chitiet]) VALUES (4, 2, N'2kg')
INSERT [dbo].[ChiTietThuocTinh] ([MaChiTiet], [MaTT], [Chitiet]) VALUES (5, 2, N'0.5kg')
INSERT [dbo].[ChiTietThuocTinh] ([MaChiTiet], [MaTT], [Chitiet]) VALUES (6, 2, N'10kg')
INSERT [dbo].[ChiTietThuocTinh] ([MaChiTiet], [MaTT], [Chitiet]) VALUES (7, 3, N'4GB')
INSERT [dbo].[ChiTietThuocTinh] ([MaChiTiet], [MaTT], [Chitiet]) VALUES (8, 3, N'8GB')
INSERT [dbo].[ChiTietThuocTinh] ([MaChiTiet], [MaTT], [Chitiet]) VALUES (9, 3, N'16GB')
INSERT [dbo].[ChiTietThuocTinh] ([MaChiTiet], [MaTT], [Chitiet]) VALUES (10, 4, N'Apple M1')
INSERT [dbo].[ChiTietThuocTinh] ([MaChiTiet], [MaTT], [Chitiet]) VALUES (11, 4, N'i5, 1135G7, 2.40 GHz')
INSERT [dbo].[ChiTietThuocTinh] ([MaChiTiet], [MaTT], [Chitiet]) VALUES (12, 4, N'Ryzen 7580, 0X, 3.80 GHz')
INSERT [dbo].[ChiTietThuocTinh] ([MaChiTiet], [MaTT], [Chitiet]) VALUES (13, 5, N'1000W')
INSERT [dbo].[ChiTietThuocTinh] ([MaChiTiet], [MaTT], [Chitiet]) VALUES (14, 5, N'5000W')
INSERT [dbo].[ChiTietThuocTinh] ([MaChiTiet], [MaTT], [Chitiet]) VALUES (15, 5, N'10000W')
SET IDENTITY_INSERT [dbo].[ChiTietThuocTinh] OFF
GO
INSERT [dbo].[DaiLy] ([MaDL], [Ten], [DiaChi], [Ngaymo]) VALUES (N'DL01', N'Điện máy xanh', N'Quan Hoa, Cầu Giấy, Hà Nội', CAST(N'2010-10-18' AS Date))
INSERT [dbo].[DaiLy] ([MaDL], [Ten], [DiaChi], [Ngaymo]) VALUES (N'DL02', N'Thế giới di động', N'Phạm Văn Đồng, Cầu Giấy, Hà Nội', CAST(N'2017-09-03' AS Date))
INSERT [dbo].[DaiLy] ([MaDL], [Ten], [DiaChi], [Ngaymo]) VALUES (N'DL03', N'Phong Vũ PC', N'Đống Đa, Hà Nội', CAST(N'2007-03-06' AS Date))
INSERT [dbo].[DaiLy] ([MaDL], [Ten], [DiaChi], [Ngaymo]) VALUES (N'DL04', N'An Phát Computer', N'49 Thái Hà ,Đống Đa , Hà Nội', CAST(N'2020-04-08' AS Date))
INSERT [dbo].[DaiLy] ([MaDL], [Ten], [DiaChi], [Ngaymo]) VALUES (N'DL05', N'Hà Nội COmputer', N'131, Lê Thanh Nghị, Đồng Tâm, Hai Bà Trưng, Hà Nội', CAST(N'2020-09-07' AS Date))
INSERT [dbo].[DaiLy] ([MaDL], [Ten], [DiaChi], [Ngaymo]) VALUES (N'DL06', N'Home Center', N'399 Phạm Văn Đồng, Hà Nội', CAST(N'2010-12-23' AS Date))
INSERT [dbo].[DaiLy] ([MaDL], [Ten], [DiaChi], [Ngaymo]) VALUES (N'DL07', N'FPT', N'22 Nguyễn Phong Sắc, Dịch Vọng Hậu, Cầu Giấy, Hà Nội', CAST(N'2002-05-23' AS Date))
INSERT [dbo].[DaiLy] ([MaDL], [Ten], [DiaChi], [Ngaymo]) VALUES (N'DL08', N'Media Mark', N'72 Đ. Trường Chinh, Phương Đình, Đống Đa, Hà Nội', CAST(N'2014-12-27' AS Date))
INSERT [dbo].[DaiLy] ([MaDL], [Ten], [DiaChi], [Ngaymo]) VALUES (N'DL09', N'Siêu thị điện máy Nguyễn Kim', N'19 Đ. Nguyễn Chí Thanh, Ngọc Khánh, Ba Đình, Hà Nội', CAST(N'2005-12-07' AS Date))
INSERT [dbo].[DaiLy] ([MaDL], [Ten], [DiaChi], [Ngaymo]) VALUES (N'DL10', N'Siêu thị điện máy Chợ Lớn', N'Số 12 Ng. 331 Đ. Trần Khát Chân, Thanh Nhàn, Hai Bà Trưng, Hà Nội', CAST(N'2019-02-10' AS Date))
GO
INSERT [dbo].[Danhmuc] ([MaDM], [TenDM], [Anh], [MoTa], [ParentID], [Levels], [Published], [TieuDe], [Picture], [MetaDecs], [MetaKey]) VALUES (N'DM01', N'Tv, Loa, Dàn Karaoke', N'', N'', NULL, NULL, NULL, N'Tv, Loa, Dàn Karaoke', N'cate1.jpg', N'', N'')
INSERT [dbo].[Danhmuc] ([MaDM], [TenDM], [Anh], [MoTa], [ParentID], [Levels], [Published], [TieuDe], [Picture], [MetaDecs], [MetaKey]) VALUES (N'DM02', N'Tủ lạnh, Tủ mát', N'', N'', NULL, NULL, NULL, N'Tủ lạnh, Tủ mát', N'cate2.jpg', N'', N'')
INSERT [dbo].[Danhmuc] ([MaDM], [TenDM], [Anh], [MoTa], [ParentID], [Levels], [Published], [TieuDe], [Picture], [MetaDecs], [MetaKey]) VALUES (N'DM03', N'Máy giặt, Máy sấy', N'', N'', NULL, NULL, NULL, N'Máy giạt, Mát sấy quần áo', N'cate3.jpg', N'', N'')
INSERT [dbo].[Danhmuc] ([MaDM], [TenDM], [Anh], [MoTa], [ParentID], [Levels], [Published], [TieuDe], [Picture], [MetaDecs], [MetaKey]) VALUES (N'DM04', N'Điều hòa, Máy lạnh', N'', N'', NULL, NULL, NULL, N'Máy lạnh, Máy nước nóng', N'cate4.jpg', N'', N'')
INSERT [dbo].[Danhmuc] ([MaDM], [TenDM], [Anh], [MoTa], [ParentID], [Levels], [Published], [TieuDe], [Picture], [MetaDecs], [MetaKey]) VALUES (N'DM05', N'Điện gia dụng', N'', N'', NULL, NULL, NULL, N'Điện gia dụng, nồi chiên', N'cate1.jpg', N'', N'')
INSERT [dbo].[Danhmuc] ([MaDM], [TenDM], [Anh], [MoTa], [ParentID], [Levels], [Published], [TieuDe], [Picture], [MetaDecs], [MetaKey]) VALUES (N'DM06', N'Dụng cụ bếp, Bếp điện', N'', N'', NULL, NULL, NULL, N'Dụng cụ bếp, Bếp điện', N'cate2.jpg', N'', N'')
INSERT [dbo].[Danhmuc] ([MaDM], [TenDM], [Anh], [MoTa], [ParentID], [Levels], [Published], [TieuDe], [Picture], [MetaDecs], [MetaKey]) VALUES (N'DM07', N'Máy lọc nước', N'', N'', NULL, NULL, NULL, N'Máy lọc nước, nồi cơm điện', N'cate3.jpg', N'', N'')
INSERT [dbo].[Danhmuc] ([MaDM], [TenDM], [Anh], [MoTa], [ParentID], [Levels], [Published], [TieuDe], [Picture], [MetaDecs], [MetaKey]) VALUES (N'DM08', N'Sức khỏe & Làm đẹp', N'', N'', NULL, NULL, NULL, N'Sức khỏe & Làm đẹp', N'cate4.jpg', N'', N'')
INSERT [dbo].[Danhmuc] ([MaDM], [TenDM], [Anh], [MoTa], [ParentID], [Levels], [Published], [TieuDe], [Picture], [MetaDecs], [MetaKey]) VALUES (N'DM09', N'Điện thoại, Máy tính', N'', N'', NULL, NULL, NULL, N'Điện thoại, Máy tính', N'cate1.jpg', N'', N'')
INSERT [dbo].[Danhmuc] ([MaDM], [TenDM], [Anh], [MoTa], [ParentID], [Levels], [Published], [TieuDe], [Picture], [MetaDecs], [MetaKey]) VALUES (N'DM10', N'Phụ tùng sửa chữa ', N'', N'', NULL, NULL, NULL, N'Phụ tùng sửa chữa ', N'cate2.jpg', N'', N'')
INSERT [dbo].[Danhmuc] ([MaDM], [TenDM], [Anh], [MoTa], [ParentID], [Levels], [Published], [TieuDe], [Picture], [MetaDecs], [MetaKey]) VALUES (N'DM11', N'Đồng hồ', N'', N'', NULL, NULL, NULL, N'Đồng hồ', N'cate3.jpg', N'', N'')
INSERT [dbo].[Danhmuc] ([MaDM], [TenDM], [Anh], [MoTa], [ParentID], [Levels], [Published], [TieuDe], [Picture], [MetaDecs], [MetaKey]) VALUES (N'DM12', N'Ô tô, Phụ kiện ô tô', N'', N'', NULL, NULL, NULL, N'Ô tô, Phụ kiện ô tô', N'cate4.jpg', N'', N'')
INSERT [dbo].[Danhmuc] ([MaDM], [TenDM], [Anh], [MoTa], [ParentID], [Levels], [Published], [TieuDe], [Picture], [MetaDecs], [MetaKey]) VALUES (N'DM13', N'Dịch vụ đi kèm', N'', N'', NULL, NULL, NULL, N'Dịch vụ đi kèm', N'cate1.jpg', N'', N'')
GO
SET IDENTITY_INSERT [dbo].[DonHang] ON 

INSERT [dbo].[DonHang] ([MaDon], [NgayDatDon], [Ngayship], [Deleted], [TraHang], [Ngaytra], [MaKH], [MaShipper], [MaThanhToan], [Thue], [ShortDesc], [Ghichu], [MaTrangThai], [TongTien]) VALUES (1, CAST(N'2022-11-12' AS Date), NULL, NULL, NULL, NULL, N'KH01', NULL, NULL, NULL, NULL, NULL, NULL, 100000.0000)
INSERT [dbo].[DonHang] ([MaDon], [NgayDatDon], [Ngayship], [Deleted], [TraHang], [Ngaytra], [MaKH], [MaShipper], [MaThanhToan], [Thue], [ShortDesc], [Ghichu], [MaTrangThai], [TongTien]) VALUES (8, CAST(N'2022-11-14' AS Date), NULL, NULL, NULL, NULL, N'KH08', NULL, NULL, NULL, NULL, NULL, NULL, 10000000.0000)
INSERT [dbo].[DonHang] ([MaDon], [NgayDatDon], [Ngayship], [Deleted], [TraHang], [Ngaytra], [MaKH], [MaShipper], [MaThanhToan], [Thue], [ShortDesc], [Ghichu], [MaTrangThai], [TongTien]) VALUES (9, CAST(N'2022-11-14' AS Date), NULL, NULL, NULL, NULL, N'KH08', NULL, NULL, NULL, NULL, NULL, NULL, 10000000.0000)
INSERT [dbo].[DonHang] ([MaDon], [NgayDatDon], [Ngayship], [Deleted], [TraHang], [Ngaytra], [MaKH], [MaShipper], [MaThanhToan], [Thue], [ShortDesc], [Ghichu], [MaTrangThai], [TongTien]) VALUES (10, CAST(N'2022-11-23' AS Date), NULL, NULL, NULL, NULL, N'KH04', NULL, NULL, NULL, NULL, NULL, NULL, 10000000.0000)
INSERT [dbo].[DonHang] ([MaDon], [NgayDatDon], [Ngayship], [Deleted], [TraHang], [Ngaytra], [MaKH], [MaShipper], [MaThanhToan], [Thue], [ShortDesc], [Ghichu], [MaTrangThai], [TongTien]) VALUES (11, CAST(N'2022-11-24' AS Date), NULL, NULL, NULL, NULL, N'KH01', NULL, NULL, NULL, NULL, N'', NULL, 34830000.0000)
SET IDENTITY_INSERT [dbo].[DonHang] OFF
GO
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [NgaySinh], [CCCD_CMT], [SĐT], [MaVT], [DiaChi], [CreateDate], [Password], [Salt], [LastLogin], [Active], [Tendangnhap], [MaQuyen]) VALUES (N'KH01', N'Hiếu Lợn', CAST(N'2003-09-16' AS Date), N'07551696743', N'0667711994', N'LO01', N'Ông Trùm Yên Bái', CAST(N'2016-01-03' AS Date), N'88888888', N'        ', CAST(N'2022-10-05' AS Date), NULL, N'abc', N'VA01')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [NgaySinh], [CCCD_CMT], [SĐT], [MaVT], [DiaChi], [CreateDate], [Password], [Salt], [LastLogin], [Active], [Tendangnhap], [MaQuyen]) VALUES (N'KH02', N'Nguyễn Thị Hằng', CAST(N'2006-01-19' AS Date), N'02794982267', N'0682603285', N'LO02', N'Phạm Văn Đồng, Cầu Giấy, Hà Nội', CAST(N'2016-04-28' AS Date), N'88888888', N'        ', CAST(N'2022-10-12' AS Date), NULL, N'hang', N'VA02')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [NgaySinh], [CCCD_CMT], [SĐT], [MaVT], [DiaChi], [CreateDate], [Password], [Salt], [LastLogin], [Active], [Tendangnhap], [MaQuyen]) VALUES (N'KH03', N'Hiếu Lợn 2', CAST(N'1995-02-24' AS Date), N'05175549943', N'0788913113', N'LO03', N'Đống Đa, Hà Nội', CAST(N'2019-02-17' AS Date), N'88888888', N'        ', CAST(N'2022-10-02' AS Date), NULL, N'quang', N'VA03')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [NgaySinh], [CCCD_CMT], [SĐT], [MaVT], [DiaChi], [CreateDate], [Password], [Salt], [LastLogin], [Active], [Tendangnhap], [MaQuyen]) VALUES (N'KH04', N'Lê Duy Dũng', CAST(N'1993-04-18' AS Date), N'06228775064', N'0785577078', N'LO04', N'49 Thái Hà ,Đống Đa , Hà Nội', CAST(N'2014-08-21' AS Date), N'88888888', N'        ', CAST(N'2022-10-11' AS Date), NULL, N'dung', N'VA03')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [NgaySinh], [CCCD_CMT], [SĐT], [MaVT], [DiaChi], [CreateDate], [Password], [Salt], [LastLogin], [Active], [Tendangnhap], [MaQuyen]) VALUES (N'KH05', N'Nguyễn Mạnh Hưng', CAST(N'2006-08-16' AS Date), N'08601014309', N'0171508036', N'LO05', N'131, Lê Thanh Nghị, Đồng Tâm, Hai Bà Trưng, Hà Nội', CAST(N'2021-03-14' AS Date), N'88888888', N'        ', CAST(N'2022-10-10' AS Date), NULL, N'hung', N'VA03')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [NgaySinh], [CCCD_CMT], [SĐT], [MaVT], [DiaChi], [CreateDate], [Password], [Salt], [LastLogin], [Active], [Tendangnhap], [MaQuyen]) VALUES (N'KH06', N'Phạm Minh Hiếu', CAST(N'2002-11-18' AS Date), N'08174317944', N'0377010530', N'LO01', N'399 Phạm Văn Đồng, Hà Nội', CAST(N'2012-05-21' AS Date), N'88888888', N'        ', CAST(N'2022-10-13' AS Date), NULL, N'phuong', N'VA03')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [NgaySinh], [CCCD_CMT], [SĐT], [MaVT], [DiaChi], [CreateDate], [Password], [Salt], [LastLogin], [Active], [Tendangnhap], [MaQuyen]) VALUES (N'KH07', N'Trần Thị Vân Anh', CAST(N'1988-06-12' AS Date), N'03618819493', N'0159340620', N'LO02', N'22 Nguyễn Phong Sắc, Dịch Vọng Hậu, Cầu Giấy, Hà Nội', CAST(N'2015-06-29' AS Date), N'88888888', N'        ', CAST(N'2022-10-04' AS Date), NULL, N'van', N'VA03')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [NgaySinh], [CCCD_CMT], [SĐT], [MaVT], [DiaChi], [CreateDate], [Password], [Salt], [LastLogin], [Active], [Tendangnhap], [MaQuyen]) VALUES (N'KH08', N'Đỗ Ngọc Long', CAST(N'2006-09-16' AS Date), N'05192568771', N'0904041267', N'LO03', N'72 Đ. Trường Chinh, Phương Đình, Đống Đa, Hà Nội', CAST(N'2019-08-14' AS Date), N'88888888', N'        ', CAST(N'2022-10-10' AS Date), NULL, N'ngoclong', N'VA03')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [NgaySinh], [CCCD_CMT], [SĐT], [MaVT], [DiaChi], [CreateDate], [Password], [Salt], [LastLogin], [Active], [Tendangnhap], [MaQuyen]) VALUES (N'KH09', N'Lê Anh Thắng', CAST(N'1981-03-11' AS Date), N'09483814329', N'0446538120', N'LO04', N'19 Đ. Nguyễn Chí Thanh, Ngọc Khánh, Ba Đình, Hà Nội', CAST(N'2012-03-04' AS Date), N'88888888', N'        ', CAST(N'2022-10-15' AS Date), NULL, N'thang', N'VA03')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [NgaySinh], [CCCD_CMT], [SĐT], [MaVT], [DiaChi], [CreateDate], [Password], [Salt], [LastLogin], [Active], [Tendangnhap], [MaQuyen]) VALUES (N'KH10', N'Bùi Văn Dương', CAST(N'2008-05-08' AS Date), N'03227751547', N'0707157841', N'LO05', N'Số 12 Ng. 331 Đ. Trần Khát Chân, Thanh Nhàn, Hai Bà Trưng, Hà Nội', CAST(N'2019-12-11' AS Date), N'88888888', N'        ', CAST(N'2022-10-09' AS Date), NULL, N'duong', N'VA03')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [NgaySinh], [CCCD_CMT], [SĐT], [MaVT], [DiaChi], [CreateDate], [Password], [Salt], [LastLogin], [Active], [Tendangnhap], [MaQuyen]) VALUES (N'KH11', N'Nguyễn Anh Dũng', CAST(N'2009-04-07' AS Date), N'09884360456', N'0767509250', N'LO01', N'Quan Hoa, Cầu Giấy, Hà Nội', CAST(N'2019-02-17' AS Date), N'88888888', N'        ', CAST(N'2022-10-15' AS Date), NULL, N'truong', N'VA03')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [NgaySinh], [CCCD_CMT], [SĐT], [MaVT], [DiaChi], [CreateDate], [Password], [Salt], [LastLogin], [Active], [Tendangnhap], [MaQuyen]) VALUES (N'KH12', N'Nguyễn Thị Kim Khánh', CAST(N'1985-03-25' AS Date), N'06790711432', N'0573692490', N'LO02', N'Phạm Văn Đồng, Cầu Giấy, Hà Nội', CAST(N'2010-12-07' AS Date), N'88888888', N'        ', CAST(N'2022-10-03' AS Date), NULL, N'an', N'VA03')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [NgaySinh], [CCCD_CMT], [SĐT], [MaVT], [DiaChi], [CreateDate], [Password], [Salt], [LastLogin], [Active], [Tendangnhap], [MaQuyen]) VALUES (N'KH13', N'Trần Thị Quỳnh Nga', CAST(N'1992-08-08' AS Date), N'06808748092', N'0757884477', N'LO03', N'Đống Đa, Hà Nội', CAST(N'2015-11-13' AS Date), N'88888888', N'        ', CAST(N'2022-10-02' AS Date), NULL, N'anh', N'VA03')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [NgaySinh], [CCCD_CMT], [SĐT], [MaVT], [DiaChi], [CreateDate], [Password], [Salt], [LastLogin], [Active], [Tendangnhap], [MaQuyen]) VALUES (N'KH14', N'Lê Thị Linh', CAST(N'1982-04-11' AS Date), N'02907646882', N'0866743338', N'LO04', N'50 Thái Hà ,Đống Đa , Hà Nội', CAST(N'2017-10-16' AS Date), N'88888888', N'        ', CAST(N'2022-10-01' AS Date), NULL, N'may', N'VA03')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [NgaySinh], [CCCD_CMT], [SĐT], [MaVT], [DiaChi], [CreateDate], [Password], [Salt], [LastLogin], [Active], [Tendangnhap], [MaQuyen]) VALUES (N'KH15', N'Phạm Trọng Linh', CAST(N'1994-12-12' AS Date), N'06796437204', N'0437315028', N'LO05', N'132, Lê Thanh Nghị, Đồng Tâm, Hai Bà Trưng, Hà Nội', CAST(N'2013-11-18' AS Date), N'88888888', N'        ', CAST(N'2022-10-11' AS Date), NULL, N'lua', N'VA03')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [NgaySinh], [CCCD_CMT], [SĐT], [MaVT], [DiaChi], [CreateDate], [Password], [Salt], [LastLogin], [Active], [Tendangnhap], [MaQuyen]) VALUES (N'KH16', N'Nguyễn Khánh Tùng', CAST(N'1995-01-06' AS Date), N'07995556253', N'0331570878', N'LO01', N'400 Phạm Văn Đồng, Hà Nội', CAST(N'2010-02-05' AS Date), N'88888888', N'        ', CAST(N'2022-10-02' AS Date), NULL, N'chinhquy', N'VA03')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [NgaySinh], [CCCD_CMT], [SĐT], [MaVT], [DiaChi], [CreateDate], [Password], [Salt], [LastLogin], [Active], [Tendangnhap], [MaQuyen]) VALUES (N'KH17', N'Nguyễn Thị Thuý Quỳnh', CAST(N'1996-09-17' AS Date), N'01994008897', N'0904162753', N'LO02', N'23 Nguyễn Phong Sắc, Dịch Vọng Hậu, Cầu Giấy, Hà Nội', CAST(N'2021-12-07' AS Date), N'88888888', N'        ', CAST(N'2022-10-03' AS Date), NULL, N'tinhnhuye', N'VA03')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [NgaySinh], [CCCD_CMT], [SĐT], [MaVT], [DiaChi], [CreateDate], [Password], [Salt], [LastLogin], [Active], [Tendangnhap], [MaQuyen]) VALUES (N'KH18', N'Lê Thế Nhật', CAST(N'1998-06-08' AS Date), N'03394562865', N'0772625134', N'LO03', N'73 Đ. Trường Chinh, Phương Đình, Đống Đa, Hà Nội', CAST(N'2019-08-25' AS Date), N'88888888', N'        ', CAST(N'2022-10-12' AS Date), NULL, N'hiendai', N'VA03')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [NgaySinh], [CCCD_CMT], [SĐT], [MaVT], [DiaChi], [CreateDate], [Password], [Salt], [LastLogin], [Active], [Tendangnhap], [MaQuyen]) VALUES (N'KH19', N'Nguyễn Minh Hiếu', CAST(N'1994-08-25' AS Date), N'01717216112', N'0207117940', N'LO04', N'20 Đ. Nguyễn Chí Thanh, Ngọc Khánh, Ba Đình, Hà Nội', CAST(N'2012-01-12' AS Date), N'88888888', N'        ', CAST(N'2022-10-02' AS Date), NULL, N'bgat', N'VA03')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [NgaySinh], [CCCD_CMT], [SĐT], [MaVT], [DiaChi], [CreateDate], [Password], [Salt], [LastLogin], [Active], [Tendangnhap], [MaQuyen]) VALUES (N'KH20', N'Nguyễn Minh Hiếu', CAST(N'1991-01-29' AS Date), N'08553410071', N'0549050979', N'LO05', N'Số 12 Ng. 332 Đ. Trần Khát Chân, Thanh Nhàn, Hai Bà Trưng, Hà Nội', CAST(N'2014-01-12' AS Date), N'88888888', N'        ', CAST(N'2022-10-01' AS Date), NULL, N'nhat', N'VA03')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [NgaySinh], [CCCD_CMT], [SĐT], [MaVT], [DiaChi], [CreateDate], [Password], [Salt], [LastLogin], [Active], [Tendangnhap], [MaQuyen]) VALUES (N'KH22', N'Nguyễn Mạnh Cường', CAST(N'1984-09-12' AS Date), N'01849936946', N'0252357520', N'LO02', N'Phạm Văn Đồng, Cầu Giấy, Hà Nội', CAST(N'2019-03-04' AS Date), N'88888888', N'        ', CAST(N'2022-10-13' AS Date), NULL, N'hieuduong', N'VA03')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [NgaySinh], [CCCD_CMT], [SĐT], [MaVT], [DiaChi], [CreateDate], [Password], [Salt], [LastLogin], [Active], [Tendangnhap], [MaQuyen]) VALUES (N'KH23      ', N'Phùng Đức DŨng', CAST(N'2001-01-02' AS Date), N'1234455', N'12345566', NULL, N'Hà Nội', NULL, N'123456', NULL, NULL, NULL, N'dunghotboy', N'VA03')
GO
INSERT [dbo].[PictureProduct] ([MaA], [Anh1], [Anh2], [Anh3], [Anh4], [Anh5], [MaSP]) VALUES (N'MaA001    ', N'SP01-1.jpg', N'SP01-2.jpg', N'SP01-3.jpg', N'SP01-4.jpg', N'SP01-5.jpg', N'SP000001')
INSERT [dbo].[PictureProduct] ([MaA], [Anh1], [Anh2], [Anh3], [Anh4], [Anh5], [MaSP]) VALUES (N'MaA002    ', N'SP02-1.jpg', N'SP02-2.jpg', N'SP02-3.jpg', N'SP02-4.jpg', N'SP02-5.jpg', N'SP000002')
INSERT [dbo].[PictureProduct] ([MaA], [Anh1], [Anh2], [Anh3], [Anh4], [Anh5], [MaSP]) VALUES (N'MaA003    ', N'SP03-1.jpg', N'SP03-2.jpg', N'SP03-3.jpg', N'SP03-4.jpg', N'SP03-5.jpg', N'SP000003')
INSERT [dbo].[PictureProduct] ([MaA], [Anh1], [Anh2], [Anh3], [Anh4], [Anh5], [MaSP]) VALUES (N'MaA004    ', N'SP04-1.jpg', N'SP04-2.jpg', N'SP04-3.jpg', N'SP04-4.jpg', N'SP04-5.jpg', N'SP000004')
INSERT [dbo].[PictureProduct] ([MaA], [Anh1], [Anh2], [Anh3], [Anh4], [Anh5], [MaSP]) VALUES (N'MaA005    ', N'SP05-1.jpg', N'SP05-2.jpg', N'SP05-3.jpg', N'SP05-4.jpg', N'SP05-5.jpg', N'SP000005')
INSERT [dbo].[PictureProduct] ([MaA], [Anh1], [Anh2], [Anh3], [Anh4], [Anh5], [MaSP]) VALUES (N'MaA006    ', N'SP06-1.jpg', N'SP06-2.jpg', N'SP06-3.jpg', N'SP06-4.jpg', N'SP06-5.jpg', N'SP000006')
INSERT [dbo].[PictureProduct] ([MaA], [Anh1], [Anh2], [Anh3], [Anh4], [Anh5], [MaSP]) VALUES (N'MaA007    ', N'SP07-1.jpg', N'SP07-2.jpg', N'SP07-3.jpg', N'SP07-4.jpg', N'SP07-5.jpg', N'SP000007')
INSERT [dbo].[PictureProduct] ([MaA], [Anh1], [Anh2], [Anh3], [Anh4], [Anh5], [MaSP]) VALUES (N'MaA008    ', N'SP08-1.jpg', N'SP08-2.jpg', N'SP08-3.jpg', N'SP08-4.jpg', N'SP08-5.jpg', N'SP000008')
INSERT [dbo].[PictureProduct] ([MaA], [Anh1], [Anh2], [Anh3], [Anh4], [Anh5], [MaSP]) VALUES (N'MaA009    ', N'SP09-1.jpg', N'SP09-2.jpg', N'SP09-3.jpg', N'SP09-4.jpg', N'SP09-5.jpg', N'SP000009')
INSERT [dbo].[PictureProduct] ([MaA], [Anh1], [Anh2], [Anh3], [Anh4], [Anh5], [MaSP]) VALUES (N'MaA010    ', N'SP10-1.jpg', N'SP10-2.jpg', N'SP10-3.jpg', N'SP10-4.jpg', N'SP10-5.jpg', N'SP000010')
INSERT [dbo].[PictureProduct] ([MaA], [Anh1], [Anh2], [Anh3], [Anh4], [Anh5], [MaSP]) VALUES (N'MaA011    ', N'SP11-1.jpg', N'SP11-2.jpg', N'SP11-3.jpg', N'SP11-4.jpg', N'SP11-5.jpg', N'SP000011')
INSERT [dbo].[PictureProduct] ([MaA], [Anh1], [Anh2], [Anh3], [Anh4], [Anh5], [MaSP]) VALUES (N'MaA012    ', N'SP12-1.jpg', N'SP12-2.jpg', N'SP12-3.jpg', N'SP12-4.jpg', N'SP12-5.jpg', N'SP000012')
INSERT [dbo].[PictureProduct] ([MaA], [Anh1], [Anh2], [Anh3], [Anh4], [Anh5], [MaSP]) VALUES (N'MaA013    ', N'SP13-1.jpg', N'SP13-2.jpg', N'SP13-3.jpg', N'SP13-4.jpg', N'SP13-5.jpg', N'SP000013')
INSERT [dbo].[PictureProduct] ([MaA], [Anh1], [Anh2], [Anh3], [Anh4], [Anh5], [MaSP]) VALUES (N'MaA014    ', N'SP14-1.jpg', N'SP14-2.jpg', N'SP14-3.jpg', N'SP14-4.jpg', N'SP14-5.jpg', N'SP000014')
INSERT [dbo].[PictureProduct] ([MaA], [Anh1], [Anh2], [Anh3], [Anh4], [Anh5], [MaSP]) VALUES (N'MaA015    ', N'SP15-1.jpg', N'SP15-2.jpg', N'SP15-3.jpg', N'SP15-4.jpg', N'SP15-5.jpg', N'SP000015')
INSERT [dbo].[PictureProduct] ([MaA], [Anh1], [Anh2], [Anh3], [Anh4], [Anh5], [MaSP]) VALUES (N'MaA016    ', N'SP16-1.jpg', N'SP16-2.jpg', N'SP16-3.jpg', N'SP16-4.jpg', N'SP16-5.jpg', N'SP000016')
INSERT [dbo].[PictureProduct] ([MaA], [Anh1], [Anh2], [Anh3], [Anh4], [Anh5], [MaSP]) VALUES (N'MaA017    ', N'SP17-1.jpg', N'SP17-2.jpg', N'SP17-3.jpg', N'SP17-4.jpg', N'SP17-5.jpg', N'SP000017')
INSERT [dbo].[PictureProduct] ([MaA], [Anh1], [Anh2], [Anh3], [Anh4], [Anh5], [MaSP]) VALUES (N'MaA018    ', N'SP18-1.jpg', N'SP18-2.jpg', N'SP18-3.jpg', N'SP18-4.jpg', N'SP18-5.jpg', N'SP000018')
INSERT [dbo].[PictureProduct] ([MaA], [Anh1], [Anh2], [Anh3], [Anh4], [Anh5], [MaSP]) VALUES (N'MaA019    ', N'SP19-1.jpg', N'SP19-2.jpg', N'SP19-3.jpg', N'SP19-4.jpg', N'SP19-5.jpg', N'SP000019')
INSERT [dbo].[PictureProduct] ([MaA], [Anh1], [Anh2], [Anh3], [Anh4], [Anh5], [MaSP]) VALUES (N'MaA020    ', N'SP20-1.jpg', N'SP20-2.jpg', N'SP20-3.jpg', N'SP20-4.jpg', N'SP20-5.jpg', N'SP000020')
INSERT [dbo].[PictureProduct] ([MaA], [Anh1], [Anh2], [Anh3], [Anh4], [Anh5], [MaSP]) VALUES (N'MaA021    ', N'SP21-1.jpg', N'SP21-2.jpg', N'SP21-3.jpg', N'SP21-4.jpg', N'SP21-5.jpg', N'SP000021')
INSERT [dbo].[PictureProduct] ([MaA], [Anh1], [Anh2], [Anh3], [Anh4], [Anh5], [MaSP]) VALUES (N'MaA022    ', N'SP22-1.jpg', N'SP22-2.jpg', N'SP22-3.jpg', N'SP22-4.jpg', N'SP22-5.jpg', N'SP000022')
INSERT [dbo].[PictureProduct] ([MaA], [Anh1], [Anh2], [Anh3], [Anh4], [Anh5], [MaSP]) VALUES (N'MaA023    ', N'SP23-1.jpg', N'SP23-2.jpg', N'SP23-3.jpg', N'SP23-4.jpg', N'SP23-5.jpg', N'SP000023')
INSERT [dbo].[PictureProduct] ([MaA], [Anh1], [Anh2], [Anh3], [Anh4], [Anh5], [MaSP]) VALUES (N'MaA024    ', N'SP24-1.jpg', N'SP24-2.jpg', N'SP24-3.jpg', N'SP24-4.jpg', N'SP24-5.jpg', N'SP000024')
INSERT [dbo].[PictureProduct] ([MaA], [Anh1], [Anh2], [Anh3], [Anh4], [Anh5], [MaSP]) VALUES (N'MaA025    ', N'SP25-1.jpg', N'SP25-2.jpg', N'SP25-3.jpg', N'SP25-4.jpg', N'SP25-5.jpg', N'SP000025')
INSERT [dbo].[PictureProduct] ([MaA], [Anh1], [Anh2], [Anh3], [Anh4], [Anh5], [MaSP]) VALUES (N'MaA026    ', N'SP26-1.jpg', N'SP26-2.jpg', N'SP26-3.jpg', N'SP26-4.jpg', N'SP26-5.jpg', N'SP000026')
INSERT [dbo].[PictureProduct] ([MaA], [Anh1], [Anh2], [Anh3], [Anh4], [Anh5], [MaSP]) VALUES (N'MaA027    ', N'SP27-1.jpg', N'SP27-2.jpg', N'SP27-3.jpg', N'SP27-4.jpg', N'SP27-5.jpg', N'SP000027')
INSERT [dbo].[PictureProduct] ([MaA], [Anh1], [Anh2], [Anh3], [Anh4], [Anh5], [MaSP]) VALUES (N'MaA028    ', N'SP28-1.jpg', N'SP28-2.jpg', N'SP28-3.jpg', N'SP28-4.jpg', N'SP28-5.jpg', N'SP000028')
INSERT [dbo].[PictureProduct] ([MaA], [Anh1], [Anh2], [Anh3], [Anh4], [Anh5], [MaSP]) VALUES (N'MaA029    ', N'SP29-1.jpg', N'SP29-2.jpg', N'SP29-3.jpg', N'SP29-4.jpg', N'SP29-5.jpg', N'SP000029')
INSERT [dbo].[PictureProduct] ([MaA], [Anh1], [Anh2], [Anh3], [Anh4], [Anh5], [MaSP]) VALUES (N'MaA030    ', N'SP30-1.jpg', N'SP30-2.jpg', N'SP30-3.jpg', N'SP30-4.jpg', N'SP30-5.jpg', N'SP000030')
GO
INSERT [dbo].[QuyenTC] ([MaQuyen], [MaKH], [MieuTa]) VALUES (N'VA01', N'KH01', 1)
INSERT [dbo].[QuyenTC] ([MaQuyen], [MaKH], [MieuTa]) VALUES (N'VA02', N'KH02', 2)
INSERT [dbo].[QuyenTC] ([MaQuyen], [MaKH], [MieuTa]) VALUES (N'VA03', N'KH03', 3)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [Trangthai], [Diachi], [MaDL], [MaDM], [Thumb], [Video], [DateCreated], [DateModified], [BestSellers], [Homeflag], [Active], [Tags], [Tieude], [Alias], [MetaDesc], [MetaKey], [SoLo], [Gia]) VALUES (N'SP000001', N'Smart Tivi Samsung 4K Crystal UHD 50 inch ', N' Là một sản phẩm hết sức nổi bật của cửa hàng chúng tôi. Với công nghệ tối tân cùng hàng loạt những cải tiến từ mẫu mã cho đến kích thước, sẽ mang đến cho bạn nhưng phút giây thư giãn vô cùng tuyệt vời bên gia đình và người thân', N'Còn hàng', N'Phạm Văn Đồng, Cầu Giấy, Hà Nội', N'DL03', N'DM01', N'', N'', NULL, NULL, NULL, NULL, NULL, N'', N'Smart TV', N'', N'', N'', NULL, 17400000.0000)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [Trangthai], [Diachi], [MaDL], [MaDM], [Thumb], [Video], [DateCreated], [DateModified], [BestSellers], [Homeflag], [Active], [Tags], [Tieude], [Alias], [MetaDesc], [MetaKey], [SoLo], [Gia]) VALUES (N'SP000002', N'Smart Tivi QLED 4K 55 inch Samsung QA55Q65A', N'Sản phẩm rất tuyệt vời mọi người ạ. Tại sao không sắm cho mình một chiếc về sử dụng', N'Còn hàng', N'Phạm Văn Đồng, Cầu Giấy, Hà Nội', N'DL02', N'DM01', N'', N'', NULL, NULL, NULL, NULL, NULL, N'', N'Smart TV', N'', N'', N'', NULL, 22000000.0000)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [Trangthai], [Diachi], [MaDL], [MaDM], [Thumb], [Video], [DateCreated], [DateModified], [BestSellers], [Homeflag], [Active], [Tags], [Tieude], [Alias], [MetaDesc], [MetaKey], [SoLo], [Gia]) VALUES (N'SP000003', N'Smart Tivi LG 4K 55 inch 55UP7550PTC', N'Nắng dần tắt trên con đường nhỏ
Dáng mẹ gầy giẹo giọ liêu xiêu
Mẹ về để nấu cơm chiều
Bữa cơm đạm bạc thương yêu ấm lòng', N'Còn hàng', N'22 Nguyễn Phong Sắc, Dịch Vọng Hậu, Cầu Giấy, Hà Nội', N'DL04', N'DM01', N'', N'', NULL, NULL, NULL, NULL, NULL, N'', N'Smart TV', N'', N'', N'', NULL, 20000000.0000)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [Trangthai], [Diachi], [MaDL], [MaDM], [Thumb], [Video], [DateCreated], [DateModified], [BestSellers], [Homeflag], [Active], [Tags], [Tieude], [Alias], [MetaDesc], [MetaKey], [SoLo], [Gia]) VALUES (N'SP000004', N'Google Tivi Sony 4K 43 inch KD-43X81DK', N'Cả đời mẹ long đong vất vả
Cho chồng con quên cả thân mình
Một đời mẹ đã hy sinh
Tuổi xuân phai nhạt nghĩa tình đượm sâu', N'Còn hàng', N'23 Nguyễn Phong Sắc, Dịch Vọng Hậu, Cầu Giấy, Hà Nội', N'DL06', N'DM01', N'', N'', NULL, NULL, NULL, NULL, NULL, N'', N'Smart TV', N'', N'', N'', NULL, 15400000.0000)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [Trangthai], [Diachi], [MaDL], [MaDM], [Thumb], [Video], [DateCreated], [DateModified], [BestSellers], [Homeflag], [Active], [Tags], [Tieude], [Alias], [MetaDesc], [MetaKey], [SoLo], [Gia]) VALUES (N'SP000005', N'Google Tivi Sony 4K 43 inch KD-43X75K', N'Mưa và nắng nhuộm màu tóc trắng
Bụi gian nan đọng lắng nếp nhăn
Rụng rồi thương lắm hàm răng
Lưng còng chân yếu ánh trăng cuối trời', N'Còn hàng', N'24 Nguyễn Phong Sắc, Dịch Vọng Hậu, Cầu Giấy, Hà Nội', N'DL08', N'DM01', N'', N'', NULL, NULL, NULL, NULL, NULL, N'', N'Smart TV', N'', N'', N'', NULL, 13400000.0000)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [Trangthai], [Diachi], [MaDL], [MaDM], [Thumb], [Video], [DateCreated], [DateModified], [BestSellers], [Homeflag], [Active], [Tags], [Tieude], [Alias], [MetaDesc], [MetaKey], [SoLo], [Gia]) VALUES (N'SP000006', N'Smart Tivi Samsung 32 inch UA32T4500', N'Tình của mẹ sáng ngời dương thế
Lo cho con tấm bé đến già
Nghĩa tình son sắt cùng cha
Giản đơn dung dị mẹ là mẹ thôi', N'Còn hàng', N'72 Đ. Trường Chinh, Phương Đình, Đống Đa, Hà Nội', N'DL05', N'DM01', N'', N'', NULL, NULL, NULL, NULL, NULL, N'', N'Smart TV', N'', N'', N'', NULL, 7400000.0000)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [Trangthai], [Diachi], [MaDL], [MaDM], [Thumb], [Video], [DateCreated], [DateModified], [BestSellers], [Homeflag], [Active], [Tags], [Tieude], [Alias], [MetaDesc], [MetaKey], [SoLo], [Gia]) VALUES (N'SP000007', N'Android Tivi Casper 4K 55 inch 55UG6100', N'Con đi khắp chân trời góc bể
Ân tình nào sánh xuể mẹ yêu
Nghĩa dày độ lượng bao nhiêu
Có trong lòng mẹ sớm chiều bao dung.', N'Còn hàng', N'73 Đ. Trường Chinh, Phương Đình, Đống Đa, Hà Nội', N'DL01', N'DM01', N'', N'', NULL, NULL, NULL, NULL, NULL, N'', N'Smart TV', N'', N'', N'', NULL, 13990000.0000)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [Trangthai], [Diachi], [MaDL], [MaDM], [Thumb], [Video], [DateCreated], [DateModified], [BestSellers], [Homeflag], [Active], [Tags], [Tieude], [Alias], [MetaDesc], [MetaKey], [SoLo], [Gia]) VALUES (N'SP000008', N'Smart Tivi QLED 4K 55 inch Samsung QA55Q60B', N'Smart Tivi QLED 4K 55 inch Samsung QA55Q60B', N'Còn hàng', N'Quan Hoa, Cầu Giấy, Hà Nội', N'DL04', N'DM01', N'', N'', NULL, NULL, NULL, NULL, NULL, N'', N'Smart TV', N'', N'', N'', NULL, 18400000.0000)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [Trangthai], [Diachi], [MaDL], [MaDM], [Thumb], [Video], [DateCreated], [DateModified], [BestSellers], [Homeflag], [Active], [Tags], [Tieude], [Alias], [MetaDesc], [MetaKey], [SoLo], [Gia]) VALUES (N'SP000009', N'Smart Tivi LG 4K 65 inch 65UQ8000PSC', N'Smart Tivi LG 4K 65 inch 65UQ8000PSC', N'Còn hàng', N'Phạm Văn Đồng, Cầu Giấy, Hà Nội', N'DL08', N'DM01', N'', N'', NULL, NULL, NULL, NULL, NULL, N'', N'Smart TV', N'', N'', N'', NULL, 25400000.0000)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [Trangthai], [Diachi], [MaDL], [MaDM], [Thumb], [Video], [DateCreated], [DateModified], [BestSellers], [Homeflag], [Active], [Tags], [Tieude], [Alias], [MetaDesc], [MetaKey], [SoLo], [Gia]) VALUES (N'SP000010', N'Loa kéo Karaoke Dalton TS-15G600X 600W', N'Loa kéo Karaoke Dalton TS-15G600X 600W', N'Còn hàng', N'Đống Đa, Hà Nội', N'DL01', N'DM01', N'', N'', NULL, NULL, NULL, NULL, NULL, N'', N'Loa, Dàn Karaoke', N'', N'', N'', NULL, 9500000.0000)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [Trangthai], [Diachi], [MaDL], [MaDM], [Thumb], [Video], [DateCreated], [DateModified], [BestSellers], [Homeflag], [Active], [Tags], [Tieude], [Alias], [MetaDesc], [MetaKey], [SoLo], [Gia]) VALUES (N'SP000011', N'Loa tháp Samsung MX-T70/XV', N'Loa tháp Samsung MX-T70/XV', N'Còn hàng', N'49 Thái Hà ,Đống Đa , Hà Nội', N'DL08', N'DM01', N'', N'', NULL, NULL, NULL, NULL, NULL, N'', N'Loa, Dàn Karaoke', N'', N'', N'', NULL, 10990000.0000)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [Trangthai], [Diachi], [MaDL], [MaDM], [Thumb], [Video], [DateCreated], [DateModified], [BestSellers], [Homeflag], [Active], [Tags], [Tieude], [Alias], [MetaDesc], [MetaKey], [SoLo], [Gia]) VALUES (N'SP000012', N'Loa Bluetooth Mozard BT100 Đen', N'Loa Bluetooth Mozard BT100 Đen', N'Còn hàng', N'131, Lê Thanh Nghị, Đồng Tâm, Hai Bà Trưng, Hà Nội', N'DL06', N'DM01', N'', N'', NULL, NULL, NULL, NULL, NULL, N'', N'Loa, Dàn Karaoke', N'', N'', N'', NULL, 1009000.0000)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [Trangthai], [Diachi], [MaDL], [MaDM], [Thumb], [Video], [DateCreated], [DateModified], [BestSellers], [Homeflag], [Active], [Tags], [Tieude], [Alias], [MetaDesc], [MetaKey], [SoLo], [Gia]) VALUES (N'SP000013', N'Loa thanh Samsung HW-T420', N'Loa thanh Samsung HW-T420', N'Còn hàng', N'399 Phạm Văn Đồng, Hà Nội', N'DL03', N'DM01', N'', N'', NULL, NULL, NULL, NULL, NULL, N'', N'Loa, Dàn Karaoke', N'', N'', N'', NULL, 3090000.0000)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [Trangthai], [Diachi], [MaDL], [MaDM], [Thumb], [Video], [DateCreated], [DateModified], [BestSellers], [Homeflag], [Active], [Tags], [Tieude], [Alias], [MetaDesc], [MetaKey], [SoLo], [Gia]) VALUES (N'SP000014', N'Loa kéo Karaoke Mobell MK-6080', N'Loa kéo Karaoke Mobell MK-6080 500W', N'Còn hàng', N'22 Nguyễn Phong Sắc, Dịch Vọng Hậu, Cầu Giấy, Hà Nội', N'DL08', N'DM01', N'', N'', NULL, NULL, NULL, NULL, NULL, N'', N'Loa, Dàn Karaoke', N'', N'', N'', NULL, 6900000.0000)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [Trangthai], [Diachi], [MaDL], [MaDM], [Thumb], [Video], [DateCreated], [DateModified], [BestSellers], [Homeflag], [Active], [Tags], [Tieude], [Alias], [MetaDesc], [MetaKey], [SoLo], [Gia]) VALUES (N'SP000015', N'Loa kéo Karaoke Nanomax S-820', N'Loa kéo Karaoke Nanomax S-820', N'Còn hàng', N'72 Đ. Trường Chinh, Phương Đình, Đống Đa, Hà Nội', N'DL03', N'DM01', N'', N'', NULL, NULL, NULL, NULL, NULL, N'', N'Loa, Dàn Karaoke', N'', N'', N'', NULL, 8900000.0000)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [Trangthai], [Diachi], [MaDL], [MaDM], [Thumb], [Video], [DateCreated], [DateModified], [BestSellers], [Homeflag], [Active], [Tags], [Tieude], [Alias], [MetaDesc], [MetaKey], [SoLo], [Gia]) VALUES (N'SP000016', N'Tủ lạnh Samsung Inverter 236 lít RT22M4032BY/SV', N'Tủ lạnh Samsung Inverter 236 lít RT22M4032BY/SV', N'Còn hàng', N'19 Đ. Nguyễn Chí Thanh, Ngọc Khánh, Ba Đình, Hà Nội', N'DL06', N'DM02', N'', N'', NULL, NULL, NULL, NULL, NULL, N'', N'Tủ lạnh', N'', N'', N'', NULL, 9876200.0000)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [Trangthai], [Diachi], [MaDL], [MaDM], [Thumb], [Video], [DateCreated], [DateModified], [BestSellers], [Homeflag], [Active], [Tags], [Tieude], [Alias], [MetaDesc], [MetaKey], [SoLo], [Gia]) VALUES (N'SP000017', N'Tủ lạnh Toshiba Inverter 180 lít GR-B22VU UKG', N'Tủ lạnh Toshiba Inverter 180 lít GR-B22VU UKG', N'Còn hàng', N'Số 12 Ng. 331 Đ. Trần Khát Chân, Thanh Nhàn, Hai Bà Trưng, Hà Nội', N'DL01', N'DM02', N'', N'', NULL, NULL, NULL, NULL, NULL, N'', N'Tủ lạnh', N'', N'', N'', NULL, 5680000.0000)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [Trangthai], [Diachi], [MaDL], [MaDM], [Thumb], [Video], [DateCreated], [DateModified], [BestSellers], [Homeflag], [Active], [Tags], [Tieude], [Alias], [MetaDesc], [MetaKey], [SoLo], [Gia]) VALUES (N'SP000018', N'Tủ lạnh Samsung Inverter 319 lít RT32K5932BY/SV', N'Tủ lạnh Samsung Inverter 319 lít RT32K5932BY/SV', N'Còn hàng', N'Quan Hoa, Cầu Giấy, Hà Nội', N'DL04', N'DM02', N'', N'', NULL, NULL, NULL, NULL, NULL, N'', N'Tủ lạnh', N'', N'', N'', NULL, 15090000.0000)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [Trangthai], [Diachi], [MaDL], [MaDM], [Thumb], [Video], [DateCreated], [DateModified], [BestSellers], [Homeflag], [Active], [Tags], [Tieude], [Alias], [MetaDesc], [MetaKey], [SoLo], [Gia]) VALUES (N'SP000019', N'Tủ lạnh LG Inverter 266 Lít GV-B262WB', N'Tủ lạnh LG Inverter 266 Lít GV-B262WB', N'Còn hàng', N'Phạm Văn Đồng, Cầu Giấy, Hà Nội', N'DL06', N'DM02', N'', N'', NULL, NULL, NULL, NULL, NULL, N'', N'Tủ lạnh', N'', N'', N'', NULL, 1090000.0000)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [Trangthai], [Diachi], [MaDL], [MaDM], [Thumb], [Video], [DateCreated], [DateModified], [BestSellers], [Homeflag], [Active], [Tags], [Tieude], [Alias], [MetaDesc], [MetaKey], [SoLo], [Gia]) VALUES (N'SP000020', N'Tủ lạnh Samsung Inverter 655 lít RS62R5001B4/SV', N'Tủ lạnh Samsung Inverter 655 lít RS62R5001B4/SV', N'Còn hàng', N'Đống Đa, Hà Nội', N'DL09', N'DM02', N'', N'', NULL, NULL, NULL, NULL, NULL, N'', N'Tủ lạnh', N'', N'', N'', NULL, 25000000.0000)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [Trangthai], [Diachi], [MaDL], [MaDM], [Thumb], [Video], [DateCreated], [DateModified], [BestSellers], [Homeflag], [Active], [Tags], [Tieude], [Alias], [MetaDesc], [MetaKey], [SoLo], [Gia]) VALUES (N'SP000021', N'Tủ đông Kangaroo 252 lít KG 400NC2', N'Tủ đông Kangaroo 252 lít KG 400NC2', N'Còn hàng', N'50 Thái Hà ,Đống Đa , Hà Nội', N'DL08', N'DM02', N'', N'', NULL, NULL, NULL, NULL, NULL, N'', N'Tủ đông, tủ mát', N'', N'', N'', NULL, 11990000.0000)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [Trangthai], [Diachi], [MaDL], [MaDM], [Thumb], [Video], [DateCreated], [DateModified], [BestSellers], [Homeflag], [Active], [Tags], [Tieude], [Alias], [MetaDesc], [MetaKey], [SoLo], [Gia]) VALUES (N'SP000022', N'Tủ đông Hòa Phát 107 lít HCF 106S1Đ', N'Tủ đông Hòa Phát 107 lít HCF 106S1Đ', N'Còn hàng', N'132, Lê Thanh Nghị, Đồng Tâm, Hai Bà Trưng, Hà Nội', N'DL01', N'DM02', N'', N'', NULL, NULL, NULL, NULL, NULL, N'', N'Tủ đông, tủ mát', N'', N'', N'', NULL, 5290000.0000)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [Trangthai], [Diachi], [MaDL], [MaDM], [Thumb], [Video], [DateCreated], [DateModified], [BestSellers], [Homeflag], [Active], [Tags], [Tieude], [Alias], [MetaDesc], [MetaKey], [SoLo], [Gia]) VALUES (N'SP000023', N'Tủ đông Hòa Phát 147 lít HUF 350SR1', N'Tủ đông Hòa Phát 147 lít HUF 350SR1', N'Còn hàng', N'400 Phạm Văn Đồng, Hà Nội', N'DL04', N'DM02', N'', N'', NULL, NULL, NULL, NULL, NULL, N'', N'Tủ đông, tủ mát', N'', N'', N'', NULL, 6490000.0000)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [Trangthai], [Diachi], [MaDL], [MaDM], [Thumb], [Video], [DateCreated], [DateModified], [BestSellers], [Homeflag], [Active], [Tags], [Tieude], [Alias], [MetaDesc], [MetaKey], [SoLo], [Gia]) VALUES (N'SP000024', N'Tủ đông Sanaky 260 lít VH-3699W1', N'Tủ đông Sanaky 260 lít VH-3699W1', N'Còn hàng', N'23 Nguyễn Phong Sắc, Dịch Vọng Hậu, Cầu Giấy, Hà Nội', N'DL09', N'DM02', N'', N'', NULL, NULL, NULL, NULL, NULL, N'', N'Tủ đông, tủ mát', N'', N'', N'', NULL, 9090000.0000)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [Trangthai], [Diachi], [MaDL], [MaDM], [Thumb], [Video], [DateCreated], [DateModified], [BestSellers], [Homeflag], [Active], [Tags], [Tieude], [Alias], [MetaDesc], [MetaKey], [SoLo], [Gia]) VALUES (N'SP000025', N'Tủ đông Sanaky 305 lít VH-4099A1', N'Tủ đông SANAKY 208 Lít TD.VH255HY2', N'Hàng sắp về', N'73 Đ. Trường Chinh, Phương Đình, Đống Đa, Hà Nội', N'DL03', N'DM02', N'', N'', NULL, NULL, NULL, NULL, NULL, N'', N'Tủ đông, tủ mát', N'', N'', N'', NULL, 950000.0000)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [Trangthai], [Diachi], [MaDL], [MaDM], [Thumb], [Video], [DateCreated], [DateModified], [BestSellers], [Homeflag], [Active], [Tags], [Tieude], [Alias], [MetaDesc], [MetaKey], [SoLo], [Gia]) VALUES (N'SP000026', N'Máy giặt Aqua Inverter 10.5 KG AQW-DR105FT BK', N'Máy giặt Aqua Inverter 10.5 KG AQW-DR105FT BK', N'Còn hàng', N'20 Đ. Nguyễn Chí Thanh, Ngọc Khánh, Ba Đình, Hà Nội', N'DL06', N'DM03', N'', N'', NULL, NULL, NULL, NULL, NULL, N'', N'Máy giặt', N'', N'', N'', NULL, 9100000.0000)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [Trangthai], [Diachi], [MaDL], [MaDM], [Thumb], [Video], [DateCreated], [DateModified], [BestSellers], [Homeflag], [Active], [Tags], [Tieude], [Alias], [MetaDesc], [MetaKey], [SoLo], [Gia]) VALUES (N'SP000027', N'Máy giặt Aqua Inverter 9 kg AQD- D902G BK', N'Máy giặt Aqua Inverter 9 kg AQD- D902G BK', N'Còn hàng', N'Số 12 Ng. 332 Đ. Trần Khát Chân, Thanh Nhàn, Hai Bà Trưng, Hà Nội', N'DL03', N'DM03', N'', N'', NULL, NULL, NULL, NULL, NULL, N'', N'Máy giặt', N'', N'', N'', NULL, 1200000.0000)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [Trangthai], [Diachi], [MaDL], [MaDM], [Thumb], [Video], [DateCreated], [DateModified], [BestSellers], [Homeflag], [Active], [Tags], [Tieude], [Alias], [MetaDesc], [MetaKey], [SoLo], [Gia]) VALUES (N'SP000028', N'Máy giặt Samsung Inverter 10 kg WW10TP44DSB/SV', N'Máy giặt Samsung Inverter 10 kg WW10TP44DSB/SV', N'Còn hàng', N'Quan Hoa, Cầu Giấy, Hà Nội', N'DL06', N'DM03', N'', N'', NULL, NULL, NULL, NULL, NULL, N'', N'Máy giặt', N'', N'', N'', NULL, 17000000.0000)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [Trangthai], [Diachi], [MaDL], [MaDM], [Thumb], [Video], [DateCreated], [DateModified], [BestSellers], [Homeflag], [Active], [Tags], [Tieude], [Alias], [MetaDesc], [MetaKey], [SoLo], [Gia]) VALUES (N'SP000029', N'Máy giặt Samsung Inverter 9 kg WW90T634DLN/SV', N'Máy giặt Samsung Inverter 9 kg WW90T634DLN/SV', N'Còn hàng', N'Phạm Văn Đồng, Cầu Giấy, Hà Nội', N'DL08', N'DM03', N'', N'', NULL, NULL, NULL, NULL, NULL, N'', N'Máy giặt', N'', N'', N'', NULL, 125000000.0000)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [Trangthai], [Diachi], [MaDL], [MaDM], [Thumb], [Video], [DateCreated], [DateModified], [BestSellers], [Homeflag], [Active], [Tags], [Tieude], [Alias], [MetaDesc], [MetaKey], [SoLo], [Gia]) VALUES (N'SP000030', N'Máy giặt Toshiba Inverter 8.5 Kg TW-BH95S2V WK', N'Máy giặt Toshiba Inverter 8.5 Kg TW-BH95S2V WK', N'Còn hàng', N'Đống Đa, Hà Nội', N'DL09', N'DM03', N'', N'', NULL, NULL, NULL, NULL, NULL, N'', N'Máy giặt', N'', N'', N'', NULL, 8000000.0000)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [Trangthai], [Diachi], [MaDL], [MaDM], [Thumb], [Video], [DateCreated], [DateModified], [BestSellers], [Homeflag], [Active], [Tags], [Tieude], [Alias], [MetaDesc], [MetaKey], [SoLo], [Gia]) VALUES (N'SP000031', N'Máy sấy thông hơi Galanz 7 Kg DV-70T5C(W)', N'Máy sấy thông hơi Galanz 7 Kg DV-70T5C(W)', N'Còn hàng', N'51 Thái Hà ,Đống Đa , Hà Nội', N'DL01', N'DM03', N'', N'', NULL, NULL, NULL, NULL, NULL, N'', N'Máy sấy', N'', N'', N'', NULL, 6500000.0000)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [Trangthai], [Diachi], [MaDL], [MaDM], [Thumb], [Video], [DateCreated], [DateModified], [BestSellers], [Homeflag], [Active], [Tags], [Tieude], [Alias], [MetaDesc], [MetaKey], [SoLo], [Gia]) VALUES (N'SP000032', N'Máy sấy thông hơi Electrolux 8.5 kg EDV854N3SB', N'Máy sấy thông hơi Electrolux 8.5 kg EDV854N3SB', N'Còn hàng', N'133, Lê Thanh Nghị, Đồng Tâm, Hai Bà Trưng, Hà Nội', N'DL08', N'DM03', N'', N'', NULL, NULL, NULL, NULL, NULL, N'', N'Máy sấy', N'', N'', N'', NULL, 11990000.0000)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [Trangthai], [Diachi], [MaDL], [MaDM], [Thumb], [Video], [DateCreated], [DateModified], [BestSellers], [Homeflag], [Active], [Tags], [Tieude], [Alias], [MetaDesc], [MetaKey], [SoLo], [Gia]) VALUES (N'SP000033', N'Máy sấy thông hơi Electrolux 7.5 kg EDV754H3WB', N'Máy sấy thông hơi Electrolux 7.5 kg EDV754H3WB', N'Còn hàng', N'401 Phạm Văn Đồng, Hà Nội', N'DL06', N'DM03', N'', N'', NULL, NULL, NULL, NULL, NULL, N'', N'Máy sấy', N'', N'', N'', NULL, 9990000.0000)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [Trangthai], [Diachi], [MaDL], [MaDM], [Thumb], [Video], [DateCreated], [DateModified], [BestSellers], [Homeflag], [Active], [Tags], [Tieude], [Alias], [MetaDesc], [MetaKey], [SoLo], [Gia]) VALUES (N'SP000034', N'Máy sấy thông hơi Electrolux 8.5 kg EDV854J3WB', N'Máy sấy thông hơi Electrolux 8.5 kg EDV854J3WB', N'Còn hàng', N'24 Nguyễn Phong Sắc, Dịch Vọng Hậu, Cầu Giấy, Hà Nội', N'DL04', N'DM03', N'', N'', NULL, NULL, NULL, NULL, NULL, N'', N'Máy sấy', N'', N'', N'', NULL, 11500000.0000)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [Trangthai], [Diachi], [MaDL], [MaDM], [Thumb], [Video], [DateCreated], [DateModified], [BestSellers], [Homeflag], [Active], [Tags], [Tieude], [Alias], [MetaDesc], [MetaKey], [SoLo], [Gia]) VALUES (N'SP000035', N'Máy sấy thông hơi Candy 9 Kg CS V9DF-S', N'Máy sấy thông hơi Candy 9 Kg CS V9DF-S', N'Còn hàng', N'74 Đ. Trường Chinh, Phương Đình, Đống Đa, Hà Nội', N'DL08', N'DM03', N'', N'', NULL, NULL, NULL, NULL, NULL, N'', N'Máy sấy', N'', N'', N'', NULL, 79990000.0000)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [Trangthai], [Diachi], [MaDL], [MaDM], [Thumb], [Video], [DateCreated], [DateModified], [BestSellers], [Homeflag], [Active], [Tags], [Tieude], [Alias], [MetaDesc], [MetaKey], [SoLo], [Gia]) VALUES (N'SP000036', N'Máy lạnh Daikin Inverter 1 HP FTKB25WMVMV', N'Máy lạnh Daikin Inverter 1 HP FTKB25WMVMV', N'Còn hàng', N'21 Đ. Nguyễn Chí Thanh, Ngọc Khánh, Ba Đình, Hà Nội', N'DL05', N'DM04', N'', N'', NULL, NULL, NULL, NULL, NULL, N'', N'Máy Lạnh', N'', N'', N'', NULL, 1099000.0000)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [Trangthai], [Diachi], [MaDL], [MaDM], [Thumb], [Video], [DateCreated], [DateModified], [BestSellers], [Homeflag], [Active], [Tags], [Tieude], [Alias], [MetaDesc], [MetaKey], [SoLo], [Gia]) VALUES (N'SP000037', N'Máy lạnh Panasonic Inverter 1 HP CU/CS-PU9XKH-8M', N'Máy lạnh Panasonic Inverter 1 HP CU/CS-PU9XKH-8M', N'Còn hàng', N'Số 12 Ng. 333 Đ. Trần Khát Chân, Thanh Nhàn, Hai Bà Trưng, Hà Nội', N'DL03', N'DM04', N'', N'', NULL, NULL, NULL, NULL, NULL, N'', N'Máy Lạnh', N'', N'', N'', NULL, 12300000.0000)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [Trangthai], [Diachi], [MaDL], [MaDM], [Thumb], [Video], [DateCreated], [DateModified], [BestSellers], [Homeflag], [Active], [Tags], [Tieude], [Alias], [MetaDesc], [MetaKey], [SoLo], [Gia]) VALUES (N'SP000038', N'Máy lạnh Panasonic Inverter 1 HP CU/CS-XU9XKH-8', N'Máy lạnh Panasonic Inverter 1 HP CU/CS-XU9XKH-8', N'Còn hàng', N'Quan Hoa, Cầu Giấy, Hà Nội', N'DL04', N'DM04', N'', N'', NULL, NULL, NULL, NULL, NULL, N'', N'Máy Lạnh', N'', N'', N'', NULL, 13500000.0000)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [Trangthai], [Diachi], [MaDL], [MaDM], [Thumb], [Video], [DateCreated], [DateModified], [BestSellers], [Homeflag], [Active], [Tags], [Tieude], [Alias], [MetaDesc], [MetaKey], [SoLo], [Gia]) VALUES (N'SP000039', N'Máy lạnh Daikin Inverter 1.5 HP FTKB35WMVMV', N'Máy lạnh Daikin Inverter 1.5 HP FTKB35WMVMV', N'Còn hàng', N'Phạm Văn Đồng, Cầu Giấy, Hà Nội', N'DL05', N'DM04', N'', N'', NULL, NULL, NULL, NULL, NULL, N'', N'Máy Lạnh', N'', N'', N'', NULL, 13500000.0000)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [Trangthai], [Diachi], [MaDL], [MaDM], [Thumb], [Video], [DateCreated], [DateModified], [BestSellers], [Homeflag], [Active], [Tags], [Tieude], [Alias], [MetaDesc], [MetaKey], [SoLo], [Gia]) VALUES (N'SP000040', N'Máy lạnh Casper Inverter 1 HP IC-09TL32', N'Máy lạnh Casper Inverter 1 HP IC-09TL32', N'Còn hàng', N'Đống Đa, Hà Nội', N'DL01', N'DM04', N'', N'', NULL, NULL, NULL, NULL, NULL, N'', N'Máy Lạnh', N'', N'', N'', NULL, 8990000.0000)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [Trangthai], [Diachi], [MaDL], [MaDM], [Thumb], [Video], [DateCreated], [DateModified], [BestSellers], [Homeflag], [Active], [Tags], [Tieude], [Alias], [MetaDesc], [MetaKey], [SoLo], [Gia]) VALUES (N'SP000041', N'Máy nước nóng trực tiếp Ariston 4500W AURES PREMIUM 4.5P PEARL', N'Máy nước nóng trực tiếp Ariston 4500W AURES PREMIUM 4.5P PEARL', N'Còn hàng', N'52 Thái Hà ,Đống Đa , Hà Nội', N'DL05', N'DM04', N'', N'', NULL, NULL, NULL, NULL, NULL, N'', N'Máy nước nóng', N'', N'', N'', NULL, 3450000.0000)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [Trangthai], [Diachi], [MaDL], [MaDM], [Thumb], [Video], [DateCreated], [DateModified], [BestSellers], [Homeflag], [Active], [Tags], [Tieude], [Alias], [MetaDesc], [MetaKey], [SoLo], [Gia]) VALUES (N'SP000042', N'Máy nước nóng trực tiếp Casper 4500W EP-45TH11', N'Máy nước nóng trực tiếp Casper 4500W EP-45TH11', N'Còn hàng', N'134, Lê Thanh Nghị, Đồng Tâm, Hai Bà Trưng, Hà Nội', N'DL05', N'DM04', N'', N'', NULL, NULL, NULL, NULL, NULL, N'', N'Máy nước nóng', N'', N'', N'', NULL, 3500000.0000)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [Trangthai], [Diachi], [MaDL], [MaDM], [Thumb], [Video], [DateCreated], [DateModified], [BestSellers], [Homeflag], [Active], [Tags], [Tieude], [Alias], [MetaDesc], [MetaKey], [SoLo], [Gia]) VALUES (N'SP000043', N'Máy nước nóng gián tiếp Ariston 20 lít 2500W VITALY 20 SLIM 2.5 FE', N'Máy nước nóng gián tiếp Ariston 20 lít 2500W VITALY 20 SLIM 2.5 FE', N'Còn hàng', N'402 Phạm Văn Đồng, Hà Nội', N'DL03', N'DM04', N'', N'', NULL, NULL, NULL, NULL, NULL, N'', N'Máy nước nóng', N'', N'', N'', NULL, 3500.0000)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [Trangthai], [Diachi], [MaDL], [MaDM], [Thumb], [Video], [DateCreated], [DateModified], [BestSellers], [Homeflag], [Active], [Tags], [Tieude], [Alias], [MetaDesc], [MetaKey], [SoLo], [Gia]) VALUES (N'SP000044', N'Máy nước nóng trực tiếp Beko 4500W BWI45S2D-213', N'Máy nước nóng trực tiếp Beko 4500W BWI45S2D-213', N'Còn hàng', N'25 Nguyễn Phong Sắc, Dịch Vọng Hậu, Cầu Giấy, Hà Nội', N'DL09', N'DM04', N'', N'', NULL, NULL, NULL, NULL, NULL, N'', N'Máy nước nóng', N'', N'', N'', NULL, 3500000.0000)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [Trangthai], [Diachi], [MaDL], [MaDM], [Thumb], [Video], [DateCreated], [DateModified], [BestSellers], [Homeflag], [Active], [Tags], [Tieude], [Alias], [MetaDesc], [MetaKey], [SoLo], [Gia]) VALUES (N'SP000045', N'Máy nước nóng trực tiếp Ferroli 4500W MIDO-MSP 4.5S', N'Máy nước nóng trực tiếp Ferroli 4500W MIDO-MSP 4.5S', N'Còn hàng', N'75 Đ. Trường Chinh, Phương Đình, Đống Đa, Hà Nội', N'DL09', N'DM04', N'', N'', NULL, NULL, NULL, NULL, NULL, N'', N'Máy nước nóng', N'', N'', N'', NULL, 15000000.0000)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [Trangthai], [Diachi], [MaDL], [MaDM], [Thumb], [Video], [DateCreated], [DateModified], [BestSellers], [Homeflag], [Active], [Tags], [Tieude], [Alias], [MetaDesc], [MetaKey], [SoLo], [Gia]) VALUES (N'SP000046  ', N'Ti vi siêu cấp ', N'Sản phẩm rất tốt', N'Còn hàng', NULL, NULL, N'DM01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000)
GO
INSERT [dbo].[Shipper] ([MaShipper], [TenShipper], [SĐT], [CongTy]) VALUES (N'SH01', N'Nguyễn Thế Thành', N'0214928660', N'BE')
INSERT [dbo].[Shipper] ([MaShipper], [TenShipper], [SĐT], [CongTy]) VALUES (N'SH02', N'Lương Thế Thành', N'0437799797', N'Shopee')
INSERT [dbo].[Shipper] ([MaShipper], [TenShipper], [SĐT], [CongTy]) VALUES (N'SH03', N'Lê Thị Bảo Ngọc', N'0696954756', N'Tiki')
INSERT [dbo].[Shipper] ([MaShipper], [TenShipper], [SĐT], [CongTy]) VALUES (N'SH04', N'Nguyễn Mạnh Hưng', N'0858869484', N'Giao Hàng Tiết Kiệm')
INSERT [dbo].[Shipper] ([MaShipper], [TenShipper], [SĐT], [CongTy]) VALUES (N'SH05', N'Nguyễn Ngọc Tuấn', N'0119623635', N'VnExpress')
INSERT [dbo].[Shipper] ([MaShipper], [TenShipper], [SĐT], [CongTy]) VALUES (N'SH06', N'Nguyễn Hoàng Anh', N'0577770236', N'BE')
INSERT [dbo].[Shipper] ([MaShipper], [TenShipper], [SĐT], [CongTy]) VALUES (N'SH07', N'Nguyễn Phi Luân', N'0608725355', N'Shopee')
INSERT [dbo].[Shipper] ([MaShipper], [TenShipper], [SĐT], [CongTy]) VALUES (N'SH08', N'Huỳnh Phan Ngọc Khang', N'0259279326', N'Tiki')
INSERT [dbo].[Shipper] ([MaShipper], [TenShipper], [SĐT], [CongTy]) VALUES (N'SH09', N'Phạm Viết Triều', N'0304328976', N'Giao Hàng Tiết Kiệm')
INSERT [dbo].[Shipper] ([MaShipper], [TenShipper], [SĐT], [CongTy]) VALUES (N'SH10', N'Nguyễn Xuân Đức', N'0462350510', N'VnExpress')
GO
SET IDENTITY_INSERT [dbo].[SP_Danhgia] ON 

INSERT [dbo].[SP_Danhgia] ([Madanhgia_sp], [MaSP], [noidung_danhgia], [MaKH], [NgayDanhgia], [Sao]) VALUES (2, N'SP000001', N'Sản phẩm đẹp, giao nhanh', N'KH01', CAST(N'2022-09-10' AS Date), 5)
INSERT [dbo].[SP_Danhgia] ([Madanhgia_sp], [MaSP], [noidung_danhgia], [MaKH], [NgayDanhgia], [Sao]) VALUES (3, N'SP000002', N'Hàng chính hãng, giao nhanh', N'KH02', CAST(N'2022-10-03' AS Date), NULL)
INSERT [dbo].[SP_Danhgia] ([Madanhgia_sp], [MaSP], [noidung_danhgia], [MaKH], [NgayDanhgia], [Sao]) VALUES (4, N'SP000001', N'Bền, đẹp, xuất sắc', N'KH02', CAST(N'2022-11-02' AS Date), NULL)
INSERT [dbo].[SP_Danhgia] ([Madanhgia_sp], [MaSP], [noidung_danhgia], [MaKH], [NgayDanhgia], [Sao]) VALUES (5, N'SP000002', N'Giao nhanh, bền, đẹp, chắc chắn', N'KH03', CAST(N'2022-11-02' AS Date), NULL)
INSERT [dbo].[SP_Danhgia] ([Madanhgia_sp], [MaSP], [noidung_danhgia], [MaKH], [NgayDanhgia], [Sao]) VALUES (8, N'SP000003', N'Giao nhanh, bền, đẹp, chắc chắn', N'KH04', CAST(N'2022-10-03' AS Date), NULL)
INSERT [dbo].[SP_Danhgia] ([Madanhgia_sp], [MaSP], [noidung_danhgia], [MaKH], [NgayDanhgia], [Sao]) VALUES (10, N'SP000003', N'Bền, đẹp, xuất sắc', N'KH05', CAST(N'2022-09-11' AS Date), NULL)
INSERT [dbo].[SP_Danhgia] ([Madanhgia_sp], [MaSP], [noidung_danhgia], [MaKH], [NgayDanhgia], [Sao]) VALUES (11, N'SP000001', N'Sản phẩm này rất tuyệt', N'KH02', CAST(N'2022-12-20' AS Date), NULL)
SET IDENTITY_INSERT [dbo].[SP_Danhgia] OFF
GO
SET IDENTITY_INSERT [dbo].[SP_ThuocTinh] ON 

INSERT [dbo].[SP_ThuocTinh] ([Ma_SP_TT], [MaSP], [MaChiTiet]) VALUES (1, N'SP000001', 1)
INSERT [dbo].[SP_ThuocTinh] ([Ma_SP_TT], [MaSP], [MaChiTiet]) VALUES (2, N'SP000001', 4)
INSERT [dbo].[SP_ThuocTinh] ([Ma_SP_TT], [MaSP], [MaChiTiet]) VALUES (3, N'SP000001', 7)
INSERT [dbo].[SP_ThuocTinh] ([Ma_SP_TT], [MaSP], [MaChiTiet]) VALUES (4, N'SP000001', 10)
INSERT [dbo].[SP_ThuocTinh] ([Ma_SP_TT], [MaSP], [MaChiTiet]) VALUES (5, N'SP000001', 13)
INSERT [dbo].[SP_ThuocTinh] ([Ma_SP_TT], [MaSP], [MaChiTiet]) VALUES (6, N'SP000002', 2)
INSERT [dbo].[SP_ThuocTinh] ([Ma_SP_TT], [MaSP], [MaChiTiet]) VALUES (7, N'SP000002', 5)
INSERT [dbo].[SP_ThuocTinh] ([Ma_SP_TT], [MaSP], [MaChiTiet]) VALUES (8, N'SP000002', 8)
INSERT [dbo].[SP_ThuocTinh] ([Ma_SP_TT], [MaSP], [MaChiTiet]) VALUES (9, N'SP000002', 11)
INSERT [dbo].[SP_ThuocTinh] ([Ma_SP_TT], [MaSP], [MaChiTiet]) VALUES (10, N'SP000002', 14)
INSERT [dbo].[SP_ThuocTinh] ([Ma_SP_TT], [MaSP], [MaChiTiet]) VALUES (11, N'SP000003', 3)
INSERT [dbo].[SP_ThuocTinh] ([Ma_SP_TT], [MaSP], [MaChiTiet]) VALUES (12, N'SP000003', 6)
INSERT [dbo].[SP_ThuocTinh] ([Ma_SP_TT], [MaSP], [MaChiTiet]) VALUES (13, N'SP000003', 9)
INSERT [dbo].[SP_ThuocTinh] ([Ma_SP_TT], [MaSP], [MaChiTiet]) VALUES (14, N'SP000003', 12)
INSERT [dbo].[SP_ThuocTinh] ([Ma_SP_TT], [MaSP], [MaChiTiet]) VALUES (15, N'SP000003', 15)
SET IDENTITY_INSERT [dbo].[SP_ThuocTinh] OFF
GO
INSERT [dbo].[TaiKhoan] ([AccountID], [TenDangNhap], [SĐT], [Password], [Mahoa], [Kichhoat], [Ngaytao], [LastLogin], [MaQuyen]) VALUES (N'AC01', N'ngoclong', N'0594173085', N'1', NULL, 1, NULL, NULL, N'VA01')
INSERT [dbo].[TaiKhoan] ([AccountID], [TenDangNhap], [SĐT], [Password], [Mahoa], [Kichhoat], [Ngaytao], [LastLogin], [MaQuyen]) VALUES (N'AC02', N'Dung', N'0586119106', N'88888888', NULL, 0, NULL, NULL, N'VA02')
INSERT [dbo].[TaiKhoan] ([AccountID], [TenDangNhap], [SĐT], [Password], [Mahoa], [Kichhoat], [Ngaytao], [LastLogin], [MaQuyen]) VALUES (N'AC03', N'Quang', N'0713584439', N'88888888', NULL, 1, NULL, NULL, N'VA02')
INSERT [dbo].[TaiKhoan] ([AccountID], [TenDangNhap], [SĐT], [Password], [Mahoa], [Kichhoat], [Ngaytao], [LastLogin], [MaQuyen]) VALUES (N'AC04', N'Hiếu', N'012345', N'8888', NULL, 1, NULL, NULL, N'VA03')
GO
INSERT [dbo].[ThanhToan] ([MaThanhToan], [HinhThuc]) VALUES (N'TT01', N'Tiền mặt')
INSERT [dbo].[ThanhToan] ([MaThanhToan], [HinhThuc]) VALUES (N'TT02', N'Chuyển khoản qua MB')
INSERT [dbo].[ThanhToan] ([MaThanhToan], [HinhThuc]) VALUES (N'TT03', N'Chuyển khoản qua Vietcombank')
INSERT [dbo].[ThanhToan] ([MaThanhToan], [HinhThuc]) VALUES (N'TT04', N'Momo')
GO
SET IDENTITY_INSERT [dbo].[ThuocTinh] ON 

INSERT [dbo].[ThuocTinh] ([MaTT], [Tenthuoctinh]) VALUES (1, N'Màn hình')
INSERT [dbo].[ThuocTinh] ([MaTT], [Tenthuoctinh]) VALUES (2, N'Trọng lượng')
INSERT [dbo].[ThuocTinh] ([MaTT], [Tenthuoctinh]) VALUES (3, N'RAM')
INSERT [dbo].[ThuocTinh] ([MaTT], [Tenthuoctinh]) VALUES (4, N'Công nghệ')
INSERT [dbo].[ThuocTinh] ([MaTT], [Tenthuoctinh]) VALUES (5, N'Công suất')
SET IDENTITY_INSERT [dbo].[ThuocTinh] OFF
GO
INSERT [dbo].[TrangThaiDon] ([MaTrangThai], [TrangThai], [MoTa]) VALUES (N'TS01', N'Chờ xác nhận', N'Đơn hàng đang trong giai đoạn xác nhận tính hợp lệ bởi hệ thống')
INSERT [dbo].[TrangThaiDon] ([MaTrangThai], [TrangThai], [MoTa]) VALUES (N'TS02', N'Chờ lấy hàng', N'Đơn hàng đã được chuyển thông tin tới Người bán để giao cho đơn vị vận chuyển')
INSERT [dbo].[TrangThaiDon] ([MaTrangThai], [TrangThai], [MoTa]) VALUES (N'TS03', N'Đang giao', N'Đơn hàng đang được giao tới Người mua')
INSERT [dbo].[TrangThaiDon] ([MaTrangThai], [TrangThai], [MoTa]) VALUES (N'TS04', N'Đánh giá', N'Đơn hàng đang chờ được đánh giá sản phẩm')
INSERT [dbo].[TrangThaiDon] ([MaTrangThai], [TrangThai], [MoTa]) VALUES (N'TS05', N'Đã giao', N'Đơn hàng đã được giao thành công tới Người mua')
INSERT [dbo].[TrangThaiDon] ([MaTrangThai], [TrangThai], [MoTa]) VALUES (N'TS06', N'Đã hủy', N'Đơn hàng đã được hủy thành công')
INSERT [dbo].[TrangThaiDon] ([MaTrangThai], [TrangThai], [MoTa]) VALUES (N'TS07', N'Trả hàng', N'Đơn hàng đã được trả hàng thành công')
GO
INSERT [dbo].[Vitri] ([MaVT], [TenVT], [Loai], [NameWithType], [PathWithType], [ParentCode], [Mucdo]) VALUES (N'LO01', N'', N'', N'', N'', NULL, NULL)
INSERT [dbo].[Vitri] ([MaVT], [TenVT], [Loai], [NameWithType], [PathWithType], [ParentCode], [Mucdo]) VALUES (N'LO02', N'', N'', N'', N'', NULL, NULL)
INSERT [dbo].[Vitri] ([MaVT], [TenVT], [Loai], [NameWithType], [PathWithType], [ParentCode], [Mucdo]) VALUES (N'LO03', N'', N'', N'', N'', NULL, NULL)
INSERT [dbo].[Vitri] ([MaVT], [TenVT], [Loai], [NameWithType], [PathWithType], [ParentCode], [Mucdo]) VALUES (N'LO04', N'', N'', N'', N'', NULL, NULL)
INSERT [dbo].[Vitri] ([MaVT], [TenVT], [Loai], [NameWithType], [PathWithType], [ParentCode], [Mucdo]) VALUES (N'LO05', N'', N'', N'', N'', NULL, NULL)
GO
ALTER TABLE [dbo].[ChiTietOrder]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietOrder_DonHang] FOREIGN KEY([MaDon])
REFERENCES [dbo].[DonHang] ([MaDon])
GO
ALTER TABLE [dbo].[ChiTietOrder] CHECK CONSTRAINT [FK_ChiTietOrder_DonHang]
GO
ALTER TABLE [dbo].[ChiTietOrder]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietOrder_SanPham] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[ChiTietOrder] CHECK CONSTRAINT [FK_ChiTietOrder_SanPham]
GO
ALTER TABLE [dbo].[ChiTietThuocTinh]  WITH CHECK ADD FOREIGN KEY([MaTT])
REFERENCES [dbo].[ThuocTinh] ([MaTT])
GO
ALTER TABLE [dbo].[ChiTietThuocTinh]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietThuocTinh_ChiTietThuocTinh] FOREIGN KEY([MaChiTiet])
REFERENCES [dbo].[ChiTietThuocTinh] ([MaChiTiet])
GO
ALTER TABLE [dbo].[ChiTietThuocTinh] CHECK CONSTRAINT [FK_ChiTietThuocTinh_ChiTietThuocTinh]
GO
ALTER TABLE [dbo].[ChiTietThuocTinh]  WITH CHECK ADD  CONSTRAINT [FK_ThuocTinh_ChiTietThuocTinh] FOREIGN KEY([MaChiTiet])
REFERENCES [dbo].[ChiTietThuocTinh] ([MaChiTiet])
GO
ALTER TABLE [dbo].[ChiTietThuocTinh] CHECK CONSTRAINT [FK_ThuocTinh_ChiTietThuocTinh]
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD  CONSTRAINT [FK_DonHang_Shipper] FOREIGN KEY([MaShipper])
REFERENCES [dbo].[Shipper] ([MaShipper])
GO
ALTER TABLE [dbo].[DonHang] CHECK CONSTRAINT [FK_DonHang_Shipper]
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD  CONSTRAINT [FK_DonHang_ThanhToan] FOREIGN KEY([MaThanhToan])
REFERENCES [dbo].[ThanhToan] ([MaThanhToan])
GO
ALTER TABLE [dbo].[DonHang] CHECK CONSTRAINT [FK_DonHang_ThanhToan]
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD  CONSTRAINT [FK_DonHang_TrangThaiDon] FOREIGN KEY([MaTrangThai])
REFERENCES [dbo].[TrangThaiDon] ([MaTrangThai])
GO
ALTER TABLE [dbo].[DonHang] CHECK CONSTRAINT [FK_DonHang_TrangThaiDon]
GO
ALTER TABLE [dbo].[KhachHang]  WITH CHECK ADD  CONSTRAINT [FK_KhachHang_Locations] FOREIGN KEY([MaVT])
REFERENCES [dbo].[Vitri] ([MaVT])
GO
ALTER TABLE [dbo].[KhachHang] CHECK CONSTRAINT [FK_KhachHang_Locations]
GO
ALTER TABLE [dbo].[PictureProduct]  WITH CHECK ADD  CONSTRAINT [FK__PicturePro__MaSP__54CB950F] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[PictureProduct] CHECK CONSTRAINT [FK__PicturePro__MaSP__54CB950F]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK__SanPham__Categor__47DBAE45] FOREIGN KEY([MaDM])
REFERENCES [dbo].[Danhmuc] ([MaDM])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK__SanPham__Categor__47DBAE45]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK__SanPham__SupplyI__46E78A0C] FOREIGN KEY([MaDL])
REFERENCES [dbo].[DaiLy] ([MaDL])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK__SanPham__SupplyI__46E78A0C]
GO
ALTER TABLE [dbo].[SP_Danhgia]  WITH CHECK ADD  CONSTRAINT [fk_htk_SPMAKH] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[SP_Danhgia] CHECK CONSTRAINT [fk_htk_SPMAKH]
GO
ALTER TABLE [dbo].[SP_Danhgia]  WITH CHECK ADD  CONSTRAINT [fk_masp] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[SP_Danhgia] CHECK CONSTRAINT [fk_masp]
GO
ALTER TABLE [dbo].[SP_ThuocTinh]  WITH CHECK ADD  CONSTRAINT [FK__SP_ThuocT__MaChi__269AB60B] FOREIGN KEY([MaChiTiet])
REFERENCES [dbo].[ChiTietThuocTinh] ([MaChiTiet])
GO
ALTER TABLE [dbo].[SP_ThuocTinh] CHECK CONSTRAINT [FK__SP_ThuocT__MaChi__269AB60B]
GO
ALTER TABLE [dbo].[SP_ThuocTinh]  WITH CHECK ADD  CONSTRAINT [FK__SP_ThuocTi__MaSP__25A691D2] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[SP_ThuocTinh] CHECK CONSTRAINT [FK__SP_ThuocTi__MaSP__25A691D2]
GO
ALTER TABLE [dbo].[TaiKhoan]  WITH CHECK ADD  CONSTRAINT [FK__Account__RoleID__6477ECF3] FOREIGN KEY([MaQuyen])
REFERENCES [dbo].[QuyenTC] ([MaQuyen])
GO
ALTER TABLE [dbo].[TaiKhoan] CHECK CONSTRAINT [FK__Account__RoleID__6477ECF3]
GO
USE [master]
GO
ALTER DATABASE [BanHangTrucTuyen2] SET  READ_WRITE 
GO
