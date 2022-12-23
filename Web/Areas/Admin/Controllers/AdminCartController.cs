using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Web.Models;

namespace Web.Areas.Admin.Controllers
{
    public class AdminCartController : Controller
    {
        // GET: Admin/AdminCart
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult AdminCart()
        {
            using (var _db =  new Model1())
            {
                var model = _db.DonHangs.ToList();
                return View(model);

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
    }
}