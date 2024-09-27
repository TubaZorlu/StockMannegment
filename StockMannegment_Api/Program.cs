

using StockMannegment_Business.CategoryRepository;
using StockMannegment_Business.GenderRepository;
using StockMannegment_Business.ProductRepository;
using StockMannegment_Business.SizeRepository;
using StockMannegment_Business.StockMovementRepository;
using StockMannegment_DataAccess;
using StockMannegment_Dtos.StockDtos;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddSingleton<Context>();
builder.Services.AddSingleton<ICategoryRepository, CategoryRepository>();
builder.Services.AddSingleton<IProductRepository, ProductRepository>();
builder.Services.AddSingleton<ISizeRepository, SizeRepository>();
builder.Services.AddSingleton<IGenderRepository, GenderRepository>();
builder.Services.AddSingleton<IStockMovementRepository, StockMovementRepository>();
builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
