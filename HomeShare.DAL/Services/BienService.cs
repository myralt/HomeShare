using HomeShare.Common.Repositories;
using HomeShare.DAL.Entities;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace HomeShare.DAL.Services
{
    public class BienService : ServiceBase, IBienRepository<Bien>
    {
        public void Delete(int id)
        {
            throw new NotImplementedException();
        }

        public Bien Get(int id)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<Bien> GetAll()
        {
            using (SqlConnection connect = new SqlConnection(_connection))
            {
                using (SqlCommand cmd = connect.CreateCommand())
                {
                    cmd.CommandText = "SELECT [IdBien], [Photo], [Titre], [DescCourte], [Pays].[Libelle], [NombrePerson] " +
                        "FROM [BienEchange]" +
                        "JOIN [Pays]" +
                        "ON [BienEchange].[Pays] = [Pays].[IdPays]";
                    connect.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read()) yield return Mapper.ToBien(reader);
                }
            }
        }

        public int Insert(Bien entity)
        {
            throw new NotImplementedException();
        }

        public void Update(Bien entity)
        {
            throw new NotImplementedException();
        }
    }
}
