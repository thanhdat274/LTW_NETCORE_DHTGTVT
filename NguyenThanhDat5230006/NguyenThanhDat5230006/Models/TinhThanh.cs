﻿using System;
using System.Collections.Generic;

namespace NguyenThanhDat5230006.Models;

public partial class TinhThanh
{
    public string MaTinhThanh { get; set; } = null!;

    public string? TenTinhThanh { get; set; }

    public string? VietTat { get; set; }

    public virtual ICollection<Tuyen> TuyenMaDiemCuoiNavigations { get; set; } = new List<Tuyen>();

    public virtual ICollection<Tuyen> TuyenMaDiemDauNavigations { get; set; } = new List<Tuyen>();
}
