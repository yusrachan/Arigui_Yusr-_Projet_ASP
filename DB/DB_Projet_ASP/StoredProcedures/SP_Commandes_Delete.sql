CREATE PROCEDURE [dbo].[SP_Commandes_Delete]
	@id_com INT
AS
	DELETE FROM [Commandes]
		WHERE [Id_Com] = @id_com