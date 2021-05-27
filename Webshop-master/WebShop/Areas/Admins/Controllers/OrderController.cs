using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebShop.Models;
using WebShop.ViewModel;

namespace WebShop.Areas.Admins.Controllers
{
    public class OrderController : Controller
    {
        // GET: Admins/Order
        WebShopEntities _db = new WebShopEntities();
        public ActionResult Index()
        {
            return View();
        }
        // trả về 1 đoạn html
        public PartialViewResult _ViewTable(int? pageNumber, string search)
        {
            int pageSize = 10;
            if (pageNumber == null)
                pageNumber = 1;
            var data = (from o in _db.Orders.ToList()
                        join a in _db.Admins.ToList()
                            on o.AdminId equals a.Id into checkAdmin
                        from a in checkAdmin.DefaultIfEmpty()
                        join c in _db.Customers.ToList()
                        on o.CustomerId equals c.Id into check
                        from c in check.DefaultIfEmpty()
                        where o.IsDeleted == false
                        select new OrderViewModel
                        {
                            order = o,
                            admin = a != null?a: new Admin() {Name="" },
                            customer = c!=null?c:new Customer() { Name = "",Phone =""}
                        });
            var count = data.Count();
            ViewBag.pageNumber = pageNumber;
            if (!string.IsNullOrEmpty(search))
            {
                data = (from o in _db.Orders.ToList()
                        join a in _db.Admins.ToList()
                            on o.AdminId equals a.Id into checkAdmin
                        from a in checkAdmin.DefaultIfEmpty()
                        join c in _db.Customers.ToList()
                        on o.CustomerId equals c.Id into check
                        from c in check.DefaultIfEmpty()
                        where o.IsDeleted == false
                        select new OrderViewModel
                        {
                            order = o,
                            admin = a != null ? a : new Admin() { Name = "" },
                            customer = c != null ? c : new Customer() { Name = "", Phone = "" }
                        });
                data = data.Where(x => x.admin.Name.Contains(search) || x.customer.Name.Contains(search) || x.customer.Phone.Contains(search) || x.customer.Email.Contains(search));
                count = data.Count();
                ViewBag.pageNumber = pageNumber;
            }
            data = data.Skip((int)(pageSize * (pageNumber - 1))).Take(pageSize).ToList();
            ViewBag.countPage = count % pageSize == 0 ? count / pageSize : count / pageSize + 1;
            return PartialView(data);
        }

        public ActionResult Create()
        {
            ViewBag.Customer = _db.Customers.Where(x => x.IsDeleted == false).ToList();
            ViewBag.Product = _db.Products.Where(x => x.IsDeleted == false).ToList();
            return View();
        }

        [HttpPost]
        public JsonResult GetSizeOfProduct(int Id)
        {
            var data = (from size in _db.Sizes
                        join ps in _db.ProductSizes on size.Id equals ps.Size
                        where ps.ProductId == Id
                        select new
                        {
                            size,
                            ps
                        }).ToList();
            return Json(data);
        }

        public ActionResult Edit(int id)
        {
            ViewBag.Customer = _db.Customers.Where(x => x.IsDeleted == false).ToList();
            ViewBag.Product = _db.Products.Where(x => x.IsDeleted == false).ToList();
            ViewBag.OrderDetail = (from o in _db.OrderDetails
                                   join ps in _db.ProductSizes on o.ProductSizeId equals ps.Id
                                   join p in _db.Products on ps.ProductId equals p.Id
                                   join s in _db.Sizes on ps.Size equals s.Id
                                   where o.OrderId == id
                                   select new OrderDetailViewModel
                                   {
                                       order = o,
                                       productName = p.Name,
                                       sizeName = s.Name
                                   }).ToList();
            var model = _db.Orders.FirstOrDefault(x => x.Id == id);
            return View(model);
        }

        public JsonResult AddOrUpdate(Order order, List<OrderDetail> orderDetail)
        {
            try
            {
                if (order.Id == 0)
                {
                    order.AdminId = ((Admin)Session["User"]).Id;
                    order.CreatedDate = DateTime.Now;
                    order.IsDeleted = false;
                    _db.Entry(order).State = System.Data.Entity.EntityState.Added;
                    _db.SaveChanges();

                    var id = _db.Orders.OrderByDescending(x => x.Id).FirstOrDefault().Id;
                    if (orderDetail != null)
                    {
                        orderDetail = orderDetail.Select(x => { x.OrderId = id; return x; }).ToList();
                    }
                    _db.OrderDetails.AddRange(orderDetail);
                    _db.SaveChanges();
                    foreach (var item in orderDetail)
                    {
                        var obj = _db.ProductSizes.Find(item.ProductSizeId);
                        obj.Stock -= item.Stock;
                        _db.SaveChanges();
                    }
                }
                else
                {
                    var cus = _db.Orders.Find(order.Id);
                    cus.AdminId = ((Admin)Session["User"]).Id;
                    cus.Status = order.Status;
                    cus.UpdatedBy = Session["UserName"] == null ? "Admin" : Session["UserName"].ToString();
                    cus.UpdatedDate = DateTime.Now;
                    _db.SaveChanges();

                    var old = _db.OrderDetails.Where(x => x.OrderId == cus.Id).ToList();
                    foreach (var item in old)
                    {
                        var obj = _db.ProductSizes.Find(item.ProductSizeId);
                        obj.Stock += item.Stock;
                        _db.SaveChanges();
                    }
                    _db.OrderDetails.RemoveRange(old);
                    if (orderDetail != null)
                    {
                        orderDetail = orderDetail.Select(x => { x.OrderId = cus.Id; return x; }).ToList();
                    }
                    // cập nhật lại data
                    _db.OrderDetails.AddRange(orderDetail);
                    _db.SaveChanges();
                    foreach(var item in orderDetail)
                    {
                        var obj = _db.ProductSizes.Find(item.ProductSizeId);
                        obj.Stock -= item.Stock;
                        _db.SaveChanges();
                    }
                }
                return Json(true, JsonRequestBehavior.AllowGet);
            }
            catch (Exception)
            {
                return Json(false, JsonRequestBehavior.AllowGet);
            }
        }

        [HttpPost]
        public PartialViewResult _ViewDetail(int id)
        {
            ViewBag.OrderDetail = (from o in _db.OrderDetails
                                   join ps in _db.ProductSizes on o.ProductSizeId equals ps.Id
                                   join p in _db.Products on ps.ProductId equals p.Id
                                   join s in _db.Sizes on ps.Size equals s.Id
                                   where o.OrderId == id
                                   select new OrderDetailViewModel
                                   {
                                       order = o,
                                       productName = p.Name,
                                       sizeName = s.Name
                                   }).ToList();

            var data = (from o in _db.Orders.ToList()
                        join a in _db.Admins.ToList()
                            on o.AdminId equals a.Id
                        join c in _db.Customers.ToList()
                        on o.CustomerId equals c.Id
                        where o.Id == id && o.IsDeleted == false
                        select new OrderViewModel
                        {
                            order = o,
                            admin = a,
                            customer = c
                        }).ToList().FirstOrDefault();
            return PartialView(data);
        }

        [HttpPost]
        public JsonResult Delete(int? id)
        {
            var order = _db.Orders.Find(id);
            if (order == null)
                return Json(false, JsonRequestBehavior.AllowGet);
            order.IsDeleted = true;
            _db.Entry(order).State = System.Data.Entity.EntityState.Modified;
            _db.SaveChanges();
            return Json(true, JsonRequestBehavior.AllowGet);
        }
    }
}