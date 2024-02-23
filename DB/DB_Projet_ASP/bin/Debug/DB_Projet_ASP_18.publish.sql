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
USE [master];


GO

IF (DB_ID(N'$(DatabaseName)') IS NOT NULL) 
BEGIN
    ALTER DATABASE [$(DatabaseName)]
    SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE [$(DatabaseName)];
END

GO
PRINT N'Création de la base de données $(DatabaseName)...'
GO
CREATE DATABASE [$(DatabaseName)]
    ON 
    PRIMARY(NAME = [$(DatabaseName)], FILENAME = N'$(DefaultDataPath)$(DefaultFilePrefix)_Primary.mdf')
    LOG ON (NAME = [$(DatabaseName)_log], FILENAME = N'$(DefaultLogPath)$(DefaultFilePrefix)_Primary.ldf') COLLATE SQL_Latin1_General_CP1_CI_AS
GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_CLOSE OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
USE [$(DatabaseName)];


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ANSI_NULLS ON,
                ANSI_PADDING ON,
                ANSI_WARNINGS ON,
                ARITHABORT ON,
                CONCAT_NULL_YIELDS_NULL ON,
                NUMERIC_ROUNDABORT OFF,
                QUOTED_IDENTIFIER ON,
                ANSI_NULL_DEFAULT ON,
                CURSOR_DEFAULT LOCAL,
                CURSOR_CLOSE_ON_COMMIT OFF,
                AUTO_CREATE_STATISTICS ON,
                AUTO_SHRINK OFF,
                AUTO_UPDATE_STATISTICS ON,
                RECURSIVE_TRIGGERS OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ALLOW_SNAPSHOT_ISOLATION OFF;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET READ_COMMITTED_SNAPSHOT OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_UPDATE_STATISTICS_ASYNC OFF,
                PAGE_VERIFY NONE,
                DATE_CORRELATION_OPTIMIZATION OFF,
                DISABLE_BROKER,
                PARAMETERIZATION SIMPLE,
                SUPPLEMENTAL_LOGGING OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET TRUSTWORTHY OFF,
        DB_CHAINING OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'Impossible de modifier les paramètres de base de données. Vous devez être administrateur système pour appliquer ces paramètres.';
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET HONOR_BROKER_PRIORITY OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'Impossible de modifier les paramètres de base de données. Vous devez être administrateur système pour appliquer ces paramètres.';
    END


GO
ALTER DATABASE [$(DatabaseName)]
    SET TARGET_RECOVERY_TIME = 0 SECONDS 
    WITH ROLLBACK IMMEDIATE;


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET FILESTREAM(NON_TRANSACTED_ACCESS = OFF),
                CONTAINMENT = NONE 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_CREATE_STATISTICS ON(INCREMENTAL = OFF),
                MEMORY_OPTIMIZED_ELEVATE_TO_SNAPSHOT = OFF,
                DELAYED_DURABILITY = DISABLED 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE (QUERY_CAPTURE_MODE = ALL, DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_PLANS_PER_QUERY = 200, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 367), MAX_STORAGE_SIZE_MB = 100) 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE = OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET TEMPORAL_HISTORY_RETENTION ON 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF fulltextserviceproperty(N'IsFulltextInstalled') = 1
    EXECUTE sp_fulltext_database 'enable';


GO
PRINT N'Création de Table [dbo].[Categories]...';


GO
CREATE TABLE [dbo].[Categories] (
    [Id_Cat] INT           IDENTITY (1, 1) NOT NULL,
    [nom]    NVARCHAR (64) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id_Cat] ASC)
);


GO
PRINT N'Création de Table [dbo].[Commandes]...';


GO
CREATE TABLE [dbo].[Commandes] (
    [Id_Com]   INT             IDENTITY (1, 1) NOT NULL,
    [quantite] INT             NOT NULL,
    [total]    DECIMAL (10, 2) NOT NULL,
    [Id_Prod]  INT             NOT NULL,
    PRIMARY KEY CLUSTERED ([Id_Com] ASC)
);


GO
PRINT N'Création de Table [dbo].[Medias]...';


GO
CREATE TABLE [dbo].[Medias] (
    [Id_Med]  INT            IDENTITY (1, 1) NOT NULL,
    [Id_Prod] INT            NOT NULL,
    [lien]    NVARCHAR (255) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id_Med] ASC)
);


GO
PRINT N'Création de Table [dbo].[Produit]...';


