CREATE PROCEDURE [dbo].[SP_Medias_Delete]
	@id_med INT
AS
	DELETE FROM [Medias]
		WHERE [Id_Med] = @id_med