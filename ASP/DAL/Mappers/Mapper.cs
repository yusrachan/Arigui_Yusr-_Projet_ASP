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
                Id_Prod = record.GetInt32(record.GetOrdinal("Id_Prod")),
                nom = record.IsDBNull(record.GetOrdinal("nom")) ? null : record.GetString(record.GetOrdinal("nom")),
                description = record.IsDBNull(record.GetOrdinal("description")) ? null : record.GetString(record.GetOrdinal("description")),
                prix = (float)record.GetDouble(record.GetOrdinal("prix")),
                cri_eco = record.IsDBNull(record.GetOrdinal("cri_eco")) ? null : record.GetString(record.GetOrdinal("cri_eco")),
                Id_Cat = record.GetInt32(record.GetOrdinal("Id_Cat"))
            };
        }
    }
}
