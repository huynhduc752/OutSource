using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebShop.Models;

namespace WebShop.Areas.Admins.Controllers
{
    public class BannerController : Controller
    {
        // GET: Admins/Banner
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
            int count = _db.Banners.Where(x => x.IsDeleted == false).Count();
            var data = _db.Banners.Where(x => x.IsDeleted == false).OrderBy(x => x.Id).Skip(((int)pageNumber - 1) * pageSize).Take(pageSize).ToList();
            ViewBag.pageNumber = pageNumber;
            if (!String.IsNullOrEmpty(search))
            {
                data = _db.Banners.Where(x => x.IsDeleted == false && (x.Tilte.Contains(search) || x.SubTilte.Contains(search))).OrderBy(x => x.Id).Skip(((int)pageNumber - 1) * pageSize).Take(pageSize).ToList();
                count = _db.Banners.Where(x => x.IsDeleted == false && (x.Tilte.Contains(search) || x.SubTilte.Contains(search))).Count();

                ViewBag.pageNumber = pageNumber;
            }
            ViewBag.countPage = count % pageSize == 0 ? count / pageSize : count / pageSize + 1;
            return PartialView(data);
        }

        public JsonResult AddOrUpdate(Banner banner)
        {
            try
            {
                if (banner.Id == 0)
                {
                    banner.CreatedBy = Session["UserName"] == null ? "Admin" : Session["UserName"].ToString();
                    banner.CreatedDate = DateTime.Now;
                    banner.IsDeleted = false;
                    _db.Entry(banner).State = System.Data.Entity.EntityState.Added;
                    _db.SaveChanges();
                }
                else
                {
                    var cus = _db.Banners.Find(banner.Id);
                    cus.Tilte = banner.Tilte;
                    cus.SubTilte = banner.SubTilte;
                    cus.OrderBy = banner.OrderBy;
                    cus.Status = banner.Status;
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
        public JsonResult GetBannerById(int id)
        {
            var banner = _db.Banners.Find(id);
            return Json(banner, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public PartialViewResult _ViewDetail(int id)
        {
            var banner = _db.Banners.Find(id);
            return PartialView(banner);
        }

        [HttpPost]
        public JsonResult Delete(int? id)
        {
            var banner = _db.Banners.Find(id);
            if (banner == null)
                return Json(false, JsonRequestBehavior.AllowGet);
            banner.IsDeleted = true;
            _db.Entry(banner).State = System.Data.Entity.EntityState.Modified;
            _db.SaveChanges();
            return Json(true, JsonRequestBehavior.AllowGet);
        }
    }
}