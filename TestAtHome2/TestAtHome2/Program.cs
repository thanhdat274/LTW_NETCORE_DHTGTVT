using Microsoft.EntityFrameworkCore;
using TestAtHome2.Data;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddControllersWithViews();

// Configure DbContext for QlhangHoaContext
builder.Services.AddDbContext<QlhangHoaContext>(options =>
    options.UseSqlServer(builder.Configuration.GetConnectionString("QLHangHoaContext")));

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();
app.UseRouting();
app.UseAuthorization();

// Map default route
app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");

// Map route for LoaiHang (Hiển thị danh sách loại hàng)
app.MapControllerRoute(
    name: "LoaiHang",
    pattern: "LoaiHang/{action=Index}/{id?}",
    defaults: new { controller = "LoaiHang", action = "Index" });

// Map route for HangHoa (Hiển thị danh sách hàng hóa và lọc theo loại)
app.MapControllerRoute(
    name: "HangHoa",
    pattern: "HangHoa/{action=Index}/{id?}",
    defaults: new { controller = "HangHoa", action = "Index" });

// Route cho AJAX lọc HangHoa theo LoaiHang
app.MapControllerRoute(
    name: "HangHoaFilter",
    pattern: "HangHoa/Loai/{id}",
    defaults: new { controller = "HangHoa", action = "FilterByLoai" });

// Route cho tạo mới HangHoa
app.MapControllerRoute(
    name: "CreateHangHoa",
    pattern: "HangHoa/Create",
    defaults: new { controller = "HangHoa", action = "Create" });

// Route cho validation và save HangHoa
app.MapControllerRoute(
    name: "ValidateHangHoa",
    pattern: "HangHoa/ValidateAndSave",
    defaults: new { controller = "HangHoa", action = "ValidateAndSave" });

app.Run();
