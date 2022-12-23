namespace Web.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("PictureProduct")]
    public partial class PictureProduct
    {
        [Key]
        [StringLength(10)]
        public string MaA { get; set; }

        [StringLength(200)]
        public string Anh1 { get; set; }

        [StringLength(200)]
        public string Anh2 { get; set; }

        [StringLength(200)]
        public string Anh3 { get; set; }

        [StringLength(200)]
        public string Anh4 { get; set; }

        [StringLength(200)]
        public string Anh5 { get; set; }

        [StringLength(50)]
        public string MaSP { get; set; }

        public virtual SanPham SanPham { get; set; }
    }
}
