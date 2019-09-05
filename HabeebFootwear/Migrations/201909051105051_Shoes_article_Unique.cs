namespace HabeebFootwear.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Shoes_article_Unique : DbMigration
    {
        public override void Up()
        {
            AlterColumn("dbo.Shoe", "shoeArticle", c => c.String(nullable: false, maxLength: 20));
            CreateIndex("dbo.Shoe", "shoeArticle", unique: true);
        }
        
        public override void Down()
        {
            DropIndex("dbo.Shoe", new[] { "shoeArticle" });
            AlterColumn("dbo.Shoe", "shoeArticle", c => c.String(nullable: false));
        }
    }
}
