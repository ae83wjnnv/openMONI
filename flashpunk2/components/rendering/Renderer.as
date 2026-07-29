package flashpunk2.components.rendering
{
   import flashpunk2.Component;
   import flashpunk2.Entity;
   import flashpunk2.global.Calc;
   import flashpunk2.namespaces.fp_internal;
   import starling.display.DisplayObject;
   
   use namespace fp_internal;
   
   public class Renderer extends Component
   {
      
      private var _displayObject:DisplayObject;
      
      private var _angle:Number = 0;
      
      private var _x:int = 0;
      
      private var _y:int = 0;
      
      public var scroll:Number = 1;
      
      public function Renderer()
      {
         // method body index: 1062 method index: 1062
         super();
      }
      
      public function updateCamera() : void
      {
         // method body index: 1063 method index: 1063
         this._displayObject.y = this._y + camera.y * (1 - this.scroll);
         this._displayObject.x = this._x + camera.x * (1 - this.scroll);
      }
      
      override fp_internal function start(param1:Entity) : void
      {
         // method body index: 1064 method index: 1064
         super.fp_internal::start(param1);
         camera.ON_CHANGE.add(this.updateCamera);
         this.updateCamera();
         if(this._displayObject != null)
         {
            param1.sprite.addChild(this._displayObject);
         }
      }
      
      override fp_internal function end() : void
      {
         // method body index: 1065 method index: 1065
         if(this._displayObject != null)
         {
            entity.sprite.removeChild(this._displayObject);
         }
         camera.ON_CHANGE.remove(this.updateCamera);
         super.fp_internal::end();
      }
      
      fp_internal function setDisplayObject(param1:DisplayObject) : void
      {
         // method body index: 1066 method index: 1066
         if(exists)
         {
            if(this._displayObject != null)
            {
               entity.sprite.removeChild(this._displayObject);
            }
            this._displayObject = param1;
            if(this._displayObject != null)
            {
               entity.sprite.addChild(this._displayObject);
            }
         }
         else
         {
            this._displayObject = param1;
         }
      }
      
      public function setPosition(param1:Number, param2:Number) : void
      {
         // method body index: 1067 method index: 1067
         this.x = param1;
         this.y = param2;
      }
      
      public function setOrigin(param1:Number, param2:Number) : void
      {
         // method body index: 1068 method index: 1068
         this.originX = param1;
         this.originY = param2;
      }
      
      public function setScale(param1:Number, param2:Number) : void
      {
         // method body index: 1069 method index: 1069
         this.scaleX = param1;
         this.scaleY = param2;
      }
      
      public function lookAt(param1:Number, param2:Number) : void
      {
         // method body index: 1070 method index: 1070
         if(entity != null)
         {
            this.angle = Calc.atan2(param2 - (entity.y + this.y),param1 - (entity.x + this.x));
         }
         else
         {
            this.angle = Calc.atan2(param2 - this.y,param1 - this.x);
         }
      }
      
      public function centerOrigin() : void
      {
         // method body index: 1071 method index: 1071
         this.originX = this.width / 2;
         this.originY = this.height / 2;
      }
      
      public function get x() : Number
      {
         // method body index: 1072 method index: 1072
         return this._x;
      }
      
      public function set x(param1:Number) : void
      {
         // method body index: 1073 method index: 1073
         this._x = param1;
         if(camera != null)
         {
            this._displayObject.x = param1 - camera.x * (1 - this.scroll);
         }
      }
      
      public function get y() : Number
      {
         // method body index: 1074 method index: 1074
         return this._y;
      }
      
      public function set y(param1:Number) : void
      {
         // method body index: 1075 method index: 1075
         this._y = param1;
         if(camera != null)
         {
            this._displayObject.y = param1 - camera.y * (1 - this.scroll);
         }
      }
      
      public function get originX() : Number
      {
         // method body index: 1076 method index: 1076
         return this._displayObject.pivotX;
      }
      
      public function set originX(param1:Number) : void
      {
         // method body index: 1077 method index: 1077
         this._displayObject.pivotX = param1;
      }
      
      public function get originY() : Number
      {
         // method body index: 1078 method index: 1078
         return this._displayObject.pivotY;
      }
      
      public function set originY(param1:Number) : void
      {
         // method body index: 1079 method index: 1079
         this._displayObject.pivotY = param1;
      }
      
      public function get scaleX() : Number
      {
         // method body index: 1080 method index: 1080
         return this._displayObject.scaleX;
      }
      
      public function set scaleX(param1:Number) : void
      {
         // method body index: 1081 method index: 1081
         this._displayObject.scaleX = param1;
      }
      
      public function get scaleY() : Number
      {
         // method body index: 1082 method index: 1082
         return this._displayObject.scaleY;
      }
      
      public function set scaleY(param1:Number) : void
      {
         // method body index: 1083 method index: 1083
         this._displayObject.scaleY = param1;
      }
      
      public function get angle() : Number
      {
         // method body index: 1084 method index: 1084
         return this._angle;
      }
      
      public function set angle(param1:Number) : void
      {
         // method body index: 1085 method index: 1085
         if(this._angle != param1)
         {
            this._angle = param1;
            this._displayObject.rotation = param1 * Calc.RAD;
         }
      }
      
      public function get alpha() : Number
      {
         // method body index: 1086 method index: 1086
         return this._displayObject.alpha;
      }
      
      public function set alpha(param1:Number) : void
      {
         // method body index: 1087 method index: 1087
         this._displayObject.alpha = param1;
      }
      
      public function get blendMode() : String
      {
         // method body index: 1088 method index: 1088
         return this._displayObject.blendMode;
      }
      
      public function set blendMode(param1:String) : void
      {
         // method body index: 1089 method index: 1089
         this._displayObject.blendMode = param1;
      }
      
      public function get visible() : Boolean
      {
         // method body index: 1090 method index: 1090
         return this._displayObject.visible;
      }
      
      public function set visible(param1:Boolean) : void
      {
         // method body index: 1091 method index: 1091
         this._displayObject.visible = param1;
      }
      
      public function get width() : Number
      {
         // method body index: 1092 method index: 1092
         return this._displayObject.width;
      }
      
      public function get height() : Number
      {
         // method body index: 1093 method index: 1093
         return this._displayObject.height;
      }
   }
}

