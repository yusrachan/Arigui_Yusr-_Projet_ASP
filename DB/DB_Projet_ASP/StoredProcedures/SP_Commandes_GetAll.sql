CREATE PROCEDURE [dbo].[SP_Commandes_GetAll]
AS
	SELECT [Id_Com]
			[quantite],
			[total],
			[Id_Prod]
	FROM [Commandes]