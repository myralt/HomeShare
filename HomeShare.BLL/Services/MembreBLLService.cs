using System.Collections.Generic;
using System;
using HomeShare.Common.Repositories;
using HomeShare.DAL.Entities;


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

        public void Insert(MembreBLL entity)
        {
            throw new NotImplementedException();
            //Normally incoming input is valid and sanitised.
            //But does the entity exist already?
            //And is the email address already in use?
            //Call procedure to insert user and encrypt password.
        }

        public void Update(MembreBLL entity)
        {
            throw new NotImplementedException();
        }

    }
}
