package flashpunk2.global
{
   import flash.display.Shape;
   import flash.geom.Matrix;
   import flashpunk2.Engine;
   import flashpunk2.namespaces.fp_internal;
   
   use namespace fp_internal;
   
   public final class Debug
   {
      
      // method body index: 1702 method index: 1703
      private static var _identity:Matrix = // method body index: 1702 method index: 1703
      new Matrix();
      
      private static var _shape:Shape = // method body index: 1702 method index: 1703
      new Shape();
      
      public function Debug()
      {
         // method body index: 1716 method index: 1717
         super();
      }
      
      fp_internal static function start() : void
      {
         // method body index: 1703 method index: 1704
         Engine.instance.main.addChild(_shape);
      }
      
      fp_internal static function end() : void
      {
         // method body index: 1704 method index: 1705
         Engine.instance.main.removeChild(_shape);
      }
      
      fp_internal static function update() : void
      {
         // method body index: 1705 method index: 1706
         _shape.graphics.clear();
         if(Engine.instance.currentWorld != null)
         {
            _shape.transform.matrix = Engine.instance.currentWorld.camera.getMatrix();
         }
         else
         {
            _shape.transform.matrix = _identity;
         }
      }
      
      public static function registerCommand(param1:Function, ... rest) : void
      {
         // method body index: 1706 method index: 1707
      }
      
      public static function log(... rest) : void
      {
         // method body index: 1707 method index: 1708
      }
      
      public static function logError(... rest) : void
      {
         // method body index: 1708 method index: 1709
      }
      
      public static function clearLog() : void
      {
         // method body index: 1709 method index: 1710
      }
      
      public static function clear() : void
      {
         // method body index: 1710 method index: 1711
         _shape.graphics.clear();
      }
      
      public static function drawCircle(param1:Number, param2:Number, param3:Number, param4:uint, param5:Number = 1) : void
      {
         // method body index: 1711 method index: 1712
         _shape.graphics.lineStyle();
         _shape.graphics.beginFill(param4,param5);
         _shape.graphics.drawCircle(param1,param2,param3);
      }
      
      public static function drawCircleOutline(param1:Number, param2:Number, param3:Number, param4:uint, param5:Number = 1, param6:Number = 1) : void
      {
         // method body index: 1712 method index: 1713
         _shape.graphics.endFill();
         _shape.graphics.lineStyle(param6,param4,param5);
         _shape.graphics.drawCircle(param1,param2,param3);
      }
      
      public static function drawRect(param1:Number, param2:Number, param3:Number, param4:Number, param5:uint, param6:Number = 1) : void
      {
         // method body index: 1713 method index: 1714
         _shape.graphics.lineStyle();
         _shape.graphics.beginFill(param5,param6);
         _shape.graphics.drawRect(param1,param2,param3,param4);
      }
      
      public static function drawRectOutline(param1:Number, param2:Number, param3:Number, param4:Number, param5:uint, param6:Number = 1, param7:Number = 1) : void
      {
         // method body index: 1714 method index: 1715
         _shape.graphics.endFill();
         _shape.graphics.lineStyle(param7,param5,param6);
         _shape.graphics.drawRect(param1,param2,param3,param4);
      }
      
      public static function drawLine(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number = 1, param7:Number = 1) : void
      {
         // method body index: 1715 method index: 1716
         _shape.graphics.endFill();
         _shape.graphics.lineStyle(param7,param5,param6);
         _shape.graphics.moveTo(param1,param2);
         _shape.graphics.lineTo(param3,param4);
      }
   }
}

