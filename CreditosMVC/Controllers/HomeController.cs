using Microsoft.AspNetCore.Mvc;

namespace CreditosMVC.Controllers
{
    public class HomeController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
