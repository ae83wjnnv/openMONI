package com.jpexs.decompiler.flash.debugger
{
   import flash.events.Event;
   import flash.events.ProgressEvent;
   import flash.net.Socket;
   import flash.utils.ByteArray;
   
   public class DebugConnection
   {
      
      private static var s:Socket;
      
      private static var name:String;
      
      private static var readBa:ByteArray;
      
      // method body index: 16 method index: 16
      private static var q:* = // method body index: 16 method index: 16
      [];
      
      private static var inited:Boolean = // method body index: 16 method index: 16
      false;
      
      private static var failed:Boolean = // method body index: 16 method index: 16
      false;
      
      private static var fillByteArrays:* = // method body index: 16 method index: 16
      [];
      
      private static var fillByteArraysEvents:* = // method body index: 16 method index: 16
      [];
      
      private static var lenBytes:Array = // method body index: 16 method index: 16
      [-1,-1,-1,-1];
      
      private static var lenBytePos:int = // method body index: 16 method index: 16
      0;
      
      private static var len:int = // method body index: 16 method index: 16
      0;
      
      public static const DEBUG_VERSION_MAJOR:* = // method body index: 16 method index: 16
      1;
      
      public static const DEBUG_VERSION_MINOR:* = // method body index: 16 method index: 16
      3;
      
      public static const MSG_STRING:* = // method body index: 16 method index: 16
      0;
      
      public static const MSG_LOADER_URL:* = // method body index: 16 method index: 16
      1;
      
      public static const MSG_LOADER_BYTES:* = // method body index: 16 method index: 16
      2;
      
      public static const MSG_DUMP_BYTEARRAY:* = // method body index: 16 method index: 16
      3;
      
      public static const MSG_REQUEST_BYTEARRAY:* = // method body index: 16 method index: 16
      4;
      
      public static const MSG_LOADER_URL_INFO:* = // method body index: 16 method index: 16
      5;
      
      public static const MSG_LOADER_MODIFY_BYTES:* = // method body index: 16 method index: 16
      6;
      
      private static var connected:Boolean = // method body index: 16 method index: 16
      false;
      
      public static const SHOW_TRACE:* = // method body index: 16 method index: 16
      false;
      
      public function DebugConnection()
      {
         // method body index: 35 method index: 35
         super();
      }
      
      private static function sendQueue() : *
      {
         // method body index: 17 method index: 17
         var _loc2_:* = undefined;
         if(SHOW_TRACE)
         {
            trace("debugswf: client " + name + " sending queue");
         }
         var _loc1_:* = q;
         q = [];
         for each(_loc2_ in _loc1_)
         {
            writeMsg(_loc2_.data,_loc2_.type);
         }
      }
      
      private static function writeStringNull(param1:*) : *
      {
         // method body index: 18 method index: 18
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeUTFBytes(param1);
         s.writeBytes(_loc2_,0,_loc2_.length);
         s.writeByte(0);
      }
      
      private static function writeString(param1:*) : *
      {
         // method body index: 19 method index: 19
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeUTFBytes(param1);
         s.writeByte(_loc2_.length >> 8 & 0xFF);
         s.writeByte(_loc2_.length & 0xFF);
         s.writeBytes(_loc2_,0,_loc2_.length);
      }
      
      private static function writeLongString(param1:*) : *
      {
         // method body index: 20 method index: 20
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeUTFBytes(param1);
         writeBytes(_loc2_);
      }
      
      private static function writeBytes(param1:ByteArray) : *
      {
         // method body index: 21 method index: 21
         s.writeByte(param1.length >> 24 & 0xFF);
         s.writeByte(param1.length >> 16 & 0xFF);
         s.writeByte(param1.length >> 8 & 0xFF);
         s.writeByte(param1.length & 0xFF);
         s.writeBytes(param1,0,param1.length);
      }
      
      private static function readBytes() : ByteArray
      {
         // method body index: 22 method index: 22
         var _loc1_:ByteArray = new ByteArray();
         var _loc2_:* = s.readUnsignedByte();
         var _loc3_:* = s.readUnsignedByte();
         var _loc4_:* = s.readUnsignedByte();
         var _loc5_:* = s.readUnsignedByte();
         var _loc6_:* = (_loc2_ << 24) + (_loc3_ << 16) + (_loc4_ << 8) + _loc5_;
         s.readBytes(_loc1_,0,_loc6_);
         return _loc1_;
      }
      
      private static function readString() : String
      {
         // method body index: 23 method index: 23
         var _loc1_:ByteArray = new ByteArray();
         var _loc2_:* = s.readUnsignedByte();
         var _loc3_:* = s.readUnsignedByte();
         var _loc4_:* = (_loc2_ << 8) + _loc3_;
         return s.readUTFBytes(_loc4_);
      }
      
      private static function readLongString() : String
      {
         // method body index: 24 method index: 24
         var _loc1_:ByteArray = readBytes();
         return _loc1_.readUTFBytes(_loc1_.length);
      }
      
      public static function initClient(param1:*) : *
      {
         // method body index: 25 method index: 25
         var port:int = 0;
         var sname:* = param1;
         if(inited)
         {
            return;
         }
         if(SHOW_TRACE)
         {
            trace("debugswf: initing client " + sname);
         }
         name = sname;
         inited = true;
         try
         {
            s = new Socket();
            s.addEventListener(Event.CONNECT,onSocketConnect);
            s.addEventListener(ProgressEvent.SOCKET_DATA,onSocketData);
            port = 0;
            port = 55556;
            if(SHOW_TRACE)
            {
               trace("debugswf: connecting client " + sname + " to localhost:" + port);
            }
            s.connect("localhost",port);
            inited = true;
         }
         catch(e:SecurityError)
         {
            if(SHOW_TRACE)
            {
               trace("Debugger helper failed to connect to localhost");
            }
            failed = true;
         }
      }
      
      private static function onSocketConnect(param1:Event) : void
      {
         // method body index: 26 method index: 26
         if(SHOW_TRACE)
         {
            trace("debugswf: client " + name + " connected");
         }
         sendHeader();
         connected = true;
         sendQueue();
      }
      
      private static function onSocketData(param1:ProgressEvent) : void
      {
         // method body index: 27 method index: 27
         var _loc2_:int = 0;
         var _loc3_:ByteArray = null;
         var _loc4_:* = undefined;
         var _loc5_:* = undefined;
         while(s.bytesAvailable > 0)
         {
            if(lenBytePos < 4)
            {
               lenBytes[lenBytePos] = s.readUnsignedByte();
               ++lenBytePos;
               if(lenBytePos == 4)
               {
                  len = (lenBytes[0] << 24) + (lenBytes[1] << 16) + (lenBytes[2] << 8) + lenBytes[3];
                  readBa = new ByteArray();
               }
            }
            else
            {
               _loc2_ = s.bytesAvailable <= len ? int(s.bytesAvailable) : len;
               s.readBytes(readBa,readBa.length,_loc2_);
               len -= _loc2_;
               if(len == 0)
               {
                  lenBytePos = 0;
                  _loc3_ = fillByteArrays.pop();
                  _loc4_ = _loc3_.position;
                  _loc3_.position = 0;
                  _loc3_.length = 0;
                  _loc3_.writeBytes(readBa);
                  if(_loc4_ > _loc3_.length)
                  {
                     _loc3_.position = _loc3_.length;
                  }
                  else
                  {
                     _loc3_.position = _loc4_;
                  }
                  if(SHOW_TRACE)
                  {
                     trace("debugswf: client " + name + " received bytearray of " + _loc3_.length + " bytes");
                  }
                  _loc5_ = fillByteArraysEvents.pop();
                  if(_loc5_ != null)
                  {
                     if(SHOW_TRACE)
                     {
                        trace("debugswf: client " + name + " calling onComplete");
                     }
                     _loc5_.call(_loc5_);
                  }
               }
            }
         }
      }
      
      public static function writeLoaderURL(param1:*) : *
      {
         // method body index: 28 method index: 28
         writeMsg(param1,MSG_LOADER_URL);
      }
      
      public static function writeLoaderBytes(param1:ByteArray) : *
      {
         // method body index: 29 method index: 29
         writeMsg(param1,MSG_LOADER_BYTES);
      }
      
      public static function modifyLoaderBytesWithUrl(param1:ByteArray, param2:ByteArray, param3:String, param4:Function) : *
      {
         // method body index: 30 method index: 30
         writeMsg({
            "inputData":param1,
            "outputData":param2,
            "url":param3,
            "onComplete":param4
         },MSG_LOADER_MODIFY_BYTES);
      }
      
      public static function writeCommaSeparatedToByteArray(param1:String, param2:ByteArray) : *
      {
         // method body index: 31 method index: 31
         var _loc3_:Array = param1.split(",");
         var _loc4_:uint = param2.position;
         param2.position = 0;
         param2.length = 0;
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_.length)
         {
            param2.writeByte(_loc3_[_loc5_]);
            _loc5_++;
         }
         if(_loc4_ > param2.length)
         {
            param2.position = param2.length;
         }
         else
         {
            param2.position = _loc4_;
         }
      }
      
      public static function readCommaSeparatedFromByteArray(param1:ByteArray) : String
      {
         // method body index: 32 method index: 32
         var _loc2_:String = "";
         var _loc3_:* = "";
         var _loc4_:int = 0;
         while(_loc4_ < param1.length)
         {
            _loc2_ += _loc3_;
            _loc2_ += param1[_loc4_];
            _loc3_ = ",";
            _loc4_++;
         }
         return _loc2_;
      }
      
      private static function sendHeader() : *
      {
         // method body index: 33 method index: 33
         if(!s.connected)
         {
            return;
         }
         writeStringNull("debug.version.major=" + DEBUG_VERSION_MAJOR + ";debug.version.minor=" + DEBUG_VERSION_MINOR);
         writeString(name);
      }
      
      public static function writeMsg(param1:*, param2:* = 0) : *
      {
         // method body index: 34 method index: 34
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:ByteArray = null;
         if(failed)
         {
            return;
         }
         if(!inited)
         {
            _loc3_ = 100000;
            _loc4_ = Math.floor(Math.random() * (_loc3_ + 1));
            initClient("rand" + _loc4_);
         }
         if(param1 is ByteArray && param2 == MSG_DUMP_BYTEARRAY)
         {
            _loc5_ = new ByteArray();
            _loc5_.writeBytes(param1);
            param1 = _loc5_;
         }
         if(connected)
         {
            if(SHOW_TRACE)
            {
               trace("debugswf: client " + name + " sending msg " + param2);
            }
            s.writeByte(param2);
            switch(param2)
            {
               case MSG_STRING:
                  writeString(param1);
                  break;
               case MSG_LOADER_URL:
                  writeString(param1);
                  break;
               case MSG_LOADER_BYTES:
                  writeBytes(param1);
                  break;
               case MSG_DUMP_BYTEARRAY:
                  writeBytes(param1);
                  break;
               case MSG_REQUEST_BYTEARRAY:
                  fillByteArrays.push(param1);
                  fillByteArraysEvents.push(null);
                  break;
               case MSG_LOADER_MODIFY_BYTES:
                  writeString(param1["url"]);
                  writeBytes(param1["inputData"]);
                  fillByteArraysEvents.push(param1["onComplete"]);
                  fillByteArrays.push(param1["outputData"]);
            }
            s.flush();
            if(SHOW_TRACE)
            {
               trace("debugswf: client " + name + " msg " + param2 + " sent");
            }
         }
         else
         {
            if(SHOW_TRACE)
            {
               trace("debugswf: client " + name + " pushing msg " + param2 + " to queue");
            }
            q.push({
               "type":param2,
               "data":param1
            });
         }
      }
   }
}

