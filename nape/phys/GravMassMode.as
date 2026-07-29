package nape.phys
{
   import flash.Boot;
   import zpp_nape.util.ZPP_Flags;
   
   public final class GravMassMode
   {
      
      public function GravMassMode()
      {
         // method body index: 4162 method index: 4488
         if(Boot.skip_constructor)
         {
            return;
         }
         if(!ZPP_Flags.§internal§)
         {
            Boot.lastError = new Error();
            throw "Error: Cannot instantiate " + "GravMassMode" + " derp!";
         }
      }
      
      public static function get DEFAULT() : GravMassMode
      {
         // method body index: 4157 method index: 4491
         if(ZPP_Flags.GravMassMode_DEFAULT == null)
         {
            ZPP_Flags.§internal§ = true;
            ZPP_Flags.GravMassMode_DEFAULT = new GravMassMode();
            ZPP_Flags.§internal§ = false;
         }
         return ZPP_Flags.GravMassMode_DEFAULT;
      }
      
      public static function get FIXED() : GravMassMode
      {
         // method body index: 4158 method index: 4492
         if(ZPP_Flags.GravMassMode_FIXED == null)
         {
            ZPP_Flags.§internal§ = true;
            ZPP_Flags.GravMassMode_FIXED = new GravMassMode();
            ZPP_Flags.§internal§ = false;
         }
         return ZPP_Flags.GravMassMode_FIXED;
      }
      
      public static function get SCALED() : GravMassMode
      {
         // method body index: 4159 method index: 4493
         if(ZPP_Flags.GravMassMode_SCALED == null)
         {
            ZPP_Flags.§internal§ = true;
            ZPP_Flags.GravMassMode_SCALED = new GravMassMode();
            ZPP_Flags.§internal§ = false;
         }
         return ZPP_Flags.GravMassMode_SCALED;
      }
      
      public function toString() : String
      {
         // method body index: 4161 method index: 4490
         §§push(this);
         if(ZPP_Flags.GravMassMode_DEFAULT == null)
         {
            ZPP_Flags.§internal§ = true;
            ZPP_Flags.GravMassMode_DEFAULT = new GravMassMode();
            ZPP_Flags.§internal§ = false;
         }
         if(§§pop() == ZPP_Flags.GravMassMode_DEFAULT)
         {
            return "DEFAULT";
         }
         §§push(this);
         if(ZPP_Flags.GravMassMode_FIXED == null)
         {
            ZPP_Flags.§internal§ = true;
            ZPP_Flags.GravMassMode_FIXED = new GravMassMode();
            ZPP_Flags.§internal§ = false;
         }
         if(§§pop() == ZPP_Flags.GravMassMode_FIXED)
         {
            return "FIXED";
         }
         §§push(this);
         if(ZPP_Flags.GravMassMode_SCALED == null)
         {
            ZPP_Flags.§internal§ = true;
            ZPP_Flags.GravMassMode_SCALED = new GravMassMode();
            ZPP_Flags.§internal§ = false;
         }
         if(§§pop() == ZPP_Flags.GravMassMode_SCALED)
         {
            return "SCALED";
         }
         return "";
      }
   }
}

