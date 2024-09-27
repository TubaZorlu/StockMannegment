using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StockMannegment_Dtos.ProductDtos
{
    public class GetByCategoryIdProductDto
    {
        public int ID { get; set; }
        public string ProductName { get; set; }
        public DateTime CreateDate { get; set; }
        public DateTime UpdateDate { get; set; }
        public DateTime DeleteDate { get; set; }
        public int Status { get; set; }
        public string Description { get; set; }
        public string CategoryName { get; set; }
        public Decimal Price { get; set; }
        public string ShortName { get; set; }
        public float CurrentStock { get; set; }
        public float WarningQuantity { get; set; }
        public string Size { get; set; }
        public int CategoryId { get; set; }
    

    }
}
