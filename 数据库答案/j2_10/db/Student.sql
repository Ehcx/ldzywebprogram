USE [master]
GO
/****** Object:  Database [Student]    Script Date: 09/29/2018 10:52:48 ******/
CREATE DATABASE [Student] ON  PRIMARY 
( NAME = N'Student', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\Student.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Student_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\Student_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Student] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Student].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Student] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [Student] SET ANSI_NULLS OFF
GO
ALTER DATABASE [Student] SET ANSI_PADDING OFF
GO
ALTER DATABASE [Student] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [Student] SET ARITHABORT OFF
GO
ALTER DATABASE [Student] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [Student] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [Student] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [Student] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [Student] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [Student] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [Student] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [Student] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [Student] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [Student] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [Student] SET  DISABLE_BROKER
GO
ALTER DATABASE [Student] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [Student] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [Student] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [Student] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [Student] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [Student] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [Student] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [Student] SET  READ_WRITE
GO
ALTER DATABASE [Student] SET RECOVERY SIMPLE
GO
ALTER DATABASE [Student] SET  MULTI_USER
GO
ALTER DATABASE [Student] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [Student] SET DB_CHAINING OFF
GO
USE [Student]
GO
/****** Object:  Table [dbo].[T_student_info]    Script Date: 09/29/2018 10:52:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_student_info](
	[student_no] [char](6) NOT NULL,
	[student_name] [char](20) NOT NULL,
	[sex] [char](2) NOT NULL,
	[birth] [datetime] NOT NULL,
	[enter_date] [int] NOT NULL,
	[address] [varchar](50) NOT NULL,
 CONSTRAINT [PK_T_student_info] PRIMARY KEY CLUSTERED 
(
	[student_no] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_course_info]    Script Date: 09/29/2018 10:52:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_course_info](
	[course_no] [char](8) NOT NULL,
	[course_name] [char](50) NOT NULL,
	[credit] [int] NOT NULL,
	[classhour] [int] NOT NULL,
 CONSTRAINT [PK_T_course_info] PRIMARY KEY CLUSTERED 
(
	[course_no] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_student_scores]    Script Date: 09/29/2018 10:52:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_student_scores](
	[course_no] [char](8) NOT NULL,
	[student_no] [char](6) NOT NULL,
	[ordinary_scores] [float] NULL,
	[end_scores] [float] NULL,
	[total_scores] [float] NULL,
 CONSTRAINT [PK_T_student_scores] PRIMARY KEY CLUSTERED 
(
	[course_no] ASC,
	[student_no] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  ForeignKey [FK_T_student_scores_T_course_info]    Script Date: 09/29/2018 10:52:48 ******/
ALTER TABLE [dbo].[T_student_scores]  WITH CHECK ADD  CONSTRAINT [FK_T_student_scores_T_course_info] FOREIGN KEY([course_no])
REFERENCES [dbo].[T_course_info] ([course_no])
GO
ALTER TABLE [dbo].[T_student_scores] CHECK CONSTRAINT [FK_T_student_scores_T_course_info]
GO
/****** Object:  ForeignKey [FK_T_student_scores_T_student_info]    Script Date: 09/29/2018 10:52:48 ******/
ALTER TABLE [dbo].[T_student_scores]  WITH CHECK ADD  CONSTRAINT [FK_T_student_scores_T_student_info] FOREIGN KEY([student_no])
REFERENCES [dbo].[T_student_info] ([student_no])
GO
ALTER TABLE [dbo].[T_student_scores] CHECK CONSTRAINT [FK_T_student_scores_T_student_info]
GO
