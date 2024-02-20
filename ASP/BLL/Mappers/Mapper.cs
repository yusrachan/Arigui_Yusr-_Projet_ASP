using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

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
    }
}
