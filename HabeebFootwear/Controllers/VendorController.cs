using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using HabeebFootwear.Models;

namespace HabeebFootwear.Controllers
{
    public class VendorController : Controller
    {
        Habib habib = new Habib();
        // GET: Vendor
        public ActionResult Index()
        {
            var Vendnor_List = (from a in habib.Vendors select a).ToList();

            return View(Vendnor_List);
        }
        public ActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public ActionResult CreateVendor(Vendor model)
        {
            habib.Vendors.Add(model);
            habib.SaveChanges();
            return RedirectToAction("Index", "Vendor");
        }
    }
}