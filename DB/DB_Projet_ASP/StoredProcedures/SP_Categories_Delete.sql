CREATE PROCEDURE [dbo].[SP_Categories_Delete]
	@id_categories INT
AS
	DELETE FROM [Categories]
		WHERE [Id_Cat] = @id_categories