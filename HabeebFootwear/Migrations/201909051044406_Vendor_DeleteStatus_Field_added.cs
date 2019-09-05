namespace HabeebFootwear.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Vendor_DeleteStatus_Field_added : DbMigration
    {
        public override void Up()
        {
            DropColumn("dbo.Vendor", "DeleteStatus");
        }
        
        public override void Down()
        {
            AddColumn("dbo.Vendor", "DeleteStatus", c => c.Byte(nullable: false));
        }
    }
}
