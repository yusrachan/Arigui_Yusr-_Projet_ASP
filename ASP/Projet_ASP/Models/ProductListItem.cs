using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Projet_ASP.Models
{
    public class ProductListItem
    {
        [ScaffoldColumn(false)]
        public int Id_Prod {  get; set; }

        [DisplayName("Nom")]
        public string Name { get; set; }

        [DisplayName("Prix")]
        public double Price { get; set; }

    }
}
