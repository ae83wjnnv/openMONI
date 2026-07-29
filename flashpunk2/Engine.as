package flashpunk2
{
   import flash.display.Sprite;
   import flash.events.Event;
   import flashpunk2.console.Console;
   import flashpunk2.global.Input;
   import flashpunk2.global.Rand;
   import flashpunk2.global.Time;
   import flashpunk2.namespaces.fp_internal;
   import starling.core.Starling;
   import starling.display.Sprite;
   import starling.events.EnterFrameEvent;
   import starling.events.Event;
   
   use namespace fp_internal;
   
   public class Engine
   {
      
      private static var _instance:Engine;
      
      public const ON_START:Signal = // method body index: 44 method index: 44
      new Signal();
      
      public const ON_END:Signal = // method body index: 44 method index: 44
      new Signal();
      
      public const ON_PRE_UPDATE:Signal = // method body index: 44 method index: 44
      new Signal();
      
      public const ON_UPDATE:Signal = // method body index: 44 method index: 44
      new Signal();
      
      public const ON_POST_UPDATE:Signal = // method body index: 44 method index: 44
      new Signal();
      
      public const ON_DEBUG:Signal = // method body index: 44 method index: 44
      new Signal();
      
      public const ON_ACTIVATE:Signal = // method body index: 44 method index: 44
      new Signal();
      
      public const ON_DEACTIVATE:Signal = // method body index: 44 method index: 44
      new Signal();
      
      private var _started:Boolean = false;
      
      private var _main:flash.display.Sprite;
      
      private var _starling:Starling;
      
      private var _root:starling.display.Sprite;
      
      private var _currentWorld:World;
      
      private var _targetWorld:World;
      
      private var _smoothing:Boolean;
      
      private var _console:Console;
      
      private var _paused:Boolean = false;
      
      private var _focused:Boolean = true;
      
      private var _fixedUpdateInterval:Boolean;
      
      private var _lastFrame:Number;
      
      public function Engine(param1:flash.display.Sprite, param2:Boolean = true, param3:Boolean = false)
      {
         // method body index: 44 method index: 44
         super();
         _instance = this;
         this._main = param1;
         this._smoothing = param2;
         this._fixedUpdateInterval = param3;
      }
      
      public static function get instance() : Engine
      {
         // method body index: 43 method index: 43
         return _instance;
      }
      
      public function start() : void
      {
         // method body index: 45 method index: 45
         if(!this._started)
         {
            this._started = true;
            if(this._main.stage != null)
            {
               this.onAddedToStage(null);
            }
            else
            {
               this._main.addEventListener(flash.events.Event.ADDED_TO_STAGE,this.onAddedToStage);
            }
         }
      }
      
      private function onAddedToStage(param1:flash.events.Event) : void
      {
         // method body index: 46 method index: 46
         this._main.removeEventListener(flash.events.Event.ADDED_TO_STAGE,this.onAddedToStage);
         this._main.addEventListener(flash.events.Event.REMOVED_FROM_STAGE,this.onRemovedFromStage);
         this._main.stage.addEventListener(flash.events.Event.ACTIVATE,this.onActivate);
         this._main.stage.addEventListener(flash.events.Event.DEACTIVATE,this.onDeactivate);
         this._starling = new Starling(starling.display.Sprite,this._main.stage);
         this._starling.addEventListener(starling.events.Event.ROOT_CREATED,this.onRootCreated);
         this._starling.start();
      }
      
      private function onRemovedFromStage(param1:flash.events.Event) : void
      {
         // method body index: 47 method index: 47
         this.ON_END.dispatch();
         Input.end();
         this._main.stage.removeEventListener(flash.events.Event.ACTIVATE,this.onActivate);
         this._main.stage.removeEventListener(flash.events.Event.DEACTIVATE,this.onDeactivate);
         this._main.removeEventListener(flash.events.Event.REMOVED_FROM_STAGE,this.onRemovedFromStage);
         this._starling.removeEventListener(starling.events.Event.ROOT_CREATED,this.onRootCreated);
         this._starling.stop();
         this._starling.dispose();
         this._starling = null;
      }
      
      private function onRootCreated(param1:starling.events.Event) : void
      {
         // method body index: 48 method index: 48
         this._starling.removeEventListener(starling.events.Event.ROOT_CREATED,this.onRootCreated);
         this._root = Sprite(this._starling.root);
         this._root.addEventListener(EnterFrameEvent.ENTER_FRAME,this.onEnterFrame);
         this._lastFrame = 0;
         Rand.start();
         Time.start();
         Input.start();
         this.ON_START.dispatch();
      }
      
      private function onEnterFrame(param1:EnterFrameEvent) : void
      {
         // method body index: 49 method index: 49
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         if(this._focused)
         {
            _loc2_ = this._lastFrame + param1.passedTime;
            _loc3_ = 1000 / this.frameRate;
            do
            {
               _loc4_ = this._fixedUpdateInterval ? this._lastFrame + _loc3_ : _loc2_;
               Time.update(_loc4_);
               if(!this._paused)
               {
                  this.ON_PRE_UPDATE.dispatch();
                  if(this._currentWorld != null && this._currentWorld.active)
                  {
                     this._currentWorld.update();
                  }
                  this.ON_UPDATE.dispatch();
                  this.ON_POST_UPDATE.dispatch();
               }
               Input.update();
               if(this._currentWorld != this._targetWorld)
               {
                  if(this._currentWorld != null)
                  {
                     this._currentWorld.end();
                  }
                  this._currentWorld = this._targetWorld;
                  if(this._currentWorld != null)
                  {
                     this._currentWorld.start(this);
                  }
                  this._main.stage.focus = this._main.stage;
               }
               this._lastFrame = _loc4_;
            }
            while(_loc2_ - _loc3_ > this._lastFrame);
         }
      }
      
      private function onActivate(param1:flash.events.Event) : void
      {
         // method body index: 50 method index: 50
         if(!this._fixedUpdateInterval)
         {
            Time.resume();
         }
         this._focused = true;
         this.ON_ACTIVATE.dispatch();
      }
      
      private function onDeactivate(param1:flash.events.Event) : void
      {
         // method body index: 51 method index: 51
         this.ON_DEACTIVATE.dispatch();
         this._focused = false;
      }
      
      fp_internal function get paused() : Boolean
      {
         // method body index: 52 method index: 52
         return this._paused;
      }
      
      fp_internal function set paused(param1:Boolean) : void
      {
         // method body index: 53 method index: 53
         this._paused = param1;
      }
      
      public function setWorld(param1:World) : void
      {
         // method body index: 54 method index: 54
         this._targetWorld = param1;
      }
      
      public function get main() : flash.display.Sprite
      {
         // method body index: 55 method index: 55
         return this._main;
      }
      
      public function get starling() : Starling
      {
         // method body index: 56 method index: 56
         return this._starling;
      }
      
      public function get root() : starling.display.Sprite
      {
         // method body index: 57 method index: 57
         return this._root;
      }
      
      public function get currentWorld() : World
      {
         // method body index: 58 method index: 58
         return this._currentWorld;
      }
      
      public function get width() : int
      {
         // method body index: 59 method index: 59
         return this._starling.stage.stageWidth;
      }
      
      public function get height() : int
      {
         // method body index: 60 method index: 60
         return this._starling.stage.stageHeight;
      }
      
      public function get backgroundColor() : uint
      {
         // method body index: 61 method index: 61
         return this._starling.stage.color;
      }
      
      public function set backgroundColor(param1:uint) : void
      {
         // method body index: 62 method index: 62
         this._starling.stage.color = param1;
      }
      
      public function get frameRate() : Number
      {
         // method body index: 63 method index: 63
         return this._main.stage.frameRate;
      }
      
      public function set frameRate(param1:Number) : void
      {
         // method body index: 64 method index: 64
         this._main.stage.frameRate = param1;
      }
      
      public function get smoothing() : Boolean
      {
         // method body index: 65 method index: 65
         return this._smoothing;
      }
   }
}

