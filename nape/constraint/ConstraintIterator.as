package nape.constraint
{
   import flash.Boot;
   import zpp_nape.util.ZPP_ConstraintList;
   
   public final class ConstraintIterator
   {
      
      // method body index: 3677 method index: 3972
      public static var zpp_pool:ConstraintIterator = // method body index: 3681 method index: 3976
      null;
      
      public var zpp_next:ConstraintIterator;
      
      public var zpp_inner:ConstraintList;
      
      public var zpp_i:int;
      
      public var zpp_critical:Boolean;
      
      public function ConstraintIterator()
      {
         // method body index: 3680 method index: 3971
         if(Boot.skip_constructor)
         {
            return;
         }
         zpp_next = null;
         zpp_critical = false;
         zpp_i = 0;
         zpp_inner = null;
         if(!ZPP_ConstraintList.§internal§)
         {
            Boot.lastError = new Error();
            throw "Error: Cannot instantiate " + "Constraint" + "Iterator derp!";
         }
      }
      
      public static function get(param1:ConstraintList) : ConstraintIterator
      {
         // method body index: 3676 method index: 3975
         var _loc3_:* = null as ConstraintIterator;
         var _loc2_:ConstraintIterator = ConstraintIterator.zpp_pool == null ? (ZPP_ConstraintList.§internal§ = true,_loc3_ = new ConstraintIterator(),ZPP_ConstraintList.§internal§ = false,_loc3_) : (_loc3_ = ConstraintIterator.zpp_pool,ConstraintIterator.zpp_pool = _loc3_.zpp_next,_loc3_);
         _loc2_.zpp_i = 0;
         _loc2_.zpp_inner = param1;
         _loc2_.zpp_critical = false;
         return _loc2_;
      }
      
      public function next() : Constraint
      {
         // method body index: 3678 method index: 3973
         zpp_critical = false;
         var _temp_2:* = zpp_inner;
         var _loc1_:int;
         zpp_i = (_loc1_ = zpp_i) + 1;
         return _temp_2.at(_loc1_);
      }
      
      public function hasNext() : Boolean
      {
         // method body index: 3679 method index: 3974
         zpp_inner.zpp_inner.valmod();
         var _loc2_:ConstraintList = zpp_inner;
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
         zpp_next = ConstraintIterator.zpp_pool;
         ConstraintIterator.zpp_pool = this;
         zpp_inner = null;
         return false;
      }
   }
}

