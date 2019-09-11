using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using HabeebFootwear.Models;

namespace HabeebFootwear.View_Modals
{
    public class ShoesTransferViewModel
    {
        public TransferRecord transferRecord { get; set; }

        public List<Shoe> shoes { get; set; }

        public List<Size> sizes { get; set; }

        public List<Color> colors { get; set; }

        public List<string> qty { get; set; }
    }
}