namespace HabeebFootwear.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class VendorOrder_ShoeSizeColor
    {
        [Key]
        public int vendorOrderShoeSizeColor_Id { get; set; }

        public int? vendor_Id { get; set; }

        public int? shoeSizeColor_Id { get; set; }

        public int? quantity { get; set; }

        public int? cost { get; set; }

        public virtual Shoe_Size_Color Shoe_Size_Color { get; set; }

        public virtual Vendor Vendor { get; set; }
    }
}
