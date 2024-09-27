using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StockMannegment_Dtos.ProductPriceDtos
{
    public class ProductPriceHistoryDto
    {
        public int ProductID { get; set; }
        public string ProductName { get; set; }
        public string CategoryName { get; set; }
        public string GelenStok { get; set; }
        public string ÇıkanStok { get; set; }
        public Decimal AvgSalesPrice { get; set; }
        public Decimal AvgCostPrice { get; set; }
        public Decimal ToplamAlışMaliyeti { get; set; }
        public Decimal ToplamSatışBedeli { get; set; }
        public Decimal ToplamKarZarar { get; set; }
    }
}
