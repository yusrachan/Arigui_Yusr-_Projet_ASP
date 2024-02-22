using BLL.Entities;
using BLL.Mappers;
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
        private readonly IProduitRepository<DAL.Entities.Produit> _repository;

        public ProduitService(IProduitRepository<DAL.Entities.Produit> repository)
        {
            _repository = repository;
        }

        public void Delete(int id)
        {
            _repository.Delete(id);
        }

        public IEnumerable<Produit> Get()
        {
            return _repository.Get().Select(d => d.ToBLL());
        }

        public Produit Get(int id)
        {
            return _repository.Get(id).ToBLL();
        }

        public int Insert(Produit entity)
        {
            return _repository.Insert(entity.ToDAL());
        }

        public void Update(Produit entity)
        {
            _repository.Update(entity.ToDAL());
        }
    }
}
