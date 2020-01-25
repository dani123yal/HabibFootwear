using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using WebMatrix.WebData;

namespace HabeebFootwear.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            if (WebSecurity.IsAuthenticated)
            {

                if (Roles.GetRolesForUser(WebSecurity.CurrentUserName)[0].Equals("headOffice"))
                {
                    ViewBag.dashboard = "active";
                    return View();
                }
                else
                {
                    //WebSecurity.Logout();
                    return RedirectToAction("Outlet", "Home");
                }



            }

            else
            {

                return RedirectToAction("Login", "Account");
            }
        }

        public ActionResult Outlet()
        {
            if (WebSecurity.IsAuthenticated)
            {

                if (Roles.GetRolesForUser(WebSecurity.CurrentUserName)[0].Contains("outlet"))
                {
                    ViewBag.dashboard = "active";
                    return View();
                }
                else
                {
                    WebSecurity.Logout();
                    return RedirectToAction("Login", "Account");
                }



            }

            else
            {

                return RedirectToAction("Login", "Account");
            }
        }


        //public ActionResult About()
        //{
        //    ViewBag.Message = "Your application description page.";

        //    return View();
        //}

        //public ActionResult Contact()
        //{
        //    ViewBag.Message = "Your contact page.";

        //    return View();
        //}
    }
}