using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Web.Models;

namespace Web.Areas.Admin.Controllers
{
    public class QLKhachHangController : Controller
    {
        // GET: Admin/QLKhachHang
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult QLKH()
        {
            using (Model1 _db = new Model1())
            {
                var model1 = _db.KhachHangs.ToList();
                return View(model1);
            }    
        }

        public ActionResult DetalKH(string id)
        {
            using (Model1 _db = new Model1())
            {
                var model1 = _db.KhachHangs.Where(x => x.MaKH == id).FirstOrDefault();
                ViewBag.makh = model1.MaKH;
                ViewBag.tenkh = model1.TenKH;
                ViewBag.ngaysinh = model1.NgaySinh;
                ViewBag.cc = model1.CCCD_CMT;
                ViewBag.sdt = model1.SĐT;
                ViewBag.dt = model1.DiaChi;
                ViewBag.mk = model1.Password;
                return View();
            }    
        }

        [HttpPost]
        public ActionResult SaveChanges(string makh, string ten, DateTime ngaysinh, string sdt, string diachi, string returnUrl)
        {
            using (var _db = new Model1())
            {
                var user = _db.KhachHangs.Where(x => x.MaKH == makh).FirstOrDefault();
                user.TenKH = ten;
                user.NgaySinh = ngaysinh;
                user.SĐT = sdt;
                user.DiaChi = diachi;
                string Url = returnUrl;
                _db.SaveChanges();
                return Redirect(Url);
            }         
        }

        [HttpPost]
        public ActionResult DeleteKH(string id, string returnUrl)
        {
            using (var _db = new Model1())
            {
                string Url = returnUrl;
                var user = _db.KhachHangs.Find(id);
                _db.KhachHangs.Remove(user);
                _db.SaveChanges();
                return Redirect(Url);
            }               
        }



        public ActionResult FornthemKH()
        {
            return View();
        }

        [HttpPost]
        public ActionResult ThemKH(string ten, DateTime ngaysinh, string cc, string sdt, string password, string diachi, string returnUrl)
        {
            using (var _db = new Model1())
            {
                var user = new KhachHang();
                string makh = _db.Database.SqlQuery<string>("DECLARE @a nvarchar(50) Exec @a = dbo.TuTangMaKHang select @a").First();
                //acc.MaKH = makh;
                user.MaKH = makh;
                user.TenKH = ten;
                user.NgaySinh = ngaysinh;
                user.CCCD_CMT = cc;
                user.SĐT = sdt;
                user.Password = password;
                user.DiaChi = diachi;
                _db.KhachHangs.Add(user);
                _db.SaveChanges();
                var Url = returnUrl;
                return Redirect(Url);
            }
        }
    }
}