using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Windows;
using Web.Models;
namespace Web.Controllers
{
    public class ProduceController : Controller
    {
        public List<SanPham> spvx = new List<SanPham>();
        //get: produce
        //public ActionResult Index(string search)
        //{
        //    using (Model1 db = new Model1())
        //    {
        //        List<SanPham> model = db.SanPhams.ToList();
        //        return View(model);
        //    }

        //}


        //[QuyenTruyCap(idChucNang = 1)]

        public ActionResult List( string id, string search)
        {
            using (Model1 db = new Model1())
            {
                ViewBag.anh = db.PictureProducts.ToList();
                if (id == "all" || id == null)
                {
                    ViewBag.Text = "All";
                    var model = db.SanPhams;
                    if (search != null)
                    {
                        search = search.ToLower();
                        var model2 = db.SanPhams.Where(b => b.TenSP.Contains(search)).ToList();
                        return View(model2.ToList());
                    }
                    ViewBag.OnePageOfProducts = model.ToList();
                    return View(model.ToList());
                }
                else
                {
                    var danhmuc = db.Danhmucs.SingleOrDefault(x => x.MaDM == id);
                    var lsTinDangs = db.SanPhams.Where(x => x.MaDM == danhmuc.MaDM);
                    ViewBag.CurrentCat = danhmuc;
                    if (search != null)
                    {
                        search = search.ToLower();
                        var model2 = lsTinDangs.Where(b => b.TenSP.Contains(search)).ToList();
                        return View(model2);
                    }    
                    return View(lsTinDangs.ToList());
                }
            }
            
        }


        [ChildActionOnly]
        public ActionResult Cart()
        {
            using (Model1 db = new Model1())
            {
                var data = (from s in db.Danhmucs select s).ToList();
                return PartialView("_CartPartialView",data);
            }    
        }

        [ChildActionOnly]
        public ActionResult sanphamvuaxem()
        {
            using (Model1 db = new Model1())
            {
                var sp = (List<SanPham>)Session["last"];
                return PartialView("_partsanphamvuaxem", sp);
            }
        }

        public ActionResult DetalProduct(string id)
        {
            using (Model1 db = new Model1())
            {
                SanPham model = db.SanPhams.Where(x => x.MaSP == id).FirstOrDefault();
                ViewBag.id_sp = model.MaSP;
                ViewBag.ten = model.TenSP;
                ViewBag.mota = model.MoTa;

                //lấy các thứ liên quan đến danh mục
                var danhmuc = db.Danhmucs.SingleOrDefault(x => x.MaDM == model.MaDM);
                ViewBag.id_danhmuc = danhmuc.MaDM;
                ViewBag.danhmuc = danhmuc.TenDM;

                spvx.Add(model);
                Session["last"] = spvx;

                return View(model);
            }    
            
        }

        public ActionResult Binhluan(string id, string comment, string returnUrl)
        {
            using (var con = new Model1())
            {
                if (Session["quyen"] == null)
                {
                    MessageBox.Show("Bạn cần đăng nhập để bình luận");
                    return RedirectToAction("Index", "Login");
                }    
                if (comment == "" || comment == null)
                {
                    ViewBag.cm = "Vui lòng nhập bình luận";
                    return RedirectToAction("DetalProduct", "Produce", new { id = id });
                }
                else
                {
                    var kh = Session["quyen"] as KhachHang;


                    var spdg = new SP_Danhgia();
                    spdg.MaSP = id;

                    spdg.noidung_danhgia = comment;

                    spdg.MaKH = kh.MaKH;
                    spdg.NgayDanhgia = DateTime.Now;
                    con.SP_Danhgia.Add(spdg);
                    con.SaveChanges();
                    return RedirectToAction("DetalProduct", "Produce", new { id = id });
                }


            }

        }

    }
}