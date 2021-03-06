USE [master]
GO
/****** Object:  Database [Punto de venta]    Script Date: 18/09/2017 09:06:01 p.m. ******/
CREATE DATABASE [Punto de venta]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Punto de venta', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Punto de venta.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Punto de venta_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Punto de venta_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Punto de venta] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Punto de venta].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Punto de venta] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Punto de venta] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Punto de venta] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Punto de venta] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Punto de venta] SET ARITHABORT OFF 
GO
ALTER DATABASE [Punto de venta] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Punto de venta] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Punto de venta] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Punto de venta] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Punto de venta] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Punto de venta] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Punto de venta] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Punto de venta] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Punto de venta] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Punto de venta] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Punto de venta] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Punto de venta] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Punto de venta] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Punto de venta] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Punto de venta] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Punto de venta] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Punto de venta] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Punto de venta] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Punto de venta] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Punto de venta] SET  MULTI_USER 
GO
ALTER DATABASE [Punto de venta] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Punto de venta] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Punto de venta] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Punto de venta] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Punto de venta]
GO
/****** Object:  Table [dbo].[Almacenes]    Script Date: 18/09/2017 09:06:01 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Almacenes](
	[Id] [uniqueidentifier] NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Almacenes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DetalleVentaIAP]    Script Date: 18/09/2017 09:06:01 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleVentaIAP](
	[Id] [uniqueidentifier] NOT NULL,
	[IdVenta] [uniqueidentifier] NOT NULL,
	[IdIAP] [uniqueidentifier] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[PrecioUnitario] [float] NOT NULL,
	[Subtotal] [float] NOT NULL,
 CONSTRAINT [PK_DetalleVentaIAP] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Empleados]    Script Date: 18/09/2017 09:06:01 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleados](
	[Id] [uniqueidentifier] NOT NULL,
	[NumeroEmpleado] [int] NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[ApellidoPaterno] [nvarchar](50) NOT NULL,
	[ApellidoMaterno] [nvarchar](50) NOT NULL,
	[FechaDeNacimiento] [date] NULL,
	[Edad] AS (datediff(year, getdate())) 
	[FechaIngreso] [date] NOT NULL,
	[DiasAntiguedad] [int] NOT NULL,
 CONSTRAINT [PK_Empleados] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EstatusVenta]    Script Date: 18/09/2017 09:06:01 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EstatusVenta](
	[Id] [uniqueidentifier] NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_EstatusVenta] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[InventarioAlmacenProductos]    Script Date: 18/09/2017 09:06:01 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InventarioAlmacenProductos](
	[Id] [uniqueidentifier] NOT NULL,
	[IdAlmacen] [uniqueidentifier] NOT NULL,
	[IdProducto] [uniqueidentifier] NOT NULL,
	[Cantidad] [decimal](18, 0) NOT NULL,
 CONSTRAINT [PK_InventarioAlmacenProductos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Productos]    Script Date: 18/09/2017 09:06:01 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[Id] [uniqueidentifier] NOT NULL,
	[CodigoBarras] [decimal](18, 0) NOT NULL,
	[Nombre] [nvarchar](50) NULL,
	[PrecioBase] [float] NULL,
 CONSTRAINT [PK_Productos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Ventas]    Script Date: 18/09/2017 09:06:01 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ventas](
	[Id] [uniqueidentifier] NOT NULL,
	[IdEmpleadoVenta] [uniqueidentifier] NOT NULL,
	[IdEstatus] [uniqueidentifier] NOT NULL,
	[Folio] [decimal](18, 0) NOT NULL,
	[Subtotal] [float] NOT NULL,
	[IVA] [float] NOT NULL,
	[Total] [decimal](18, 0) NOT NULL,
	[FechaHora] [datetime] NOT NULL,
 CONSTRAINT [PK_Ventas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[DetalleVentaIAP]  WITH CHECK ADD  CONSTRAINT [FK_DetalleVentaIAP_InventarioAlmacenProductos] FOREIGN KEY([IdIAP])
REFERENCES [dbo].[InventarioAlmacenProductos] ([Id])
GO
ALTER TABLE [dbo].[DetalleVentaIAP] CHECK CONSTRAINT [FK_DetalleVentaIAP_InventarioAlmacenProductos]
GO
ALTER TABLE [dbo].[DetalleVentaIAP]  WITH CHECK ADD  CONSTRAINT [FK_DetalleVentaIAP_Ventas] FOREIGN KEY([IdVenta])
REFERENCES [dbo].[Ventas] ([Id])
GO
ALTER TABLE [dbo].[DetalleVentaIAP] CHECK CONSTRAINT [FK_DetalleVentaIAP_Ventas]
GO
ALTER TABLE [dbo].[InventarioAlmacenProductos]  WITH CHECK ADD  CONSTRAINT [FK_InventarioAlmacenProductos_Almacenes] FOREIGN KEY([IdAlmacen])
REFERENCES [dbo].[Almacenes] ([Id])
GO
ALTER TABLE [dbo].[InventarioAlmacenProductos] CHECK CONSTRAINT [FK_InventarioAlmacenProductos_Almacenes]
GO
ALTER TABLE [dbo].[InventarioAlmacenProductos]  WITH CHECK ADD  CONSTRAINT [FK_InventarioAlmacenProductos_Productos] FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Productos] ([Id])
GO
ALTER TABLE [dbo].[InventarioAlmacenProductos] CHECK CONSTRAINT [FK_InventarioAlmacenProductos_Productos]
GO
ALTER TABLE [dbo].[Ventas]  WITH CHECK ADD  CONSTRAINT [FK_Ventas_Empleados] FOREIGN KEY([IdEmpleadoVenta])
REFERENCES [dbo].[Empleados] ([Id])
GO
ALTER TABLE [dbo].[Ventas] CHECK CONSTRAINT [FK_Ventas_Empleados]
GO
ALTER TABLE [dbo].[Ventas]  WITH CHECK ADD  CONSTRAINT [FK_Ventas_EstatusVenta] FOREIGN KEY([IdEstatus])
REFERENCES [dbo].[EstatusVenta] ([Id])
GO
ALTER TABLE [dbo].[Ventas] CHECK CONSTRAINT [FK_Ventas_EstatusVenta]
GO
USE [master]
GO
ALTER DATABASE [Punto de venta] SET  READ_WRITE 
GO
