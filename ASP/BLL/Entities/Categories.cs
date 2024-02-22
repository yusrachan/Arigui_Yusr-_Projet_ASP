namespace BLL.Entities
{
    public class Categories
    {
        public int Id_Cat { get; set; }
        public string Nom { get; set; }

        public Categories(int id_Cat, string nom)
        {
            Id_Cat = id_Cat;
            Nom = nom;
        }
    }
}
