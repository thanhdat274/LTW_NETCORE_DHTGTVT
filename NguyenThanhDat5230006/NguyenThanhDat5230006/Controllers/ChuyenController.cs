using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using NguyenThanhDat5230006.Models;

namespace NguyenThanhDat5230006.Controllers
{
    public class ChuyenController : Controller
    {
        private  VanTaiHanhKhachContext _context;

        public ChuyenController(VanTaiHanhKhachContext context)
        {
            _context = context;
        }

        // GET: Chuyen
        public async Task<IActionResult> Index()
        {
            var vanTaiHanhKhachContext = _context.Chuyens.Include(c => c.MaKhaiThacNavigation)
                .OrderByDescending(c => c.NgayGio);
            return View(await vanTaiHanhKhachContext.ToListAsync());
        }

        // GET: Chuyen/Create
        public IActionResult Create()
        {
            ViewData["MaKhaiThac"] = new SelectList(_context.KhaiThacs, "MaKhaiThac", "MaKhaiThac");
            return View();
        }

        // POST: Chuyen/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("MaChuyen,MaKhaiThac,SoXe,LaiXe,PhuXe,NgayGio,Anh")] Chuyen chuyen)
        {
            if (ModelState.IsValid)
            {
                _context.Chuyens.Add(chuyen);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["MaKhaiThac"] = new SelectList(_context.KhaiThacs, "MaKhaiThac", "MaKhaiThac", chuyen.MaKhaiThac);
            return View(chuyen);
        }

    }
}
