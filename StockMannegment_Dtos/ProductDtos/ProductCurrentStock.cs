using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StockMannegment_Dtos.ProductDtos
{
    public class ProductCurrentStock
    {
        public int ProductID { get; set; }
        public string ProductName { get; set; }
        public float TotalEnter { get; set; }
        public float TotalExit { get; set; }
        public float CurrentStock { get; set; }
    }
}
