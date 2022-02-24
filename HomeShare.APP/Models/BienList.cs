using System.ComponentModel;
using System.ComponentModel.DataAnnotations;


namespace HoliDayRental.Models
{
    public class BienList
    {
        [ScaffoldColumn(false)]
        public int Id { get; set; }

        [DisplayName("Titre")]
        public string Titre { get; set; }

        [DisplayName("Description du bien")]
        public string DescCourte { get; set; }

        [DisplayName("Nombre de personnes")]
        public int NombrePersonnes { get; set; }

        [DisplayName("Pays")]
        public string Pays { get; set; }

        [DisplayName("Photo")]
        public string Photo { get; set; }
    }
}
