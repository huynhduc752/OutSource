using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebShop.Models;
using PagedList;
using WebShop.Common;
namespace WebShop.Areas.Admins.Controllers
{
    public class CategoryController : Controller
    {
        // GET: Admins/Category
        WebShopEntities _db = new WebShopEntities();
        public ActionResult Index()
        {
            return View();
        }

        public PartialViewResult _ViewTable(int? pageNumber, string search,int Parent)
        {
            int pageSize = 10;
            if (pageNumber == null)
                pageNumber = 1;
            int count = _db.Categories.Where(x => x.IsDeleted == false && x.ParentId == Parent).Count();
            var data = _db.Categories.Where(x => x.IsDeleted == false && x.ParentId == Parent).OrderBy(x => x.OrderBy).Skip(((int)pageNumber-1)*pageSize).Take(pageSize).ToList();
            ViewBag.pageNumber = pageNumber;
            if (!String.IsNullOrEmpty(search))
            {
                data = _db.Categories.Where(x => x.ParentId == Parent && (x.Code.Contains(search) || x.Name.Contains(search)) && x.IsDeleted == false).OrderBy(x => x.OrderBy).Skip(((int)pageNumber - 1) * pageSize).Take(pageSize).ToList();
                count = _db.Categories.Where(x => x.ParentId == Parent && (x.Code.Contains(search) || x.Name.Contains(search)) && x.IsDeleted == false).Count();
                ViewBag.pageNumber = pageNumber;
            }
            ViewBag.countPage = count % pageSize == 0 ? count / pageSize : count / pageSize + 1;
            ViewBag.parent = Parent;
            ViewBag.title = Parent != 0 ? _db.Categories.Where(x => x.Id == Parent).FirstOrDefault().Name.ToString() : "";
            return PartialView(data);
        }

        [HttpPost]
        public JsonResult AddOrUpdate(Category category)
        {
            try
            {
                if (category.Id == 0)
                {
                    category.Slug = ConvertStringToSlug.ConvertString(category.Name);
                    category.CreatedBy = Session["UserName"]==null ?"Admin": Session["UserName"].ToString();
                    category.CreatedDate = DateTime.Now;
                    category.IsDeleted = false;
                    _db.Entry(category).State = System.Data.Entity.EntityState.Added;
                    _db.SaveChanges();
                }
                else
                {
                    var cate = _db.Categories.Find(category.Id);
                    cate.Code = category.Code;
                    cate.Name = category.Name;
                    cate.Slug = ConvertStringToSlug.ConvertString(category.Name);
                    cate.OrderBy = category.OrderBy;
                    cate.Status = category.Status;
                    cate.UpdatedBy = Session["UserName"] == null ? "Admin" : Session["UserName"].ToString();
                    cate.UpdatedDate = DateTime.Now;
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
        public JsonResult GetCategoryById(int id)
        {
            var category = _db.Categories.Find(id);
            return Json(category, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public PartialViewResult _ViewDetail(int id)
        {
            var category = _db.Categories.Find(id);
            return PartialView(category);
        }

        [HttpPost]
        public JsonResult Delete(int? id)
        {
            var category = _db.Categories.Find(id);
            if (category == null)
                return Json(false, JsonRequestBehavior.AllowGet);
            category.IsDeleted = true;
            _db.Entry(category).State = System.Data.Entity.EntityState.Modified;
            _db.SaveChanges();
            return Json(true, JsonRequestBehavior.AllowGet);
        }
    }
}