using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using StockMannegment_Business.CategoryRepository;
using StockMannegment_Dtos.CategoryDtos;

namespace StockMannegment_Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CategoriesController : ControllerBase
    {
        private readonly ICategoryRepository _categoryRepository;

        public CategoriesController(ICategoryRepository categoryRepository)
        {
            _categoryRepository = categoryRepository;
        }

      
        [HttpGet("GetCategoryList")]
        public async Task<IActionResult> CategoryList()
        {
            var result = await _categoryRepository.GetAllCategoryAsync();
            return Ok(result);
        }

    
        [HttpPost("CreateCategory")]
        public async Task<IActionResult> CreateCategory(CreateCategoryDto createCategoryDto)
        {
            await _categoryRepository.AddCategoryAsync(createCategoryDto);
            return Ok("Kategori başarılı bir şekilde eklendi");
        }

      
        [HttpDelete("DeleteCategory/{id}")]
        public async Task<IActionResult> DeleteCategory(int id)
        {
            await _categoryRepository.DeleteCategoryAsync(id);
            return Ok("Silme İşlemi Başarılı");
        }

       
        [HttpPut("UpdateCategory")]
        public async Task<IActionResult> UpdateCategory(UpdateCategoryDto updateCategory)
        {
            await _categoryRepository.UpdateCategoryAsync(updateCategory);
            return Ok("Güncelleme işlemi başarılı");
        }

       
        [HttpGet("GetByIdCategory/{id}")]
        public async Task<IActionResult> GetByIdCategory(int id)
        {
            var result = await _categoryRepository.GetByIdCategoryAsync(id);
            return Ok(result);
        }
    }
}
