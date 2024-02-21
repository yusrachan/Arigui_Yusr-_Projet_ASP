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
