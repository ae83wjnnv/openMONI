package starling.core
{
   import flash.display.BitmapData;
   import flash.display.Shape;
   import flash.geom.Point;
   import starling.display.Image;
   import starling.display.Sprite;
   import starling.textures.Texture;
   
   internal class TouchMarker extends Sprite
   {
      
      private var mCenter:Point;
      
      private var mTexture:Texture;
      
      public function TouchMarker()
      {
         // method body index: 3851 method index: 4172
         var _loc2_:Image = null;
         super();
         this.mCenter = new Point();
         this.mTexture = this.createTexture();
         var _loc1_:int = 0;
         while(_loc1_ < 2)
         {
            _loc2_ = new Image(this.mTexture);
            _loc2_.pivotX = this.mTexture.width / 2;
            _loc2_.pivotY = this.mTexture.height / 2;
            _loc2_.touchable = false;
            addChild(_loc2_);
            _loc1_++;
         }
      }
      
      override public function dispose() : void
      {
         // method body index: 3852 method index: 4173
         this.mTexture.dispose();
         super.dispose();
      }
      
      public function moveMarker(param1:Number, param2:Number, param3:Boolean = false) : void
      {
         // method body index: 3853 method index: 4174
         if(param3)
         {
            this.mCenter.x += param1 - this.realMarker.x;
            this.mCenter.y += param2 - this.realMarker.y;
         }
         this.realMarker.x = param1;
         this.realMarker.y = param2;
         this.mockMarker.x = 2 * this.mCenter.x - param1;
         this.mockMarker.y = 2 * this.mCenter.y - param2;
      }
      
      public function moveCenter(param1:Number, param2:Number) : void
      {
         // method body index: 3854 method index: 4175
         this.mCenter.x = param1;
         this.mCenter.y = param2;
         this.moveMarker(this.realX,this.realY);
      }
      
      private function createTexture() : Texture
      {
         // method body index: 3855 method index: 4176
         var _loc1_:Number = Starling.contentScaleFactor;
         var _loc2_:Number = 12 * _loc1_;
         var _loc3_:int = 32 * _loc1_;
         var _loc4_:int = 32 * _loc1_;
         var _loc5_:Number = 1.5 * _loc1_;
         var _loc6_:Shape = new Shape();
         _loc6_.graphics.lineStyle(_loc5_,0,0.3);
         _loc6_.graphics.drawCircle(_loc3_ / 2,_loc4_ / 2,_loc2_ + _loc5_);
         _loc6_.graphics.beginFill(16777215,0.4);
         _loc6_.graphics.lineStyle(_loc5_,16777215);
         _loc6_.graphics.drawCircle(_loc3_ / 2,_loc4_ / 2,_loc2_);
         _loc6_.graphics.endFill();
         var _loc7_:BitmapData = new BitmapData(_loc3_,_loc4_,true,0);
         _loc7_.draw(_loc6_);
         return Texture.fromBitmapData(_loc7_,false,false,_loc1_);
      }
      
      private function get realMarker() : Image
      {
         // method body index: 3856 method index: 4177
         return getChildAt(0) as Image;
      }
      
      private function get mockMarker() : Image
      {
         // method body index: 3857 method index: 4178
         return getChildAt(1) as Image;
      }
      
      public function get realX() : Number
      {
         // method body index: 3858 method index: 4179
         return this.realMarker.x;
      }
      
      public function get realY() : Number
      {
         // method body index: 3859 method index: 4180
         return this.realMarker.y;
      }
      
      public function get mockX() : Number
      {
         // method body index: 3860 method index: 4181
         return this.mockMarker.x;
      }
      
      public function get mockY() : Number
      {
         // method body index: 3861 method index: 4182
         return this.mockMarker.y;
      }
   }
}

