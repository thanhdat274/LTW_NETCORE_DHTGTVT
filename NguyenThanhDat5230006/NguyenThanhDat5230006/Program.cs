using Microsoft.EntityFrameworkCore;
using NguyenThanhDat5230006.Models;

var builder = WebApplication.CreateBuilder(args);
builder.Services.AddDbContext<VanTaiHanhKhachContext>(options => options
    .UseSqlServer(builder.Configuration.GetConnectionString("VanTaiHanhKhachContext")));	
// Add services to the container.
builder.Services.AddControllersWithViews();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
}
app.UseStaticFiles();

app.UseRouting();

app.UseAuthorization();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");

app.Run();
