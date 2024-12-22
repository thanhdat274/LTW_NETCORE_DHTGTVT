using DemoThi.Models;
using Microsoft.AspNetCore.Mvc;


public class DatntMenuViewComponent : ViewComponent
{
    QlhangHoaContext db;
    List<LoaiHang> loaiHang;

    public DatntMenuViewComponent(QlhangHoaContext _context)
    {
        db = _context;
        loaiHang = db.LoaiHangs.ToList();
    }

    public async Task<IViewComponentResult> InvokeAsync()
    {
        return View("RenderDatntMenu", loaiHang);
    }
}