using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Projet_ASP.Models
{
    public class ProductDetails
    {
        [ScaffoldColumn(false)]
        public int Id_Prod { get; set; }

        [DisplayName("Nom")]
        public string Name { get; set; }

        [DisplayName("Description")]
        public string? Description { get; set; }

        [DisplayName("Prix")]
        public double Price { get; set; }

        [DisplayName("Critère écologique")]
        public string? Eco_Cri { get; set; }

        [DisplayName("Numéro de la catégorie")]
        public string Id_Cat { get; set; }

    }
}
