using HomeShare.BLL.Entities;
using HomeShare.BLL.Handlers;
using HomeShare.Common.Repositories;
using HomeShare.DAL.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace HomeShare.BLL.Services
{
    public class BienBLLService : IBienRepository<BienBLL>
    {
        private readonly IBienRepository<Bien> _repo;

        public BienBLLService(IBienRepository<Bien> repo)
        {
            _repo = repo;
        }

        public void Delete(int id)
        {
            throw new NotImplementedException();
        }

        public BienBLL Get(int id)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<BienBLL> GetAll()
        {
            return _repo.GetAll().Select(b => b.ToBienBLL());
        }

        public int Insert(BienBLL entity)
        {
            throw new NotImplementedException();
        }

        public void Update(BienBLL entity)
        {
            throw new NotImplementedException();
        }
    }
}
