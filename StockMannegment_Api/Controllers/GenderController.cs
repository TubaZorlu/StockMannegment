using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using StockMannegment_Business.GenderRepository;

namespace StockMannegment_Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class GenderController : ControllerBase
    {
        private readonly IGenderRepository _genderRepository;

        public GenderController(IGenderRepository genderRepository)
        {
            _genderRepository = genderRepository;
        }

        [HttpGet("GetGenderList")]
        public async Task<IActionResult> GenderList()
        {
            var result = await _genderRepository.GetAllGenderAsync();
            return Ok(result);
        }
    }
}
