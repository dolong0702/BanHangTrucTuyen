namespace Web.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("KhachHang")]
    public partial class KhachHang
    {
        [Key]
        [StringLength(10)]
        public string MaKH { get; set; }

        [StringLength(255)]
        public string TenKH { get; set; }

        [Column(TypeName = "date")]
        public DateTime? NgaySinh { get; set; }

        [StringLength(255)]
        public string CCCD_CMT { get; set; }

        [StringLength(255)]
        public string SĐT { get; set; }

        [StringLength(10)]
        public string MaVT { get; set; }

        [StringLength(255)]
        public string DiaChi { get; set; }

        [Column(TypeName = "date")]
        public DateTime? CreateDate { get; set; }

        [StringLength(50)]
        public string Password { get; set; }

        [StringLength(8)]
        public string Salt { get; set; }

        [Column(TypeName = "date")]
        public DateTime? LastLogin { get; set; }

        public bool? Active { get; set; }

        [Required]
        [StringLength(50)]
        public string Tendangnhap { get; set; }

        [Required]
        [StringLength(50)]
        public string MaQuyen { get; set; }

        public virtual Vitri Vitri { get; set; }
    }
}
