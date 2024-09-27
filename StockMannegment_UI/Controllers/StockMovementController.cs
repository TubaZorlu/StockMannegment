using Microsoft.AspNetCore.Mvc;
using Microsoft.CodeAnalysis;
using Newtonsoft.Json;
using StockMannegment_Business.ProductRepository;
using StockMannegment_Business.StockMovementRepository;
using StockMannegment_Business.StockRepository;
using StockMannegment_DataAccess;
using StockMannegment_Dtos.CategoryDtos;
using StockMannegment_Dtos.ProductDtos;
using StockMannegment_Dtos.StockDtos;
using StockMannegment_Dtos.StockMovementDtos;
using System.Net.Http;

namespace StockMannegment_UI.Controllers
{
    public class StockMovementController : Controller
    {
        private readonly IHttpClientFactory _httpClientFactory;
        private readonly IStockMovementRepository _stockMovementRepository;
        private readonly IStockEnterRepository _stockEnterRepository;
        private readonly IProductRepository _productRepository;

        public StockMovementController(IStockMovementRepository stockMovementRepository, IHttpClientFactory httpClientFactory, IStockEnterRepository stockEnterRepository, IProductRepository productRepository)
        {
            _stockMovementRepository = stockMovementRepository;
            _httpClientFactory = httpClientFactory;
            _stockEnterRepository = stockEnterRepository;
            _productRepository = productRepository;
        }

        [HttpGet]
        public async Task<IActionResult> StockMovementList()
        {
            var client = _httpClientFactory.CreateClient();
            var responseMessage = await client.GetAsync("https://localhost:44317/api/StockMovement/GetStockMovementList");
            var currentStock=await _productRepository.CurrentStockAll();
            ViewBag.Stock=currentStock;
            if (responseMessage.IsSuccessStatusCode)
            {
                var dataJson = await responseMessage.Content.ReadAsStringAsync();
                var result = JsonConvert.DeserializeObject<List<AllStockMovementDto>>(dataJson);
                
                
                return View(result);
            }

            return View();
        }


        [HttpPost]
        public async Task<IActionResult> StockMovementList(DateTime startDate, DateTime endDate)
        {
           var result=await _stockMovementRepository.FilterByDateRangeStockMovementAsync(startDate, endDate);
            
            return PartialView("_StockMovementTable", result);
        }

        [HttpGet]
        public async Task<IActionResult> StockReport() 
        {
            var client = _httpClientFactory.CreateClient();
            var responseMessage = await client.GetAsync("https://localhost:44317/api/Products/GetProductList");
            var categoriesResponse = await client.GetAsync("https://localhost:44317/api/Categories/GetCategoryList");

            if (responseMessage.IsSuccessStatusCode)
            {
                var dataProduct = await responseMessage.Content.ReadAsStringAsync();
                var dataCategory = await categoriesResponse.Content.ReadAsStringAsync();
                var resultProduct = JsonConvert.DeserializeObject<List<ProductListDto>>(dataProduct);
                var resultCategory = JsonConvert.DeserializeObject<List<ProductListDto>>(dataCategory);

                ViewBag.Products= resultProduct;
                ViewBag.Categories= resultCategory;

                
            }
            return View();


                

        }

        [HttpPost]
        public async Task<IActionResult> StockReport(int productId, int categoryId)
        {

            var stockData = await _stockMovementRepository.GetMontlyProductStockMovement(productId);
            var salesData = await _stockMovementRepository.GetMontlyCategoryStockMovement(categoryId);

            return Json(new { stockData, salesData });
        }

        [HttpPost]

        public async Task<IActionResult> AddStock(int productId,float quantity)
        {

            try
            {
                var stock = new AddEnterStockDto()
                {
                    ProductID = productId,
                    Stock = quantity,
                    UnitID = 1,
                    EnterDate = DateTime.Now,
                };

                await _stockEnterRepository.AddStock(stock);
                UpdateProductDto dto =  await _productRepository.GetByIdProduct(productId);
                dto.CurrentStock = quantity+dto.CurrentStock;
                await _productRepository.UpdateProductAsync(dto);

                
                return Json(new { success = true, message = "Stok başarıyla eklendi." });
            }
            catch (Exception ex)
            {
                
                return Json(new { success = false, message = "Stok eklenirken bir hata oluştu: " + ex.Message });
            }
        }


        [HttpPost]
        public async Task<IActionResult> DeleteStock(int productId, float quantity)
        {
            try
            {
                var stock = new DeleteStockDto()
                {
                    ProductID = productId,
                    Stock = quantity,
                    UnitID = 1,
                    ExitDate = DateTime.Now,
                };

                await _stockEnterRepository.DeleteStock(stock);
                UpdateProductDto dto = await _productRepository.GetByIdProduct(productId);
                dto.CurrentStock =   dto.CurrentStock- quantity;
                await _productRepository.UpdateProductAsync(dto);

                return Json(new { success = true, message = "Stok başarıyla düşürüldü." });
            }
            catch (Exception ex)
            {
              
                return Json(new { success = false, message = "Stok düşürülürken bir hata oluştu: " + ex.Message });
            }
        }

     

    }
}
