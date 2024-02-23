using BLL.Entities;
using BLL.Mappers;
using DAL.Services;
using Shared_Projet_ASP.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Services
{
    public class ProduitService : IProduitRepository<Produit>
    {
        private readonly IProduitRepository<DAL.Entities.Produit> _prodRepository;
        private readonly IMediasRepository<DAL.Entities.Medias> _mediasRepository;
        private readonly MediasService _mediasService;

        public ProduitService(IProduitRepository<DAL.Entities.Produit> prodRepository, IMediasRepository<DAL.Entities.Medias> mediasRepository, MediasService mediasService)
        {
            _prodRepository = prodRepository;
            _mediasRepository = mediasRepository;
            _mediasService = mediasService;
        }
        

        public IEnumerable<Produit> GetProdFirstMed()
        {
            var prods = _prodRepository.Get().ToList();

            var prodsModel = prods.Select(prod =>
            {
                var viewMod = new Produit
                {
                    Id_Prod = prod.Id_Prod,
                    nom = prod.nom,
                    description = prod.description,
                    prix = prod.prix,
                    cri_eco = prod.cri_eco,
                    Id_Cat = prod.Id_Cat,
                    UrlPremierMedia = _mediasService.GetFirstMedForProd(prod.Id_Prod)?.lien
                };
                return viewMod;
            }).ToList();

            return prodsModel;
        }
        public void Delete(int id)
        {
            _prodRepository.Delete(id);
        }

        public IEnumerable<Produit> Get()
        {
            return _prodRepository.Get().Select(d => d.ToBLL());
        }

        public Produit Get(int id)
        {
            return _prodRepository.Get(id).ToBLL();
        }

        public int Insert(Produit entity)
        {
            return _prodRepository.Insert(entity.ToDAL());
        }

        public IEnumerable<Produit> Search(string searchTerm)
        {
            throw new NotImplementedException();
        }

        public void Update(Produit entity)
        {
            _prodRepository.Update(entity.ToDAL());
        }

        IEnumerable<Produit> IProduitRepository<Produit>.Search(string searchTerm, int? catId, string ecoCrit)
        {
            throw new NotImplementedException();
        }
    }
}
