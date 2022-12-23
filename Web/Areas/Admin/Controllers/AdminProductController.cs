using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using System.Windows;
using Web.Models;

namespace Web.Areas.Admin.Controllers
{
    public class AdminProductController : Controller
    {
        // GET: Admin/AdminProduct
        public ActionResult Index()
        {
            return View();
        }

        
        public ActionResult ShowProduct()
        {
            using (var _db = new Model1())
            {
                var model1 = _db.SanPhams.ToList();
                return View(model1);
            }    
            
        }

        public ActionResult DetalProduct(string id)
        {
            using (var _db = new Model1())
            {
                var model = _db.SanPhams.Where(x => x.MaSP == id).First();
                ViewBag.sp = model;
                return View(ViewBag.sp);
            }    
        }

        [HttpPost]
        public ActionResult DeleteProduct(string id, string returnUrl)
        {
            using (var _db = new Model1())
            {
                string Url = returnUrl;
                var sp = _db.SanPhams.Find(id);
                _db.SanPhams.Remove(sp);
                _db.SaveChanges();
                MessageBox.Show("Xóa sản phẩm thành công");
                return Redirect(Url);
            }
        }

        public ActionResult CreateProduct()
        {
            return View();
        }

        [HttpPost]
        public ActionResult AddProduct(string returnUrl, string ten, string mota, string trangthai, string madm)
        {
            using (var _db = new Model1())
            {
                var sp = new SanPham();
                string masp = _db.Database.SqlQuery<string>("DECLARE @a nvarchar(50) Exec @a = dbo.TuTangMaSanPham select @a").First();
                //acc.MaKH = makh;
                sp.MaSP = masp;
                sp.MaDM = madm;
                sp.TenSP = ten;
                sp.MoTa = mota;
                sp.Trangthai = trangthai;
                _db.SanPhams.Add(sp);
                _db.SaveChanges();
                var Url = returnUrl;
                MessageBox.Show("Thêm sản phẩm thành công");
                return Redirect(Url);
            }
        }
    }
}