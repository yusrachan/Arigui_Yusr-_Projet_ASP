namespace BLL.Entities
{
    public class Produit
    {
        private List<Commandes> _commandes;
        public int Id_Prod { get; set; }
        public string Name { get; set; }
        public string? Description { get; set; }
        public double Price { get; set; }
        public string? Eco_Cri { get; set; }
        public int Id_Cat { get; set; }

        private Produit()
        {
            _commandes = new List<Commandes>();
        }

        public Produit(string name, string description, double price, string cri_Eco, int id_cat) : this()
        {
            Name = name;
            Description = description;
            Price = price;
            Eco_Cri = cri_Eco;
            Id_Cat = id_cat;
        }

        public Produit(int id_prod, string name, string description, double price, string cri_eco, int id_cat) : this(name, description, price, cri_eco, id_cat)
        {
            Id_Prod = id_prod;
        }

    }
}
