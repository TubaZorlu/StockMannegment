using StockMannegment_Dtos.PriceCostDtos;
using StockMannegment_Dtos.StockDtos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StockMannegment_Business.CostPriceRepository
{
    public interface ICostPriceRepository
    {
        Task AddCostPrice(CreateCostPriceDto costPriceDto);
    }
}
