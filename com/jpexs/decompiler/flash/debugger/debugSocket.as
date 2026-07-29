package com.jpexs.decompiler.flash.debugger
{
   import flash.system.Capabilities;
   
   public function debugSocket(... rest) : *
   {
      // method body index: 4 method index: 4
      var _loc2_:* = undefined;
      for each(_loc2_ in rest)
      {
         if(Capabilities.playerType == "PlugIn" || Capabilities.playerType == "ActiveX")
         {
            DebugConnection.writeMsg(_loc2_);
         }
      }
   }
}

