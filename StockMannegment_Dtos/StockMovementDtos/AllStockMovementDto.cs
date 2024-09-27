using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StockMannegment_Dtos.StockMovementDtos
{
    public class AllStockMovementDto
    {
   
        public int ProductId { get; set; }
        public string ProductName { get; set; }

        public string UnitName { get; set; }
        public string Size { get; set; }
        public string CategoryName { get; set; }
        public int CategoryId { get; set; }
        public float TotalEntryQuantity { get; set; }
        public float CurrentStock { get; set; }
        public float WarningQuantity { get; set; }
        public DateTime LastEntryDate { get; set; }

        public int Status { get; set; }


    }
}
