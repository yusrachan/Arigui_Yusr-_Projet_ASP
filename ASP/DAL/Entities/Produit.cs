namespace DAL.Entities
{
    public class Produit
    {
        public int Id_Prod { get; set; }
        public string Name { get; set; }
        public string? Description { get; set; }
        public double Price { get; set; }
        public string? Eco_Cri { get; set; }
        public int Id_Cat { get; set; }
    }
}
