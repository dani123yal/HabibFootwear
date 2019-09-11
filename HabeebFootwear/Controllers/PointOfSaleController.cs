using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HabeebFootwear.Controllers
{
    public class PointOfSaleController : Controller
    {
        // GET: PointOfSale
        public ActionResult Index()
        {

            
            
            return View(Miscellaneous.HabibDataClass.Habib.Shoes.ToList());
        }
    }
}