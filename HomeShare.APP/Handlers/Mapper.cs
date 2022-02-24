using HoliDayRental.Models;
using HomeShare.BLL.Entities;


namespace HoliDayRental.Handlers
{
    public static class Mapper
    {
        public static MembreBLL ToMembreBLL(this AccountRegisterForm membre)
        {
            if (membre is null) return null;
            return new MembreBLL 
            {
                Nom = membre.Nom,
                Prenom = membre.Prenom,
                Telephone = membre.Telephone,
                Email = membre.Email,
                Password = membre.MotdePasse
            };
        }

        public static BienList ToBienList(this BienBLL bien)
        {
            if (bien is null) return null;
            return new BienList
            {
                Id = bien.Id,
                Titre = bien.Titre,
                DescCourte = bien.DescCourte,
                Pays = bien.Pays,
                Photo = bien.Photo,
                NombrePersonnes = bien.NombrePersonnes
            };
        }

        public static BienDetails ToBienDetails(this BienBLL bien)
        {
            if (bien is null) return null;
            return new BienDetails
            {
                Id = bien.Id,
                Titre = bien.Titre,
                DescLongue = bien.DescLongue,
                Pays = bien.Pays,
                Photo = bien.Photo,
                NombrePersonnes = bien.NombrePersonnes,
                IdMembre = bien.IdMembre,
                DateCreation = bien.DateCreation,
                Longitude = bien.Longitude,
                Latitude = bien.Latitude,
                AssuranceObligatoire = bien.AssuranceObligatoire,
                Ville = bien.Ville,
                Rue = bien.Rue,
                Numero = bien.Numero,
                CodePostal = bien.CodePostal

            };
        }
    }
}
