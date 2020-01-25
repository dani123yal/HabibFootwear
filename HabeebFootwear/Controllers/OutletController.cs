using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using HabeebFootwear.Models;
using WebMatrix.WebData;

namespace HabeebFootwear.Controllers
{
    public class OutletController : Controller
    {
        Models.Habib h = new Habib();

        
        // GET: Outlet
        public ActionResult Index()
        {
            if (Roles.GetRolesForUser(WebSecurity.CurrentUserName)[0].Equals("headOffice"))
            {
                ViewBag.layout = "~/Views/Shared/_Layout.cshtml";
            }
            else
            {
                ViewBag.layout = "~/Views/Shared/_LayoutOutlet.cshtml";
            }
            ViewBag.outlet = "active";
            return View();
        }

       

        public ActionResult Shoes(int id)
        {

            List<Outlet_ShoeSizeColor> shoe_Size_Colors = Miscellaneous.HabibDataClass.Habib.Outlet_ShoeSizeColor.Where(c => c.outlet_Id == id).ToList(); ;
            // List<Shoe> shoes = shoe_Size_Colors.Select(c => c.Shoe_Size.Shoe).ToList();

            if (Roles.GetRolesForUser(WebSecurity.CurrentUserName)[0].Equals("headOffice"))
            {
                ViewBag.layout = "~/Views/Shared/_Layout.cshtml";
            }
            else
            {
                ViewBag.layout = "~/Views/Shared/_LayoutOutlet.cshtml";
            }


            ViewBag.outlet = "active";
            return View(shoe_Size_Colors);
        }

        

        public ActionResult Quantity(string id,int outletid)
        {

            int shoeID = h.Shoes.Where(c => c.shoeArticle.Equals(id)).First().shoe_Id;
           

            List<Shoe_Size> shoeSizes = h.Shoe_Size.Where(c => c.shoe_Id == shoeID).ToList();

            List<Shoe_Size_Color> shoe_Size_Colors = new List<Shoe_Size_Color>();
            
           foreach(Shoe_Size x in shoeSizes)
            {
                shoe_Size_Colors.AddRange(x.Shoe_Size_Color.ToList());
            }

            List<Outlet_ShoeSizeColor> outlet = new List<Outlet_ShoeSizeColor>();

            foreach(Shoe_Size_Color x in shoe_Size_Colors)
            {
                outlet.AddRange(x.Outlet_ShoeSizeColor.ToList());
            }

            outlet = outlet.Where(c => c.outlet_Id == outletid).ToList();
            return PartialView(outlet);
        }


        public ActionResult warehouse()
        {

            List<Shoe_Size_Color> s = Miscellaneous.HabibDataClass.Habib.Shoe_Size_Color.Where(c => c.quantityInWH != 0).ToList();
            if (Roles.GetRolesForUser(WebSecurity.CurrentUserName)[0].Equals("headOffice"))
            {
                ViewBag.layout = "~/Views/Shared/_Layout.cshtml";
            }
            else
            {
                ViewBag.layout = "~/Views/Shared/_LayoutOutlet.cshtml";
            }
            ViewBag.outlet = "active";
            return View(s);
        }

       

        public ActionResult warehouseQuantity(string id)
        {

            List<Shoe_Size_Color> s = Miscellaneous.HabibDataClass.Habib.Shoe_Size_Color.Where(c => c.Shoe_Size.Shoe.shoeArticle.Equals(id)).ToList();

            return View(s);
        }

    }
}