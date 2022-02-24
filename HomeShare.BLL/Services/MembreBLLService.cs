using System.Collections.Generic;
using System;
using HomeShare.Common.Repositories;
using HomeShare.DAL.Entities;
using HomeShare.BLL.Handlers;


namespace HomeShare.BLL
{
    public class MembreBLLService : IMembreRepository<MembreBLL>
    {
        private readonly IMembreRepository<Membre> _repo;

        public MembreBLLService(IMembreRepository<Membre> repo)
        {
            _repo = repo;
        }

        public void Delete(int id)
        {
            throw new NotImplementedException();
        }

        public MembreBLL Get(int id)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<MembreBLL> GetAll()
        {
            throw new NotImplementedException();
        }

        public int Insert(MembreBLL entity)
        {
            return _repo.Insert(entity.ToMembre());
        }

        public void Update(MembreBLL entity)
        {
            throw new NotImplementedException();
        }

    }
}
