package zpp_nape
{
   public class ZPP_Const
   {
      
      // method body index: 3749 method index: 4063
      public static var vec2vector:Class = // method body index: 3751 method index: 4066
      Type.getClass(new Vector.<Vec2>());
      
      public static var cbtypevector:Class = // method body index: 3751 method index: 4066
      Type.getClass(new Vector.<CbType>());
      
      public static var optiontypevector:Class = // method body index: 3751 method index: 4066
      Type.getClass(new Vector.<OptionType>());
      
      public function ZPP_Const()
      {
         // method body index: 3750 method index: 4062
      }
      
      public static function POSINF() : Number
      {
         // method body index: 3747 method index: 4064
         return 1.79e+308;
      }
      
      public static function NEGINF() : Number
      {
         // method body index: 3748 method index: 4065
         return -1.79e+308;
      }
   }
}

import nape.callbacks.CbType;
import nape.callbacks.OptionType;
import nape.geom.Vec2;

