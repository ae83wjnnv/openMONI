package flashpunk2.components.timing
{
   import flashpunk2.Component;
   import flashpunk2.Entity;
   import flashpunk2.global.Cache;
   import flashpunk2.global.Time;
   import flashpunk2.namespaces.fp_internal;
   
   use namespace fp_internal;
   
   public class Invoker extends Component
   {
      
      private var _callback:Function = null;
      
      private var _param:* = null;
      
      private var _elapsed:Number = 0;
      
      private var _duration:Number = 0;
      
      private var _repeat:int = 0;
      
      public function Invoker()
      {
         // method body index: 2274 method index: 2279
         super();
      }
      
      override fp_internal function start(param1:Entity) : void
      {
         // method body index: 2275 method index: 2280
         super.fp_internal::start(param1);
         param1.ON_UPDATE.add(this.onUpdate);
      }
      
      override fp_internal function end() : void
      {
         // method body index: 2276 method index: 2281
         entity.ON_UPDATE.remove(this.onUpdate);
         super.fp_internal::end();
         this._callback = null;
         this._param = null;
         this._elapsed = 0;
         this._duration = 0;
         this._repeat = 0;
         if(Cache.marked(this))
         {
            Cache.push(this);
         }
      }
      
      private function onUpdate() : void
      {
         // method body index: 2277 method index: 2282
         if(this._elapsed < this._duration)
         {
            this._elapsed += Time.dt;
            if(this._elapsed >= this._duration)
            {
               if(this._callback != null)
               {
                  if(this._param != null)
                  {
                     this._callback(this._param);
                  }
                  else
                  {
                     this._callback();
                  }
               }
               if(this._repeat == 0)
               {
                  removeSelf();
               }
               else
               {
                  --this._repeat;
                  this._elapsed -= this._duration;
               }
            }
         }
      }
      
      public function init(param1:Function, param2:*, param3:Number, param4:int) : void
      {
         // method body index: 2278 method index: 2283
         this._elapsed = 0;
         this._duration = param3;
         this._callback = param1;
         this._param = param2;
         this._repeat = param4;
      }
      
      public function get elapsed() : Number
      {
         // method body index: 2279 method index: 2284
         return this._elapsed;
      }
      
      public function get duration() : Number
      {
         // method body index: 2280 method index: 2285
         return this._duration;
      }
      
      public function get callback() : Function
      {
         // method body index: 2281 method index: 2286
         return this._callback;
      }
      
      public function get param() : *
      {
         // method body index: 2282 method index: 2287
         return this._param;
      }
   }
}

