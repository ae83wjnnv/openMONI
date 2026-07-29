package nape.dynamics
{
   import flash.Boot;
   import zpp_nape.util.ZPP_Flags;
   
   public final class ArbiterType
   {
      
      public function ArbiterType()
      {
         // method body index: 5532 method index: 5951
         if(Boot.skip_constructor)
         {
            return;
         }
         if(!ZPP_Flags.§internal§)
         {
            Boot.lastError = new Error();
            throw "Error: Cannot instantiate " + "ArbiterType" + " derp!";
         }
      }
      
      public static function get COLLISION() : ArbiterType
      {
         // method body index: 5527 method index: 5954
         if(ZPP_Flags.ArbiterType_COLLISION == null)
         {
            ZPP_Flags.§internal§ = true;
            ZPP_Flags.ArbiterType_COLLISION = new ArbiterType();
            ZPP_Flags.§internal§ = false;
         }
         return ZPP_Flags.ArbiterType_COLLISION;
      }
      
      public static function get SENSOR() : ArbiterType
      {
         // method body index: 5528 method index: 5955
         if(ZPP_Flags.ArbiterType_SENSOR == null)
         {
            ZPP_Flags.§internal§ = true;
            ZPP_Flags.ArbiterType_SENSOR = new ArbiterType();
            ZPP_Flags.§internal§ = false;
         }
         return ZPP_Flags.ArbiterType_SENSOR;
      }
      
      public static function get FLUID() : ArbiterType
      {
         // method body index: 5529 method index: 5956
         if(ZPP_Flags.ArbiterType_FLUID == null)
         {
            ZPP_Flags.§internal§ = true;
            ZPP_Flags.ArbiterType_FLUID = new ArbiterType();
            ZPP_Flags.§internal§ = false;
         }
         return ZPP_Flags.ArbiterType_FLUID;
      }
      
      public function toString() : String
      {
         // method body index: 5531 method index: 5953
         §§push(this);
         if(ZPP_Flags.ArbiterType_COLLISION == null)
         {
            ZPP_Flags.§internal§ = true;
            ZPP_Flags.ArbiterType_COLLISION = new ArbiterType();
            ZPP_Flags.§internal§ = false;
         }
         if(§§pop() == ZPP_Flags.ArbiterType_COLLISION)
         {
            return "COLLISION";
         }
         §§push(this);
         if(ZPP_Flags.ArbiterType_SENSOR == null)
         {
            ZPP_Flags.§internal§ = true;
            ZPP_Flags.ArbiterType_SENSOR = new ArbiterType();
            ZPP_Flags.§internal§ = false;
         }
         if(§§pop() == ZPP_Flags.ArbiterType_SENSOR)
         {
            return "SENSOR";
         }
         §§push(this);
         if(ZPP_Flags.ArbiterType_FLUID == null)
         {
            ZPP_Flags.§internal§ = true;
            ZPP_Flags.ArbiterType_FLUID = new ArbiterType();
            ZPP_Flags.§internal§ = false;
         }
         if(§§pop() == ZPP_Flags.ArbiterType_FLUID)
         {
            return "FLUID";
         }
         return "";
      }
   }
}

