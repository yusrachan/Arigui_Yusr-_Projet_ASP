namespace BLL.Mappers
{
    internal static class Mapper
    {
        #region Categories
        public static BLL.Entities.Categories ToBLL(this DAL.Entities.Categories entity)
        {
            if (entity is null)
            {
                return null;
            }

            return new BLL.Entities.Categories(
                entity.Id_Cat,
                entity.nom);
        }

        public static DAL.Entities.Categories ToDAL(this BLL.Entities.Categories entity)
        {
            if (entity is null)
            {
                return null;
            }

            return new DAL.Entities.Categories
            {
                Id_Cat = entity.Id_Cat,
                nom = entity.Nom
            };

            #endregion
        }

        #region Commandes
        public static BLL.Entities.Commandes ToBLL(this DAL.Entities.Commandes entity)
        {
            if (entity is null)
            {
                return null;
            }

            return new BLL.Entities.Commandes(
                entity.Id_Com,
                entity.Quantite,
                entity.Id_Prod);
        }

        public static DAL.Entities.Commandes ToDAL(this BLL.Entities.Commandes entity)
        {
            if (entity is null)
            {
                return null;
            }

            return new DAL.Entities.Commandes
            {
                Id_Com = entity.Id_Com,
                Quantite = entity.Quantite,
                Id_Prod = entity.Id_Prod,
            };
        }
        #endregion

        #region Produit
        public static BLL.Entities.Produit ToBLL(this DAL.Entities.Produit entity)
        {
            if (entity is null)
            {
                return null;
            }

            return new BLL.Entities.Produit(
                entity.Id_Prod,
                entity.Name,
                entity.Description,
                entity.Price,
                entity.Eco_Cri,
                entity.Id_Cat);
        }

        public static DAL.Entities.Produit ToDAL(this BLL.Entities.Produit entity)
        {
            if(entity is null)
            {
                return null;
            }

            return new DAL.Entities.Produit
            {
                Id_Prod = entity.Id_Prod,
                Name = entity.Name,
                Description = entity.Description,
                Price = entity.Price,
                Eco_Cri = entity.Eco_Cri,
                Id_Cat = entity.Id_Cat
            };
        }
        #endregion
    }
}
