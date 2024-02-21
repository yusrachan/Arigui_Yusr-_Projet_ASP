/*
Script de déploiement pour DB_Projet_ASP

Ce code a été généré par un outil.
La modification de ce fichier peut provoquer un comportement incorrect et sera perdue si
le code est régénéré.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "DB_Projet_ASP"
:setvar DefaultFilePrefix "DB_Projet_ASP"
:setvar DefaultDataPath "C:\Users\y.arigui\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\"
:setvar DefaultLogPath "C:\Users\y.arigui\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\"

GO
:on error exit
GO
/*
Détectez le mode SQLCMD et désactivez l'exécution du script si le mode SQLCMD n'est pas pris en charge.
Pour réactiver le script une fois le mode SQLCMD activé, exécutez ce qui suit :
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'Le mode SQLCMD doit être activé de manière à pouvoir exécuter ce script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
PRINT N'Suppression de Clé étrangère [dbo].[FK_Produit_Categories]...';


GO
ALTER TABLE [dbo].[Produit] DROP CONSTRAINT [FK_Produit_Categories];


GO
PRINT N'Suppression de Clé étrangère [dbo].[FK_Commandes_Produit]...';


GO
ALTER TABLE [dbo].[Commandes] DROP CONSTRAINT [FK_Commandes_Produit];


GO
PRINT N'Suppression de Clé étrangère [dbo].[FK_Medias_Produit]...';


GO
ALTER TABLE [dbo].[Medias] DROP CONSTRAINT [FK_Medias_Produit];


GO
PRINT N'Suppression de Clé étrangère [dbo].[FK_Produit_Medias]...';


GO
ALTER TABLE [dbo].[Produit] DROP CONSTRAINT [FK_Produit_Medias];


GO
PRINT N'Début de la régénération de la table [dbo].[Categories]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_Categories] (
    [Id_Cat] INT           IDENTITY (1, 1) NOT NULL,
    [nom]    NVARCHAR (64) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id_Cat] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[Categories])
    BEGIN
        SET IDENTITY_INSERT [dbo].[tmp_ms_xx_Categories] ON;
        INSERT INTO [dbo].[tmp_ms_xx_Categories] ([Id_Cat], [nom])
        SELECT   [Id_Cat],
                 [nom]
        FROM     [dbo].[Categories]
        ORDER BY [Id_Cat] ASC;
        SET IDENTITY_INSERT [dbo].[tmp_ms_xx_Categories] OFF;
    END

DROP TABLE [dbo].[Categories];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_Categories]', N'Categories';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Début de la régénération de la table [dbo].[Commandes]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_Commandes] (
    [Id_Com]   INT             IDENTITY (1, 1) NOT NULL,
    [quantite] INT             NOT NULL,
    [total]    DECIMAL (10, 2) NOT NULL,
    [Id_Prod]  INT             NOT NULL,
    PRIMARY KEY CLUSTERED ([Id_Com] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[Commandes])
    BEGIN
        SET IDENTITY_INSERT [dbo].[tmp_ms_xx_Commandes] ON;
        INSERT INTO [dbo].[tmp_ms_xx_Commandes] ([Id_Com], [quantite], [total], [Id_Prod])
        SELECT   [Id_Com],
                 [quantite],
                 [total],
                 [Id_Prod]
        FROM     [dbo].[Commandes]
        ORDER BY [Id_Com] ASC;
        SET IDENTITY_INSERT [dbo].[tmp_ms_xx_Commandes] OFF;
    END

DROP TABLE [dbo].[Commandes];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_Commandes]', N'Commandes';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Début de la régénération de la table [dbo].[Medias]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_Medias] (
    [Id_Med]  INT            IDENTITY (1, 1) NOT NULL,
    [Id_Prod] INT            NOT NULL,
    [lien]    NVARCHAR (255) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id_Med] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[Medias])
    BEGIN
        SET IDENTITY_INSERT [dbo].[tmp_ms_xx_Medias] ON;
        INSERT INTO [dbo].[tmp_ms_xx_Medias] ([Id_Med], [Id_Prod], [lien])
        SELECT   [Id_Med],
                 [Id_Prod],
                 [lien]
        FROM     [dbo].[Medias]
        ORDER BY [Id_Med] ASC;
        SET IDENTITY_INSERT [dbo].[tmp_ms_xx_Medias] OFF;
    END

DROP TABLE [dbo].[Medias];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_Medias]', N'Medias';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Début de la régénération de la table [dbo].[Produit]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_Produit] (
    [Id_Prod]     INT             IDENTITY (1, 1) NOT NULL,
    [nom]         NVARCHAR (64)   NOT NULL,
    [description] NVARCHAR (MAX)  NULL,
    [prix]        DECIMAL (10, 2) NOT NULL,
    [cri_eco]     NVARCHAR (64)   NULL,
    [Id_Cat]      INT             NOT NULL,
    [Id_Med]      INT             NOT NULL,
    PRIMARY KEY CLUSTERED ([Id_Prod] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[Produit])
    BEGIN
        SET IDENTITY_INSERT [dbo].[tmp_ms_xx_Produit] ON;
        INSERT INTO [dbo].[tmp_ms_xx_Produit] ([Id_Prod], [nom], [description], [prix], [cri_eco], [Id_Cat], [Id_Med])
        SELECT   [Id_Prod],
                 [nom],
                 [description],
                 [prix],
                 [cri_eco],
                 [Id_Cat],
                 [Id_Med]
        FROM     [dbo].[Produit]
        ORDER BY [Id_Prod] ASC;
        SET IDENTITY_INSERT [dbo].[tmp_ms_xx_Produit] OFF;
    END

DROP TABLE [dbo].[Produit];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_Produit]', N'Produit';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Création de Clé étrangère [dbo].[FK_Produit_Categories]...';


GO
ALTER TABLE [dbo].[Produit] WITH NOCHECK
    ADD CONSTRAINT [FK_Produit_Categories] FOREIGN KEY ([Id_Cat]) REFERENCES [dbo].[Categories] ([Id_Cat]);


GO
PRINT N'Création de Clé étrangère [dbo].[FK_Commandes_Produit]...';


GO
ALTER TABLE [dbo].[Commandes] WITH NOCHECK
    ADD CONSTRAINT [FK_Commandes_Produit] FOREIGN KEY ([Id_Prod]) REFERENCES [dbo].[Produit] ([Id_Prod]);


GO
PRINT N'Création de Clé étrangère [dbo].[FK_Medias_Produit]...';


GO
ALTER TABLE [dbo].[Medias] WITH NOCHECK
    ADD CONSTRAINT [FK_Medias_Produit] FOREIGN KEY ([Id_Prod]) REFERENCES [dbo].[Produit] ([Id_Prod]);


GO
PRINT N'Création de Clé étrangère [dbo].[FK_Produit_Medias]...';


GO
ALTER TABLE [dbo].[Produit] WITH NOCHECK
    ADD CONSTRAINT [FK_Produit_Medias] FOREIGN KEY ([Id_Med]) REFERENCES [dbo].[Medias] ([Id_Med]);


GO
PRINT N'Création de Contrainte de validation [dbo].[CK_Produit_prix]...';


GO
ALTER TABLE [dbo].[Produit] WITH NOCHECK
    ADD CONSTRAINT [CK_Produit_prix] CHECK ([prix] > 0);


GO
PRINT N'Actualisation de Procédure [dbo].[SP_Categories_Delete]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[SP_Categories_Delete]';


GO
PRINT N'Actualisation de Procédure [dbo].[SP_Categories_GetAll]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[SP_Categories_GetAll]';


GO
PRINT N'Actualisation de Procédure [dbo].[SP_Categories_GetById]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[SP_Categories_GetById]';


GO
PRINT N'Actualisation de Procédure [dbo].[SP_Categories_Insert]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[SP_Categories_Insert]';


GO
PRINT N'Actualisation de Procédure [dbo].[SP_Categories_Update]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[SP_Categories_Update]';


GO
PRINT N'Actualisation de Procédure [dbo].[SP_Commandes_Delete]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[SP_Commandes_Delete]';


GO
PRINT N'Actualisation de Procédure [dbo].[SP_Commandes_GetAll]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[SP_Commandes_GetAll]';


GO
PRINT N'Actualisation de Procédure [dbo].[SP_Commandes_GetById]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[SP_Commandes_GetById]';


GO
PRINT N'Actualisation de Procédure [dbo].[SP_Commandes_Insert]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[SP_Commandes_Insert]';


GO
PRINT N'Actualisation de Procédure [dbo].[SP_Commandes_Update]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[SP_Commandes_Update]';


GO
PRINT N'Actualisation de Procédure [dbo].[SP_Medias_Delete]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[SP_Medias_Delete]';


GO
PRINT N'Actualisation de Procédure [dbo].[SP_Medias_GetAll]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[SP_Medias_GetAll]';


GO
PRINT N'Actualisation de Procédure [dbo].[SP_Medias_GetById]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[SP_Medias_GetById]';


GO
PRINT N'Actualisation de Procédure [dbo].[SP_Medias_Insert]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[SP_Medias_Insert]';


GO
PRINT N'Actualisation de Procédure [dbo].[SP_Medias_Update]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[SP_Medias_Update]';


GO
PRINT N'Actualisation de Procédure [dbo].[SP_Produit_Delete]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[SP_Produit_Delete]';


GO
PRINT N'Actualisation de Procédure [dbo].[SP_Produit_GetAll]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[SP_Produit_GetAll]';


GO
PRINT N'Actualisation de Procédure [dbo].[SP_Produit_GetById]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[SP_Produit_GetById]';


GO
PRINT N'Actualisation de Procédure [dbo].[SP_Produit_Insert]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[SP_Produit_Insert]';


GO
PRINT N'Actualisation de Procédure [dbo].[SP_Produit_Update]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[SP_Produit_Update]';


GO
/*
Modèle de script de post-déploiement							
--------------------------------------------------------------------------------------
 Ce fichier contient des instructions SQL qui seront ajoutées au script de compilation.		
 Utilisez la syntaxe SQLCMD pour inclure un fichier dans le script de post-déploiement.			
 Exemple :      :r .\monfichier.sql								
 Utilisez la syntaxe SQLCMD pour référencer une variable dans le script de post-déploiement.		
 Exemple :      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

EXEC SP_Categories_Insert 1,'Téléphone';
EXEC SP_Categories_Insert 2,'Livre';
EXEC SP_Categories_Insert 3,'Télévision';

EXEC SP_Produit_Insert 'iPhone 14', NULL, 599.99, NULL, 1;
EXEC SP_Produit_Insert 'Moi, Yusrâ', 'Ce livre raconte la vie d’une femme formidable qui est Arigui Yusrâ. Entre rebondissements, émotions et inspirations, vous ressortirez de son histoire avec de l’admiration et du respect pour cette jeune femme.', 99.99, 'Papier recyclé', 2;
EXEC SP_Produit_Insert 'TV LED Samsung', 'The Frame, la TV ArtyFaites entrer l’art chez vousThe Frame est conçu pour sublimer votre intérieur qu’il soit allumé ou éteint. Quand il est allumé, The Frame offre une qualité d’image exceptionnelle grâce à la technologie QLED Full HD.', 99.99, NULL, 3;

EXEC SP_Medias_Insert 1, 'images/iphone-14.jpg';
EXEC SP_Medias_Insert 2, 'images/moi.jpg';
EXEC SP_Medias_Insert 3, 'images/TV-LED-Samsung.jpg';
GO

GO
PRINT N'Vérification de données existantes par rapport aux nouvelles contraintes';


GO
USE [$(DatabaseName)];


GO
ALTER TABLE [dbo].[Produit] WITH CHECK CHECK CONSTRAINT [FK_Produit_Categories];

ALTER TABLE [dbo].[Commandes] WITH CHECK CHECK CONSTRAINT [FK_Commandes_Produit];

ALTER TABLE [dbo].[Medias] WITH CHECK CHECK CONSTRAINT [FK_Medias_Produit];

ALTER TABLE [dbo].[Produit] WITH CHECK CHECK CONSTRAINT [FK_Produit_Medias];

ALTER TABLE [dbo].[Produit] WITH CHECK CHECK CONSTRAINT [CK_Produit_prix];


GO
PRINT N'Mise à jour terminée.';


GO
