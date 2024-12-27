using System;
using System.Collections.Generic;

namespace NguyenThanhDat5230006.Models;

public partial class LoaiKhach
{
    public int MaLoai { get; set; }

    public string? TenLoai { get; set; }

    public virtual ICollection<KhachHang> KhachHangs { get; set; } = new List<KhachHang>();
}
