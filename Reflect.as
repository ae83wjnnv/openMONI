package
{
   public class Reflect
   {
      
      public function Reflect()
      {
         // method body index: 6044 method index: 6518
      }
      
      public static function field(param1:*, param2:String) : *
      {
         // method body index: 6040 method index: 6520
         var _loc4_:* = null;
         try
         {
            §§push(param1[param2]);
         }
         catch(_loc_e_:*)
         {
            return §§pop();
         }
      }
      
      public static function fields(param1:*) : Array
      {
         // method body index: 6041 method index: 6521
         var _loc4_:* = null as String;
         if(param1 == null)
         {
            return [];
         }
         var _loc3_:Array = [];
         for(_loc4_ in param1)
         {
            if(param1.hasOwnProperty(_loc4_))
            {
               _loc3_.push(_loc4_);
            }
         }
         return _loc3_;
      }
      
      public static function copy(param1:Object) : Object
      {
         // method body index: 6042 method index: 6522
         var _loc5_:* = null as String;
         var _loc2_:* = {};
         var _loc3_:int = 0;
         var _loc4_:Array = Reflect.fields(param1);
         while(_loc3_ < int(_loc4_.length))
         {
            _loc5_ = _loc4_[_loc3_];
            _loc3_++;
            _loc2_[_loc5_] = Reflect.field(param1,_loc5_);
         }
         return _loc2_;
      }
   }
}

