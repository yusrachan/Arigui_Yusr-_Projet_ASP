CREATE TABLE [dbo].[Commandes]
(
	[Id_Com] INT NOT NULL PRIMARY KEY, 
    [quantite] INT NOT NULL, 
    [total] DECIMAL(10, 2) NOT NULL, 
    [Id_Prod] INT NOT NULL, 
    CONSTRAINT [FK_Commandes_Produit] FOREIGN KEY ([Id_Prod]) REFERENCES [Produit]([Id_Prod])
)
