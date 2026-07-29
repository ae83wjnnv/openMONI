package com.jpexs.decompiler.flash.debugger
{
   import flash.display.Loader;
   import flash.events.Event;
   import flash.net.URLLoader;
   import flash.net.URLLoaderDataFormat;
   import flash.net.URLRequest;
   import flash.system.LoaderContext;
   import flash.utils.ByteArray;
   
   public class DebugLoader extends Loader
   {
      
      private var lastLoadedContext:LoaderContext = null;
      
      private var urlLoader:URLLoader = null;
      
      private var lastLoadedRequest:URLRequest = null;
      
      private var lastModifiedByteArray:ByteArray = null;
      
      public function DebugLoader()
      {
         // method body index: 44 method index: 44
         super();
      }
      
      override public function load(param1:URLRequest, param2:LoaderContext = null) : void
      {
         // method body index: 38 method index: 38
         this.lastLoadedRequest = param1;
         this.lastLoadedContext = param2;
         this.urlLoader = new URLLoader();
         this.urlLoader.dataFormat = URLLoaderDataFormat.BINARY;
         this.urlLoader.addEventListener(Event.COMPLETE,this.onURLLoaderComplete);
         this.urlLoader.load(param1);
      }
      
      private function onURLLoaderComplete(param1:Event) : void
      {
         // method body index: 39 method index: 39
         var _loc2_:ByteArray = this.urlLoader.data as ByteArray;
         this.loadBytesInternal(_loc2_,this.lastLoadedContext,this.lastLoadedRequest.url);
      }
      
      private function loadBytesInternal(param1:ByteArray, param2:LoaderContext = null, param3:String = "") : *
      {
         // method body index: 40 method index: 40
         this.lastModifiedByteArray = new ByteArray();
         this.lastLoadedContext = param2;
         DebugConnection.modifyLoaderBytesWithUrl(param1,this.lastModifiedByteArray,param3,this.onModifiedDataLoaded);
      }
      
      private function onModifiedDataLoaded() : *
      {
         // method body index: 41 method index: 41
         super.loadBytes(this.lastModifiedByteArray,this.lastLoadedContext);
      }
      
      override public function loadBytes(param1:ByteArray, param2:LoaderContext = null) : void
      {
         // method body index: 42 method index: 42
         this.loadBytesInternal(param1,param2);
      }
      
      override public function toString() : String
      {
         // method body index: 43 method index: 43
         return "[object Loader]";
      }
   }
}

