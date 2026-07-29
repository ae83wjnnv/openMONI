package flashpunk2.components.timing
{
   import flashpunk2.Component;
   import flashpunk2.Entity;
   import flashpunk2.global.Cache;
   import flashpunk2.global.Time;
   import flashpunk2.namespaces.fp_internal;
   
   use namespace fp_internal;
   
   public class Tween extends Component
   {
      
      private var _target:Object;
      
      private var _startValues:Object = // method body index: 876 method index: 876
      {};
      
      private var _deltaValues:Object = // method body index: 876 method index: 876
      {};
      
      private var _duration:Number;
      
      private var _elapsed:Number;
      
      private var _delay:Number;
      
      private var _ease:Function;
      
      private var _repeat:int;
      
      private var _yoyo:Boolean;
      
      private var _onUpdate:Function;
      
      private var _onUpdateParam:*;
      
      private var _onComplete:Function;
      
      private var _onCompleteParam:*;
      
      private var _reverse:Boolean;
      
      public function Tween()
      {
         // method body index: 876 method index: 876
         super();
      }
      
      override fp_internal function start(param1:Entity) : void
      {
         // method body index: 877 method index: 877
         super.fp_internal::start(param1);
         param1.ON_UPDATE.add(this.update);
      }
      
      override fp_internal function end() : void
      {
         // method body index: 878 method index: 878
         entity.ON_UPDATE.remove(this.update);
         super.fp_internal::end();
         this.clear();
         if(Cache.marked(this))
         {
            Cache.push(this);
         }
      }
      
      public function init(param1:Object, param2:Number, param3:Object = null) : Tween
      {
         // method body index: 879 method index: 879
         var _loc4_:String = null;
         this.clear();
         this._target = param1;
         this._duration = param2;
         this._elapsed = 0;
         if(param3 != null)
         {
            for(_loc4_ in param3)
            {
               switch(_loc4_)
               {
                  case "delay":
                     if(typeof param3[_loc4_] != "number")
                     {
                        throw new Error("Special parameter \'delay\' must be a numerical value.");
                     }
                     this._delay = param3[_loc4_];
                     break;
                  case "ease":
                     if(typeof param3[_loc4_] != "function")
                     {
                        throw new Error("Special parameter \'ease\' must be a function reference.");
                     }
                     this._ease = param3[_loc4_];
                     break;
                  case "repeat":
                     if(typeof param3[_loc4_] != "number")
                     {
                        throw new Error("Special parameter \'repeat\' must be an integer value.");
                     }
                     this._repeat = param3[_loc4_];
                     break;
                  case "yoyo":
                     if(typeof param3[_loc4_] != "boolean")
                     {
                        throw new Error("Special parameter \'yoyo\' must be a boolean value.");
                     }
                     this._yoyo = param3[_loc4_];
                     break;
                  case "onComplete":
                     if(typeof param3[_loc4_] != "function")
                     {
                        throw new Error("Special parameter \'onComplete\' must be a function reference.");
                     }
                     this._onComplete = param3[_loc4_];
                     break;
                  case "onCompleteParam":
                     this._onCompleteParam = param3[_loc4_];
                     break;
                  case "onUpdate":
                     if(typeof param3[_loc4_] != "function")
                     {
                        throw new Error("Special parameter \'onUpdate\' must be a function reference.");
                     }
                     this._onUpdate = param3[_loc4_];
                     break;
                  case "onUpdateParam":
                     this._onUpdateParam = param3[_loc4_];
                     break;
                  default:
                     if(typeof param3[_loc4_] != "number")
                     {
                        throw new Error("Can only tween numerical values. Parameter is invalid: " + _loc4_);
                     }
                     this.to(_loc4_,param3[_loc4_]);
               }
            }
         }
         return this;
      }
      
      private function update() : void
      {
         // method body index: 880 method index: 880
         var _loc1_:Number = NaN;
         var _loc2_:String = null;
         if(this._delay <= 0)
         {
            this._elapsed += Time.dt;
            if(this._elapsed > this._duration)
            {
               this._elapsed = this._duration;
            }
            _loc1_ = this._elapsed / this._duration;
            if(this._ease != null)
            {
               _loc1_ = this._ease(_loc1_);
            }
            if(this._reverse)
            {
               _loc1_ = 1 - _loc1_;
            }
            for(_loc2_ in this._startValues)
            {
               this._target[_loc2_] = this._startValues[_loc2_] + this._deltaValues[_loc2_] * _loc1_;
            }
            if(this._onUpdate != null)
            {
               if(this._onUpdateParam != null)
               {
                  this._onUpdate(this._onUpdateParam);
               }
               else
               {
                  this._onUpdate();
               }
            }
            if(this._elapsed >= this._duration)
            {
               if(this._yoyo)
               {
                  this._reverse = !this._reverse;
               }
               this._elapsed = 0;
               if(this._onComplete != null)
               {
                  if(this._onCompleteParam != null)
                  {
                     this._onComplete(this._onCompleteParam);
                  }
                  else
                  {
                     this._onComplete();
                  }
               }
               if(this._repeat > 0)
               {
                  --this._repeat;
               }
               else if(this._repeat == 0)
               {
                  removeSelf();
               }
            }
         }
         else
         {
            this._delay -= Time.dt;
            if(this._delay < 0)
            {
               this._delay = 0;
            }
         }
      }
      
      private function clear() : void
      {
         // method body index: 881 method index: 881
         var _loc1_:String = null;
         this._delay = 0;
         this._ease = null;
         this._repeat = 0;
         this._yoyo = false;
         this._onUpdate = null;
         this._onUpdateParam = null;
         this._onComplete = null;
         this._onCompleteParam = null;
         this._reverse = false;
         for(_loc1_ in this._startValues)
         {
            delete this._startValues[_loc1_];
            delete this._deltaValues[_loc1_];
         }
      }
      
      public function to(param1:String, param2:Number) : Tween
      {
         // method body index: 882 method index: 882
         if(!this._target.hasOwnProperty(param1))
         {
            throw new Error("Target object does not contain public numeric property: " + param1);
         }
         if(typeof this._target[param1] != "number")
         {
            throw new Error("Can only tween numerical values. Target\'s property is invalid: " + param1);
         }
         this._startValues[param1] = this._target[param1];
         this._deltaValues[param1] = param2 - this._target[param1];
         return this;
      }
      
      public function from(param1:String, param2:Number) : Tween
      {
         // method body index: 883 method index: 883
         if(!this._target.hasOwnProperty(param1))
         {
            throw new Error("Target object does not contain public numeric property: " + param1);
         }
         if(typeof this._target[param1] != "number")
         {
            throw new Error("Can only tween numerical values. Target\'s property is invalid: " + param1);
         }
         this._startValues[param1] = param2;
         this._deltaValues[param1] = this._target[param1] - param2;
         this._target[param1] = param2;
         return this;
      }
      
      public function moveTo(param1:Number, param2:Number) : Tween
      {
         // method body index: 884 method index: 884
         this.to("x",param1);
         this.to("y",param2);
         return this;
      }
      
      public function moveFrom(param1:Number, param2:Number) : Tween
      {
         // method body index: 885 method index: 885
         this.from("x",param1);
         this.from("y",param2);
         return this;
      }
      
      public function scaleTo(param1:Number, param2:Number) : Tween
      {
         // method body index: 886 method index: 886
         this.to("scaleX",param1);
         this.to("scaleY",param2);
         return this;
      }
      
      public function scaleFrom(param1:Number, param2:Number) : Tween
      {
         // method body index: 887 method index: 887
         this.from("scaleX",param1);
         this.from("scaleY",param2);
         return this;
      }
      
      public function delay(param1:Number) : Tween
      {
         // method body index: 888 method index: 888
         this._delay = param1;
         return this;
      }
      
      public function ease(param1:Function) : Tween
      {
         // method body index: 889 method index: 889
         this._ease = param1;
         return this;
      }
      
      public function repeat(param1:int, param2:Boolean = false) : Tween
      {
         // method body index: 890 method index: 890
         this._repeat = param1;
         this._yoyo = param2;
         return this;
      }
      
      public function onUpdate(param1:Function, param2:* = null) : Tween
      {
         // method body index: 891 method index: 891
         this._onUpdate = param1;
         this._onUpdateParam = param2;
         return this;
      }
      
      public function onComplete(param1:Function, param2:* = null) : Tween
      {
         // method body index: 892 method index: 892
         this._onComplete = param1;
         this._onCompleteParam = param2;
         return this;
      }
      
      public function runToCompletion(param1:Boolean) : void
      {
         // method body index: 893 method index: 893
         var _loc3_:String = null;
         var _loc2_:int = this._reverse ? 0 : 1;
         for(_loc3_ in this._startValues)
         {
            this._target[_loc3_] = this._startValues[_loc3_] + this._deltaValues[_loc3_] * _loc2_;
         }
         if(param1 && this._onComplete != null)
         {
            if(this._onCompleteParam != null)
            {
               this._onComplete(this._onCompleteParam);
            }
            else
            {
               this._onComplete();
            }
         }
         entity.remove(this);
      }
      
      public function stop() : void
      {
         // method body index: 894 method index: 894
         entity.remove(this);
      }
      
      public function get target() : Object
      {
         // method body index: 895 method index: 895
         return this._target;
      }
      
      public function get elapsed() : Number
      {
         // method body index: 896 method index: 896
         return this._elapsed;
      }
      
      public function get duration() : Number
      {
         // method body index: 897 method index: 897
         return this._duration;
      }
      
      public function get percent() : Number
      {
         // method body index: 898 method index: 898
         return this._elapsed / this._duration;
      }
   }
}

