using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Web.Models
{
    public class login
    {
        public string TenDangNhap { get; set; }
        public string Password { get; set; }
        public List<string> QuyenTCs { get; set; }
    }
}