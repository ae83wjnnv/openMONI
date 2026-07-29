package starling.events
{
   import com.jpexs.decompiler.flash.debugger.debugGetQualifiedClassName;
   import starling.core.starling_internal;
   import starling.utils.formatString;
   
   use namespace starling_internal;
   
   public class Event
   {
      
      // method body index: 638 method index: 638
      public static const ADDED:String = // method body index: 638 method index: 638
      "added";
      
      public static const ADDED_TO_STAGE:String = // method body index: 638 method index: 638
      "addedToStage";
      
      public static const ENTER_FRAME:String = // method body index: 638 method index: 638
      "enterFrame";
      
      public static const REMOVED:String = // method body index: 638 method index: 638
      "removed";
      
      public static const REMOVED_FROM_STAGE:String = // method body index: 638 method index: 638
      "removedFromStage";
      
      public static const TRIGGERED:String = // method body index: 638 method index: 638
      "triggered";
      
      public static const FLATTEN:String = // method body index: 638 method index: 638
      "flatten";
      
      public static const RESIZE:String = // method body index: 638 method index: 638
      "resize";
      
      public static const COMPLETE:String = // method body index: 638 method index: 638
      "complete";
      
      public static const CONTEXT3D_CREATE:String = // method body index: 638 method index: 638
      "context3DCreate";
      
      public static const ROOT_CREATED:String = // method body index: 638 method index: 638
      "rootCreated";
      
      public static const REMOVE_FROM_JUGGLER:String = // method body index: 638 method index: 638
      "removeFromJuggler";
      
      public static const CHANGE:String = // method body index: 638 method index: 638
      "change";
      
      public static const CANCEL:String = // method body index: 638 method index: 638
      "cancel";
      
      public static const SCROLL:String = // method body index: 638 method index: 638
      "scroll";
      
      public static const OPEN:String = // method body index: 638 method index: 638
      "open";
      
      public static const CLOSE:String = // method body index: 638 method index: 638
      "close";
      
      public static const SELECT:String = // method body index: 638 method index: 638
      "select";
      
      private static var sEventPool:Vector.<Event> = // method body index: 638 method index: 638
      new Vector.<Event>(0);
      
      private var mTarget:EventDispatcher;
      
      private var mCurrentTarget:EventDispatcher;
      
      private var mType:String;
      
      private var mBubbles:Boolean;
      
      private var mStopsPropagation:Boolean;
      
      private var mStopsImmediatePropagation:Boolean;
      
      private var mData:Object;
      
      public function Event(param1:String, param2:Boolean = false, param3:Object = null)
      {
         // method body index: 641 method index: 641
         super();
         this.mType = param1;
         this.mBubbles = param2;
         this.mData = param3;
      }
      
      starling_internal static function fromPool(param1:String, param2:Boolean = false, param3:Object = null) : Event
      {
         // method body index: 639 method index: 639
         if(sEventPool.length)
         {
            return sEventPool.pop().reset(param1,param2,param3);
         }
         return new Event(param1,param2,param3);
      }
      
      starling_internal static function toPool(param1:Event) : void
      {
         // method body index: 640 method index: 640
         param1.mData = param1.mTarget = param1.mCurrentTarget = null;
         sEventPool.push(param1);
      }
      
      public function stopPropagation() : void
      {
         // method body index: 642 method index: 642
         this.mStopsPropagation = true;
      }
      
      public function stopImmediatePropagation() : void
      {
         // method body index: 643 method index: 643
         this.mStopsPropagation = this.mStopsImmediatePropagation = true;
      }
      
      public function toString() : String
      {
         // method body index: 644 method index: 644
         return formatString("[{0} type=\"{1}\" bubbles={2}]",debugGetQualifiedClassName(this).split("::").pop(),this.mType,this.mBubbles);
      }
      
      public function get bubbles() : Boolean
      {
         // method body index: 645 method index: 645
         return this.mBubbles;
      }
      
      public function get target() : EventDispatcher
      {
         // method body index: 646 method index: 646
         return this.mTarget;
      }
      
      public function get currentTarget() : EventDispatcher
      {
         // method body index: 647 method index: 647
         return this.mCurrentTarget;
      }
      
      public function get type() : String
      {
         // method body index: 648 method index: 648
         return this.mType;
      }
      
      public function get data() : Object
      {
         // method body index: 649 method index: 649
         return this.mData;
      }
      
      internal function setTarget(param1:EventDispatcher) : void
      {
         // method body index: 650 method index: 650
         this.mTarget = param1;
      }
      
      internal function setCurrentTarget(param1:EventDispatcher) : void
      {
         // method body index: 651 method index: 651
         this.mCurrentTarget = param1;
      }
      
      internal function setData(param1:Object) : void
      {
         // method body index: 652 method index: 652
         this.mData = param1;
      }
      
      internal function get stopsPropagation() : Boolean
      {
         // method body index: 653 method index: 653
         return this.mStopsPropagation;
      }
      
      internal function get stopsImmediatePropagation() : Boolean
      {
         // method body index: 654 method index: 654
         return this.mStopsImmediatePropagation;
      }
      
      starling_internal function reset(param1:String, param2:Boolean = false, param3:Object = null) : Event
      {
         // method body index: 655 method index: 655
         this.mType = param1;
         this.mBubbles = param2;
         this.mData = param3;
         this.mTarget = this.mCurrentTarget = null;
         this.mStopsPropagation = this.mStopsImmediatePropagation = false;
         return this;
      }
   }
}

