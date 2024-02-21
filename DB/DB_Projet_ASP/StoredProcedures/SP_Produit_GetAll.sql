CREATE PROCEDURE [dbo].[SP_Produit_GetAll]
AS
	SELECT [Id_Prod],
			[nom],
			[description],
			[prix],
			[cri_eco],
			[Id_Cat]
	FROM [Produit]