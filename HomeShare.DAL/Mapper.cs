using HomeShare.DAL.Entities;
using System;
using System.Data;

namespace HomeShare.DAL
{
    public static class Mapper
    {
        //Methods to convert a DataRecord object into its corresponding entity object.
        //To be called in Services.
        public static Bien ToBien(IDataRecord record)
        {
            if (record is null) return null;
            return new Bien
            {
                Id = (int)record["IdBien"],
                Titre = (string)record["Titre"],
                DescCourte = (string)record["DescCourte"],
                DescLongue = (string)record["DescLong"],
                NombrePersonnes = (int)record["NombrePerson"],
                Pays = (string)record["Libelle"],
                Ville = (string)record["Ville"],
                Rue = (string)record["Rue"],
                Numero = (string)record["Numero"],
                CodePostal = (string)record["CodePostal"],
                Photo = (string)record["Photo"],
                AssuranceObligatoire = (bool)record["AssuranceObligatoire"],
                IdMembre = (int)record["IdMembre"],
                IsEnabled = (bool)record["IsEnabled"],
                DisabledDate = (record["DisabledDate"] is DBNull) ? null : (DateTime?)record["DisabledDate"],
                Latitude = (string)record["Latitude"],
                Longitude = (string)record["Longitude"],
                DateCreation = (DateTime)record["DateCreation"]
            };
        }
    }
}
