package starling.display
{
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import starling.core.RenderSupport;
   import starling.utils.VertexData;
   
   public class Quad extends DisplayObject
   {
      
      // method body index: 1289 method index: 1289
      private static var sHelperPoint:Point = // method body index: 1289 method index: 1289
      new Point();
      
      private static var sHelperMatrix:Matrix = // method body index: 1289 method index: 1289
      new Matrix();
      
      private var mTinted:Boolean;
      
      protected var mVertexData:VertexData;
      
      public function Quad(param1:Number, param2:Number, param3:uint = 16777215, param4:Boolean = true)
      {
         // method body index: 1290 method index: 1290
         super();
         this.mTinted = param3 != 16777215;
         this.mVertexData = new VertexData(4,param4);
         this.mVertexData.setPosition(0,0,0);
         this.mVertexData.setPosition(1,param1,0);
         this.mVertexData.setPosition(2,0,param2);
         this.mVertexData.setPosition(3,param1,param2);
         this.mVertexData.setUniformColor(param3);
         this.onVertexDataChanged();
      }
      
      protected function onVertexDataChanged() : void
      {
         // method body index: 1291 method index: 1291
      }
      
      override public function getBounds(param1:DisplayObject, param2:Rectangle = null) : Rectangle
      {
         // method body index: 1292 method index: 1292
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         if(param2 == null)
         {
            param2 = new Rectangle();
         }
         if(param1 == this)
         {
            this.mVertexData.getPosition(3,sHelperPoint);
            param2.setTo(0,0,sHelperPoint.x,sHelperPoint.y);
         }
         else if(param1 == parent && rotation == 0)
         {
            _loc3_ = this.scaleX;
            _loc4_ = this.scaleY;
            this.mVertexData.getPosition(3,sHelperPoint);
            param2.setTo(x - pivotX * _loc3_,y - pivotY * _loc4_,sHelperPoint.x * _loc3_,sHelperPoint.y * _loc4_);
            if(_loc3_ < 0)
            {
               param2.width *= -1;
               param2.x -= param2.width;
            }
            if(_loc4_ < 0)
            {
               param2.height *= -1;
               param2.y -= param2.height;
            }
         }
         else
         {
            getTransformationMatrix(param1,sHelperMatrix);
            this.mVertexData.getBounds(sHelperMatrix,0,4,param2);
         }
         return param2;
      }
      
      public function getVertexColor(param1:int) : uint
      {
         // method body index: 1293 method index: 1293
         return this.mVertexData.getColor(param1);
      }
      
      public function setVertexColor(param1:int, param2:uint) : void
      {
         // method body index: 1294 method index: 1294
         this.mVertexData.setColor(param1,param2);
         this.onVertexDataChanged();
         if(param2 != 16777215)
         {
            this.mTinted = true;
         }
         else
         {
            this.mTinted = this.mVertexData.tinted;
         }
      }
      
      public function getVertexAlpha(param1:int) : Number
      {
         // method body index: 1295 method index: 1295
         return this.mVertexData.getAlpha(param1);
      }
      
      public function setVertexAlpha(param1:int, param2:Number) : void
      {
         // method body index: 1296 method index: 1296
         this.mVertexData.setAlpha(param1,param2);
         this.onVertexDataChanged();
         if(param2 != 1)
         {
            this.mTinted = true;
         }
         else
         {
            this.mTinted = this.mVertexData.tinted;
         }
      }
      
      public function get color() : uint
      {
         // method body index: 1297 method index: 1297
         return this.mVertexData.getColor(0);
      }
      
      public function set color(param1:uint) : void
      {
         // method body index: 1298 method index: 1298
         var _loc2_:int = 0;
         while(_loc2_ < 4)
         {
            this.setVertexColor(_loc2_,param1);
            _loc2_++;
         }
         if(param1 != 16777215 || alpha != 1)
         {
            this.mTinted = true;
         }
         else
         {
            this.mTinted = this.mVertexData.tinted;
         }
      }
      
      override public function set alpha(param1:Number) : void
      {
         // method body index: 1299 method index: 1299
         super.alpha = param1;
         if(param1 < 1)
         {
            this.mTinted = true;
         }
         else
         {
            this.mTinted = this.mVertexData.tinted;
         }
      }
      
      public function copyVertexDataTo(param1:VertexData, param2:int = 0) : void
      {
         // method body index: 1300 method index: 1300
         this.mVertexData.copyTo(param1,param2);
      }
      
      override public function render(param1:RenderSupport, param2:Number) : void
      {
         // method body index: 1301 method index: 1301
         param1.batchQuad(this,param2);
      }
      
      public function get tinted() : Boolean
      {
         // method body index: 1302 method index: 1302
         return this.mTinted;
      }
      
      public function get premultipliedAlpha() : Boolean
      {
         // method body index: 1303 method index: 1303
         return this.mVertexData.premultipliedAlpha;
      }
   }
}

