package flashpunk2.global
{
   public final class Color
   {
      
      // method body index: 1645 method index: 1645
      public static const WHITE:uint = // method body index: 1645 method index: 1645
      16777215;
      
      public static const SILVER:uint = // method body index: 1645 method index: 1645
      12632256;
      
      public static const GREY:uint = // method body index: 1645 method index: 1645
      8421504;
      
      public static const BLACK:uint = // method body index: 1645 method index: 1645
      0;
      
      public static const RED:uint = // method body index: 1645 method index: 1645
      16711680;
      
      public static const MAROON:uint = // method body index: 1645 method index: 1645
      8388608;
      
      public static const YELLOW:uint = // method body index: 1645 method index: 1645
      16776960;
      
      public static const OLIVE:uint = // method body index: 1645 method index: 1645
      8421376;
      
      public static const LIME:uint = // method body index: 1645 method index: 1645
      65280;
      
      public static const GREEN:uint = // method body index: 1645 method index: 1645
      32768;
      
      public static const AQUA:uint = // method body index: 1645 method index: 1645
      65535;
      
      public static const TEAL:uint = // method body index: 1645 method index: 1645
      32896;
      
      public static const BLUE:uint = // method body index: 1645 method index: 1645
      255;
      
      public static const NAVY:uint = // method body index: 1645 method index: 1645
      128;
      
      public static const FUCHSIA:uint = // method body index: 1645 method index: 1645
      16711935;
      
      public static const PURPLE:uint = // method body index: 1645 method index: 1645
      8388736;
      
      public static const BROWN:uint = // method body index: 1645 method index: 1645
      9127187;
      
      public function Color()
      {
         // method body index: 1658 method index: 1658
         super();
      }
      
      public static function fromString(param1:String) : uint
      {
         // method body index: 1646 method index: 1646
         if(param1.indexOf("0x") >= 0)
         {
            return uint(param1);
         }
         if(param1.indexOf("#") >= 0)
         {
            return uint(param1.replace("#","0x"));
         }
         return uint("0x" + param1);
      }
      
      public static function toString(param1:uint) : String
      {
         // method body index: 1647 method index: 1647
         var _loc2_:String = param1.toString(16).toUpperCase();
         while(_loc2_.length < 6)
         {
            _loc2_ = "0" + _loc2_;
         }
         return "#" + _loc2_;
      }
      
      public static function rgb(param1:uint, param2:uint, param3:uint) : uint
      {
         // method body index: 1648 method index: 1648
         if(param1 < 0 || param2 < 0 || param3 < 0 || param1 > 255 || param2 > 255 || param3 > 255)
         {
            throw new Error("RGB values must be within range 0-255.");
         }
         return param1 << 16 | param2 << 8 | param3;
      }
      
      public static function rgbPercent(param1:Number, param2:Number, param3:Number) : Number
      {
         // method body index: 1649 method index: 1649
         if(param1 < 0 || param2 < 0 || param3 < 0 || param1 > 1 || param2 > 1 || param3 > 1)
         {
            throw new Error("RGB values must be within range 0-1.");
         }
         return int(param1 * 255) << 16 | int(param2 * 255) << 8 | int(param3 * 255);
      }
      
      public static function hsv(param1:Number, param2:Number, param3:Number) : uint
      {
         // method body index: 1650 method index: 1650
         if(param1 < 0 || param2 < 0 || param3 < 0 || param1 > 1 || param2 > 1 || param3 > 1)
         {
            throw new Error("HSV values msut be within range 0-1.");
         }
         param1 = int(param1 * 360);
         var _loc4_:int = int(param1 / 60) % 6;
         var _loc5_:Number = param1 / 60 - int(param1 / 60);
         var _loc6_:Number = param3 * (1 - param2);
         var _loc7_:Number = param3 * (1 - _loc5_ * param2);
         var _loc8_:Number = param3 * (1 - (1 - _loc5_) * param2);
         switch(_loc4_)
         {
            case 0:
               return int(param3 * 255) << 16 | int(_loc8_ * 255) << 8 | int(_loc6_ * 255);
            case 1:
               return int(_loc7_ * 255) << 16 | int(param3 * 255) << 8 | int(_loc6_ * 255);
            case 2:
               return int(_loc6_ * 255) << 16 | int(param3 * 255) << 8 | int(_loc8_ * 255);
            case 3:
               return int(_loc6_ * 255) << 16 | int(_loc7_ * 255) << 8 | int(param3 * 255);
            case 4:
               return int(_loc8_ * 255) << 16 | int(_loc6_ * 255) << 8 | int(param3 * 255);
            case 5:
               return int(param3 * 255) << 16 | int(_loc6_ * 255) << 8 | int(_loc7_ * 255);
            default:
               return 0;
         }
      }
      
      public static function getRed(param1:uint) : uint
      {
         // method body index: 1651 method index: 1651
         return param1 >> 16 & 0xFF;
      }
      
      public static function getRedPercent(param1:uint) : Number
      {
         // method body index: 1652 method index: 1652
         return (param1 >> 16 & 0xFF) / 255;
      }
      
      public static function getGreen(param1:uint) : uint
      {
         // method body index: 1653 method index: 1653
         return param1 >> 8 & 0xFF;
      }
      
      public static function getGreenPercent(param1:uint) : Number
      {
         // method body index: 1654 method index: 1654
         return (param1 >> 8 & 0xFF) / 255;
      }
      
      public static function getBlue(param1:uint) : uint
      {
         // method body index: 1655 method index: 1655
         return param1 & 0xFF;
      }
      
      public static function getBluePercent(param1:uint) : Number
      {
         // method body index: 1656 method index: 1656
         return (param1 & 0xFF) / 255;
      }
      
      public static function lerp(param1:uint, param2:uint, param3:Number) : uint
      {
         // method body index: 1657 method index: 1657
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         if(param3 <= 0)
         {
            return param1;
         }
         if(param3 >= 1)
         {
            return param2;
         }
         _loc4_ = uint(param1 >> 16 & 0xFF);
         _loc5_ = uint(param1 >> 8 & 0xFF);
         _loc6_ = uint(param1 & 0xFF);
         _loc4_ += ((param2 >> 16 & 0xFF) - _loc4_) * param3;
         _loc5_ += ((param2 >> 8 & 0xFF) - _loc5_) * param3;
         _loc6_ += ((param2 & 0xFF) - _loc6_) * param3;
         return _loc4_ << 16 | _loc5_ << 8 | _loc6_;
      }
   }
}

