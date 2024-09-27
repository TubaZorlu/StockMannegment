using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StockMannegment_Dtos.ProductPriceDtos
{
    public class ProductPriceByIdDto
    {
        public int Month { get; set; }
        public int Year { get; set; }
        public decimal Price { get; set; }
        public int ProductID { get; set; }
        public string ProductName { get; set; }
        public int CurrencyID { get; set; }
        public DateTime PriceChancingDate { get; set; }
    }
}
