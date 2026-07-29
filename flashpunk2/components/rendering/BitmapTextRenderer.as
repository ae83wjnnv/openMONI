package flashpunk2.components.rendering
{
   import flashpunk2.namespaces.fp_internal;
   import starling.text.TextField;
   import starling.utils.HAlign;
   import starling.utils.VAlign;
   
   use namespace fp_internal;
   
   public class BitmapTextRenderer extends Renderer
   {
      
      private static var _formatFont:String;
      
      private static var _formatSize:Number;
      
      private static var _formatColor:uint;
      
      private static var _formatCenter:Boolean;
      
      private var _textField:TextField;
      
      private var _width:Number;
      
      private var _height:Number;
      
      private var w:int;
      
      private var h:int;
      
      public function BitmapTextRenderer(param1:int, param2:int, param3:String, param4:String, param5:Number, param6:uint, param7:Boolean)
      {
         // method body index: 2668 method index: 2682
         super();
         this.h = param2;
         this.w = param1;
         this._textField = new TextField(param1,param2,param3,param4,param5,param6,false);
         if(param7)
         {
            this._textField.hAlign = HAlign.CENTER;
            this._textField.vAlign = VAlign.CENTER;
            this._textField.pivotX = param1 / 2;
            this._textField.pivotY = param2 / 2;
         }
         else
         {
            this._textField.hAlign = HAlign.LEFT;
            this._textField.vAlign = VAlign.TOP;
         }
         this.autoSize();
         fp_internal::setDisplayObject(this._textField);
      }
      
      public static function setFormat(param1:String, param2:Number, param3:uint, param4:Boolean) : void
      {
         // method body index: 2666 method index: 2680
         _formatFont = param1;
         _formatSize = param2;
         _formatColor = param3;
         _formatCenter = param4;
      }
      
      public static function create(param1:int, param2:int, param3:String) : BitmapTextRenderer
      {
         // method body index: 2667 method index: 2681
         return new BitmapTextRenderer(param1,param2,param3,_formatFont,_formatSize,_formatColor,_formatCenter);
      }
      
      private function autoSize() : void
      {
         // method body index: 2669 method index: 2683
      }
      
      public function setText(param1:String, param2:Boolean = false) : void
      {
         // method body index: 2670 method index: 2684
         this.text = param1;
         if(param2)
         {
            this.centerOrigin();
         }
      }
      
      public function get text() : String
      {
         // method body index: 2671 method index: 2685
         return this._textField.text;
      }
      
      public function set text(param1:String) : void
      {
         // method body index: 2672 method index: 2686
         if(this._textField.text != param1)
         {
            this._textField.text = param1;
            this.autoSize();
         }
      }
      
      public function get font() : String
      {
         // method body index: 2673 method index: 2687
         return this._textField.fontName;
      }
      
      public function set font(param1:String) : void
      {
         // method body index: 2674 method index: 2688
         if(this._textField.fontName != param1)
         {
            this._textField.fontName = param1;
            this.autoSize();
         }
      }
      
      public function get size() : Number
      {
         // method body index: 2675 method index: 2689
         return this._textField.fontSize;
      }
      
      public function set size(param1:Number) : void
      {
         // method body index: 2676 method index: 2690
         if(this._textField.fontSize != param1)
         {
            this._textField.fontSize = param1;
            this.autoSize();
         }
      }
      
      public function get color() : uint
      {
         // method body index: 2677 method index: 2691
         return this._textField.color;
      }
      
      public function set color(param1:uint) : void
      {
         // method body index: 2678 method index: 2692
         this._textField.color = param1;
      }
      
      override public function get width() : Number
      {
         // method body index: 2679 method index: 2693
         return this._width;
      }
      
      override public function get height() : Number
      {
         // method body index: 2680 method index: 2694
         return this._height;
      }
      
      public function get textWidth() : Number
      {
         // method body index: 2681 method index: 2695
         return this._textField.textBounds.width;
      }
   }
}

