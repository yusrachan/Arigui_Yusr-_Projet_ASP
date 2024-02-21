CREATE PROCEDURE [dbo].[SP_Produit_GetById]
	@id_prod INT
AS
	SELECT [Id_Prod],
			[nom],
			[description],
			[prix],
			[cri_eco],
			[Id_Cat]
	FROM [Produit]
	WHERE [Id_Prod] = @id_prod