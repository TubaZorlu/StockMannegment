using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StockMannegment_Dtos.StockDtos
{
    public class GetByProductIdStock
    {
        public int ID { get; set; }
        public float Stock { get; set; }
        public int ProductID { get; set; }
        public int UnitID { get; set; }
        public DateTime EnterDate { get; set; }
    }
}
