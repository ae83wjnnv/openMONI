package flashpunk2.global
{
   import com.jpexs.decompiler.flash.debugger.debugGetDefinitionByName;
   import com.jpexs.decompiler.flash.debugger.debugGetQualifiedClassName;
   import flash.utils.Dictionary;
   
   public final class Cache
   {
      
      // method body index: 1051 method index: 1051
      private static var _marked:Dictionary = // method body index: 1051 method index: 1051
      new Dictionary();
      
      private static var _lookup:Dictionary = // method body index: 1051 method index: 1051
      new Dictionary();
      
      public function Cache()
      {
         // method body index: 1059 method index: 1059
         super();
      }
      
      private static function getList(param1:Class) : Vector.<Object>
      {
         // method body index: 1052 method index: 1052
         if(param1 in _lookup)
         {
            return _lookup[param1];
         }
         return _lookup[param1] = new Vector.<Object>();
      }
      
      public static function push(param1:*) : void
      {
         // method body index: 1053 method index: 1053
         var _loc2_:Class = Class(debugGetDefinitionByName(debugGetQualifiedClassName(param1)));
         getList(_loc2_).push(param1);
         _marked[param1] = true;
         if(param1 is Array)
         {
            param1.length = 0;
         }
      }
      
      public static function pop(param1:Class) : *
      {
         // method body index: 1054 method index: 1054
         var _loc3_:* = undefined;
         var _loc2_:Vector.<Object> = getList(param1);
         if(_loc2_.length > 0)
         {
            return _loc2_.pop();
         }
         _loc3_ = new param1();
         _marked[_loc3_] = true;
         return new param1();
      }
      
      public static function has(param1:Class) : Boolean
      {
         // method body index: 1055 method index: 1055
         return param1 in _lookup;
      }
      
      public static function clear() : void
      {
         // method body index: 1056 method index: 1056
         _marked = new Dictionary();
         _lookup = new Dictionary();
      }
      
      public static function clearType(param1:Class) : void
      {
         // method body index: 1057 method index: 1057
         var _loc2_:Vector.<Object> = getList(param1);
         _loc2_.length = 0;
      }
      
      public static function marked(param1:*) : Boolean
      {
         // method body index: 1058 method index: 1058
         return param1 in _marked;
      }
   }
}

