using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using System.Windows;
using Web.Models;

namespace Web.Controllers
{
    public class CartController : Controller
    {
        public int? ComputeTotalValue { get; private set; }

        // GET: Cart
        public ActionResult Cart()
        {
            var cart = (Cart)Session["CartSession"];
            return View(cart);
        }



        [HttpPost]
        public ActionResult Add(string Masp, string returnUrl, int soluong)
        {
            var db = new Model1();
            var product = db.SanPhams.Find(Masp);
            var cart = (Cart)Session["CartSession"];
            if (cart != null)
            {       
                cart.AddItem(product, soluong);
                //Gán vào session
                Session["CartSession"] = cart;
            }
            else
            {
                //tạo mới đối tượng AddcartProduct
                cart = new Cart();    
                cart.AddItem(product, soluong);
                //Gán vào session
                Session["CartSession"] = cart;
            }
            MessageBox.Show("Đã thêm vào giỏ hàng");
            return Redirect(returnUrl);
        }

        [HttpPost]
        public ActionResult Update_Quantity_Cart(string ma, string url, int soluong)
        {
            var cart = (Cart)Session["CartSession"];

            using (var con = new Model1())
            {
                if (cart != null)
                {

                    var pro = con.SanPhams.Find(ma);
                    cart.UpdateItem(pro, soluong);
                    

                    Session["Cart"] = cart;
                }
                return Redirect(url);
            }


            //int quantity = int.Parse(form["Quantity"]);
            //int id_pro = int.Parse(form["ID_Product"]);
            //cart.Update_QuantiTy_Shopping(id_pro, quantity);




        }

        [HttpPost]
        public ActionResult Remove(string id, string returnUrl)
        {
            var con = new Model1();
            SanPham product = con.SanPhams.Find(id);

            var cart = (Cart)Session["CartSession"];
            if (cart != null)
            {
                cart.RemoveLine(product);
                //Gán vào session
                Session["CartSession"] = cart;
                MessageBox.Show("Đã xóa sản phẩm khỏi giỏ hàng");
            }

            return Redirect(returnUrl);
        }

        public ActionResult Payment()
        {
            var cart = (Cart)Session["CartSession"];
      
            return View(cart);

        }

        public ActionResult lichsuCart()
        {
            using (var _db = new Model1())
            {
                if (Session["quyen"] != null)
                {
                    var user = (KhachHang)Session["quyen"];
                    var makh = user.MaKH;
                    var model = _db.DonHangs.Where(x => x.MaKH == makh).ToList();
                    return View(model);
                }
                else
                {
                    return View();
                } 

            }                
        }

        public ActionResult DetailOder(int id)
        {
            using (var _db = new Model1())
            {
                var chitet = _db.ChiTietOrders.Where(x => x.MaDon == id).ToList();
                return View(chitet);
            }
        }

        public ActionResult Checkout(int tong, string ghichu)
        {
            using(var con = new Model1())
            {
                if (Session["idAccount"] == null)
                {
                    return Json("https://localhost:44305/Login/Index");
                }
                else
                {
                    var dh = new DonHang();
                    dh.NgayDatDon = DateTime.Now;
                    dh.MaKH = (string)Session["idAccount"];
                    dh.TongTien = tong;
                    dh.Ghichu = ghichu;
                    con.DonHangs.Add(dh);
                    con.SaveChanges();

                    var cart = (Cart)Session["CartSession"];

                    if (cart != null)
                    {
                        foreach (Class1 it in cart.Lines)
                        {
                            var obj = new ChiTietOrder();
                            int madon = con.Database.SqlQuery<int>("select max(madon) from DonHang").First();

                            var sp = con.SanPhams.Where(x => x.MaSP == it.Sanpham.MaSP).FirstOrDefault();
                            var gia = sp.Gia;

                            obj.MaDon = madon;
                            obj.MaSP = it.Sanpham.MaSP;
                            obj.GiaTien = it.Soluong * gia;
                            obj.Soluong = it.Soluong;

                            con.ChiTietOrders.Add(obj);

                        }
                        con.SaveChanges();
                        MessageBox.Show("Thanh toán thành công");
                    }
                    return Json("https://localhost:44305/Produce/List");
                }    
            }    
        }

    }
}