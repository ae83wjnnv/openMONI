package starling.utils
{
   import starling.errors.AbstractClassError;
   
   public class Color
   {
      
      // method body index: 2823 method index: 2837
      public static const WHITE:uint = // method body index: 2823 method index: 2837
      16777215;
      
      public static const SILVER:uint = // method body index: 2823 method index: 2837
      12632256;
      
      public static const GRAY:uint = // method body index: 2823 method index: 2837
      8421504;
      
      public static const BLACK:uint = // method body index: 2823 method index: 2837
      0;
      
      public static const RED:uint = // method body index: 2823 method index: 2837
      16711680;
      
      public static const MAROON:uint = // method body index: 2823 method index: 2837
      8388608;
      
      public static const YELLOW:uint = // method body index: 2823 method index: 2837
      16776960;
      
      public static const OLIVE:uint = // method body index: 2823 method index: 2837
      8421376;
      
      public static const LIME:uint = // method body index: 2823 method index: 2837
      65280;
      
      public static const GREEN:uint = // method body index: 2823 method index: 2837
      32768;
      
      public static const AQUA:uint = // method body index: 2823 method index: 2837
      65535;
      
      public static const TEAL:uint = // method body index: 2823 method index: 2837
      32896;
      
      public static const BLUE:uint = // method body index: 2823 method index: 2837
      255;
      
      public static const NAVY:uint = // method body index: 2823 method index: 2837
      128;
      
      public static const FUCHSIA:uint = // method body index: 2823 method index: 2837
      16711935;
      
      public static const PURPLE:uint = // method body index: 2823 method index: 2837
      8388736;
      
      public function Color()
      {
         // method body index: 2830 method index: 2844
         super();
         throw new AbstractClassError();
      }
      
      public static function getAlpha(param1:uint) : int
      {
         // method body index: 2824 method index: 2838
         return param1 >> 24 & 0xFF;
      }
      
      public static function getRed(param1:uint) : int
      {
         // method body index: 2825 method index: 2839
         return param1 >> 16 & 0xFF;
      }
      
      public static function getGreen(param1:uint) : int
      {
         // method body index: 2826 method index: 2840
         return param1 >> 8 & 0xFF;
      }
      
      public static function getBlue(param1:uint) : int
      {
         // method body index: 2827 method index: 2841
         return param1 & 0xFF;
      }
      
      public static function rgb(param1:int, param2:int, param3:int) : uint
      {
         // method body index: 2828 method index: 2842
         return param1 << 16 | param2 << 8 | param3;
      }
      
      public static function argb(param1:int, param2:int, param3:int, param4:int) : uint
      {
         // method body index: 2829 method index: 2843
         return param1 << 24 | param2 << 16 | param3 << 8 | param4;
      }
   }
}

