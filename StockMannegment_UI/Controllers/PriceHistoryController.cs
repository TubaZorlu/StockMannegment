using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using StockMannegment_Business.ProductPriceRepository;
using StockMannegment_Business.ProductRepository;
using StockMannegment_Business.StockMovementRepository;
using StockMannegment_Business.StockRepository;
using StockMannegment_Dtos.ProductDtos;
using System.Net.Http;

namespace StockMannegment_UI.Controllers
{
    public class PriceHistoryController : Controller
    {
        private readonly IHttpClientFactory _httpClientFactory;
        private readonly IStockMovementRepository _stockMovementRepository;
        private readonly IStockEnterRepository _stockEnterRepository;
        private readonly IProductRepository _productRepository;
        private readonly IProductPriceRepository _productPriceRepository;

        public PriceHistoryController(IStockMovementRepository stockMovementRepository, IHttpClientFactory httpClientFactory, IStockEnterRepository stockEnterRepository, IProductRepository productRepository, IProductPriceRepository productPriceRepository)
        {
            _stockMovementRepository = stockMovementRepository;
            _httpClientFactory = httpClientFactory;
            _stockEnterRepository = stockEnterRepository;
            _productRepository = productRepository;
            _productPriceRepository = productPriceRepository;
        }

        [HttpGet]
        public async Task<IActionResult> PriceHistoryReport()
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

                ViewBag.Products = resultProduct;
                ViewBag.Categories = resultCategory;


            }

            var priceHistory = await _productPriceRepository.ProductPriceHistory();
            return View(priceHistory);
        }

        [HttpPost]
        public async Task<IActionResult> PriceHistoryReport(int productId) 
        {

            var stockData = await _productPriceRepository.GetProductPriceByID(productId);


            return Json(new { stockData });
        }
    }
}
