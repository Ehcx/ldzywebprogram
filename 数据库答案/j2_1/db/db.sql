USE [master]
GO
/****** Object:  Database [ConstructionDB]    Script Date: 09/25/2018 08:52:03 ******/
CREATE DATABASE [ConstructionDB] ON  PRIMARY 
( NAME = N'ConstructionDB', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\ConstructionDB.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ConstructionDB_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\ConstructionDB_1.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ConstructionDB] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ConstructionDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ConstructionDB] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [ConstructionDB] SET ANSI_NULLS OFF
GO
ALTER DATABASE [ConstructionDB] SET ANSI_PADDING OFF
GO
ALTER DATABASE [ConstructionDB] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [ConstructionDB] SET ARITHABORT OFF
GO
ALTER DATABASE [ConstructionDB] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [ConstructionDB] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [ConstructionDB] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [ConstructionDB] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [ConstructionDB] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [ConstructionDB] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [ConstructionDB] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [ConstructionDB] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [ConstructionDB] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [ConstructionDB] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [ConstructionDB] SET  DISABLE_BROKER
GO
ALTER DATABASE [ConstructionDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [ConstructionDB] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [ConstructionDB] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [ConstructionDB] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [ConstructionDB] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [ConstructionDB] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [ConstructionDB] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [ConstructionDB] SET  READ_WRITE
GO
ALTER DATABASE [ConstructionDB] SET RECOVERY SIMPLE
GO
ALTER DATABASE [ConstructionDB] SET  MULTI_USER
GO
ALTER DATABASE [ConstructionDB] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [ConstructionDB] SET DB_CHAINING OFF
GO
USE [ConstructionDB]
GO
/****** Object:  Table [dbo].[T_func_item]    Script Date: 09/25/2018 08:52:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_func_item](
	[func_id] [char](3) NOT NULL,
	[func_name] [varchar](32) NULL,
	[reserve] [varchar](64) NULL,
 CONSTRAINT [PK_T_func_item] PRIMARY KEY CLUSTERED 
(
	[func_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_user_T_func_role_def]    Script Date: 09/25/2018 08:52:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_user_T_func_role_def](
	[func_role_id] [char](3) NOT NULL,
	[user_id] [char](4) NOT NULL,
 CONSTRAINT [PK_Table_2] PRIMARY KEY CLUSTERED 
(
	[func_role_id] ASC,
	[user_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_user]    Script Date: 09/25/2018 08:52:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_user](
	[user_id] [char](4) NOT NULL,
	[user_name] [char](16) NOT NULL,
	[user_passwd] [char](16) NULL,
	[dept_id] [char](3) NULL,
	[telephone] [varchar](16) NULL,
	[address] [varchar](32) NULL,
	[handphone] [varchar](16) NULL,
	[usb_no] [varchar](64) NULL,
	[reserve] [varchar](64) NULL,
 CONSTRAINT [PK_T_user] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_func_role_def]    Script Date: 09/25/2018 08:52:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_func_role_def](
	[func_role_id] [char](3) NOT NULL,
	[func_role_name] [varchar](32) NULL,
	[reserve] [varchar](64) NULL,
 CONSTRAINT [PK_T_func_role_def] PRIMARY KEY CLUSTERED 
(
	[func_role_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_func_item_T_func_role_def]    Script Date: 09/25/2018 08:52:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_func_item_T_func_role_def](
	[func_id] [char](3) NOT NULL,
	[func_role_id] [char](3) NOT NULL,
 CONSTRAINT [PK_T_func_item_T_func_role_def] PRIMARY KEY CLUSTERED 
(
	[func_id] ASC,
	[func_role_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[v_T_user]    Script Date: 09/25/2018 08:52:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[v_T_user] 
 as 
 select user_name as 姓名,user_passwd as 密码,dept_id as 所有部门
 from T_user
GO
/****** Object:  StoredProcedure [dbo].[p_user_fucn]    Script Date: 09/25/2018 08:52:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[p_user_fucn]
  @user_id char(4)
  as
  select T_func_item.func_name as 功能权限
from T_user,T_func_item,T_user_T_func_role_def,T_func_item_T_func_role_def
where T_user.user_id=T_user_T_func_role_def.user_id and T_user_T_func_role_def.func_role_id=T_func_item_T_func_role_def.func_role_id
 and T_func_item.func_id=T_func_item_T_func_role_def.func_id and T_user.user_name=@user_id
GO
/****** Object:  ForeignKey [FK_T_func_item_T_func_role_def_T_func_item]    Script Date: 09/25/2018 08:52:04 ******/
ALTER TABLE [dbo].[T_func_item_T_func_role_def]  WITH CHECK ADD  CONSTRAINT [FK_T_func_item_T_func_role_def_T_func_item] FOREIGN KEY([func_id])
REFERENCES [dbo].[T_func_item] ([func_id])
GO
ALTER TABLE [dbo].[T_func_item_T_func_role_def] CHECK CONSTRAINT [FK_T_func_item_T_func_role_def_T_func_item]
GO
/****** Object:  ForeignKey [FK_T_func_item_T_func_role_def_T_func_role_def]    Script Date: 09/25/2018 08:52:04 ******/
ALTER TABLE [dbo].[T_func_item_T_func_role_def]  WITH CHECK ADD  CONSTRAINT [FK_T_func_item_T_func_role_def_T_func_role_def] FOREIGN KEY([func_role_id])
REFERENCES [dbo].[T_func_role_def] ([func_role_id])
GO
ALTER TABLE [dbo].[T_func_item_T_func_role_def] CHECK CONSTRAINT [FK_T_func_item_T_func_role_def_T_func_role_def]
GO
