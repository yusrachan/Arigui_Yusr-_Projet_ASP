CREATE PROCEDURE [dbo].[SP_Medias_GetAll]
AS
	SELECT [Id_Med],
			[lien],
			[Id_Prod]
	FROM [Medias]