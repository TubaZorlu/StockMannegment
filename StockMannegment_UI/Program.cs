using StockMannegment_Business.CategoryRepository;
using StockMannegment_Business.CostPriceRepository;
using StockMannegment_Business.GenderRepository;
using StockMannegment_Business.ProductPriceRepository;
using StockMannegment_Business.ProductRepository;
using StockMannegment_Business.SizeRepository;
using StockMannegment_Business.StockMovementRepository;
using StockMannegment_Business.StockRepository;
using StockMannegment_DataAccess;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddHttpClient();
builder.Services.AddSingleton<Context>();
builder.Services.AddSingleton<ICategoryRepository, CategoryRepository>();
builder.Services.AddSingleton<IProductRepository, ProductRepository>();
builder.Services.AddSingleton<IProductPriceRepository, ProductPriceRepository>();
builder.Services.AddSingleton<IStockEnterRepository, StockEnterRepository>();
builder.Services.AddSingleton<IGenderRepository, GenderRepository>();
builder.Services.AddSingleton<ISizeRepository, SizeRepository>();
builder.Services.AddSingleton<IStockMovementRepository, StockMovementRepository>();
builder.Services.AddSingleton<ICostPriceRepository, CostPriceRepository>();
builder.Services.AddControllersWithViews();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();

app.UseAuthorization();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Product}/{action=ProductList}/{id?}");

app.Run();
