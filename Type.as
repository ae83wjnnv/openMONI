package
{
   import com.jpexs.decompiler.flash.debugger.debugGetDefinitionByName;
   import com.jpexs.decompiler.flash.debugger.debugGetQualifiedClassName;
   
   public class Type
   {
      
      public function Type()
      {
         // method body index: 5952 method index: 6415
      }
      
      public static function getClass(param1:Object) : Class
      {
         // method body index: 5950 method index: 6417
         var _loc2_:String = debugGetQualifiedClassName(param1);
         if(_loc2_ == "null" || _loc2_ == "Object" || _loc2_ == "int" || _loc2_ == "Number" || _loc2_ == "Boolean")
         {
            return null;
         }
         if(param1.hasOwnProperty("prototype"))
         {
            return null;
         }
         var _loc3_:* = debugGetDefinitionByName(_loc2_) as Class;
         if(_loc3_.__isenum)
         {
            return null;
         }
         return _loc3_;
      }
   }
}

