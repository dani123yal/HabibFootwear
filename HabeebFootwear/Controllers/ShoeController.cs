using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using HabeebFootwear.Models;
namespace HabeebFootwear.Controllers
{
    public class ShoeController : Controller
    {
        Habib habib = new Habib();

        public static List<Shoe_Size> shoe_Sizes;
        // GET: Shoe
        public async Task<ActionResult> Index()
        {
            ViewBag.shoe = "active";
            return View();
        }


        public ActionResult shoes()
        {
            ViewBag.shoe = "active";
            var shoe = habib.Shoes.ToList();
                return View(shoe);
            
           
        }

        
        [HttpGet]
        public async Task<ActionResult> Details(int id)
        {
            
                Shoe shoe = new Shoe();
                shoe = habib.Shoes.Find(id);



            ViewBag.shoeSizes = habib.Shoes.Find(id).Shoe_Size.ToList();
            shoe_Sizes = await loadShoeSize(id);
            Session["shoe"] = shoe;

          return  PartialView("Details");




        }

        public async Task<ActionResult> Colors(int id)
        {
            List<Shoe_Size_Color> shoe_Size_Color = await loadShoeSizeColor(id);


            return PartialView("Colors",shoe_Size_Color);
        }

        public async Task<List<Shoe_Size>> loadShoeSize(int id)
        {
            return habib.Shoes.Find(id).Shoe_Size.ToList();
        }

        public async Task<List<Shoe_Size_Color>> loadShoeSizeColor(int shoeSizeID)
        {
            return habib.Shoe_Size.Find(shoeSizeID).Shoe_Size_Color.ToList();
        }

        public async Task<ActionResult> Quantity(int id)
        {
            Shoe_Size_Color shoe_Size_Color = await loadShoeSizeColorQuantity(id);


            return PartialView("Quantity", shoe_Size_Color);
        }

        public async Task<Shoe_Size_Color> loadShoeSizeColorQuantity(int shoeSizeColorID)
        {
            return habib.Shoe_Size_Color.Find(shoeSizeColorID);
        }

        public ActionResult edit(int id)
        {
            Shoe shoe = Miscellaneous.HabibDataClass.Habib.Shoes.Where(c => c.shoe_Id == id).First();
            return View(shoe);

        }

        [HttpPost]
        public ActionResult edit(Shoe model)
        {

            Shoe s= Miscellaneous.HabibDataClass.Habib.Shoes.Single(c => c.shoe_Id == model.shoe_Id);
            s.shoeArticle = model.shoeArticle;
            s.shoePrice = model.shoePrice;
            s.shoeVariety = model.shoeVariety;

            Miscellaneous.HabibDataClass.Habib.SaveChanges();

            return RedirectToAction("Shoes");

        }

    }
}