CREATE PROCEDURE [dbo].[SP_Commandes_Insert]
	@quant INT,
	@tot DECIMAL(10,2),
	@id_prod INT
AS
	INSERT INTO [Commandes] ([quantite], [total], [Id_Prod])
		OUTPUT [inserted].[Id_Com]
		VALUES (@quant, @tot, @id_prod)
