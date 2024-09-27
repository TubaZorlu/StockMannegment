using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Newtonsoft.Json;
using StockMannegment_Business.CategoryRepository;
using StockMannegment_Business.CostPriceRepository;
using StockMannegment_Business.GenderRepository;
using StockMannegment_Business.ProductPriceRepository;
using StockMannegment_Business.ProductRepository;
using StockMannegment_Business.SizeRepository;
using StockMannegment_Business.StockRepository;
using StockMannegment_Dtos.CategoryDtos;
using StockMannegment_Dtos.GenderDtos;
using StockMannegment_Dtos.PriceCostDtos;
using StockMannegment_Dtos.ProductDtos;
using StockMannegment_Dtos.ProductPriceDtos;
using StockMannegment_Dtos.SizeDtos;
using StockMannegment_Dtos.StockDtos;

namespace StockMannegment_UI.Controllers
{
    public class ProductController : Controller
    {
        private readonly IHttpClientFactory _httpClientFactory;
        private readonly IProductRepository _productRepository;
        private readonly IProductPriceRepository _productPriceRepository;
        private readonly IStockEnterRepository _stockEnterRespository;
        private readonly ICategoryRepository _categoryRepository;
        private readonly IGenderRepository _genderRepository;
        private readonly ISizeRepository _sizeRepository;
        private readonly ICostPriceRepository _costPriceRepository;

        public ProductController(IHttpClientFactory httpClientFactory, IProductRepository productRepository, IProductPriceRepository productPriceRepository, IStockEnterRepository stockRespository, ICategoryRepository categoryRepository, IGenderRepository genderRepository, ISizeRepository sizeRepository, ICostPriceRepository costPriceRepository)
        {
            _httpClientFactory = httpClientFactory;
            _productRepository = productRepository;
            _productPriceRepository = productPriceRepository;
            _stockEnterRespository = stockRespository;
            _categoryRepository = categoryRepository;
            _genderRepository = genderRepository;
            _sizeRepository = sizeRepository;
            _costPriceRepository = costPriceRepository;

        }


        [HttpGet]
        public async Task<IActionResult> ProductList()
        {
            var client = _httpClientFactory.CreateClient();
            var responseMessage = await client.GetAsync("https://localhost:44317/api/Products/GetProductList");
            var categoriesResponse = await client.GetAsync("https://localhost:44317/api/Categories/GetCategoryList");

            if (responseMessage.IsSuccessStatusCode)
            {
                var dataJson = await responseMessage.Content.ReadAsStringAsync();
                var result = JsonConvert.DeserializeObject<List<ProductListDto>>(dataJson);
                var categoryJson = await categoriesResponse.Content.ReadAsStringAsync();
                var categoryResult = JsonConvert.DeserializeObject<List<CategoryListDto>>(categoryJson);
                ViewBag.Category = categoryResult;
                return View(result);
            }

            return View();
        }


        [HttpPost]
        public async Task<IActionResult> ProductList(int id)
        {
            var client = _httpClientFactory.CreateClient();
            var responseMessage = await client.GetAsync($"https://localhost:44317/api/Products/GetByIdProduct/{id}");
            var categoriesResponse = await client.GetAsync("https://localhost:44317/api/Categories/GetCategoryList");

            if (responseMessage.IsSuccessStatusCode)
            {
                var dataJson = await responseMessage.Content.ReadAsStringAsync();
                var result = JsonConvert.DeserializeObject<List<ProductListDto>>(dataJson);
                var categoryJson = await categoriesResponse.Content.ReadAsStringAsync();
                var categoryResult = JsonConvert.DeserializeObject<List<CategoryListDto>>(categoryJson);
                ViewBag.Category = categoryResult;
                return PartialView("_ProductTable", result);
            }

            return View();
        }

