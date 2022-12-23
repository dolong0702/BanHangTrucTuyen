namespace Web.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("DonHang")]
    public partial class DonHang
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public DonHang()
        {
            ChiTietOrders = new HashSet<ChiTietOrder>();
        }

        [Key]
        public int MaDon { get; set; }

        [Column(TypeName = "date")]
        public DateTime? NgayDatDon { get; set; }

        [Column(TypeName = "date")]
        public DateTime? Ngayship { get; set; }

        public bool? Deleted { get; set; }

        public bool? TraHang { get; set; }

        [Column(TypeName = "date")]
        public DateTime? Ngaytra { get; set; }

        [StringLength(10)]
        public string MaKH { get; set; }

        [StringLength(10)]
        public string MaShipper { get; set; }

        [StringLength(10)]
        public string MaThanhToan { get; set; }

        public double? Thue { get; set; }

        [StringLength(10)]
        public string ShortDesc { get; set; }

        public string Ghichu { get; set; }

        [StringLength(10)]
        public string MaTrangThai { get; set; }

        [Column(TypeName = "money")]
        public decimal? TongTien { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ChiTietOrder> ChiTietOrders { get; set; }

        public virtual Shipper Shipper { get; set; }

        public virtual ThanhToan ThanhToan { get; set; }

        public virtual TrangThaiDon TrangThaiDon { get; set; }
    }
}
