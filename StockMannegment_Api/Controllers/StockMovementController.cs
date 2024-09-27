using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using StockMannegment_Business.StockMovementRepository;

namespace StockMannegment_Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class StockMovementController : ControllerBase
    {
        private readonly IStockMovementRepository _stockMovementRepository;

        public StockMovementController(IStockMovementRepository stockMovementRepository)
        {
            _stockMovementRepository = stockMovementRepository;
        }

        [HttpGet("GetStockMovementList")]
        public async Task<IActionResult> CategoryList()
        {
            var result = await _stockMovementRepository.GetAllStockMovementAsync();
            return Ok(result);
        }
    }
}
