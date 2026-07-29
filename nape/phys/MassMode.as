package nape.phys
{
   import flash.Boot;
   import zpp_nape.util.ZPP_Flags;
   
   public final class MassMode
   {
      
      public function MassMode()
      {
         // method body index: 4310 method index: 4665
         if(Boot.skip_constructor)
         {
            return;
         }
         if(!ZPP_Flags.§internal§)
         {
            Boot.lastError = new Error();
            throw "Error: Cannot instantiate " + "MassMode" + " derp!";
         }
      }
      
      public static function get DEFAULT() : MassMode
      {
         // method body index: 4306 method index: 4668
         if(ZPP_Flags.MassMode_DEFAULT == null)
         {
            ZPP_Flags.§internal§ = true;
            ZPP_Flags.MassMode_DEFAULT = new MassMode();
            ZPP_Flags.§internal§ = false;
         }
         return ZPP_Flags.MassMode_DEFAULT;
      }
      
      public static function get FIXED() : MassMode
      {
         // method body index: 4307 method index: 4669
         if(ZPP_Flags.MassMode_FIXED == null)
         {
            ZPP_Flags.§internal§ = true;
            ZPP_Flags.MassMode_FIXED = new MassMode();
            ZPP_Flags.§internal§ = false;
         }
         return ZPP_Flags.MassMode_FIXED;
      }
      
      public function toString() : String
      {
         // method body index: 4309 method index: 4667
         §§push(this);
         if(ZPP_Flags.MassMode_DEFAULT == null)
         {
            ZPP_Flags.§internal§ = true;
            ZPP_Flags.MassMode_DEFAULT = new MassMode();
            ZPP_Flags.§internal§ = false;
         }
         if(§§pop() == ZPP_Flags.MassMode_DEFAULT)
         {
            return "DEFAULT";
         }
         §§push(this);
         if(ZPP_Flags.MassMode_FIXED == null)
         {
            ZPP_Flags.§internal§ = true;
            ZPP_Flags.MassMode_FIXED = new MassMode();
            ZPP_Flags.§internal§ = false;
         }
         if(§§pop() == ZPP_Flags.MassMode_FIXED)
         {
            return "FIXED";
         }
         return "";
      }
   }
}

