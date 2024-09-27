using StockMannegment_Dtos.CategoryDtos;
using StockMannegment_Dtos.GenderDtos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StockMannegment_Business.GenderRepository
{
    public interface IGenderRepository
    {
        Task<List<GenderListDto>> GetAllGenderAsync();
    }
}
