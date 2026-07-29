package flashpunk2.components.rendering
{
   import flashpunk2.global.Asset;
   import flashpunk2.namespaces.fp_internal;
   import starling.display.Image;
   import starling.textures.TextureSmoothing;
   
   use namespace fp_internal;
   
   public class ImageRenderer extends Renderer
   {
      
      private var _image:Image;
      
      private var _smooth:Boolean;
      
      public function ImageRenderer(param1:*, param2:Boolean = false)
      {
         // method body index: 1097 method index: 1097
         super();
         this._image = new Image(Asset.getTextureFromSource(param1));
         this._image.smoothing = TextureSmoothing.NONE;
         this.smooth = engine.smoothing;
         fp_internal::setDisplayObject(this._image);
         if(param2)
         {
            this.centerOrigin();
         }
      }
      
      public static function create(param1:*, param2:Number, param3:Number) : ImageRenderer
      {
         // method body index: 1096 method index: 1096
         var _loc4_:ImageRenderer = new ImageRenderer(param1,false);
         _loc4_.setOrigin(param2,param3);
         return _loc4_;
      }
      
      public function setSource(param1:*, param2:Boolean = false) : void
      {
         // method body index: 1098 method index: 1098
         this._image.texture = Asset.getTextureFromSource(param1);
         this._image.readjustSize();
         if(param2)
         {
            this.centerOrigin();
         }
      }
      
      public function get image() : Image
      {
         // method body index: 1099 method index: 1099
         return this._image;
      }
      
      public function get color() : uint
      {
         // method body index: 1100 method index: 1100
         return this._image.color;
      }
      
      public function set color(param1:uint) : void
      {
         // method body index: 1101 method index: 1101
         if(this._image.color != param1)
         {
            this._image.color = param1;
         }
      }
      
      public function get smooth() : Boolean
      {
         // method body index: 1102 method index: 1102
         return this._smooth;
      }
      
      public function set smooth(param1:Boolean) : void
      {
         // method body index: 1103 method index: 1103
         if(this._smooth != param1)
         {
            this._smooth = param1;
            this._image.smoothing = param1 ? TextureSmoothing.BILINEAR : TextureSmoothing.NONE;
         }
      }
   }
}

