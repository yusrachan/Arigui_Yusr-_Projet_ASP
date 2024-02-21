CREATE PROCEDURE [dbo].[SP_Categories_Update]
	@id_cat INT,
	@nom NVARCHAR(64)
AS
	UPDATE [Categories]
		SET [nom] = @nom
		WHERE [Id_Cat] = @id_cat