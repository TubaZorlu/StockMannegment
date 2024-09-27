using Microsoft.AspNetCore.Mvc;

namespace StockMannegment_UI.Controllers
{
    public class Default : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
