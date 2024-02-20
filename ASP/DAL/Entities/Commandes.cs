using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Entities
{
    public class Commandes
    {
        public int Id_Com {  get; set; }
        public int Quantite { get; set; }
        public int Id_Prod { get; set; }
    }
}
