using DAL.Entities;
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
    public class MediasService : BaseService, IMediasRepository<Medias>
    {
        private readonly string _connectionString;

        public MediasService(IConfiguration configuration) : base(configuration, "projet-asp") { }

        public IEnumerable<Medias> GetMedias(int prodId)
        {
            var medias = new List<Medias>();

            using (var connection = new SqlConnection(_connectionString))
            {
                connection.Open();

                using(var command = new SqlCommand("SELECT * FROM Medias WHERE Id_Prod = @prodId", connection))
                {
                    command.Parameters.AddWithValue("@prodId", prodId);

                    using (var reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            var media = new Medias
                            {
                                Id_Med = reader.GetInt32(reader.GetOrdinal("Id_Med")),
                                Id_Prod = reader.GetInt32(reader.GetOrdinal("Id_Prod")),
                                lien = reader.GetString(reader.GetOrdinal("lien"))
                            };
                            medias.Add(media);
                        }
                    }
                }
            }
            return medias;
        }

        public int Insert(Medias media)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                var query = "INSERT INTO Medias (Id_Prod, lien) VALUES (@Id_Prod, @lien)";
                using (var command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Id_Prod", media.Id_Prod);
                    command.Parameters.AddWithValue("@lien", media.lien);

                    connection.Open();
                    return Convert.ToInt32(command.ExecuteScalar());
                }
            }
        }

        public Medias Get(int id)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                var query = "SELECT * FROM Medias WHERE Id_Med = @Id_Med";
                using (var command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Id_Med", id);

                    connection.Open();
                    using (var reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            return new Medias
                            {
                                Id_Med = reader.GetInt32(reader.GetOrdinal("Id_Med")),
                                Id_Prod = reader.GetInt32(reader.GetOrdinal("Id_Prod")),
                                lien = reader.GetString(reader.GetOrdinal("lien")),
                            };
                        }
                    }
                }
            }
            return null;
        }

        public void Update(Medias entity)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = connection.CreateCommand())
                {
                    command.CommandText = "SP_Medias_Update";
                    command.Parameters.AddWithValue("id_med", entity.Id_Med);
                    command.Parameters.AddWithValue("lien", entity.lien);
                    command.Parameters.AddWithValue("id_prod", entity.Id_Prod);

                    command.CommandType = CommandType.StoredProcedure;
                    connection.Open();
                    if (command.ExecuteNonQuery() <= 0) throw new ArgumentOutOfRangeException(nameof(entity.Id_Med), $"L'identifiant {entity.Id_Med} ne correspond à aucune valeur");
                }
            }
        }
        public void Delete(int id)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = connection.CreateCommand())
                {
                    command.CommandText = "SP_Medias_Delete";
                    command.Parameters.AddWithValue("id_med", id);
                    command.CommandType = CommandType.StoredProcedure;

                    connection.Open();
                    if (command.ExecuteNonQuery() <= 0)
                    {
                        throw new ArgumentOutOfRangeException(nameof(id), $"L'identifiant {id} ne correspond à aucune valeur.");
                    }
                }
            }
        }

        public IEnumerable<Medias> Get()
        {
            throw new NotImplementedException();
        }

        public Medias GetFirstMedForProd(int prodId)
        {
            Medias firstMed = null;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = connection.CreateCommand())
                {
                    command.CommandText = "SELECT TOP 1 * FROM Medias WHERE Id_Prod = @prodId ORDER BY Id_Med";
                    command.Parameters.AddWithValue("@prodId", prodId);

                        connection.Open();
                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                firstMed = new Medias
                                {
                                    Id_Med = reader.GetInt32(reader.GetOrdinal("Id_Med")),
                                    lien = reader.GetString(reader.GetOrdinal("lien")),
                                    Id_Prod = prodId
                                };
                            }
                        }                   
                }
            }
            return firstMed;
        }
    }
}
