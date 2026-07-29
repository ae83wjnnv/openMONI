package com.jpexs.decompiler.flash.debugger
{
   import flash.utils.getQualifiedClassName;
   import flash.utils.getQualifiedSuperclassName;
   
   public function debugGetQualifiedSuperclassName(param1:*) : String
   {
      // method body index: 2 method index: 2
      var _loc2_:String = getQualifiedClassName(param1);
      var _loc3_:String = getQualifiedSuperclassName(param1);
      switch(_loc2_)
      {
         case "com.jpexs.decompiler.flash.debugger.DebugLoader":
            return "flash.display.DisplayObjectContainer";
         default:
            return _loc3_;
      }
   }
}

