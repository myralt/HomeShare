using System;


namespace HoliDayRental.DAL.Entities
{
    public class Echange
    {
        public int IdMembre { get; set; }
        public int IdBien { get; set; }
        public DateTime DateDebEchange { get; set; }
        public DateTime DateFinEchange { get; set; }
        public bool? Assurance { get; set; }
        public bool Valide { get; set; }
    }
}
