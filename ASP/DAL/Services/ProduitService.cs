using DAL.Entities;
using DAL.Mappers;
using Microsoft.Extensions.Configuration;
using Shared_Projet_ASP.Repositories;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Services
{
    public class ProduitService : BaseService, IProduitRepository<Produit>
    {
        public ProduitService(IConfiguration configuration) : base(configuration, "projet-asp") { }

        public void Delete(int id)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = connection.CreateCommand())
                {
                    command.CommandText = "SP_Produit_Delete";
                    command.Parameters.AddWithValue("id_prod", id);
                    command.CommandType = CommandType.StoredProcedure;
                    connection.Open();
                    if (command.ExecuteNonQuery() <= 0)
                    {
                        throw new ArgumentOutOfRangeException(nameof(id), $"L'identifiant {id} ne correspond à aucune valeur.");
                    }
                }
            }
        }

        public IEnumerable<Produit> Get()
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = connection.CreateCommand())
                {
                    command.CommandText = "SP_Produit_GetAll";
                    command.CommandType = CommandType.StoredProcedure;
                    connection.Open();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            yield return reader.ToProduit();
                        }
                    }
                }
            }
        }

        public Produit Get(int id)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = connection.CreateCommand())
                {
                    command.CommandText = "SP_Produit_GetById";
                    command.Parameters.AddWithValue("id_prod", id);
                    command.CommandType = CommandType.StoredProcedure;
                    connection.Open();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            return reader.ToProduit();
                        }
                        throw new ArgumentOutOfRangeException(nameof(id), $"L'identifiant {id} ne correspond à aucune valeur");
                    }
                }
            }
        }

        public int Insert(Produit entity)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = connection.CreateCommand())
                {
                    command.CommandText = "SP_Produit_Insert";
                    command.Parameters.AddWithValue("no", entity.Name);
                    command.Parameters.AddWithValue("desc", entity.Description);
                    command.Parameters.AddWithValue("pri", entity.Price);
                    command.Parameters.AddWithValue("cr_ec", entity.Eco_Cri);
                    command.Parameters.AddWithValue("id_cat", entity.Id_Cat);
                    command.CommandType = CommandType.StoredProcedure;
                    connection.Open();

                    return (int)command.ExecuteScalar();

                }
            }
        }

        public void Update(Produit entity)
        {
            throw new NotImplementedException();
        }
    }
}
