using System;
using System.Collections.Generic;

namespace NguyenThanhDat5230006.Models;

public partial class LoaiNhaXe
{
    public int MaLoaiNx { get; set; }

    public string? TenLoaiNx { get; set; }

    public virtual ICollection<NhaXe> NhaXes { get; set; } = new List<NhaXe>();
}
