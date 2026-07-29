package starling.animation
{
   import starling.core.starling_internal;
   import starling.events.Event;
   import starling.events.EventDispatcher;
   
   public class Juggler implements IAnimatable
   {
      
      private var mObjects:Vector.<IAnimatable>;
      
      private var mElapsedTime:Number;
      
      public function Juggler()
      {
         // method body index: 1834 method index: 1837
         super();
         this.mElapsedTime = 0;
         this.mObjects = new Vector.<IAnimatable>(0);
      }
      
      public function add(param1:IAnimatable) : void
      {
         // method body index: 1835 method index: 1838
         var _loc2_:EventDispatcher = null;
         if(Boolean(param1) && this.mObjects.indexOf(param1) == -1)
         {
            this.mObjects.push(param1);
            _loc2_ = param1 as EventDispatcher;
            if(_loc2_)
            {
               _loc2_.addEventListener(Event.REMOVE_FROM_JUGGLER,this.onRemove);
            }
         }
      }
      
      public function contains(param1:IAnimatable) : Boolean
      {
         // method body index: 1836 method index: 1839
         return this.mObjects.indexOf(param1) != -1;
      }
      
      public function remove(param1:IAnimatable) : void
      {
         // method body index: 1837 method index: 1840
         if(param1 == null)
         {
            return;
         }
         var _loc2_:EventDispatcher = param1 as EventDispatcher;
         if(_loc2_)
         {
            _loc2_.removeEventListener(Event.REMOVE_FROM_JUGGLER,this.onRemove);
         }
         var _loc3_:int = this.mObjects.indexOf(param1);
         if(_loc3_ != -1)
         {
            this.mObjects[_loc3_] = null;
         }
      }
      
      public function removeTweens(param1:Object) : void
      {
         // method body index: 1838 method index: 1841
         var _loc3_:Tween = null;
         if(param1 == null)
         {
            return;
         }
         var _loc2_:* = int(this.mObjects.length - 1);
         while(_loc2_ >= 0)
         {
            _loc3_ = this.mObjects[_loc2_] as Tween;
            if(Boolean(_loc3_) && _loc3_.target == param1)
            {
               _loc3_.removeEventListener(Event.REMOVE_FROM_JUGGLER,this.onRemove);
               this.mObjects[_loc2_] = null;
            }
            _loc2_--;
         }
      }
      
      public function containsTweens(param1:Object) : Boolean
      {
         // method body index: 1839 method index: 1842
         var _loc3_:Tween = null;
         if(param1 == null)
         {
            return false;
         }
         var _loc2_:* = int(this.mObjects.length - 1);
         while(_loc2_ >= 0)
         {
            _loc3_ = this.mObjects[_loc2_] as Tween;
            if(Boolean(_loc3_) && _loc3_.target == param1)
            {
               return true;
            }
            _loc2_--;
         }
         return false;
      }
      
      public function purge() : void
      {
         // method body index: 1840 method index: 1843
         var _loc2_:EventDispatcher = null;
         var _loc1_:* = int(this.mObjects.length - 1);
         while(_loc1_ >= 0)
         {
            _loc2_ = this.mObjects[_loc1_] as EventDispatcher;
            if(_loc2_)
            {
               _loc2_.removeEventListener(Event.REMOVE_FROM_JUGGLER,this.onRemove);
            }
            this.mObjects[_loc1_] = null;
            _loc1_--;
         }
      }
      
      public function delayCall(param1:Function, param2:Number, ... rest) : DelayedCall
      {
         // method body index: 1841 method index: 1844
         if(param1 == null)
         {
            return null;
         }
         var _loc4_:DelayedCall = new DelayedCall(param1,param2,rest);
         this.add(_loc4_);
         return _loc4_;
      }
      
      public function tween(param1:Object, param2:Number, param3:Object) : void
      {
         // method body index: 1842 method index: 1845
         var _loc5_:String = null;
         var _loc6_:Object = null;
         var _loc4_:Tween = Tween.starling_internal::fromPool(param1,param2);
         for(_loc5_ in param3)
         {
            _loc6_ = param3[_loc5_];
            if(_loc4_.hasOwnProperty(_loc5_))
            {
               _loc4_[_loc5_] = _loc6_;
            }
            else
            {
               if(!param1.hasOwnProperty(_loc5_))
               {
                  throw new ArgumentError("Invalid property: " + _loc5_);
               }
               _loc4_.animate(_loc5_,_loc6_ as Number);
            }
         }
         _loc4_.addEventListener(Event.REMOVE_FROM_JUGGLER,this.onPooledTweenComplete);
         this.add(_loc4_);
      }
      
      private function onPooledTweenComplete(param1:Event) : void
      {
         // method body index: 1843 method index: 1846
         Tween.starling_internal::toPool(param1.target as Tween);
      }
      
      public function advanceTime(param1:Number) : void
      {
         // method body index: 1844 method index: 1847
         var _loc4_:* = 0;
         var _loc5_:IAnimatable = null;
         var _loc2_:int = int(this.mObjects.length);
         var _loc3_:* = 0;
         this.mElapsedTime += param1;
         if(_loc2_ == 0)
         {
            return;
         }
         _loc4_ = 0;
         while(_loc4_ < _loc2_)
         {
            _loc5_ = this.mObjects[_loc4_];
            if(_loc5_)
            {
               if(_loc3_ != _loc4_)
               {
                  this.mObjects[_loc3_] = _loc5_;
                  this.mObjects[_loc4_] = null;
               }
               _loc5_.advanceTime(param1);
               _loc3_++;
            }
            _loc4_++;
         }
         if(_loc3_ != _loc4_)
         {
            _loc2_ = int(this.mObjects.length);
            while(_loc4_ < _loc2_)
            {
               this.mObjects[int(_loc3_++)] = this.mObjects[int(_loc4_++)];
            }
            this.mObjects.length = _loc3_;
         }
      }
      
      private function onRemove(param1:Event) : void
      {
         // method body index: 1845 method index: 1848
         this.remove(param1.target as IAnimatable);
         var _loc2_:Tween = param1.target as Tween;
         if(Boolean(_loc2_) && _loc2_.isComplete)
         {
            this.add(_loc2_.nextTween);
         }
      }
      
      public function get elapsedTime() : Number
      {
         // method body index: 1846 method index: 1849
         return this.mElapsedTime;
      }
   }
}

