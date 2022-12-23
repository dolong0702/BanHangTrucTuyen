namespace Web.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class SP_ThuocTinh
    {
        [Key]
        public int Ma_SP_TT { get; set; }

        [Required]
        [StringLength(50)]
        public string MaSP { get; set; }

        public int MaChiTiet { get; set; }

        public virtual ChiTietThuocTinh ChiTietThuocTinh { get; set; }

        public virtual SanPham SanPham { get; set; }
    }
}
