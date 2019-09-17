using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using HabeebFootwear.Models;
using HabeebFootwear.Miscellaneous;
using HabeebFootwear.View_Modals;
using System.Threading.Tasks;

namespace HabeebFootwear.Controllers
{
    public class TransferController : Controller
    {
        Habib habib = new Habib();
        public static int a = 0;

        // GET: Transfer
        public ActionResult OutletSelect()
        {
            return View();
        }

        public ActionResult CreateTransfer(int id)
        {
            a = 0;
            TransferRecord record = new TransferRecord()
            {
                outlet_Id = id
            };

            ShoesTransferViewModel model = new ShoesTransferViewModel();
            model.transferRecord = record;

            model.shoes = habib.Shoes.ToList();

            ViewBag.transfer = "active";
            ViewBag.orderDisplaya = "block";
            ViewBag.createTransfer = "active";

            return View(model);
        }

        [HttpPost]
        public ActionResult CreateTransfer(ShoesTransferViewModel model,FormCollection form)
        {
            TransferHandler handler = new TransferHandler();
            TransferRecord record = new TransferRecord()
            {
                outlet_Id = model.transferRecord.outlet_Id,
                dateOfTransfer = model.transferRecord.dateOfTransfer
            };
            habib.TransferRecords.Add(record);
            habib.SaveChanges();
            int outletId = Convert.ToInt32(model.transferRecord.outlet_Id);
            record.shoesTransfered = handler.TransferShoes(record.transfer_Id,outletId, model.shoes, model.sizes, model.colors, model.qty);

            habib.SaveChanges();
            

            return View("OutletSelect");
        }

        public async Task<ActionResult> SizeData(string id)
        {
            List<Shoe_Size> shoeSizes = await getData(id);

            return PartialView(shoeSizes);
        }

        public async Task<List<Shoe_Size>> getData(string id)
        {
            return habib.Shoe_Size.Where(c => c.Shoe.shoeArticle == id).ToList();
        }

        public ActionResult ColorData(string article, string size)
        {
            int sizeNo = Convert.ToInt32(size);
            List<Shoe_Size_Color> shoeColor = habib.Shoe_Size_Color.Where(c => c.Shoe_Size.Shoe.shoeArticle == article
            && c.Shoe_Size.Size.sizeNo == sizeNo).ToList();

            return PartialView(shoeColor);
        }


        public JsonResult checkQty(string shoeArticle,int size,string color,int qty) {
            string result = "";
            bool isError = false;

            Shoe_Size_Color shoe = habib.Shoe_Size_Color.Where(c => c.Shoe_Size.Shoe.shoeArticle == shoeArticle
                    && c.Shoe_Size.Size.sizeNo == size && c.Color.colorName == color).First();

            if(shoe.quantityInWH < qty)
            {
                result = "Shoe article: " + shoeArticle + " of size: " + size.ToString() + " and Color:" + color + " has less " +
                    "quantity than you want to transfer.\n";
                isError = true;
            }

            return Json(new { resultString = result, error = isError},JsonRequestBehavior.AllowGet);
        }


        public ActionResult ViewTransfer()
        {
            List<TransferRecord> record = habib.TransferRecords.ToList();
            ViewBag.transfer = "active";
            ViewBag.orderDisplaya = "block";
            ViewBag.viewTransfers = "active";
            return View(record);
        }

        public ActionResult GetTransferDetails(int id)
        {
            List<Transfer_ShoeSizeColor> obj = habib.Transfer_ShoeSizeColor.Where(c => c.transfer_Id == id).ToList();
            return PartialView(obj);
        }

    }
}