using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace TestAtHome3.Models;

public partial class HangHoa
{
    public int MaHang { get; set; }

    public int MaLoai { get; set; }

    [Required(ErrorMessage = "Vui lòng nhập tên hàng")]
    public string TenHang { get; set; } = null!;

    [Required(ErrorMessage = "Vui lòng nhập giá")]
    [Range(100, 5000, ErrorMessage = "Vui lòng nhập giá trong khoảng 100-5000")]
    public int Gia { get; set; }

    [Required(ErrorMessage = "Nhập ảnh")]
    [RegularExpression(@"^.*\.(jpg|png|gif|tiff)$", ErrorMessage = "Tên file ảnh phải có đuôi: .jpg, .png, .gif, hoặc .tiff")]
    public string? Anh { get; set; }

    public virtual LoaiHang? MaLoaiNavigation { get; set; } = null!;
}
