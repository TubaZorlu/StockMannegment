using StockMannegment_Dtos.StockMovementDtos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StockMannegment_Business.StockMovementRepository
{
    public interface IStockMovementRepository
    {
        Task<List<AllStockMovementDto>> GetAllStockMovementAsync();
        Task<List<MonytlProductStockMovementDto>> GetMontlyProductStockMovement(int productId);
        Task<List<MontlyCategoryMovementDto>> GetMontlyCategoryStockMovement(int categoryId);
        Task<List<AllStockMovementDto>> FilterByDateRangeStockMovementAsync(DateTime dateStart, DateTime dateEnd);
    }
}
