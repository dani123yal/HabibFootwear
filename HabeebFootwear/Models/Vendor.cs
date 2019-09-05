namespace HabeebFootwear.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Vendor")]
    public partial class Vendor
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Vendor()
        {
            VendorOrders = new HashSet<VendorOrder>();
            VendorOrder_ShoeSizeColor = new HashSet<VendorOrder_ShoeSizeColor>();
        }

        [Key]
        public int vendor_Id { get; set; }

        [Required(ErrorMessage = "Please Enter Vendor Name")]
        public string vendorName { get; set; }

        public string vendorCompany { get; set; }

        [Required(ErrorMessage = "Contact is required.")]
        [RegularExpression(@"^\(?([0-9]{4})\)?[-. ]?([0-9]{7})$", ErrorMessage = "Invalid Contact number use this e.g: xxxx-xxxxxxx")]
        public string vendorContactNo { get; set; }

        public string vendorAddress { get; set; }
        public byte DeleteStatus { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<VendorOrder> VendorOrders { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<VendorOrder_ShoeSizeColor> VendorOrder_ShoeSizeColor { get; set; }
    }
}
