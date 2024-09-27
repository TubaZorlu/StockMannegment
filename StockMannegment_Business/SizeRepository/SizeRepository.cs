using Dapper;
using StockMannegment_DataAccess;
using StockMannegment_Dtos.GenderDtos;
using StockMannegment_Dtos.SizeDtos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StockMannegment_Business.SizeRepository
{
    public class SizeRepository : ISizeRepository
    {

        private readonly Context _context;

        public SizeRepository(Context context)
        {
            _context = context;
        }

       
        public async Task<List<SizeListDto>> GetAllSizeAsync()
        {
            string query = "select*from Size";
            using (var connection = _context.CreateConnection())
            {
                var result = await connection.QueryAsync<SizeListDto>(query);
                return result.ToList();
            }
        }
    }
}
