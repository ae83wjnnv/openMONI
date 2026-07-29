package zpp_nape.phys
{
   import flash.Boot;
   import nape.phys.Material;
   import nape.shape.ShapeList;
   import zpp_nape.shape.ZPP_Shape;
   import zpp_nape.util.ZNPList_ZPP_Shape;
   import zpp_nape.util.ZNPNode_ZPP_Shape;
   
   public class ZPP_Material
   {
      
      // method body index: 3165 method index: 3330
      public static var zpp_pool:ZPP_Material = // method body index: 3172 method index: 3340
      null;
      
      public static var WAKE:int = // method body index: 3172 method index: 3340
      1;
      
      public static var PROPS:int = // method body index: 3172 method index: 3340
      2;
      
      public static var ANGDRAG:int = // method body index: 3172 method index: 3340
      4;
      
      public static var ARBITERS:int = // method body index: 3172 method index: 3340
      8;
      
      public var wrap_shapes:ShapeList;
      
      public var userData:*;
      
      public var staticFriction:Number;
      
      public var shapes:ZNPList_ZPP_Shape;
      
      public var rollingFriction:Number;
      
      public var outer:Material;
      
      public var next:ZPP_Material;
      
      public var elasticity:Number;
      
      public var dynamicFriction:Number;
      
      public var density:Number;
      
      public function ZPP_Material()
      {
         // method body index: 3171 method index: 3329
         if(Boot.skip_constructor)
         {
            return;
         }
         rollingFriction = 0;
         elasticity = 0;
         density = 0;
         staticFriction = 0;
         dynamicFriction = 0;
         wrap_shapes = null;
         shapes = null;
         outer = null;
         userData = null;
         next = null;
         shapes = new ZNPList_ZPP_Shape();
         elasticity = 0;
         dynamicFriction = 1;
         staticFriction = 2;
         density = 0.001;
         rollingFriction = 0.01;
      }
      
      public function wrapper() : Material
      {
         // method body index: 3166 method index: 3331
         var _loc1_:* = null as ZPP_Material;
         if(outer == null)
         {
            outer = new Material();
            _loc1_ = outer.zpp_inner;
            _loc1_.outer = null;
            _loc1_.next = ZPP_Material.zpp_pool;
            ZPP_Material.zpp_pool = _loc1_;
            outer.zpp_inner = this;
         }
         return outer;
      }
      
      public function set(param1:ZPP_Material) : void
      {
         // method body index: 3167 method index: 3332
         dynamicFriction = param1.dynamicFriction;
         staticFriction = param1.staticFriction;
         density = param1.density;
         elasticity = param1.elasticity;
         rollingFriction = param1.rollingFriction;
      }
      
      public function remShape(param1:ZPP_Shape) : void
      {
         // method body index: 3168 method index: 3333
         shapes.remove(param1);
      }
      
      public function invalidate(param1:int) : void
      {
         // method body index: 3169 method index: 3334
         var _loc3_:* = null as ZPP_Shape;
         var _loc2_:ZNPNode_ZPP_Shape = shapes.head;
         while(_loc2_ != null)
         {
            _loc3_ = _loc2_.elt;
            _loc3_.invalidate_material(param1);
            _loc2_ = _loc2_.next;
         }
      }
      
      public function copy() : ZPP_Material
      {
         // method body index: 3170 method index: 3337
         var _loc1_:ZPP_Material = new ZPP_Material();
         _loc1_.dynamicFriction = dynamicFriction;
         _loc1_.staticFriction = staticFriction;
         _loc1_.density = density;
         _loc1_.elasticity = elasticity;
         _loc1_.rollingFriction = rollingFriction;
         return _loc1_;
      }
   }
}

