package zpp_nape.space
{
   import flash.Boot;
   import zpp_nape.util.ZNPList_ZPP_Component;
   
   public class ZPP_Island
   {
      
      // method body index: 3205 method index: 3394
      public static var zpp_pool:ZPP_Island = // method body index: 3231 method index: 3427
      null;
      
      public var waket:int;
      
      public var sleep:Boolean;
      
      public var pushmod:Boolean;
      
      public var next:ZPP_Island;
      
      public var modified:Boolean;
      
      public var length:int;
      
      public var comps:ZNPList_ZPP_Component;
      
      public var _inuse:Boolean;
      
      public function ZPP_Island()
      {
         // method body index: 3230 method index: 3393
         if(Boot.skip_constructor)
         {
            return;
         }
         waket = 0;
         sleep = false;
         comps = null;
         length = 0;
         pushmod = false;
         modified = false;
         _inuse = false;
         next = null;
         comps = new ZNPList_ZPP_Component();
      }
      
      public function try_remove(param1:ZPP_Island) : Boolean
      {
         // method body index: 3206 method index: 3395
         var _loc2_:ZPP_Island = null;
         var _loc3_:ZPP_Island = next;
         var _loc4_:Boolean = false;
         while(_loc3_ != null)
         {
            if(_loc3_ == param1)
            {
               erase(_loc2_);
               _loc4_ = true;
               break;
            }
            _loc2_ = _loc3_;
            _loc3_ = _loc3_.next;
         }
         return _loc4_;
      }
      
      public function splice(param1:ZPP_Island, param2:int) : ZPP_Island
      {
         // method body index: 3207 method index: 3396
         while(param2-- > 0 && param1.next != null)
         {
            erase(param1);
         }
         return param1.next;
      }
      
      public function size() : int
      {
         // method body index: 3208 method index: 3397
         return length;
      }
      
      public function reverse() : void
      {
         // method body index: 3209 method index: 3399
         var _loc3_:* = null as ZPP_Island;
         var _loc1_:ZPP_Island = next;
         var _loc2_:ZPP_Island = null;
         while(_loc1_ != null)
         {
            _loc3_ = _loc1_.next;
            _loc1_.next = _loc2_;
            next = _loc1_;
            _loc2_ = _loc1_;
            _loc1_ = _loc3_;
         }
         modified = true;
         pushmod = true;
      }
      
      public function remove(param1:ZPP_Island) : void
      {
         // method body index: 3210 method index: 3400
         var _loc5_:* = null as ZPP_Island;
         var _loc6_:* = null as ZPP_Island;
         var _loc2_:ZPP_Island = null;
         var _loc3_:ZPP_Island = next;
         var _loc4_:Boolean = false;
         while(_loc3_ != null)
         {
            if(_loc3_ == param1)
            {
               if(_loc2_ == null)
               {
                  _loc5_ = next;
                  _loc6_ = _loc5_.next;
                  next = _loc6_;
                  if(next == null)
                  {
                     pushmod = true;
                  }
               }
               else
               {
                  _loc5_ = _loc2_.next;
                  _loc6_ = _loc5_.next;
                  _loc2_.next = _loc6_;
                  if(_loc6_ == null)
                  {
                     pushmod = true;
                  }
               }
               _loc5_._inuse = false;
               modified = true;
               --length;
               pushmod = true;
               _loc6_;
               _loc4_ = true;
               break;
            }
            _loc2_ = _loc3_;
            _loc3_ = _loc3_.next;
         }
         _loc4_;
      }
      
      public function pop_unsafe() : ZPP_Island
      {
         // method body index: 3211 method index: 3401
         var _loc1_:ZPP_Island = next;
         pop();
         return _loc1_;
      }
      
      public function pop() : void
      {
         // method body index: 3212 method index: 3402
         var _loc1_:ZPP_Island = next;
         next = _loc1_.next;
         _loc1_._inuse = false;
         if(next == null)
         {
            pushmod = true;
         }
         modified = true;
         --length;
      }
      
      public function iterator_at(param1:int) : ZPP_Island
      {
         // method body index: 3213 method index: 3403
         var _loc2_:ZPP_Island = next;
         while(param1-- > 0 && _loc2_ != null)
         {
            _loc2_ = _loc2_.next;
         }
         return _loc2_;
      }
      
      public function insert(param1:ZPP_Island, param2:ZPP_Island) : ZPP_Island
      {
         // method body index: 3214 method index: 3404
         param2._inuse = true;
         var _loc3_:ZPP_Island = param2;
         if(param1 == null)
         {
            _loc3_.next = next;
            next = _loc3_;
         }
         else
         {
            _loc3_.next = param1.next;
            param1.next = _loc3_;
         }
         pushmod = modified = true;
         ++length;
         return _loc3_;
      }
      
      public function inlined_pop_unsafe() : ZPP_Island
      {
         // method body index: 3215 method index: 3407
         var _loc1_:ZPP_Island = next;
         pop();
         return _loc1_;
      }
      
      public function inlined_pop() : void
      {
         // method body index: 3216 method index: 3408
         var _loc1_:ZPP_Island = next;
         next = _loc1_.next;
         _loc1_._inuse = false;
         if(next == null)
         {
            pushmod = true;
         }
         modified = true;
         --length;
      }
      
      public function inlined_insert(param1:ZPP_Island, param2:ZPP_Island) : ZPP_Island
      {
         // method body index: 3217 method index: 3409
         param2._inuse = true;
         var _loc3_:ZPP_Island = param2;
         if(param1 == null)
         {
            _loc3_.next = next;
            next = _loc3_;
         }
         else
         {
            _loc3_.next = param1.next;
            param1.next = _loc3_;
         }
         pushmod = modified = true;
         ++length;
         return _loc3_;
      }
      
      public function inlined_has(param1:ZPP_Island) : Boolean
      {
         // method body index: 3218 method index: 3410
         var _loc4_:* = null as ZPP_Island;
         var _loc2_:Boolean = false;
         var _loc3_:ZPP_Island = next;
         while(_loc3_ != null)
         {
            _loc4_ = _loc3_;
            if(_loc4_ == param1)
            {
               _loc2_ = true;
               break;
            }
            _loc3_ = _loc3_.next;
         }
         return _loc2_;
      }
      
      public function inlined_erase(param1:ZPP_Island) : ZPP_Island
      {
         // method body index: 3219 method index: 3411
         var _loc2_:* = null as ZPP_Island;
         var _loc3_:* = null as ZPP_Island;
         if(param1 == null)
         {
            _loc2_ = next;
            _loc3_ = _loc2_.next;
            next = _loc3_;
            if(next == null)
            {
               pushmod = true;
            }
         }
         else
         {
            _loc2_ = param1.next;
            _loc3_ = _loc2_.next;
            param1.next = _loc3_;
            if(_loc3_ == null)
            {
               pushmod = true;
            }
         }
         _loc2_._inuse = false;
         modified = true;
         --length;
         pushmod = true;
         return _loc3_;
      }
      
      public function inlined_clear() : void
      {
         // method body index: 3220 method index: 3412
      }
      
      public function inlined_add(param1:ZPP_Island) : ZPP_Island
      {
         // method body index: 3221 method index: 3413
         param1._inuse = true;
         var _loc2_:ZPP_Island = param1;
         _loc2_.next = next;
         next = _loc2_;
         modified = true;
         ++length;
         return param1;
      }
      
      public function has(param1:ZPP_Island) : Boolean
      {
         // method body index: 3222 method index: 3414
         var _loc4_:* = null as ZPP_Island;
         var _loc2_:Boolean = false;
         var _loc3_:ZPP_Island = next;
         while(_loc3_ != null)
         {
            _loc4_ = _loc3_;
            if(_loc4_ == param1)
            {
               _loc2_ = true;
               break;
            }
            _loc3_ = _loc3_.next;
         }
         return _loc2_;
      }
      
      public function erase(param1:ZPP_Island) : ZPP_Island
      {
         // method body index: 3223 method index: 3417
         var _loc2_:* = null as ZPP_Island;
         var _loc3_:* = null as ZPP_Island;
         if(param1 == null)
         {
            _loc2_ = next;
            _loc3_ = _loc2_.next;
            next = _loc3_;
            if(next == null)
            {
               pushmod = true;
            }
         }
         else
         {
            _loc2_ = param1.next;
            _loc3_ = _loc2_.next;
            param1.next = _loc3_;
            if(_loc3_ == null)
            {
               pushmod = true;
            }
         }
         _loc2_._inuse = false;
         modified = true;
         --length;
         pushmod = true;
         return _loc3_;
      }
      
      public function clear() : void
      {
         // method body index: 3224 method index: 3420
      }
      
      public function begin() : ZPP_Island
      {
         // method body index: 3225 method index: 3421
         return next;
      }
      
      public function back() : ZPP_Island
      {
         // method body index: 3226 method index: 3422
         var _loc1_:ZPP_Island = next;
         var _loc2_:ZPP_Island = _loc1_;
         while(_loc2_ != null)
         {
            _loc1_ = _loc2_;
            _loc2_ = _loc2_.next;
         }
         return _loc1_;
      }
      
      public function at(param1:int) : ZPP_Island
      {
         // method body index: 3227 method index: 3423
         var _loc2_:ZPP_Island = iterator_at(param1);
         return _loc2_ != null ? _loc2_ : null;
      }
      
      public function addAll(param1:ZPP_Island) : void
      {
         // method body index: 3228 method index: 3425
         var _loc3_:* = null as ZPP_Island;
         var _loc2_:ZPP_Island = param1.next;
         while(_loc2_ != null)
         {
            _loc3_ = _loc2_;
            add(_loc3_);
            _loc2_ = _loc2_.next;
         }
      }
      
      public function add(param1:ZPP_Island) : ZPP_Island
      {
         // method body index: 3229 method index: 3426
         param1._inuse = true;
         var _loc2_:ZPP_Island = param1;
         _loc2_.next = next;
         next = _loc2_;
         modified = true;
         ++length;
         return param1;
      }
   }
}

