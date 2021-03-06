USE [master]
GO
/****** Object:  Database [Despensa]    Script Date: 04/09/2017 09:48:48 p.m. ******/
CREATE DATABASE [Despensa]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Tablotas', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Tablotas.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Tablotas_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Tablotas_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Despensa] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Despensa].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Despensa] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Despensa] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Despensa] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Despensa] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Despensa] SET ARITHABORT OFF 
GO
ALTER DATABASE [Despensa] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Despensa] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Despensa] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Despensa] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Despensa] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Despensa] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Despensa] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Despensa] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Despensa] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Despensa] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Despensa] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Despensa] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Despensa] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Despensa] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Despensa] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Despensa] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Despensa] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Despensa] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Despensa] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Despensa] SET  MULTI_USER 
GO
ALTER DATABASE [Despensa] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Despensa] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Despensa] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Despensa] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Despensa]
GO
/****** Object:  Table [dbo].[Id_ciente]    Script Date: 04/09/2017 09:48:48 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Id_ciente](
	[idDeCliente] [uniqueidentifier] NOT NULL,
	[NombreDeComprador] [nvarchar](50) NULL,
	[ApellidosDeComprador] [nvarchar](50) NULL,
	[DineroAGastar] [float] NOT NULL,
	[DineroEnTarjeta] [float] NULL
	[DineroPosible] [float] AS (datediff(DineroEnTarjeta, (DineroAGastar))
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Id_ciudad]    Script Date: 04/09/2017 09:48:48 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Id ciudad](
	[IdDeCiudad] [uniqueidentifier] NOT NULL,
	[NombreCiudad] [nvarchar](50) NOT NULL,
	[CantidadDeSucursales] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Id_global]    Script Date: 04/09/2017 09:48:48 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Id global](
	[IdDeSucursal] [uniqueidentifier] NULL,
	[MejorPaisDeVenta] [nvarchar](50) NOT NULL,
	[ElPaisSacaGanancias] [bit] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Id_local]    Script Date: 04/09/2017 09:48:48 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Id_local](
	[IdDeLocal] [uniqueidentifier] NOT NULL,
	[DineroGanado] [money] NULL,
	select IdDeLocal from Id_local WHERE DineroGanado>2000 Order by DineroGanado asc,desc;  
	[ProductorCreados] [decimal](18, 0) NULL,
	[FechaDeCreacion] [timestamp] NOT NULL,
	[FechaDeVencimiento] [date] NULL
	[DiferenciaDeMeses] AS (datediff(FechaDeCreacion, FechaDeVencimieno)) 
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Id_municipio]    Script Date: 04/09/2017 09:48:48 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Id_municipio](
	[IdMunicipio] [uniqueidentifier] NOT NULL,
	[nombreDelMunicipio] [nvarchar](50) NOT NULL,
	[CantidadDeSucursales] [int] NOT NULL
	select CantidadDeSucursales - id.pais(CantidadDeSucursales) as DifEntreSucursales from Id_municipio
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Id_pais]    Script Date: 04/09/2017 09:48:48 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Id_pais](
	[IdDePais] [uniqueidentifier] NOT NULL,
	[NombreDelPais] [nvarchar](50) NOT NULL,
	[CantidadDeSucursales] [decimal](18, 0) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Id producto]    Script Date: 04/09/2017 09:48:48 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Id producto](
	[IdProducto] [uniqueidentifier] NOT NULL,
	[NombreDelProducto] [nvarchar](50) NULL,
	[ProductosPorSucursal] [tinyint] NULL,
	[TipoDeProducto] [text] NOT NULL
	[Precio de producto] [float] NOT NULL
	[PrecioConIva] as [PrecioDeProducto] * [1.16];
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
USE [master]
GO
ALTER DATABASE [Despensa] SET  READ_WRITE 
GO
CREATE INDEX Indx_ID_PRODUCTO 
ON Id producto (Id producto);
GO

