CREATE PROCEDURE [dbo].[SP_Medias_GetById]
	@id_med INT
AS
	SELECT [Id_Med],
			[lien],
			[Id_Prod]
	FROM [Medias]
	WHERE [Id_Med] = @id_med