using System;
using System.Collections.Generic;

namespace NguyenThanhDat5230006.Models;

public partial class NhaXe
{
    public string MaNhaXe { get; set; } = null!;

    public string? TenNhaXe { get; set; }

    public string? DiaChi { get; set; }

    public string? Email { get; set; }

    public string? DienThoai { get; set; }

    public int? MaLoaiNx { get; set; }

    public string? Anh { get; set; }

    public virtual ICollection<KhaiThac> KhaiThacs { get; set; } = new List<KhaiThac>();

    public virtual LoaiNhaXe? MaLoaiNxNavigation { get; set; }
}
