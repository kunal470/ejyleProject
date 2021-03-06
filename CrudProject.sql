USE [master]
GO
/****** Object:  Database [CrudProject]    Script Date: 08-12-2021 23:10:56 ******/
CREATE DATABASE [CrudProject]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CrudProject', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.PUNIT\MSSQL\DATA\CrudProject.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CrudProject_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.PUNIT\MSSQL\DATA\CrudProject_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [CrudProject] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CrudProject].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CrudProject] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CrudProject] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CrudProject] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CrudProject] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CrudProject] SET ARITHABORT OFF 
GO
ALTER DATABASE [CrudProject] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CrudProject] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CrudProject] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CrudProject] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CrudProject] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CrudProject] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CrudProject] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CrudProject] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CrudProject] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CrudProject] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CrudProject] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CrudProject] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CrudProject] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CrudProject] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CrudProject] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CrudProject] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CrudProject] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CrudProject] SET RECOVERY FULL 
GO
ALTER DATABASE [CrudProject] SET  MULTI_USER 
GO
ALTER DATABASE [CrudProject] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CrudProject] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CrudProject] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CrudProject] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CrudProject] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CrudProject] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'CrudProject', N'ON'
GO
ALTER DATABASE [CrudProject] SET QUERY_STORE = OFF
GO
USE [CrudProject]
GO
/****** Object:  Table [dbo].[Shipment]    Script Date: 08-12-2021 23:10:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shipment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SenderName] [nvarchar](50) NULL,
	[Description] [nvarchar](50) NULL,
	[RecipientAddress] [nvarchar](50) NULL,
	[Expedited] [bit] NULL,
	[ShipmentType] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[CreateShipment]    Script Date: 08-12-2021 23:10:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[CreateShipment]
           (@SenderName nvarchar(50)
           ,@Description nvarchar(50)
           ,@RecipientAddress nvarchar(50)
           ,@Expedited bit
           ,@ShipmentType nvarchar(50))
as
INSERT INTO [dbo].[Shipment]
           ([SenderName]
           ,[Description]
           ,[RecipientAddress]
           ,[Expedited]
           ,[ShipmentType])
     VALUES
           (@SenderName
           ,@Description
           ,@RecipientAddress
           ,@Expedited
           ,@ShipmentType)
GO
/****** Object:  StoredProcedure [dbo].[DeleteShipment]    Script Date: 08-12-2021 23:10:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[DeleteShipment]
@Id int
as
DELETE FROM [dbo].[Shipment]
      WHERE Id=@Id


GO
/****** Object:  StoredProcedure [dbo].[GetShipment]    Script Date: 08-12-2021 23:10:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetShipment]
@Id int
as
SELECT [Id]
      ,[SenderName]
      ,[Description]
      ,[RecipientAddress]
      ,[Expedited]
      ,[ShipmentType]
  FROM [dbo].[Shipment]
  where Id=@Id
GO
/****** Object:  StoredProcedure [dbo].[GetShipments]    Script Date: 08-12-2021 23:10:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetShipments]
as
SELECT [Id]
      ,[SenderName]
      ,[Description]
      ,[RecipientAddress]
      ,[Expedited]
      ,[ShipmentType]
  FROM [dbo].[Shipment]

GO
USE [master]
GO
ALTER DATABASE [CrudProject] SET  READ_WRITE 
GO
