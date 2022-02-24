using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HomeShare.BLL.Entities
{
    public class BienBLL
    {
        public int Id { get; set; }
        public string Titre { get; set; }
        public string DescCourte { get; set; }
        public string DescLongue { get; set; }
        public int NombrePersonnes { get; set; }
        public string Pays { get; set; }
        public string Ville { get; set; }
        public string Rue { get; set; }
        public string Numero { get; set; }
        public string CodePostal { get; set; }
        public string Photo { get; set; }
        public bool AssuranceObligatoire { get; set; }
        public string Latitude { get; set; }
        public string Longitude { get; set; }
        public int IdMembre { get; set; }
        public DateTime DateCreation { get; set; }
    }
}
