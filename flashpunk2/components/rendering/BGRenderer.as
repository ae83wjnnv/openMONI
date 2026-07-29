package flashpunk2.components.rendering
{
   import flash.geom.Point;
   import flashpunk2.Entity;
   import flashpunk2.global.Asset;
   import flashpunk2.namespaces.fp_internal;
   import starling.display.Image;
   import starling.display.QuadBatch;
   import starling.display.Sprite;
   import starling.textures.TextureSmoothing;
   
   use namespace fp_internal;
   
   public class BGRenderer extends Renderer
   {
      
      private var _sprite:Sprite;
      
      private var _quads:QuadBatch;
      
      private var _texture:Image;
      
      private var _bakedWidth:int;
      
      private var _bakedHeight:int;
      
      private var _bakedZoom:Number = 1;
      
      private var _imageWidth:int;
      
      private var _imageHeight:int;
      
      private var _pos:Point = // method body index: 2643 method index: 2657
      new Point();
      
      private var _size:Point = // method body index: 2643 method index: 2657
      new Point();
      
      public function BGRenderer(param1:*, param2:Boolean = true, param3:Boolean = true)
      {
         // method body index: 2643 method index: 2657
         super();
         this._sprite = new Sprite();
         this._quads = new QuadBatch();
         fp_internal::setDisplayObject(this._sprite);
         this._sprite.addChild(this._quads);
         this._texture = new Image(Asset.getTextureFromSource(param1));
         this._imageWidth = this._texture.width;
         this._imageHeight = this._texture.height;
         this._texture.smoothing = TextureSmoothing.NONE;
      }
      
      public function get imageWidth() : int
      {
         // method body index: 2641 method index: 2655
         return this._imageWidth;
      }
      
      public function get imageHeight() : int
      {
         // method body index: 2642 method index: 2656
         return this._imageHeight;
      }
      
      override fp_internal function start(param1:Entity) : void
      {
         // method body index: 2644 method index: 2658
         super.fp_internal::start(param1);
         param1.ON_UPDATE.add(this.onUpdate);
         this.bakeTexture();
      }
      
      override fp_internal function end() : void
      {
         // method body index: 2645 method index: 2659
         entity.ON_UPDATE.remove(this.onUpdate);
         super.fp_internal::end();
      }
      
      private function onUpdate() : void
      {
         // method body index: 2646 method index: 2660
         if(this._bakedZoom != camera.zoom)
         {
            this._bakedZoom = camera.zoom;
            this.bakeTexture();
         }
         this._pos.x = 0;
         this._pos.y = 0;
         this._sprite.localToGlobal(this._pos,this._pos);
         var _loc1_:int = this.imageWidth * camera.zoom * (1 / (1 - scroll));
         var _loc2_:int = this.imageHeight * camera.zoom * (1 / (1 - scroll));
         this._pos.x %= _loc1_;
         this._pos.y %= _loc2_;
         if(camera.zoom <= 1)
         {
            if(this._pos.x > 0)
            {
               this._pos.x -= _loc1_;
            }
            if(this._pos.y > 0)
            {
               this._pos.y -= _loc2_;
            }
         }
         this._sprite.parent.globalToLocal(this._pos,this._pos);
         this._quads.x = this._pos.x * scroll;
         this._quads.y = this._pos.y * scroll;
      }
      
      private function bakeTexture() : void
      {
         // method body index: 2647 method index: 2661
         this._bakedWidth = engine.width * 2 / this._bakedZoom;
         this._bakedHeight = engine.height * 2 / this._bakedZoom;
         this._quads.reset();
         this._texture.y = 0;
         while(this._texture.y < this._bakedHeight)
         {
            this._texture.x = 0;
            while(this._texture.x < this._bakedWidth)
            {
               this._quads.addImage(this._texture);
               this._texture.x += this._texture.width;
            }
            this._texture.y += this._texture.height;
         }
      }
   }
}

