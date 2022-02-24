using HomeShare.BLL.Entities;
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
        
        public static BienBLL ToBienBLL(this Bien bien)
        {
            if (bien is null) return null;
            return new BienBLL
            {
                Id = bien.Id,
                Titre = bien.Titre,
                DescCourte = bien.DescCourte,
                DescLongue = bien.DescLongue,
                NombrePersonnes = bien.NombrePersonnes,
                Pays = bien.Pays,
                Ville = bien.Ville,
                Rue = bien.Rue,
                Numero = bien.Numero,
                CodePostal = bien.CodePostal,
                Photo = bien.Photo,
                AssuranceObligatoire = bien.AssuranceObligatoire,
                Latitude = bien.Latitude,
                Longitude = bien.Longitude,
                DateCreation = bien.DateCreation,
                IdMembre = bien.IdMembre
            };
        }
    }
}
