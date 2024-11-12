using Microsoft.AspNetCore.Mvc;

namespace WebApplication1.Controllers;

public class Demo1 : Controller
{
    // GET
    public IActionResult Index()
    {
        return View();
    }
}