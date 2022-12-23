using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;

namespace Web.Models
{
    public partial class Model1 : DbContext
    {
        public Model1()
            : base("name=Model1")
        {
        }

        public virtual DbSet<ChiTietOrder> ChiTietOrders { get; set; }
        public virtual DbSet<ChiTietThuocTinh> ChiTietThuocTinhs { get; set; }
        public virtual DbSet<DaiLy> DaiLies { get; set; }
        public virtual DbSet<Danhmuc> Danhmucs { get; set; }
        public virtual DbSet<DonHang> DonHangs { get; set; }
        public virtual DbSet<KhachHang> KhachHangs { get; set; }
        public virtual DbSet<PictureProduct> PictureProducts { get; set; }
        public virtual DbSet<QuyenTC> QuyenTCs { get; set; }
        public virtual DbSet<SanPham> SanPhams { get; set; }
        public virtual DbSet<Shipper> Shippers { get; set; }
        public virtual DbSet<SP_ThuocTinh> SP_ThuocTinh { get; set; }
        public virtual DbSet<sysdiagram> sysdiagrams { get; set; }
        public virtual DbSet<TaiKhoan> TaiKhoans { get; set; }
        public virtual DbSet<ThanhToan> ThanhToans { get; set; }
        public virtual DbSet<ThuocTinh> ThuocTinhs { get; set; }
        public virtual DbSet<Trang> Trangs { get; set; }
        public virtual DbSet<TrangThaiDon> TrangThaiDons { get; set; }
        public virtual DbSet<Vitri> Vitris { get; set; }
        public virtual DbSet<SP_Danhgia> SP_Danhgia { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<ChiTietOrder>()
                .Property(e => e.GiaTien)
                .HasPrecision(19, 4);

            modelBuilder.Entity<ChiTietThuocTinh>()
                .HasMany(e => e.SP_ThuocTinh)
                .WithRequired(e => e.ChiTietThuocTinh)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<ChiTietThuocTinh>()
                .HasOptional(e => e.ChiTietThuocTinh1)
                .WithRequired(e => e.ChiTietThuocTinh2);

            modelBuilder.Entity<ChiTietThuocTinh>()
                .HasOptional(e => e.ChiTietThuocTinh11)
                .WithRequired(e => e.ChiTietThuocTinh3);

            modelBuilder.Entity<DonHang>()
                .Property(e => e.ShortDesc)
                .IsFixedLength();

            modelBuilder.Entity<DonHang>()
                .Property(e => e.TongTien)
                .HasPrecision(19, 4);

            modelBuilder.Entity<KhachHang>()
                .Property(e => e.Salt)
                .IsFixedLength();

            modelBuilder.Entity<PictureProduct>()
                .Property(e => e.MaA)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<SanPham>()
                .Property(e => e.Gia)
                .HasPrecision(19, 4);

            modelBuilder.Entity<SanPham>()
                .HasMany(e => e.SP_ThuocTinh)
                .WithRequired(e => e.SanPham)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<TaiKhoan>()
                .Property(e => e.Mahoa)
                .IsFixedLength();

            modelBuilder.Entity<ThuocTinh>()
                .HasMany(e => e.ChiTietThuocTinhs)
                .WithRequired(e => e.ThuocTinh)
                .WillCascadeOnDelete(false);
        }
    }
}
