using HomeShare.DAL.Entities;
using System;


namespace HomeShare.BLL.Handlers
{
    public static class Mapper
    {
        public static Membre ToMembre(this MembreBLL membre)
        {
            if (membre is null) return null;
            return new Membre
            {
                Nom = membre.Nom,
                Prenom = membre.Prenom,
                Email = membre.Email,
                Telephone = membre.Telephone,
                Login = membre.Login,
                Password = membre.Password
            };
        } 
    }
}
