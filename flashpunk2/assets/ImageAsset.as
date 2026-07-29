package flashpunk2.assets
{
   import com.jpexs.decompiler.flash.debugger.DebugLoader;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.geom.Matrix;
   import flash.geom.Rectangle;
   import flash.net.URLRequest;
   import flashpunk2.global.Asset;
   import flashpunk2.global.Path;
   import flashpunk2.namespaces.fp_internal;
   import starling.textures.Texture;
   
   use namespace fp_internal;
   
   public class ImageAsset extends BaseAsset
   {
      
      // method body index: 604 method index: 604
      private static var _drawMatrix:Matrix = // method body index: 604 method index: 604
      new Matrix();
      
      private static var _loader:DebugLoader = // method body index: 604 method index: 604
      new DebugLoader();
      
      private static var _request:URLRequest = // method body index: 604 method index: 604
      new URLRequest();
      
      private var _source:*;
      
      private var _texture:Texture;
      
      private var _cachePath:String = null;
      
      private var _cacheType:Class = null;
      
      public function ImageAsset(param1:*)
      {
         // method body index: 606 method index: 606
         super();
         this._source = param1;
      }
      
      public static function loadSource(param1:*) : ImageAsset
      {
         // method body index: 605 method index: 605
         var _loc2_:ImageAsset = new ImageAsset(param1);
         _loc2_.load();
         return _loc2_;
      }
      
      override public function load() : void
      {
         // method body index: 607 method index: 607
         super.load();
         if(this._source is EmbeddedPath)
         {
            this._cacheType = EmbeddedPath(this._source).type;
            this._cachePath = EmbeddedPath(this._source).path;
            Asset.addImage(this,this._cachePath,this._cacheType);
            this.loadFromObject(new this._cacheType());
         }
         else if(this._source is Class)
         {
            this._cacheType = Class(this._source);
            if(this._cachePath == null)
            {
               this._cachePath = Path.embeddedPath(this._cacheType);
            }
            Asset.addImage(this,this._cachePath,this._cacheType);
            this.loadFromObject(new this._cacheType());
         }
         else if(this._source is String)
         {
            this._cachePath = String(this._source);
            Asset.addImage(this,this._cachePath,this._cacheType);
            this.loadFromURL(this._cachePath);
         }
         else
         {
            Asset.addImage(this,this._cachePath,this._cacheType);
            this.loadFromObject(this._source);
         }
      }
      
      override public function dispose() : void
      {
         // method body index: 608 method index: 608
         super.dispose();
         this._texture.dispose();
         this._texture = null;
         Asset.removeImage(this,this._cachePath,this._cacheType);
         this._cachePath = null;
         this._cacheType = null;
      }
      
      private function loadFromObject(param1:Object) : void
      {
         // method body index: 609 method index: 609
         var _loc2_:DisplayObject = null;
         var _loc3_:Rectangle = null;
         var _loc4_:BitmapData = null;
         if(param1 is BitmapData)
         {
            this._texture = Texture.fromBitmapData(BitmapData(param1));
         }
         else if(param1 is Bitmap)
         {
            this._texture = Texture.fromBitmap(Bitmap(param1));
         }
         else
         {
            if(!(param1 is DisplayObject))
            {
               throw new Error("Invalid source object.");
            }
            _loc2_ = DisplayObject(param1);
            _loc3_ = _loc2_.getBounds(_loc2_);
            _drawMatrix.tx = _loc3_.x;
            _drawMatrix.ty = _loc3_.y;
            _loc4_ = new BitmapData(_loc3_.width,_loc3_.height,true,0);
            _loc4_.draw(_loc2_,_drawMatrix);
            this._texture = Texture.fromBitmapData(_loc4_);
         }
         loadComplete();
      }
      
      private function loadFromURL(param1:String) : void
      {
         // method body index: 610 method index: 610
         _request.url = param1;
         _loader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS,this.onLoaderProgress);
         _loader.contentLoaderInfo.addEventListener(Event.COMPLETE,this.onLoaderComplete);
         _loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,this.onLoaderError);
         _loader.load(_request);
      }
      
      private function onLoaderProgress(param1:ProgressEvent) : void
      {
         // method body index: 611 method index: 611
         loadProgress(param1.bytesLoaded / param1.bytesTotal);
      }
      
      private function onLoaderComplete(param1:Event) : void
      {
         // method body index: 612 method index: 612
         _loader.contentLoaderInfo.removeEventListener(ProgressEvent.PROGRESS,this.onLoaderProgress);
         _loader.contentLoaderInfo.removeEventListener(Event.COMPLETE,this.onLoaderComplete);
         _loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR,this.onLoaderError);
         this._texture = Texture.fromBitmap(Bitmap(_loader.content));
         _loader.unload();
         loadComplete();
      }
      
      private function onLoaderError(param1:IOErrorEvent) : void
      {
         // method body index: 613 method index: 613
         _request.url = this._cachePath;
         _loader.load(_request);
      }
      
      public function get texture() : Texture
      {
         // method body index: 614 method index: 614
         if(!loaded)
         {
            throw new Error("Asset is not loaded.");
         }
         return this._texture;
      }
      
      public function get path() : String
      {
         // method body index: 615 method index: 615
         return this._cachePath;
      }
      
      public function get type() : Class
      {
         // method body index: 616 method index: 616
         return this._cacheType;
      }
   }
}

