using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebShop.Models;

namespace WebShop.ViewModel
{
    public class OrderViewModel
    {
        public Order order { get; set; }
        public Customer customer { get; set; }
        public Admin admin { get; set; }
    }
}