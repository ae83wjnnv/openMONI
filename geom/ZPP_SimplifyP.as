package zpp_nape.geom
{
   import flash.Boot;
   
   public class ZPP_SimplifyP
   {
      
      // method body index: 3520 method index: 3792
      public static var zpp_pool:ZPP_SimplifyP = // method body index: 3522 method index: 3796
      null;
      
      public var next:ZPP_SimplifyP;
      
      public var min:ZPP_SimplifyV;
      
      public var max:ZPP_SimplifyV;
      
      public function ZPP_SimplifyP()
      {
         // method body index: 3521 method index: 3791
         if(Boot.skip_constructor)
         {
            return;
         }
         max = null;
         min = null;
         next = null;
      }
      
      public static function get(param1:ZPP_SimplifyV, param2:ZPP_SimplifyV) : ZPP_SimplifyP
      {
         // method body index: 3519 method index: 3795
         var _loc3_:* = null as ZPP_SimplifyP;
         if(ZPP_SimplifyP.zpp_pool == null)
         {
            _loc3_ = new ZPP_SimplifyP();
         }
         else
         {
            _loc3_ = ZPP_SimplifyP.zpp_pool;
            ZPP_SimplifyP.zpp_pool = _loc3_.next;
            _loc3_.next = null;
         }
         null;
         _loc3_.min = param1;
         _loc3_.max = param2;
         return _loc3_;
      }
   }
}

