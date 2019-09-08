namespace HabeebFootwear.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Shoe")]
    public partial class Shoe
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Shoe()
        {
            Batches = new HashSet<Batch>();
            Shoe_Size = new HashSet<Shoe_Size>();
        }

        [Key]
        public int shoe_Id { get; set; }

        [Required]
        [MaxLength(20)]
        [Index(IsUnique = true)]
       
        public string shoeArticle { get; set; }

        public int? shoeCost { get; set; }

        public int? shoePrice { get; set; }

        public string shoeVariety { get; set; }

        [Column(TypeName = "Date")]
        public DateTime UpdateDate { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Batch> Batches { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Shoe_Size> Shoe_Size { get; set; }
    }
}
