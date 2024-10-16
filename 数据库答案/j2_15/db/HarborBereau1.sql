USE [master]
GO
/****** Object:  Database [HarborBereau1]    Script Date: 10/08/2018 08:57:28 ******/
CREATE DATABASE [HarborBereau1] ON  PRIMARY 
( NAME = N'HarborBereau1', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\HarborBereau1.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'HarborBereau1_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\HarborBereau1_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [HarborBereau1] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HarborBereau1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HarborBereau1] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [HarborBereau1] SET ANSI_NULLS OFF
GO
ALTER DATABASE [HarborBereau1] SET ANSI_PADDING OFF
GO
ALTER DATABASE [HarborBereau1] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [HarborBereau1] SET ARITHABORT OFF
GO
ALTER DATABASE [HarborBereau1] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [HarborBereau1] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [HarborBereau1] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [HarborBereau1] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [HarborBereau1] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [HarborBereau1] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [HarborBereau1] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [HarborBereau1] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [HarborBereau1] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [HarborBereau1] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [HarborBereau1] SET  DISABLE_BROKER
GO
ALTER DATABASE [HarborBereau1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [HarborBereau1] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [HarborBereau1] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [HarborBereau1] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [HarborBereau1] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [HarborBereau1] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [HarborBereau1] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [HarborBereau1] SET  READ_WRITE
GO
ALTER DATABASE [HarborBereau1] SET RECOVERY SIMPLE
GO
ALTER DATABASE [HarborBereau1] SET  MULTI_USER
GO
ALTER DATABASE [HarborBereau1] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [HarborBereau1] SET DB_CHAINING OFF
GO
USE [HarborBereau1]
GO
/****** Object:  Table [dbo].[T_business_unit]    Script Date: 10/08/2018 08:57:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_business_unit](
	[businessunit_code] [char](8) NOT NULL,
	[short_name] [varchar](32) NOT NULL,
	[address] [varchar](64) NOT NULL,
	[type] [varchar](50) NOT NULL,
 CONSTRAINT [PK_T_business_unit] PRIMARY KEY CLUSTERED 
(
	[businessunit_code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_fee_unit]    Script Date: 10/08/2018 08:57:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_fee_unit](
	[feeunit_id] [char](8) NOT NULL,
	[feeunit_name] [varchar](64) NOT NULL,
	[feeunit_phone] [varchar](20) NOT NULL,
	[feeunit_address] [varchar](50) NOT NULL,
 CONSTRAINT [PK_T_fee_unit] PRIMARY KEY CLUSTERED 
(
	[feeunit_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_danger_cargo_license]    Script Date: 10/08/2018 08:57:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_danger_cargo_license](
	[license_id] [char](30) NOT NULL,
	[location] [varchar](50) NOT NULL,
	[number] [int] NOT NULL,
	[businessunit_code] [char](8) NOT NULL,
	[address] [varchar](60) NOT NULL,
	[effective_date] [datetime] NOT NULL,
	[licens_department] [varchar](50) NOT NULL,
	[license_date] [datetime] NOT NULL,
	[is_active] [char](2) NOT NULL,
 CONSTRAINT [PK_T_danger_cargo_license] PRIMARY KEY CLUSTERED 
(
	[license_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_business_unit_T_fee_unit]    Script Date: 10/08/2018 08:57:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_business_unit_T_fee_unit](
	[businessunit_code] [char](8) NOT NULL,
	[feeunit_id] [char](8) NOT NULL,
 CONSTRAINT [PK_T_business_unit_T_fee_unit] PRIMARY KEY CLUSTERED 
(
	[businessunit_code] ASC,
	[feeunit_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Default [DF_T_danger_cargo_license_is_active]    Script Date: 10/08/2018 08:57:28 ******/
ALTER TABLE [dbo].[T_danger_cargo_license] ADD  CONSTRAINT [DF_T_danger_cargo_license_is_active]  DEFAULT ('否') FOR [is_active]
GO
/****** Object:  Check [CK_T_business_unit]    Script Date: 10/08/2018 08:57:28 ******/
ALTER TABLE [dbo].[T_business_unit]  WITH CHECK ADD  CONSTRAINT [CK_T_business_unit] CHECK  (([type]='股份制经济' OR [type]='集体经济' OR [type]='个体经济' OR [type]='私营经济' OR [type]='国营经济'))
GO
ALTER TABLE [dbo].[T_business_unit] CHECK CONSTRAINT [CK_T_business_unit]
GO
/****** Object:  ForeignKey [FK_T_danger_cargo_license_T_danger_cargo_license]    Script Date: 10/08/2018 08:57:28 ******/
ALTER TABLE [dbo].[T_danger_cargo_license]  WITH CHECK ADD  CONSTRAINT [FK_T_danger_cargo_license_T_danger_cargo_license] FOREIGN KEY([businessunit_code])
REFERENCES [dbo].[T_business_unit] ([businessunit_code])
GO
ALTER TABLE [dbo].[T_danger_cargo_license] CHECK CONSTRAINT [FK_T_danger_cargo_license_T_danger_cargo_license]
GO
/****** Object:  ForeignKey [FK_T_business_unit_T_fee_unit_T_business_unit]    Script Date: 10/08/2018 08:57:28 ******/
ALTER TABLE [dbo].[T_business_unit_T_fee_unit]  WITH CHECK ADD  CONSTRAINT [FK_T_business_unit_T_fee_unit_T_business_unit] FOREIGN KEY([businessunit_code])
REFERENCES [dbo].[T_business_unit] ([businessunit_code])
GO
ALTER TABLE [dbo].[T_business_unit_T_fee_unit] CHECK CONSTRAINT [FK_T_business_unit_T_fee_unit_T_business_unit]
GO
/****** Object:  ForeignKey [FK_T_business_unit_T_fee_unit_T_fee_unit]    Script Date: 10/08/2018 08:57:28 ******/
ALTER TABLE [dbo].[T_business_unit_T_fee_unit]  WITH CHECK ADD  CONSTRAINT [FK_T_business_unit_T_fee_unit_T_fee_unit] FOREIGN KEY([feeunit_id])
REFERENCES [dbo].[T_fee_unit] ([feeunit_id])
GO
ALTER TABLE [dbo].[T_business_unit_T_fee_unit] CHECK CONSTRAINT [FK_T_business_unit_T_fee_unit_T_fee_unit]
GO
