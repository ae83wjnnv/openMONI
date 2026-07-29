package mx.utils
{
   import com.jpexs.decompiler.flash.debugger.debugGetQualifiedClassName;
   import flash.display.DisplayObject;
   import mx.core.IRepeaterClient;
   import mx.core.mx_internal;
   
   use namespace mx_internal;
   
   public class NameUtil
   {
      
      // method body index: 57 method index: 117
      mx_internal static const VERSION:String = // method body index: 57 method index: 117
      "4.6.0.23201";
      
      private static var counter:int = // method body index: 57 method index: 117
      0;
      
      public function NameUtil()
      {
         // method body index: 61 method index: 121
         super();
      }
      
      public static function createUniqueName(param1:Object) : String
      {
         // method body index: 58 method index: 118
         if(!param1)
         {
            return null;
         }
         var _loc2_:String = debugGetQualifiedClassName(param1);
         var _loc3_:int = _loc2_.indexOf("::");
         if(_loc3_ != -1)
         {
            _loc2_ = _loc2_.substr(_loc3_ + 2);
         }
         var _loc4_:int = _loc2_.charCodeAt(_loc2_.length - 1);
         if(_loc4_ >= 48 && _loc4_ <= 57)
         {
            _loc2_ += "_";
         }
         return _loc2_ + counter++;
      }
      
      public static function displayObjectToString(param1:DisplayObject) : String
      {
         // method body index: 59 method index: 119
         var _loc2_:String = null;
         var _loc3_:DisplayObject = null;
         var _loc4_:String = null;
         var _loc5_:Array = null;
         try
         {
            _loc3_ = param1;
            while(_loc3_ != null)
            {
               if(Boolean(_loc3_.parent) && Boolean(_loc3_.stage) && _loc3_.parent == _loc3_.stage)
               {
                  break;
               }
               _loc4_ = "id" in _loc3_ && Boolean(_loc3_["id"]) ? _loc3_["id"] : _loc3_.name;
               if(_loc3_ is IRepeaterClient)
               {
                  _loc5_ = IRepeaterClient(_loc3_).instanceIndices;
                  if(_loc5_)
                  {
                     _loc4_ += "[" + _loc5_.join("][") + "]";
                  }
               }
               _loc2_ = _loc2_ == null ? _loc4_ : _loc4_ + "." + _loc2_;
               _loc3_ = _loc3_.parent;
            }
         }
         catch(e:SecurityError)
         {
         }
         return _loc2_;
      }
      
      public static function getUnqualifiedClassName(param1:Object) : String
      {
         // method body index: 60 method index: 120
         var _loc2_:String = null;
         if(param1 is String)
         {
            _loc2_ = param1 as String;
         }
         else
         {
            _loc2_ = debugGetQualifiedClassName(param1);
         }
         var _loc3_:int = _loc2_.indexOf("::");
         if(_loc3_ != -1)
         {
            _loc2_ = _loc2_.substr(_loc3_ + 2);
         }
         return _loc2_;
      }
   }
}

