﻿using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using WebApplication1.Models;

namespace WebApplication1.Controllers;

public class StudentController : Controller
{
    private List<Student> listStudents = new List<Student>();

    public StudentController()
    {
        listStudents = new List<Student>()
        {
            new Student()
            {
                Id = 101, Name = "Hải Nam", DateOfBirth = new DateTime(2002, 12, 11), Branch = Branch.IT,
                Gender = Gender.Male, IsRegular = true,
                Address = "A1-2018", Email = "nam@g.com"
            },
            new Student()
            {
                Id = 102, Name = "Minh Tú", DateOfBirth = new DateTime(2000, 12, 01), Branch = Branch.BE,
                Gender = Gender.Female, IsRegular = true,
                Address = "A1-2019", Email = "tu@g.com"
            },
            new Student()
            {
                Id = 103, Name = "Hoàng Phong", DateOfBirth = new DateTime(2001, 09, 01), Branch = Branch.CE,
                Gender = Gender.Male, IsRegular = false,
                Address = "A1-2020", Email = "phong@g.com"
            },
            new Student()
            {
                Id = 104, Name = "Xuân Mai", DateOfBirth = new DateTime(2001, 03, 10), Branch = Branch.EE,
                Gender = Gender.Female, IsRegular = false,
                Address = "A1-2021", Email = "mai@g.com"
            }
        };
    }

    // [Route("Admin/Student/List", Name = "studentList")]
    public IActionResult Index()
    {
        return View(listStudents);
    }

    // [Route("Admin/Student/Add", Name = "studentAdd")]
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
    public IActionResult Create(Student s)
    {
        if (ModelState.IsValid)
        {
            s.Id = listStudents.Last<Student>().Id + 1;
            listStudents.Add(s);
            return View("index", listStudents);
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