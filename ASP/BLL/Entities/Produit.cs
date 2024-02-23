namespace BLL.Entities
{
    public class Produit
    {
        private List<Commandes> _commandes;
        public int Id_Prod { get; set; }
        public string nom { get; set; }
        public string? description { get; set; }
        public float prix { get; set; }
        public string? cri_eco { get; set; }
        public int Id_Cat { get; set; }
        public string UrlPremierMedia { get; set; }


        public Produit()
        {
            _commandes = new List<Commandes>();
        }

        public Produit(string name, string descriptio, float price, string cri_Eco, int id_cat) : this()
        {
            nom = name;
            description = descriptio;
            prix = price;
            cri_eco = cri_Eco;
            Id_Cat = id_cat;
        }

        public Produit(int id_prod, string nom, string description, float prix, string cri_eco, int id_cat) : this(nom, description, prix, cri_eco, id_cat)
        {
            Id_Prod = id_prod;
        }

    }
}
