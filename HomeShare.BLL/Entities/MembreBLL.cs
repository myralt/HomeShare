using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace HomeShare.BLL
{
    public class MembreBLL
    {
        private string _nom;
        private string _prenom;
        private string _email;
        private string _telephone;
        //User class?
        private string _login;
        //private string _password;

        public int Id { get; set; } //Validate if Id also exists in database each time access is requested.
        public string Pays { get; set; }
        public string Password { get; set; }

        public string Nom
        {
            get { return _nom; }
            set {
                if (string.IsNullOrEmpty(value)) throw new ArgumentNullException(nameof(value));
                string nom = value.Trim();

                if (nom.Length > 50) throw new ArgumentOutOfRangeException(nameof(nom));
                _nom = nom; 
            }
        }

        public string Prenom
        {
            get { return _prenom; }
            set
            {
                if (string.IsNullOrEmpty(value)) throw new ArgumentNullException(nameof(value));
                string prenom = value.Trim();

                if (prenom.Length > 50) throw new ArgumentOutOfRangeException(nameof(prenom));

                _prenom = prenom;
            }
        }

        public string Email { 
            get 
            { 
                return _email; 
            }
            set
            {
                if (string.IsNullOrEmpty(value)) throw new ArgumentNullException(nameof(value));
                string email = value.Trim();

                if (email.Length > 50) throw new ArgumentOutOfRangeException(nameof(email));

                //Email validation in MembreClientService

                _email = email;
            }
        
        }

        public string Telephone
        {
            get { return _telephone; }
            set 
            {
                if (string.IsNullOrEmpty(value)) throw new ArgumentNullException(nameof(value));
                string telephone = value.Trim();

                if (telephone.Length > 20) throw new ArgumentOutOfRangeException(nameof(telephone));

                _telephone = telephone; 
            }

        }

        public string Login
        {
            get { return _login; }
            set 
            {
                if (string.IsNullOrWhiteSpace(this.Nom) || string.IsNullOrWhiteSpace(this.Prenom)) 
                    throw new FormatException();

                int nomLength = Nom.Length;
                if (nomLength > 5) nomLength = 5;
                
                string login = Prenom[0] + Nom.Substring(0, nomLength);
                _login = login; 
            }
        }
        
    }
}
