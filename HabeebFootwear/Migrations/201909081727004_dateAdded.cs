namespace HabeebFootwear.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class dateAdded : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Shoe", "UpdateDate", c => c.DateTime(nullable: false, storeType: "date"));
            AlterColumn("dbo.Employee", "dateOfHiring", c => c.String());
        }
        
        public override void Down()
        {
            AlterColumn("dbo.Employee", "dateOfHiring", c => c.DateTime(storeType: "date"));
            DropColumn("dbo.Shoe", "UpdateDate");
        }
    }
}
