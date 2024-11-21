using LAB_456.Data;
using LAB_456.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;

namespace LAB_456.Controllers;

public class LearnerController : Controller
{
    private SchoolContext db;

    public LearnerController(SchoolContext context)
    {
        db = context;
    }

    public IActionResult Index(int? mid)
    {
        if (mid == null)
        {
            var learner = db.Learners.Include(m => m.MajorID).ToList();
            return View(learner);
        }
        else
        {
            var learner = db.Learners
                .Where(l => l.MajorID == mid)
                .Include(m => m.MajorID).ToList();
            return View(learner);
        }
    }

    public IActionResult Create()
    {
        // Dùng 1 trong 2 cách để tạo SelectList gửi về View qua ViewBag để hiển thị danh sách chuyên ngành (Majors)
        var majors = new List<SelectListItem>(); // Cách 1
        foreach (var item in db.Majors)
        {
            majors.Add(new SelectListItem { Text = item.MajorName, Value = item.MajorID.ToString() });
        }

        ViewBag.MajorID = new SelectList(db.Majors, "MajorID", "MajorName"); // Cách 2
        return View();
    }

    [HttpPost]
    [ValidateAntiForgeryToken]
    public IActionResult Create([Bind("FirstMidName,LastName,MajorID,EnrollmentDate")] Learner learner)
    {
        if (ModelState.IsValid)
        {
            db.Learners.Add(learner);
            db.SaveChanges();
            return RedirectToAction(nameof(Index));
        }

        // Dùng 1 trong 2 cách tạo SelectList gửi về View để hiển thị danh sách Majors
        ViewBag.MajorID = new SelectList(db.Majors, "MajorID", "MajorName");
        return View();
    }


    // Tạo 2 action edit
    public IActionResult Edit(int id)
    {
        if (id == null || db.Learners == null)
        {
            return NotFound();
        }

        var learner = db.Learners.Find(id);
        if (learner == null)
        {
            return NotFound();
        }

        ViewBag.MajorID = new SelectList(db.Majors, "MajorID", "MajorName", learner.MajorID);
        return View(learner);
    }

    [HttpPost]
    [ValidateAntiForgeryToken]
    public IActionResult Edit(int id, [Bind("LearnerID,FirstMidName,LastName,MajorID,EnrollmentDate")] Learner learner)
    {
        if (id != learner.LearnerID)
        {
            return NotFound();
        }

        if (ModelState.IsValid)
        {
            try
            {
                db.Update(learner);
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!LearnerExists(learner.LearnerID))
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

        ViewBag.MajorID = new SelectList(db.Majors, "MajorID", "MajorName", learner.MajorID);
        return View(learner);
    }

    private bool LearnerExists(int id)
    {
        return (db.Learners?.Any(e => e.LearnerID == id)).GetValueOrDefault();
    }


    public ActionResult Delete(int? id)
    {
        if (id == null || db.Learners == null)
        {
            return NotFound();
        }

        var learner = db.Learners
            .Include(l => l.Major)
            .Include(e => e.Enrollments)
            .FirstOrDefault(m => m.LearnerID == id);
        if (learner == null)
        {
            return NotFound();
        }

        if (learner.Enrollments.Count() > 0)
        {
            return Content("This learner has some enrollments, can't delete!");
        }

        return View(learner);
    }

    // POST: Learner/Delete/5
    [HttpPost, ActionName("Delete")]
    [ValidateAntiForgeryToken]
    public ActionResult DeleteConfirmed(int id)
    {
        if (db.Learners == null)
        {
            return Problem("Entity set 'Learners' is null.");
        }

        var learner = db.Learners.Find(id);
        if (learner != null)
        {
            db.Learners.Remove(learner);
            db.SaveChanges();
        }

        return RedirectToAction(nameof(Index));
    }
}