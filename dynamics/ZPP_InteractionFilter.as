package zpp_nape.dynamics
{
   import flash.Boot;
   import nape.dynamics.InteractionFilter;
   import nape.shape.ShapeList;
   import zpp_nape.shape.ZPP_Shape;
   import zpp_nape.util.ZNPList_ZPP_Shape;
   import zpp_nape.util.ZNPNode_ZPP_Shape;
   
   public class ZPP_InteractionFilter
   {
      
      // method body index: 3122 method index: 3262
      public static var zpp_pool:ZPP_InteractionFilter = // method body index: 3128 method index: 3274
      null;
      
      public var wrap_shapes:ShapeList;
      
      public var userData:*;
      
      public var shapes:ZNPList_ZPP_Shape;
      
      public var sensorMask:int;
      
      public var sensorGroup:int;
      
      public var outer:InteractionFilter;
      
      public var next:ZPP_InteractionFilter;
      
      public var fluidMask:int;
      
      public var fluidGroup:int;
      
      public var collisionMask:int;
      
      public var collisionGroup:int;
      
      public function ZPP_InteractionFilter()
      {
         // method body index: 3127 method index: 3261
         if(Boot.skip_constructor)
         {
            return;
         }
         fluidMask = 0;
         fluidGroup = 0;
         sensorMask = 0;
         sensorGroup = 0;
         collisionMask = 0;
         collisionGroup = 0;
         wrap_shapes = null;
         shapes = null;
         outer = null;
         userData = null;
         next = null;
         shapes = new ZNPList_ZPP_Shape();
         collisionGroup = sensorGroup = int(fluidGroup = 1);
         collisionMask = sensorMask = int(fluidMask = -1);
      }
      
      public function wrapper() : InteractionFilter
      {
         // method body index: 3123 method index: 3263
         var _loc1_:* = null as ZPP_InteractionFilter;
         if(outer == null)
         {
            outer = new InteractionFilter();
            _loc1_ = outer.zpp_inner;
            _loc1_.outer = null;
            _loc1_.next = ZPP_InteractionFilter.zpp_pool;
            ZPP_InteractionFilter.zpp_pool = _loc1_;
            outer.zpp_inner = this;
         }
         return outer;
      }
      
      public function remShape(param1:ZPP_Shape) : void
      {
         // method body index: 3124 method index: 3267
         shapes.remove(param1);
      }
      
      public function invalidate() : void
      {
         // method body index: 3125 method index: 3268
         var _loc2_:* = null as ZPP_Shape;
         var _loc1_:ZNPNode_ZPP_Shape = shapes.head;
         while(_loc1_ != null)
         {
            _loc2_ = _loc1_.elt;
            _loc2_.invalidate_filter();
            _loc1_ = _loc1_.next;
         }
      }
      
      public function copy() : ZPP_InteractionFilter
      {
         // method body index: 3126 method index: 3271
         var _loc1_:* = null as ZPP_InteractionFilter;
         if(ZPP_InteractionFilter.zpp_pool == null)
         {
            _loc1_ = new ZPP_InteractionFilter();
         }
         else
         {
            _loc1_ = ZPP_InteractionFilter.zpp_pool;
            ZPP_InteractionFilter.zpp_pool = _loc1_.next;
            _loc1_.next = null;
         }
         null;
         _loc1_.collisionGroup = collisionGroup;
         _loc1_.collisionMask = collisionMask;
         _loc1_.sensorGroup = sensorGroup;
         _loc1_.sensorMask = sensorMask;
         _loc1_.fluidGroup = fluidGroup;
         _loc1_.fluidMask = fluidMask;
         return _loc1_;
      }
   }
}

