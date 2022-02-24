using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HomeShare.Common.Repositories
{
    public interface IMembreRepository<TMembre> : IRepository<TMembre, int>
    {
        // Get a user by their id.
        // Get all users to check credentials.
        // Insert a new user: check if email not in use, generate login and encrypt password.
        // Update a user's information: check fields provided.
        // Delete a user.
    }
}
