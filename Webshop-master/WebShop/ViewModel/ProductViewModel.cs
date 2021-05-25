using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebShop.Models;

namespace WebShop.ViewModel
{
    public class ProductViewModel
    {
        public Product product { get; set; }
        public Category category { get; set; }
    }
}