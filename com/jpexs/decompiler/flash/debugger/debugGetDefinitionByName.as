package com.jpexs.decompiler.flash.debugger
{
   import flash.utils.getDefinitionByName;
   
   public function debugGetDefinitionByName(param1:String) : Object
   {
      // method body index: 12 method index: 12
      switch(param1)
      {
         case "flash.display.Loader":
            return getDefinitionByName("com.jpexs.decompiler.flash.debugger.DebugLoader");
         default:
            return getDefinitionByName(param1);
      }
   }
}

