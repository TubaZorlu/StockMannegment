using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StockMannegment_Dtos.PriceCostDtos
{
    public class CreateCostPriceDto
    {
        public int ProductID { get; set; }
        public int CurrencyID { get; set; }
        public float CostPrice { get; set; }
   
    }
}
