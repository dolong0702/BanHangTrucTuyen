namespace Web.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Danhmuc")]
    public partial class Danhmuc
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Danhmuc()
        {
            SanPhams = new HashSet<SanPham>();
        }

        [Key]
        [StringLength(10)]
        public string MaDM { get; set; }

        [StringLength(255)]
        public string TenDM { get; set; }

        [StringLength(255)]
        public string Anh { get; set; }

        public string MoTa { get; set; }

        public int? ParentID { get; set; }

        public int? Levels { get; set; }

        public bool? Published { get; set; }

        [StringLength(255)]
        public string TieuDe { get; set; }

        [StringLength(255)]
        public string Picture { get; set; }

        [StringLength(255)]
        public string MetaDecs { get; set; }

        [StringLength(255)]
        public string MetaKey { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SanPham> SanPhams { get; set; }
    }
}
