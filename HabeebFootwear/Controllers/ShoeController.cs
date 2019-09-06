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
            return View();
        }


        public ActionResult shoes()
        {
            try
            {
                var shoe = habib.Shoes.ToList();
                return View(shoe);
            }
            catch
            {
                return View();
            }
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

        public async Task<List<Shoe_Size>> loadShoeSize(int id)
        {
            return habib.Shoes.Find(id).Shoe_Size.ToList();
        }

    }
}