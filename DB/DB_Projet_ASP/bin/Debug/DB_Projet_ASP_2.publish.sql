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
/*
La colonne [dbo].[Produit].[Id_Med] de la table [dbo].[Produit] doit être ajoutée mais la colonne ne comporte pas de valeur par défaut et n'autorise pas les valeurs NULL. Si la table contient des données, le script ALTER ne fonctionnera pas. Pour éviter ce problème, vous devez ajouter une valeur par défaut à la colonne, la marquer comme autorisant les valeurs Null ou activer la génération de smart-defaults en tant qu'option de déploiement.
*/

IF EXISTS (select top 1 1 from [dbo].[Produit])
    RAISERROR (N'Lignes détectées. Arrêt de la mise à jour du schéma en raison d''''un risque de perte de données.', 16, 127) WITH NOWAIT

GO
PRINT N'Modification de Table [dbo].[Medias]...';


GO
ALTER TABLE [dbo].[Medias] ALTER COLUMN [lien] NVARCHAR (255) NOT NULL;


GO
PRINT N'Modification de Table [dbo].[Produit]...';


GO
ALTER TABLE [dbo].[Produit]
    ADD [Id_Med] INT NOT NULL;


GO
PRINT N'Création de Clé étrangère [dbo].[FK_Produit_Medias]...';


GO
ALTER TABLE [dbo].[Produit] WITH NOCHECK
    ADD CONSTRAINT [FK_Produit_Medias] FOREIGN KEY ([Id_Med]) REFERENCES [dbo].[Medias] ([Id_Med]);


GO
PRINT N'Création de Procédure [dbo].[SP_Categories_Delete]...';


GO
CREATE PROCEDURE [dbo].[SP_Categories_Delete]
	@id_categories INT
AS
	DELETE FROM [Categories]
		WHERE [Id_Cat] = @id_categories
GO
PRINT N'Création de Procédure [dbo].[SP_Categories_GetAll]...';


GO
CREATE PROCEDURE [dbo].[SP_Categories_GetAll]
AS
	SELECT [Id_Cat]
			[nom]
	FROM [Categories]
GO
PRINT N'Création de Procédure [dbo].[SP_Categories_GetById]...';


GO
CREATE PROCEDURE [dbo].[SP_Categories_GetById]
	@id_cat INT
AS
	SELECT [Id_Cat],
			[nom]
	FROM [Categories]
	WHERE [Id_Cat] = @id_cat
GO
PRINT N'Création de Procédure [dbo].[SP_Categories_Insert]...';


GO
CREATE PROCEDURE [dbo].[SP_Categories_Insert]
	@nom NVARCHAR(64)
AS
	INSERT INTO [Categories] ([nom])
		OUTPUT [inserted].[Id_Cat]
		VALUES (@nom)
GO
PRINT N'Création de Procédure [dbo].[SP_Categories_Update]...';


GO
CREATE PROCEDURE [dbo].[SP_Categories_Update]
	@id_cat INT,
	@nom NVARCHAR(64)
AS
	UPDATE [Categories]
		SET [nom] = @nom
		WHERE [Id_Cat] = @id_cat
GO
PRINT N'Création de Procédure [dbo].[SP_Commandes_Delete]...';


GO
CREATE PROCEDURE [dbo].[SP_Commandes_Delete]
	@id_com INT
AS
	DELETE FROM [Commandes]
		WHERE [Id_Com] = @id_com
GO
PRINT N'Création de Procédure [dbo].[SP_Commandes_GetAll]...';


GO
CREATE PROCEDURE [dbo].[SP_Commandes_GetAll]
AS
	SELECT [Id_Com]
			[quantite],
			[total],
			[Id_Prod]
	FROM [Commandes]
GO
PRINT N'Création de Procédure [dbo].[SP_Commandes_GetById]...';


GO
CREATE PROCEDURE [dbo].[SP_Commandes_GetById]
	@id_com INT
AS
	SELECT [Id_Com],
			[quantite],
			[total],
			[Id_Prod]
	FROM [Commandes]
	WHERE [Id_Com] = @id_com
GO
PRINT N'Création de Procédure [dbo].[SP_Commandes_Insert]...';


GO
CREATE PROCEDURE [dbo].[SP_Commandes_Insert]
	@quant INT,
	@tot DECIMAL(10,2),
	@id_prod INT
AS
	INSERT INTO [Commandes] ([quantite], [total], [Id_Prod])
		OUTPUT [inserted].[Id_Com]
		VALUES (@quant, @tot, @id_prod)
GO
PRINT N'Création de Procédure [dbo].[SP_Commandes_Update]...';


GO
CREATE PROCEDURE [dbo].[SP_Commandes_Update]
	@id_com INT,
	@quant INT,
	@tot DECIMAL(10,2),
	@id_prod INT
AS
	UPDATE [Commandes]
		SET [quantite] = @quant,
			[total] = @tot,
			[Id_Prod] = @id_prod
		WHERE [Id_Com] = @id_com
GO
PRINT N'Création de Procédure [dbo].[SP_Medias_Delete]...';


GO
CREATE PROCEDURE [dbo].[SP_Medias_Delete]
	@id_med INT
AS
	DELETE FROM [Medias]
		WHERE [Id_Med] = @id_med
GO
PRINT N'Création de Procédure [dbo].[SP_Medias_GetAll]...';


GO
CREATE PROCEDURE [dbo].[SP_Medias_GetAll]
AS
	SELECT [Id_Med],
			[lien],
			[Id_Prod]
	FROM [Medias]
GO
PRINT N'Création de Procédure [dbo].[SP_Medias_GetById]...';


GO
CREATE PROCEDURE [dbo].[SP_Medias_GetById]
	@id_med INT
AS
	SELECT [Id_Med],
			[lien],
			[Id_Prod]
	FROM [Medias]
	WHERE [Id_Med] = @id_med
GO
PRINT N'Création de Procédure [dbo].[SP_Medias_Insert]...';


GO
CREATE PROCEDURE [dbo].[SP_Medias_Insert]
	@li VARCHAR(255),
	@id_prod INT
AS
	INSERT INTO [Medias] ([lien], [Id_Prod])
		OUTPUT [inserted].[Id_Med]
		VALUES (@li, @id_prod)
GO
PRINT N'Création de Procédure [dbo].[SP_Medias_Update]...';


GO
CREATE PROCEDURE [dbo].[SP_Medias_Update]
	@id_med INT,
	@li VARCHAR(255),
	@id_prod INT
AS
	UPDATE [Medias]
		SET [lien] = @li,
			[Id_Prod] = @id_prod
		WHERE [Id_Med] = @id_med
GO
PRINT N'Création de Procédure [dbo].[SP_Produit_Delete]...';


GO
CREATE PROCEDURE [dbo].[SP_Produit_Delete]
	@id_prod INT
AS
	DELETE FROM [Produit]
		WHERE [Id_Prod] = @id_prod
GO
PRINT N'Création de Procédure [dbo].[SP_Produit_GetAll]...';


GO
CREATE PROCEDURE [dbo].[SP_Produit_GetAll]
AS
	SELECT [Id_Prod],
			[nom],
			[description],
			[prix],
			[cri_eco],
			[Id_Cat]
	FROM [Produit]
GO
PRINT N'Création de Procédure [dbo].[SP_Produit_GetById]...';


GO
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
GO
PRINT N'Création de Procédure [dbo].[SP_Produit_Insert]...';


GO
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
GO
PRINT N'Création de Procédure [dbo].[SP_Produit_Update]...';


GO
CREATE PROCEDURE [dbo].[SP_Produit_Update]
	@id_prod INT,
	@no NVARCHAR(64),
	@desc NVARCHAR(MAX),
	@pri DECIMAL(10,2),
	@cr_ec NVARCHAR(64),
	@id_cat int
AS
	UPDATE [Produit]
		SET [Id_Prod] = @id_prod,
			[nom] = @no,
			[description] = @desc,
			[prix] = @pri,
			[cri_eco] = @cr_ec,
			[Id_Cat] = @id_cat
		WHERE [Id_Prod] = @id_prod
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

EXEC SP_Categories_Insert 'Téléphone';
EXEC SP_Categories_Insert 'Livre';
EXEC SP_Categories_Insert 'Télévision';

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
ALTER TABLE [dbo].[Produit] WITH CHECK CHECK CONSTRAINT [FK_Produit_Medias];


GO
PRINT N'Mise à jour terminée.';


GO
