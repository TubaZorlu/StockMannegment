using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StockMannegment_Dtos.StockMovementDtos
{
    public class MontlyCategoryMovementDto
    {
        public int CategoryId { get; set; }
        public string CategoryName { get; set; }
        public int Month { get; set; }
        public int Year { get; set; }
        public float TotalExit { get; set; }
    }
}
