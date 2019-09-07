using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using HabeebFootwear.Models;

namespace HabeebFootwear.View_Modals
{
    public class VendorOrderViewModel
    { 
        public int vovm_Id { get; set; }

        public VendorOrder vendorOrder { get; set; }

        public string selectedVendor { get; set; }

        public List<Shoe> shoesList { get; set; }

        public List<Color> colorsList { get; set; }

        public List<Size> sizesList { get; set; }

        public List<Vendor> vendorsList { get; set; }
    }
}