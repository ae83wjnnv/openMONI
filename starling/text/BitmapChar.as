package starling.text
{
   import flash.utils.Dictionary;
   import starling.display.Image;
   import starling.textures.Texture;
   
   public class BitmapChar
   {
      
      private var mTexture:Texture;
      
      private var mCharID:int;
      
      private var mXOffset:Number;
      
      private var mYOffset:Number;
      
      private var mXAdvance:Number;
      
      private var mKernings:Dictionary;
      
      public function BitmapChar(param1:int, param2:Texture, param3:Number, param4:Number, param5:Number)
      {
         // method body index: 1273 method index: 1273
         super();
         this.mCharID = param1;
         this.mTexture = param2;
         this.mXOffset = param3;
         this.mYOffset = param4;
         this.mXAdvance = param5;
         this.mKernings = null;
      }
      
      public function addKerning(param1:int, param2:Number) : void
      {
         // method body index: 1274 method index: 1274
         if(this.mKernings == null)
         {
            this.mKernings = new Dictionary();
         }
         this.mKernings[param1] = param2;
      }
      
      public function getKerning(param1:int) : Number
      {
         // method body index: 1275 method index: 1275
         if(this.mKernings == null || this.mKernings[param1] == undefined)
         {
            return 0;
         }
         return this.mKernings[param1];
      }
      
      public function createImage() : Image
      {
         // method body index: 1276 method index: 1276
         return new Image(this.mTexture);
      }
      
      public function get charID() : int
      {
         // method body index: 1277 method index: 1277
         return this.mCharID;
      }
      
      public function get xOffset() : Number
      {
         // method body index: 1278 method index: 1278
         return this.mXOffset;
      }
      
      public function get yOffset() : Number
      {
         // method body index: 1279 method index: 1279
         return this.mYOffset;
      }
      
      public function get xAdvance() : Number
      {
         // method body index: 1280 method index: 1280
         return this.mXAdvance;
      }
      
      public function get texture() : Texture
      {
         // method body index: 1281 method index: 1281
         return this.mTexture;
      }
      
      public function get width() : Number
      {
         // method body index: 1282 method index: 1282
         return this.mTexture.width;
      }
      
      public function get height() : Number
      {
         // method body index: 1283 method index: 1283
         return this.mTexture.height;
      }
   }
}

