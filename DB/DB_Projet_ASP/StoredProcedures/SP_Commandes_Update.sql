CREATE PROCEDURE [dbo].[SP_Commandes_Update]
	@id_com INT,
	@quant INT,
	@tot DECIMAL(10,2),
	@id_prod INT
AS
	UPDATE [Commandes]
		SET [quantite] = @quant,
			[total] = @tot,
			[Id_Prod] = @id_prod
		WHERE [Id_Com] = @id_com