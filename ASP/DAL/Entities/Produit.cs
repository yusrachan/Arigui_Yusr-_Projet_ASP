using System.Net.Sockets;

namespace DAL.Entities
{
    public class Produit
    {
        public int Id_Prod { get; set; }
        public string nom { get; set; }
        public string? description { get; set; }
        public float prix { get; set; }
        public string? cri_eco { get; set; }
        public int Id_Cat { get; set; }
    }
}
