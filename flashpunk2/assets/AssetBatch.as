package flashpunk2.assets
{
   import com.jpexs.decompiler.flash.debugger.debugDescribeType;
   import flashpunk2.global.Asset;
   import flashpunk2.global.Path;
   import flashpunk2.namespaces.fp_internal;
   
   use namespace fp_internal;
   
   public class AssetBatch extends BaseAsset
   {
      
      private var _assets:Vector.<BaseAsset> = // method body index: 27 method index: 27
      new Vector.<BaseAsset>();
      
      private var _parsed:Vector.<BaseAsset> = // method body index: 27 method index: 27
      new Vector.<BaseAsset>();
      
      private var _loadIndex:int;
      
      private var _autoAtlas:Boolean;
      
      public function AssetBatch(param1:Boolean)
      {
         // method body index: 27 method index: 27
         super();
         this._autoAtlas = param1;
      }
      
      public static function createFromEmbedded(param1:Boolean, ... rest) : AssetBatch
      {
         // method body index: 23 method index: 23
         var _loc4_:Object = null;
         var _loc3_:AssetBatch = new AssetBatch(param1);
         for each(_loc4_ in rest)
         {
            _loc3_.addAllEmbedded(_loc4_);
         }
         return _loc3_;
      }
      
      public static function loadFromEmbedded(param1:Boolean, ... rest) : AssetBatch
      {
         // method body index: 24 method index: 24
         var _loc4_:Object = null;
         var _loc3_:AssetBatch = new AssetBatch(param1);
         for each(_loc4_ in rest)
         {
            _loc3_.addAllEmbedded(_loc4_);
         }
         _loc3_.load();
         return _loc3_;
      }
      
      public static function createFromPaths(param1:Boolean, ... rest) : AssetBatch
      {
         // method body index: 25 method index: 25
         var _loc4_:* = undefined;
         var _loc3_:AssetBatch = new AssetBatch(param1);
         for each(_loc4_ in rest)
         {
            if(_loc4_ is String)
            {
               _loc3_.addExternal(_loc4_);
            }
            else
            {
               if(!(_loc4_ is Class))
               {
                  throw new Error("Invalid path: " + _loc4_);
               }
               _loc3_.addEmbedded(_loc4_);
            }
         }
         return _loc3_;
      }
      
      public static function loadFromPaths(... rest) : AssetBatch
      {
         // method body index: 26 method index: 26
         var _loc2_:AssetBatch = createFromPaths.apply(null,rest);
         _loc2_.load();
         return _loc2_;
      }
      
      public function add(param1:BaseAsset) : void
      {
         // method body index: 28 method index: 28
         if(loaded)
         {
            throw new Error("Cannot add assets after the batch is loaded.");
         }
         this._assets.push(param1);
      }
      
      public function remove(param1:BaseAsset) : void
      {
         // method body index: 29 method index: 29
         if(loaded)
         {
            throw new Error("Cannot remove assets after the atch is loaded.");
         }
         this._assets.splice(this._assets.indexOf(param1),1);
      }
      
      public function addExternal(param1:String) : void
      {
         // method body index: 30 method index: 30
         this.parseAsset(null,param1);
      }
      
      public function addEmbedded(param1:Class) : void
      {
         // method body index: 31 method index: 31
         this.parseAsset(param1,Path.embeddedPath(param1));
      }
      
      public function addAllEmbedded(param1:Object) : void
      {
         // method body index: 32 method index: 32
         var _loc3_:XML = null;
         var _loc2_:XML = debugDescribeType(param1);
         for each(_loc3_ in _loc2_.constant)
         {
            this.addEmbeddedConstant(param1,_loc3_);
         }
      }
      
      private function loadAtlas(param1:XMLAsset) : void
      {
         // method body index: 33 method index: 33
         var _loc2_:String = null;
         if(param1.xml.name() == "TextureAtlas")
         {
            _loc2_ = Path.fileNameWithoutExtension(param1.xml.@imagePath);
            if(!Asset.hasImageName(_loc2_))
            {
               throw new Error("Failed to auto atlas, required image was not loaded first: " + String(param1.xml.@imagePath));
            }
            this._assets.splice(this._loadIndex + 1,0,new AtlasAsset(_loc2_,param1.path));
         }
      }
      
      private function addEmbeddedConstant(param1:Object, param2:XML) : void
      {
         // method body index: 34 method index: 34
         var _loc3_:XML = null;
         var _loc4_:XML = null;
         if(param2.@type == "Class")
         {
            for each(_loc3_ in param2.metadata)
            {
               if(_loc3_.@name == "Embed")
               {
                  for each(_loc4_ in _loc3_.arg)
                  {
                     if(_loc4_.@key == "source")
                     {
                        this.parseAsset(param1[param2.@name],_loc4_.@value);
                     }
                  }
               }
            }
         }
         else if(param2.@type == "String")
         {
            this.parseAsset(null,param1[param2.@name]);
         }
      }
      
      private function parseAsset(param1:Class, param2:String) : void
      {
         // method body index: 35 method index: 35
         switch(Path.extension(param2))
         {
            case "png":
            case "jpg":
               if(param1 != null)
               {
                  this._parsed.push(new ImageAsset(new EmbeddedPath(param1,param2)));
               }
               else
               {
                  this._parsed.push(new ImageAsset(param2));
               }
               break;
            case "xml":
            case "oel":
            case "fnt":
               if(param1 != null)
               {
                  this._parsed.push(new XMLAsset(new EmbeddedPath(param1,param2)));
               }
               else
               {
                  this._parsed.push(new XMLAsset(param2));
               }
               break;
            case "zip":
               if(param1 != null)
               {
                  this._parsed.push(new ZipAsset(new EmbeddedPath(param1,param2)));
               }
               else
               {
                  this._parsed.push(new ZipAsset(param2));
               }
               break;
            case "ttf":
         }
      }
      
      override public function load() : void
      {
         // method body index: 36 method index: 36
         var _loc1_:BaseAsset = null;
         super.load();
         this._parsed.sort(this.compareAssets);
         for each(_loc1_ in this._parsed)
         {
            this._assets.push(_loc1_);
         }
         this._parsed.length = 0;
         this._loadIndex = -1;
         this.loadNext();
      }
      
      override public function dispose() : void
      {
         // method body index: 37 method index: 37
         var _loc1_:BaseAsset = null;
         super.dispose();
         this._loadIndex = 0;
         for each(_loc1_ in this._assets)
         {
            _loc1_.dispose();
         }
      }
      
      private function compareAssets(param1:BaseAsset, param2:BaseAsset) : int
      {
         // method body index: 38 method index: 38
         if(param1 is XMLAsset)
         {
            return 1;
         }
         if(param2 is XMLAsset)
         {
            return -1;
         }
         return 0;
      }
      
      private function loadNext() : void
      {
         // method body index: 39 method index: 39
         if(this._loadIndex >= 0)
         {
            this._assets[this._loadIndex].ON_LOAD_PROGRESS.remove(this.onLoadProgress);
            this._assets[this._loadIndex].ON_LOAD_COMPLETE.remove(this.loadNext);
            if(this._autoAtlas && this._assets[this._loadIndex] is XMLAsset)
            {
               this.loadAtlas(XMLAsset(this._assets[this._loadIndex]));
            }
         }
         ++this._loadIndex;
         if(this._loadIndex < this._assets.length)
         {
            this._assets[this._loadIndex].ON_LOAD_PROGRESS.add(this.onLoadProgress);
            this._assets[this._loadIndex].ON_LOAD_COMPLETE.add(this.loadNext);
            this._assets[this._loadIndex].load();
         }
         else
         {
            loadComplete();
         }
      }
      
      private function onLoadProgress() : void
      {
         // method body index: 40 method index: 40
         var _loc1_:Number = (Number(this._loadIndex) + this._assets[this._loadIndex].percentLoaded) / this._assets.length;
         loadProgress(_loc1_);
      }
   }
}

