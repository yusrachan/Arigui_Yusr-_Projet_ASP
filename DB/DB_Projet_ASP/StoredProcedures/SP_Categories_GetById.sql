CREATE PROCEDURE [dbo].[SP_Categories_GetById]
	@id_cat INT
AS
	SELECT [Id_Cat],
			[nom]
	FROM [Categories]
	WHERE [Id_Cat] = @id_cat