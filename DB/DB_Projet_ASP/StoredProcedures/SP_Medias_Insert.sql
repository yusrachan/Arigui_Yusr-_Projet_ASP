CREATE PROCEDURE [dbo].[SP_Medias_Insert]
	@id_prod INT,
	@li NVARCHAR(255)
AS
	INSERT INTO [Medias] ([lien], [Id_Prod])
		OUTPUT [inserted].[Id_Med]
		VALUES (@li, @id_prod)
