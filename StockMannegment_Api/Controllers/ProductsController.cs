using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using StockMannegment_Business.ProductRepository;

namespace StockMannegment_Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductsController : ControllerBase
    {
        private readonly IProductRepository _productRepository;

        public ProductsController(IProductRepository productRepository)
        {
            _productRepository = productRepository;
        }

        [HttpGet("GetProductList")]
        public async Task<IActionResult> ProductList() 
        {
          var result= await   _productRepository.GetAllProductAsync();
            return Ok(result);
        }


        [HttpGet("GetByIdProduct/{id}")]
        public async Task<IActionResult> GetByCategoryIdProduct(int id)
        {
            var result = await _productRepository.GetByCategoryIDProductAsync(id);
            return Ok(result);
        }
    }
}
