package nape.phys
{
   import flash.Boot;
   import zpp_nape.util.ZPP_BodyList;
   
   public final class BodyIterator
   {
      
      // method body index: 3576 method index: 3855
      public static var zpp_pool:BodyIterator = // method body index: 3580 method index: 3859
      null;
      
      public var zpp_next:BodyIterator;
      
      public var zpp_inner:BodyList;
      
      public var zpp_i:int;
      
      public var zpp_critical:Boolean;
      
      public function BodyIterator()
      {
         // method body index: 3579 method index: 3854
         if(Boot.skip_constructor)
         {
            return;
         }
         zpp_next = null;
         zpp_critical = false;
         zpp_i = 0;
         zpp_inner = null;
         if(!ZPP_BodyList.§internal§)
         {
            Boot.lastError = new Error();
            throw "Error: Cannot instantiate " + "Body" + "Iterator derp!";
         }
      }
      
      public static function get(param1:BodyList) : BodyIterator
      {
         // method body index: 3575 method index: 3858
         var _loc3_:* = null as BodyIterator;
         var _loc2_:BodyIterator = BodyIterator.zpp_pool == null ? (ZPP_BodyList.§internal§ = true,_loc3_ = new BodyIterator(),ZPP_BodyList.§internal§ = false,_loc3_) : (_loc3_ = BodyIterator.zpp_pool,BodyIterator.zpp_pool = _loc3_.zpp_next,_loc3_);
         _loc2_.zpp_i = 0;
         _loc2_.zpp_inner = param1;
         _loc2_.zpp_critical = false;
         return _loc2_;
      }
      
      public function next() : Body
      {
         // method body index: 3577 method index: 3856
         zpp_critical = false;
         var _temp_2:* = zpp_inner;
         var _loc1_:int;
         zpp_i = (_loc1_ = zpp_i) + 1;
         return _temp_2.at(_loc1_);
      }
      
      public function hasNext() : Boolean
      {
         // method body index: 3578 method index: 3857
         zpp_inner.zpp_inner.valmod();
         var _loc2_:BodyList = zpp_inner;
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
         zpp_next = BodyIterator.zpp_pool;
         BodyIterator.zpp_pool = this;
         zpp_inner = null;
         return false;
      }
   }
}

