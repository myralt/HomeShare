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

        public void Insert(Membre entity)
        {
            using (SqlConnection connect = new SqlConnection(_connection))
            {
                using (SqlCommand cmd = connect.CreateCommand())
                {
                    
                }
            }
        }

        public void Update(Membre entity)
        {
            throw new NotImplementedException();
        }
    }
}
