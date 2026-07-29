package starling.display
{
   import flash.errors.IllegalOperationError;
   import flash.geom.Point;
   import starling.core.starling_internal;
   import starling.events.EnterFrameEvent;
   import starling.events.Event;
   
   use namespace starling_internal;
   
   public class Stage extends DisplayObjectContainer
   {
      
      private var mWidth:int;
      
      private var mHeight:int;
      
      private var mColor:uint;
      
      private var mEnterFrameEvent:EnterFrameEvent = // method body index: 1473 method index: 1473
      new EnterFrameEvent(Event.ENTER_FRAME,0);
      
      public function Stage(param1:int, param2:int, param3:uint = 0)
      {
         // method body index: 1473 method index: 1473
         super();
         this.mWidth = param1;
         this.mHeight = param2;
         this.mColor = param3;
      }
      
      public function advanceTime(param1:Number) : void
      {
         // method body index: 1474 method index: 1474
         this.mEnterFrameEvent.reset(Event.ENTER_FRAME,false,param1);
         broadcastEvent(this.mEnterFrameEvent);
      }
      
      override public function hitTest(param1:Point, param2:Boolean = false) : DisplayObject
      {
         // method body index: 1475 method index: 1475
         if(param2 && (!visible || !touchable))
         {
            return null;
         }
         if(param1.x < 0 || param1.x > this.mWidth || param1.y < 0 || param1.y > this.mHeight)
         {
            return null;
         }
         var _loc3_:DisplayObject = super.hitTest(param1,param2);
         if(_loc3_ == null)
         {
            _loc3_ = this;
         }
         return _loc3_;
      }
      
      override public function set width(param1:Number) : void
      {
         // method body index: 1476 method index: 1476
         throw new IllegalOperationError("Cannot set width of stage");
      }
      
      override public function set height(param1:Number) : void
      {
         // method body index: 1477 method index: 1477
         throw new IllegalOperationError("Cannot set height of stage");
      }
      
      override public function set x(param1:Number) : void
      {
         // method body index: 1478 method index: 1478
         throw new IllegalOperationError("Cannot set x-coordinate of stage");
      }
      
      override public function set y(param1:Number) : void
      {
         // method body index: 1479 method index: 1479
         throw new IllegalOperationError("Cannot set y-coordinate of stage");
      }
      
      override public function set scaleX(param1:Number) : void
      {
         // method body index: 1480 method index: 1480
         throw new IllegalOperationError("Cannot scale stage");
      }
      
      override public function set scaleY(param1:Number) : void
      {
         // method body index: 1481 method index: 1481
         throw new IllegalOperationError("Cannot scale stage");
      }
      
      override public function set rotation(param1:Number) : void
      {
         // method body index: 1482 method index: 1482
         throw new IllegalOperationError("Cannot rotate stage");
      }
      
      public function get color() : uint
      {
         // method body index: 1483 method index: 1483
         return this.mColor;
      }
      
      public function set color(param1:uint) : void
      {
         // method body index: 1484 method index: 1484
         this.mColor = param1;
      }
      
      public function get stageWidth() : int
      {
         // method body index: 1485 method index: 1485
         return this.mWidth;
      }
      
      public function set stageWidth(param1:int) : void
      {
         // method body index: 1486 method index: 1486
         this.mWidth = param1;
      }
      
      public function get stageHeight() : int
      {
         // method body index: 1487 method index: 1487
         return this.mHeight;
      }
      
      public function set stageHeight(param1:int) : void
      {
         // method body index: 1488 method index: 1488
         this.mHeight = param1;
      }
   }
}

