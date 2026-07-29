package starling.display
{
   import com.jpexs.decompiler.flash.debugger.debugGetQualifiedClassName;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.system.Capabilities;
   import flash.ui.Mouse;
   import flash.ui.MouseCursor;
   import starling.core.RenderSupport;
   import starling.errors.AbstractClassError;
   import starling.errors.AbstractMethodError;
   import starling.events.EventDispatcher;
   import starling.events.TouchEvent;
   import starling.filters.FragmentFilter;
   import starling.utils.MatrixUtil;
   
   public class DisplayObject extends EventDispatcher
   {
      
      // method body index: 424 method index: 424
      private static var sAncestors:Vector.<DisplayObject> = // method body index: 424 method index: 424
      new Vector.<DisplayObject>(0);
      
      private static var sHelperRect:Rectangle = // method body index: 424 method index: 424
      new Rectangle();
      
      private static var sHelperMatrix:Matrix = // method body index: 424 method index: 424
      new Matrix();
      
      private var mX:Number;
      
      private var mY:Number;
      
      private var mPivotX:Number;
      
      private var mPivotY:Number;
      
      private var mScaleX:Number;
      
      private var mScaleY:Number;
      
      private var mSkewX:Number;
      
      private var mSkewY:Number;
      
      private var mRotation:Number;
      
      private var mAlpha:Number;
      
      private var mVisible:Boolean;
      
      private var mTouchable:Boolean;
      
      private var mBlendMode:String;
      
      private var mName:String;
      
      private var mUseHandCursor:Boolean;
      
      private var mParent:DisplayObjectContainer;
      
      private var mTransformationMatrix:Matrix;
      
      private var mOrientationChanged:Boolean;
      
      private var mFilter:FragmentFilter;
      
      public function DisplayObject()
      {
         // method body index: 425 method index: 425
         super();
         if(Capabilities.isDebugger && debugGetQualifiedClassName(this) == "starling.display::DisplayObject")
         {
            throw new AbstractClassError();
         }
         this.mX = this.mY = this.mPivotX = this.mPivotY = this.mRotation = this.mSkewX = this.mSkewY = 0;
         this.mScaleX = this.mScaleY = this.mAlpha = 1;
         this.mVisible = this.mTouchable = true;
         this.mBlendMode = BlendMode.AUTO;
         this.mTransformationMatrix = new Matrix();
         this.mOrientationChanged = this.mUseHandCursor = false;
      }
      
      public function dispose() : void
      {
         // method body index: 426 method index: 426
         if(this.mFilter)
         {
            this.mFilter.dispose();
         }
         removeEventListeners();
      }
      
      public function removeFromParent(param1:Boolean = false) : void
      {
         // method body index: 427 method index: 427
         if(this.mParent)
         {
            this.mParent.removeChild(this,param1);
         }
      }
      
      public function getTransformationMatrix(param1:DisplayObject, param2:Matrix = null) : Matrix
      {
         // method body index: 428 method index: 428
         var _loc3_:DisplayObject = null;
         var _loc4_:DisplayObject = null;
         if(param2)
         {
            param2.identity();
         }
         else
         {
            param2 = new Matrix();
         }
         if(param1 == this)
         {
            return param2;
         }
         if(param1 == this.mParent || param1 == null && this.mParent == null)
         {
            param2.copyFrom(this.transformationMatrix);
            return param2;
         }
         if(param1 == null || param1 == this.base)
         {
            _loc4_ = this;
            while(_loc4_ != param1)
            {
               param2.concat(_loc4_.transformationMatrix);
               _loc4_ = _loc4_.mParent;
            }
            return param2;
         }
         if(param1.mParent == this)
         {
            param1.getTransformationMatrix(this,param2);
            param2.invert();
            return param2;
         }
         _loc3_ = null;
         _loc4_ = this;
         while(_loc4_)
         {
            sAncestors.push(_loc4_);
            _loc4_ = _loc4_.mParent;
         }
         _loc4_ = param1;
         while(Boolean(_loc4_) && sAncestors.indexOf(_loc4_) == -1)
         {
            _loc4_ = _loc4_.mParent;
         }
         sAncestors.length = 0;
         if(_loc4_)
         {
            _loc3_ = _loc4_;
            _loc4_ = this;
            while(_loc4_ != _loc3_)
            {
               param2.concat(_loc4_.transformationMatrix);
               _loc4_ = _loc4_.mParent;
            }
            if(_loc3_ == param1)
            {
               return param2;
            }
            sHelperMatrix.identity();
            _loc4_ = param1;
            while(_loc4_ != _loc3_)
            {
               sHelperMatrix.concat(_loc4_.transformationMatrix);
               _loc4_ = _loc4_.mParent;
            }
            sHelperMatrix.invert();
            param2.concat(sHelperMatrix);
            return param2;
         }
         throw new ArgumentError("Object not connected to target");
      }
      
      public function getBounds(param1:DisplayObject, param2:Rectangle = null) : Rectangle
      {
         // method body index: 429 method index: 429
         throw new AbstractMethodError("Method needs to be implemented in subclass");
      }
      
      public function hitTest(param1:Point, param2:Boolean = false) : DisplayObject
      {
         // method body index: 430 method index: 430
         if(param2 && (!this.mVisible || !this.mTouchable))
         {
            return null;
         }
         if(this.getBounds(this,sHelperRect).containsPoint(param1))
         {
            return this;
         }
         return null;
      }
      
      public function localToGlobal(param1:Point, param2:Point = null) : Point
      {
         // method body index: 431 method index: 431
         this.getTransformationMatrix(this.base,sHelperMatrix);
         return MatrixUtil.transformCoords(sHelperMatrix,param1.x,param1.y,param2);
      }
      
      public function globalToLocal(param1:Point, param2:Point = null) : Point
      {
         // method body index: 432 method index: 432
         this.getTransformationMatrix(this.base,sHelperMatrix);
         sHelperMatrix.invert();
         return MatrixUtil.transformCoords(sHelperMatrix,param1.x,param1.y,param2);
      }
      
      public function render(param1:RenderSupport, param2:Number) : void
      {
         // method body index: 433 method index: 433
         throw new AbstractMethodError("Method needs to be implemented in subclass");
      }
      
      public function get hasVisibleArea() : Boolean
      {
         // method body index: 434 method index: 434
         return this.mAlpha != 0 && this.mVisible && this.mScaleX != 0 && this.mScaleY != 0;
      }
      
      internal function setParent(param1:DisplayObjectContainer) : void
      {
         // method body index: 435 method index: 435
         var _loc2_:DisplayObject = param1;
         while(_loc2_ != this && _loc2_ != null)
         {
            _loc2_ = _loc2_.mParent;
         }
         if(_loc2_ == this)
         {
            throw new ArgumentError("An object cannot be added as a child to itself or one " + "of its children (or children\'s children, etc.)");
         }
         this.mParent = param1;
      }
      
      final private function isEquivalent(param1:Number, param2:Number, param3:Number = 0.0001) : Boolean
      {
         // method body index: 436 method index: 436
         return param1 - param3 < param2 && param1 + param3 > param2;
      }
      
      final private function normalizeAngle(param1:Number) : Number
      {
         // method body index: 437 method index: 437
         while(param1 < -Math.PI)
         {
            param1 += Math.PI * 2;
         }
         while(param1 > Math.PI)
         {
            param1 -= Math.PI * 2;
         }
         return param1;
      }
      
      public function get transformationMatrix() : Matrix
      {
         // method body index: 438 method index: 438
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         if(this.mOrientationChanged)
         {
            this.mOrientationChanged = false;
            if(this.mSkewX == 0 && this.mSkewY == 0)
            {
               if(this.mRotation == 0)
               {
                  this.mTransformationMatrix.setTo(this.mScaleX,0,0,this.mScaleY,this.mX - this.mPivotX * this.mScaleX,this.mY - this.mPivotY * this.mScaleY);
               }
               else
               {
                  _loc1_ = Math.cos(this.mRotation);
                  _loc2_ = Math.sin(this.mRotation);
                  _loc3_ = this.mScaleX * _loc1_;
                  _loc4_ = this.mScaleX * _loc2_;
                  _loc5_ = this.mScaleY * -_loc2_;
                  _loc6_ = this.mScaleY * _loc1_;
                  _loc7_ = this.mX - this.mPivotX * _loc3_ - this.mPivotY * _loc5_;
                  _loc8_ = this.mY - this.mPivotX * _loc4_ - this.mPivotY * _loc6_;
                  this.mTransformationMatrix.setTo(_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_);
               }
            }
            else
            {
               this.mTransformationMatrix.identity();
               this.mTransformationMatrix.scale(this.mScaleX,this.mScaleY);
               MatrixUtil.skew(this.mTransformationMatrix,this.mSkewX,this.mSkewY);
               this.mTransformationMatrix.rotate(this.mRotation);
               this.mTransformationMatrix.translate(this.mX,this.mY);
               if(this.mPivotX != 0 || this.mPivotY != 0)
               {
                  this.mTransformationMatrix.tx = this.mX - this.mTransformationMatrix.a * this.mPivotX - this.mTransformationMatrix.c * this.mPivotY;
                  this.mTransformationMatrix.ty = this.mY - this.mTransformationMatrix.b * this.mPivotX - this.mTransformationMatrix.d * this.mPivotY;
               }
            }
         }
         return this.mTransformationMatrix;
      }
      
      public function set transformationMatrix(param1:Matrix) : void
      {
         // method body index: 439 method index: 439
         this.mOrientationChanged = false;
         this.mTransformationMatrix.copyFrom(param1);
         this.mPivotX = this.mPivotY = 0;
         this.mX = param1.tx;
         this.mY = param1.ty;
         this.mScaleX = Math.sqrt(param1.a * param1.a + param1.b * param1.b);
         this.mSkewY = Math.acos(param1.a / this.mScaleX);
         if(!this.isEquivalent(param1.b,this.mScaleX * Math.sin(this.mSkewY)))
         {
            this.mScaleX *= -1;
            this.mSkewY = Math.acos(param1.a / this.mScaleX);
         }
         this.mScaleY = Math.sqrt(param1.c * param1.c + param1.d * param1.d);
         this.mSkewX = Math.acos(param1.d / this.mScaleY);
         if(!this.isEquivalent(param1.c,-this.mScaleY * Math.sin(this.mSkewX)))
         {
            this.mScaleY *= -1;
            this.mSkewX = Math.acos(param1.d / this.mScaleY);
         }
         if(this.isEquivalent(this.mSkewX,this.mSkewY))
         {
            this.mRotation = this.mSkewX;
            this.mSkewX = this.mSkewY = 0;
         }
         else
         {
            this.mRotation = 0;
         }
      }
      
      public function get useHandCursor() : Boolean
      {
         // method body index: 440 method index: 440
         return this.mUseHandCursor;
      }
      
      public function set useHandCursor(param1:Boolean) : void
      {
         // method body index: 441 method index: 441
         if(param1 == this.mUseHandCursor)
         {
            return;
         }
         this.mUseHandCursor = param1;
         if(this.mUseHandCursor)
         {
            addEventListener(TouchEvent.TOUCH,this.onTouch);
         }
         else
         {
            removeEventListener(TouchEvent.TOUCH,this.onTouch);
         }
      }
      
      private function onTouch(param1:TouchEvent) : void
      {
         // method body index: 442 method index: 442
         Mouse.cursor = param1.interactsWith(this) ? MouseCursor.BUTTON : MouseCursor.AUTO;
      }
      
      public function get bounds() : Rectangle
      {
         // method body index: 443 method index: 443
         return this.getBounds(this.mParent);
      }
      
      public function get width() : Number
      {
         // method body index: 444 method index: 444
         return this.getBounds(this.mParent,sHelperRect).width;
      }
      
      public function set width(param1:Number) : void
      {
         // method body index: 445 method index: 445
         this.scaleX = 1;
         var _loc2_:Number = this.width;
         if(_loc2_ != 0)
         {
            this.scaleX = param1 / _loc2_;
         }
      }
      
      public function get height() : Number
      {
         // method body index: 446 method index: 446
         return this.getBounds(this.mParent,sHelperRect).height;
      }
      
      public function set height(param1:Number) : void
      {
         // method body index: 447 method index: 447
         this.scaleY = 1;
         var _loc2_:Number = this.height;
         if(_loc2_ != 0)
         {
            this.scaleY = param1 / _loc2_;
         }
      }
      
      public function get x() : Number
      {
         // method body index: 448 method index: 448
         return this.mX;
      }
      
      public function set x(param1:Number) : void
      {
         // method body index: 449 method index: 449
         if(this.mX != param1)
         {
            this.mX = param1;
            this.mOrientationChanged = true;
         }
      }
      
      public function get y() : Number
      {
         // method body index: 450 method index: 450
         return this.mY;
      }
      
      public function set y(param1:Number) : void
      {
         // method body index: 451 method index: 451
         if(this.mY != param1)
         {
            this.mY = param1;
            this.mOrientationChanged = true;
         }
      }
      
      public function get pivotX() : Number
      {
         // method body index: 452 method index: 452
         return this.mPivotX;
      }
      
      public function set pivotX(param1:Number) : void
      {
         // method body index: 453 method index: 453
         if(this.mPivotX != param1)
         {
            this.mPivotX = param1;
            this.mOrientationChanged = true;
         }
      }
      
      public function get pivotY() : Number
      {
         // method body index: 454 method index: 454
         return this.mPivotY;
      }
      
      public function set pivotY(param1:Number) : void
      {
         // method body index: 455 method index: 455
         if(this.mPivotY != param1)
         {
            this.mPivotY = param1;
            this.mOrientationChanged = true;
         }
      }
      
      public function get scaleX() : Number
      {
         // method body index: 456 method index: 456
         return this.mScaleX;
      }
      
      public function set scaleX(param1:Number) : void
      {
         // method body index: 457 method index: 457
         if(this.mScaleX != param1)
         {
            this.mScaleX = param1;
            this.mOrientationChanged = true;
         }
      }
      
      public function get scaleY() : Number
      {
         // method body index: 458 method index: 458
         return this.mScaleY;
      }
      
      public function set scaleY(param1:Number) : void
      {
         // method body index: 459 method index: 459
         if(this.mScaleY != param1)
         {
            this.mScaleY = param1;
            this.mOrientationChanged = true;
         }
      }
      
      public function get skewX() : Number
      {
         // method body index: 460 method index: 460
         return this.mSkewX;
      }
      
      public function set skewX(param1:Number) : void
      {
         // method body index: 461 method index: 461
         param1 = this.normalizeAngle(param1);
         if(this.mSkewX != param1)
         {
            this.mSkewX = param1;
            this.mOrientationChanged = true;
         }
      }
      
      public function get skewY() : Number
      {
         // method body index: 462 method index: 462
         return this.mSkewY;
      }
      
      public function set skewY(param1:Number) : void
      {
         // method body index: 463 method index: 463
         param1 = this.normalizeAngle(param1);
         if(this.mSkewY != param1)
         {
            this.mSkewY = param1;
            this.mOrientationChanged = true;
         }
      }
      
      public function get rotation() : Number
      {
         // method body index: 464 method index: 464
         return this.mRotation;
      }
      
      public function set rotation(param1:Number) : void
      {
         // method body index: 465 method index: 465
         param1 = this.normalizeAngle(param1);
         if(this.mRotation != param1)
         {
            this.mRotation = param1;
            this.mOrientationChanged = true;
         }
      }
      
      public function get alpha() : Number
      {
         // method body index: 466 method index: 466
         return this.mAlpha;
      }
      
      public function set alpha(param1:Number) : void
      {
         // method body index: 467 method index: 467
         this.mAlpha = param1 < 0 ? 0 : (param1 > 1 ? 1 : param1);
      }
      
      public function get visible() : Boolean
      {
         // method body index: 468 method index: 468
         return this.mVisible;
      }
      
      public function set visible(param1:Boolean) : void
      {
         // method body index: 469 method index: 469
         this.mVisible = param1;
      }
      
      public function get touchable() : Boolean
      {
         // method body index: 470 method index: 470
         return this.mTouchable;
      }
      
      public function set touchable(param1:Boolean) : void
      {
         // method body index: 471 method index: 471
         this.mTouchable = param1;
      }
      
      public function get blendMode() : String
      {
         // method body index: 472 method index: 472
         return this.mBlendMode;
      }
      
      public function set blendMode(param1:String) : void
      {
         // method body index: 473 method index: 473
         this.mBlendMode = param1;
      }
      
      public function get name() : String
      {
         // method body index: 474 method index: 474
         return this.mName;
      }
      
      public function set name(param1:String) : void
      {
         // method body index: 475 method index: 475
         this.mName = param1;
      }
      
      public function get filter() : FragmentFilter
      {
         // method body index: 476 method index: 476
         return this.mFilter;
      }
      
      public function set filter(param1:FragmentFilter) : void
      {
         // method body index: 477 method index: 477
         this.mFilter = param1;
      }
      
      public function get parent() : DisplayObjectContainer
      {
         // method body index: 478 method index: 478
         return this.mParent;
      }
      
      public function get base() : DisplayObject
      {
         // method body index: 479 method index: 479
         var _loc1_:DisplayObject = this;
         while(_loc1_.mParent)
         {
            _loc1_ = _loc1_.mParent;
         }
         return _loc1_;
      }
      
      public function get root() : DisplayObject
      {
         // method body index: 480 method index: 480
         var _loc1_:DisplayObject = this;
         while(_loc1_.mParent)
         {
            if(_loc1_.mParent is Stage)
            {
               return _loc1_;
            }
            _loc1_ = _loc1_.parent;
         }
         return null;
      }
      
      public function get stage() : Stage
      {
         // method body index: 481 method index: 481
         return this.base as Stage;
      }
   }
}

