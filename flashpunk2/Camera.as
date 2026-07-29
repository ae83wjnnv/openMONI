package flashpunk2
{
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flashpunk2.global.Calc;
   import flashpunk2.global.Rand;
   import flashpunk2.global.Time;
   import flashpunk2.namespaces.fp_internal;
   import nape.geom.Vec2;
   import starling.display.Sprite;
   
   use namespace fp_internal;
   
   public class Camera
   {
      
      public const ON_CHANGE:Signal = // method body index: 901 method index: 901
      new Signal();
      
      private var _sprite:Sprite = // method body index: 901 method index: 901
      new Sprite();
      
      private var _matrix:Matrix = // method body index: 901 method index: 901
      new Matrix();
      
      private var _x:Number = 0;
      
      private var _y:Number = 0;
      
      private var _originX:Number = 0;
      
      private var _originY:Number = 0;
      
      private var _angle:Number = 0;
      
      private var _zoom:Number = 1;
      
      private var _dirty:Boolean = true;
      
      private var _shakeX:Number = 0;
      
      private var _shakeY:Number = 0;
      
      private var _shakeDuration:Number = 0;
      
      private var _shakeTime:Number = 0;
      
      private var _shakeMagnitude:Number;
      
      private var _min:Point = // method body index: 901 method index: 901
      new Point();
      
      private var _max:Point = // method body index: 901 method index: 901
      new Point();
      
      public function Camera()
      {
         // method body index: 901 method index: 901
         super();
      }
      
      fp_internal function update() : void
      {
         // method body index: 902 method index: 902
         var _loc1_:Number = NaN;
         if(this._shakeTime > 0)
         {
            this._shakeTime -= Time.dt;
            if(this._shakeTime > 0)
            {
               _loc1_ = this._shakeMagnitude * (this._shakeTime / this._shakeDuration);
               this._shakeX = Rand.getNumberRange(-_loc1_,_loc1_);
               this._shakeY = Rand.getNumberRange(-_loc1_,_loc1_);
            }
            else
            {
               this._shakeX = this._shakeY = 0;
            }
            this._dirty = true;
         }
         if(this._dirty)
         {
            this._matrix.identity();
            this._matrix.translate(-(this._x + this._shakeX),-(this._y + this._shakeY));
            if(this._angle != 0)
            {
               this._matrix.rotate(this._angle * Calc.RAD);
            }
            this._matrix.scale(this._zoom,this._zoom);
            this._matrix.translate(this._originX,this._originY);
            this._sprite.transformationMatrix = this._matrix;
            this._dirty = false;
            this._min.setTo(0,0);
            this._max.setTo(this.width,this.height);
            this._min = this._sprite.localToGlobal(this._min,this._min);
            this._max = this._sprite.localToGlobal(this._max,this._max);
            this._min.setTo(-this._min.x,-this._min.y);
            this._max.setTo(-this._max.x,-this._max.y);
            this.ON_CHANGE.dispatch();
         }
      }
      
      fp_internal function getMatrix() : Matrix
      {
         // method body index: 903 method index: 903
         return this._matrix;
      }
      
      public function shake(param1:Number, param2:Number) : void
      {
         // method body index: 904 method index: 904
         this._shakeTime = this._shakeDuration = param1;
         this._shakeMagnitude = param2;
      }
      
      public function setPosition(param1:Number, param2:Number) : void
      {
         // method body index: 905 method index: 905
         this.x = param1;
         this.y = param2;
      }
      
      public function centerOn(param1:Number, param2:Number) : void
      {
         // method body index: 906 method index: 906
         this.x = param1 - this.width / 2 + this._originX;
         this.y = param2 - this.height / 2 + this._originY;
      }
      
      public function setOrigin(param1:Number, param2:Number) : void
      {
         // method body index: 907 method index: 907
         this.originX = param1;
         this.originY = param2;
      }
      
      public function centerOrigin() : void
      {
         // method body index: 908 method index: 908
         this.setOrigin(Engine.instance.width / 2,Engine.instance.height / 2);
      }
      
      public function moveTowards(param1:Number, param2:Number, param3:Number) : void
      {
         // method body index: 909 method index: 909
         var _loc4_:Vec2 = null;
         if(Calc.distance(this._x,this._y,param1,param2) < param3)
         {
            this._x = param1;
            this._y = param2;
         }
         else
         {
            _loc4_ = Vec2.get(param1 - this._x,param2 - this._y);
            _loc4_.normalise();
            _loc4_.mul(param3);
            this._x += _loc4_.x;
            this._y += _loc4_.y;
            _loc4_.dispose();
         }
         this._dirty = true;
      }
      
      public function lerp(param1:Number, param2:Number, param3:Number) : void
      {
         // method body index: 910 method index: 910
         var _loc4_:Vec2 = null;
         if(param3 >= 1)
         {
            this._x = param1;
            this._y = param2;
         }
         else
         {
            _loc4_ = Vec2.get(param1 - this._x,param2 - this._y);
            _loc4_.mul(param3);
            this._x += _loc4_.x;
            this._y += _loc4_.y;
            _loc4_.dispose();
         }
         this._dirty = true;
      }
      
      public function get x() : Number
      {
         // method body index: 911 method index: 911
         return this._x;
      }
      
      public function set x(param1:Number) : void
      {
         // method body index: 912 method index: 912
         if(this._x != param1)
         {
            this._x = param1;
            this._dirty = true;
         }
      }
      
      public function get y() : Number
      {
         // method body index: 913 method index: 913
         return this._y;
      }
      
      public function set y(param1:Number) : void
      {
         // method body index: 914 method index: 914
         if(this._y != param1)
         {
            this._y = param1;
            this._dirty = true;
         }
      }
      
      public function get originX() : Number
      {
         // method body index: 915 method index: 915
         return this._originX;
      }
      
      public function set originX(param1:Number) : void
      {
         // method body index: 916 method index: 916
         if(this._originX != param1)
         {
            this._originX = param1;
            this._dirty = true;
         }
      }
      
      public function get originY() : Number
      {
         // method body index: 917 method index: 917
         return this._originY;
      }
      
      public function set originY(param1:Number) : void
      {
         // method body index: 918 method index: 918
         if(this._originY != param1)
         {
            this._originY = param1;
            this._dirty = true;
         }
      }
      
      public function get zoom() : Number
      {
         // method body index: 919 method index: 919
         return this._zoom;
      }
      
      public function set zoom(param1:Number) : void
      {
         // method body index: 920 method index: 920
         if(this._zoom != param1)
         {
            if(param1 == 0)
            {
               throw new Error("Zoom cannot be 0!");
            }
            this._zoom = param1;
            this._dirty = true;
         }
      }
      
      public function get angle() : Number
      {
         // method body index: 921 method index: 921
         return this._angle;
      }
      
      public function set angle(param1:Number) : void
      {
         // method body index: 922 method index: 922
         if(this._angle != param1)
         {
            this._angle = param1;
            this._dirty = true;
         }
      }
      
      public function get width() : Number
      {
         // method body index: 923 method index: 923
         return Engine.instance.width;
      }
      
      public function get height() : Number
      {
         // method body index: 924 method index: 924
         return Engine.instance.height;
      }
      
      public function get sprite() : Sprite
      {
         // method body index: 925 method index: 925
         return this._sprite;
      }
      
      public function get left() : Number
      {
         // method body index: 926 method index: 926
         return this._min.x;
      }
      
      public function get top() : Number
      {
         // method body index: 927 method index: 927
         return this._min.y;
      }
      
      public function get right() : Number
      {
         // method body index: 928 method index: 928
         return this._max.x;
      }
      
      public function get bottom() : Number
      {
         // method body index: 929 method index: 929
         return this._max.y;
      }
   }
}

