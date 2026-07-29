package zpp_nape.callbacks
{
   import flash.Boot;
   import nape.callbacks.BodyCallback;
   import nape.callbacks.ConstraintCallback;
   import nape.callbacks.InteractionCallback;
   import nape.dynamics.ArbiterList;
   import zpp_nape.constraint.ZPP_Constraint;
   import zpp_nape.dynamics.ZPP_Arbiter;
   import zpp_nape.phys.ZPP_Body;
   import zpp_nape.phys.ZPP_Interactor;
   import zpp_nape.space.ZPP_CallbackSet;
   import zpp_nape.space.ZPP_Space;
   import zpp_nape.util.ZNPNode_ZPP_Arbiter;
   import zpp_nape.util.ZPP_ArbiterList;
   
   public class ZPP_Callback
   {
      
      // method body index: 3619 method index: 3902
      public static var §internal§:Boolean = // method body index: 3637 method index: 3922
      false;
      
      public static var zpp_pool:ZPP_Callback = // method body index: 3637 method index: 3922
      null;
      
      public var wrap_arbiters:ArbiterList;
      
      public var space:ZPP_Space;
      
      public var set:ZPP_CallbackSet;
      
      public var prev:ZPP_Callback;
      
      public var pre_swapped:Boolean;
      
      public var pre_arbiter:ZPP_Arbiter;
      
      public var outer_int:InteractionCallback;
      
      public var outer_con:ConstraintCallback;
      
      public var outer_body:BodyCallback;
      
      public var next:ZPP_Callback;
      
      public var listener:ZPP_Listener;
      
      public var length:int;
      
      public var int2:ZPP_Interactor;
      
      public var int1:ZPP_Interactor;
      
      public var index:int;
      
      public var event:int;
      
      public var constraint:ZPP_Constraint;
      
      public var body:ZPP_Body;
      
      public function ZPP_Callback()
      {
         // method body index: 3636 method index: 3901
         if(Boot.skip_constructor)
         {
            return;
         }
         constraint = null;
         body = null;
         pre_swapped = false;
         pre_arbiter = null;
         wrap_arbiters = null;
         set = null;
         int2 = null;
         int1 = null;
         length = 0;
         prev = null;
         next = null;
         index = 0;
         space = null;
         listener = null;
         event = 0;
         outer_int = null;
         outer_con = null;
         outer_body = null;
         length = 0;
      }
      
      public function wrapper_int() : InteractionCallback
      {
         // method body index: 3620 method index: 3903
         if(outer_int == null)
         {
            ZPP_Callback.§internal§ = true;
            outer_int = new InteractionCallback();
            ZPP_Callback.§internal§ = false;
            outer_int.zpp_inner = this;
         }
         if(wrap_arbiters == null)
         {
            wrap_arbiters = ZPP_ArbiterList.get(set.arbiters,true);
         }
         else
         {
            wrap_arbiters.zpp_inner.inner = set.arbiters;
         }
         wrap_arbiters.zpp_inner.zip_length = true;
         wrap_arbiters.zpp_inner.at_ite = null;
         return outer_int;
      }
      
      public function wrapper_con() : ConstraintCallback
      {
         // method body index: 3621 method index: 3904
         if(outer_con == null)
         {
            ZPP_Callback.§internal§ = true;
            outer_con = new ConstraintCallback();
            ZPP_Callback.§internal§ = false;
            outer_con.zpp_inner = this;
         }
         return outer_con;
      }
      
      public function wrapper_body() : BodyCallback
      {
         // method body index: 3622 method index: 3905
         if(outer_body == null)
         {
            ZPP_Callback.§internal§ = true;
            outer_body = new BodyCallback();
            ZPP_Callback.§internal§ = false;
            outer_body.zpp_inner = this;
         }
         return outer_body;
      }
      
      public function splice(param1:ZPP_Callback) : ZPP_Callback
      {
         // method body index: 3623 method index: 3906
         var _loc2_:ZPP_Callback = param1.next;
         if(param1.prev == null)
         {
            next = param1.next;
            if(next != null)
            {
               next.prev = null;
            }
            else
            {
               prev = null;
            }
         }
         else
         {
            param1.prev.next = param1.next;
            if(param1.next != null)
            {
               param1.next.prev = param1.prev;
            }
            else
            {
               prev = param1.prev;
            }
         }
         --length;
         return _loc2_;
      }
      
      public function rotateR() : void
      {
         // method body index: 3624 method index: 3907
         push_rev(pop_rev());
      }
      
      public function rotateL() : void
      {
         // method body index: 3625 method index: 3908
         push(pop());
      }
      
      public function rev_at(param1:int) : ZPP_Callback
      {
         // method body index: 3626 method index: 3909
         var _loc2_:ZPP_Callback = prev;
         while(param1-- != 0)
         {
            _loc2_ = _loc2_.prev;
         }
         return _loc2_;
      }
      
      public function push_rev(param1:ZPP_Callback) : void
      {
         // method body index: 3627 method index: 3910
         if(next != null)
         {
            next.prev = param1;
         }
         else
         {
            prev = param1;
         }
         param1.next = next;
         param1.prev = null;
         next = param1;
         ++length;
      }
      
      public function push(param1:ZPP_Callback) : void
      {
         // method body index: 3628 method index: 3911
         if(prev != null)
         {
            prev.next = param1;
         }
         else
         {
            next = param1;
         }
         param1.prev = prev;
         param1.next = null;
         prev = param1;
         ++length;
      }
      
      public function pop_rev() : ZPP_Callback
      {
         // method body index: 3629 method index: 3912
         var _loc1_:ZPP_Callback = prev;
         prev = _loc1_.prev;
         if(prev == null)
         {
            next = null;
         }
         else
         {
            prev.next = null;
         }
         --length;
         return _loc1_;
      }
      
      public function pop() : ZPP_Callback
      {
         // method body index: 3630 method index: 3913
         var _loc1_:ZPP_Callback = next;
         next = _loc1_.next;
         if(next == null)
         {
            prev = null;
         }
         else
         {
            next.prev = null;
         }
         --length;
         return _loc1_;
      }
      
      public function empty() : Boolean
      {
         // method body index: 3631 method index: 3916
         return next == null;
      }
      
      public function cyclePrev(param1:ZPP_Callback) : ZPP_Callback
      {
         // method body index: 3632 method index: 3917
         if(param1.prev == null)
         {
            return prev;
         }
         return param1.prev;
      }
      
      public function cycleNext(param1:ZPP_Callback) : ZPP_Callback
      {
         // method body index: 3633 method index: 3918
         if(param1.next == null)
         {
            return next;
         }
         return param1.next;
      }
      
      public function clear() : void
      {
         // method body index: 3634 method index: 3919
         while(!empty())
         {
            pop();
         }
      }
      
      public function at(param1:int) : ZPP_Callback
      {
         // method body index: 3635 method index: 3920
         var _loc2_:ZPP_Callback = next;
         while(param1-- != 0)
         {
            _loc2_ = _loc2_.next;
         }
         return _loc2_;
      }
   }
}

