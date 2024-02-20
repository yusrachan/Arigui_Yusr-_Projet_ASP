﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Entities
{
    public class Produit
    {
        private List<Commandes> _commandes;
        public int Id_Prod { get; set; }
        public string nom { get; set; }
        public string? description { get; set; }
        public double prix { get; set; }
        public string cri_eco { get; set; }
        public int Id_Cat { get; set; }


    }
}