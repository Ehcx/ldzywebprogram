USE [master]
GO
/****** Object:  Database [StoreDB]    Script Date: 10/12/2018 09:35:05 ******/
CREATE DATABASE [StoreDB] ON  PRIMARY 
( NAME = N'StoreDB', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\StoreDB.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'StoreDB_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\StoreDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [StoreDB] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StoreDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StoreDB] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [StoreDB] SET ANSI_NULLS OFF
GO
ALTER DATABASE [StoreDB] SET ANSI_PADDING OFF
GO
ALTER DATABASE [StoreDB] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [StoreDB] SET ARITHABORT OFF
GO
ALTER DATABASE [StoreDB] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [StoreDB] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [StoreDB] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [StoreDB] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [StoreDB] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [StoreDB] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [StoreDB] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [StoreDB] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [StoreDB] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [StoreDB] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [StoreDB] SET  DISABLE_BROKER
GO
ALTER DATABASE [StoreDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [StoreDB] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [StoreDB] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [StoreDB] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [StoreDB] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [StoreDB] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [StoreDB] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [StoreDB] SET  READ_WRITE
GO
ALTER DATABASE [StoreDB] SET RECOVERY SIMPLE
GO
ALTER DATABASE [StoreDB] SET  MULTI_USER
GO
ALTER DATABASE [StoreDB] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [StoreDB] SET DB_CHAINING OFF
GO
USE [StoreDB]
GO
/****** Object:  Table [dbo].[tbl_supplier]    Script Date: 10/12/2018 09:35:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_supplier](
	[suppId] [int] IDENTITY(1,1) NOT NULL,
	[suppName] [varchar](60) NOT NULL,
	[suppPhone] [varchar](11) NOT NULL,
	[suppAddr] [varchar](200) NOT NULL,
	[reverse] [text] NULL,
 CONSTRAINT [PK_tbl_supplier] PRIMARY KEY CLUSTERED 
(
	[suppId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_goods]    Script Date: 10/12/2018 09:35:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_goods](
	[goodId] [int] NOT NULL,
	[goodName] [varchar](60) NOT NULL,
	[goodBatch] [varchar](100) NOT NULL,
	[goodType] [varchar](60) NOT NULL,
	[suppId] [int] NULL,
	[storeQuantity] [int] NOT NULL,
	[reverse] [text] NULL,
 CONSTRAINT [PK_tbl_goods] PRIMARY KEY CLUSTERED 
(
	[goodId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_outstock]    Script Date: 10/12/2018 09:35:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_outstock](
	[outId] [int] IDENTITY(1,1) NOT NULL,
	[goodId] [int] NOT NULL,
	[outQuantity] [int] NOT NULL,
	[outDate] [datetime] NOT NULL,
 CONSTRAINT [PK_tbl_outstock] PRIMARY KEY CLUSTERED 
(
	[outId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_instock]    Script Date: 10/12/2018 09:35:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_instock](
	[inId] [int] IDENTITY(1,1) NOT NULL,
	[goodId] [int] NOT NULL,
	[inQuantity] [int] NOT NULL,
	[goodPrice] [float] NOT NULL,
	[inDate] [datetime] NOT NULL,
 CONSTRAINT [PK_tbl_instock] PRIMARY KEY CLUSTERED 
(
	[inId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Default [DF_tbl_outstock_outDate]    Script Date: 10/12/2018 09:35:06 ******/
ALTER TABLE [dbo].[tbl_outstock] ADD  CONSTRAINT [DF_tbl_outstock_outDate]  DEFAULT (getdate()) FOR [outDate]
GO
/****** Object:  Default [DF_tbl_instock_inDate]    Script Date: 10/12/2018 09:35:06 ******/
ALTER TABLE [dbo].[tbl_instock] ADD  CONSTRAINT [DF_tbl_instock_inDate]  DEFAULT (getdate()) FOR [inDate]
GO
/****** Object:  Check [CK_tbl_supplier]    Script Date: 10/12/2018 09:35:06 ******/
ALTER TABLE [dbo].[tbl_supplier]  WITH CHECK ADD  CONSTRAINT [CK_tbl_supplier] CHECK  (([suppPhone] like '[1-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'))
GO
ALTER TABLE [dbo].[tbl_supplier] CHECK CONSTRAINT [CK_tbl_supplier]
GO
/****** Object:  Check [CK_tbl_goods]    Script Date: 10/12/2018 09:35:06 ******/
ALTER TABLE [dbo].[tbl_goods]  WITH CHECK ADD  CONSTRAINT [CK_tbl_goods] CHECK  (([goodType]='其他' OR [goodType]='电子产品' OR [goodType]='服装' OR [goodType]='食品'))
GO
ALTER TABLE [dbo].[tbl_goods] CHECK CONSTRAINT [CK_tbl_goods]
GO
/****** Object:  Check [CK_tbl_instock]    Script Date: 10/12/2018 09:35:06 ******/
ALTER TABLE [dbo].[tbl_instock]  WITH CHECK ADD  CONSTRAINT [CK_tbl_instock] CHECK  (([goodPrice]>=(0)))
GO
ALTER TABLE [dbo].[tbl_instock] CHECK CONSTRAINT [CK_tbl_instock]
GO
/****** Object:  ForeignKey [FK_tbl_goods_tbl_supplier]    Script Date: 10/12/2018 09:35:06 ******/
ALTER TABLE [dbo].[tbl_goods]  WITH CHECK ADD  CONSTRAINT [FK_tbl_goods_tbl_supplier] FOREIGN KEY([suppId])
REFERENCES [dbo].[tbl_supplier] ([suppId])
GO
ALTER TABLE [dbo].[tbl_goods] CHECK CONSTRAINT [FK_tbl_goods_tbl_supplier]
GO
/****** Object:  ForeignKey [FK_tbl_outstock_tbl_goods]    Script Date: 10/12/2018 09:35:06 ******/
ALTER TABLE [dbo].[tbl_outstock]  WITH CHECK ADD  CONSTRAINT [FK_tbl_outstock_tbl_goods] FOREIGN KEY([goodId])
REFERENCES [dbo].[tbl_goods] ([goodId])
GO
ALTER TABLE [dbo].[tbl_outstock] CHECK CONSTRAINT [FK_tbl_outstock_tbl_goods]
GO
/****** Object:  ForeignKey [FK_tbl_instock_tbl_goods]    Script Date: 10/12/2018 09:35:06 ******/
ALTER TABLE [dbo].[tbl_instock]  WITH CHECK ADD  CONSTRAINT [FK_tbl_instock_tbl_goods] FOREIGN KEY([goodId])
REFERENCES [dbo].[tbl_goods] ([goodId])
GO
ALTER TABLE [dbo].[tbl_instock] CHECK CONSTRAINT [FK_tbl_instock_tbl_goods]
GO
