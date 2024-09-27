using Dapper;
using StockMannegment_DataAccess;
using StockMannegment_Dtos.CategoryDtos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StockMannegment_Business.CategoryRepository
{
    public class CategoryRepository : ICategoryRepository
    {
        private readonly Context _context;

        public CategoryRepository(Context context)
        {
            _context = context;
        }

        public async Task AddCategoryAsync(CreateCategoryDto category)
        {
            string query = "insert into Category(CategoryName,GenderID,CreateDate,UpdateDate,DeleteDate,Status,Description) values(@categoryName,@createDate,@updateDate,@deleteDate,@status,@description)";
            var parameters = new DynamicParameters();
            parameters.Add("@categoryName", category.CategoryName);           
            parameters.Add("@createDate", DateTime.Now);
            parameters.Add("@updateDate", null);
            parameters.Add("@deleteDate", null);
            parameters.Add("@status", 1);
            parameters.Add("@description", category.Description);

           
            using (var connection = _context.CreateConnection()) 
            {
                await connection.ExecuteAsync(query, parameters);
            }

        }

        public async Task DeleteCategoryAsync(int id)
        {
            string query = "   update Category  Set Status=0, DeleteDate=GETDATE() Where ID=@id";
            var parameters = new DynamicParameters();
            parameters.Add("@id", id);
           
            using (var connection = _context.CreateConnection()) 
            {
                await connection.ExecuteAsync(query, parameters);
            }

        }

        public async Task<List<CategoryListDto>> GetAllCategoryAsync()
        {
            string query = "select*from Category";
            using (var connection = _context.CreateConnection()) 
            {
                var result=await connection.QueryAsync<CategoryListDto>(query);
                return result.ToList();
            }
            
        }

        public async Task<GetByIdCategoryDto> GetByIdCategoryAsync(int id)
        {
            string query= "select*from Category Where ID=@id";
            var parameters = new DynamicParameters();
            parameters.Add("@id", id);
            using (var connection = _context.CreateConnection()) 
            {
                var values = await connection.QueryFirstOrDefaultAsync <GetByIdCategoryDto > (query, parameters);
                return values;
            }
        }

        public async Task UpdateCategoryAsync(UpdateCategoryDto updateCategoryDto)
        {
            string query = "update Category  Set CategoryName=@categoryName,  Status=@status, Description=@description, UpdateDate=GETDATE()  Where ID=@id";
            var parameters= new DynamicParameters();
            parameters.Add("@categoryName", updateCategoryDto.CategoryName);
            parameters.Add("@status", updateCategoryDto.Status);
            parameters.Add("@description", updateCategoryDto.Description);
            parameters.Add("@id", updateCategoryDto.ID);

            using (var connection = _context.CreateConnection()) 
            {
                var result = await connection.ExecuteAsync(query, parameters);
            }
        }
    }
}
