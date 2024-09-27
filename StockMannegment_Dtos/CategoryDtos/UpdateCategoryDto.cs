using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StockMannegment_Dtos.CategoryDtos
{
    public class UpdateCategoryDto
    {
        public int ID { get; set; }
        public string CategoryName { get; set; }
        public DateTime CreateDate { get; set; }
        public DateTime UpdateDate { get; set; }
        public DateTime DeleteDate { get; set; }
        public int Status { get; set; }
        public string Description { get; set; }
    }

  

}
