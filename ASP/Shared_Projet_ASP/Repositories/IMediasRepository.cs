﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Shared_Projet_ASP.Repositories
{
    public interface IMediasRepository<TEntity> : ICRUDRepository<TEntity, int>
    {
    }
}