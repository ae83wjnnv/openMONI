package starling.textures
{
   import flash.display3D.textures.TextureBase;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import starling.utils.VertexData;
   
   public class SubTexture extends Texture
   {
      
      // method body index: 1374 method index: 1374
      private static var sTexCoords:Point = // method body index: 1374 method index: 1374
      new Point();
      
      private var mParent:Texture;
      
      private var mClipping:Rectangle;
      
      private var mRootClipping:Rectangle;
      
      private var mOwnsParent:Boolean;
      
      public function SubTexture(param1:Texture, param2:Rectangle, param3:Boolean = false)
      {
         // method body index: 1375 method index: 1375
         super();
         this.mParent = param1;
         this.mOwnsParent = param3;
         if(param2 == null)
         {
            this.setClipping(new Rectangle(0,0,1,1));
         }
         else
         {
            this.setClipping(new Rectangle(param2.x / param1.width,param2.y / param1.height,param2.width / param1.width,param2.height / param1.height));
         }
      }
      
      override public function dispose() : void
      {
         // method body index: 1376 method index: 1376
         if(this.mOwnsParent)
         {
            this.mParent.dispose();
         }
         super.dispose();
      }
      
      private function setClipping(param1:Rectangle) : void
      {
         // method body index: 1377 method index: 1377
         var _loc3_:Rectangle = null;
         this.mClipping = param1;
         this.mRootClipping = param1.clone();
         var _loc2_:SubTexture = this.mParent as SubTexture;
         while(_loc2_)
         {
            _loc3_ = _loc2_.mClipping;
            this.mRootClipping.x = _loc3_.x + this.mRootClipping.x * _loc3_.width;
            this.mRootClipping.y = _loc3_.y + this.mRootClipping.y * _loc3_.height;
            this.mRootClipping.width *= _loc3_.width;
            this.mRootClipping.height *= _loc3_.height;
            _loc2_ = _loc2_.mParent as SubTexture;
         }
      }
      
      override public function adjustVertexData(param1:VertexData, param2:int, param3:int) : void
      {
         // method body index: 1378 method index: 1378
         super.adjustVertexData(param1,param2,param3);
         var _loc4_:Number = this.mRootClipping.x;
         var _loc5_:Number = this.mRootClipping.y;
         var _loc6_:Number = this.mRootClipping.width;
         var _loc7_:Number = this.mRootClipping.height;
         var _loc8_:int = param2 + param3;
         var _loc9_:int = param2;
         while(_loc9_ < _loc8_)
         {
            param1.getTexCoords(_loc9_,sTexCoords);
            param1.setTexCoords(_loc9_,_loc4_ + sTexCoords.x * _loc6_,_loc5_ + sTexCoords.y * _loc7_);
            _loc9_++;
         }
      }
      
      public function get parent() : Texture
      {
         // method body index: 1379 method index: 1379
         return this.mParent;
      }
      
      public function get ownsParent() : Boolean
      {
         // method body index: 1380 method index: 1380
         return this.mOwnsParent;
      }
      
      public function get clipping() : Rectangle
      {
         // method body index: 1381 method index: 1381
         return this.mClipping.clone();
      }
      
      override public function get base() : TextureBase
      {
         // method body index: 1382 method index: 1382
         return this.mParent.base;
      }
      
      override public function get root() : ConcreteTexture
      {
         // method body index: 1383 method index: 1383
         return this.mParent.root;
      }
      
      override public function get format() : String
      {
         // method body index: 1384 method index: 1384
         return this.mParent.format;
      }
      
      override public function get width() : Number
      {
         // method body index: 1385 method index: 1385
         return this.mParent.width * this.mClipping.width;
      }
      
      override public function get height() : Number
      {
         // method body index: 1386 method index: 1386
         return this.mParent.height * this.mClipping.height;
      }
      
      override public function get nativeWidth() : Number
      {
         // method body index: 1387 method index: 1387
         return this.mParent.nativeWidth * this.mClipping.width;
      }
      
      override public function get nativeHeight() : Number
      {
         // method body index: 1388 method index: 1388
         return this.mParent.nativeHeight * this.mClipping.height;
      }
      
      override public function get mipMapping() : Boolean
      {
         // method body index: 1389 method index: 1389
         return this.mParent.mipMapping;
      }
      
      override public function get premultipliedAlpha() : Boolean
      {
         // method body index: 1390 method index: 1390
         return this.mParent.premultipliedAlpha;
      }
      
      override public function get scale() : Number
      {
         // method body index: 1391 method index: 1391
         return this.mParent.scale;
      }
   }
}

