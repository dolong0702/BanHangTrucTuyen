namespace Web.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ChiTietOrder")]
    public partial class ChiTietOrder
    {
        [Key]
        public int MaChiTietDon { get; set; }

        [Column(TypeName = "money")]
        public decimal GiaTien { get; set; }

        public int? Soluong { get; set; }

        [StringLength(255)]
        public string Mausac { get; set; }

        [StringLength(255)]
        public string Khuyenmai { get; set; }

        public int? MaDon { get; set; }

        [StringLength(50)]
        public string MaSP { get; set; }

        [Column(TypeName = "date")]
        public DateTime? NgayShip { get; set; }

        public virtual DonHang DonHang { get; set; }

        public virtual SanPham SanPham { get; set; }
    }
}
