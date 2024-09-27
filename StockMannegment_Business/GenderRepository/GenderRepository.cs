using Dapper;
using StockMannegment_DataAccess;
using StockMannegment_Dtos.CategoryDtos;
using StockMannegment_Dtos.GenderDtos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StockMannegment_Business.GenderRepository
{
    public class GenderRepository : IGenderRepository
    {
        private readonly Context _context;

        public GenderRepository(Context context)
        {
            _context = context;
        }

        public async Task<List<GenderListDto>> GetAllGenderAsync()
        {
            string query = "select*from Gender";
            using (var connection = _context.CreateConnection())
            {
                var result = await connection.QueryAsync<GenderListDto>(query);
                return result.ToList();
            }
        }
    }
}
