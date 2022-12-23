using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Web.Models;

namespace Web.Controllers
{
    public class LoginController : Controller
    {
        // GET: Login
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(string tendangnhap, string password, string ReturnUrl)
        {
            using (var con = new Model1())
            {
                var user = con.KhachHangs
                    .Where(x => x.Tendangnhap == tendangnhap && x.Password == password)
                    .FirstOrDefault();
                if (user != null)
                {

                    Session["quyen"] = user;
                    Session["idAccount"] = user.MaKH;
                        //trong phần code của cô có bảng userInRole tức là một tài khoản có nhiều quyền, bài mình k có bảng đó, nghĩa là 1 tài khoản là admin thì chỉ là admin thôi, k là user đc nữa
                        //if (string.IsNullOrEmpty(ReturnUrl) || ReturnUrl == "/Login/Index" )
                        //{
                        //    return Redirect("/Home/Index");
                        //}
                        //else
                        //{
                        //    return Redirect(ReturnUrl);
                        //}
                        return Json("https://localhost:44305/Home/Index");
                    

                }
                else
                {
                    return Json("https://localhost:44305/Login/Index");
                }

            }
        }

        public ActionResult Logout()
        {
            Session.Clear();//remove session
            return RedirectToAction("Index");
        }

    }
}