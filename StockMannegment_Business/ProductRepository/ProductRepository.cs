using Dapper;
using StockMannegment_DataAccess;
using StockMannegment_Dtos.CategoryDtos;
using StockMannegment_Dtos.ProductDtos;
using StockMannegment_Dtos.ProductPriceDtos;
using StockMannegment_Dtos.StockMovementDtos;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Reflection.Metadata;
using System.Text;
using System.Threading.Tasks;

namespace StockMannegment_Business.ProductRepository
{
    public class ProductRepository : IProductRepository
    {
        private readonly Context _context;

        public ProductRepository(Context context)
        {
            _context = context;
        }

        public async Task<int>  AddProductAsync(CreateProductDto product)
        {
            string query = "insert into Product   ProductName,CategoryID, Status,  CreateDate,UpdateDate,DeleteDate, SizeID,GenderID, Description,  CurrentStock,WarningQuantity) Values(@productName,@categoryId,@status,@createDate,@updateDate,@deleteDate,@sizeId,@genderId,@description,@currentStock,@warningQuantity)";
            var parameters = new DynamicParameters();
            parameters.Add("@productName", product.ProductName);
            parameters.Add("@categoryId", product.CategoryID);
            parameters.Add("@genderId", product.GenderID);
            parameters.Add("@sizeId", product.SizeID);
            parameters.Add("@createDate", DateTime.Now);
            parameters.Add("@updateDate", null);
            parameters.Add("@deleteDate", null);
            parameters.Add("@status", 1);
            parameters.Add("@description", product.Description);
            parameters.Add("@currentStock", product.CurrentStock);
            parameters.Add("@warningQuantity", product.WarningQuantity);

            foreach (var parameter in parameters.ParameterNames)
            {
                Console.WriteLine($"{parameter} : {parameters.Get<dynamic>(parameter)}");
            }
            using (var connection = _context.CreateConnection())
            {
               int rowsAffected= await connection.ExecuteAsync(query, parameters);
                return rowsAffected;
            }

            
        }

        public async Task<List<ProductCurrentStock>> CurrentStockAll()
        {
            string procedureName = "GetProductStockAll";


            using (var connection = _context.CreateConnection())
            {
                var result = await connection.QueryAsync<ProductCurrentStock>(
                    procedureName,
                    commandType: CommandType.StoredProcedure
                );

                return result.ToList();
            }
        }

        public async Task<ProductCurrentStock> CurrentStockProductId(int id)
        {
            string procedureName = "GetProductStockAll_ProductId";

            var parameters = new DynamicParameters();
            parameters.Add("@productID",id );

            using (var connection = _context.CreateConnection())
            {
                var result = await connection.QueryFirstOrDefaultAsync<ProductCurrentStock>(
                    procedureName,parameters,
                    commandType: CommandType.StoredProcedure
                );

                return result;
            }
        }

        public async Task DeleteProductAsync(int id)
        {
            string query = "   update Product  Set Status=0, DeleteDate=GETDATE() Where ID=@id";
            var parameters = new DynamicParameters();
            parameters.Add("@id", id);

            using (var connection = _context.CreateConnection())
            {
                await connection.ExecuteAsync(query, parameters);
            }
        }

        public async Task<List<ProductListDto>> GetAllProductAsync()
        {
            string procedureName = "GEtAllProductsWithPrice";

            using (var connection = _context.CreateConnection())
            {
                var result = await connection.QueryAsync<ProductListDto>(
                    procedureName,
                    commandType: CommandType.StoredProcedure
                );

                return result.ToList();
            }


          
        }

        public async Task<List<GetByCategoryIdProductDto>> GetByCategoryIDProductAsync(int categoryId)
        {
            string procedureName = "GetLatestProductPricesByCategory";

            var parameters = new DynamicParameters();
            parameters.Add("@CategoryID", categoryId);
            using (var connection = _context.CreateConnection())
            {
                var result = await connection.QueryAsync<GetByCategoryIdProductDto>(
                     procedureName, parameters,
                     commandType: CommandType.StoredProcedure
                 );

                return result.ToList();
            }
        }

        public async Task<UpdateProductDto> GetByIdProduct(int id)
        {
            string query = "select*from Product Where ID=@id";
            var parameters = new DynamicParameters();
            parameters.Add("@id", id);
            using (var connection = _context.CreateConnection())
            {
                var values = await connection.QueryFirstOrDefaultAsync<UpdateProductDto>(query, parameters);
                return values;
            }
        }

        public async Task<int> LastProductId()
        {
            string query = "SELECT TOP 1  ID FROM Product ORDER BY ID DESC;";
            using (var connection = _context.CreateConnection()) 
            {
                var result = await connection.QueryFirstOrDefaultAsync<int>(query);
                return result;
            }
        }

        public async Task UpdateProductAsync(UpdateProductDto updateProductDto)
        {
            string query = "UPDATE Product " +
                "SET ProductName = @productName, " +
                "CategoryID = @categoryId, " +
                "Status = @status, " +
                "UpdateDate = GETDATE(), " +
                "CurrentStock = @currentStock, " +
                "Description = @description, " +
                "SizeID = @sizeId, " +
                "GenderID = @genderId, " +
                "WarningQuantity = @warningQuantity " + // Son parametre olduğundan virgül yok
                "WHERE ID = @id;";



            var parameters = new DynamicParameters();
            parameters.Add("@productName", updateProductDto.ProductName);
            parameters.Add("@categoryId", updateProductDto.CategoryID);
            parameters.Add("@status", updateProductDto.Status);
            parameters.Add("@description", updateProductDto.Description);
            parameters.Add("@sizeId", updateProductDto.SizeID);
            parameters.Add("@genderId", updateProductDto.GenderID);
            parameters.Add("@warningQuantity", updateProductDto.WarningQuantity);
            parameters.Add("@id", updateProductDto.ID);
            parameters.Add("@currentStock", updateProductDto.CurrentStock);

            using (var connection = _context.CreateConnection())
            {
                var result = await connection.ExecuteAsync(query, parameters);
            }

        }
    }
}
