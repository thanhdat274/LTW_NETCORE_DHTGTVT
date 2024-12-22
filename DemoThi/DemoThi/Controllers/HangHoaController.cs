using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using DemoThi.Models;

namespace DemoThi.Controllers
{
    public class HangHoaController : Controller
    {
        private QlhangHoaContext _context;

        public HangHoaController(QlhangHoaContext context)
        {
            _context = context;
        }

        // GET: HangHoa
        public async Task<IActionResult> Index(int? mid)
        {
            if (mid == null)
            {
                var filteredHangHoas = await _context.HangHoas
                    .Include(h => h.MaLoaiNavigation)
                    .Where(h => h.Gia >= 100)
                    .ToListAsync();
                return View(filteredHangHoas);
            }
            else
            {
                var filteredHangHoas = await _context.HangHoas
                    .Include(h => h.MaLoaiNavigation)
                    .Where(h => h.Gia >= 100)
                    .Where(l => l.MaLoai == mid)
                    .ToListAsync();
                return View(filteredHangHoas);
            }
        }

        // GET: HangHoa/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var hangHoa = await _context.HangHoas
                .Include(h => h.MaLoaiNavigation)
                .FirstOrDefaultAsync(m => m.MaHang == id);
            if (hangHoa == null)
            {
                return NotFound();
            }

            return View(hangHoa);
        }

        // GET: HangHoa/Create
        public IActionResult Create()
        {
            ViewBag.LoaiHangs = new SelectList(_context.LoaiHangs, "MaLoai", "TenLoai");
            return View();
        }

        // POST: HangHoa/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Create([Bind("MaHang,MaLoai,TenHang,Gia,Anh")] HangHoa hangHoa)
        {
            if (ModelState.IsValid)
            {
                _context.HangHoas.Add(hangHoa);
                _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }

            ViewBag.LoaiHangs = new SelectList(_context.LoaiHangs, "MaLoai", "TenLoai", hangHoa.MaLoai);
            return View(hangHoa);
        }

        // GET: HangHoa/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var hangHoa = await _context.HangHoas.FindAsync(id);
            if (hangHoa == null)
            {
                return NotFound();
            }

            ViewData["MaLoai"] = new SelectList(_context.LoaiHangs, "MaLoai", "MaLoai", hangHoa.MaLoai);
            return View(hangHoa);
        }

        // POST: HangHoa/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("MaHang,MaLoai,TenHang,Gia,Anh")] HangHoa hangHoa)
        {
            if (id != hangHoa.MaHang)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(hangHoa);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!HangHoaExists(hangHoa.MaHang))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }

                return RedirectToAction(nameof(Index));
            }

            ViewData["MaLoai"] = new SelectList(_context.LoaiHangs, "MaLoai", "MaLoai", hangHoa.MaLoai);
            return View(hangHoa);
        }

        private bool HangHoaExists(int id)
        {
            return _context.HangHoas.Any(e => e.MaHang == id);
        }
    }
}