CREATE PROCEDURE [dbo].[SP_Produit_Update]
	@id_prod INT,
	@no NVARCHAR(64),
	@desc NVARCHAR(MAX),
	@pri DECIMAL(10,2),
	@cr_ec NVARCHAR(64),
	@id_cat int
AS
	UPDATE [Produit]
		SET [nom] = @no,
			[description] = @desc,
			[prix] = @pri,
			[cri_eco] = @cr_ec,
			[Id_Cat] = @id_cat
		WHERE [Id_Prod] = @id_prod