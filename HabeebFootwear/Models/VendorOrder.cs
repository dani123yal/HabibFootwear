namespace HabeebFootwear.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("VendorOrder")]
    public partial class VendorOrder
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public VendorOrder()
        {
            VendorPayments = new HashSet<VendorPayment>();
        }

        [Key]
        public int vendorOrder_Id { get; set; }

        [Column(TypeName = "date")]
        public DateTime? dateOfOrder { get; set; }

        public int? totalAmount { get; set; }

        public int? amountRemaining { get; set; }

        public int? totalQty { get; set; }

        public int? vendor_Id { get; set; }

        public string paymentStatus { get; set; }

        public string paymentMode { get; set; }

        public virtual Vendor Vendor { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<VendorPayment> VendorPayments { get; set; }
    }
}
