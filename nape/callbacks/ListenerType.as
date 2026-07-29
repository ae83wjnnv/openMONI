package nape.callbacks
{
   import flash.Boot;
   import zpp_nape.util.ZPP_Flags;
   
   public final class ListenerType
   {
      
      public function ListenerType()
      {
         // method body index: 5525 method index: 5943
         if(Boot.skip_constructor)
         {
            return;
         }
         if(!ZPP_Flags.§internal§)
         {
            Boot.lastError = new Error();
            throw "Error: Cannot instantiate " + "ListenerType" + " derp!";
         }
      }
      
      public static function get BODY() : ListenerType
      {
         // method body index: 5519 method index: 5946
         if(ZPP_Flags.ListenerType_BODY == null)
         {
            ZPP_Flags.§internal§ = true;
            ZPP_Flags.ListenerType_BODY = new ListenerType();
            ZPP_Flags.§internal§ = false;
         }
         return ZPP_Flags.ListenerType_BODY;
      }
      
      public static function get CONSTRAINT() : ListenerType
      {
         // method body index: 5520 method index: 5947
         if(ZPP_Flags.ListenerType_CONSTRAINT == null)
         {
            ZPP_Flags.§internal§ = true;
            ZPP_Flags.ListenerType_CONSTRAINT = new ListenerType();
            ZPP_Flags.§internal§ = false;
         }
         return ZPP_Flags.ListenerType_CONSTRAINT;
      }
      
      public static function get INTERACTION() : ListenerType
      {
         // method body index: 5521 method index: 5948
         if(ZPP_Flags.ListenerType_INTERACTION == null)
         {
            ZPP_Flags.§internal§ = true;
            ZPP_Flags.ListenerType_INTERACTION = new ListenerType();
            ZPP_Flags.§internal§ = false;
         }
         return ZPP_Flags.ListenerType_INTERACTION;
      }
      
      public static function get PRE() : ListenerType
      {
         // method body index: 5522 method index: 5949
         if(ZPP_Flags.ListenerType_PRE == null)
         {
            ZPP_Flags.§internal§ = true;
            ZPP_Flags.ListenerType_PRE = new ListenerType();
            ZPP_Flags.§internal§ = false;
         }
         return ZPP_Flags.ListenerType_PRE;
      }
      
      public function toString() : String
      {
         // method body index: 5524 method index: 5945
         §§push(this);
         if(ZPP_Flags.ListenerType_BODY == null)
         {
            ZPP_Flags.§internal§ = true;
            ZPP_Flags.ListenerType_BODY = new ListenerType();
            ZPP_Flags.§internal§ = false;
         }
         if(§§pop() == ZPP_Flags.ListenerType_BODY)
         {
            return "BODY";
         }
         §§push(this);
         if(ZPP_Flags.ListenerType_CONSTRAINT == null)
         {
            ZPP_Flags.§internal§ = true;
            ZPP_Flags.ListenerType_CONSTRAINT = new ListenerType();
            ZPP_Flags.§internal§ = false;
         }
         if(§§pop() == ZPP_Flags.ListenerType_CONSTRAINT)
         {
            return "CONSTRAINT";
         }
         §§push(this);
         if(ZPP_Flags.ListenerType_INTERACTION == null)
         {
            ZPP_Flags.§internal§ = true;
            ZPP_Flags.ListenerType_INTERACTION = new ListenerType();
            ZPP_Flags.§internal§ = false;
         }
         if(§§pop() == ZPP_Flags.ListenerType_INTERACTION)
         {
            return "INTERACTION";
         }
         §§push(this);
         if(ZPP_Flags.ListenerType_PRE == null)
         {
            ZPP_Flags.§internal§ = true;
            ZPP_Flags.ListenerType_PRE = new ListenerType();
            ZPP_Flags.§internal§ = false;
         }
         if(§§pop() == ZPP_Flags.ListenerType_PRE)
         {
            return "PRE";
         }
         return "";
      }
   }
}

