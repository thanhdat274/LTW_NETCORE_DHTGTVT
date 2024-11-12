using Lap1.Models;
using Microsoft.AspNetCore.Mvc;


public class RenderViewComponent :ViewComponent
{
    private List<MenuItem> menuItems= new List<MenuItem>();

    public RenderViewComponent()
    {
        menuItems = new List<MenuItem>()
        {
            new MenuItem() { Id = 1, Name = "Branches", Link = "Branches/Lists" },
            new MenuItem() { Id = 2, Name = "Students", Link = "Students/Lists" },
            new MenuItem() { Id = 3, Name = "Subjects", Link = "Courses/Lists" },
            new MenuItem() { Id = 4, Name = "Courses", Link = "Courses/Lists" },
        };
    }


    public async Task<IViewComponentResult> InvokeAsync()
    {
        return View("RenderLeftMenu",menuItems);
    }

}