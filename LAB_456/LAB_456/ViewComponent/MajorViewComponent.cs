using LAB_456.Data;
using LAB_456.Models;
using Microsoft.AspNetCore.Mvc;

public class MajorViewComponent : ViewComponent
{
    SchoolContext db;
    List<Major> majors;

    public MajorViewComponent(SchoolContext _context)
    {
        db = _context;
        majors = db.Majors.ToList();
    }

    public async Task<IViewComponentResult> InvokeAsync()
    {
        return View("RenderMajor", majors);
    }
}