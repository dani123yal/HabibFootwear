using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using HabeebFootwear.Models;

namespace HabeebFootwear.View_Modals
{
    public class posReciptModel
    {

        public posReciptModel(CustomerOrder order, List<ShoeSizeColor_CustomerOrder> shoes)
        {
            customerOrder = order;
            shoeSizeColor_CustomerOrders = shoes;
        }

        public CustomerOrder customerOrder { get; set; }

        public List<ShoeSizeColor_CustomerOrder> shoeSizeColor_CustomerOrders { get; set; }
    }
}