using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using HabeebFootwear.Models;
using HabeebFootwear.Miscellaneous;
using HabeebFootwear.View_Modals;

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


        public ActionResult CreateOrder()
        {
            
            VendorOrderViewModel vendor_order = new VendorOrderViewModel();
            Shoe s = new Shoe();

               

            vendor_order.shoesList = (from a in habib.Shoes
                                      select a).ToList();

            vendor_order.colorsList = (from a in habib.Colors
                                    select a).ToList();

            vendor_order.sizesList = (from a in habib.Sizes
                                       select a).ToList();

            vendor_order.vendorsList = (from a in habib.Vendors
                                       select a).ToList();
            return View(vendor_order);
        }
    }
}