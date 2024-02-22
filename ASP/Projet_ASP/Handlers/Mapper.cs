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
                Name = entity.Name,
                Price = entity.Price
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
                Name = entity.Name,
                Description = entity.Description,
                Price = entity.Price,
                Eco_Cri = entity.Eco_Cri,
            };
        }

        public static Produit ToBLL(this ProductCreateForm entity)
        {
            if (entity is null)
            {
                return null;
            }

            return new Produit(
                entity.Name,
                entity.Description,
                entity.Price,
                entity.Eco_Cri,
                entity.Id_Cat);
        }
        #endregion
    }
}
