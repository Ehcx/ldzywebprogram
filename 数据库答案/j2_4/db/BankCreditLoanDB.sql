USE [master]
GO
/****** Object:  Database [BankCreditLoanDB]    Script Date: 09/27/2018 08:51:33 ******/
CREATE DATABASE [BankCreditLoanDB] ON  PRIMARY 
( NAME = N'BankCreditLoanDB', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\BankCreditLoanDB.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BankCreditLoanDB_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\BankCreditLoanDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BankCreditLoanDB] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BankCreditLoanDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BankCreditLoanDB] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [BankCreditLoanDB] SET ANSI_NULLS OFF
GO
ALTER DATABASE [BankCreditLoanDB] SET ANSI_PADDING OFF
GO
ALTER DATABASE [BankCreditLoanDB] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [BankCreditLoanDB] SET ARITHABORT OFF
GO
ALTER DATABASE [BankCreditLoanDB] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [BankCreditLoanDB] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [BankCreditLoanDB] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [BankCreditLoanDB] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [BankCreditLoanDB] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [BankCreditLoanDB] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [BankCreditLoanDB] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [BankCreditLoanDB] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [BankCreditLoanDB] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [BankCreditLoanDB] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [BankCreditLoanDB] SET  DISABLE_BROKER
GO
ALTER DATABASE [BankCreditLoanDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [BankCreditLoanDB] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [BankCreditLoanDB] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [BankCreditLoanDB] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [BankCreditLoanDB] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [BankCreditLoanDB] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [BankCreditLoanDB] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [BankCreditLoanDB] SET  READ_WRITE
GO
ALTER DATABASE [BankCreditLoanDB] SET RECOVERY SIMPLE
GO
ALTER DATABASE [BankCreditLoanDB] SET  MULTI_USER
GO
ALTER DATABASE [BankCreditLoanDB] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [BankCreditLoanDB] SET DB_CHAINING OFF
GO
USE [BankCreditLoanDB]
GO
/****** Object:  Table [dbo].[T_customer_info]    Script Date: 09/27/2018 08:51:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_customer_info](
	[cust_id] [char](10) NOT NULL,
	[cust_name] [varchar](60) NOT NULL,
	[legal_name] [varchar](10) NOT NULL,
	[reg_address] [varchar](60) NOT NULL,
	[post_code] [char](6) NOT NULL,
 CONSTRAINT [PK_T_customer_info] PRIMARY KEY CLUSTERED 
(
	[cust_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_agency_info]    Script Date: 09/27/2018 08:51:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_agency_info](
	[agency_id] [char](3) NOT NULL,
	[agency_name] [varchar](10) NOT NULL,
	[agency_level] [char](2) NOT NULL,
	[agency_phone] [varchar](20) NOT NULL,
 CONSTRAINT [PK_T_agency_info] PRIMARY KEY CLUSTERED 
(
	[agency_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_impawn_info]    Script Date: 09/27/2018 08:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_impawn_info](
	[borrow_id] [char](10) NOT NULL,
	[cust_id] [char](10) NOT NULL,
	[agency_id] [char](3) NOT NULL,
	[pawn_goods_name] [varchar](60) NOT NULL,
	[pawn_goods_num] [int] NOT NULL,
	[contract_date] [datetime] NOT NULL,
 CONSTRAINT [PK_T_impawn_info] PRIMARY KEY CLUSTERED 
(
	[borrow_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Check [CK_T_customer_info]    Script Date: 09/27/2018 08:51:33 ******/
ALTER TABLE [dbo].[T_customer_info]  WITH CHECK ADD  CONSTRAINT [CK_T_customer_info] CHECK  (([post_code] like '[0-9][0-9][0-9][0-9][0-9][0-9]'))
GO
ALTER TABLE [dbo].[T_customer_info] CHECK CONSTRAINT [CK_T_customer_info]
GO
/****** Object:  ForeignKey [fk_T_impawn_info_T_agency_info_agency_id]    Script Date: 09/27/2018 08:51:34 ******/
ALTER TABLE [dbo].[T_impawn_info]  WITH CHECK ADD  CONSTRAINT [fk_T_impawn_info_T_agency_info_agency_id] FOREIGN KEY([agency_id])
REFERENCES [dbo].[T_agency_info] ([agency_id])
GO
ALTER TABLE [dbo].[T_impawn_info] CHECK CONSTRAINT [fk_T_impawn_info_T_agency_info_agency_id]
GO
/****** Object:  ForeignKey [fk_T_impawn_info_T_customer_info_cust_id]    Script Date: 09/27/2018 08:51:34 ******/
ALTER TABLE [dbo].[T_impawn_info]  WITH CHECK ADD  CONSTRAINT [fk_T_impawn_info_T_customer_info_cust_id] FOREIGN KEY([cust_id])
REFERENCES [dbo].[T_customer_info] ([cust_id])
GO
ALTER TABLE [dbo].[T_impawn_info] CHECK CONSTRAINT [fk_T_impawn_info_T_customer_info_cust_id]
GO
