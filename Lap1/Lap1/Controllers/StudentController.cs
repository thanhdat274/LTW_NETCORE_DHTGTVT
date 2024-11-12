using Lap1.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace Lap1.Controllers;

public class StudentController : Controller
{
    private List<Student> students = new List<Student>();

    public StudentController()
    {
        students = new List<Student>()
        {
            new Student()
            {
                Id = 1, Name = "quanna", Branch = Branch.IT, Gender = Gender.Male, Email = "quanna@gmail.com",
                Address = "Hà Nội", IsRegular = true, Score = 8.0,Dob = new DateTime(2000, 1, 1)
            },
            new Student()
            {
                Id = 2, Name = "quanna1", Branch = Branch.EE, Gender = Gender.Male, Email = "quanna1@gmail.com",
                Address = "Phú Thọ", IsRegular = true, Score = 8.0, Dob = new DateTime(1998, 1, 1)
            },
            new Student()
            {
                Id = 3, Name = "quanna2", Branch = Branch.BE, Gender = Gender.Male, Email = "quanna2@gmail.com",
                Address = "Hoà Bình", IsRegular = true, Score = 9.0,Dob = new DateTime(1995, 1, 1)
            },
            new Student()
            {
                Id = 4, Name = "quanna3", Branch = Branch.CE, Gender = Gender.Male, Email = "quanna3@gmail.com",
                Address = "Cầu Giấy", IsRegular = false, Score = 8.0,Dob = new DateTime(1998, 3, 1)
            },
        };
    }
    
    // GET
    public IActionResult Index()
    {
        return View(students);
    }

    [HttpGet]
    public IActionResult Create()
    {
        ViewBag.AllGenders = Enum.GetValues(typeof(Gender)).Cast<Gender>().ToList();
        ViewBag.AllBranches = new List<SelectListItem>()
        {
            new SelectListItem { Text = "IT", Value = "1" },
            new SelectListItem { Text = "BE", Value = "2" },
            new SelectListItem { Text = "CE", Value = "3" },
            new SelectListItem { Text = "EE", Value = "4" }
        };
        return View();
    }

    [HttpPost]
    public IActionResult Create(Student student)
    {
        if (ModelState.IsValid)
        {
            student.Id = students.Last<Student>().Id + 1;
            students.Add(student);
            return View("Index", students);
        }
        ViewBag.AllGenders = Enum.GetValues(typeof(Gender)).Cast<Gender>().ToList();
        ViewBag.AllBranches = new List<SelectListItem>()
        {
            new SelectListItem { Text = "IT", Value = "1" },
            new SelectListItem { Text = "BE", Value = "2" },
            new SelectListItem { Text = "CE", Value = "3" },
            new SelectListItem { Text = "EE", Value = "4" }
        };
        return View();
    }
}