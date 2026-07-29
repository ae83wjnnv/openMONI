package nape.geom
{
   import flash.Boot;
   import zpp_nape.util.ZPP_GeomPolyList;
   
   public final class GeomPolyIterator
   {
      
      // method body index: 3459 method index: 3711
      public static var zpp_pool:GeomPolyIterator = // method body index: 3463 method index: 3715
      null;
      
      public var zpp_next:GeomPolyIterator;
      
      public var zpp_inner:GeomPolyList;
      
      public var zpp_i:int;
      
      public var zpp_critical:Boolean;
      
      public function GeomPolyIterator()
      {
         // method body index: 3462 method index: 3710
         if(Boot.skip_constructor)
         {
            return;
         }
         zpp_next = null;
         zpp_critical = false;
         zpp_i = 0;
         zpp_inner = null;
         if(!ZPP_GeomPolyList.§internal§)
         {
            Boot.lastError = new Error();
            throw "Error: Cannot instantiate " + "GeomPoly" + "Iterator derp!";
         }
      }
      
      public static function get(param1:GeomPolyList) : GeomPolyIterator
      {
         // method body index: 3458 method index: 3714
         var _loc3_:* = null as GeomPolyIterator;
         var _loc2_:GeomPolyIterator = GeomPolyIterator.zpp_pool == null ? (ZPP_GeomPolyList.§internal§ = true,_loc3_ = new GeomPolyIterator(),ZPP_GeomPolyList.§internal§ = false,_loc3_) : (_loc3_ = GeomPolyIterator.zpp_pool,GeomPolyIterator.zpp_pool = _loc3_.zpp_next,_loc3_);
         _loc2_.zpp_i = 0;
         _loc2_.zpp_inner = param1;
         _loc2_.zpp_critical = false;
         return _loc2_;
      }
      
      public function next() : GeomPoly
      {
         // method body index: 3460 method index: 3712
         zpp_critical = false;
         var _temp_2:* = zpp_inner;
         var _loc1_:int;
         zpp_i = (_loc1_ = zpp_i) + 1;
         return _temp_2.at(_loc1_);
      }
      
      public function hasNext() : Boolean
      {
         // method body index: 3461 method index: 3713
         zpp_inner.zpp_inner.valmod();
         var _loc2_:GeomPolyList = zpp_inner;
         _loc2_.zpp_inner.valmod();
         if(_loc2_.zpp_inner.zip_length)
         {
            _loc2_.zpp_inner.zip_length = false;
            _loc2_.zpp_inner.user_length = _loc2_.zpp_inner.inner.length;
         }
         var _loc1_:int = _loc2_.zpp_inner.user_length;
         zpp_critical = true;
         if(zpp_i < _loc1_)
         {
            return true;
         }
         zpp_next = GeomPolyIterator.zpp_pool;
         GeomPolyIterator.zpp_pool = this;
         zpp_inner = null;
         return false;
      }
   }
}

