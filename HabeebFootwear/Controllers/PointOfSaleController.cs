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
            ViewBag.PointOfSale = "active";
            
            
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

        public int getPrice(string id)
        {
            int a = Convert.ToInt32( Miscellaneous.HabibDataClass.Habib.Shoes.Where(c => c.shoeArticle.Equals(id)).First().shoePrice);
            return a;
        }

        [HttpGet]
        public string checkout(string[] articles, string[] sizes, string[] colors, string[] quantity, string total)
        {


            Models.CustomerOrder customerOrder = new Models.CustomerOrder()
            {
                customerName = "",
                dateOfOrder = DateTime.Now,

                discount = 0,
                employee_Id = 1,
                finalAmount = int.Parse(total),
                totalAmount = int.Parse(total),
                deleteRemarks = "a"
            };

            Miscellaneous.HabibDataClass.Habib.CustomerOrders.Add(customerOrder);
            Miscellaneous.HabibDataClass.Habib.SaveChanges();

            int id = Miscellaneous.HabibDataClass.Habib.CustomerOrders.ToList().Last().customerOrder_Id;
            List<Models.ShoeSizeColor_CustomerOrder> l = new List<Models.ShoeSizeColor_CustomerOrder>();

            for (int i = 0; i < articles.Length; i++)
            {
                var temp1 = articles[i];
                var temp2 = int.Parse(sizes[i]);
               
                var temp3 = colors[i];
                var temp4 = quantity[i];
                l.Add(new Models.ShoeSizeColor_CustomerOrder()
                {
                    batch_Id = 1,
                    customerOrder_Id = id,
                    price = Miscellaneous.HabibDataClass.Habib.Shoes.Where(c => c.shoeArticle.Equals(temp1)).First().shoePrice,
                    quantity = int.Parse(temp4),
                    shoeSizeColor_Id = Miscellaneous.HabibDataClass.Habib.Shoe_Size_Color.Where(c => c.Shoe_Size.Shoe.shoeArticle.Equals(temp1) && c.Shoe_Size.Size.sizeNo == temp2 && c.Color.colorName.Equals(temp3)).First().shoeSizeColor_Id
                    

                });
            }

            Miscellaneous.HabibDataClass.Habib.ShoeSizeColor_CustomerOrder.AddRange(l);
            Miscellaneous.HabibDataClass.Habib.SaveChanges();

            return "";

        }

    }
}