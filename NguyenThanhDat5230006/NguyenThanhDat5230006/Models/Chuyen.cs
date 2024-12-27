using System;
using System.Collections.Generic;

namespace NguyenThanhDat5230006.Models;

public partial class Chuyen
{
    public int MaChuyen { get; set; }

    public int? MaKhaiThac { get; set; }

    public string? SoXe { get; set; }

    public string? LaiXe { get; set; }

    public string? PhuXe { get; set; }

    public DateTime? NgayGio { get; set; }

    public string? Anh { get; set; }

    public virtual KhaiThac? MaKhaiThacNavigation { get; set; }
}
