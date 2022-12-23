namespace Web.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ChiTietThuocTinh")]
    public partial class ChiTietThuocTinh
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public ChiTietThuocTinh()
        {
            SP_ThuocTinh = new HashSet<SP_ThuocTinh>();
        }

        [Key]
        public int MaChiTiet { get; set; }

        public int MaTT { get; set; }

        [StringLength(50)]
        public string Chitiet { get; set; }

        public virtual ThuocTinh ThuocTinh { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SP_ThuocTinh> SP_ThuocTinh { get; set; }

        public virtual ChiTietThuocTinh ChiTietThuocTinh1 { get; set; }

        public virtual ChiTietThuocTinh ChiTietThuocTinh2 { get; set; }

        public virtual ChiTietThuocTinh ChiTietThuocTinh11 { get; set; }

        public virtual ChiTietThuocTinh ChiTietThuocTinh3 { get; set; }
    }
}
