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
                Pays = (string)record["Libelle"],
                Photo = (string)record["Photo"],
                NombrePersonnes = (int)record["NombrePerson"]
            };
        }
    }
}
