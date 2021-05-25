using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.Mvc;
using WebShop.Models;
namespace WebShop.Controllers
{
    public class HomeController : Controller
    {
        WebShopEntities _db = new WebShopEntities();
        public ActionResult Index()
        {
            ViewBag.SlideShow = _db.Banners.Where(x => x.Status == true && x.IsDeleted == false).OrderBy(x => x.OrderBy).Take(3).ToList();
            ViewBag.HotProduct = _db.Products.Where(x => x.Status == true && x.IsDeleted == false).OrderBy(x => x.OrderBy).Take(4).ToList();

            var cate = _db.Categories.Where(x => x.Status == true && x.IsDeleted == false).OrderBy(x => x.OrderBy).ToList();
            var listProduct = new List<Product>();
            foreach (var item in cate)
            {
                Product p = _db.Products.Where(x => x.CategoryId == item.Id).OrderBy(x => x.OrderBy).FirstOrDefault();
                if (p != null)
                    listProduct.Add(p);
            }
            ViewBag.listProduct = listProduct;
            ViewBag.newProduct = _db.Products.Where(x => x.Status == true && x.IsDeleted == false).OrderByDescending(x => x.CreatedDate).Take(4).ToList();
            return View();
        }

        public ActionResult About(int id)
        {
            var product = _db.Products.Find(id);
            var productImage = _db.Product_Image.Where(x => x.ProductId == id).ToList();
            var size = _db.ProductSizes.Where(x => x.ProductId == id).ToList();
            List<Size> productSize = new List<Size>();
            foreach (var item in size)
            {
                var obj = _db.Sizes.Find(item.Size);
                productSize.Add(obj);
            }

            ViewBag.image = productImage;
            ViewBag.size = productSize;
            return View(product);
        }

        [HttpPost]
        public ActionResult GetPoductById(int id)
        {
            var product = _db.Products.Find(id);
            return Json(product, JsonRequestBehavior.AllowGet);
        }


        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
        public ActionResult Category(int id)
        {
            var data = _db.Products.Where(x => x.CategoryId == id && x.Status == true && x.IsDeleted == false).ToList();
            return View(data);
        }
        public ActionResult Cart()
        {
            return View();
        }

        [HttpPost]
        public JsonResult GetListOrder()
        {
            HttpCookie httpCookie = Request.Cookies["Cart"];
            if (httpCookie != null)
            {
                List<OrderDetail> order = JsonConvert.DeserializeObject<List<OrderDetail>>(httpCookie.Value);

                var data = (from o in order
                            join p in _db.Products on o.ProductId equals p.Id
                            select new
                            {
                                o,
                                p
                            }).ToList();
                return Json(data, JsonRequestBehavior.AllowGet);
            }
            return Json(true, JsonRequestBehavior.AllowGet);
        }

