package flashpunk2
{
   public class Signal
   {
      
      // method body index: 560 method index: 560
      private static var _temp:Vector.<Function> = // method body index: 560 method index: 560
      new Vector.<Function>();
      
      private var _listeners:Vector.<Function> = // method body index: 561 method index: 561
      new Vector.<Function>();
      
      private var _containsNull:Boolean = false;
      
      public function Signal()
      {
         // method body index: 561 method index: 561
         super();
      }
      
      public function add(param1:Function) : void
      {
         // method body index: 562 method index: 562
         this._listeners.push(param1);
      }
      
      public function addListener(param1:Function) : void
      {
         // method body index: 563 method index: 563
         this.add(param1);
      }
      
      public function addListeners(... rest) : void
      {
         // method body index: 564 method index: 564
         var _loc2_:Function = null;
         for each(_loc2_ in rest)
         {
            this.add(_loc2_);
         }
      }
      
      public function addAtFront(param1:Function) : void
      {
         // method body index: 565 method index: 565
         _temp.push(param1);
         var _loc2_:int = 0;
         while(_loc2_ < this._listeners.length)
         {
            _temp.push(this._listeners[_loc2_]);
            _loc2_++;
         }
         var _loc3_:Vector.<Function> = this._listeners;
         this._listeners = _temp;
         _temp = _loc3_;
         _temp.length = 0;
      }
      
      public function remove(param1:Function) : void
      {
         // method body index: 566 method index: 566
         if(this._listeners.length > 0)
         {
            this._listeners[this._listeners.indexOf(param1)] = null;
            this._containsNull = true;
         }
         else
         {
            this._listeners.length = 0;
         }
      }
      
      public function clear() : void
      {
         // method body index: 567 method index: 567
         this._listeners.length = 0;
      }
      
      public function dispatch() : void
      {
         // method body index: 568 method index: 568
         var _loc1_:int = 0;
         var _loc2_:Vector.<Function> = null;
         if(this._listeners.length > 0)
         {
            if(this._containsNull)
            {
               this._containsNull = false;
               _loc1_ = 0;
               while(_loc1_ < this._listeners.length)
               {
                  if(this._listeners[_loc1_] != null)
                  {
                     _temp.push(this._listeners[_loc1_]);
                  }
                  _loc1_++;
               }
               _loc2_ = this._listeners;
               this._listeners = _temp;
               _temp = _loc2_;
               _temp.length = 0;
            }
            _loc1_ = 0;
            while(_loc1_ < this._listeners.length)
            {
               if(this._listeners[_loc1_] != null)
               {
                  this._listeners[_loc1_]();
               }
               _loc1_++;
            }
         }
      }
      
      public function get length() : int
      {
         // method body index: 569 method index: 569
         return this._listeners.length;
      }
   }
}

