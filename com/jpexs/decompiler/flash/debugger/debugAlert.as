package com.jpexs.decompiler.flash.debugger
{
   import flash.external.ExternalInterface;
   
   public function debugAlert(... rest) : void
   {
      // method body index: 8 method index: 8
      var _loc2_:* = undefined;
      for each(_loc2_ in rest)
      {
         if(ExternalInterface.available)
         {
            ExternalInterface.call("alert","" + _loc2_);
         }
      }
   }
}

