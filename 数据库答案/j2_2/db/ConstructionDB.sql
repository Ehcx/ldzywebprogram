USE [master]
GO
/****** Object:  Database [ConstructionDB]    Script Date: 09/25/2018 10:33:54 ******/
CREATE DATABASE [ConstructionDB] ON  PRIMARY 
( NAME = N'ConstructionDB', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\ConstructionDB.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ConstructionDB_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\ConstructionDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
/****** Object:  Table [dbo].[T_flow_type]    Script Date: 09/25/2018 10:33:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_flow_type](
	[flow_type_id] [char](3) NOT NULL,
	[flow_type_name] [varchar](64) NOT NULL,
	[in_method_id] [char](3) NOT NULL,
	[in_choice_id] [char](3) NOT NULL,
	[reserve] [varchar](256) NULL,
 CONSTRAINT [PK_T_flow_type] PRIMARY KEY CLUSTERED 
(
	[flow_type_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_flow_step_def]    Script Date: 09/25/2018 10:33:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_flow_step_def](
	[step_no] [int] NOT NULL,
	[step_name] [varchar](30) NOT NULL,
	[step_des] [varchar](64) NULL,
	[limit_time] [int] NOT NULL,
	[url] [varchar](64) NULL,
	[reserve] [varchar](256) NULL,
 CONSTRAINT [PK_T_flow_step_def] PRIMARY KEY CLUSTERED 
(
	[step_no] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_sub_project]    Script Date: 09/25/2018 10:33:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_sub_project](
	[project_id] [varchar](32) NOT NULL,
	[sub_pro_id] [char](2) NOT NULL,
	[flow_type_id] [char](3) NOT NULL,
	[sub_pro_name] [varchar](64) NOT NULL,
	[usb_no] [varchar](64) NOT NULL,
	[in_method_id] [char](3) NOT NULL,
	[in_choice_id] [char](3) NOT NULL,
	[proj_type_id] [char](3) NOT NULL,
	[engi_type_id] [char](3) NOT NULL,
	[pack_type] [char](1) NOT NULL,
	[grade_type_id] [char](1) NOT NULL,
	[flag_done] [char](1) NOT NULL,
	[flag_forcebreak] [char](1) NOT NULL,
	[reserve] [varchar](256) NULL,
 CONSTRAINT [PK_T_sub_project] PRIMARY KEY CLUSTERED 
(
	[project_id] ASC,
	[sub_pro_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N' 1 表示“公开”,2 表示“邀请”' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_sub_project', @level2type=N'COLUMN',@level2name=N'in_method_id'
GO
/****** Object:  Table [dbo].[T_flow_procedure]    Script Date: 09/25/2018 10:33:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_flow_procedure](
	[step_no] [int] NOT NULL,
	[flow_type_id] [char](3) NOT NULL,
	[serial_no] [int] NOT NULL,
	[limit_time] [int] NOT NULL,
	[reserve] [varchar](30) NULL,
 CONSTRAINT [PK_T_flow_procedure] PRIMARY KEY CLUSTERED 
(
	[step_no] ASC,
	[flow_type_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Default [DF_T_sub_project_sub_pro_id]    Script Date: 09/25/2018 10:33:55 ******/
ALTER TABLE [dbo].[T_sub_project] ADD  CONSTRAINT [DF_T_sub_project_sub_pro_id]  DEFAULT ((0)) FOR [sub_pro_id]
GO
/****** Object:  Default [DF_T_sub_project_pack_type]    Script Date: 09/25/2018 10:33:55 ******/
ALTER TABLE [dbo].[T_sub_project] ADD  CONSTRAINT [DF_T_sub_project_pack_type]  DEFAULT ((0)) FOR [pack_type]
GO
/****** Object:  Default [DF_T_sub_project_flag_done]    Script Date: 09/25/2018 10:33:55 ******/
ALTER TABLE [dbo].[T_sub_project] ADD  CONSTRAINT [DF_T_sub_project_flag_done]  DEFAULT ((0)) FOR [flag_done]
GO
/****** Object:  Default [DF_T_sub_project_flag_forcebreak]    Script Date: 09/25/2018 10:33:55 ******/
ALTER TABLE [dbo].[T_sub_project] ADD  CONSTRAINT [DF_T_sub_project_flag_forcebreak]  DEFAULT ((0)) FOR [flag_forcebreak]
GO
/****** Object:  Check [CK_T_flow_type]    Script Date: 09/25/2018 10:33:55 ******/
ALTER TABLE [dbo].[T_flow_type]  WITH CHECK ADD  CONSTRAINT [CK_T_flow_type] CHECK  (([in_method_id]='2' OR [in_method_id]='1'))
GO
ALTER TABLE [dbo].[T_flow_type] CHECK CONSTRAINT [CK_T_flow_type]
GO
/****** Object:  Check [CK_T_flow_type_1]    Script Date: 09/25/2018 10:33:55 ******/
ALTER TABLE [dbo].[T_flow_type]  WITH CHECK ADD  CONSTRAINT [CK_T_flow_type_1] CHECK  (([in_choice_id]='3' OR [in_choice_id]='2' OR [in_choice_id]='1'))
GO
ALTER TABLE [dbo].[T_flow_type] CHECK CONSTRAINT [CK_T_flow_type_1]
GO
/****** Object:  Check [CK_T_sub_project]    Script Date: 09/25/2018 10:33:55 ******/
ALTER TABLE [dbo].[T_sub_project]  WITH CHECK ADD  CONSTRAINT [CK_T_sub_project] CHECK  (([in_method_id]='2' OR [in_method_id]='1'))
GO
ALTER TABLE [dbo].[T_sub_project] CHECK CONSTRAINT [CK_T_sub_project]
GO
/****** Object:  Check [CK_T_sub_project_1]    Script Date: 09/25/2018 10:33:55 ******/
ALTER TABLE [dbo].[T_sub_project]  WITH CHECK ADD  CONSTRAINT [CK_T_sub_project_1] CHECK  (([in_choice_id]='3' OR [in_choice_id]='2' OR [in_choice_id]='1'))
GO
ALTER TABLE [dbo].[T_sub_project] CHECK CONSTRAINT [CK_T_sub_project_1]
GO
/****** Object:  ForeignKey [FK_T_sub_project_T_flow_type]    Script Date: 09/25/2018 10:33:55 ******/
ALTER TABLE [dbo].[T_sub_project]  WITH CHECK ADD  CONSTRAINT [FK_T_sub_project_T_flow_type] FOREIGN KEY([flow_type_id])
REFERENCES [dbo].[T_flow_type] ([flow_type_id])
GO
ALTER TABLE [dbo].[T_sub_project] CHECK CONSTRAINT [FK_T_sub_project_T_flow_type]
GO
/****** Object:  ForeignKey [FK_T_flow_procedure_T_flow_step_def]    Script Date: 09/25/2018 10:33:55 ******/
ALTER TABLE [dbo].[T_flow_procedure]  WITH CHECK ADD  CONSTRAINT [FK_T_flow_procedure_T_flow_step_def] FOREIGN KEY([step_no])
REFERENCES [dbo].[T_flow_step_def] ([step_no])
GO
ALTER TABLE [dbo].[T_flow_procedure] CHECK CONSTRAINT [FK_T_flow_procedure_T_flow_step_def]
GO
/****** Object:  ForeignKey [FK_T_flow_procedure_T_flow_type]    Script Date: 09/25/2018 10:33:55 ******/
ALTER TABLE [dbo].[T_flow_procedure]  WITH CHECK ADD  CONSTRAINT [FK_T_flow_procedure_T_flow_type] FOREIGN KEY([flow_type_id])
REFERENCES [dbo].[T_flow_type] ([flow_type_id])
GO
ALTER TABLE [dbo].[T_flow_procedure] CHECK CONSTRAINT [FK_T_flow_procedure_T_flow_type]
GO
