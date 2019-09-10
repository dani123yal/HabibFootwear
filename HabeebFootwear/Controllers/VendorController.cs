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

            return View(Vendnor_List);
        }
        public ActionResult Create()
        {
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
        
        [HttpGet]
        public ActionResult CreateOrder()
        {
            
            VendorOrderViewModel vendor_order = new VendorOrderViewModel();

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

        [HttpPost]
        public ActionResult CreateOrder(VendorOrderViewModel model,FormCollection form)
        {
            vendorOrderDataHandler handler = new vendorOrderDataHandler();
            string date = form["dateOfOrder"];

            int vendorId = Convert.ToInt32(form["venID"]);

            int totalAmount = Convert.ToInt32(form["total"]);

            string payMode = form["mode"];

            string paymentMethod = form["payment_method"];

            handler.addNewShoes(model.shoesToAdd,model.shoesCost,model.varieties,Convert.ToDateTime(date));
            handler.addNewSizes(model.sizesToAdd);
            handler.addNewColors(model.colors);
            handler.addShoeSize(model.shoes,model.sizes);
            handler.addShoeSizeColor(model.shoes, model.sizes, model.colors,model.qty);
            

            if(payMode == "1")
            {

                VendorOrder order = new VendorOrder()
                {
                    vendor_Id = vendorId,
                    dateOfOrder = Convert.ToDateTime(date),
                    paymentMode = paymentMethod,
                    paymentStatus = "Paid",
                    totalAmount = totalAmount,
                    amountRemaining = 0,
                    totalQty = handler.getTotalQuantity(model.qty)
                };
                habib.VendorOrders.Add(order);

                handler.addVendorOrderListDetails(order.vendorOrder_Id,model.shoes,model.sizes,model.colors,model.qty);

                handler.addPayment(order.vendorOrder_Id, totalAmount, Convert.ToDateTime(date));
            }

            return RedirectToAction("CreateOrder","Vendor");
        }
    }
}