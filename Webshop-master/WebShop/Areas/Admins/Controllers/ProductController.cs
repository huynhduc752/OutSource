using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebShop.Common;
using WebShop.Models;
using WebShop.ViewModel;

namespace WebShop.Areas.Admins.Controllers
{
    public class ProductController : Controller
    {
        // GET: Products/Product
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
            var data = (from p in _db.Products.ToList()
                        join c in _db.Categories.ToList()
                        on p.CategoryId equals c.Id
                        where p.IsDeleted == false && c.IsDeleted == false
                        orderby p.OrderBy
                        select new ProductViewModel
                        {
                            product = p,
                            category = c
                        });
            var count = data.Count();
            ViewBag.pageNumber = pageNumber;
            if (!string.IsNullOrEmpty(search))
            {
                data = (from p in _db.Products.ToList()
                        join c in _db.Categories.ToList()
                        on p.CategoryId equals c.Id
                        where (p.Name.Contains(search)
                                || p.Code.Contains(search)
                                || p.Price.ToString().Equals(search)
                                || c.Name.Contains(search)
                                || c.Code.Equals(search))
                        && p.IsDeleted == false && c.IsDeleted == false
                        orderby p.OrderBy
                        select new ProductViewModel
                        {
                            product = p,
                            category = c
                        });
                count = data.Count();
                ViewBag.pageNumber = pageNumber;
            }
            data = data.Skip((int)(pageSize * (pageNumber - 1))).Take(pageSize).ToList();
            ViewBag.countPage = count % pageSize == 0 ? count / pageSize : count / pageSize + 1;
            return PartialView(data);
        }

        public ActionResult Create()
        {
            ViewBag.categorys = _db.Categories.Where(x => x.IsDeleted == false).ToList();
            ViewBag.sizes = _db.Sizes.ToList();
            return View();
        }

        public ActionResult Edit(int id)
        {
            ViewBag.categorys = _db.Categories.Where(x => x.IsDeleted == false).ToList();
            ViewBag.sizes = _db.Sizes.ToList();
            var model = _db.Products.FirstOrDefault(x => x.Id == id);

            ViewBag.productImages = _db.Product_Image.Where(x => x.ProductId == id).ToList();
            ViewBag.productSizes = _db.ProductSizes.Where(x => x.ProductId == id).ToList();

            return View(model);
        }

        public JsonResult AddOrUpdate(Product product, List<Product_Image> product_Images, List<ProductSize> productSizes)
        {
            try
            {
                if (product.Id == 0)
                {
                    product.Slug = ConvertStringToSlug.ConvertString(product.Name);
                    product.CreatedBy = Session["UserName"] == null ? "Admin" : Session["UserName"].ToString();
                    product.CreatedDate = DateTime.Now;
                    product.IsDeleted = false;
                    _db.Entry(product).State = System.Data.Entity.EntityState.Added;
                    _db.SaveChanges();

                    var id = _db.Products.OrderByDescending(x => x.Id).FirstOrDefault().Id;
                    if (product_Images != null)
                    {
                        product_Images = product_Images.Select(x => { x.ProductId = id; return x; }).ToList();
                        _db.Product_Image.AddRange(product_Images);
                    }
                    if (productSizes != null)
                    {
                        productSizes = productSizes.Select(x => { x.ProductId = id; return x; }).ToList();
                        _db.ProductSizes.AddRange(productSizes);
                    }
                    _db.SaveChanges();
                }
                else
                {
                    var cus = _db.Products.Find(product.Id);
                    cus.Name = product.Name;
                    cus.Code = product.Code;
                    cus.Image = product.Image;
                    cus.Description = product.Description;
                    cus.CategoryId = product.CategoryId;
                    cus.OrderBy = product.OrderBy;
                    cus.Price = product.Price;
                    cus.Slug = ConvertStringToSlug.ConvertString(product.Name);
                    cus.Status = product.Status;
                    cus.UpdatedBy = Session["UserName"] == null ? "Admin" : Session["UserName"].ToString();
                    cus.UpdatedDate = DateTime.Now;
                    _db.SaveChanges();

                    // xóa data cũ
                    _db.Product_Image.RemoveRange(_db.Product_Image.Where(x => x.ProductId == product.Id).ToList());
                    if (product_Images != null)
                    {
                        product_Images = product_Images.Select(x => { x.ProductId = product.Id; return x; }).ToList();
                        _db.Product_Image.AddRange(product_Images);
                    }
                    if (productSizes != null)
                    {
                        foreach(var item in productSizes)
                        {
                            if(item.Id > 0)
                            {
                                _db.Entry(item).State = System.Data.Entity.EntityState.Modified;
                            }
                            else
                            {
                                item.ProductId = product.Id;
                                _db.ProductSizes.Add(item);
                            }
                        }
                    }
                    // cập nhật lại data
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
        public PartialViewResult _ViewDetail(int id)
        {
            var product = _db.Products.Find(id);
            ViewBag.category = _db.Categories.Where(x => x.Id == id).FirstOrDefault().Name;
            ViewBag.images = _db.Product_Image.Where(x => x.ProductId == id).ToList();
            var size = _db.ProductSizes.Where(x => x.ProductId == id).ToList();
            var listSize = new List<Size>(); 
            foreach(var item in size)
            {
                var s = _db.Sizes.Where(x => x.Id == item.Size).FirstOrDefault();
                listSize.Add(s);
            }
            ViewBag.sizes = listSize;

            return PartialView(product);
        }

        [HttpPost]
        public JsonResult Delete(int? id)
        {
            var product = _db.Products.Find(id);
            if (product == null)
                return Json(false, JsonRequestBehavior.AllowGet);
            product.IsDeleted = true;
            _db.Entry(product).State = System.Data.Entity.EntityState.Modified;
            _db.SaveChanges();
            return Json(true, JsonRequestBehavior.AllowGet);
        }
    }
}