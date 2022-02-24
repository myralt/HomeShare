using HoliDayRental.Models;
using HomeShare.BLL;

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
    }
}
