CREATE PROCEDURE [dbo].[SP_Categories_Insert]
	@nom NVARCHAR(64)
AS
	INSERT INTO [Categories] ([nom])
		OUTPUT [inserted].[Id_Cat]
		VALUES (@nom)
