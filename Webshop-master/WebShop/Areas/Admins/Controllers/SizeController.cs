using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebShop.Models;

namespace WebShop.Areas.Admins.Controllers
{
    public class SizeController : Controller
    {
        // GET: Admins/Size
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
            int count = _db.Sizes.Count();
            var data = _db.Sizes.OrderBy(x => x.Id).Skip(((int)pageNumber - 1) * pageSize).Take(pageSize).ToList();
            ViewBag.pageNumber = pageNumber;
            if (!String.IsNullOrEmpty(search))
            {
                data = _db.Sizes.Where(x=>x.Name.Equals(search)).OrderBy(x => x.Id).Skip(((int)pageNumber - 1) * pageSize).Take(pageSize).ToList();
                count = _db.Sizes.Where(x => x.Name.Equals(search)).Count();

                ViewBag.pageNumber = pageNumber;
            }
            ViewBag.countPage = count % pageSize == 0 ? count / pageSize : count / pageSize + 1;
            return PartialView(data);
        }

        public JsonResult AddOrUpdate(Size size)
        {
            try
            {
                if (size.Id == 0)
                {
                    _db.Entry(size).State = System.Data.Entity.EntityState.Added;
                    _db.SaveChanges();
                }
                else
                {
                    var cus = _db.Sizes.Find(size.Id);
                    cus.Name = size.Name;
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
        public JsonResult GetSizeById(int id)
        {
            var size = _db.Sizes.Find(id);
            return Json(size, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public PartialViewResult _ViewDetail(int id)
        {
            var size = _db.Sizes.Find(id);
            return PartialView(size);
        }

        [HttpPost]
        public JsonResult Delete(int? id)
        {
            var size = _db.Sizes.Find(id);
            if (size == null)
                return Json(false, JsonRequestBehavior.AllowGet);
            _db.Entry(size).State = System.Data.Entity.EntityState.Deleted;
            _db.SaveChanges();
            return Json(true, JsonRequestBehavior.AllowGet);
        }
    }
}