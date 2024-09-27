using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StockMannegment_Dtos.ProductDtos
{
    public class UpdateProductDto
    {
        public int ID { get; set; }
        public string ProductName { get; set; }
        public int CategoryID { get; set; }
        public int Status { get; set; }
        public int SizeID { get; set; }
        public int GenderID { get; set; }
        public DateTime CreateDate { get; set; }
        public DateTime UpdateDate { get; set; }
        public DateTime DeleteDate { get; set; }
        public string Description { get; set; }

        public float WarningQuantity { get; set; }
        public float CurrentStock { get; set; }

    }
}
