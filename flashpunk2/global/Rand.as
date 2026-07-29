package flashpunk2.global
{
   import flashpunk2.namespaces.fp_internal;
   
   use namespace fp_internal;
   
   public final class Rand
   {
      
      private static var _seed:uint;
      
      public function Rand()
      {
         // method body index: 636 method index: 636
         super();
      }
      
      fp_internal static function start() : void
      {
         // method body index: 619 method index: 619
         randomizeSeed();
      }
      
      public static function fromSeed(param1:uint) : Number
      {
         // method body index: 620 method index: 620
         return param1 * 16807 % 2147483647 / 2147483647;
      }
      
      public static function getNumber(param1:Number) : Number
      {
         // method body index: 621 method index: 621
         return param1 * value;
      }
      
      public static function getNumberRange(param1:Number, param2:Number) : Number
      {
         // method body index: 622 method index: 622
         return param1 + (param2 - param1) * value;
      }
      
      public static function getInt(param1:int) : int
      {
         // method body index: 623 method index: 623
         return param1 * value;
      }
      
      public static function getIntRange(param1:int, param2:int) : int
      {
         // method body index: 624 method index: 624
         if(param2 > param1)
         {
            return param1 + (param2 + 1 - param1) * value;
         }
         return param2 + (param1 + 1 - param2) * value;
      }
      
      public static function randomizeSeed() : void
      {
         // method body index: 625 method index: 625
         seed = 2147483647 * Math.random();
      }
      
      public static function choose(... rest) : *
      {
         // method body index: 626 method index: 626
         var values:Array = rest;
         if(values.length > 1)
         {
            return values[int(values.length * value)];
         }
         try
         {
            return values[0][int(values[0].length * value)];
         }
         catch(e:Error)
         {
            throw new Error("Invalid choose type. Provide arguments to choose from or an array of values.");
         }
      }
      
      public static function chance(param1:Number) : Boolean
      {
         // method body index: 627 method index: 627
         return value < param1;
      }
      
      public static function get seed() : uint
      {
         // method body index: 628 method index: 628
         return _seed;
      }
      
      public static function set seed(param1:uint) : void
      {
         // method body index: 629 method index: 629
         _seed = Calc.clamp(param1,1,2147483646);
      }
      
      public static function get value() : Number
      {
         // method body index: 630 method index: 630
         _seed = _seed * 16807 % 2147483647;
         return _seed / 2147483647;
      }
      
      public static function get angle() : Number
      {
         // method body index: 631 method index: 631
         return 360 * value;
      }
      
      public static function get boolean() : Boolean
      {
         // method body index: 632 method index: 632
         return value < 0.5;
      }
      
      public static function get color() : uint
      {
         // method body index: 633 method index: 633
         return 16777215 * value;
      }
      
      public static function get hue() : uint
      {
         // method body index: 634 method index: 634
         return Color.hsv(value,1,1);
      }
      
      public static function randomIndexByWeights(param1:Array) : int
      {
         // method body index: 635 method index: 635
         var _loc2_:Number = 0;
         var _loc3_:int = 0;
         while(_loc3_ < param1.length)
         {
            _loc2_ += param1[_loc3_];
            _loc3_++;
         }
         var _loc4_:Number = value * _loc2_;
         _loc2_ = 0;
         _loc3_ = 0;
         while(_loc3_ < param1.length)
         {
            _loc2_ += param1[_loc3_];
            if(_loc4_ < _loc2_)
            {
               return _loc3_;
            }
            _loc3_++;
         }
         return param1.length - 1;
      }
   }
}

