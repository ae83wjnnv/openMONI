package starling.textures
{
   import flash.geom.Rectangle;
   import flash.utils.Dictionary;
   
   public class TextureAtlas
   {
      
      private var mAtlasTexture:Texture;
      
      private var mTextureRegions:Dictionary;
      
      private var mTextureFrames:Dictionary;
      
      private var sNames:Vector.<String> = // method body index: 1573 method index: 1573
      new Vector.<String>(0);
      
      public function TextureAtlas(param1:Texture, param2:XML = null)
      {
         // method body index: 1573 method index: 1573
         super();
         this.mTextureRegions = new Dictionary();
         this.mTextureFrames = new Dictionary();
         this.mAtlasTexture = param1;
         if(param2)
         {
            this.parseAtlasXml(param2);
         }
      }
      
      public function dispose() : void
      {
         // method body index: 1574 method index: 1574
         this.mAtlasTexture.dispose();
      }
      
      protected function parseAtlasXml(param1:XML) : void
      {
         // method body index: 1575 method index: 1575
         var _loc3_:XML = null;
         var _loc4_:String = null;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:Rectangle = null;
         var _loc14_:Rectangle = null;
         var _loc2_:Number = this.mAtlasTexture.scale;
         for each(_loc3_ in param1.SubTexture)
         {
            _loc4_ = _loc3_.attribute("name");
            _loc5_ = parseFloat(_loc3_.attribute("x")) / _loc2_;
            _loc6_ = parseFloat(_loc3_.attribute("y")) / _loc2_;
            _loc7_ = parseFloat(_loc3_.attribute("width")) / _loc2_;
            _loc8_ = parseFloat(_loc3_.attribute("height")) / _loc2_;
            _loc9_ = parseFloat(_loc3_.attribute("frameX")) / _loc2_;
            _loc10_ = parseFloat(_loc3_.attribute("frameY")) / _loc2_;
            _loc11_ = parseFloat(_loc3_.attribute("frameWidth")) / _loc2_;
            _loc12_ = parseFloat(_loc3_.attribute("frameHeight")) / _loc2_;
            _loc13_ = new Rectangle(_loc5_,_loc6_,_loc7_,_loc8_);
            _loc14_ = _loc11_ > 0 && _loc12_ > 0 ? new Rectangle(_loc9_,_loc10_,_loc11_,_loc12_) : null;
            this.addRegion(_loc4_,_loc13_,_loc14_);
         }
      }
      
      public function getTexture(param1:String) : Texture
      {
         // method body index: 1576 method index: 1576
         var _loc2_:Rectangle = this.mTextureRegions[param1];
         if(_loc2_ == null)
         {
            return null;
         }
         return Texture.fromTexture(this.mAtlasTexture,_loc2_,this.mTextureFrames[param1]);
      }
      
      public function getTextures(param1:String = "", param2:Vector.<Texture> = null) : Vector.<Texture>
      {
         // method body index: 1577 method index: 1577
         var _loc3_:String = null;
         if(param2 == null)
         {
            param2 = new Vector.<Texture>(0);
         }
         for each(_loc3_ in this.getNames(param1,this.sNames))
         {
            param2.push(this.getTexture(_loc3_));
         }
         this.sNames.length = 0;
         return param2;
      }
      
      public function getNames(param1:String = "", param2:Vector.<String> = null) : Vector.<String>
      {
         // method body index: 1578 method index: 1578
         var _loc3_:String = null;
         if(param2 == null)
         {
            param2 = new Vector.<String>(0);
         }
         for(_loc3_ in this.mTextureRegions)
         {
            if(_loc3_.indexOf(param1) == 0)
            {
               param2.push(_loc3_);
            }
         }
         param2.sort(Array.CASEINSENSITIVE);
         return param2;
      }
      
      public function getRegion(param1:String) : Rectangle
      {
         // method body index: 1579 method index: 1579
         return this.mTextureRegions[param1];
      }
      
      public function getFrame(param1:String) : Rectangle
      {
         // method body index: 1580 method index: 1580
         return this.mTextureFrames[param1];
      }
      
      public function addRegion(param1:String, param2:Rectangle, param3:Rectangle = null) : void
      {
         // method body index: 1581 method index: 1581
         this.mTextureRegions[param1] = param2;
         this.mTextureFrames[param1] = param3;
      }
      
      public function removeRegion(param1:String) : void
      {
         // method body index: 1582 method index: 1582
         delete this.mTextureRegions[param1];
         delete this.mTextureFrames[param1];
      }
      
      public function get texture() : Texture
      {
         // method body index: 1583 method index: 1583
         return this.mAtlasTexture;
      }
   }
}

