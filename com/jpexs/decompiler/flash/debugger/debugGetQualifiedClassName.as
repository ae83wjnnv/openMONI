package com.jpexs.decompiler.flash.debugger
{
   import flash.utils.getQualifiedClassName;
   
   public function debugGetQualifiedClassName(param1:*) : String
   {
      // method body index: 6 method index: 6
      var _loc2_:String = getQualifiedClassName(param1);
      switch(_loc2_)
      {
         case "com.jpexs.decompiler.flash.debugger.DebugLoader":
            return "flash.display.Loader";
         default:
            return _loc2_;
      }
   }
}

