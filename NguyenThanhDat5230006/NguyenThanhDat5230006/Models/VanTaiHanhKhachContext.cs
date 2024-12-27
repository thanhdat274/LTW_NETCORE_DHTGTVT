using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace NguyenThanhDat5230006.Models;

public partial class VanTaiHanhKhachContext : DbContext
{
    public VanTaiHanhKhachContext()
    {
    }

    public VanTaiHanhKhachContext(DbContextOptions<VanTaiHanhKhachContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Chuyen> Chuyens { get; set; }

    public virtual DbSet<DatVe> DatVes { get; set; }

    public virtual DbSet<KhachHang> KhachHangs { get; set; }

    public virtual DbSet<KhaiThac> KhaiThacs { get; set; }

    public virtual DbSet<LoaiKhach> LoaiKhaches { get; set; }

    public virtual DbSet<LoaiNhaXe> LoaiNhaXes { get; set; }

    public virtual DbSet<NavItem> NavItems { get; set; }

    public virtual DbSet<NhaXe> NhaXes { get; set; }

    public virtual DbSet<TinhThanh> TinhThanhs { get; set; }

    public virtual DbSet<Tuyen> Tuyens { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
//#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Server=localhost;Database=VanTaiHanhKhach;User Id=sa;Password=123a;TrustServerCertificate=true");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Chuyen>(entity =>
        {
            entity.HasKey(e => e.MaChuyen);

            entity.ToTable("Chuyen");

            entity.Property(e => e.Anh).HasMaxLength(50);
            entity.Property(e => e.LaiXe).HasMaxLength(50);
            entity.Property(e => e.NgayGio).HasColumnType("datetime");
            entity.Property(e => e.PhuXe).HasMaxLength(50);
            entity.Property(e => e.SoXe).HasMaxLength(20);

            entity.HasOne(d => d.MaKhaiThacNavigation).WithMany(p => p.Chuyens)
                .HasForeignKey(d => d.MaKhaiThac)
                .HasConstraintName("FK_Chuyen_KhaiThac");
        });

        modelBuilder.Entity<DatVe>(entity =>
        {
            entity
                .HasNoKey()
                .ToTable("DatVe");

            entity.Property(e => e.MaKhach)
                .HasMaxLength(10)
                .IsUnicode(false);

            entity.HasOne(d => d.MaChuyenNavigation).WithMany()
                .HasForeignKey(d => d.MaChuyen)
                .HasConstraintName("FK_DatVe_Chuyen");

            entity.HasOne(d => d.MaKhachNavigation).WithMany()
                .HasForeignKey(d => d.MaKhach)
                .HasConstraintName("FK_DatVe_KhachHang");
        });

        modelBuilder.Entity<KhachHang>(entity =>
        {
            entity.HasKey(e => e.MaKhach);

            entity.ToTable("KhachHang");

            entity.Property(e => e.MaKhach)
                .HasMaxLength(10)
                .IsUnicode(false);
            entity.Property(e => e.Anh).HasMaxLength(50);
            entity.Property(e => e.Cccd)
                .HasMaxLength(20)
                .IsUnicode(false)
                .HasColumnName("CCCD");
            entity.Property(e => e.DienThoai)
                .HasMaxLength(20)
                .IsUnicode(false);
            entity.Property(e => e.Email).HasMaxLength(50);
            entity.Property(e => e.HoTen).HasMaxLength(50);

            entity.HasOne(d => d.MaLoaiNavigation).WithMany(p => p.KhachHangs)
                .HasForeignKey(d => d.MaLoai)
                .HasConstraintName("FK_KhachHang_LoaiKhach");
        });

        modelBuilder.Entity<KhaiThac>(entity =>
        {
            entity.HasKey(e => e.MaKhaiThac);

            entity.ToTable("KhaiThac");

            entity.Property(e => e.MaNhaXe).HasMaxLength(10);
            entity.Property(e => e.MaTuyen).HasMaxLength(10);

            entity.HasOne(d => d.MaNhaXeNavigation).WithMany(p => p.KhaiThacs)
                .HasForeignKey(d => d.MaNhaXe)
                .HasConstraintName("FK_KhaiThac_NhaXe");

            entity.HasOne(d => d.MaTuyenNavigation).WithMany(p => p.KhaiThacs)
                .HasForeignKey(d => d.MaTuyen)
                .HasConstraintName("FK_KhaiThac_Tuyen");
        });

        modelBuilder.Entity<LoaiKhach>(entity =>
        {
            entity.HasKey(e => e.MaLoai);

            entity.ToTable("LoaiKhach");

            entity.Property(e => e.TenLoai).HasMaxLength(100);
        });

        modelBuilder.Entity<LoaiNhaXe>(entity =>
        {
            entity.HasKey(e => e.MaLoaiNx);

            entity.ToTable("LoaiNhaXe");

            entity.Property(e => e.MaLoaiNx).HasColumnName("MaLoaiNX");
            entity.Property(e => e.TenLoaiNx)
                .HasMaxLength(100)
                .HasColumnName("TenLoaiNX");
        });

        modelBuilder.Entity<NavItem>(entity =>
        {
            entity.Property(e => e.Link).HasMaxLength(250);
            entity.Property(e => e.NavName).HasMaxLength(50);
            entity.Property(e => e.NavNameVn)
                .HasMaxLength(100)
                .HasColumnName("NavNameVN");
        });

        modelBuilder.Entity<NhaXe>(entity =>
        {
            entity.HasKey(e => e.MaNhaXe);

            entity.ToTable("NhaXe");

            entity.Property(e => e.MaNhaXe).HasMaxLength(10);
            entity.Property(e => e.Anh).HasMaxLength(50);
            entity.Property(e => e.DiaChi).HasMaxLength(250);
            entity.Property(e => e.DienThoai).HasMaxLength(30);
            entity.Property(e => e.Email).HasMaxLength(50);
            entity.Property(e => e.MaLoaiNx).HasColumnName("MaLoaiNX");
            entity.Property(e => e.TenNhaXe).HasMaxLength(50);

            entity.HasOne(d => d.MaLoaiNxNavigation).WithMany(p => p.NhaXes)
                .HasForeignKey(d => d.MaLoaiNx)
                .HasConstraintName("FK_NhaXe_LoaiNhaXe");
        });

        modelBuilder.Entity<TinhThanh>(entity =>
        {
            entity.HasKey(e => e.MaTinhThanh);

            entity.ToTable("TinhThanh");

            entity.Property(e => e.MaTinhThanh).HasMaxLength(10);
            entity.Property(e => e.TenTinhThanh).HasMaxLength(100);
            entity.Property(e => e.VietTat).HasMaxLength(5);
        });

        modelBuilder.Entity<Tuyen>(entity =>
        {
            entity.HasKey(e => e.MaTuyen);

            entity.ToTable("Tuyen");

            entity.Property(e => e.MaTuyen).HasMaxLength(10);
            entity.Property(e => e.MaDiemCuoi).HasMaxLength(10);
            entity.Property(e => e.MaDiemDau).HasMaxLength(10);
            entity.Property(e => e.TenTuyen).HasMaxLength(50);

            entity.HasOne(d => d.MaDiemCuoiNavigation).WithMany(p => p.TuyenMaDiemCuoiNavigations)
                .HasForeignKey(d => d.MaDiemCuoi)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Tuyen_TinhThanh_DiemCuoi");

            entity.HasOne(d => d.MaDiemDauNavigation).WithMany(p => p.TuyenMaDiemDauNavigations)
                .HasForeignKey(d => d.MaDiemDau)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Tuyen_TinhThanh_DiemDau");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
