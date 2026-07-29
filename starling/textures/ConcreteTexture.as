package starling.textures
{
   import flash.display.BitmapData;
   import flash.display3D.Context3D;
   import flash.display3D.Context3DTextureFormat;
   import flash.display3D.textures.Texture;
   import flash.display3D.textures.TextureBase;
   import starling.core.Starling;
   import starling.events.Event;
   
   public class ConcreteTexture extends starling.textures.Texture
   {
      
      private var mBase:TextureBase;
      
      private var mFormat:String;
      
      private var mWidth:int;
      
      private var mHeight:int;
      
      private var mMipMapping:Boolean;
      
      private var mPremultipliedAlpha:Boolean;
      
      private var mOptimizedForRenderTexture:Boolean;
      
      private var mData:Object;
      
      private var mScale:Number;
      
      public function ConcreteTexture(param1:TextureBase, param2:String, param3:int, param4:int, param5:Boolean, param6:Boolean, param7:Boolean = false, param8:Number = 1)
      {
         // method body index: 1345 method index: 1345
         super();
         this.mScale = param8 <= 0 ? 1 : param8;
         this.mBase = param1;
         this.mFormat = param2;
         this.mWidth = param3;
         this.mHeight = param4;
         this.mMipMapping = param5;
         this.mPremultipliedAlpha = param6;
         this.mOptimizedForRenderTexture = param7;
      }
      
      override public function dispose() : void
      {
         // method body index: 1346 method index: 1346
         if(this.mBase)
         {
            this.mBase.dispose();
         }
         this.restoreOnLostContext(null);
         super.dispose();
      }
      
      public function restoreOnLostContext(param1:Object) : void
      {
         // method body index: 1347 method index: 1347
         if(this.mData == null && param1 != null)
         {
            Starling.current.addEventListener(Event.CONTEXT3D_CREATE,this.onContextCreated);
         }
         else if(param1 == null)
         {
            Starling.current.removeEventListener(Event.CONTEXT3D_CREATE,this.onContextCreated);
         }
         this.mData = param1;
      }
      
      private function onContextCreated(param1:Event) : void
      {
         // method body index: 1348 method index: 1348
         var _loc5_:flash.display3D.textures.Texture = null;
         var _loc2_:Context3D = Starling.context;
         var _loc3_:BitmapData = this.mData as BitmapData;
         var _loc4_:AtfData = this.mData as AtfData;
         if(_loc3_)
         {
            _loc5_ = _loc2_.createTexture(this.mWidth,this.mHeight,Context3DTextureFormat.BGRA,this.mOptimizedForRenderTexture);
            starling.textures.Texture.uploadBitmapData(_loc5_,_loc3_,this.mMipMapping);
         }
         else if(_loc4_)
         {
            _loc5_ = _loc2_.createTexture(_loc4_.width,_loc4_.height,_loc4_.format,this.mOptimizedForRenderTexture);
            starling.textures.Texture.uploadAtfData(_loc5_,_loc4_.data);
         }
         this.mBase = _loc5_;
      }
      
      public function get optimizedForRenderTexture() : Boolean
      {
         // method body index: 1349 method index: 1349
         return this.mOptimizedForRenderTexture;
      }
      
      override public function get base() : TextureBase
      {
         // method body index: 1350 method index: 1350
         return this.mBase;
      }
      
      override public function get root() : ConcreteTexture
      {
         // method body index: 1351 method index: 1351
         return this;
      }
      
      override public function get format() : String
      {
         // method body index: 1352 method index: 1352
         return this.mFormat;
      }
      
      override public function get width() : Number
      {
         // method body index: 1353 method index: 1353
         return this.mWidth / this.mScale;
      }
      
      override public function get height() : Number
      {
         // method body index: 1354 method index: 1354
         return this.mHeight / this.mScale;
      }
      
      override public function get nativeWidth() : Number
      {
         // method body index: 1355 method index: 1355
         return this.mWidth;
      }
      
      override public function get nativeHeight() : Number
      {
         // method body index: 1356 method index: 1356
         return this.mHeight;
      }
      
      override public function get scale() : Number
      {
         // method body index: 1357 method index: 1357
         return this.mScale;
      }
      
      override public function get mipMapping() : Boolean
      {
         // method body index: 1358 method index: 1358
         return this.mMipMapping;
      }
      
      override public function get premultipliedAlpha() : Boolean
      {
         // method body index: 1359 method index: 1359
         return this.mPremultipliedAlpha;
      }
   }
}

