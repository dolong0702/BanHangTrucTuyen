namespace Web.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Trang")]
    public partial class Trang
    {
        [Key]
        [StringLength(10)]
        public string PageID { get; set; }

        [StringLength(255)]
        public string PageName { get; set; }

        public string Noidung { get; set; }

        [StringLength(255)]
        public string Thumb { get; set; }

        public int? DuocRaDoi { get; set; }

        [StringLength(255)]
        public string TieuDe { get; set; }

        [StringLength(255)]
        public string MetaDesc { get; set; }

        [StringLength(255)]
        public string MetaKey { get; set; }

        [StringLength(255)]
        public string Alias { get; set; }

        [Column(TypeName = "date")]
        public DateTime? Ngaytaotrang { get; set; }

        public int? ThuTu { get; set; }
    }
}
