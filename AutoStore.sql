USE [master]
GO
/****** Object:  Database [Prototipo]    Script Date: 31/08/2016 9:43:07 a. m. ******/
CREATE DATABASE [Prototipo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Prototipo', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.CARLOS\MSSQL\DATA\Prototipo.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Prototipo_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.CARLOS\MSSQL\DATA\Prototipo_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Prototipo] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Prototipo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Prototipo] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Prototipo] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Prototipo] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Prototipo] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Prototipo] SET ARITHABORT OFF 
GO
ALTER DATABASE [Prototipo] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Prototipo] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Prototipo] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Prototipo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Prototipo] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Prototipo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Prototipo] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Prototipo] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Prototipo] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Prototipo] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Prototipo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Prototipo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Prototipo] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Prototipo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Prototipo] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Prototipo] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Prototipo] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Prototipo] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Prototipo] SET  MULTI_USER 
GO
ALTER DATABASE [Prototipo] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Prototipo] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Prototipo] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Prototipo] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Prototipo] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Prototipo]
GO
/****** Object:  Table [dbo].[Domicilio]    Script Date: 31/08/2016 9:43:08 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Domicilio](
	[IdDomicilio] [int] IDENTITY(1,1) NOT NULL,
	[IdPersona] [int] NOT NULL,
	[IdFactura] [int] NOT NULL,
	[Fecha] [date] NOT NULL,
	[Direccion] [varchar](50) NOT NULL,
	[Ciudad] [varchar](50) NOT NULL,
	[Observaciones] [varchar](200) NULL,
 CONSTRAINT [PK_Domicilio] PRIMARY KEY CLUSTERED 
(
	[IdDomicilio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Factura]    Script Date: 31/08/2016 9:43:08 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Factura](
	[IdFactura] [int] IDENTITY(1,1) NOT NULL,
	[IdProducto] [int] NOT NULL,
	[IdPersona] [int] NOT NULL,
	[NombrePersona] [varchar](50) NOT NULL,
	[ApellidoPersona] [varchar](50) NOT NULL,
	[Fecha] [date] NOT NULL,
	[NombreProducto] [varchar](50) NOT NULL,
	[PrecioTotal] [int] NOT NULL,
 CONSTRAINT [PK_Factura] PRIMARY KEY CLUSTERED 
(
	[IdFactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Marca]    Script Date: 31/08/2016 9:43:08 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Marca](
	[IdMarca] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Marca] PRIMARY KEY CLUSTERED 
(
	[IdMarca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 31/08/2016 9:43:08 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Producto](
	[IdProducto] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Precio] [int] NOT NULL,
	[CodMarca] [int] NOT NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 31/08/2016 9:43:08 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuario](
	[IdPersona] [int] IDENTITY(1,1) NOT NULL,
	[Usuario] [varchar](50) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellido] [varchar](50) NOT NULL,
	[Direccion] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Telefono] [varchar](50) NOT NULL,
	[Clave] [varchar](50) NOT NULL,
	[Activo] [bit] NOT NULL,
	[Rol] [bit] NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[IdPersona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [Uni_Usuario] UNIQUE NONCLUSTERED 
(
	[Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Domicilio]  WITH CHECK ADD  CONSTRAINT [FK_Domicilio_Factura] FOREIGN KEY([IdFactura])
REFERENCES [dbo].[Factura] ([IdFactura])
GO
ALTER TABLE [dbo].[Domicilio] CHECK CONSTRAINT [FK_Domicilio_Factura]
GO
ALTER TABLE [dbo].[Factura]  WITH CHECK ADD  CONSTRAINT [FK_Factura_Producto] FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Producto] ([IdProducto])
GO
ALTER TABLE [dbo].[Factura] CHECK CONSTRAINT [FK_Factura_Producto]
GO
ALTER TABLE [dbo].[Factura]  WITH CHECK ADD  CONSTRAINT [FK_Factura_Usuario] FOREIGN KEY([IdPersona])
REFERENCES [dbo].[Usuario] ([IdPersona])
GO
ALTER TABLE [dbo].[Factura] CHECK CONSTRAINT [FK_Factura_Usuario]
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [FK_Producto_Marca] FOREIGN KEY([CodMarca])
REFERENCES [dbo].[Marca] ([IdMarca])
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [FK_Producto_Marca]
GO
/****** Object:  StoredProcedure [dbo].[ActualizarProducto]    Script Date: 31/08/2016 9:43:08 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ActualizarProducto]

@IdProducto int,
@Nombre varchar(50),
@Precio int,
@CodMarca int

as update Producto set Nombre=@Nombre, Precio=@Precio, CodMarca=@CodMarca where IdProducto= @IdProducto




GO
/****** Object:  StoredProcedure [dbo].[ActualizarUsuario]    Script Date: 31/08/2016 9:43:08 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[ActualizarUsuario] (@Activo bit, @Nombre varchar(20))
as
begin
	update Usuario
	set Activo = @Activo
	where Nombre = @Nombre
	
end

GO
/****** Object:  StoredProcedure [dbo].[BuscarProducto]    Script Date: 31/08/2016 9:43:08 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[BuscarProducto]
AS
BEGIN
	
	SELECT c.IdProducto, c.Nombre, c.Precio
	FROM Producto c
END


GO
/****** Object:  StoredProcedure [dbo].[EliminarProducto]    Script Date: 31/08/2016 9:43:08 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[EliminarProducto]
@IdProducto int

as delete from Producto where IdProducto=@IdProducto




GO
/****** Object:  StoredProcedure [dbo].[InicioSesion1]    Script Date: 31/08/2016 9:43:08 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[InicioSesion1]
(@userName varchar(20), @userPassword varchar (20))
AS
BEGIN
SELECT Nombre, Clave
FROM Usuario
WHERE @userName = Nombre and @userPassword = Clave
END



GO
/****** Object:  StoredProcedure [dbo].[InsertarMarca]    Script Date: 31/08/2016 9:43:08 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[InsertarMarca]
(
@IdCatalogo int,
@Nombre Varchar(20)
)
AS
Insert Into Marca
(
IdCatalogo,Nombre
)
Values
(
@IdCatalogo,@Nombre
)


GO
/****** Object:  StoredProcedure [dbo].[InsertarProducto]    Script Date: 31/08/2016 9:43:08 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertarProducto]
@Nombre varchar(50),
@Precio int,
@CodMarca int

as

Insert into Producto values(@Nombre, @Precio, @CodMarca)




GO
/****** Object:  StoredProcedure [dbo].[RegistroUsuario]    Script Date: 31/08/2016 9:43:08 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[RegistroUsuario]
(
@nombres varchar(50),
@apellido varchar (50),
@Usuarios varchar(50),
@direccion varchar(50),
@email varchar (50),
@telefono varchar(50),
@clave varchar(50)

)
as
begin 
insert into Usuario (Nombre,Apellido,Usuario, Direccion, Email, Telefono, Clave, Activo , Rol)
values (@nombres,@apellido, @Usuarios, @direccion,@email, @telefono, @clave, 1 , 1)

end

GO
/****** Object:  StoredProcedure [dbo].[RegistroUsuario22]    Script Date: 31/08/2016 9:43:08 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[RegistroUsuario22]
(@nombres varchar(50))
as
begin 
insert into Roles(Nombre)
values (@nombres)

end



GO
/****** Object:  StoredProcedure [dbo].[retornarUsuario]    Script Date: 31/08/2016 9:43:08 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[retornarUsuario]
as
begin
	select Nombre, Activo
	from Usuario
end

GO
/****** Object:  StoredProcedure [dbo].[SeleccionarProducto]    Script Date: 31/08/2016 9:43:08 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SeleccionarProducto]
as Select * From Producto


GO
/****** Object:  StoredProcedure [dbo].[Validar]    Script Date: 31/08/2016 9:43:08 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Validar] 
@nombre varchar(50), @Clave varchar(50)
as
begin
select count (*) from Usuario where Nombre = @nombre and Clave = @Clave
end


GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'FK entre IdMarca y CodMarca' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Producto', @level2type=N'CONSTRAINT',@level2name=N'FK_Producto_Marca'
GO
USE [master]
GO
ALTER DATABASE [Prototipo] SET  READ_WRITE 
GO
