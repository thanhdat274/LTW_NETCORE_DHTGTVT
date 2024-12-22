using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using TestAtHome2.Data;
using TestAtHome2.Models;
using System.IO;

namespace TestAtHome2.Controllers
{
    public class HangHoaController : Controller
    {
        private QlhangHoaContext _context;

        public HangHoaController(QlhangHoaContext context)
        {
            _context = context;
        }

        // Hiển thị danh sách hàng hoá, có thể lọc theo loại hàng
        public IActionResult Index(int? loaiHangId)
        {
            // Lấy danh sách loại hàng
            var loaiHangs = _context.LoaiHangs.ToList();

            // Nếu có loại hàng được chọn, lọc sản phẩm theo loại đó
            var hangHoas = loaiHangId.HasValue
                ? _context.HangHoas.Where(h => h.MaLoai == loaiHangId.Value).ToList()
                : _context.HangHoas.ToList();

            // Truyền dữ liệu về loại hàng cho View
            ViewBag.LoaiHangs = new SelectList(loaiHangs, "MaLoai", "TenLoai", loaiHangId);
            return View(hangHoas);
        }

        // Hiển thị chi tiết hàng hoá
        public IActionResult Details(int id)
        {
            var hangHoa = _context.HangHoas
                                  .FirstOrDefault(h => h.MaHang == id);
            if (hangHoa == null)
            {
                return NotFound();
            }
            return View(hangHoa);
        }
        
        // Hiển thị form thêm mới hàng hoá
        public IActionResult Create()
        {
            // Lấy danh sách loại hàng
            var loaiHangs = _context.LoaiHangs.ToList();
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

        // Xử lý thêm mới hàng hoá
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Create([Bind("MaHang,MaLoai,TenHang,Gia,Anh")] HangHoa hangHoa)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    _context.HangHoas.Add(hangHoa);
                    _context.SaveChanges();
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

            ViewBag.LoaiHangs = new SelectList(_context.LoaiHangs, "MaLoai", "TenLoai", hangHoa.MaLoai);
            return View(hangHoa);
        }

        // Hiển thị form chỉnh sửa hàng hoá
        public IActionResult Edit(int id)
        {
            var hangHoa = _context.HangHoas
                                  .FirstOrDefault(h => h.MaHang == id);
            if (hangHoa == null)
            {
                return NotFound();
            }

            // Lấy danh sách loại hàng để hiển thị trong dropdown
            ViewBag.LoaiHangs = new SelectList(_context.LoaiHangs, "MaLoai", "TenLoai", hangHoa.MaLoai);
            return View(hangHoa);
        }

        // Xử lý cập nhật hàng hoá
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Edit(int id, HangHoa hangHoa)
        {
            if (id != hangHoa.MaHang)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                _context.HangHoas.Update(hangHoa);
                _context.SaveChanges();
                return RedirectToAction(nameof(Index));
            }

            ViewBag.LoaiHangs = new SelectList(_context.LoaiHangs, "MaLoai", "TenLoai", hangHoa.MaLoai);
            return View(hangHoa);
        }

        // Xác nhận xoá hàng hoá
        public IActionResult Delete(int id)
        {
            var hangHoa = _context.HangHoas
                                  .FirstOrDefault(h => h.MaHang == id);
            if (hangHoa == null)
            {
                return NotFound();
            }
            return View(hangHoa);
        }

        // Xử lý xoá hàng hoá
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public IActionResult DeleteConfirmed(int id)
        {
            var hangHoa = _context.HangHoas
                                  .FirstOrDefault(h => h.MaHang == id);
            if (hangHoa != null)
            {
                _context.HangHoas.Remove(hangHoa);
                _context.SaveChanges();
            }
            return RedirectToAction(nameof(Index));
        }
    }
}
