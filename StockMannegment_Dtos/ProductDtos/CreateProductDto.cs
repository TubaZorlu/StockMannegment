using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StockMannegment_Dtos.ProductDtos
{
    public class CreateProductDto
    {
        public string ProductName { get; set; }
        public int CategoryID { get; set; }
        public int GenderID { get; set; }
        public int SizeID { get; set; }
        public string Description { get; set; }
        public float CurrentStock { get; set; }
        public float WarningQuantity { get; set; }




    }
}
