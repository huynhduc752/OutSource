using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebShop.Models;

namespace WebShop.Areas.Admins.Controllers
{
    public class AdminController : Controller
    {
        // GET: Admins/Admin
        WebShopEntities _db = new WebShopEntities();

        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public JsonResult Login(string Email, string Password)
        {
            var user = _db.Admins.Where(x => x.Email == Email && x.Password == Password).FirstOrDefault();
            if (user != null)
            {
                Session["User"] = user;
                Session["UserName"] = user.Name;
                return Json(true, JsonRequestBehavior.AllowGet);
            }
            return Json(false, JsonRequestBehavior.AllowGet);
        }

        public ActionResult LogOut()
        {
            Session.Clear();
            return Redirect("/Admins/Admin/Login");
        }


        public ActionResult ChangePassword()
        {
            return View();
        }
        [HttpPost]
        public JsonResult ChangePassword(string oldPass, string newPass)
        {
            var userId = ((Admin)Session["User"]).Id;
            var user = _db.Admins.Where(x => x.Id == userId).FirstOrDefault();
            if (user.Password == oldPass)
            {
                user.Password = newPass;
                _db.SaveChanges();
                return Json(true, JsonRequestBehavior.AllowGet);
            }
            else
            {
                return Json(false, JsonRequestBehavior.AllowGet);
            }
         
        }

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
            int count = _db.Admins.Where(x => x.IsDeleted == false).Count();
            var data = _db.Admins.Where(x => x.IsDeleted == false).OrderBy(x => x.Id).Skip(((int)pageNumber - 1) * pageSize).Take(pageSize).ToList();
            ViewBag.pageNumber = pageNumber;
            if (!String.IsNullOrEmpty(search))
            {
                data = _db.Admins.Where(x => x.IsDeleted == false && (x.UserName.Contains(search) || x.Name.Contains(search) || x.Phone.Contains(search) || x.Email.Contains(search))).OrderBy(x => x.Id).Skip(((int)pageNumber - 1) * pageSize).Take(pageSize).ToList();
                count = _db.Admins.Where(x => x.IsDeleted == false && (x.UserName.Contains(search) || x.Name.Contains(search) || x.Phone.Contains(search) || x.Email.Contains(search))).Count();

                ViewBag.pageNumber = pageNumber;
            }
            ViewBag.countPage = count % pageSize == 0 ? count / pageSize : count / pageSize + 1;
            return PartialView(data);
        }

        public JsonResult AddOrUpdate(Admin customer)
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
                    var cus = _db.Admins.Find(customer.Id);
                    cus.Name = customer.Name;
                    cus.UserName = customer.UserName;
                    cus.Email = customer.Email;
                    cus.Phone = customer.Phone;
                    cus.Gender = customer.Gender;
                    cus.IsAdmins = customer.IsAdmins;
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
        public JsonResult GetAdminById(int id)
        {
            var customer = _db.Admins.Find(id);
            return Json(customer, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public PartialViewResult _ViewDetail(int id)
        {
            var customer = _db.Admins.Find(id);
            return PartialView(customer);
        }

        [HttpPost]
        public JsonResult Delete(int? id)
        {
            var customer = _db.Admins.Find(id);
            if (customer == null)
                return Json(false, JsonRequestBehavior.AllowGet);
            customer.IsDeleted = true;
            _db.Entry(customer).State = System.Data.Entity.EntityState.Modified;
            _db.SaveChanges();
            return Json(true, JsonRequestBehavior.AllowGet);
        }
    }
}