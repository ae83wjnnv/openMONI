package com.jpexs.decompiler.flash.debugger
{
   import flash.display.MovieClip;
   
   public class DebugMain extends MovieClip
   {
      
      public function DebugMain()
      {
         // method body index: 47 method index: 47
         super();
         debugAlert("test alert");
         debugConsole("test console");
         debugSocket("test proxy");
         debugTrace("test trace");
         var _loc1_:DebugLoader = new DebugLoader();
         var _loc2_:* = debugGetDefinitionByName("flash.display.Loader");
         debugDescribeType(_loc2_);
         var _loc3_:* = debugGetQualifiedClassName(_loc2_);
         var _loc4_:* = debugGetQualifiedSuperclassName(_loc2_);
      }
   }
}

