using Microsoft.AspNetCore.Mvc.Rendering;
using System.ComponentModel.DataAnnotations;

namespace Projet_ASP.Models
{
    public class ProductCreateForm
    {
        [Required(ErrorMessage = "Le nom du produit est obligatoire.")]
        [MinLength(2, ErrorMessage = "Le nom du produit doit être composé de minimum 2 caractères.")]
        [MaxLength(64, ErrorMessage = "Le nom du produit doit être composé de maximum 64 caractères.")]
        public string nom { get; set; }

        [MaxLength(int.MaxValue, ErrorMessage = "La description est trop longue.")]
        public string? description { get; set; }

        [Required(ErrorMessage = "Le prix du produit est obligatoire.")]
        [Range(0.01, double.MaxValue, ErrorMessage = "Le prix doit être supérieur à 0.")]
        public float prix { get; set; }

        [MaxLength(64, ErrorMessage = "Le critère écologique doit être composé de maximum 64 caractères.")]
        public string? cri_eco { get; set; }

        [Required(ErrorMessage = "Le numéro de la catégorie du produit est obligatoire.")]
        public int Id_Cat { get; set; }

    }
}
