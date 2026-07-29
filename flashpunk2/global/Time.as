package flashpunk2.global
{
   import flash.utils.getTimer;
   import flashpunk2.Engine;
   import flashpunk2.namespaces.fp_internal;
   
   use namespace fp_internal;
   
   public final class Time
   {
      
      private static var _frameRate:int;
      
      // method body index: 657 method index: 657
      private static var _time:Number = // method body index: 657 method index: 657
      0;
      
      private static var _total:Number = // method body index: 657 method index: 657
      0;
      
      private static var _dt:Number = // method body index: 657 method index: 657
      0;
      
      private static var _rate:Number = // method body index: 657 method index: 657
      1;
      
      private static var _frameTimer:Number = // method body index: 657 method index: 657
      0;
      
      private static var _frameCounter:int = // method body index: 657 method index: 657
      0;
      
      public function Time()
      {
         // method body index: 670 method index: 670
         super();
      }
      
      fp_internal static function start() : void
      {
         // method body index: 658 method index: 658
         _time = 0;
         _total = 0;
         _dt = 0;
         _frameRate = Engine.instance.frameRate;
      }
      
      fp_internal static function update(param1:Number) : void
      {
         // method body index: 659 method index: 659
         _dt = (param1 - _time) / 1000;
         _total += _dt * _rate;
         _time = param1;
         ++_frameCounter;
         _frameTimer += _dt;
         if(_frameTimer >= 1)
         {
            _frameTimer = _frameTimer - 1;
            _frameRate = _frameCounter;
            _frameCounter = 0;
         }
      }
      
      fp_internal static function resume() : void
      {
         // method body index: 660 method index: 660
         _time = getTimer();
      }
      
      public static function loop(param1:Number, param2:Number, param3:Number, param4:Number = 0) : Number
      {
         // method body index: 661 method index: 661
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         if(param3 != param2 && param1 != 0)
         {
            _loc5_ = param3 - param2;
            _loc6_ = (_total + param1 * param4) * (Math.abs(_loc5_) / param1);
            if(_loc5_ > 0)
            {
               return param2 + _loc6_ - _loc5_ * int(_loc6_ / _loc5_);
            }
            return param2 - (_loc6_ - Math.abs(_loc5_) * int(_loc6_ / Math.abs(_loc5_)));
         }
         return param2;
      }
      
      public static function wave(param1:Number, param2:Number, param3:Number, param4:Number = 0) : Number
      {
         // method body index: 662 method index: 662
         var _loc5_:Number = NaN;
         if(param3 != param2 && param1 != 0)
         {
            _loc5_ = (param3 - param2) / 2;
            return param2 + _loc5_ + Math.sin((_total + param1 * param4) / param1 * (Math.PI * 2)) * _loc5_;
         }
         return param2;
      }
      
      public static function alt(param1:Number) : Boolean
      {
         // method body index: 663 method index: 663
         return int(_total / param1) % 2 == 0;
      }
      
      public static function altValues(param1:Number, param2:*, param3:*) : *
      {
         // method body index: 664 method index: 664
         return alt(param1) ? param2 : param3;
      }
      
      public static function get total() : Number
      {
         // method body index: 665 method index: 665
         return _total;
      }
      
      public static function get dt() : Number
      {
         // method body index: 666 method index: 666
         return _dt * _rate;
      }
      
      public static function get rate() : Number
      {
         // method body index: 667 method index: 667
         return _rate;
      }
      
      public static function set rate(param1:Number) : void
      {
         // method body index: 668 method index: 668
         _rate = param1;
      }
      
      public static function get frameRate() : int
      {
         // method body index: 669 method index: 669
         return _frameRate;
      }
   }
}

