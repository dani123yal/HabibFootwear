using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using HabeebFootwear.View_Modals;
using HabeebFootwear.Models;

namespace HabeebFootwear.Miscellaneous
{
    public class TransferHandler
    {
        // constructor

        public int TransferShoes(int transferId,int outletId,List<Shoe> shoes,List<Size> sizes, List<Color> colors,List<string> qty)
        {
            int totalQty = 0;
            var shoeName="";
            var sizeNo = 0;
            var colorName = "";
            using (Habib habib = new Habib())
            {
                for (int i = 0; i < shoes.Count; i++)
                {
                    shoeName = shoes[i].shoeArticle;
                    sizeNo = Convert.ToInt32(sizes[i].sizeNo);
                    colorName = colors[i].colorName;
                    totalQty += Convert.ToInt32(qty[i]);

                    Shoe_Size_Color obj = habib.Shoe_Size_Color.Where(c => c.Shoe_Size.Shoe.shoeArticle == shoeName
                    && c.Shoe_Size.Size.sizeNo == sizeNo && c.Color.colorName == colorName).First();

                    int count = habib.Outlet_ShoeSizeColor.Where(c => c.Shoe_Size_Color.shoeSizeColor_Id == obj.shoeSizeColor_Id &&
                    c.outlet_Id == outletId).Count();

                    if (count == 0)
                    {
                        Outlet_ShoeSizeColor outletShoe = new Outlet_ShoeSizeColor()
                        {
                            outlet_Id = outletId,
                            shoeSizeColor_Id = obj.shoeSizeColor_Id,
                            quantity = Convert.ToInt32(qty[i])
                        };

                        habib.Outlet_ShoeSizeColor.Add(outletShoe);
                    }
                    else
                    {
                        Outlet_ShoeSizeColor outletShoe = habib.Outlet_ShoeSizeColor.Where(c => c.shoeSizeColor_Id == obj.shoeSizeColor_Id &&
                        c.outlet_Id == outletId).First();

                        outletShoe.quantity += Convert.ToInt32(qty[i]);
                    }

                    obj.quantityInWH -= Convert.ToInt32(qty[i]);

                    Transfer_ShoeSizeColor transfer = new Transfer_ShoeSizeColor()
                    {
                        transfer_Id = transferId,
                        shoeSizeColor_Id = obj.shoeSizeColor_Id,
                        quantity = Convert.ToInt32(qty[i])
                    };

                    habib.Transfer_ShoeSizeColor.Add(transfer);


            }
                habib.SaveChanges();
            }

            return totalQty;
        }
    }
}