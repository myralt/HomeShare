using HomeShare.Common.Repositories;
using HomeShare.DAL.Entities;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;

namespace HomeShare.DAL.Services
{
    public class MembreService : ServiceBase, IMembreRepository<Membre>
    {
        public void Delete(int id)
        {
            throw new NotImplementedException();
        }

        public Membre Get(int id)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<Membre> GetAll()
        {
            throw new NotImplementedException();
        }

        public int Insert(Membre entity)
        {
            using (SqlConnection connect = new SqlConnection(_connection))
            {
                using (SqlCommand cmd = connect.CreateCommand())
                {
                    cmd.CommandText = "SELECT * FROM [Membre] WHERE Email = @email";
                    SqlParameter email = new SqlParameter { ParameterName = "email", Value = entity.Email };
                    cmd.Parameters.Add(email);
                    connect.Open();

                    if ((bool)cmd.ExecuteScalar()) throw new Exception("Email déjà utilisé");
                    connect.Close();

                    cmd.CommandText = "INSERT INTO [Membre]" +
                        "([Nom], [Prenom], [Email], [Pays], [Telephone], [Login], [Password]) " +
                        "OUTPUT [inserted].[IdMembre]" +
                        "VALUES (@nom, @prenom, @email, @pays, @tel, @login, @pass)";
                    SqlParameter nom = new SqlParameter { ParameterName = "nom", Value = entity.Nom};
                    SqlParameter prenom = new SqlParameter { ParameterName = "prenom", Value = entity.Prenom};
                    email = new SqlParameter { ParameterName = "email", Value = entity.Email};
                    SqlParameter pays = new SqlParameter { ParameterName = "pays", Value = 1};
                    SqlParameter tel = new SqlParameter { ParameterName = "tel", Value = entity.Telephone};
                    SqlParameter login = new SqlParameter { ParameterName = "login", Value = entity.Login};
                    SqlParameter pass = new SqlParameter { ParameterName = "pass", Value = entity.Password};
                    cmd.Parameters.Add(nom);
                    cmd.Parameters.Add(prenom);
                    cmd.Parameters.Add(email);
                    cmd.Parameters.Add(pays);
                    cmd.Parameters.Add(tel);
                    cmd.Parameters.Add(login);
                    cmd.Parameters.Add(pass);
                    connect.Open();

                    return (int)cmd.ExecuteScalar();
                }
            }
        }

        public void Update(Membre entity)
        {
            throw new NotImplementedException();
        }
    }
}
