CREATE TABLE [dbo].[Produit]
(
	[Id_Prod] INT IDENTITY NOT NULL PRIMARY KEY, 
    [nom] NVARCHAR(64) NOT NULL, 
    [description] NVARCHAR(MAX) NULL, 
    [prix] FLOAT NOT NULL, 
    [cri_eco] NVARCHAR(64) NULL, 
    [Id_Cat] INT NOT NULL, 
    CONSTRAINT [FK_Produit_Categories] FOREIGN KEY ([Id_Cat]) REFERENCES [Categories]([Id_Cat]), 
    CONSTRAINT [CK_Produit_prix] CHECK ([prix] > 0)
)