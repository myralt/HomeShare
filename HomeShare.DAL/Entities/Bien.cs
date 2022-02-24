using System;


namespace HomeShare.DAL.Entities
{
    public class Bien
    {
        public int IdBien { get; set; }
        public string Titre { get; set; }
        public string DescCourte { get; set; }
        public string DescLongue { get; set; }
        public int NombrePersonnes { get; set; }
        public int Pays { get; set; }
        public string Ville { get; set; }
        public string Rue { get; set; }
        public string Numero { get; set; }
        public string CodePostal { get; set; }
        public string Photo { get; set; }
        public bool AssuranceObligatoire { get; set; }
        public bool IsEnabled { get; set; }
        public DateTime? DisabledDate { get; set; }
        public string Latitude { get; set; }
        public string Longitude { get; set; }
        public int IdMembre { get; set; }
        public DateTime DateCreation { get; set; }
    }
}
