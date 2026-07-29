package com.jpexs.decompiler.flash.debugger
{
   import flash.external.ExternalInterface;
   
   public function debugConsole(... rest) : *
   {
      // method body index: 0 method index: 0
      var _loc2_:* = undefined;
      for each(_loc2_ in rest)
      {
         if(ExternalInterface.available)
         {
            ExternalInterface.call("console.log","" + _loc2_);
         }
      }
   }
}

