USE [Prototipo]
GO
/****** Object:  StoredProcedure [dbo].[Validar]    Script Date: 15/06/2016 19:00:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER proc [dbo].[Validar] 
@nombre varchar(50), @Clave varchar(50)
as
begin
select count (*) from Usuario where Nombre = @nombre and Clave = @Clave
end


