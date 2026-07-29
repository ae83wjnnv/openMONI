package nape.callbacks
{
   import flash.Boot;
   import zpp_nape.util.ZPP_Flags;
   
   public final class CbEvent
   {
      
      public function CbEvent()
      {
         // method body index: 5550 method index: 5965
         if(Boot.skip_constructor)
         {
            return;
         }
         if(!ZPP_Flags.§internal§)
         {
            Boot.lastError = new Error();
            throw "Error: Cannot instantiate " + "CbEvent" + " derp!";
         }
      }
      
      public static function get BEGIN() : CbEvent
      {
         // method body index: 5541 method index: 5968
         if(ZPP_Flags.CbEvent_BEGIN == null)
         {
            ZPP_Flags.§internal§ = true;
            ZPP_Flags.CbEvent_BEGIN = new CbEvent();
            ZPP_Flags.§internal§ = false;
         }
         return ZPP_Flags.CbEvent_BEGIN;
      }
      
      public static function get ONGOING() : CbEvent
      {
         // method body index: 5542 method index: 5969
         if(ZPP_Flags.CbEvent_ONGOING == null)
         {
            ZPP_Flags.§internal§ = true;
            ZPP_Flags.CbEvent_ONGOING = new CbEvent();
            ZPP_Flags.§internal§ = false;
         }
         return ZPP_Flags.CbEvent_ONGOING;
      }
      
      public static function get END() : CbEvent
      {
         // method body index: 5543 method index: 5970
         if(ZPP_Flags.CbEvent_END == null)
         {
            ZPP_Flags.§internal§ = true;
            ZPP_Flags.CbEvent_END = new CbEvent();
            ZPP_Flags.§internal§ = false;
         }
         return ZPP_Flags.CbEvent_END;
      }
      
      public static function get WAKE() : CbEvent
      {
         // method body index: 5544 method index: 5971
         if(ZPP_Flags.CbEvent_WAKE == null)
         {
            ZPP_Flags.§internal§ = true;
            ZPP_Flags.CbEvent_WAKE = new CbEvent();
            ZPP_Flags.§internal§ = false;
         }
         return ZPP_Flags.CbEvent_WAKE;
      }
      
      public static function get SLEEP() : CbEvent
      {
         // method body index: 5545 method index: 5972
         if(ZPP_Flags.CbEvent_SLEEP == null)
         {
            ZPP_Flags.§internal§ = true;
            ZPP_Flags.CbEvent_SLEEP = new CbEvent();
            ZPP_Flags.§internal§ = false;
         }
         return ZPP_Flags.CbEvent_SLEEP;
      }
      
      public static function get BREAK() : CbEvent
      {
         // method body index: 5546 method index: 5973
         if(ZPP_Flags.CbEvent_BREAK == null)
         {
            ZPP_Flags.§internal§ = true;
            ZPP_Flags.CbEvent_BREAK = new CbEvent();
            ZPP_Flags.§internal§ = false;
         }
         return ZPP_Flags.CbEvent_BREAK;
      }
      
      public static function get PRE() : CbEvent
      {
         // method body index: 5547 method index: 5974
         if(ZPP_Flags.CbEvent_PRE == null)
         {
            ZPP_Flags.§internal§ = true;
            ZPP_Flags.CbEvent_PRE = new CbEvent();
            ZPP_Flags.§internal§ = false;
         }
         return ZPP_Flags.CbEvent_PRE;
      }
      
      public function toString() : String
      {
         // method body index: 5549 method index: 5967
         §§push(this);
         if(ZPP_Flags.CbEvent_PRE == null)
         {
            ZPP_Flags.§internal§ = true;
            ZPP_Flags.CbEvent_PRE = new CbEvent();
            ZPP_Flags.§internal§ = false;
         }
         if(§§pop() == ZPP_Flags.CbEvent_PRE)
         {
            return "PRE";
         }
         §§push(this);
         if(ZPP_Flags.CbEvent_BEGIN == null)
         {
            ZPP_Flags.§internal§ = true;
            ZPP_Flags.CbEvent_BEGIN = new CbEvent();
            ZPP_Flags.§internal§ = false;
         }
         if(§§pop() == ZPP_Flags.CbEvent_BEGIN)
         {
            return "BEGIN";
         }
         §§push(this);
         if(ZPP_Flags.CbEvent_ONGOING == null)
         {
            ZPP_Flags.§internal§ = true;
            ZPP_Flags.CbEvent_ONGOING = new CbEvent();
            ZPP_Flags.§internal§ = false;
         }
         if(§§pop() == ZPP_Flags.CbEvent_ONGOING)
         {
            return "ONGOING";
         }
         §§push(this);
         if(ZPP_Flags.CbEvent_END == null)
         {
            ZPP_Flags.§internal§ = true;
            ZPP_Flags.CbEvent_END = new CbEvent();
            ZPP_Flags.§internal§ = false;
         }
         if(§§pop() == ZPP_Flags.CbEvent_END)
         {
            return "END";
         }
         §§push(this);
         if(ZPP_Flags.CbEvent_WAKE == null)
         {
            ZPP_Flags.§internal§ = true;
            ZPP_Flags.CbEvent_WAKE = new CbEvent();
            ZPP_Flags.§internal§ = false;
         }
         if(§§pop() == ZPP_Flags.CbEvent_WAKE)
         {
            return "WAKE";
         }
         §§push(this);
         if(ZPP_Flags.CbEvent_SLEEP == null)
         {
            ZPP_Flags.§internal§ = true;
            ZPP_Flags.CbEvent_SLEEP = new CbEvent();
            ZPP_Flags.§internal§ = false;
         }
         if(§§pop() == ZPP_Flags.CbEvent_SLEEP)
         {
            return "SLEEP";
         }
         §§push(this);
         if(ZPP_Flags.CbEvent_BREAK == null)
         {
            ZPP_Flags.§internal§ = true;
            ZPP_Flags.CbEvent_BREAK = new CbEvent();
            ZPP_Flags.§internal§ = false;
         }
         if(§§pop() == ZPP_Flags.CbEvent_BREAK)
         {
            return "BREAK";
         }
         return "";
      }
   }
}

