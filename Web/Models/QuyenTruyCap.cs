using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Windows;

namespace Web.Models
{
    public class QuyenTruyCap : AuthorizeAttribute
    {
        public int idChucNang { set; get; }
        public override void OnAuthorization(AuthorizationContext filterContext)
        {

            KhachHang nvSession = (KhachHang)HttpContext.Current.Session["quyen"];


            if (nvSession != null)
            {
                using (var con = new Model1())
                {
                    var count = con.QuyenTCs.Count(m => m.MaKH == nvSession.MaKH & m.MieuTa == idChucNang);
                    if (count != 0)
                    {
                        return;
                    }
                    else
                    {
                        MessageBox.Show("Không có quyền thực hiện chức năng này");
                        var returnUrl = filterContext.RequestContext.HttpContext.Request.RawUrl;
                        filterContext.Result = new RedirectResult("~/Home/Index?ReturnUrl=" + filterContext.HttpContext.Request.RawUrl);

                    }
                    return;
                }
            }
            else
            {
                var returnUrl = filterContext.RequestContext.HttpContext.Request.RawUrl;

                filterContext.Result = new RedirectResult("~/Login/Index?ReturnUrl=" + filterContext.HttpContext.Request.RawUrl);

                return;
            }
        }
    }
}