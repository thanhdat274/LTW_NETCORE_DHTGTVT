using System;
using System.Collections.Generic;

namespace NguyenThanhDat5230006.Models;

public partial class DatVe
{
    public string? MaKhach { get; set; }

    public int? MaChuyen { get; set; }

    public int? SoVe { get; set; }

    public virtual Chuyen? MaChuyenNavigation { get; set; }

    public virtual KhachHang? MaKhachNavigation { get; set; }
}
