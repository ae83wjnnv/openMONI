package mx.core
{
   import flash.display.BitmapData;
   import flash.display.DisplayObjectContainer;
   import flash.events.Event;
   import flash.geom.Point;
   import flash.system.ApplicationDomain;
   
   use namespace mx_internal;
   
   public class BitmapAsset extends FlexBitmap implements IFlexAsset, IFlexDisplayObject, ILayoutDirectionElement
   {
      
      private static var FlexVersionClass:Class;
      
      private static var MatrixUtilClass:Class;
      
      // method body index: 16 method index: 76
      mx_internal static const VERSION:String = // method body index: 16 method index: 76
      "4.6.0.23201";
      
      private var layoutFeaturesClass:Class;
      
      private var layoutFeatures:IAssetLayoutFeatures;
      
      private var _height:Number;
      
      private var _layoutDirection:String = "ltr";
      
      public function BitmapAsset(param1:BitmapData = null, param2:String = "auto", param3:Boolean = false)
      {
         // method body index: 17 method index: 77
         var _loc4_:ApplicationDomain = null;
         super(param1,param2,param3);
         if(FlexVersionClass == null)
         {
            _loc4_ = ApplicationDomain.currentDomain;
            if(_loc4_.hasDefinition("mx.core::FlexVersion"))
            {
               FlexVersionClass = Class(_loc4_.getDefinition("mx.core::FlexVersion"));
            }
         }
         if(Boolean(FlexVersionClass) && FlexVersionClass["compatibilityVersion"] >= FlexVersionClass["VERSION_4_0"])
         {
            this.addEventListener(Event.ADDED,this.addedHandler);
         }
      }
      
      override public function get x() : Number
      {
         // method body index: 18 method index: 78
         return this.layoutFeatures == null ? super.x : this.layoutFeatures.layoutX;
      }
      
      override public function set x(param1:Number) : void
      {
         // method body index: 19 method index: 79
         if(this.x == param1)
         {
            return;
         }
         if(this.layoutFeatures == null)
         {
            super.x = param1;
         }
         else
         {
            this.layoutFeatures.layoutX = param1;
            this.validateTransformMatrix();
         }
      }
      
      override public function get y() : Number
      {
         // method body index: 20 method index: 80
         return this.layoutFeatures == null ? super.y : this.layoutFeatures.layoutY;
      }
      
      override public function set y(param1:Number) : void
      {
         // method body index: 21 method index: 81
         if(this.y == param1)
         {
            return;
         }
         if(this.layoutFeatures == null)
         {
            super.y = param1;
         }
         else
         {
            this.layoutFeatures.layoutY = param1;
            this.validateTransformMatrix();
         }
      }
      
      override public function get z() : Number
      {
         // method body index: 22 method index: 82
         return this.layoutFeatures == null ? super.z : this.layoutFeatures.layoutZ;
      }
      
      override public function set z(param1:Number) : void
      {
         // method body index: 23 method index: 83
         if(this.z == param1)
         {
            return;
         }
         if(this.layoutFeatures == null)
         {
            super.z = param1;
         }
         else
         {
            this.layoutFeatures.layoutZ = param1;
            this.validateTransformMatrix();
         }
      }
      
      override public function get width() : Number
      {
         // method body index: 24 method index: 84
         var _loc1_:Point = null;
         if(this.layoutFeatures == null)
         {
            return super.width;
         }
         if(MatrixUtilClass != null)
         {
            _loc1_ = MatrixUtilClass["transformSize"](this.layoutFeatures.layoutWidth,this._height,transform.matrix);
         }
         return _loc1_ ? _loc1_.x : super.width;
      }
      
      override public function set width(param1:Number) : void
      {
         // method body index: 25 method index: 85
         if(this.width == param1)
         {
            return;
         }
         if(this.layoutFeatures == null)
         {
            super.width = param1;
         }
         else
         {
            this.layoutFeatures.layoutWidth = param1;
            this.layoutFeatures.layoutScaleX = this.measuredWidth != 0 ? param1 / this.measuredWidth : 0;
            this.validateTransformMatrix();
         }
      }
      
      override public function get height() : Number
      {
         // method body index: 26 method index: 86
         var _loc1_:Point = null;
         if(this.layoutFeatures == null)
         {
            return super.height;
         }
         if(MatrixUtilClass != null)
         {
            _loc1_ = MatrixUtilClass["transformSize"](this.layoutFeatures.layoutWidth,this._height,transform.matrix);
         }
         return _loc1_ ? _loc1_.y : super.height;
      }
      
      override public function set height(param1:Number) : void
      {
         // method body index: 27 method index: 87
         if(this.height == param1)
         {
            return;
         }
         if(this.layoutFeatures == null)
         {
            super.height = param1;
         }
         else
         {
            this._height = param1;
            this.layoutFeatures.layoutScaleY = this.measuredHeight != 0 ? param1 / this.measuredHeight : 0;
            this.validateTransformMatrix();
         }
      }
      
      override public function get rotationX() : Number
      {
         // method body index: 28 method index: 88
         return this.layoutFeatures == null ? super.rotationX : this.layoutFeatures.layoutRotationX;
      }
      
      override public function set rotationX(param1:Number) : void
      {
         // method body index: 29 method index: 89
         if(this.rotationX == param1)
         {
            return;
         }
         if(this.layoutFeatures == null)
         {
            super.rotationX = param1;
         }
         else
         {
            this.layoutFeatures.layoutRotationX = param1;
            this.validateTransformMatrix();
         }
      }
      
      override public function get rotationY() : Number
      {
         // method body index: 30 method index: 90
         return this.layoutFeatures == null ? super.rotationY : this.layoutFeatures.layoutRotationY;
      }
      
      override public function set rotationY(param1:Number) : void
      {
         // method body index: 31 method index: 91
         if(this.rotationY == param1)
         {
            return;
         }
         if(this.layoutFeatures == null)
         {
            super.rotationY = param1;
         }
         else
         {
            this.layoutFeatures.layoutRotationY = param1;
            this.validateTransformMatrix();
         }
      }
      
      override public function get rotationZ() : Number
      {
         // method body index: 32 method index: 92
         return this.layoutFeatures == null ? super.rotationZ : this.layoutFeatures.layoutRotationZ;
      }
      
      override public function set rotationZ(param1:Number) : void
      {
         // method body index: 33 method index: 93
         if(this.rotationZ == param1)
         {
            return;
         }
         if(this.layoutFeatures == null)
         {
            super.rotationZ = param1;
         }
         else
         {
            this.layoutFeatures.layoutRotationZ = param1;
            this.validateTransformMatrix();
         }
      }
      
      override public function get rotation() : Number
      {
         // method body index: 34 method index: 94
         return this.layoutFeatures == null ? super.rotation : this.layoutFeatures.layoutRotationZ;
      }
      
      override public function set rotation(param1:Number) : void
      {
         // method body index: 35 method index: 95
         if(this.rotation == param1)
         {
            return;
         }
         if(this.layoutFeatures == null)
         {
            super.rotation = param1;
         }
         else
         {
            this.layoutFeatures.layoutRotationZ = param1;
            this.validateTransformMatrix();
         }
      }
      
      override public function get scaleX() : Number
      {
         // method body index: 36 method index: 96
         return this.layoutFeatures == null ? super.scaleX : this.layoutFeatures.layoutScaleX;
      }
      
      override public function set scaleX(param1:Number) : void
      {
         // method body index: 37 method index: 97
         if(this.scaleX == param1)
         {
            return;
         }
         if(this.layoutFeatures == null)
         {
            super.scaleX = param1;
         }
         else
         {
            this.layoutFeatures.layoutScaleX = param1;
            this.layoutFeatures.layoutWidth = Math.abs(param1) * this.measuredWidth;
            this.validateTransformMatrix();
         }
      }
      
      override public function get scaleY() : Number
      {
         // method body index: 38 method index: 98
         return this.layoutFeatures == null ? super.scaleY : this.layoutFeatures.layoutScaleY;
      }
      
      override public function set scaleY(param1:Number) : void
      {
         // method body index: 39 method index: 99
         if(this.scaleY == param1)
         {
            return;
         }
         if(this.layoutFeatures == null)
         {
            super.scaleY = param1;
         }
         else
         {
            this.layoutFeatures.layoutScaleY = param1;
            this._height = Math.abs(param1) * this.measuredHeight;
            this.validateTransformMatrix();
         }
      }
      
      override public function get scaleZ() : Number
      {
         // method body index: 40 method index: 100
         return this.layoutFeatures == null ? super.scaleZ : this.layoutFeatures.layoutScaleZ;
      }
      
      override public function set scaleZ(param1:Number) : void
      {
         // method body index: 41 method index: 101
         if(this.scaleZ == param1)
         {
            return;
         }
         if(this.layoutFeatures == null)
         {
            super.scaleZ = param1;
         }
         else
         {
            this.layoutFeatures.layoutScaleZ = param1;
            this.validateTransformMatrix();
         }
      }
      
      public function get layoutDirection() : String
      {
         // method body index: 42 method index: 102
         return this._layoutDirection;
      }
      
      public function set layoutDirection(param1:String) : void
      {
         // method body index: 43 method index: 103
         if(param1 == this._layoutDirection)
         {
            return;
         }
         this._layoutDirection = param1;
         this.invalidateLayoutDirection();
      }
      
      public function get measuredHeight() : Number
      {
         // method body index: 44 method index: 104
         if(bitmapData)
         {
            return bitmapData.height;
         }
         return 0;
      }
      
      public function get measuredWidth() : Number
      {
         // method body index: 45 method index: 105
         if(bitmapData)
         {
            return bitmapData.width;
         }
         return 0;
      }
      
      public function invalidateLayoutDirection() : void
      {
         // method body index: 46 method index: 106
         var _loc2_:Boolean = false;
         var _loc1_:DisplayObjectContainer = parent;
         while(_loc1_)
         {
            if(_loc1_ is ILayoutDirectionElement)
            {
               _loc2_ = this._layoutDirection != null && ILayoutDirectionElement(_loc1_).layoutDirection != null && this._layoutDirection != ILayoutDirectionElement(_loc1_).layoutDirection;
               if(_loc2_ && this.layoutFeatures == null)
               {
                  this.initAdvancedLayoutFeatures();
                  if(this.layoutFeatures != null)
                  {
                     this.layoutFeatures.mirror = _loc2_;
                     this.validateTransformMatrix();
                  }
               }
               else if(!_loc2_ && Boolean(this.layoutFeatures))
               {
                  this.layoutFeatures.mirror = _loc2_;
                  this.validateTransformMatrix();
                  this.layoutFeatures = null;
               }
               break;
            }
            _loc1_ = _loc1_.parent;
         }
      }
      
      public function move(param1:Number, param2:Number) : void
      {
         // method body index: 47 method index: 107
         this.x = param1;
         this.y = param2;
      }
      
      public function setActualSize(param1:Number, param2:Number) : void
      {
         // method body index: 48 method index: 108
         this.width = param1;
         this.height = param2;
      }
      
      private function addedHandler(param1:Event) : void
      {
         // method body index: 49 method index: 109
         this.invalidateLayoutDirection();
      }
      
      private function initAdvancedLayoutFeatures() : void
      {
         // method body index: 50 method index: 110
         var _loc1_:ApplicationDomain = null;
         var _loc2_:IAssetLayoutFeatures = null;
         if(this.layoutFeaturesClass == null)
         {
            _loc1_ = ApplicationDomain.currentDomain;
            if(_loc1_.hasDefinition("mx.core::AdvancedLayoutFeatures"))
            {
               this.layoutFeaturesClass = Class(_loc1_.getDefinition("mx.core::AdvancedLayoutFeatures"));
            }
            if(MatrixUtilClass == null)
            {
               if(_loc1_.hasDefinition("mx.utils::MatrixUtil"))
               {
                  MatrixUtilClass = Class(_loc1_.getDefinition("mx.utils::MatrixUtil"));
               }
            }
         }
         if(this.layoutFeaturesClass != null)
         {
            _loc2_ = new this.layoutFeaturesClass();
            _loc2_.layoutScaleX = this.scaleX;
            _loc2_.layoutScaleY = this.scaleY;
            _loc2_.layoutScaleZ = this.scaleZ;
            _loc2_.layoutRotationX = this.rotationX;
            _loc2_.layoutRotationY = this.rotationY;
            _loc2_.layoutRotationZ = this.rotation;
            _loc2_.layoutX = this.x;
            _loc2_.layoutY = this.y;
            _loc2_.layoutZ = this.z;
            _loc2_.layoutWidth = this.width;
            this._height = this.height;
            this.layoutFeatures = _loc2_;
         }
      }
      
      private function validateTransformMatrix() : void
      {
         // method body index: 51 method index: 111
         if(this.layoutFeatures != null)
         {
            if(this.layoutFeatures.is3D)
            {
               super.transform.matrix3D = this.layoutFeatures.computedMatrix3D;
            }
            else
            {
               super.transform.matrix = this.layoutFeatures.computedMatrix;
            }
         }
      }
   }
}

