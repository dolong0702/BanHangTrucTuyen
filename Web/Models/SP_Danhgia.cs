using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace Web.Models
{
    public class SP_Danhgia
    {
        [Key]
        public int Madanhgia_sp { get; set; }

        public string MaSP { get; set; }

        public string noidung_danhgia { get; set; }

        public string MaKH { get; set; }

        [Column(TypeName = "date")]
        public DateTime? NgayDanhgia { get; set; }

        public int? Sao { get; set; }

    }
}