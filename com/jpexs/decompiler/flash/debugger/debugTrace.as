package com.jpexs.decompiler.flash.debugger
{
   public function debugTrace(... rest) : *
   {
      // method body index: 14 method index: 14
      var _loc2_:* = undefined;
      for each(_loc2_ in rest)
      {
         debugConsole(_loc2_);
         debugSocket(_loc2_);
      }
   }
}

