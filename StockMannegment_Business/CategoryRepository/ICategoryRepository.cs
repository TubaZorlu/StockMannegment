
using StockMannegment_Dtos.CategoryDtos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StockMannegment_Business.CategoryRepository
{
    public interface ICategoryRepository
    {
        Task<List<CategoryListDto>> GetAllCategoryAsync();

        Task AddCategoryAsync(CreateCategoryDto category);
        Task DeleteCategoryAsync(int id);
        Task UpdateCategoryAsync(UpdateCategoryDto updateCategoryDto);
        Task<GetByIdCategoryDto> GetByIdCategoryAsync(int id);
    }
}
