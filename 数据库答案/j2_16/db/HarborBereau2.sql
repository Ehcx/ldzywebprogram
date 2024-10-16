USE [master]
GO
/****** Object:  Database [HarborBereau2]    Script Date: 10/08/2018 10:45:21 ******/
CREATE DATABASE [HarborBereau2] ON  PRIMARY 
( NAME = N'HarborBereau2', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\HarborBereau2.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'HarborBereau2_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\HarborBereau2_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [HarborBereau2] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HarborBereau2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HarborBereau2] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [HarborBereau2] SET ANSI_NULLS OFF
GO
ALTER DATABASE [HarborBereau2] SET ANSI_PADDING OFF
GO
ALTER DATABASE [HarborBereau2] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [HarborBereau2] SET ARITHABORT OFF
GO
ALTER DATABASE [HarborBereau2] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [HarborBereau2] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [HarborBereau2] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [HarborBereau2] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [HarborBereau2] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [HarborBereau2] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [HarborBereau2] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [HarborBereau2] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [HarborBereau2] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [HarborBereau2] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [HarborBereau2] SET  DISABLE_BROKER
GO
ALTER DATABASE [HarborBereau2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [HarborBereau2] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [HarborBereau2] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [HarborBereau2] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [HarborBereau2] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [HarborBereau2] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [HarborBereau2] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [HarborBereau2] SET  READ_WRITE
GO
ALTER DATABASE [HarborBereau2] SET RECOVERY SIMPLE
GO
ALTER DATABASE [HarborBereau2] SET  MULTI_USER
GO
ALTER DATABASE [HarborBereau2] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [HarborBereau2] SET DB_CHAINING OFF
GO
USE [HarborBereau2]
GO
/****** Object:  Table [dbo].[T_ship]    Script Date: 10/08/2018 10:45:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_ship](
	[ship_code] [char](8) NOT NULL,
	[ship_name] [varchar](40) NOT NULL,
	[ship_nationality] [varchar](32) NOT NULL,
	[checked_capacity] [int] NOT NULL,
	[built_date] [datetime] NOT NULL,
	[suited_area] [varchar](20) NOT NULL,
	[is_new] [char](2) NOT NULL,
 CONSTRAINT [PK_T_ship] PRIMARY KEY CLUSTERED 
(
	[ship_code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_line]    Script Date: 10/08/2018 10:45:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_line](
	[line_code] [char](8) NOT NULL,
	[line_name] [varchar](64) NOT NULL,
	[line_type] [varchar](10) NOT NULL,
 CONSTRAINT [PK_T_line] PRIMARY KEY CLUSTERED 
(
	[line_code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_business_unit]    Script Date: 10/08/2018 10:45:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_business_unit](
	[business_unit_code] [char](8) NOT NULL,
	[short_name] [varchar](32) NOT NULL,
	[address] [varchar](64) NOT NULL,
	[business_unit_type] [varchar](50) NOT NULL,
 CONSTRAINT [PK_T_business_unit] PRIMARY KEY CLUSTERED 
(
	[business_unit_code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_vehicle_declare]    Script Date: 10/08/2018 10:45:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_vehicle_declare](
	[declare_no] [char](8) NOT NULL,
	[business_unit_code] [char](8) NOT NULL,
	[line_code] [char](8) NOT NULL,
	[ship_code] [char](8) NOT NULL,
	[voyage_code] [char](10) NOT NULL,
	[inout_port] [varchar](8) NOT NULL,
	[inout_port_date] [datetime] NOT NULL,
	[outsize_vehicle_qty] [int] NULL,
	[large_vehicle_qty] [int] NULL,
	[medium_vehicle_qty] [int] NULL,
	[small_vehicle_qty] [int] NULL,
	[embed_vehicle_qty] [int] NULL,
	[container_qty] [int] NULL,
	[declarer] [varchar](16) NOT NULL,
	[declare_date] [datetime] NOT NULL,
	[last_update_date] [datetime] NOT NULL,
	[remark] [varchar](64) NULL,
 CONSTRAINT [PK_T_vehicle_declare] PRIMARY KEY CLUSTERED 
(
	[declare_no] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Default [DF_T_ship_checked_capacity]    Script Date: 10/08/2018 10:45:22 ******/
ALTER TABLE [dbo].[T_ship] ADD  CONSTRAINT [DF_T_ship_checked_capacity]  DEFAULT ((0)) FOR [checked_capacity]
GO
/****** Object:  Default [DF_T_ship_is_new]    Script Date: 10/08/2018 10:45:22 ******/
ALTER TABLE [dbo].[T_ship] ADD  CONSTRAINT [DF_T_ship_is_new]  DEFAULT ('‘否’') FOR [is_new]
GO
/****** Object:  Default [DF_T_vehicle_declare_declare_date]    Script Date: 10/08/2018 10:45:22 ******/
ALTER TABLE [dbo].[T_vehicle_declare] ADD  CONSTRAINT [DF_T_vehicle_declare_declare_date]  DEFAULT (getdate()) FOR [declare_date]
GO
/****** Object:  Check [CK_T_ship]    Script Date: 10/08/2018 10:45:22 ******/
ALTER TABLE [dbo].[T_ship]  WITH CHECK ADD  CONSTRAINT [CK_T_ship] CHECK  (([is_new]='否' OR [is_new]='是'))
GO
ALTER TABLE [dbo].[T_ship] CHECK CONSTRAINT [CK_T_ship]
GO
/****** Object:  Check [CK_T_ship_1]    Script Date: 10/08/2018 10:45:22 ******/
ALTER TABLE [dbo].[T_ship]  WITH CHECK ADD  CONSTRAINT [CK_T_ship_1] CHECK  (([checked_capacity]>=(0) AND [checked_capacity]<=(5000)))
GO
ALTER TABLE [dbo].[T_ship] CHECK CONSTRAINT [CK_T_ship_1]
GO
/****** Object:  Check [CK_T_business_unit]    Script Date: 10/08/2018 10:45:22 ******/
ALTER TABLE [dbo].[T_business_unit]  WITH CHECK ADD  CONSTRAINT [CK_T_business_unit] CHECK  (([business_unit_type]='股份制经济' OR [business_unit_type]='集体经济' OR [business_unit_type]='个体经济' OR [business_unit_type]='私营经济' OR [business_unit_type]='国营经济'))
GO
ALTER TABLE [dbo].[T_business_unit] CHECK CONSTRAINT [CK_T_business_unit]
GO
/****** Object:  Check [CK_T_vehicle_declare]    Script Date: 10/08/2018 10:45:22 ******/
ALTER TABLE [dbo].[T_vehicle_declare]  WITH CHECK ADD  CONSTRAINT [CK_T_vehicle_declare] CHECK  (([inout_port]='出港' OR [inout_port]='进港'))
GO
ALTER TABLE [dbo].[T_vehicle_declare] CHECK CONSTRAINT [CK_T_vehicle_declare]
GO
/****** Object:  ForeignKey [FK_T_vehicle_declare_T_business_unit]    Script Date: 10/08/2018 10:45:22 ******/
ALTER TABLE [dbo].[T_vehicle_declare]  WITH CHECK ADD  CONSTRAINT [FK_T_vehicle_declare_T_business_unit] FOREIGN KEY([business_unit_code])
REFERENCES [dbo].[T_business_unit] ([business_unit_code])
GO
ALTER TABLE [dbo].[T_vehicle_declare] CHECK CONSTRAINT [FK_T_vehicle_declare_T_business_unit]
GO
/****** Object:  ForeignKey [FK_T_vehicle_declare_T_line]    Script Date: 10/08/2018 10:45:22 ******/
ALTER TABLE [dbo].[T_vehicle_declare]  WITH CHECK ADD  CONSTRAINT [FK_T_vehicle_declare_T_line] FOREIGN KEY([line_code])
REFERENCES [dbo].[T_line] ([line_code])
GO
ALTER TABLE [dbo].[T_vehicle_declare] CHECK CONSTRAINT [FK_T_vehicle_declare_T_line]
GO
/****** Object:  ForeignKey [FK_T_vehicle_declare_T_ship]    Script Date: 10/08/2018 10:45:22 ******/
ALTER TABLE [dbo].[T_vehicle_declare]  WITH CHECK ADD  CONSTRAINT [FK_T_vehicle_declare_T_ship] FOREIGN KEY([ship_code])
REFERENCES [dbo].[T_ship] ([ship_code])
GO
ALTER TABLE [dbo].[T_vehicle_declare] CHECK CONSTRAINT [FK_T_vehicle_declare_T_ship]
GO
