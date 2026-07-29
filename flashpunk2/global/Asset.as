package flashpunk2.global
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.utils.Dictionary;
   import flashpunk2.assets.BaseAsset;
   import flashpunk2.assets.ImageAsset;
   import flashpunk2.assets.XMLAsset;
   import flashpunk2.assets.ZipAsset;
   import flashpunk2.namespaces.fp_internal;
   import starling.textures.Texture;
   
   use namespace fp_internal;
   
   public final class Asset
   {
      
      // method body index: 225 method index: 225
      private static var _loadedAssets:Vector.<BaseAsset> = // method body index: 225 method index: 225
      new Vector.<BaseAsset>();
      
      private static var _imagePathLookup:Object = // method body index: 225 method index: 225
      {};
      
      private static var _imageTypeLookup:Dictionary = // method body index: 225 method index: 225
      new Dictionary();
      
      private static var _imageNameLookup:Object = // method body index: 225 method index: 225
      {};
      
      private static var _xmlPathLookup:Object = // method body index: 225 method index: 225
      {};
      
      private static var _xmlTypeLookup:Dictionary = // method body index: 225 method index: 225
      new Dictionary();
      
      private static var _zipPathLookup:Object = // method body index: 225 method index: 225
      {};
      
      private static var _zipTypeLookup:Dictionary = // method body index: 225 method index: 225
      new Dictionary();
      
      private static var _zipNameLookup:Object = // method body index: 225 method index: 225
      {};
      
      private static var _subTextureLookup:Object = // method body index: 225 method index: 225
      {};
      
      public function Asset()
      {
         // method body index: 258 method index: 258
         super();
      }
      
      fp_internal static function addImage(param1:ImageAsset, param2:String, param3:Class) : void
      {
         // method body index: 226 method index: 226
         _loadedAssets.push(param1);
         if(param2 != null)
         {
            _imagePathLookup[param2] = param1;
            _imageNameLookup[Path.fileNameWithoutExtension(param2)] = param1;
         }
         if(param3 != null)
         {
            _imageTypeLookup[param3] = param1;
         }
      }
      
      fp_internal static function removeImage(param1:ImageAsset, param2:String, param3:Class) : void
      {
         // method body index: 227 method index: 227
         _loadedAssets.splice(_loadedAssets.indexOf(param1),1);
         if(param2 != null)
         {
            delete _imagePathLookup[param2];
            delete _imageNameLookup[Path.fileNameWithoutExtension(param2)];
         }
         if(param3 != null)
         {
            delete _imageTypeLookup[param3];
         }
      }
      
      fp_internal static function addXML(param1:XMLAsset, param2:String, param3:Class) : void
      {
         // method body index: 228 method index: 228
         _loadedAssets.push(param1);
         if(param2 != null)
         {
            _xmlPathLookup[param2] = param1;
         }
         if(param3 != null)
         {
            _xmlTypeLookup[param3] = param1;
         }
      }
      
      fp_internal static function removeXML(param1:XMLAsset, param2:String, param3:Class) : void
      {
         // method body index: 229 method index: 229
         _loadedAssets.splice(_loadedAssets.indexOf(param1),1);
         if(param2 != null)
         {
            delete _imagePathLookup[param2];
         }
         if(param3 != null)
         {
            delete _imageTypeLookup[param3];
         }
      }
      
      fp_internal static function addZip(param1:ZipAsset, param2:String, param3:Class) : void
      {
         // method body index: 230 method index: 230
         _loadedAssets.push(param1);
         if(param2 != null)
         {
            _zipPathLookup[param2] = param1;
            _zipNameLookup[Path.fileNameWithoutExtension(param2)] = param1;
         }
         if(param3 != null)
         {
            _zipTypeLookup[param3] = param1;
         }
      }
      
      fp_internal static function removeZip(param1:ZipAsset, param2:String, param3:Class) : void
      {
         // method body index: 231 method index: 231
         _loadedAssets.splice(_loadedAssets.indexOf(param1),1);
         if(param2 != null)
         {
            delete _zipPathLookup[param2];
            delete _zipNameLookup[Path.fileNameWithoutExtension(param2)];
         }
         if(param3 != null)
         {
            delete _zipTypeLookup[param3];
         }
      }
      
      fp_internal static function addSubTexture(param1:String, param2:Texture) : void
      {
         // method body index: 232 method index: 232
         if(param1 in _subTextureLookup)
         {
            throw new Error("Multiple sub-textures with the same name: " + param1);
         }
         _subTextureLookup[param1] = param2;
      }
      
      fp_internal static function removeSubTexture(param1:String) : void
      {
         // method body index: 233 method index: 233
         delete _subTextureLookup[param1];
      }
      
      public static function disposeAll() : void
      {
         // method body index: 234 method index: 234
         while(_loadedAssets.length > 0)
         {
            _loadedAssets[_loadedAssets.length - 1].dispose();
         }
      }
      
      public static function getImageByPath(param1:String) : ImageAsset
      {
         // method body index: 235 method index: 235
         if(!(param1 in _imagePathLookup))
         {
            throw new Error("Image not loaded: " + param1);
         }
         return _imagePathLookup[param1];
      }
      
      public static function hasImagePath(param1:String) : Boolean
      {
         // method body index: 236 method index: 236
         return param1 in _imagePathLookup;
      }
      
      public static function getImageByType(param1:Class) : ImageAsset
      {
         // method body index: 237 method index: 237
         if(!(param1 in _imageTypeLookup))
         {
            throw new Error("Image not loaded: " + param1);
         }
         return _imageTypeLookup[param1];
      }
      
      public static function hasImageType(param1:Class) : Boolean
      {
         // method body index: 238 method index: 238
         return param1 in _imageTypeLookup;
      }
      
      public static function getImageByName(param1:String) : ImageAsset
      {
         // method body index: 239 method index: 239
         if(!(param1 in _imageNameLookup))
         {
            throw new Error("Image not loaded: " + param1);
         }
         return _imageNameLookup[param1];
      }
      
      public static function hasImageName(param1:String) : Boolean
      {
         // method body index: 240 method index: 240
         return param1 in _imageNameLookup;
      }
      
      public static function getXMLByPath(param1:String) : XMLAsset
      {
         // method body index: 241 method index: 241
         if(!(param1 in _xmlPathLookup))
         {
            throw new Error("XML not loaded: " + param1);
         }
         return _xmlPathLookup[param1];
      }
      
      public static function hasXMLPath(param1:String) : Boolean
      {
         // method body index: 242 method index: 242
         return param1 in _xmlPathLookup;
      }
      
      public static function getXMLByType(param1:Class) : XMLAsset
      {
         // method body index: 243 method index: 243
         if(!(param1 in _xmlTypeLookup))
         {
            throw new Error("XML not loaded: " + param1);
         }
         return _xmlTypeLookup[param1];
      }
      
      public static function hasXMLType(param1:Class) : Boolean
      {
         // method body index: 244 method index: 244
         return param1 in _xmlTypeLookup;
      }
      
      public static function getZipByPath(param1:String) : ZipAsset
      {
         // method body index: 245 method index: 245
         if(!(param1 in _zipPathLookup))
         {
            throw new Error("Zip not loaded: " + param1);
         }
         return _zipPathLookup[param1];
      }
      
      public static function hasZipPath(param1:String) : Boolean
      {
         // method body index: 246 method index: 246
         return param1 in _zipPathLookup;
      }
      
      public static function getZipByType(param1:Class) : ZipAsset
      {
         // method body index: 247 method index: 247
         if(!(param1 in _zipTypeLookup))
         {
            throw new Error("Zip not loaded: " + param1);
         }
         return _zipTypeLookup[param1];
      }
      
      public static function hasZipType(param1:Class) : Boolean
      {
         // method body index: 248 method index: 248
         return param1 in _zipTypeLookup;
      }
      
      public static function getZipByName(param1:String) : ZipAsset
      {
         // method body index: 249 method index: 249
         if(!(param1 in _zipNameLookup))
         {
            throw new Error("Zip not loaded: " + param1);
         }
         return _zipNameLookup[param1];
      }
      
      public static function hasZipName(param1:String) : Boolean
      {
         // method body index: 250 method index: 250
         return param1 in _zipNameLookup;
      }
      
      public static function getSubTextureByName(param1:String) : Texture
      {
         // method body index: 251 method index: 251
         if(!(param1 in _subTextureLookup))
         {
            throw new Error("Sub-texture not loaded: " + param1);
         }
         return _subTextureLookup[param1];
      }
      
      public static function hasSubTextureName(param1:String) : Boolean
      {
         // method body index: 252 method index: 252
         return param1 in _subTextureLookup;
      }
      
      public static function getSubTexturesByPrefix(param1:String, param2:Vector.<String> = null) : Vector.<String>
      {
         // method body index: 253 method index: 253
         var _loc3_:* = 0;
         if(param2 == null)
         {
            param2 = new Vector.<String>();
         }
         if(param1 + "0000" in _subTextureLookup)
         {
            _loc3_ = 0;
         }
         else
         {
            if(!(param1 + "0001" in _subTextureLookup))
            {
               throw new Error("No sub-textures exist with the prefix: " + param1);
            }
            _loc3_ = 1;
         }
         var _loc4_:String = param1 + "000" + _loc3_;
         do
         {
            param2.push(_loc4_);
         }
         while(_loc4_ = param1 + Str.pad(String(_loc3_++),"0",4), _loc4_ in _subTextureLookup);
         return param2;
      }
      
      public static function getSubTexturesByPrefixRange(param1:String, param2:uint, param3:uint, param4:Vector.<String> = null) : Vector.<String>
      {
         // method body index: 254 method index: 254
         var _loc5_:String = null;
         if(param4 == null)
         {
            param4 = new Vector.<String>();
         }
         var _loc6_:int = param2 + param3;
         var _loc7_:int = int(param2);
         while(_loc7_ < _loc6_)
         {
            _loc5_ = param1 + Str.pad(String(_loc7_),"0",4);
            if(!(_loc5_ in _subTextureLookup))
            {
               throw new Error("No sub-textures exist with the name: " + _loc5_);
            }
            param4.push(_loc5_);
            _loc7_++;
         }
         return param4;
      }
      
      public static function getTextureFromSource(param1:*) : Texture
      {
         // method body index: 255 method index: 255
         var _loc2_:Texture = null;
         if(param1 is Class)
         {
            if(hasImageType(param1))
            {
               _loc2_ = getImageByType(param1).texture;
            }
            else
            {
               _loc2_ = ImageAsset.loadSource(param1).texture;
            }
         }
         else if(param1 is String)
         {
            if(Path.isURL(param1))
            {
               if(!hasImagePath(param1))
               {
                  throw new Error("Invalid image path: " + String(param1));
               }
               _loc2_ = getImageByPath(param1).texture;
            }
            else if(hasSubTextureName(param1))
            {
               _loc2_ = getSubTextureByName(param1);
            }
            else
            {
               if(!hasImageName(param1))
               {
                  throw new Error("Sub-texture does not exist: " + String(param1));
               }
               _loc2_ = getImageByName(param1).texture;
            }
         }
         else if(param1 is Bitmap)
         {
            _loc2_ = Texture.fromBitmap(param1);
         }
         else if(param1 is BitmapData)
         {
            _loc2_ = Texture.fromBitmapData(param1);
         }
         else if(param1 is Texture)
         {
            _loc2_ = Texture(param1);
         }
         else
         {
            if(!(param1 is ImageAsset))
            {
               throw new Error("Invalid image source.");
            }
            _loc2_ = ImageAsset(param1).texture;
         }
         return _loc2_;
      }
      
      public static function getXMLFromSource(param1:*) : XML
      {
         // method body index: 256 method index: 256
         if(param1 is Class)
         {
            if(hasXMLType(param1))
            {
               return getXMLByType(param1).xml;
            }
            return XMLAsset.loadSource(param1).xml;
         }
         if(param1 is String)
         {
            if(Path.isURL(param1))
            {
               return getXMLByPath(param1).xml;
            }
            throw new Error("XML asset does not exist: " + String(param1));
         }
         if(param1 is XMLAsset)
         {
            return XMLAsset(param1).xml;
         }
         throw new Error("Invalid XML source.");
      }
      
      public static function getZipFromSource(param1:*) : ZipAsset
      {
         // method body index: 257 method index: 257
         var _loc2_:ZipAsset = null;
         if(param1 is Class)
         {
            if(hasZipType(param1))
            {
               _loc2_ = getZipByType(param1);
            }
            else
            {
               _loc2_ = ZipAsset.loadSource(param1);
            }
         }
         else if(param1 is String)
         {
            if(Path.isURL(param1))
            {
               if(!hasZipPath(param1))
               {
                  throw new Error("Invalid zip path: " + String(param1));
               }
               _loc2_ = getZipByPath(param1);
            }
            else
            {
               if(!hasZipName(param1))
               {
                  throw new Error("Zip does not exist: " + String(param1));
               }
               _loc2_ = getZipByName(param1);
            }
         }
         else
         {
            if(!(param1 is ZipAsset))
            {
               throw new Error("Invalid zip source.");
            }
            _loc2_ = ZipAsset(param1);
         }
         return _loc2_;
      }
   }
}

