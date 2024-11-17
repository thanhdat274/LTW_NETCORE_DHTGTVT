using System.ComponentModel.DataAnnotations;

namespace LAB_456.Models;

public class Student
{
    public int Id { get; set; } // Mã sinh viên

    [Required(ErrorMessage = "Họ tên là bắt buộc")]
    [StringLength(100, MinimumLength = 4, ErrorMessage = "Họ tên phải từ 4 đến 100 ký tự")]
    public string? Name { get; set; } // Họ tên

    [Required(ErrorMessage = "Email là bắt buộc")]
    [RegularExpression(@"^[A-Za-z0-9._%+-]+@gmail\.com$", ErrorMessage = "Email phải có đuôi @gmail.com")]
    public string? Email { get; set; } // Email

    [Required(ErrorMessage = "Mật khẩu là bắt buộc")]
    [StringLength(100, MinimumLength = 8, ErrorMessage = "Mật khẩu phải từ 8 ký tự trở lên")]
    [RegularExpression(@"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).+$",
        ErrorMessage = "Mật khẩu phải chứa ít nhất một ký tự viết hoa, viết thường, số và ký tự đặc biệt")]
    public string? Password { get; set; } // Mật khẩu

    [Required(ErrorMessage = "Ngành học là bắt buộc")]   
    public Branch? Branch { get; set; } // Ngành học

    [Required(ErrorMessage = "Giới tính là bắt buộc")]
    public Gender? Gender { get; set; } // Giới tính

    public bool IsRegular { get; set; } // Hệ: true - chính quy, false - phi chính quy

    [DataType(DataType.MultilineText)]
    [Required(ErrorMessage = "Địa chỉ là bắt buộc")]
    public string? Address { get; set; } // Địa chỉ

    [Range(typeof(DateTime), "1963-01-01", "2005-12-31", ErrorMessage = "Ngày sinh phải trong khoảng từ 1963 đến 2005")]
    [DataType(DataType.Date)]
    [Required(ErrorMessage = "Ngày sinh là bắt buộc")]
    public DateTime? DateOfBirth { get; set; } // Ngày sinh

    
    [Range(0.0, 10.0, ErrorMessage = "Điểm phải nằm trong khoảng từ 0.0 đến 10.0")]
    [Required(ErrorMessage = "Điểm là bắt buộc")]
    public double? Score { get; set; } // Điểm

}