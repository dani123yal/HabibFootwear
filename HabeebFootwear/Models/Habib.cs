namespace HabeebFootwear.Models
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class Habib : DbContext
    {
        public Habib()
            : base("name=Habib")
        {
        }

        public virtual DbSet<Batch> Batches { get; set; }
        public virtual DbSet<Color> Colors { get; set; }
        public virtual DbSet<CustomerOrder> CustomerOrders { get; set; }
        public virtual DbSet<CustomrOrder> CustomrOrders { get; set; }
        public virtual DbSet<Employee> Employees { get; set; }
        public virtual DbSet<Outlet> Outlets { get; set; }
        public virtual DbSet<Outlet_ShoeSizeColor> Outlet_ShoeSizeColor { get; set; }
        public virtual DbSet<RemainingPayment> RemainingPayments { get; set; }
        public virtual DbSet<Shoe> Shoes { get; set; }
        public virtual DbSet<Shoe_Size> Shoe_Size { get; set; }
        public virtual DbSet<Shoe_Size_Color> Shoe_Size_Color { get; set; }
        public virtual DbSet<ShoeSizeColor_CustomerOrder> ShoeSizeColor_CustomerOrder { get; set; }
        public virtual DbSet<Size> Sizes { get; set; }
        public virtual DbSet<Transfer_ShoeSizeColor> Transfer_ShoeSizeColor { get; set; }
        public virtual DbSet<TransferRecord> TransferRecords { get; set; }
        public virtual DbSet<User> Users { get; set; }
        public virtual DbSet<Vendor> Vendors { get; set; }
        public virtual DbSet<VendorOrder> VendorOrders { get; set; }
        public virtual DbSet<VendorOrder_ShoeSizeColor> VendorOrder_ShoeSizeColor { get; set; }
        public virtual DbSet<VendorPayment> VendorPayments { get; set; }
        public virtual DbSet<webpages_Membership> webpages_Membership { get; set; }
        public virtual DbSet<webpages_OAuthMembership> webpages_OAuthMembership { get; set; }
        public virtual DbSet<webpages_Roles> webpages_Roles { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<webpages_Roles>()
                .HasMany(e => e.Users)
                .WithMany(e => e.webpages_Roles)
                .Map(m => m.ToTable("webpages_UsersInRoles").MapLeftKey("RoleId").MapRightKey("UserId"));
        }
    }
}
