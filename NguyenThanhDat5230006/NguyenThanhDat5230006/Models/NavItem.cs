﻿using System;
using System.Collections.Generic;

namespace NguyenThanhDat5230006.Models;

public partial class NavItem
{
    public int Id { get; set; }

    public string? NavName { get; set; }

    public string? NavNameVn { get; set; }

    public string? Link { get; set; }
}
