using Dapper;
using StockMannegment_DataAccess;
using StockMannegment_Dtos.SizeDtos;
using StockMannegment_Dtos.StockDtos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StockMannegment_Business.StockRepository
{
    public class StockEnterRepository : IStockEnterRepository
    {

        private readonly Context _context;

        public StockEnterRepository(Context context)
        {
            _context = context;
        }
        public async Task AddStock(AddEnterStockDto stockDto)
        {
            string query = "INSERT INTO Stock_Enter (Stock, ProductID, UnitID,EnterDate) VALUES (@stock, @lastProductID, @unitId,@enterDate);";
            var parameters = new DynamicParameters();
            parameters.Add("@stock", stockDto.Stock);
            parameters.Add("@lastProductID", stockDto.ProductID);
            parameters.Add("@unitId", stockDto.UnitID);
            parameters.Add("@enterDate", stockDto.EnterDate);


            using (var connection = _context.CreateConnection())
            {
                await connection.ExecuteAsync(query, parameters);
            }
        }

        public async Task DeleteStock(DeleteStockDto stockDto)
        {
            string query = "INSERT INTO Stock_Exit (Stock, ProductID, UnitID,ExitDate) VALUES (@stock, @lastProductID, @unitId,@exitDate);";
            var parameters = new DynamicParameters();
            parameters.Add("@stock", stockDto.Stock);
            parameters.Add("@lastProductID", stockDto.ProductID);
            parameters.Add("@unitId", stockDto.UnitID);
            parameters.Add("@exitDate", stockDto.ExitDate);


            using (var connection = _context.CreateConnection())
            {
                await connection.ExecuteAsync(query, parameters);
            }
        }

        public async Task<List<StockListDto>> GetAllStocksAsync()
        {
            string query = "select*from Stock_Enter";

            using (var connection = _context.CreateConnection())
            {
                var result = await connection.QueryAsync<StockListDto>(query);
                return result.ToList();
            }
        }
    }
}
