using StockMannegment_Dtos.CategoryDtos;
using StockMannegment_Dtos.ProductDtos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StockMannegment_Business.ProductRepository
{
    public interface IProductRepository
    {
        Task<List<ProductListDto>> GetAllProductAsync();
        Task<List<GetByCategoryIdProductDto>> GetByCategoryIDProductAsync(int categoryId);
        Task<int> AddProductAsync(CreateProductDto product);

        Task<int> LastProductId();

        Task UpdateProductAsync(UpdateProductDto updateProductDto);

        Task<UpdateProductDto> GetByIdProduct(int id);

        Task DeleteProductAsync(int id);
        Task<ProductCurrentStock> CurrentStockProductId(int id);
        Task<List<ProductCurrentStock>> CurrentStockAll();

    }
}
