using BLL.Entities;
using Shared_Projet_ASP.Repositories;

namespace BLL.Services
{
    public class CommandesServices : ICommandesRepository<Commandes>
    {
        private readonly ICommandesRepository<DAL.Entities.Commandes> _repository;

        public CommandesServices(ICommandesRepository<DAL.Entities.Commandes> repository)
        {
            _repository = repository;
        }
        public void Delete(int id)
        {
            _repository.Delete(id);
        }

        public IEnumerable<Commandes> Get()
        {
            throw new NotImplementedException();
        }

        public Commandes Get(int id)
        {
            throw new NotImplementedException();
        }

        public int Insert(Commandes entity)
        {
            throw new NotImplementedException();
        }

        public void Update(Commandes entity)
        {
            throw new NotImplementedException();
        }
    }
}
