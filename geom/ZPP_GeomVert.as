package zpp_nape.geom
{
   import flash.Boot;
   import nape.geom.Vec2;
   import zpp_nape.util.ZPP_PubPool;
   
   public class ZPP_GeomVert
   {
      
      // method body index: 3344 method index: 3567
      public static var zpp_pool:ZPP_GeomVert = // method body index: 3351 method index: 3574
      null;
      
      public var y:Number;
      
      public var x:Number;
      
      public var wrap:Vec2;
      
      public var prev:ZPP_GeomVert;
      
      public var next:ZPP_GeomVert;
      
      public var forced:Boolean;
      
      public function ZPP_GeomVert()
      {
         // method body index: 3350 method index: 3566
         if(Boot.skip_constructor)
         {
            return;
         }
         forced = false;
         wrap = null;
         next = null;
         prev = null;
         y = 0;
         x = 0;
      }
      
      public static function get(param1:Number, param2:Number) : ZPP_GeomVert
      {
         // method body index: 3343 method index: 3573
         var _loc3_:* = null as ZPP_GeomVert;
         if(ZPP_GeomVert.zpp_pool == null)
         {
            _loc3_ = new ZPP_GeomVert();
         }
         else
         {
            _loc3_ = ZPP_GeomVert.zpp_pool;
            ZPP_GeomVert.zpp_pool = _loc3_.next;
            _loc3_.next = null;
         }
         _loc3_.forced = false;
         _loc3_.x = param1;
         _loc3_.y = param2;
         return _loc3_;
      }
      
      public function wrapper() : Vec2
      {
         // method body index: 3345 method index: 3568
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         var _loc3_:Boolean = false;
         var _loc4_:* = null as Vec2;
         var _loc5_:Boolean = false;
         var _loc6_:* = null as ZPP_Vec2;
         if(wrap == null)
         {
            §§push(§§findproperty(wrap));
            _loc1_ = x;
            _loc2_ = y;
            _loc3_ = false;
            if(_loc1_ != _loc1_ || _loc2_ != _loc2_)
            {
               Boot.lastError = new Error();
               throw "Error: Vec2 components cannot be NaN";
            }
            if(ZPP_PubPool.poolVec2 == null)
            {
               _loc4_ = new Vec2();
            }
            else
            {
               _loc4_ = ZPP_PubPool.poolVec2;
               ZPP_PubPool.poolVec2 = _loc4_.zpp_pool;
               _loc4_.zpp_pool = null;
               _loc4_.zpp_disp = false;
               if(_loc4_ == ZPP_PubPool.nextVec2)
               {
                  ZPP_PubPool.nextVec2 = null;
               }
            }
            if(_loc4_.zpp_inner == null)
            {
               §§push(_loc4_);
               _loc5_ = false;
               if(ZPP_Vec2.zpp_pool == null)
               {
                  _loc6_ = new ZPP_Vec2();
               }
               else
               {
                  _loc6_ = ZPP_Vec2.zpp_pool;
                  ZPP_Vec2.zpp_pool = _loc6_.next;
                  _loc6_.next = null;
               }
               _loc6_.weak = false;
               _loc6_._immutable = _loc5_;
               _loc6_.x = _loc1_;
               _loc6_.y = _loc2_;
               §§pop().zpp_inner = _loc6_;
               _loc4_.zpp_inner.outer = _loc4_;
            }
            else
            {
               if(_loc4_ != null && _loc4_.zpp_disp)
               {
                  Boot.lastError = new Error();
                  throw "Error: " + "Vec2" + " has been disposed and cannot be used!";
               }
               _loc6_ = _loc4_.zpp_inner;
               if(_loc6_._immutable)
               {
                  Boot.lastError = new Error();
                  throw "Error: Vec2 is immutable";
               }
               if(_loc6_._isimmutable != null)
               {
                  _loc6_._isimmutable();
               }
               if(_loc1_ != _loc1_ || _loc2_ != _loc2_)
               {
                  Boot.lastError = new Error();
                  throw "Error: Vec2 components cannot be NaN";
               }
               §§push(false);
               if(_loc4_ != null && _loc4_.zpp_disp)
               {
                  Boot.lastError = new Error();
                  throw "Error: " + "Vec2" + " has been disposed and cannot be used!";
               }
               _loc6_ = _loc4_.zpp_inner;
               if(_loc6_._validate != null)
               {
                  _loc6_._validate();
               }
               if(_loc4_.zpp_inner.x == _loc1_)
               {
                  §§pop();
                  if(_loc4_ != null && _loc4_.zpp_disp)
                  {
                     Boot.lastError = new Error();
                     throw "Error: " + "Vec2" + " has been disposed and cannot be used!";
                  }
                  _loc6_ = _loc4_.zpp_inner;
                  if(_loc6_._validate != null)
                  {
                     _loc6_._validate();
                  }
                  §§push(_loc4_.zpp_inner.y == _loc2_);
               }
               if(!§§pop())
               {
                  _loc4_.zpp_inner.x = _loc1_;
                  _loc4_.zpp_inner.y = _loc2_;
                  _loc6_ = _loc4_.zpp_inner;
                  if(_loc6_._invalidate != null)
                  {
                     _loc6_._invalidate(_loc6_);
                  }
               }
               _loc4_;
            }
            _loc4_.zpp_inner.weak = _loc3_;
            §§pop().wrap = _loc4_;
            wrap.zpp_inner._inuse = true;
            wrap.zpp_inner._invalidate = modwrap;
            wrap.zpp_inner._validate = getwrap;
         }
         return wrap;
      }
      
      public function modwrap(param1:ZPP_Vec2) : void
      {
         // method body index: 3346 method index: 3569
         x = param1.x;
         y = param1.y;
      }
      
      public function getwrap() : void
      {
         // method body index: 3347 method index: 3570
         wrap.zpp_inner.x = x;
         wrap.zpp_inner.y = y;
      }
      
      public function free() : void
      {
         // method body index: 3348 method index: 3571
         var _loc1_:* = null as Vec2;
         var _loc2_:* = null as ZPP_Vec2;
         var _loc3_:* = null as Vec2;
         var _loc4_:* = null as ZPP_Vec2;
         if(wrap != null)
         {
            wrap.zpp_inner._inuse = false;
            _loc1_ = wrap;
            if(_loc1_ != null && _loc1_.zpp_disp)
            {
               Boot.lastError = new Error();
               throw "Error: " + "Vec2" + " has been disposed and cannot be used!";
            }
            _loc2_ = _loc1_.zpp_inner;
            if(_loc2_._immutable)
            {
               Boot.lastError = new Error();
               throw "Error: Vec2 is immutable";
            }
            if(_loc2_._isimmutable != null)
            {
               _loc2_._isimmutable();
            }
            if(_loc1_.zpp_inner._inuse)
            {
               Boot.lastError = new Error();
               throw "Error: This Vec2 is not disposable";
            }
            _loc2_ = _loc1_.zpp_inner;
            _loc1_.zpp_inner.outer = null;
            _loc1_.zpp_inner = null;
            _loc3_ = _loc1_;
            _loc3_.zpp_pool = null;
            if(ZPP_PubPool.nextVec2 != null)
            {
               ZPP_PubPool.nextVec2.zpp_pool = _loc3_;
            }
            else
            {
               ZPP_PubPool.poolVec2 = _loc3_;
            }
            ZPP_PubPool.nextVec2 = _loc3_;
            _loc3_.zpp_disp = true;
            _loc4_ = _loc2_;
            if(_loc4_.outer != null)
            {
               _loc4_.outer.zpp_inner = null;
               _loc4_.outer = null;
            }
            _loc4_._isimmutable = null;
            _loc4_._validate = null;
            _loc4_._invalidate = null;
            _loc4_.next = ZPP_Vec2.zpp_pool;
            ZPP_Vec2.zpp_pool = _loc4_;
            wrap = null;
         }
         prev = next = null;
      }
      
      public function alloc() : void
      {
         // method body index: 3349 method index: 3572
         forced = false;
      }
   }
}

