using StockMannegment_Dtos.CategoryDtos;
using StockMannegment_Dtos.ProductPriceDtos;
using StockMannegment_Dtos.StockMovementDtos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StockMannegment_Business.ProductPriceRepository
{
    public interface IProductPriceRepository
    {


        Task AddProductPrice(CreateProductPriceDto productPriceDto);

        Task<List<ProductPriceByIdDto>> GetProductPriceByID(int productId);
        Task<List<ProductPriceHistoryDto>> ProductPriceHistory();


    }
}
