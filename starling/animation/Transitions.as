package starling.animation
{
   import flash.utils.Dictionary;
   import starling.errors.AbstractClassError;
   
   public class Transitions
   {
      
      private static var sTransitions:Dictionary;
      
      // method body index: 5990 method index: 6462
      public static const LINEAR:String = // method body index: 5990 method index: 6462
      "linear";
      
      public static const EASE_IN:String = // method body index: 5990 method index: 6462
      "easeIn";
      
      public static const EASE_OUT:String = // method body index: 5990 method index: 6462
      "easeOut";
      
      public static const EASE_IN_OUT:String = // method body index: 5990 method index: 6462
      "easeInOut";
      
      public static const EASE_OUT_IN:String = // method body index: 5990 method index: 6462
      "easeOutIn";
      
      public static const EASE_IN_BACK:String = // method body index: 5990 method index: 6462
      "easeInBack";
      
      public static const EASE_OUT_BACK:String = // method body index: 5990 method index: 6462
      "easeOutBack";
      
      public static const EASE_IN_OUT_BACK:String = // method body index: 5990 method index: 6462
      "easeInOutBack";
      
      public static const EASE_OUT_IN_BACK:String = // method body index: 5990 method index: 6462
      "easeOutInBack";
      
      public static const EASE_IN_ELASTIC:String = // method body index: 5990 method index: 6462
      "easeInElastic";
      
      public static const EASE_OUT_ELASTIC:String = // method body index: 5990 method index: 6462
      "easeOutElastic";
      
      public static const EASE_IN_OUT_ELASTIC:String = // method body index: 5990 method index: 6462
      "easeInOutElastic";
      
      public static const EASE_OUT_IN_ELASTIC:String = // method body index: 5990 method index: 6462
      "easeOutInElastic";
      
      public static const EASE_IN_BOUNCE:String = // method body index: 5990 method index: 6462
      "easeInBounce";
      
      public static const EASE_OUT_BOUNCE:String = // method body index: 5990 method index: 6462
      "easeOutBounce";
      
      public static const EASE_IN_OUT_BOUNCE:String = // method body index: 5990 method index: 6462
      "easeInOutBounce";
      
      public static const EASE_OUT_IN_BOUNCE:String = // method body index: 5990 method index: 6462
      "easeOutInBounce";
      
      public function Transitions()
      {
         // method body index: 6012 method index: 6484
         super();
         throw new AbstractClassError();
      }
      
      public static function getTransition(param1:String) : Function
      {
         // method body index: 5991 method index: 6463
         if(sTransitions == null)
         {
            registerDefaults();
         }
         return sTransitions[param1];
      }
      
      public static function register(param1:String, param2:Function) : void
      {
         // method body index: 5992 method index: 6464
         if(sTransitions == null)
         {
            registerDefaults();
         }
         sTransitions[param1] = param2;
      }
      
      private static function registerDefaults() : void
      {
         // method body index: 5993 method index: 6465
         sTransitions = new Dictionary();
         register(LINEAR,linear);
         register(EASE_IN,easeIn);
         register(EASE_OUT,easeOut);
         register(EASE_IN_OUT,easeInOut);
         register(EASE_OUT_IN,easeOutIn);
         register(EASE_IN_BACK,easeInBack);
         register(EASE_OUT_BACK,easeOutBack);
         register(EASE_IN_OUT_BACK,easeInOutBack);
         register(EASE_OUT_IN_BACK,easeOutInBack);
         register(EASE_IN_ELASTIC,easeInElastic);
         register(EASE_OUT_ELASTIC,easeOutElastic);
         register(EASE_IN_OUT_ELASTIC,easeInOutElastic);
         register(EASE_OUT_IN_ELASTIC,easeOutInElastic);
         register(EASE_IN_BOUNCE,easeInBounce);
         register(EASE_OUT_BOUNCE,easeOutBounce);
         register(EASE_IN_OUT_BOUNCE,easeInOutBounce);
         register(EASE_OUT_IN_BOUNCE,easeOutInBounce);
      }
      
      protected static function linear(param1:Number) : Number
      {
         // method body index: 5994 method index: 6466
         return param1;
      }
      
      protected static function easeIn(param1:Number) : Number
      {
         // method body index: 5995 method index: 6467
         return param1 * param1 * param1;
      }
      
      protected static function easeOut(param1:Number) : Number
      {
         // method body index: 5996 method index: 6468
         var _loc2_:Number = param1 - 1;
         return _loc2_ * _loc2_ * _loc2_ + 1;
      }
      
      protected static function easeInOut(param1:Number) : Number
      {
         // method body index: 5997 method index: 6469
         return easeCombined(easeIn,easeOut,param1);
      }
      
      protected static function easeOutIn(param1:Number) : Number
      {
         // method body index: 5998 method index: 6470
         return easeCombined(easeOut,easeIn,param1);
      }
      
      protected static function easeInBack(param1:Number) : Number
      {
         // method body index: 5999 method index: 6471
         var _loc2_:Number = 1.70158;
         return Math.pow(param1,2) * ((_loc2_ + 1) * param1 - _loc2_);
      }
      
      protected static function easeOutBack(param1:Number) : Number
      {
         // method body index: 6000 method index: 6472
         var _loc2_:Number = param1 - 1;
         var _loc3_:Number = 1.70158;
         return Math.pow(_loc2_,2) * ((_loc3_ + 1) * _loc2_ + _loc3_) + 1;
      }
      
      protected static function easeInOutBack(param1:Number) : Number
      {
         // method body index: 6001 method index: 6473
         return easeCombined(easeInBack,easeOutBack,param1);
      }
      
      protected static function easeOutInBack(param1:Number) : Number
      {
         // method body index: 6002 method index: 6474
         return easeCombined(easeOutBack,easeInBack,param1);
      }
      
      protected static function easeInElastic(param1:Number) : Number
      {
         // method body index: 6003 method index: 6475
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         if(param1 == 0 || param1 == 1)
         {
            return param1;
         }
         _loc2_ = 0.3;
         _loc3_ = _loc2_ / 4;
         _loc4_ = param1 - 1;
         return -1 * Math.pow(2,10 * _loc4_) * Math.sin((_loc4_ - _loc3_) * (2 * Math.PI) / _loc2_);
      }
      
      protected static function easeOutElastic(param1:Number) : Number
      {
         // method body index: 6004 method index: 6476
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         if(param1 == 0 || param1 == 1)
         {
            return param1;
         }
         _loc2_ = 0.3;
         _loc3_ = _loc2_ / 4;
         return Math.pow(2,-10 * param1) * Math.sin((param1 - _loc3_) * (2 * Math.PI) / _loc2_) + 1;
      }
      
      protected static function easeInOutElastic(param1:Number) : Number
      {
         // method body index: 6005 method index: 6477
         return easeCombined(easeInElastic,easeOutElastic,param1);
      }
      
      protected static function easeOutInElastic(param1:Number) : Number
      {
         // method body index: 6006 method index: 6478
         return easeCombined(easeOutElastic,easeInElastic,param1);
      }
      
      protected static function easeInBounce(param1:Number) : Number
      {
         // method body index: 6007 method index: 6479
         return 1 - easeOutBounce(1 - param1);
      }
      
      protected static function easeOutBounce(param1:Number) : Number
      {
         // method body index: 6008 method index: 6480
         var _loc4_:Number = NaN;
         var _loc2_:Number = 7.5625;
         var _loc3_:Number = 2.75;
         if(param1 < 1 / _loc3_)
         {
            _loc4_ = _loc2_ * Math.pow(param1,2);
         }
         else if(param1 < 2 / _loc3_)
         {
            param1 -= 1.5 / _loc3_;
            _loc4_ = _loc2_ * Math.pow(param1,2) + 0.75;
         }
         else if(param1 < 2.5 / _loc3_)
         {
            param1 -= 2.25 / _loc3_;
            _loc4_ = _loc2_ * Math.pow(param1,2) + 0.9375;
         }
         else
         {
            param1 -= 2.625 / _loc3_;
            _loc4_ = _loc2_ * Math.pow(param1,2) + 0.984375;
         }
         return _loc4_;
      }
      
      protected static function easeInOutBounce(param1:Number) : Number
      {
         // method body index: 6009 method index: 6481
         return easeCombined(easeInBounce,easeOutBounce,param1);
      }
      
      protected static function easeOutInBounce(param1:Number) : Number
      {
         // method body index: 6010 method index: 6482
         return easeCombined(easeOutBounce,easeInBounce,param1);
      }
      
      protected static function easeCombined(param1:Function, param2:Function, param3:Number) : Number
      {
         // method body index: 6011 method index: 6483
         if(param3 < 0.5)
         {
            return 0.5 * param1(param3 * 2);
         }
         return 0.5 * param2((param3 - 0.5) * 2) + 0.5;
      }
   }
}

