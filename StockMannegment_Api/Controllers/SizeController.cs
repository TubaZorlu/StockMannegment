using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using StockMannegment_Business.SizeRepository;

namespace StockMannegment_Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SizeController : ControllerBase
    {
        private readonly ISizeRepository _sizeRepository;

        public SizeController(ISizeRepository sizeRepository)
        {
            _sizeRepository = sizeRepository;
        }
        [HttpGet("GetSizeList")]
        public async Task<IActionResult> SizeList()
        {
            var result = await _sizeRepository.GetAllSizeAsync();
            return Ok(result);
        }

    }
}
