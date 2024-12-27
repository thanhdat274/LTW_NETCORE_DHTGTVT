using System;
using System.Collections.Generic;

namespace NguyenThanhDat5230006.Models;

public partial class KhaiThac
{
    public int MaKhaiThac { get; set; }

    public string? MaNhaXe { get; set; }

    public string? MaTuyen { get; set; }

    public DateOnly? NgayBatDau { get; set; }

    public virtual ICollection<Chuyen> Chuyens { get; set; } = new List<Chuyen>();

    public virtual NhaXe? MaNhaXeNavigation { get; set; }

    public virtual Tuyen? MaTuyenNavigation { get; set; }
}
