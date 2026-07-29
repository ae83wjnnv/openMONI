package starling.display
{
   import flash.display3D.Context3DBlendFactor;
   import starling.errors.AbstractClassError;
   
   public class BlendMode
   {
      
      // method body index: 1467 method index: 1467
      private static var sBlendFactors:Array = // method body index: 1467 method index: 1467
      [{
         "none":[Context3DBlendFactor.ONE,Context3DBlendFactor.ZERO],
         "normal":[Context3DBlendFactor.SOURCE_ALPHA,Context3DBlendFactor.ONE_MINUS_SOURCE_ALPHA],
         "add":[Context3DBlendFactor.SOURCE_ALPHA,Context3DBlendFactor.DESTINATION_ALPHA],
         "multiply":[Context3DBlendFactor.DESTINATION_COLOR,Context3DBlendFactor.ONE_MINUS_SOURCE_ALPHA],
         "screen":[Context3DBlendFactor.SOURCE_ALPHA,Context3DBlendFactor.ONE],
         "erase":[Context3DBlendFactor.ZERO,Context3DBlendFactor.ONE_MINUS_SOURCE_ALPHA]
      },{
         "none":[Context3DBlendFactor.ONE,Context3DBlendFactor.ZERO],
         "normal":[Context3DBlendFactor.ONE,Context3DBlendFactor.ONE_MINUS_SOURCE_ALPHA],
         "add":[Context3DBlendFactor.ONE,Context3DBlendFactor.ONE],
         "multiply":[Context3DBlendFactor.DESTINATION_COLOR,Context3DBlendFactor.ONE_MINUS_SOURCE_ALPHA],
         "screen":[Context3DBlendFactor.ONE,Context3DBlendFactor.ONE_MINUS_SOURCE_COLOR],
         "erase":[Context3DBlendFactor.ZERO,Context3DBlendFactor.ONE_MINUS_SOURCE_ALPHA]
      }];
      
      public static const AUTO:String = // method body index: 1467 method index: 1467
      "auto";
      
      public static const NONE:String = // method body index: 1467 method index: 1467
      "none";
      
      public static const NORMAL:String = // method body index: 1467 method index: 1467
      "normal";
      
      public static const ADD:String = // method body index: 1467 method index: 1467
      "add";
      
      public static const MULTIPLY:String = // method body index: 1467 method index: 1467
      "multiply";
      
      public static const SCREEN:String = // method body index: 1467 method index: 1467
      "screen";
      
      public static const ERASE:String = // method body index: 1467 method index: 1467
      "erase";
      
      public function BlendMode()
      {
         // method body index: 1470 method index: 1470
         super();
         throw new AbstractClassError();
      }
      
      public static function getBlendFactors(param1:String, param2:Boolean = true) : Array
      {
         // method body index: 1468 method index: 1468
         var _loc3_:Object = sBlendFactors[int(param2)];
         if(param1 in _loc3_)
         {
            return _loc3_[param1];
         }
         throw new ArgumentError("Invalid blend mode");
      }
      
      public static function register(param1:String, param2:String, param3:String, param4:Boolean = true) : void
      {
         // method body index: 1469 method index: 1469
         var _loc5_:Object = sBlendFactors[int(param4)];
         _loc5_[param1] = [param2,param3];
         var _loc6_:Object = sBlendFactors[int(!param4)];
         if(!(param1 in _loc6_))
         {
            _loc6_[param1] = [param2,param3];
         }
      }
   }
}

