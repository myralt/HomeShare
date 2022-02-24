using System.ComponentModel.DataAnnotations;


namespace HoliDayRental.Models
{
    public class AccountRegisterForm
    {
        [Required(ErrorMessage = "Ce champs est obligatoire.")]
        [MaxLength(50, ErrorMessage = "Le nombre de caractères ne doit pas dépasser 50.")]
        public string Nom { get; set; }

        [Required(ErrorMessage = "Ce champs est obligatoire.")]
        [MaxLength(50, ErrorMessage = "Le nombre de caractères ne doit pas dépasser 50.")]
        public string Prenom { get; set; }
        
        [Required(ErrorMessage = "Ce champs est obligatoire.")]
        [MaxLength(256, ErrorMessage = "Le nombre de caractère ne doit pas dépasser 256.")]
        [EmailAddress(ErrorMessage = "Veuillez entrer une addresse email valide.")]
        public string Email { get; set; }
        
        [Required(ErrorMessage = "Ce champs est obligatoire.")]
        [MaxLength(20, ErrorMessage = "Le nombre de caractère ne doit pas dépasser 20.")]
        [Phone(ErrorMessage = "Veuillez entrer un numéro de téléphone valide.")]
        public string Telephone { get; set; }
        
        [Required(ErrorMessage = "Ce champs est obligatoire.")]
        [MaxLength(256, ErrorMessage = "Le nombre de caractère ne doit pas dépasser 256.")]
        public string MotdePasse { get; set; }
        
        [Required(ErrorMessage = "Ce champs est obligatoire.")]
        [MaxLength(256, ErrorMessage = "Le nombre de caractère ne doit pas dépasser 256.")]
        [Compare(nameof(MotdePasse), ErrorMessage = "Les mots de passe ne sont pas identiques.")]
        public string ReMotdePasse { get; set; }
        
        [Required(ErrorMessage = "Veuillez cocher la case.")]
        public bool Conditions { get; set; }

    }
}
