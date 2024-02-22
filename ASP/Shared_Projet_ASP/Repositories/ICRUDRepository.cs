namespace Shared_Projet_ASP.Repositories
{
    public interface ICRUDRepository<TEntity, TId>
    {
        IEnumerable<TEntity> Get();
        TEntity Get(TId id);
        TId Insert(TEntity entity);
        void Update(TEntity entity);
        void Delete(TId id);
    }
}
