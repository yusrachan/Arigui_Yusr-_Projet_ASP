﻿CREATE TABLE [dbo].[Medias]
(
	[Id_Med] INT IDENTITY NOT NULL PRIMARY KEY, 
    [Id_Prod] INT NOT NULL, 
    [lien] NVARCHAR(255) NOT NULL, 
    CONSTRAINT [FK_Medias_Produit] FOREIGN KEY ([Id_Prod]) REFERENCES [Produit]([Id_Prod])
)
