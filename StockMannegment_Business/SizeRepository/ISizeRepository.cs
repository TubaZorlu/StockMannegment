using StockMannegment_Dtos.GenderDtos;
using StockMannegment_Dtos.SizeDtos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StockMannegment_Business.SizeRepository
{
    public interface ISizeRepository
    {
        Task<List<SizeListDto>> GetAllSizeAsync();
    }
}
