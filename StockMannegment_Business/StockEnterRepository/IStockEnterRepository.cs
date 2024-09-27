using StockMannegment_Dtos.CategoryDtos;
using StockMannegment_Dtos.ProductPriceDtos;
using StockMannegment_Dtos.SizeDtos;
using StockMannegment_Dtos.StockDtos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StockMannegment_Business.StockRepository
{
    public interface IStockEnterRepository
    {
        Task AddStock(AddEnterStockDto stockDto);
        Task DeleteStock(DeleteStockDto stockDto);
        Task<List<StockListDto>> GetAllStocksAsync();

    }
}
