namespace Web.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("SanPham")]
    public partial class SanPham
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public SanPham()
        {
            ChiTietOrders = new HashSet<ChiTietOrder>();
            PictureProducts = new HashSet<PictureProduct>();
            SP_ThuocTinh = new HashSet<SP_ThuocTinh>();
        }

        [Key]
        [StringLength(50)]
        public string MaSP { get; set; }

        [StringLength(255)]
        public string TenSP { get; set; }

        [StringLength(255)]
        public string MoTa { get; set; }

        [StringLength(100)]
        public string Trangthai { get; set; }

        [StringLength(255)]
        public string Diachi { get; set; }

        [StringLength(10)]
        public string MaDL { get; set; }

        [StringLength(10)]
        public string MaDM { get; set; }

        [StringLength(255)]
        public string Thumb { get; set; }

        [StringLength(255)]
        public string Video { get; set; }

        [Column(TypeName = "date")]
        public DateTime? DateCreated { get; set; }

        [Column(TypeName = "date")]
        public DateTime? DateModified { get; set; }

        public bool? BestSellers { get; set; }

        public bool? Homeflag { get; set; }

        public bool? Active { get; set; }

        public string Tags { get; set; }

        public string Tieude { get; set; }

        [StringLength(255)]
        public string Alias { get; set; }

        [StringLength(255)]
        public string MetaDesc { get; set; }

        [StringLength(255)]
        public string MetaKey { get; set; }

        public int? SoLo { get; set; }

        [Column(TypeName = "money")]
        public decimal Gia { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ChiTietOrder> ChiTietOrders { get; set; }

        public virtual DaiLy DaiLy { get; set; }

        public virtual Danhmuc Danhmuc { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PictureProduct> PictureProducts { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SP_ThuocTinh> SP_ThuocTinh { get; set; }
    }
}
