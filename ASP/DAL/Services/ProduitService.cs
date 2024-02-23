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
                    command.Parameters.AddWithValue("no", entity.nom);
                    command.Parameters.AddWithValue("desc", entity.description);
                    command.Parameters.AddWithValue("pri", entity.prix);
                    command.Parameters.AddWithValue("cr_ec", entity.cri_eco);
                    command.Parameters.AddWithValue("id_cat", entity.Id_Cat);
                    command.CommandType = CommandType.StoredProcedure;
                    connection.Open();

                    return (int)command.ExecuteScalar();

                }
            }
        }

        public IEnumerable<Produit> Search(string searchTerm, int? catId, string ecoCrit)
        {
            var products = new List<Produit>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = connection.CreateCommand())
                {
                    var sql = new StringBuilder(
                        "SELECT * FROM Produit WHERE 1=1");

                    if (!string.IsNullOrEmpty(searchTerm))
                    {
                        sql.Append(" AND nom LIKE @searchTerm");
                        command.Parameters.AddWithValue("@searchTerm", $"%{searchTerm}%");
                    }

                    if (catId.HasValue)
                    {
                        sql.Append(" AND Id_Cat = @categoryId");
                        command.Parameters.AddWithValue("@categoryId", catId.Value);
                    }

                    if (!string.IsNullOrEmpty(ecoCrit))
                    {
                        sql.Append(" AND cri_eco LIKE @ecoCrit");
                        command.Parameters.AddWithValue("@ecoCrit", $"%{ecoCrit}%");
                    }

                    command.CommandText = sql.ToString();
                    connection.Open();

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            var product = new Produit()
                            {
                                Id_Prod = reader.GetInt32(reader.GetOrdinal("Id_Prod")),
                                nom = reader.GetString(reader.GetOrdinal("nom")),
                                description = reader.GetString(reader.GetOrdinal("description")),
                                prix = reader.GetFloat(reader.GetOrdinal("prix")),
                                cri_eco = reader.GetString(reader.GetOrdinal("cri_eco")),
                                Id_Cat = reader.GetInt32(reader.GetOrdinal("Id_Cat")),
                            };
                            products.Add(product);
                        }
                    }
                }
            }
            return products;
        }

        public void Update(Produit entity)
        {
            throw new NotImplementedException();
        }
    }
}
