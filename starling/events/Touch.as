package starling.events
{
   import flash.geom.Matrix;
   import flash.geom.Point;
   import starling.core.starling_internal;
   import starling.display.DisplayObject;
   import starling.utils.MatrixUtil;
   import starling.utils.formatString;
   
   use namespace starling_internal;
   
   public class Touch
   {
      
      // method body index: 2792 method index: 2806
      private static var sHelperMatrix:Matrix = // method body index: 2792 method index: 2806
      new Matrix();
      
      private var mID:int;
      
      private var mGlobalX:Number;
      
      private var mGlobalY:Number;
      
      private var mPreviousGlobalX:Number;
      
      private var mPreviousGlobalY:Number;
      
      private var mTapCount:int;
      
      private var mPhase:String;
      
      private var mTarget:DisplayObject;
      
      private var mTimestamp:Number;
      
      private var mPressure:Number;
      
      private var mWidth:Number;
      
      private var mHeight:Number;
      
      private var mBubbleChain:Vector.<EventDispatcher>;
      
      public function Touch(param1:int, param2:Number, param3:Number, param4:String, param5:DisplayObject)
      {
         // method body index: 2793 method index: 2807
         super();
         this.mID = param1;
         this.mGlobalX = this.mPreviousGlobalX = param2;
         this.mGlobalY = this.mPreviousGlobalY = param3;
         this.mTapCount = 0;
         this.mPhase = param4;
         this.mTarget = param5;
         this.mPressure = this.mWidth = this.mHeight = 1;
         this.mBubbleChain = new Vector.<EventDispatcher>(0);
         this.updateBubbleChain();
      }
      
      public function getLocation(param1:DisplayObject, param2:Point = null) : Point
      {
         // method body index: 2794 method index: 2808
         if(param2 == null)
         {
            param2 = new Point();
         }
         param1.base.getTransformationMatrix(param1,sHelperMatrix);
         return MatrixUtil.transformCoords(sHelperMatrix,this.mGlobalX,this.mGlobalY,param2);
      }
      
      public function getPreviousLocation(param1:DisplayObject, param2:Point = null) : Point
      {
         // method body index: 2795 method index: 2809
         if(param2 == null)
         {
            param2 = new Point();
         }
         param1.base.getTransformationMatrix(param1,sHelperMatrix);
         return MatrixUtil.transformCoords(sHelperMatrix,this.mPreviousGlobalX,this.mPreviousGlobalY,param2);
      }
      
      public function getMovement(param1:DisplayObject, param2:Point = null) : Point
      {
         // method body index: 2796 method index: 2810
         if(param2 == null)
         {
            param2 = new Point();
         }
         this.getLocation(param1,param2);
         var _loc3_:Number = param2.x;
         var _loc4_:Number = param2.y;
         this.getPreviousLocation(param1,param2);
         param2.setTo(_loc3_ - param2.x,_loc4_ - param2.y);
         return param2;
      }
      
      public function isTouching(param1:DisplayObject) : Boolean
      {
         // method body index: 2797 method index: 2811
         return this.mBubbleChain.indexOf(param1) != -1;
      }
      
      public function toString() : String
      {
         // method body index: 2798 method index: 2812
         return formatString("Touch {0}: globalX={1}, globalY={2}, phase={3}",this.mID,this.mGlobalX,this.mGlobalY,this.mPhase);
      }
      
      public function clone() : Touch
      {
         // method body index: 2799 method index: 2813
         var _loc1_:Touch = new Touch(this.mID,this.mGlobalX,this.mGlobalY,this.mPhase,this.mTarget);
         _loc1_.mPreviousGlobalX = this.mPreviousGlobalX;
         _loc1_.mPreviousGlobalY = this.mPreviousGlobalY;
         _loc1_.mTapCount = this.mTapCount;
         _loc1_.mTimestamp = this.mTimestamp;
         _loc1_.mPressure = this.mPressure;
         _loc1_.mWidth = this.mWidth;
         _loc1_.mHeight = this.mHeight;
         return _loc1_;
      }
      
      private function updateBubbleChain() : void
      {
         // method body index: 2800 method index: 2814
         var _loc1_:* = 0;
         var _loc2_:DisplayObject = null;
         if(this.mTarget)
         {
            _loc1_ = 1;
            _loc2_ = this.mTarget;
            this.mBubbleChain.length = 1;
            this.mBubbleChain[0] = _loc2_;
            while(true)
            {
               _loc2_ = _loc2_.parent;
               if(_loc2_ == null)
               {
                  break;
               }
               this.mBubbleChain[int(_loc1_++)] = _loc2_;
            }
         }
         else
         {
            this.mBubbleChain.length = 0;
         }
      }
      
      public function get id() : int
      {
         // method body index: 2801 method index: 2815
         return this.mID;
      }
      
      public function get globalX() : Number
      {
         // method body index: 2802 method index: 2816
         return this.mGlobalX;
      }
      
      public function get globalY() : Number
      {
         // method body index: 2803 method index: 2817
         return this.mGlobalY;
      }
      
      public function get previousGlobalX() : Number
      {
         // method body index: 2804 method index: 2818
         return this.mPreviousGlobalX;
      }
      
      public function get previousGlobalY() : Number
      {
         // method body index: 2805 method index: 2819
         return this.mPreviousGlobalY;
      }
      
      public function get tapCount() : int
      {
         // method body index: 2806 method index: 2820
         return this.mTapCount;
      }
      
      public function get phase() : String
      {
         // method body index: 2807 method index: 2821
         return this.mPhase;
      }
      
      public function get target() : DisplayObject
      {
         // method body index: 2808 method index: 2822
         return this.mTarget;
      }
      
      public function get timestamp() : Number
      {
         // method body index: 2809 method index: 2823
         return this.mTimestamp;
      }
      
      public function get pressure() : Number
      {
         // method body index: 2810 method index: 2824
         return this.mPressure;
      }
      
      public function get width() : Number
      {
         // method body index: 2811 method index: 2825
         return this.mWidth;
      }
      
      public function get height() : Number
      {
         // method body index: 2812 method index: 2826
         return this.mHeight;
      }
      
      starling_internal function dispatchEvent(param1:TouchEvent) : void
      {
         // method body index: 2813 method index: 2827
         if(this.mTarget)
         {
            param1.dispatch(this.mBubbleChain);
         }
      }
      
      starling_internal function get bubbleChain() : Vector.<EventDispatcher>
      {
         // method body index: 2814 method index: 2828
         return this.mBubbleChain.concat();
      }
      
      starling_internal function setTarget(param1:DisplayObject) : void
      {
         // method body index: 2815 method index: 2829
         this.mTarget = param1;
         this.updateBubbleChain();
      }
      
      starling_internal function setPosition(param1:Number, param2:Number) : void
      {
         // method body index: 2816 method index: 2830
         this.mPreviousGlobalX = this.mGlobalX;
         this.mPreviousGlobalY = this.mGlobalY;
         this.mGlobalX = param1;
         this.mGlobalY = param2;
      }
      
      starling_internal function setSize(param1:Number, param2:Number) : void
      {
         // method body index: 2817 method index: 2831
         this.mWidth = param1;
         this.mHeight = param2;
      }
      
      starling_internal function setPhase(param1:String) : void
      {
         // method body index: 2818 method index: 2832
         this.mPhase = param1;
      }
      
      starling_internal function setTapCount(param1:int) : void
      {
         // method body index: 2819 method index: 2833
         this.mTapCount = param1;
      }
      
      starling_internal function setTimestamp(param1:Number) : void
      {
         // method body index: 2820 method index: 2834
         this.mTimestamp = param1;
      }
      
      starling_internal function setPressure(param1:Number) : void
      {
         // method body index: 2821 method index: 2835
         this.mPressure = param1;
      }
   }
}

