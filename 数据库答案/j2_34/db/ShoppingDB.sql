USE [master]
GO
/****** Object:  Database [ShoppingDB]    Script Date: 10/15/2018 10:15:30 ******/
CREATE DATABASE [ShoppingDB] ON  PRIMARY 
( NAME = N'ShoppingDB', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\ShoppingDB.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ShoppingDB_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\ShoppingDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ShoppingDB] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ShoppingDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ShoppingDB] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [ShoppingDB] SET ANSI_NULLS OFF
GO
ALTER DATABASE [ShoppingDB] SET ANSI_PADDING OFF
GO
ALTER DATABASE [ShoppingDB] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [ShoppingDB] SET ARITHABORT OFF
GO
ALTER DATABASE [ShoppingDB] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [ShoppingDB] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [ShoppingDB] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [ShoppingDB] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [ShoppingDB] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [ShoppingDB] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [ShoppingDB] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [ShoppingDB] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [ShoppingDB] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [ShoppingDB] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [ShoppingDB] SET  DISABLE_BROKER
GO
ALTER DATABASE [ShoppingDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [ShoppingDB] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [ShoppingDB] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [ShoppingDB] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [ShoppingDB] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [ShoppingDB] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [ShoppingDB] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [ShoppingDB] SET  READ_WRITE
GO
ALTER DATABASE [ShoppingDB] SET RECOVERY SIMPLE
GO
ALTER DATABASE [ShoppingDB] SET  MULTI_USER
GO
ALTER DATABASE [ShoppingDB] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [ShoppingDB] SET DB_CHAINING OFF
GO
USE [ShoppingDB]
GO
/****** Object:  Table [dbo].[T_user]    Script Date: 10/15/2018 10:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_user](
	[user_id] [int] NOT NULL,
	[userName] [varchar](20) NOT NULL,
	[userPass] [varchar](20) NOT NULL,
	[userSex] [varchar](4) NOT NULL,
 CONSTRAINT [PK_T_user] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_type]    Script Date: 10/15/2018 10:15:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_type](
	[Type_id] [nchar](10) NOT NULL,
	[Type_name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_T_type] PRIMARY KEY CLUSTERED 
(
	[Type_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_commodity]    Script Date: 10/15/2018 10:15:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_commodity](
	[Commodity_id] [int] NOT NULL,
	[commodity_name] [varchar](30) NOT NULL,
	[Img] [varchar](100) NOT NULL,
	[Type_id] [nchar](10) NOT NULL,
	[Details] [varbinary](max) NULL,
	[Price] [float] NOT NULL,
	[state] [int] NOT NULL,
 CONSTRAINT [PK_T_commodity] PRIMARY KEY CLUSTERED 
(
	[Commodity_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_order]    Script Date: 10/15/2018 10:15:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_order](
	[order_id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
	[Commodity_id] [int] NOT NULL,
	[commodity_count] [int] NOT NULL,
	[totalPrice] [float] NOT NULL,
 CONSTRAINT [PK_T_order] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Check [CK_T_user]    Script Date: 10/15/2018 10:15:30 ******/
ALTER TABLE [dbo].[T_user]  WITH CHECK ADD  CONSTRAINT [CK_T_user] CHECK  ((len([userPass])>=(6)))
GO
ALTER TABLE [dbo].[T_user] CHECK CONSTRAINT [CK_T_user]
GO
/****** Object:  Check [CK_T_commodity]    Script Date: 10/15/2018 10:15:31 ******/
ALTER TABLE [dbo].[T_commodity]  WITH CHECK ADD  CONSTRAINT [CK_T_commodity] CHECK  ((len([commodity_name])<=(50)))
GO
ALTER TABLE [dbo].[T_commodity] CHECK CONSTRAINT [CK_T_commodity]
GO
/****** Object:  Check [CK_T_commodity_1]    Script Date: 10/15/2018 10:15:31 ******/
ALTER TABLE [dbo].[T_commodity]  WITH CHECK ADD  CONSTRAINT [CK_T_commodity_1] CHECK  (([state]='1' OR [state]='0'))
GO
ALTER TABLE [dbo].[T_commodity] CHECK CONSTRAINT [CK_T_commodity_1]
GO
/****** Object:  ForeignKey [FK_T_commodity_T_type]    Script Date: 10/15/2018 10:15:31 ******/
ALTER TABLE [dbo].[T_commodity]  WITH CHECK ADD  CONSTRAINT [FK_T_commodity_T_type] FOREIGN KEY([Type_id])
REFERENCES [dbo].[T_type] ([Type_id])
GO
ALTER TABLE [dbo].[T_commodity] CHECK CONSTRAINT [FK_T_commodity_T_type]
GO
/****** Object:  ForeignKey [FK_T_order_T_commodity]    Script Date: 10/15/2018 10:15:31 ******/
ALTER TABLE [dbo].[T_order]  WITH CHECK ADD  CONSTRAINT [FK_T_order_T_commodity] FOREIGN KEY([Commodity_id])
REFERENCES [dbo].[T_commodity] ([Commodity_id])
GO
ALTER TABLE [dbo].[T_order] CHECK CONSTRAINT [FK_T_order_T_commodity]
GO
/****** Object:  ForeignKey [FK_T_order_T_user]    Script Date: 10/15/2018 10:15:31 ******/
ALTER TABLE [dbo].[T_order]  WITH CHECK ADD  CONSTRAINT [FK_T_order_T_user] FOREIGN KEY([user_id])
REFERENCES [dbo].[T_user] ([user_id])
GO
ALTER TABLE [dbo].[T_order] CHECK CONSTRAINT [FK_T_order_T_user]
GO
