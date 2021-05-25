using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebShop.Models;
namespace WebShop.Areas.Admins.Controllers
{
    public class CustomersController : Controller
    {
        // GET: Admins/Customers

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
            int count = _db.Customers.Where(x => x.IsDeleted == false).Count();
            var data = _db.Customers.Where(x => x.IsDeleted == false).OrderBy(x=>x.Id).Skip(((int)pageNumber - 1) * pageSize).Take(pageSize).ToList();
            ViewBag.pageNumber = pageNumber;
            if (!String.IsNullOrEmpty(search))
            {
                data = _db.Customers.Where(x => x.IsDeleted == false && (x.UserName.Contains(search) || x.Name.Contains(search) || x.Phone.Contains(search) || x.Email.Contains(search))).OrderBy(x=>x.Id).Skip(((int)pageNumber - 1) * pageSize).Take(pageSize).ToList();
                count = _db.Customers.Where(x => x.IsDeleted == false && (x.UserName.Contains(search) || x.Name.Contains(search) || x.Phone.Contains(search) || x.Email.Contains(search))).Count();

                ViewBag.pageNumber = pageNumber;
            }
            ViewBag.countPage = count % pageSize == 0 ? count / pageSize : count / pageSize + 1;
            return PartialView(data);
        }

        public JsonResult AddOrUpdate(Customer customer)
        {
            try
            {
                if (customer.Id == 0)
                {
                    customer.CreatedBy = Session["UserName"] == null ? "Admin" : Session["UserName"].ToString();
                    customer.CreatedDate = DateTime.Now;
                    customer.IsDeleted = false;
                    _db.Entry(customer).State = System.Data.Entity.EntityState.Added;
                    _db.SaveChanges();
                }
                else
                {
                    var cus = _db.Customers.Find(customer.Id);
                    cus.Name = customer.Name;
                    cus.UserName = customer.UserName;
                    cus.Email = customer.Email;
                    cus.Phone = customer.Phone;
                    cus.Gender = customer.Gender;
                    cus.Status = customer.Status;
                    cus.UpdatedBy = Session["UserName"] == null ? "Admin" : Session["UserName"].ToString();
                    cus.UpdatedDate = DateTime.Now;
                    _db.SaveChanges();
                }
                return Json(true, JsonRequestBehavior.AllowGet);
            }
            catch (Exception)
            {
                return Json(false, JsonRequestBehavior.AllowGet);
            }
        }

        [HttpPost]
        public JsonResult GetCustomerById(int id)
        {
            var customer = _db.Customers.Find(id);
            return Json(customer, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public PartialViewResult _ViewDetail(int id)
        {
            var customer = _db.Customers.Find(id);
            return PartialView(customer);
        }

        [HttpPost]
        public JsonResult Delete(int? id)
        {
            var customer = _db.Customers.Find(id);
            if (customer == null)
                return Json(false, JsonRequestBehavior.AllowGet);
            customer.IsDeleted = true;
            _db.Entry(customer).State = System.Data.Entity.EntityState.Modified;
            _db.SaveChanges();
            return Json(true, JsonRequestBehavior.AllowGet);
        }

    }
}