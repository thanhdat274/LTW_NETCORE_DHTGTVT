using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using TestAtHome3.Models;

namespace TestAtHome3.Controllers;

public class HangHoaController : Controller
{
    private QlhangHoaContext db;

    public HangHoaController(QlhangHoaContext context)
    {
        db = context;
    }
    
    // GET
    public IActionResult Index(int? loaiHangId)
    {
        //Lấy danh sách hàng hoá và lọc theo loại hàng nếu có
        var hangHoas = loaiHangId.HasValue
            ? db.HangHoas.Where(h => h.MaLoai == loaiHangId.Value && h.Gia >= 100).ToList()
            : db.HangHoas.Where(h => h.Gia >= 100).ToList();
        
        // Truyền dữ liệu về loại hàng cho View
        ViewBag.LoaiHang = db.LoaiHangs.Find(loaiHangId)?.TenLoai ?? "Nguyen The Loan An" ;
        
        return View(hangHoas);
    }
    
    //Create
    public IActionResult Create()
    {
        // Lấy danh sách loại hàng
        var loaiHangs = db.LoaiHangs.ToList();
        // Kiểm tra nếu không có loại hàng, trả về dropdown trống
        if (loaiHangs == null || !loaiHangs.Any())
        {
            ViewBag.LoaiHangs = new SelectList(Enumerable.Empty<SelectListItem>());
        }
        else
        {
            ViewBag.LoaiHangs = new SelectList(loaiHangs, "MaLoai", "TenLoai");
        }
        return View();
    }
    
    [HttpPost]
    public IActionResult Create(HangHoa hangHoa)
    {
        if (ModelState.IsValid)
        {
            try
            {
                db.HangHoas.Add(hangHoa);
                db.SaveChanges();
                return RedirectToAction(nameof(Index));
            }
            catch (Exception ex)
            {
                ModelState.AddModelError("", $"Lỗi khi lưu dữ liệu: {ex.Message}");
            }
        }
            
        // Log lỗi trong ModelState
        var errors = ModelState.Values.SelectMany(v => v.Errors).Select(e => e.ErrorMessage);
        ViewBag.Errors = errors; // Gửi danh sách lỗi sang View để hiển thị

        ViewBag.LoaiHangs = new SelectList(db.LoaiHangs, "MaLoai", "TenLoai", hangHoa.MaLoai);
        return View(hangHoa);
    }
    
    
    
}