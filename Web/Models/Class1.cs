using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Web.Models
{
    public class Class1
    {
        public SanPham Sanpham { get; set; }
        public string MaSP { get; set; }
        public int Soluong { get; set; }
    }
    public class Cart
    {
        private List<Class1> lineCollection = new List<Class1>();

        public void AddItem(SanPham sp, int quantity)
        {
            Class1 line = lineCollection
                .Where(p => p.Sanpham.MaSP == sp.MaSP)
                .FirstOrDefault();

            if (line == null)
            {
                lineCollection.Add(new Class1
                {
                    Sanpham = sp,
                    Soluong = quantity
                });
            }
            else
            {
                line.Soluong += quantity;
            }
        }

        public static explicit operator List<object>(Cart v)
        {
            throw new NotImplementedException();
        }

        public void UpdateItem(SanPham sp, int quantity)
        {
            Class1 line = lineCollection
                .Where(p => p.Sanpham.MaSP == sp.MaSP)
                .FirstOrDefault();

            if (line != null)
            {
                if (quantity > 0)
                {
                    line.Soluong = quantity;
                }
            }
        }
        public void RemoveLine(SanPham sp)
        {
            lineCollection.RemoveAll(l => l.Sanpham.MaSP == sp.MaSP);
        }

        //public int? ComputeTotalValue()
        //{
        //    return lineCollection.Sum(e => e.Sanpham.Gia * e.Soluong);

        //}
            //public int? ComputeTotalProduct()
            //{
            //    return lineCollection.Sum(e => e.Quantity);

            //}
            public void Clear()
        {
            lineCollection.Clear();
        }

        public IEnumerable<Class1> Lines
        {
            get { return lineCollection; }
        }
    }
}