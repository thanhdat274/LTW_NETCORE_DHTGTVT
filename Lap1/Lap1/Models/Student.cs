using System.ComponentModel.DataAnnotations;

namespace Lap1.Models;

public class Student
{
    public int Id{get; set;}
    [Required(ErrorMessage = "Tên không được để trống")]
    [StringLength(100, MinimumLength = 4, ErrorMessage = "Tên phải có độ dài từ 4 đến 100 ký tự")]
    public string Name { get; set; }

    [Required(ErrorMessage = "Email không được để trống")]
    [RegularExpression(@"^[\w\.\-]+@gmail\.com$", ErrorMessage = "Email phải có đuôi @gmail.com")]
    public string Email { get; set; }
    [Required(ErrorMessage = "Mật khẩu không được để trống")]
    [MinLength(8, ErrorMessage = "Mật khẩu phải có ít nhất 8 ký tự")]
    [RegularExpression(@"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$", 
        ErrorMessage = "Mật khẩu phải chứa ít nhất 1 ký tự viết hoa, 1 ký tự viết thường, 1 chữ số và 1 ký tự đặc biệt")]
    public string Password { get; set; }
    [Required(ErrorMessage = "Branch Không được để trống")]
    public Branch Branch{get; set;}
    [Required(ErrorMessage = "Gender Không được để trống")]
    public Gender Gender{get; set;}
    public bool IsRegular{get; set;}
    [DataType(DataType.MultilineText)]
    [Required(ErrorMessage = "Địa chỉ không được để trống")]
    public string Address{get; set;}
    // [Range(typeof(DateTime),"1/1/1963","12/31/2005", ErrorMessage = "Ngày sinh phải từ 1/1/1963 đến 12/31/2005")]
    // [DataType(DataType.Date,ErrorMessage = "Không đúng kiểu dữ liệu")]
    // [Required(ErrorMessage = "Ngày sinh không được để trống")]
    public DateTime? Dob{get; set;}
    
    [Required(ErrorMessage = "Điểm không được để trống")]
    [Range(0.0, 10.0, ErrorMessage = "Điểm phải từ 0.0 đến 10.0")]
    public double? Score { get; set; }
}