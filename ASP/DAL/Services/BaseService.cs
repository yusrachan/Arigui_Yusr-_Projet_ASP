using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Services
{
    public abstract class BaseService
    {
        protected readonly string connectionString;
        public BaseService(IConfiguration configuration, string dbname)
        {
            connectionString = configuration.GetConnectionString(dbname);
        }

        protected BaseService(IConfiguration configuration)
        {
        }
    }
}
