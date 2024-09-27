using Dapper;
using StockMannegment_DataAccess;
using StockMannegment_Dtos.PriceCostDtos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StockMannegment_Business.CostPriceRepository
{
    public class CostPriceRepository : ICostPriceRepository
    {
        private readonly Context _context;

        public CostPriceRepository(Context context)
        {
            _context = context;
        }
        public  async Task AddCostPrice(CreateCostPriceDto costPriceDto)
        {
            string query = " insert into ProductCost(CostPrice,ProductID,CurrencyID) values(@costPrice,@productId,@currencyID)";
            var parameters = new DynamicParameters();
            parameters.Add("@costPrice", costPriceDto.CostPrice);
            parameters.Add("@productId", costPriceDto.ProductID);
            parameters.Add("@currencyID", costPriceDto.CurrencyID);
   


            using (var connection = _context.CreateConnection())
            {
                await connection.ExecuteAsync(query, parameters);
            }
        }
    }
}