        public JsonResult AddToCart(OrderDetail orderDetail)
        {
            HttpCookie httpCookie = Request.Cookies["Cart"];
            if (httpCookie == null)
            {
                httpCookie = new HttpCookie("Cart");
                List<OrderDetail> or = new List<OrderDetail>();
                or.Add(orderDetail);
                httpCookie.Value = JsonConvert.SerializeObject(or);
            }
            else
            {
                List<OrderDetail> orders = JsonConvert.DeserializeObject<List<OrderDetail>>(httpCookie.Value);
                orders.Add(orderDetail);
                httpCookie.Value = JsonConvert.SerializeObject(orders);
            }
            httpCookie.Expires.AddDays(1000);
            Response.Cookies.Add(httpCookie);
            return Json(true, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult GetCategory()
        {
            var data = _db.Categories.Where(x => x.Status == true && x.IsDeleted == false).OrderBy(x => x.OrderBy).ToList();
            return Json(data, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult GetInformation()
        {
            var data = _db.Configs.Where(x => x.Status == true && x.IsDeleted == false).OrderBy(x => x.OrderBy).FirstOrDefault();
            return Json(data, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult SubcribeUser(Customer customer)
        {
            var user = _db.Customers.Where(x => x.Email == customer.Email || x.Phone == customer.Phone).FirstOrDefault();
            if (user == null)
            {
                customer.Status = true;
                customer.IsDeleted = false;
                customer.CreatedDate = DateTime.Now;
                _db.Entry<Customer>(customer).State = System.Data.Entity.EntityState.Added;
                _db.SaveChanges();
            }
            else
            {
                if (customer.Phone != null)
                    user.Phone = customer.Phone;
                if (customer.Email != null)
                    user.Email = customer.Email;
                user.UpdatedDate = DateTime.Now;
                _db.Entry<Customer>(user).State = System.Data.Entity.EntityState.Modified;
                _db.SaveChanges();
            }

            HttpCookie cus = Request.Cookies["Customer"];
            if (cus == null)
            {
                cus = new HttpCookie("Customer");
                var newCustomer = _db.Customers.OrderByDescending(x => x.Id).FirstOrDefault();
                cus.Value = JsonConvert.SerializeObject(newCustomer);
            }
            else
            {
                cus.Value = JsonConvert.SerializeObject(user);
            }

            cus.Expires.AddDays(1000);
            Response.Cookies.Add(cus);
            return Json(true, JsonRequestBehavior.AllowGet);
        }


        [HttpPost]
        public JsonResult GetLoginCustomer()
        {
            var user = Request.Cookies["Customer"];
            if (user != null)
            {
                var u = JsonConvert.DeserializeObject<Customer>(user.Value);
                return Json(u, JsonRequestBehavior.AllowGet);
            }
            return Json(false, JsonRequestBehavior.AllowGet);
        }


        public JsonResult Order(List<OrderDetail> orderDetail)
        {
            try
            {
                var cookiescustomer = Request.Cookies["Customer"];
                var customer = JsonConvert.DeserializeObject<Customer>(cookiescustomer.Value);

                Order order = new Order();
                order.CustomerId = customer.Id;
                order.CreatedDate = DateTime.Now;
                order.IsDeleted = false;
                order.Status = 1;
                _db.Entry(order).State = System.Data.Entity.EntityState.Added;
                _db.SaveChanges();

                var id = _db.Orders.OrderByDescending(x => x.Id).FirstOrDefault().Id;
                if (orderDetail != null)
                {
                    orderDetail = orderDetail.Select(x => { x.OrderId = id; return x; }).ToList();
                }
                _db.OrderDetails.AddRange(orderDetail);
                _db.SaveChanges();

                // xóa giỏ hàng cũ
                var cookies = Request.Cookies["Cart"];
                cookies.Expires = DateTime.Now.AddMinutes(1);

                return Json(true, JsonRequestBehavior.AllowGet);
            }
            catch (Exception)
            {
                return Json(false, JsonRequestBehavior.AllowGet);
            }
        }

        // mail send
        public partial class Obj
        {
            public string email { get; set; }
            public string name { get; set; }
            public string address { get; set; }
            public string phone { get; set; }
        }
        public JsonResult ConfirmEmail(Obj obj)
        {
            var smtp = new SmtpClient
            {
                Host = "smtp.gmail.com",
                Port = 587,
                EnableSsl = true,
                DeliveryMethod = SmtpDeliveryMethod.Network,
                UseDefaultCredentials = true,
                Credentials = new NetworkCredential("huynhducmadridista@gmail.com", "huynhduc752"),

            };
            var htmlBody = "";

            DirectoryInfo info = new DirectoryInfo(AppDomain.CurrentDomain.BaseDirectory);

            string infy = info.Parent.FullName;
            var path = Server.MapPath(Url.Content("~/SendEmail/SendMail.html"));
            using (StreamReader reader = new StreamReader(path))
            {
                htmlBody = reader.ReadToEnd();
                htmlBody = htmlBody.Replace("{{Email}}", obj.email);
                htmlBody = htmlBody.Replace("{{name}}", obj.name);
                htmlBody = htmlBody.Replace("{{address}}", obj.address);
                htmlBody = htmlBody.Replace("{{phone}}", obj.phone);

            }
            var mes = new MailMessage("huynhducmadridista@gmail.com", obj.email)
            {
                Subject = " Curnone",
                Body = ""
            };
            mes.IsBodyHtml = true;
            mes.Body = htmlBody;

            try
            {
                smtp.Send(mes);
                return Json(true);
            }
            catch (Exception e)
            {
                return Json(false);

            }
        }
    }
}