using DL = DAL.Entities;
using BLL.Entities;
using BLL.Mappers;
using Shared_Projet_ASP.Repositories;

namespace BLL.Services
{
    public class CategoriesService : ICategoriesRepository<Categories>
    {
        private readonly ICategoriesRepository<DL.Categories> _repository;

        public CategoriesService(ICategoriesRepository<DL.Categories> repository)
        {
            _repository = repository;
        }

        public void Delete(int id)
        {
            _repository.Delete(id);
        }

        public IEnumerable<Categories> Get()
        {
            return _repository.Get().Select(d => d.ToBLL());
        }

        public Categories Get(int id)
        {
            return _repository.Get(id).ToBLL();
        }

        public int Insert(Categories entity)
        {
            return _repository.Insert(entity.ToDAL());
        }

        public void Update(Categories entity)
        {
            _repository.Update(entity.ToDAL());
        }
    }
}
