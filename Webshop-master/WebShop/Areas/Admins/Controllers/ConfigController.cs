using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebShop.Models;

namespace WebShop.Areas.Admins.Controllers
{
    public class ConfigController : Controller
    {
        // GET: Admins/Config
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
            int count = _db.Configs.Where(x => x.IsDeleted == false).Count();
            var data = _db.Configs.Where(x => x.IsDeleted == false).OrderBy(x => x.Id).Skip(((int)pageNumber - 1) * pageSize).Take(pageSize).ToList();
            ViewBag.pageNumber = pageNumber;
            ViewBag.countPage = count % pageSize == 0 ? count / pageSize : count / pageSize + 1;
            return PartialView(data);
        }

        public JsonResult AddOrUpdate(Config config)
        {
            try
            {
                if (config.Id == 0)
                {
                    config.CreatedBy = Session["UserName"] == null ? "Admin" : Session["UserName"].ToString();
                    config.CreatedDate = DateTime.Now;
                    config.IsDeleted = false;
                    _db.Entry(config).State = System.Data.Entity.EntityState.Added;
                    _db.SaveChanges();
                }
                else
                {
                    var cus = _db.Configs.Find(config.Id);
                    cus.Name = config.Name;
                    cus.Logo = config.Logo;
                    cus.Phone = config.Phone;
                    cus.Email = config.Email;
                    cus.Address = config.Address;
                    cus.Returrn = config.Returrn;
                    cus.Guarantee = config.Guarantee;
                    cus.OrderBy = config.OrderBy;
                    cus.Status = config.Status;
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
        public JsonResult GetConfigById(int id)
        {
            var config = _db.Configs.Find(id);
            return Json(config, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public PartialViewResult _ViewDetail(int id)
        {
            var config = _db.Configs.Find(id);
            return PartialView(config);
        }

        [HttpPost]
        public JsonResult Delete(int? id)
        {
            var config = _db.Configs.Find(id);
            if (config == null)
                return Json(false, JsonRequestBehavior.AllowGet);
            config.IsDeleted = true;
            _db.Entry(config).State = System.Data.Entity.EntityState.Modified;
            _db.SaveChanges();
            return Json(true, JsonRequestBehavior.AllowGet);
        }
    }
}