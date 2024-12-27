using System;
using System.Collections.Generic;

namespace NguyenThanhDat5230006.Models;

public partial class Tuyen
{
    public string MaTuyen { get; set; } = null!;

    public string? TenTuyen { get; set; }

    public string MaDiemDau { get; set; } = null!;

    public string MaDiemCuoi { get; set; } = null!;

    public bool? TrangThai { get; set; }

    public int? KhoangCach { get; set; }

    public virtual ICollection<KhaiThac> KhaiThacs { get; set; } = new List<KhaiThac>();

    public virtual TinhThanh MaDiemCuoiNavigation { get; set; } = null!;

    public virtual TinhThanh MaDiemDauNavigation { get; set; } = null!;
}
