namespace HabeebFootwear.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Vendor_DeleteStatus_Field_added_1 : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Vendor", "DeleteStatus", c => c.Byte(nullable: false));
        }
        
        public override void Down()
        {
            DropColumn("dbo.Vendor", "DeleteStatus");
        }
    }
}
