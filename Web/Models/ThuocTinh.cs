namespace Web.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ThuocTinh")]
    public partial class ThuocTinh
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public ThuocTinh()
        {
            ChiTietThuocTinhs = new HashSet<ChiTietThuocTinh>();
        }

        [Key]
        public int MaTT { get; set; }

        [StringLength(255)]
        public string Tenthuoctinh { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ChiTietThuocTinh> ChiTietThuocTinhs { get; set; }
    }
}
