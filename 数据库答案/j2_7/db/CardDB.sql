USE [master]
GO
/****** Object:  Database [CardDB]    Script Date: 09/28/2018 09:48:45 ******/
CREATE DATABASE [CardDB] ON  PRIMARY 
( NAME = N'CardDB', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\CardDB.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CardDB_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\CardDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CardDB] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CardDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CardDB] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [CardDB] SET ANSI_NULLS OFF
GO
ALTER DATABASE [CardDB] SET ANSI_PADDING OFF
GO
ALTER DATABASE [CardDB] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [CardDB] SET ARITHABORT OFF
GO
ALTER DATABASE [CardDB] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [CardDB] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [CardDB] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [CardDB] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [CardDB] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [CardDB] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [CardDB] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [CardDB] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [CardDB] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [CardDB] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [CardDB] SET  DISABLE_BROKER
GO
ALTER DATABASE [CardDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [CardDB] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [CardDB] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [CardDB] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [CardDB] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [CardDB] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [CardDB] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [CardDB] SET  READ_WRITE
GO
ALTER DATABASE [CardDB] SET RECOVERY SIMPLE
GO
ALTER DATABASE [CardDB] SET  MULTI_USER
GO
ALTER DATABASE [CardDB] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [CardDB] SET DB_CHAINING OFF
GO
USE [CardDB]
GO
/****** Object:  Table [dbo].[T_card]    Script Date: 09/28/2018 09:48:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_card](
	[card_id] [int] IDENTITY(1,1) NOT NULL,
	[student_id] [int] NOT NULL,
	[student_name] [varchar](50) NOT NULL,
	[curr_money] [money] NOT NULL,
	[register_date] [datetime] NOT NULL,
 CONSTRAINT [PK_T_card] PRIMARY KEY CLUSTERED 
(
	[card_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_consume_money]    Script Date: 09/28/2018 09:48:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_consume_money](
	[consume_id] [int] NOT NULL,
	[card_id] [int] NOT NULL,
	[the_money] [money] NOT NULL,
	[register_date] [datetime] NOT NULL,
 CONSTRAINT [PK_T_consume_money] PRIMARY KEY CLUSTERED 
(
	[consume_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_add_money]    Script Date: 09/28/2018 09:48:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_add_money](
	[add_id] [int] NOT NULL,
	[card_id] [int] NOT NULL,
	[the_money] [money] NOT NULL,
	[register_date] [datetime] NOT NULL,
 CONSTRAINT [PK_T_add_money] PRIMARY KEY CLUSTERED 
(
	[add_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Default [DF_T_card_register_date]    Script Date: 09/28/2018 09:48:46 ******/
ALTER TABLE [dbo].[T_card] ADD  CONSTRAINT [DF_T_card_register_date]  DEFAULT (getdate()) FOR [register_date]
GO
/****** Object:  Default [DF_T_consume_money_register_date]    Script Date: 09/28/2018 09:48:46 ******/
ALTER TABLE [dbo].[T_consume_money] ADD  CONSTRAINT [DF_T_consume_money_register_date]  DEFAULT (getdate()) FOR [register_date]
GO
/****** Object:  Default [DF_T_add_money_register_date]    Script Date: 09/28/2018 09:48:46 ******/
ALTER TABLE [dbo].[T_add_money] ADD  CONSTRAINT [DF_T_add_money_register_date]  DEFAULT (getdate()) FOR [register_date]
GO
/****** Object:  Check [CK_T_add_money]    Script Date: 09/28/2018 09:48:46 ******/
ALTER TABLE [dbo].[T_add_money]  WITH CHECK ADD  CONSTRAINT [CK_T_add_money] CHECK  (([the_money]>=(50) AND [the_money]<=(200)))
GO
ALTER TABLE [dbo].[T_add_money] CHECK CONSTRAINT [CK_T_add_money]
GO
/****** Object:  ForeignKey [FK_T_consume_money_T_card]    Script Date: 09/28/2018 09:48:46 ******/
ALTER TABLE [dbo].[T_consume_money]  WITH CHECK ADD  CONSTRAINT [FK_T_consume_money_T_card] FOREIGN KEY([card_id])
REFERENCES [dbo].[T_card] ([card_id])
GO
ALTER TABLE [dbo].[T_consume_money] CHECK CONSTRAINT [FK_T_consume_money_T_card]
GO
/****** Object:  ForeignKey [FK_T_add_money_T_card]    Script Date: 09/28/2018 09:48:46 ******/
ALTER TABLE [dbo].[T_add_money]  WITH CHECK ADD  CONSTRAINT [FK_T_add_money_T_card] FOREIGN KEY([add_id])
REFERENCES [dbo].[T_card] ([card_id])
GO
ALTER TABLE [dbo].[T_add_money] CHECK CONSTRAINT [FK_T_add_money_T_card]
GO
