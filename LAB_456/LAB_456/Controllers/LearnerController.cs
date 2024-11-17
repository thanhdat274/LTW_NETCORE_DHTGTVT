using LAB_456.Data;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace LAB_456.Controllers;

public class LearnerController :Controller
{
    private SchoolContext db;

    public LearnerController(SchoolContext context)
    {
        db = context;
    }

    public IActionResult Index()
    {
        var learner = db.Learners.Include(m => m.MajorID).ToList();
        return View(learner);
    }
    
}