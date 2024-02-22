using DAL.Entities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Mappers
{
    public static class Mapper
    {
        public static Produit ToProduit(this IDataRecord record)
        {
            if (record is null)
            {
                return null;
            }

            return new Produit
            {
                Id_Prod = (int)record[nameof(Produit.Id_Prod)],
                Name = (string)record[nameof(Produit.Name)],
                Description = (string)record[nameof(Produit.Description)],
                Price = (double)record[nameof(Produit.Price)],
                Eco_Cri = (string)record[nameof(Produit.Eco_Cri)],
                Id_Cat = (int)record[nameof(Produit.Id_Cat)]
            };
        }
    }
}
