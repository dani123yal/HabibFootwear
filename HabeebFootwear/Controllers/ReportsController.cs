using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using HabeebFootwear.Models;

namespace HabeebFootwear.Controllers
{
    public class ReportsController : Controller
    {
        Habib habib = new Habib();
        // GET: Reports
        public ActionResult Index()
        {
            //List<ShoeSizeColor_CustomerOrder> shoes = habib.ShoeSizeColor_CustomerOrder.OrderByDescending(x => x.Shoe_Size_Color).Take(3).ToList();


            return View(habib);
        }
    }
}