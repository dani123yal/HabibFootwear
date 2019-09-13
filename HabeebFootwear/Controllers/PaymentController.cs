using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using HabeebFootwear.Models;

namespace HabeebFootwear.Controllers
{
    public class PaymentController : Controller
    {
        Habib habib = new Habib();
        // GET: Payment
        public ActionResult ViewPayment()
        {
            List<VendorPayment> payments = habib.VendorPayments.ToList();
            return View(payments);
        }
    }
}