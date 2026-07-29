package nape.shape
{
   import flash.Boot;
   import zpp_nape.util.ZPP_Flags;
   
   public final class ShapeType
   {
      
      public function ShapeType()
      {
         // method body index: 4573 method index: 4939
         if(Boot.skip_constructor)
         {
            return;
         }
         if(!ZPP_Flags.§internal§)
         {
            Boot.lastError = new Error();
            throw "Error: Cannot instantiate " + "ShapeType" + " derp!";
         }
      }
      
      public static function get CIRCLE() : ShapeType
      {
         // method body index: 4569 method index: 4942
         if(ZPP_Flags.ShapeType_CIRCLE == null)
         {
            ZPP_Flags.§internal§ = true;
            ZPP_Flags.ShapeType_CIRCLE = new ShapeType();
            ZPP_Flags.§internal§ = false;
         }
         return ZPP_Flags.ShapeType_CIRCLE;
      }
      
      public static function get POLYGON() : ShapeType
      {
         // method body index: 4570 method index: 4943
         if(ZPP_Flags.ShapeType_POLYGON == null)
         {
            ZPP_Flags.§internal§ = true;
            ZPP_Flags.ShapeType_POLYGON = new ShapeType();
            ZPP_Flags.§internal§ = false;
         }
         return ZPP_Flags.ShapeType_POLYGON;
      }
      
      public function toString() : String
      {
         // method body index: 4572 method index: 4941
         §§push(this);
         if(ZPP_Flags.ShapeType_CIRCLE == null)
         {
            ZPP_Flags.§internal§ = true;
            ZPP_Flags.ShapeType_CIRCLE = new ShapeType();
            ZPP_Flags.§internal§ = false;
         }
         if(§§pop() == ZPP_Flags.ShapeType_CIRCLE)
         {
            return "CIRCLE";
         }
         §§push(this);
         if(ZPP_Flags.ShapeType_POLYGON == null)
         {
            ZPP_Flags.§internal§ = true;
            ZPP_Flags.ShapeType_POLYGON = new ShapeType();
            ZPP_Flags.§internal§ = false;
         }
         if(§§pop() == ZPP_Flags.ShapeType_POLYGON)
         {
            return "POLYGON";
         }
         return "";
      }
   }
}

