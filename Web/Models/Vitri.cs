namespace Web.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Vitri")]
    public partial class Vitri
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Vitri()
        {
            KhachHangs = new HashSet<KhachHang>();
        }

        [Key]
        [StringLength(10)]
        public string MaVT { get; set; }

        [StringLength(255)]
        public string TenVT { get; set; }

        [StringLength(20)]
        public string Loai { get; set; }

        [StringLength(255)]
        public string NameWithType { get; set; }

        [StringLength(255)]
        public string PathWithType { get; set; }

        public int? ParentCode { get; set; }

        public int? Mucdo { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<KhachHang> KhachHangs { get; set; }
    }
}
