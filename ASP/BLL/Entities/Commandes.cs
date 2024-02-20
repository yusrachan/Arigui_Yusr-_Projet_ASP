using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Entities
{
    public class Commandes
    {
        public int Id_Com { get; set; }
        public int Quantite { get; set; }
        public int Id_Prod { get; set; }

        public Commandes(int id_Com, int quantite, int id_Prod)
        {
            Id_Com = id_Com;
            Quantite = quantite;
            Id_Prod = id_Prod;
        }
    }
}
