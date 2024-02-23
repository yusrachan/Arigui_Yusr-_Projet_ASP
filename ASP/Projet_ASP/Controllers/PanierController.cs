using BLL.Entities;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Shared_Projet_ASP.Repositories;
using System.Text.Json;

namespace Projet_ASP.Controllers
{
    public class PanierController : Controller
    {
        private readonly IProduitRepository<Produit> _repository;

        public PanierController(IProduitRepository<Produit> repository)
        {
            _repository = repository;
        }


        // GET: PanierController
        public ActionResult Index()
        {
            return View();
        }

        // GET: PanierController/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: PanierController/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: PanierController/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(IFormCollection collection)
        {
            try
            {
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }

        // GET: PanierController/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: PanierController/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(int id, IFormCollection collection)
        {
            try
            {
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }

        // GET: PanierController/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: PanierController/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Delete(int id, IFormCollection collection)
        {
            try
            {
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }

        public IActionResult Ajouter(int prodId)
        {
            var produit = _repository.Get(prodId);

            if (produit == null)
            {
                return NotFound();
            }

            List<int> panier;
            var panierJson = HttpContext.Session.GetString("Panier");

            if (string.IsNullOrEmpty(panierJson))
            {
                panier = new List<int>();
            }
            else
            {
                panier = JsonSerializer.Deserialize<List<int>>(panierJson);
            }

            panier.Add(prodId);
            panierJson = JsonSerializer.Serialize(panier);
            HttpContext.Session.SetString("Panier", panierJson);

            return RedirectToAction("Details", "Produit", new {id = prodId});
        }
    }
}
