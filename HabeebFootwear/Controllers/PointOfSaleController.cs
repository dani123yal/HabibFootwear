using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HabeebFootwear.Controllers
{
    public class PointOfSaleController : Controller
    {
        // GET: PointOfSale
        public ActionResult Index()
        {

            
            
            return View(Miscellaneous.HabibDataClass.Habib.Shoes.ToList());
        }

        public string getSizes(string id)
        {
            string result = "";

            List<Models.Shoe_Size> sizes = Miscellaneous.HabibDataClass.Habib.Shoe_Size.Where(c => c.Shoe.shoeArticle == id).ToList();

            foreach(Models.Shoe_Size x in sizes)
            {
                result += "<option>" + x.Size.sizeNo + "</option>";
            }

            return result;
        }

        public string getColors(string id,int sizeno)
        {
            string result = "";

            List<Models.Shoe_Size_Color> sizes = Miscellaneous.HabibDataClass.Habib.Shoe_Size_Color.Where(c => c.Shoe_Size.Shoe.shoeArticle.Equals(id) && c.Shoe_Size.Size.sizeNo == sizeno).ToList();

            foreach (Models.Shoe_Size_Color x in sizes)
            {
                result += "<option>" + x.Color.colorName + "</option>";
            }

            return result;
        }
    }
}