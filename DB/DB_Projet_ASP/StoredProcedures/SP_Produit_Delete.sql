CREATE PROCEDURE [dbo].[SP_Produit_Delete]
	@id_prod INT
AS
	DELETE FROM [Produit]
		WHERE [Id_Prod] = @id_prod