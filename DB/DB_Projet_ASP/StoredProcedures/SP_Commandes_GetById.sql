CREATE PROCEDURE [dbo].[SP_Commandes_GetById]
	@id_com INT
AS
	SELECT [Id_Com],
			[quantite],
			[total],
			[Id_Prod]
	FROM [Commandes]
	WHERE [Id_Com] = @id_com