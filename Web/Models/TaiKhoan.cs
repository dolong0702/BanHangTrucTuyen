namespace Web.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("TaiKhoan")]
    public partial class TaiKhoan
    {
        [Key]
        [StringLength(10)]
        public string AccountID { get; set; }

        [StringLength(10)]
        public string TenDangNhap { get; set; }

        [StringLength(255)]
        public string SĐT { get; set; }

        [StringLength(50)]
        public string Password { get; set; }

        [StringLength(6)]
        public string Mahoa { get; set; }

        public int? Kichhoat { get; set; }

        public DateTime? Ngaytao { get; set; }

        public DateTime? LastLogin { get; set; }

        [StringLength(10)]
        public string MaQuyen { get; set; }

        public virtual QuyenTC QuyenTC { get; set; }
    }
}
