CREATE PROCEDURE [dbo].[SP_Medias_Update]
	@id_med INT,
	@li NVARCHAR(255),
	@id_prod INT
AS
	UPDATE [Medias]
		SET [lien] = @li,
			[Id_Prod] = @id_prod
		WHERE [Id_Med] = @id_med