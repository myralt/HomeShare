using System.Collections.Generic;


namespace HomeShare.Common.Repositories
{
    // Interface to implement all CRUD operations.
    public interface IRepository<TEntity, TId> : IGetRepository<TEntity, TId>
    {
        int Insert(TEntity entity);
        void Delete(TId id);
        void Update(TEntity entity);
    }
}
