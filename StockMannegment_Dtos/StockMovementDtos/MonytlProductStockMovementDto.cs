using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StockMannegment_Dtos.StockMovementDtos
{
    public class MonytlProductStockMovementDto
    {
        public int ProductID { get; set; }
        public string ProductName { get; set; }
        public int Month { get; set; }
        public int Year { get; set; }
        public float TotalExit { get; set; }
    }
}
