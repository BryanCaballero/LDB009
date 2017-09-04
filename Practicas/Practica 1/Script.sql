Create Database [Hola]
GO

USE [Hola]
GO
/****** Object:  Table [dbo].[Table_1]    Script Date: 28/08/2017 09:54:15 p.m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Table_1]') AND type in (N'U'))
DROP TABLE [dbo].[Table_1]
GO
/****** Object:  Table [dbo].[Table_1]    Script Date: 28/08/2017 09:54:15 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Table_1]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Table_1](
	[Hola] [ntext] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
