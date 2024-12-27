using System;
using System.Collections.Generic;

namespace NguyenThanhDat5230006.Models;

public partial class KhachHang
{
    public string MaKhach { get; set; } = null!;

    public string? HoTen { get; set; }

    public string? Cccd { get; set; }

    public string? DienThoai { get; set; }

    public string? Email { get; set; }

    public string? Anh { get; set; }

    public double? DiemTichLuy { get; set; }

    public int? MaLoai { get; set; }

    public virtual LoaiKhach? MaLoaiNavigation { get; set; }
}
