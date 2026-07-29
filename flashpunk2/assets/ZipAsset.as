package flashpunk2.assets
{
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.geom.Rectangle;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   import flash.utils.ByteArray;
   import flashpunk2.global.Asset;
   import flashpunk2.global.Path;
   import flashpunk2.namespaces.fp_internal;
   import starling.textures.Texture;
   
   use namespace fp_internal;
   
   public class ZipAsset extends BaseAsset
   {
      
      // method body index: 572 method index: 572
      private static var _loader:URLLoader = // method body index: 572 method index: 572
      new URLLoader();
      
      private static var _request:URLRequest = // method body index: 572 method index: 572
      new URLRequest();
      
      private var _source:*;
      
      private var _cacheType:Class = null;
      
      private var _cachePath:String = null;
      
      private var _texture:Texture;
      
      private var _textures:Object = // method body index: 574 method index: 574
      {};
      
      private var _symbols:Vector.<ZipSymbol>;
      
      public function ZipAsset(param1:*)
      {
         // method body index: 574 method index: 574
         super();
         this._source = param1;
      }
      
      public static function loadSource(param1:*) : ZipAsset
      {
         // method body index: 573 method index: 573
         var _loc2_:ZipAsset = new ZipAsset(param1);
         _loc2_.load();
         return _loc2_;
      }
      
      override public function load() : void
      {
         // method body index: 575 method index: 575
         super.load();
         if(this._source is EmbeddedPath)
         {
            this._cacheType = EmbeddedPath(this._source).type;
            this._cachePath = EmbeddedPath(this._source).path;
            Asset.addZip(this,this._cachePath,this._cacheType);
            this.loadBytes(new this._cacheType());
         }
         else if(this._source is Class)
         {
            this._cacheType = Class(this._source);
            if(this._cachePath == null)
            {
               this._cachePath = Path.embeddedPath(this._cacheType);
            }
            Asset.addZip(this,this._cachePath,this._cacheType);
            this.loadBytes(new this._source());
         }
         else if(this._source is String)
         {
            this._cachePath = String(this._source);
            Asset.addZip(this,this._cachePath,this._cacheType);
            this.loadFromURL(this._cachePath);
         }
         else
         {
            if(!(this._source is ByteArray))
            {
               throw new Error("Invalid XML source.");
            }
            Asset.addZip(this,this._cachePath,this._cacheType);
            this.loadBytes(this._source);
         }
      }
      
      override public function dispose() : void
      {
         // method body index: 576 method index: 576
         super.dispose();
         this._cachePath = null;
         this._cacheType = null;
      }
      
      private function loadBytes(param1:ByteArray) : void
      {
         // method body index: 577 method index: 577
         var _loc5_:String = null;
         var _loc6_:Rectangle = null;
         var _loc7_:Rectangle = null;
         param1.uncompress();
         var _loc2_:BitmapData = new BitmapData(param1.readInt(),param1.readInt(),true,0);
         _loc2_.setPixels(_loc2_.rect,param1);
         this._texture = Texture.fromBitmapData(_loc2_);
         var _loc3_:* = param1.readInt();
         while(_loc3_--)
         {
            _loc5_ = param1.readUTFBytes(param1.readInt());
            _loc6_ = new Rectangle(param1.readInt(),param1.readInt(),param1.readInt(),param1.readInt());
            _loc7_ = new Rectangle(param1.readFloat(),param1.readFloat(),_loc6_.width,_loc6_.height);
            this._textures[_loc5_] = Texture.fromTexture(this._texture,_loc6_,_loc7_);
         }
         this._symbols = new Vector.<ZipSymbol>(param1.readInt());
         var _loc4_:int = 0;
         while(_loc4_ < this._symbols.length)
         {
            this._symbols[_loc4_] = new ZipSymbol(this,param1);
            _loc4_++;
         }
         loadComplete();
      }
      
      private function loadFromURL(param1:String) : void
      {
         // method body index: 578 method index: 578
         _request.url = param1;
         _loader.addEventListener(ProgressEvent.PROGRESS,this.onLoaderProgress);
         _loader.addEventListener(Event.COMPLETE,this.onLoaderComplete);
         _loader.addEventListener(IOErrorEvent.IO_ERROR,this.onLoaderError);
         _loader.load(_request);
      }
      
      private function onLoaderProgress(param1:ProgressEvent) : void
      {
         // method body index: 579 method index: 579
         loadProgress(param1.bytesLoaded / param1.bytesTotal);
      }
      
      private function onLoaderComplete(param1:Event) : void
      {
         // method body index: 580 method index: 580
         _loader.removeEventListener(ProgressEvent.PROGRESS,this.onLoaderProgress);
         _loader.removeEventListener(Event.COMPLETE,this.onLoaderComplete);
         _loader.removeEventListener(IOErrorEvent.IO_ERROR,this.onLoaderError);
         this.loadBytes(_loader.data);
      }
      
      private function onLoaderError(param1:IOErrorEvent) : void
      {
         // method body index: 581 method index: 581
         _request.url = this._cachePath;
         _loader.load(_request);
      }
      
      public function getTextureByName(param1:String) : Texture
      {
         // method body index: 582 method index: 582
         if(param1 in this._textures)
         {
            return this._textures[param1];
         }
         return null;
      }
      
      public function get symbols() : Vector.<ZipSymbol>
      {
         // method body index: 583 method index: 583
         return this._symbols;
      }
   }
}

