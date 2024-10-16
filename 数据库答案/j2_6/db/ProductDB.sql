USE [master]
GO
/****** Object:  Database [ProductDB]    Script Date: 09/27/2018 11:49:29 ******/
CREATE DATABASE [ProductDB] ON  PRIMARY 
( NAME = N'ProductDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\ProductDB.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ProductDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\ProductDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ProductDB] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProductDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProductDB] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [ProductDB] SET ANSI_NULLS OFF
GO
ALTER DATABASE [ProductDB] SET ANSI_PADDING OFF
GO
ALTER DATABASE [ProductDB] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [ProductDB] SET ARITHABORT OFF
GO
ALTER DATABASE [ProductDB] SET AUTO_CLOSE ON
GO
ALTER DATABASE [ProductDB] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [ProductDB] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [ProductDB] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [ProductDB] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [ProductDB] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [ProductDB] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [ProductDB] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [ProductDB] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [ProductDB] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [ProductDB] SET  DISABLE_BROKER
GO
ALTER DATABASE [ProductDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [ProductDB] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [ProductDB] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [ProductDB] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [ProductDB] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [ProductDB] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [ProductDB] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [ProductDB] SET  READ_WRITE
GO
ALTER DATABASE [ProductDB] SET RECOVERY SIMPLE
GO
ALTER DATABASE [ProductDB] SET  MULTI_USER
GO
ALTER DATABASE [ProductDB] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [ProductDB] SET DB_CHAINING OFF
GO
USE [ProductDB]
GO
/****** Object:  Table [dbo].[T_category]    Script Date: 09/27/2018 11:49:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_category](
	[category_id] [int] NOT NULL,
	[category_name] [varchar](30) NOT NULL,
	[register_date] [datetime] NOT NULL,
 CONSTRAINT [PK_T_category] PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_product_review]    Script Date: 09/27/2018 11:49:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_product_review](
	[review_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[review] [varchar](2000) NULL,
	[register_date] [datetime] NOT NULL,
 CONSTRAINT [PK_T_product_review] PRIMARY KEY CLUSTERED 
(
	[review_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_product]    Script Date: 09/27/2018 11:49:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_product](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[category_id] [int] NOT NULL,
	[product_name] [varchar](50) NOT NULL,
	[price] [money] NOT NULL,
	[remark] [varchar](2000) NULL,
	[register_date] [datetime] NOT NULL,
 CONSTRAINT [PK_T_product] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Default [DF_T_category_register_date]    Script Date: 09/27/2018 11:49:29 ******/
ALTER TABLE [dbo].[T_category] ADD  CONSTRAINT [DF_T_category_register_date]  DEFAULT (getdate()) FOR [register_date]
GO
/****** Object:  Default [DF_T_product_review_register_date]    Script Date: 09/27/2018 11:49:29 ******/
ALTER TABLE [dbo].[T_product_review] ADD  CONSTRAINT [DF_T_product_review_register_date]  DEFAULT (getdate()) FOR [register_date]
GO
/****** Object:  Default [DF_T_product_register_date]    Script Date: 09/27/2018 11:49:29 ******/
ALTER TABLE [dbo].[T_product] ADD  CONSTRAINT [DF_T_product_register_date]  DEFAULT (getdate()) FOR [register_date]
GO
/****** Object:  Check [CK_T_category]    Script Date: 09/27/2018 11:49:29 ******/
ALTER TABLE [dbo].[T_category]  WITH CHECK ADD  CONSTRAINT [CK_T_category] CHECK  (([register_date]<=getdate()))
GO
ALTER TABLE [dbo].[T_category] CHECK CONSTRAINT [CK_T_category]
GO
/****** Object:  Check [CK_T_product_review]    Script Date: 09/27/2018 11:49:29 ******/
ALTER TABLE [dbo].[T_product_review]  WITH CHECK ADD  CONSTRAINT [CK_T_product_review] CHECK  (([register_date]<=getdate()))
GO
ALTER TABLE [dbo].[T_product_review] CHECK CONSTRAINT [CK_T_product_review]
GO
/****** Object:  Check [CK_T_product]    Script Date: 09/27/2018 11:49:29 ******/
ALTER TABLE [dbo].[T_product]  WITH CHECK ADD  CONSTRAINT [CK_T_product] CHECK  (([price]>=(0) AND [price]<=(500)))
GO
ALTER TABLE [dbo].[T_product] CHECK CONSTRAINT [CK_T_product]
GO
/****** Object:  Check [CK_T_product_1]    Script Date: 09/27/2018 11:49:29 ******/
ALTER TABLE [dbo].[T_product]  WITH CHECK ADD  CONSTRAINT [CK_T_product_1] CHECK  (([register_date]<=getdate()))
GO
ALTER TABLE [dbo].[T_product] CHECK CONSTRAINT [CK_T_product_1]
GO
/****** Object:  ForeignKey [FK_T_product_T_category]    Script Date: 09/27/2018 11:49:29 ******/
ALTER TABLE [dbo].[T_product]  WITH CHECK ADD  CONSTRAINT [FK_T_product_T_category] FOREIGN KEY([category_id])
REFERENCES [dbo].[T_category] ([category_id])
GO
ALTER TABLE [dbo].[T_product] CHECK CONSTRAINT [FK_T_product_T_category]
GO
