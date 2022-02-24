using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HomeShare.Common.Repositories
{
    // Interface to only implement Read operations.
    public interface IGetRepository<TEntity, TId>
    {
        TEntity Get(TId id);
        IEnumerable<TEntity> GetAll();
    }
}
