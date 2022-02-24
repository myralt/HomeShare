using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace HoliDayRental.Models
{
    public class BienDetails
    {
        //Détails du bien:
        [ScaffoldColumn(false)]
        public int Id { get; set; }

        [DisplayName("Titre")]
        public string Titre { get; set; }

        [DisplayName("Description complète")]
        public string DescLongue { get; set; }

        [DisplayName("Nombre de personnes")]
        public int NombrePersonnes { get; set; }

        [DisplayName("Pays")]
        public string Pays { get; set; }

        [DisplayName("Adresse")]
        public string Ville { get; set; }
        public string Rue { get; set; }
        public string Numero { get; set; }
        public string CodePostal { get; set; }

        [DisplayName("Photo")]
        public string Photo { get; set; }

        [DisplayName("Assurance obligatoire")]
        public bool AssuranceObligatoire { get; set; }

        [ScaffoldColumn(false)]
        public string Latitude { get; set; }

        [ScaffoldColumn(false)]
        public string Longitude { get; set; }

        [ScaffoldColumn(false)]
        public int IdMembre { get; set; }

        [DisplayName("Date d'ajout du bien")]
        public DateTime DateCreation { get; set; }

        public Option[] Options { get; set; }

        //Détails du propriétaire:
        public string Nom { get; set; }
        public string Prenom { get; set; }
        public string MembrePays { get; set; }

        //Liste des avis:
        public Avis[] Avis { get; set; }
    }
}
