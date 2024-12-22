using System.ComponentModel.DataAnnotations;

namespace DemoThi.Models;

public partial class HangHoa
{
    public int MaHang { get; set; }

    public int MaLoai { get; set; }

    [Required(ErrorMessage = "Tên hàng không được để trống.")]
    public string TenHang { get; set; } = null!;

    [Range(100, 5000, ErrorMessage = "Giá phải nằm trong khoảng từ 100 đến 5000.")]
    [Required(ErrorMessage = "Giá không được để trống.")]
    public decimal? Gia { get; set; }

    [RegularExpression(@".*\.(jpg|png|gif|tiff)$", ErrorMessage = "Tên file ảnh phải có đuôi: .jpg, .png, .gif, hoặc .tiff.")]
    [Required(ErrorMessage = "Ảnh không được để trống.")]
    public string? Anh { get; set; }

    public virtual LoaiHang? MaLoaiNavigation { get; set; } = null!;
}
