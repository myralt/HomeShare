using System;


namespace HomeShare.DAL.Entities
{
    public class Avis
    {
        public int Id { get; set; }
        public int Note { get; set; }
        public string Message { get; set; }
        public int IdMembre { get; set; }
        public int IdBien { get; set; }
        public DateTime DateAvis { get; set; }
        public bool Approuve { get; set; }

    }
}
