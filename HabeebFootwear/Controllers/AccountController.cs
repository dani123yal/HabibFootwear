using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebMatrix.WebData;
using System.Web.Security;

namespace HabeebFootwear.Controllers
{
    public class AccountController : Controller
    {
        // GET: Account
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Login()
        {
            
            return View();
        }


        [HttpPost]
        public ActionResult Login(FormCollection form)
        {
            string uName = form["UserName"];
            string pass = form["Password"];

            try
            {
                if(WebSecurity.Login(uName, pass))
                {
                    ViewBag.error = Roles.GetRolesForUser(WebSecurity.CurrentUserName);
                    return View();
                }
                else
                {
                    ViewBag.error = "failed";
                }
            }
            catch 
            {
                
                return View();
            }

            return View();
        }
    }
}