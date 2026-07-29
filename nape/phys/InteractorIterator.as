package nape.phys
{
   import flash.Boot;
   import zpp_nape.util.ZPP_InteractorList;
   
   public final class InteractorIterator
   {
      
      // method body index: 3151 method index: 3309
      public static var zpp_pool:InteractorIterator = // method body index: 3155 method index: 3313
      null;
      
      public var zpp_next:InteractorIterator;
      
      public var zpp_inner:InteractorList;
      
      public var zpp_i:int;
      
      public var zpp_critical:Boolean;
      
      public function InteractorIterator()
      {
         // method body index: 3154 method index: 3308
         if(Boot.skip_constructor)
         {
            return;
         }
         zpp_next = null;
         zpp_critical = false;
         zpp_i = 0;
         zpp_inner = null;
         if(!ZPP_InteractorList.§internal§)
         {
            Boot.lastError = new Error();
            throw "Error: Cannot instantiate " + "Interactor" + "Iterator derp!";
         }
      }
      
      public static function get(param1:InteractorList) : InteractorIterator
      {
         // method body index: 3150 method index: 3312
         var _loc3_:* = null as InteractorIterator;
         var _loc2_:InteractorIterator = InteractorIterator.zpp_pool == null ? (ZPP_InteractorList.§internal§ = true,_loc3_ = new InteractorIterator(),ZPP_InteractorList.§internal§ = false,_loc3_) : (_loc3_ = InteractorIterator.zpp_pool,InteractorIterator.zpp_pool = _loc3_.zpp_next,_loc3_);
         _loc2_.zpp_i = 0;
         _loc2_.zpp_inner = param1;
         _loc2_.zpp_critical = false;
         return _loc2_;
      }
      
      public function next() : Interactor
      {
         // method body index: 3152 method index: 3310
         zpp_critical = false;
         var _temp_2:* = zpp_inner;
         var _loc1_:int;
         zpp_i = (_loc1_ = zpp_i) + 1;
         return _temp_2.at(_loc1_);
      }
      
      public function hasNext() : Boolean
      {
         // method body index: 3153 method index: 3311
         zpp_inner.zpp_inner.valmod();
         var _loc2_:InteractorList = zpp_inner;
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
         zpp_next = InteractorIterator.zpp_pool;
         InteractorIterator.zpp_pool = this;
         zpp_inner = null;
         return false;
      }
   }
}

