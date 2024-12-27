using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using NguyenThanhDat5230006.Models;



public class LeftSibarViewComponent : ViewComponent
{
    private VanTaiHanhKhachContext db;
    
    public LeftSibarViewComponent(VanTaiHanhKhachContext context)
    {
        db = context;
    }
    public async Task<Tuyen> Index()
    {
        var vanTaiHanhKhachContext = db.Tuyens.Include(t=> t.MaTuyen);
        return View("Re",await vanTaiHanhKhachContext.ToListAsync());
    }
}