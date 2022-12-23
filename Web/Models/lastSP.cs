using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Web.Models
{
    public class lastSP
    {
        private  List<SanPham> SomeValue = new List<SanPham>();
        public IEnumerable<SanPham> Lines
        {
            get { return SomeValue; }
        }
    }
}