﻿using System;
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
       // Habib habib = new Habib();

        //use this code for every....
         Habib habib =  HabibDataClass.Habib;
        // GET: Vendor
        public ActionResult Index()
        {
            var Vendnor_List = (from a in habib.Vendors select a).ToList();
            ViewBag.Vendor = "active";
            ViewBag.vlist = "active";
            ViewBag.vlistDisplay = "block";
            return View(Vendnor_List);
        }
        public ActionResult Create()
        {
            ViewBag.vcreate = "active";ViewBag.Vendor = "active";
            ViewBag.vlistDisplay = "block";
            return View();
        }
        public ActionResult Edit(int id)
        {
            Vendor model = (from a in habib.Vendors where a.vendor_Id==id select a).SingleOrDefault();
            return View(model);
        
        }
        [HttpPost][ValidateAntiForgeryToken]
        public ActionResult Create(Vendor model)
        {
            if (ModelState.IsValid)
            {
                model.DeleteStatus = 0;
                habib.Vendors.Add(model);
                habib.SaveChanges();
                return RedirectToAction("Index", "Vendor");
            }
            else
                return View();
        }
        public ActionResult Delete(int id)
        {
            var obj = habib.Vendors.Single(c => c.vendor_Id == id);
            obj.DeleteStatus = 1;
            return RedirectToAction("Index", "Vendor");

        }
        [HttpPost][ValidateAntiForgeryToken]
        public ActionResult EditVendor(Vendor model)
        {
            var obj = habib.Vendors.Single(c=> c.vendor_Id == model.vendor_Id);
            obj.vendorName = model.vendorName;
            obj.vendorCompany = model.vendorCompany;
            obj.vendorContactNo = model.vendorContactNo;
            obj.vendorAddress = model.vendorAddress;

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

        public ActionResult VendorOrderList()
        {
            List<VendorOrder> vo = habib.VendorOrders.ToList();

            return View(vo);
        }

        public ActionResult VendorOrderDetails(int id)
        {
            List<VendorOrder_ShoeSizeColor> vo = habib.VendorOrder_ShoeSizeColor.Where(c => c.vendorOrder_Id == id).ToList();

            return View(vo);
        }

    }
}