        [HttpGet]
        public async Task<IActionResult> AddProduct()
        {
            await ProductAddMetod();
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> AddProduct(string productName, int categoryId, int genderId, int sizeId, string description,float warningStock, decimal price,float stock,float costPrice)
        {
            var productDto = new CreateProductDto()
            {
                ProductName = productName,
                CategoryID = categoryId,
                GenderID = genderId,
                SizeID = sizeId,
                Description = description,
                CurrentStock=0,
                WarningQuantity=warningStock

            };

            var result = await _productRepository.AddProductAsync(productDto);


            if (result > 0)
            {
                int productId = await _productRepository.LastProductId();

                var priceDto = new CreateProductPriceDto()
                {
                    Price = price,
                    CurrencyID = 3,
                    ProductID = productId,
                    PriceChancingDate = DateTime.Now,
                };
                await _productPriceRepository.AddProductPrice(priceDto);

                var stockDto = new AddEnterStockDto()
                {
                    ProductID = productId,
                    Stock = stock,
                    UnitID = 1,
                    EnterDate = DateTime.Now,
                };
                await _stockEnterRespository.AddStock(stockDto);

                var costPriceDto = new CreateCostPriceDto()
                {
                    ProductID=productId,
                    CurrencyID=3,
                    CostPrice=costPrice
                };
                await _costPriceRepository.AddCostPrice(costPriceDto);

                await ProductAddMetod();
                TempData["SuccessMessage"] = "Ürün başarıyla eklendi.";
                return View();
            }
            else
            {
                TempData["ErrorMessage"] = "Ürün eklenirken bir hata oluştu.";
                return View();
            }
           
        }

        [HttpGet]
        public async Task<IActionResult> UpdateProduct(int id) 
        {
          
            var result = await _productRepository.GetByIdProduct(id);
            var categories = await _categoryRepository.GetAllCategoryAsync();
            var genders = await _genderRepository.GetAllGenderAsync();
            var sizes = await _sizeRepository.GetAllSizeAsync();
            

            
            int selectedCategoryId = result.CategoryID;
            int selectedSizeId = result.SizeID;
            int selectedGenderId = result.GenderID;

            ViewBag.Category = new SelectList(categories, "ID", "CategoryName", selectedCategoryId);
            ViewBag.Gender = new SelectList(genders, "ID", "GenderName", selectedGenderId);
            ViewBag.Size = new SelectList(sizes, "ID", "SizeName", selectedSizeId);


            return View(result);
        }

        [HttpPost]
        public async Task<IActionResult> UpdateProduct(UpdateProductDto updateProductDto) 
        {
            

            if (!ModelState.IsValid)
            {
                TempData["ErrorMessage"] = "Lütfen açıklama alanını giriniz";
                var result = await _productRepository.GetByIdProduct(updateProductDto.ID);
                var categories = await _categoryRepository.GetAllCategoryAsync();
                var genders = await _genderRepository.GetAllGenderAsync();
                var sizes = await _sizeRepository.GetAllSizeAsync();



                int selectedCategoryId = result.CategoryID;
                int selectedSizeId = result.SizeID;
                int selectedGenderId = result.GenderID;

                ViewBag.Category = new SelectList(categories, "ID", "CategoryName", selectedCategoryId);
                ViewBag.Gender = new SelectList(genders, "ID", "GenderName", selectedGenderId);
                ViewBag.Size = new SelectList(sizes, "ID", "SizeName", selectedSizeId);

                return View(updateProductDto);
               

            }
            else 
            {
               await _productRepository.UpdateProductAsync(updateProductDto);
                return RedirectToAction("ProductList");
            }
            
        }

        public async Task<IActionResult> DeleteProduct(int id) 
        {
            await _productRepository.DeleteProductAsync(id);
            return RedirectToAction("ProductList");

        }

        public async Task ProductAddMetod()
        {

            var client = _httpClientFactory.CreateClient();
            var categoriesResponse = await client.GetAsync("https://localhost:44317/api/Categories/GetCategoryList");
            var GenderResponse = await client.GetAsync("https://localhost:44317/api/Gender/GetGenderList");
            var sizeResponse = await client.GetAsync("https://localhost:44317/api/Size/GetSizeList");

            if (categoriesResponse.IsSuccessStatusCode)
            {

                var categoryJson = await categoriesResponse.Content.ReadAsStringAsync();
                var categoryResult = JsonConvert.DeserializeObject<List<CategoryListDto>>(categoryJson);

                var genderJson = await GenderResponse.Content.ReadAsStringAsync();
                var genderResult = JsonConvert.DeserializeObject<List<GenderListDto>>(genderJson);

                var sizeJson = await sizeResponse.Content.ReadAsStringAsync();
                var sizeResult = JsonConvert.DeserializeObject<List<SizeListDto>>(sizeJson);

                ViewBag.Category = categoryResult;
                ViewBag.Gender = genderResult;
                ViewBag.Size = sizeResult;
                
            }
        }
    }
}
