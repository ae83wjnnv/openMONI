package flashpunk2.assets
{
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   import flashpunk2.global.Asset;
   import flashpunk2.global.Path;
   import flashpunk2.namespaces.fp_internal;
   
   use namespace fp_internal;
   
   public class XMLAsset extends BaseAsset
   {
      
      // method body index: 157 method index: 157
      private static var _loader:URLLoader = // method body index: 157 method index: 157
      new URLLoader();
      
      private static var _request:URLRequest = // method body index: 157 method index: 157
      new URLRequest();
      
      private var _source:*;
      
      private var _xml:XML;
      
      private var _cacheType:Class = null;
      
      private var _cachePath:String = null;
      
      public function XMLAsset(param1:*)
      {
         // method body index: 159 method index: 159
         super();
         this._source = param1;
      }
      
      public static function loadSource(param1:*) : XMLAsset
      {
         // method body index: 158 method index: 158
         var _loc2_:XMLAsset = new XMLAsset(param1);
         _loc2_.load();
         return _loc2_;
      }
      
      override public function load() : void
      {
         // method body index: 160 method index: 160
         super.load();
         if(this._source is EmbeddedPath)
         {
            this._cacheType = EmbeddedPath(this._source).type;
            this._cachePath = EmbeddedPath(this._source).path;
            Asset.addXML(this,this._cachePath,this._cacheType);
            this.loadXML(XML(new this._cacheType()));
         }
         else if(this._source is Class)
         {
            this._cacheType = Class(this._source);
            if(this._cachePath == null)
            {
               this._cachePath = Path.embeddedPath(this._cacheType);
            }
            Asset.addXML(this,this._cachePath,this._cacheType);
            this.loadXML(XML(new this._cacheType()));
         }
         else if(this._source is String)
         {
            this._cachePath = String(this._source);
            Asset.addXML(this,this._cachePath,this._cacheType);
            this.loadFromURL(this._cachePath);
         }
         else
         {
            if(!(this._source is XML))
            {
               throw new Error("Invalid XML source.");
            }
            Asset.addXML(this,this._cachePath,this._cacheType);
            this.loadXML(XML(this._source));
         }
      }
      
      override public function dispose() : void
      {
         // method body index: 161 method index: 161
         super.dispose();
         this._xml = null;
         Asset.removeXML(this,this._cachePath,this._cacheType);
         this._cachePath = null;
         this._cacheType = null;
      }
      
      private function loadXML(param1:XML) : void
      {
         // method body index: 162 method index: 162
         this._xml = param1;
         loadComplete();
      }
      
      private function loadFromURL(param1:String) : void
      {
         // method body index: 163 method index: 163
         _request.url = param1;
         _loader.addEventListener(ProgressEvent.PROGRESS,this.onLoaderProgress);
         _loader.addEventListener(Event.COMPLETE,this.onLoaderComplete);
         _loader.addEventListener(IOErrorEvent.IO_ERROR,this.onLoaderError);
         _loader.load(_request);
      }
      
      private function onLoaderProgress(param1:ProgressEvent) : void
      {
         // method body index: 164 method index: 164
         loadProgress(param1.bytesLoaded / param1.bytesTotal);
      }
      
      private function onLoaderComplete(param1:Event) : void
      {
         // method body index: 165 method index: 165
         _loader.removeEventListener(ProgressEvent.PROGRESS,this.onLoaderProgress);
         _loader.removeEventListener(Event.COMPLETE,this.onLoaderComplete);
         _loader.removeEventListener(IOErrorEvent.IO_ERROR,this.onLoaderError);
         this._xml = new XML(_loader.data);
         loadComplete();
      }
      
      private function onLoaderError(param1:IOErrorEvent) : void
      {
         // method body index: 166 method index: 166
         _request.url = this._cachePath;
         _loader.load(_request);
      }
      
      public function get xml() : XML
      {
         // method body index: 167 method index: 167
         return this._xml;
      }
      
      public function get path() : String
      {
         // method body index: 168 method index: 168
         return this._cachePath;
      }
   }
}

