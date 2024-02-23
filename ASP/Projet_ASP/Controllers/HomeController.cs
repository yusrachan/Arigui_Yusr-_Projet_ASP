using BLL.Services;
using Microsoft.AspNetCore.Mvc;
using Projet_ASP.Models;
using System.Diagnostics;

namespace Projet_ASP.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly ProduitService _produitService;

        public HomeController(ILogger<HomeController> logger, ProduitService produitService)
        {
            _logger = logger;
            _produitService = produitService;
        }

        public IActionResult Index()
        {
            var produits = _produitService.GetProdFirstMed();
            return View(produits);
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }

        public IActionResult Search(string searchTerm)
        {
            var searchResults = _produitService.Search(searchTerm);
            return View(searchResults);
        }
    }
}