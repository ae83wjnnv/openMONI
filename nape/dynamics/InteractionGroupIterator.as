package nape.dynamics
{
   import flash.Boot;
   import zpp_nape.util.ZPP_InteractionGroupList;
   
   public final class InteractionGroupIterator
   {
      
      // method body index: 3180 method index: 3354
      public static var zpp_pool:InteractionGroupIterator = // method body index: 3184 method index: 3358
      null;
      
      public var zpp_next:InteractionGroupIterator;
      
      public var zpp_inner:InteractionGroupList;
      
      public var zpp_i:int;
      
      public var zpp_critical:Boolean;
      
      public function InteractionGroupIterator()
      {
         // method body index: 3183 method index: 3353
         if(Boot.skip_constructor)
         {
            return;
         }
         zpp_next = null;
         zpp_critical = false;
         zpp_i = 0;
         zpp_inner = null;
         if(!ZPP_InteractionGroupList.§internal§)
         {
            Boot.lastError = new Error();
            throw "Error: Cannot instantiate " + "InteractionGroup" + "Iterator derp!";
         }
      }
      
      public static function get(param1:InteractionGroupList) : InteractionGroupIterator
      {
         // method body index: 3179 method index: 3357
         var _loc3_:* = null as InteractionGroupIterator;
         var _loc2_:InteractionGroupIterator = InteractionGroupIterator.zpp_pool == null ? (ZPP_InteractionGroupList.§internal§ = true,_loc3_ = new InteractionGroupIterator(),ZPP_InteractionGroupList.§internal§ = false,_loc3_) : (_loc3_ = InteractionGroupIterator.zpp_pool,InteractionGroupIterator.zpp_pool = _loc3_.zpp_next,_loc3_);
         _loc2_.zpp_i = 0;
         _loc2_.zpp_inner = param1;
         _loc2_.zpp_critical = false;
         return _loc2_;
      }
      
      public function next() : InteractionGroup
      {
         // method body index: 3181 method index: 3355
         zpp_critical = false;
         var _temp_2:* = zpp_inner;
         var _loc1_:int;
         zpp_i = (_loc1_ = zpp_i) + 1;
         return _temp_2.at(_loc1_);
      }
      
      public function hasNext() : Boolean
      {
         // method body index: 3182 method index: 3356
         zpp_inner.zpp_inner.valmod();
         var _loc2_:InteractionGroupList = zpp_inner;
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
         zpp_next = InteractionGroupIterator.zpp_pool;
         InteractionGroupIterator.zpp_pool = this;
         zpp_inner = null;
         return false;
      }
   }
}

