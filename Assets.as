package
{
   import flash.display.Bitmap;
   import flash.utils.ByteArray;
   import flashpunk2.assets.XMLAsset;
   import flashpunk2.global.Asset;
   import starling.text.BitmapFont;
   import starling.text.TextField;
   import starling.textures.Texture;
   
   public class Assets
   {
      
      private static var font:BitmapFont;
      
      // method body index: 5 method index: 5
      [Embed(source="../assets/atlas0.png")]
      public static const ATLAS_PNG:Class = // method body index: 5 method index: 5
      Assets_ATLAS_PNG;
      
      [Embed(source="../assets/atlas0.xml",mimeType="application/octet-stream")]
      public static const ATLAS_XML:Class = // method body index: 5 method index: 5
      Assets_ATLAS_XML;
      
      [Embed(source="../assets/atlas1.png")]
      public static const ATLAS1_PNG:Class = // method body index: 5 method index: 5
      Assets_ATLAS1_PNG;
      
      [Embed(source="../assets/atlas1.xml",mimeType="application/octet-stream")]
      public static const ATLAS1_XML:Class = // method body index: 5 method index: 5
      Assets_ATLAS1_XML;
      
      [Embed(source="../assets/atlas_menu0.png")]
      public static const ATLAS_MENU_PNG:Class = // method body index: 5 method index: 5
      Assets_ATLAS_MENU_PNG;
      
      [Embed(source="../assets/atlas_menu0.xml",mimeType="application/octet-stream")]
      public static const ATLAS_MENU_XML:Class = // method body index: 5 method index: 5
      Assets_ATLAS_MENU_XML;
      
      [Embed(source="../assets/atlas_menu1.png")]
      public static const ATLAS_MENU_PNG1:Class = // method body index: 5 method index: 5
      Assets_ATLAS_MENU_PNG1;
      
      [Embed(source="../assets/atlas_menu1.xml",mimeType="application/octet-stream")]
      public static const ATLAS_MENU_XML2:Class = // method body index: 5 method index: 5
      Assets_ATLAS_MENU_XML2;
      
      [Embed(source="../assets/ShopData.xml",mimeType="application/octet-stream")]
      public static const SHOP_XML:Class = // method body index: 5 method index: 5
      Assets_SHOP_XML;
      
      [Embed(source="../assets/Cutscenes.xml",mimeType="application/octet-stream")]
      public static const CUTSCENES_XML:Class = // method body index: 5 method index: 5
      Assets_CUTSCENES_XML;
      
      [Embed(source="../assets/TileData.xml",mimeType="application/octet-stream")]
      public static const TILE_DATA:Class = // method body index: 5 method index: 5
      Assets_TILE_DATA;
      
      [Embed(source="../assets/BgTileData.xml",mimeType="application/octet-stream")]
      public static const BG_TILE_DATA:Class = // method body index: 5 method index: 5
      Assets_BG_TILE_DATA;
      
      [Embed(source="../assets/level/lv1_0.oel",mimeType="application/octet-stream")]
      public static const lv1_0:Class = // method body index: 5 method index: 5
      Assets_lv1_0;
      
      [Embed(source="../assets/level/lv1_1.oel",mimeType="application/octet-stream")]
      public static const lv1_1:Class = // method body index: 5 method index: 5
      Assets_lv1_1;
      
      [Embed(source="../assets/level/lv1_31.oel",mimeType="application/octet-stream")]
      public static const lv1_31:Class = // method body index: 5 method index: 5
      Assets_lv1_31;
      
      [Embed(source="../assets/level/lv1_32.oel",mimeType="application/octet-stream")]
      public static const lv1_32:Class = // method body index: 5 method index: 5
      Assets_lv1_32;
      
      [Embed(source="../assets/level/lv1_41.oel",mimeType="application/octet-stream")]
      public static const lv1_41:Class = // method body index: 5 method index: 5
      Assets_lv1_41;
      
      [Embed(source="../assets/level/lv1_51.oel",mimeType="application/octet-stream")]
      public static const lv1_51:Class = // method body index: 5 method index: 5
      Assets_lv1_51;
      
      [Embed(source="../assets/level/lv1_61.oel",mimeType="application/octet-stream")]
      public static const lv1_61:Class = // method body index: 5 method index: 5
      Assets_lv1_61;
      
      [Embed(source="../assets/level/lv1_62.oel",mimeType="application/octet-stream")]
      public static const lv1_62:Class = // method body index: 5 method index: 5
      Assets_lv1_62;
      
      [Embed(source="../assets/level/lv1_81.oel",mimeType="application/octet-stream")]
      public static const lv1_81:Class = // method body index: 5 method index: 5
      Assets_lv1_81;
      
      [Embed(source="../assets/level/lv1_91.oel",mimeType="application/octet-stream")]
      public static const lv1_91:Class = // method body index: 5 method index: 5
      Assets_lv1_91;
      
      [Embed(source="../assets/level/lv1_92.oel",mimeType="application/octet-stream")]
      public static const lv1_92:Class = // method body index: 5 method index: 5
      Assets_lv1_92;
      
      [Embed(source="../assets/level/lv2_1.oel",mimeType="application/octet-stream")]
      public static const lv2_1:Class = // method body index: 5 method index: 5
      Assets_lv2_1;
      
      [Embed(source="../assets/level/lv2_11.oel",mimeType="application/octet-stream")]
      public static const lv2_11:Class = // method body index: 5 method index: 5
      Assets_lv2_11;
      
      [Embed(source="../assets/level/lv2_2.oel",mimeType="application/octet-stream")]
      public static const lv2_2:Class = // method body index: 5 method index: 5
      Assets_lv2_2;
      
      [Embed(source="../assets/level/lv2_3.oel",mimeType="application/octet-stream")]
      public static const lv2_3:Class = // method body index: 5 method index: 5
      Assets_lv2_3;
      
      [Embed(source="../assets/level/lv2_41.oel",mimeType="application/octet-stream")]
      public static const lv2_41:Class = // method body index: 5 method index: 5
      Assets_lv2_41;
      
      [Embed(source="../assets/level/lv2_42.oel",mimeType="application/octet-stream")]
      public static const lv2_42:Class = // method body index: 5 method index: 5
      Assets_lv2_42;
      
      [Embed(source="../assets/level/lv2_51.oel",mimeType="application/octet-stream")]
      public static const lv2_51:Class = // method body index: 5 method index: 5
      Assets_lv2_51;
      
      [Embed(source="../assets/level/lv2_52.oel",mimeType="application/octet-stream")]
      public static const lv2_52:Class = // method body index: 5 method index: 5
      Assets_lv2_52;
      
      [Embed(source="../assets/level/lv2_60.oel",mimeType="application/octet-stream")]
      public static const lv2_60:Class = // method body index: 5 method index: 5
      Assets_lv2_60;
      
      [Embed(source="../assets/level/lv2_61.oel",mimeType="application/octet-stream")]
      public static const lv2_61:Class = // method body index: 5 method index: 5
      Assets_lv2_61;
      
      [Embed(source="../assets/level/lv2_62.oel",mimeType="application/octet-stream")]
      public static const lv2_62:Class = // method body index: 5 method index: 5
      Assets_lv2_62;
      
      [Embed(source="../assets/level/lv2_63.oel",mimeType="application/octet-stream")]
      public static const lv2_63:Class = // method body index: 5 method index: 5
      Assets_lv2_63;
      
      [Embed(source="../assets/level/lv2_64.oel",mimeType="application/octet-stream")]
      public static const lv2_64:Class = // method body index: 5 method index: 5
      Assets_lv2_64;
      
      [Embed(source="../assets/level/lv2_65.oel",mimeType="application/octet-stream")]
      public static const lv2_65:Class = // method body index: 5 method index: 5
      Assets_lv2_65;
      
      [Embed(source="../assets/level/lv2_71.oel",mimeType="application/octet-stream")]
      public static const lv2_71:Class = // method body index: 5 method index: 5
      Assets_lv2_71;
      
      [Embed(source="../assets/level/lv2_81.oel",mimeType="application/octet-stream")]
      public static const lv2_81:Class = // method body index: 5 method index: 5
      Assets_lv2_81;
      
      [Embed(source="../assets/level/lv2_91.oel",mimeType="application/octet-stream")]
      public static const lv2_91:Class = // method body index: 5 method index: 5
      Assets_lv2_91;
      
      [Embed(source="../assets/level/lv2_92.oel",mimeType="application/octet-stream")]
      public static const lv2_92:Class = // method body index: 5 method index: 5
      Assets_lv2_92;
      
      [Embed(source="../assets/level/lv3_1.oel",mimeType="application/octet-stream")]
      public static const lv3_1:Class = // method body index: 5 method index: 5
      Assets_lv3_1;
      
      [Embed(source="../assets/level/lv3_21.oel",mimeType="application/octet-stream")]
      public static const lv3_21:Class = // method body index: 5 method index: 5
      Assets_lv3_21;
      
      [Embed(source="../assets/level/lv3_22.oel",mimeType="application/octet-stream")]
      public static const lv3_22:Class = // method body index: 5 method index: 5
      Assets_lv3_22;
      
      [Embed(source="../assets/level/lv3_23.oel",mimeType="application/octet-stream")]
      public static const lv3_23:Class = // method body index: 5 method index: 5
      Assets_lv3_23;
      
      [Embed(source="../assets/level/lv3_24.oel",mimeType="application/octet-stream")]
      public static const lv3_24:Class = // method body index: 5 method index: 5
      Assets_lv3_24;
      
      [Embed(source="../assets/level/lv3_25.oel",mimeType="application/octet-stream")]
      public static const lv3_25:Class = // method body index: 5 method index: 5
      Assets_lv3_25;
      
      [Embed(source="../assets/level/lv3_26.oel",mimeType="application/octet-stream")]
      public static const lv3_26:Class = // method body index: 5 method index: 5
      Assets_lv3_26;
      
      [Embed(source="../assets/level/lv3_27.oel",mimeType="application/octet-stream")]
      public static const lv3_27:Class = // method body index: 5 method index: 5
      Assets_lv3_27;
      
      [Embed(source="../assets/level/lv3_28.oel",mimeType="application/octet-stream")]
      public static const lv3_28:Class = // method body index: 5 method index: 5
      Assets_lv3_28;
      
      [Embed(source="../assets/level/lv3_31.oel",mimeType="application/octet-stream")]
      public static const lv3_31:Class = // method body index: 5 method index: 5
      Assets_lv3_31;
      
      [Embed(source="../assets/level/lv3_32.oel",mimeType="application/octet-stream")]
      public static const lv3_32:Class = // method body index: 5 method index: 5
      Assets_lv3_32;
      
      [Embed(source="../assets/level/lv3_33.oel",mimeType="application/octet-stream")]
      public static const lv3_33:Class = // method body index: 5 method index: 5
      Assets_lv3_33;
      
      [Embed(source="../assets/level/lv3_34.oel",mimeType="application/octet-stream")]
      public static const lv3_34:Class = // method body index: 5 method index: 5
      Assets_lv3_34;
      
      [Embed(source="../assets/level/lv3_4.oel",mimeType="application/octet-stream")]
      public static const lv3_4:Class = // method body index: 5 method index: 5
      Assets_lv3_4;
      
      [Embed(source="../assets/level/lv3_5.oel",mimeType="application/octet-stream")]
      public static const lv3_5:Class = // method body index: 5 method index: 5
      Assets_lv3_5;
      
      [Embed(source="../assets/level/lv3_61.oel",mimeType="application/octet-stream")]
      public static const lv3_61:Class = // method body index: 5 method index: 5
      Assets_lv3_61;
      
      [Embed(source="../assets/level/lv3_7.oel",mimeType="application/octet-stream")]
      public static const lv3_7:Class = // method body index: 5 method index: 5
      Assets_lv3_7;
      
      [Embed(source="../assets/level/lv3_91.oel",mimeType="application/octet-stream")]
      public static const lv3_91:Class = // method body index: 5 method index: 5
      Assets_lv3_91;
      
      [Embed(source="../assets/SpriteData.xml",mimeType="application/octet-stream")]
      public static const SPRITE_DATA:Class = // method body index: 5 method index: 5
      Assets_SPRITE_DATA;
      
      private static var LOAD_EXTERNAL_FILES:Boolean = // method body index: 5 method index: 5
      false;
      
      [Embed(source="../assets/misc/font_0.png")]
      public static const FONT_MINI:Class = // method body index: 5 method index: 5
      Assets_FONT_MINI;
      
      [Embed(source="../assets/misc/font.fnt",mimeType="application/octet-stream")]
      public static const FONT_MINI_XML:Class = // method body index: 5 method index: 5
      Assets_FONT_MINI_XML;
      
      public function Assets()
      {
         // method body index: 10 method index: 10
         super();
      }
      
      public static function getXML(param1:String) : XML
      {
         // method body index: 6 method index: 6
         var _loc2_:XML = null;
         if(LOAD_EXTERNAL_FILES)
         {
            if(_loc2_ != null)
            {
               return _loc2_;
            }
            throw new Error("Level file not found: " + param1);
         }
         return Asset.getXMLByType(Assets[param1]).xml;
      }
      
      private static function readXML(param1:Object) : XML
      {
         // method body index: 7 method index: 7
         var _loc2_:ByteArray = ByteArray(param1);
         return XML(_loc2_.readUTFBytes(_loc2_.length));
      }
      
      public static function addBitmapFont() : void
      {
         // method body index: 8 method index: 8
         var _loc1_:Object = new FONT_MINI();
         var _loc2_:Texture = Texture.fromBitmap(_loc1_ as Bitmap,false,false);
         var _loc3_:XML = XMLAsset(Asset.getXMLByType(FONT_MINI_XML)).xml;
         TextField.registerBitmapFont(new BitmapFont(_loc2_,_loc3_),"font");
      }
      
      public static function getBitmapFont() : BitmapFont
      {
         // method body index: 9 method index: 9
         var _loc1_:Object = null;
         var _loc2_:Texture = null;
         var _loc3_:XML = null;
         if(!font)
         {
            _loc1_ = new FONT_MINI();
            _loc2_ = Texture.fromBitmap(_loc1_ as Bitmap,false,false);
            _loc3_ = XMLAsset(Asset.getXMLByType(FONT_MINI_XML)).xml;
            font = new BitmapFont(_loc2_,_loc3_);
         }
         return font;
      }
   }
}

