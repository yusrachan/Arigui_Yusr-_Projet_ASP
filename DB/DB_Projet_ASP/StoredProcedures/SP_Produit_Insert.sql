CREATE PROCEDURE [dbo].[SP_Produit_Insert]
	@no NVARCHAR(64),
	@desc NVARCHAR(MAX),
	@pri DECIMAL(10,2),
	@cr_ec NVARCHAR(64),
	@id_cat int
AS
	INSERT INTO [Produit] ([nom], [description], [prix], [cri_eco], [Id_Cat])
		OUTPUT [inserted].[Id_Prod]
		VALUES (@no, @desc, @pri, @cr_ec, @id_cat)
