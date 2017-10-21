USE [master]
GO

/****** Object:  Database [Hoy]    Script Date: 21/10/2017 12:06:19 p.m. ******/
CREATE DATABASE [Hoy]
GO

ALTER DATABASE [Hoy] SET COMPATIBILITY_LEVEL = 110
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Hoy].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [Hoy] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [Hoy] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [Hoy] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [Hoy] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [Hoy] SET ARITHABORT OFF 
GO

ALTER DATABASE [Hoy] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [Hoy] SET AUTO_CREATE_STATISTICS ON 
GO

ALTER DATABASE [Hoy] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [Hoy] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [Hoy] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [Hoy] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [Hoy] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [Hoy] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [Hoy] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [Hoy] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [Hoy] SET  DISABLE_BROKER 
GO

ALTER DATABASE [Hoy] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [Hoy] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [Hoy] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [Hoy] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [Hoy] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [Hoy] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [Hoy] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [Hoy] SET RECOVERY SIMPLE 
GO

ALTER DATABASE [Hoy] SET  MULTI_USER 
GO

ALTER DATABASE [Hoy] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [Hoy] SET DB_CHAINING OFF 
GO

ALTER DATABASE [Hoy] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [Hoy] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO

ALTER DATABASE [Hoy] SET  READ_WRITE 
GO


