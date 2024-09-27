using Dapper;
using StockMannegment_DataAccess;
using StockMannegment_Dtos.ProductPriceDtos;
using StockMannegment_Dtos.StockMovementDtos;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StockMannegment_Business.ProductPriceRepository
{
    public class ProductPriceRepository : IProductPriceRepository
    {

        private readonly Context _context;

        public ProductPriceRepository(Context context)
        {
            _context = context;
        }
        public async Task AddProductPrice(CreateProductPriceDto productPriceDto)
        {
            string query = "INSERT INTO ProductPrice (Price, ProductID, CurrencyID,PriceChancingDate) VALUES (@price, @lastProductID, @currencyId,@priceChanceDate);";
            var parameters = new DynamicParameters();
            parameters.Add("@price",productPriceDto.Price);
            parameters.Add("@lastProductID", productPriceDto.ProductID);
            parameters.Add("@currencyId", productPriceDto.CurrencyID);
            parameters.Add("@priceChanceDate", productPriceDto.PriceChancingDate);


            using (var connection = _context.CreateConnection())
            {
                await connection.ExecuteAsync(query, parameters);
            }

        }

        public async Task<List<ProductPriceByIdDto>> GetProductPriceByID(int productId)
        {
            string query = @"
                SELECT 
                    CAST(AVG(Price) AS DECIMAL(10,2)) AS Price,  
                pp.ProductID, 
                p.ProductName,        
                pp.CurrencyID, 
                MONTH(pp.PriceChancingDate) AS Month,  
                YEAR(pp.PriceChancingDate) AS Year    
            FROM 
                ProductPrice pp
            JOIN 
                Product p ON pp.ProductID = p.ID 
            WHERE 
                pp.ProductID = @productId
            GROUP BY 
                pp.ProductID, 
                p.ProductName,     
                pp.CurrencyID, 
                MONTH(pp.PriceChancingDate), 
                YEAR(pp.PriceChancingDate)
            ORDER BY 
                Year, Month;

                    ";
            var parameters = new DynamicParameters();
            parameters.Add("@productId", productId);
            using (var connection = _context.CreateConnection())
            {

                var result = await connection.QueryAsync<ProductPriceByIdDto>(query, parameters);
                return result.ToList();
            }

        }

        public async Task<List<ProductPriceHistoryDto>> ProductPriceHistory()
        {
            string procedureName = "GetAllProductSummary";

            using (var connection = _context.CreateConnection())
            {
                var result = await connection.QueryAsync<ProductPriceHistoryDto>(
                    procedureName,
                    commandType: CommandType.StoredProcedure
                );

                return result.ToList();
            }

        }
    }
}
