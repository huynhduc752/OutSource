using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebShop.Models;

namespace WebShop.ViewModel
{
    public class OrderDetailViewModel
    {
        public OrderDetail order { get; set; }
        public string productName { get; set; }
        public string sizeName { get; set; }
    }
}