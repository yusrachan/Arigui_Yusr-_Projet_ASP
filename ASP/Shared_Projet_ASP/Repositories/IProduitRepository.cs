namespace Shared_Projet_ASP.Repositories
{
    public interface IProduitRepository<TEntity> : ICRUDRepository<TEntity, int>
    {
        IEnumerable<TEntity> Search(string searchTerm, int? catId, string ecoCrit);
    }
}