GO
CREATE TABLE [dbo].[Produit] (
    [Id_Prod]     INT            IDENTITY (1, 1) NOT NULL,
    [nom]         NVARCHAR (64)  NOT NULL,
    [description] NVARCHAR (MAX) NULL,
    [prix]        FLOAT (53)     NOT NULL,
    [cri_eco]     NVARCHAR (64)  NULL,
    [Id_Cat]      INT            NOT NULL,
    PRIMARY KEY CLUSTERED ([Id_Prod] ASC)
);


GO
PRINT N'Création de Clé étrangère [dbo].[FK_Commandes_Produit]...';


GO
ALTER TABLE [dbo].[Commandes]
    ADD CONSTRAINT [FK_Commandes_Produit] FOREIGN KEY ([Id_Prod]) REFERENCES [dbo].[Produit] ([Id_Prod]);


GO
PRINT N'Création de Clé étrangère [dbo].[FK_Medias_Produit]...';


GO
ALTER TABLE [dbo].[Medias]
    ADD CONSTRAINT [FK_Medias_Produit] FOREIGN KEY ([Id_Prod]) REFERENCES [dbo].[Produit] ([Id_Prod]);


GO
PRINT N'Création de Clé étrangère [dbo].[FK_Produit_Categories]...';


GO
ALTER TABLE [dbo].[Produit]
    ADD CONSTRAINT [FK_Produit_Categories] FOREIGN KEY ([Id_Cat]) REFERENCES [dbo].[Categories] ([Id_Cat]);


GO
PRINT N'Création de Contrainte de validation [dbo].[CK_Produit_prix]...';


GO
ALTER TABLE [dbo].[Produit]
    ADD CONSTRAINT [CK_Produit_prix] CHECK ([prix] > 0);


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
	@id_prod INT,
	@li NVARCHAR(255)
AS
	INSERT INTO [Medias] ([lien], [Id_Prod])
		OUTPUT [inserted].[Id_Med]
		VALUES (@li, @id_prod)
GO
PRINT N'Création de Procédure [dbo].[SP_Medias_Update]...';


GO
CREATE PROCEDURE [dbo].[SP_Medias_Update]
	@id_med INT,
	@li NVARCHAR(255),
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
		SET [nom] = @no,
			[description] = @desc,
			[prix] = @pri,
			[cri_eco] = @cr_ec,
			[Id_Cat] = @id_cat
		WHERE [Id_Prod] = @id_prod
GO
-- Étape de refactorisation pour mettre à jour le serveur cible avec des journaux de transactions déployés

IF OBJECT_ID(N'dbo.__RefactorLog') IS NULL
BEGIN
    CREATE TABLE [dbo].[__RefactorLog] (OperationKey UNIQUEIDENTIFIER NOT NULL PRIMARY KEY)
    EXEC sp_addextendedproperty N'microsoft_database_tools_support', N'refactoring log', N'schema', N'dbo', N'table', N'__RefactorLog'
END
GO
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '54211727-bed4-4d83-a0da-2ae74f5caddd')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('54211727-bed4-4d83-a0da-2ae74f5caddd')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '14dad408-a461-4364-a000-07cd53daa0ab')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('14dad408-a461-4364-a000-07cd53daa0ab')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '70491745-276e-480a-98fb-17853d5aa2ed')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('70491745-276e-480a-98fb-17853d5aa2ed')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'f65b76cd-9beb-494f-be51-479086902afb')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('f65b76cd-9beb-494f-be51-479086902afb')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '89c9f296-3bd0-41fb-a0a5-21a8cc8a623c')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('89c9f296-3bd0-41fb-a0a5-21a8cc8a623c')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'a05a9999-9ccf-411a-8831-c9e327f45d64')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('a05a9999-9ccf-411a-8831-c9e327f45d64')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '4d6e28a5-8324-4213-bf6d-3ceb5173b8ca')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('4d6e28a5-8324-4213-bf6d-3ceb5173b8ca')

GO

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
DECLARE @VarDecimalSupported AS BIT;

SELECT @VarDecimalSupported = 0;

IF ((ServerProperty(N'EngineEdition') = 3)
    AND (((@@microsoftversion / power(2, 24) = 9)
          AND (@@microsoftversion & 0xffff >= 3024))
         OR ((@@microsoftversion / power(2, 24) = 10)
             AND (@@microsoftversion & 0xffff >= 1600))))
    SELECT @VarDecimalSupported = 1;

IF (@VarDecimalSupported > 0)
    BEGIN
        EXECUTE sp_db_vardecimal_storage_format N'$(DatabaseName)', 'ON';
    END


GO
PRINT N'Mise à jour terminée.';


GO
