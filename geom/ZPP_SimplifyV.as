package zpp_nape.geom
{
   import flash.Boot;
   
   public class ZPP_SimplifyV
   {
      
      // method body index: 3639 method index: 3924
      public static var zpp_pool:ZPP_SimplifyV = // method body index: 3641 method index: 3928
      null;
      
      public var y:Number;
      
      public var x:Number;
      
      public var prev:ZPP_SimplifyV;
      
      public var next:ZPP_SimplifyV;
      
      public var forced:Boolean;
      
      public var flag:Boolean;
      
      public function ZPP_SimplifyV()
      {
         // method body index: 3640 method index: 3923
         if(Boot.skip_constructor)
         {
            return;
         }
         forced = false;
         flag = false;
         prev = null;
         next = null;
         y = 0;
         x = 0;
      }
      
      public static function get(param1:ZPP_GeomVert) : ZPP_SimplifyV
      {
         // method body index: 3638 method index: 3927
         var _loc2_:* = null as ZPP_SimplifyV;
         if(ZPP_SimplifyV.zpp_pool == null)
         {
            _loc2_ = new ZPP_SimplifyV();
         }
         else
         {
            _loc2_ = ZPP_SimplifyV.zpp_pool;
            ZPP_SimplifyV.zpp_pool = _loc2_.next;
            _loc2_.next = null;
         }
         null;
         _loc2_.x = param1.x;
         _loc2_.y = param1.y;
         _loc2_.flag = false;
         return _loc2_;
      }
   }
}

