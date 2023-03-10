USE [master]
GO
/****** Object:  Database [3Tablas]    Script Date: 09/03/2023 01:50:25 p. m. ******/
CREATE DATABASE [MestroDetalle]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'3Tablas', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\3Tablas.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'3Tablas_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\3Tablas_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [3Tablas] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [3Tablas].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [3Tablas] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [3Tablas] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [3Tablas] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [3Tablas] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [3Tablas] SET ARITHABORT OFF 
GO
ALTER DATABASE [3Tablas] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [3Tablas] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [3Tablas] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [3Tablas] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [3Tablas] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [3Tablas] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [3Tablas] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [3Tablas] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [3Tablas] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [3Tablas] SET  ENABLE_BROKER 
GO
ALTER DATABASE [3Tablas] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [3Tablas] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [3Tablas] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [3Tablas] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [3Tablas] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [3Tablas] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [3Tablas] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [3Tablas] SET RECOVERY FULL 
GO
ALTER DATABASE [3Tablas] SET  MULTI_USER 
GO
ALTER DATABASE [3Tablas] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [3Tablas] SET DB_CHAINING OFF 
GO
ALTER DATABASE [3Tablas] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [3Tablas] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [3Tablas] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [3Tablas] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'3Tablas', N'ON'
GO
ALTER DATABASE [3Tablas] SET QUERY_STORE = OFF
GO
USE [3Tablas]
GO
/****** Object:  Table [dbo].[Direccion]    Script Date: 09/03/2023 01:50:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Direccion](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Calle] [varchar](50) NOT NULL,
	[Colonia] [varchar](50) NOT NULL,
	[Cp] [int] NOT NULL,
	[NumInterior] [varchar](50) NOT NULL,
	[NumExterior] [varchar](50) NOT NULL,
	[IdPersona] [int] NOT NULL,
 CONSTRAINT [PK_Direccion] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Personas]    Script Date: 09/03/2023 01:50:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Personas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[ApellidoPaterno] [varchar](50) NOT NULL,
	[ApellidoMaterno] [varchar](50) NOT NULL,
	[Edad] [int] NOT NULL,
 CONSTRAINT [PK_Personas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Telefonos]    Script Date: 09/03/2023 01:50:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Telefonos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NumeroCelular] [varchar](50) NOT NULL,
	[NumeroFijo] [varchar](50) NOT NULL,
	[IdPersona] [int] NOT NULL,
 CONSTRAINT [PK_Telefonos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Direccion]  WITH CHECK ADD  CONSTRAINT [FK_Direccion_Personas] FOREIGN KEY([IdPersona])
REFERENCES [dbo].[Personas] ([Id])
GO
ALTER TABLE [dbo].[Direccion] CHECK CONSTRAINT [FK_Direccion_Personas]
GO
ALTER TABLE [dbo].[Telefonos]  WITH CHECK ADD  CONSTRAINT [FK_Telefonos_Personas] FOREIGN KEY([IdPersona])
REFERENCES [dbo].[Personas] ([Id])
GO
ALTER TABLE [dbo].[Telefonos] CHECK CONSTRAINT [FK_Telefonos_Personas]
GO
USE [master]
GO
ALTER DATABASE [3Tablas] SET  READ_WRITE 
GO
