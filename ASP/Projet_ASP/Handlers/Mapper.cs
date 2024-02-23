using BLL.Entities;
using Projet_ASP.Models;

namespace Projet_ASP.Handlers
{
    public static class Mapper
    {
        #region Produit

        public static ProductListItem ToListItem(this Produit entity)
        {
            if (entity is null)
            {
                return null;
            }

            return new ProductListItem
            {
                Id_Prod = entity.Id_Prod,
                Name = entity.nom,
                Price = entity.prix
            };
        }

        public static ProductDetails ToDetails(this Produit entity)
        {
            if (entity is null)
            {
                return null;
            }

            return new ProductDetails
            {
                Id_Prod = entity.Id_Prod,
                Name = entity.nom,
                Description = entity.description,
                Price = entity.prix,
                Eco_Cri = entity.cri_eco,
            };
        }

        public static Produit ToBLL(this ProductCreateForm entity)
        {
            if (entity is null)
            {
                return null;
            }

            return new Produit(
                entity.nom,
                entity.description,
                entity.prix,
                entity.cri_eco,
                entity.Id_Cat);
        }
        #endregion
    }
}
