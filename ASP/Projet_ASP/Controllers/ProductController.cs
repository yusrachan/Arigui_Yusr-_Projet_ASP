using BLL.Entities;
using Microsoft.AspNetCore.Mvc;
using Projet_ASP.Handlers;
using Projet_ASP.Models;
using Shared_Projet_ASP.Repositories;

namespace Projet_ASP.Controllers
{
    public class ProductController : Controller
    {
        private readonly IProduitRepository<Produit> _produitRepository;

        public ProductController(IProduitRepository<Produit> produitRepository)
        {
            _produitRepository = produitRepository;
        }


        // GET: ProductController
        public ActionResult Index()
        {
            IEnumerable<ProductListItem> model = _produitRepository.Get().Select(d => d.ToListItem());
            return View();
        }

        // GET: ProductController/Details/5
        public ActionResult Details(int id)
        {
            ProductDetails model = _produitRepository.Get(id).ToDetails();
            return View(model);
        }

        // GET: ProductController/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: ProductController/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(ProductCreateForm form)
        {
            try
            {
                if (!ModelState.IsValid)
                {
                    throw new Exception();
                }
                int id = _produitRepository.Insert(form.ToBLL());
                return RedirectToAction(nameof(Details), new {id});
            }
            catch
            {
                return View();
            }
        }

        // GET: ProductController/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: ProductController/Edit/5
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

        // GET: ProductController/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: ProductController/Delete/5
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
    }
}
