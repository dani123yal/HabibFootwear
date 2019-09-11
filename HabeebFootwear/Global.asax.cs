using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using WebMatrix.WebData;

namespace HabeebFootwear
{
    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
            InitializeAuthenticationProcess();
            //WebSecurity.CreateUserAndAccount("outlet_1","12345");
            //Roles.AddUserToRole("outlet_1", "outlet");
            //WebSecurity.CreateUserAndAccount("headoffice", "12345");
            //Roles.AddUserToRole("headoffice", "headOffice");
        }

        private void InitializeAuthenticationProcess()
        {
            if (!WebSecurity.Initialized)
            {
                WebSecurity.InitializeDatabaseConnection("Habib", "Users", "UserId", "UserName", true);


                if (!Roles.RoleExists("headOffice"))
                {
                    Roles.CreateRole("headOffice");
                }
                if (!Roles.RoleExists("outlet"))
                {
                    Roles.CreateRole("outlet");
                }
            }
        }
    }
}
