package flashpunk2
{
   import flash.geom.Point;
   import flashpunk2.components.timing.Tween;
   import flashpunk2.global.Cache;
   import flashpunk2.global.Input;
   import flashpunk2.namespaces.fp_internal;
   import starling.display.Sprite;
   
   use namespace fp_internal;
   
   public class World
   {
      
      // method body index: 67 method index: 67
      private static var _entitiesTemp:Vector.<Entity> = // method body index: 67 method index: 67
      new Vector.<Entity>();
      
      public const ON_START:Signal = // method body index: 68 method index: 68
      new Signal();
      
      public const ON_END:Signal = // method body index: 68 method index: 68
      new Signal();
      
      public const ON_UPDATE:Signal = // method body index: 68 method index: 68
      new Signal();
      
      public const ON_PHYSICS:Signal = // method body index: 68 method index: 68
      new Signal();
      
      public const ON_DEBUG:Signal = // method body index: 68 method index: 68
      new Signal();
      
      private var _engine:Engine;
      
      private var _camera:Camera;
      
      private var _sprite:Sprite;
      
      private var _holder:Entity = // method body index: 68 method index: 68
      new Entity();
      
      private var _entities:Vector.<Entity> = // method body index: 68 method index: 68
      new Vector.<Entity>();
      
      private var _cleanEntities:Boolean = false;
      
      private var _sortEntities:Boolean = false;
      
      private var _nameLookup:Object = // method body index: 68 method index: 68
      {};
      
      private var _active:Boolean = true;
      
      private var _mouse:Point = // method body index: 68 method index: 68
      new Point();
      
      private var _physics:Physics;
      
      public function World(param1:Function = null)
      {
         // method body index: 68 method index: 68
         super();
         this._camera = new Camera();
         this._sprite = this._camera.sprite;
         this._physics = new Physics();
         if(param1 != null)
         {
            this.ON_UPDATE.add(param1);
         }
      }
      
      fp_internal function start(param1:Engine) : void
      {
         // method body index: 69 method index: 69
         this._engine = param1;
         this._engine.root.addChild(this._sprite);
         this._holder.start(this);
         var _loc2_:int = int(this._entities.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if(this._entities[_loc3_] != null)
            {
               this._entities[_loc3_].start(this);
            }
            _loc3_++;
         }
         this.ON_START.dispatch();
         this._camera.update();
      }
      
      fp_internal function end() : void
      {
         // method body index: 70 method index: 70
         this.ON_END.dispatch();
         var _loc1_:int = int(this._entities.length);
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_)
         {
            if(this._entities[_loc2_] != null)
            {
               this._entities[_loc2_].end();
            }
            _loc2_++;
         }
         this._holder.end();
         this._engine.root.removeChild(this._sprite);
         this._engine = null;
      }
      
      fp_internal function update() : void
      {
         // method body index: 71 method index: 71
         this._mouse.x = Input.mouseX;
         this._mouse.y = Input.mouseY;
         this._sprite.globalToLocal(this._mouse,this._mouse);
         if(this._physics != null)
         {
            this._physics.update();
            this.ON_PHYSICS.dispatch();
         }
         this._holder.update();
         this.updateEntities();
         this.ON_UPDATE.dispatch();
         this._camera.update();
         if(this._cleanEntities)
         {
            this.cleanEntities();
            this._cleanEntities = false;
         }
         if(this._sortEntities)
         {
            this.sortEntities();
            this._sortEntities = false;
         }
      }
      
      fp_internal function requestSortEntities() : void
      {
         // method body index: 72 method index: 72
         this._sortEntities = true;
      }
      
      fp_internal function addName(param1:String, param2:Entity) : void
      {
         // method body index: 73 method index: 73
         if(param1 in this._nameLookup)
         {
            throw new Error("Entity name already taken: " + param1);
         }
         this._nameLookup[param1] = param2;
      }
      
      fp_internal function removeName(param1:String) : void
      {
         // method body index: 74 method index: 74
         delete this._nameLookup[param1];
      }
      
      fp_internal function get entities() : Vector.<Entity>
      {
         // method body index: 75 method index: 75
         return this._entities;
      }
      
      private function updateEntities() : void
      {
         // method body index: 76 method index: 76
         var _loc1_:int = int(this._entities.length);
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_)
         {
            if(this._entities[_loc2_] != null && this._entities[_loc2_].active)
            {
               this._entities[_loc2_].update();
            }
            _loc2_++;
         }
      }
      
      private function cleanEntities() : void
      {
         // method body index: 77 method index: 77
         this._entities = this.clearNulls(this._entities);
      }
      
      private function clearNulls(param1:Vector.<Entity>) : Vector.<Entity>
      {
         // method body index: 78 method index: 78
         var _loc3_:Entity = null;
         var _loc2_:Vector.<Entity> = _entitiesTemp;
         for each(_loc3_ in param1)
         {
            if(_loc3_ != null)
            {
               _loc2_[_loc2_.length] = _loc3_;
            }
         }
         param1.length = 0;
         _entitiesTemp = param1;
         return _loc2_;
      }
      
      public function sortEntities() : void
      {
         // method body index: 79 method index: 79
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:Entity = null;
         var _loc4_:* = 0;
         if(this._entities.length > 1)
         {
            this.cleanEntities();
            _loc4_ = 3;
            while(_loc4_ > 0)
            {
               _loc1_ = 0;
               while(_loc1_ < this._entities.length)
               {
                  _loc2_ = _loc1_;
                  _loc3_ = this._entities[_loc1_];
                  while(_loc2_ >= _loc4_ && this._entities[_loc2_ - _loc4_].depth < _loc3_.depth)
                  {
                     this._entities[_loc2_] = this._entities[_loc2_ - _loc4_];
                     this._sprite.setChildIndex(this._entities[_loc2_ - _loc4_].sprite,_loc2_);
                     _loc2_ -= _loc4_;
                  }
                  this._entities[_loc2_] = _loc3_;
                  this._sprite.setChildIndex(_loc3_.sprite,_loc2_);
                  _loc1_++;
               }
               _loc4_--;
            }
         }
      }
      
      public function add(param1:Entity) : void
      {
         // method body index: 80 method index: 80
         this.requestSortEntities();
         this._entities.push(param1);
         if(this.exists)
         {
            param1.start(this);
         }
      }
      
      public function addEntity(param1:Entity) : void
      {
         // method body index: 81 method index: 81
         this.add(param1);
      }
      
      public function addEntities(... rest) : void
      {
         // method body index: 82 method index: 82
         var _loc2_:Entity = null;
         for each(_loc2_ in rest)
         {
            this.add(_loc2_);
         }
      }
      
      public function create(param1:Class) : *
      {
         // method body index: 83 method index: 83
         var _loc2_:Entity = Cache.pop(param1);
         _loc2_.setCached();
         this.add(_loc2_);
         return _loc2_;
      }
      
      public function remove(param1:Entity) : void
      {
         // method body index: 84 method index: 84
         if(this.exists)
         {
            param1.end();
         }
         this._entities[this._entities.indexOf(param1)] = null;
         this._cleanEntities = true;
         if(param1.cached)
         {
            Cache.push(param1);
         }
      }
      
      public function removeEntity(param1:Entity) : void
      {
         // method body index: 85 method index: 85
         this.remove(param1);
      }
      
      public function removeEntities(... rest) : void
      {
         // method body index: 86 method index: 86
         var _loc2_:Entity = null;
         for each(_loc2_ in rest)
         {
            this.remove(_loc2_);
         }
      }
      
      public function addComponentAt(param1:Component, param2:Number = 0, param3:Number = 0, param4:int = 0) : Entity
      {
         // method body index: 87 method index: 87
         var _loc5_:Entity = new Entity(param2,param3);
         _loc5_.depth = param4;
         _loc5_.add(param1);
         this.add(_loc5_);
         return _loc5_;
      }
      
      public function addComponent(param1:Component) : Entity
      {
         // method body index: 88 method index: 88
         var _loc2_:Entity = new Entity();
         _loc2_.add(param1);
         this.add(_loc2_);
         return _loc2_;
      }
      
      public function addComponents(... rest) : Entity
      {
         // method body index: 89 method index: 89
         var _loc2_:Entity = new Entity();
         _loc2_.addComponents.apply(null,rest);
         this.add(_loc2_);
         return _loc2_;
      }
      
      public function getEntityByType(param1:Class) : *
      {
         // method body index: 90 method index: 90
         var _loc2_:Entity = null;
         for each(_loc2_ in this._entities)
         {
            if(_loc2_ is param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function getEntityByGroup(param1:uint) : *
      {
         // method body index: 91 method index: 91
         var _loc2_:Entity = null;
         for each(_loc2_ in this._entities)
         {
            if(_loc2_ != null && _loc2_.inGroups(param1))
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function getEntitiesByType(param1:Class, param2:* = null) : *
      {
         // method body index: 92 method index: 92
         var _loc3_:Entity = null;
         if(param2 == null)
         {
            param2 = Cache.pop(Array);
         }
         for each(_loc3_ in this._entities)
         {
            if(_loc3_ is param1)
            {
               param2.push(_loc3_);
            }
         }
         return param2;
      }
      
      public function getEntitiesByGroup(param1:uint, param2:* = null) : *
      {
         // method body index: 93 method index: 93
         var _loc3_:Entity = null;
         if(param2 == null)
         {
            param2 = Cache.pop(Array);
         }
         for each(_loc3_ in this._entities)
         {
            if(_loc3_ != null && _loc3_.inGroups(param1))
            {
               param2.push(_loc3_);
            }
         }
         return param2;
      }
      
      public function getEntityByName(param1:String) : *
      {
         // method body index: 94 method index: 94
         if(param1 in this._nameLookup)
         {
            return this._nameLookup[param1];
         }
         return null;
      }
      
      public function getComponent(param1:Class) : *
      {
         // method body index: 95 method index: 95
         var _loc2_:* = undefined;
         var _loc3_:Entity = null;
         for each(_loc3_ in this._entities)
         {
            if(_loc3_ != null)
            {
               _loc2_ = _loc3_.getComponent(param1);
               if(_loc2_ != null)
               {
                  return _loc2_;
               }
            }
         }
         return null;
      }
      
      public function getComponentByGroup(param1:uint, param2:Class) : *
      {
         // method body index: 96 method index: 96
         var _loc4_:* = undefined;
         var _loc5_:Entity = null;
         var _loc3_:Array = this.getEntitiesByGroup(param1);
         for each(_loc5_ in _loc3_)
         {
            _loc4_ = _loc5_.getComponent(param2);
            if(_loc4_ != null)
            {
               Cache.push(_loc3_);
               return _loc4_;
            }
         }
         Cache.push(_loc3_);
         return null;
      }
      
      public function getComponents(param1:Class, param2:* = null) : *
      {
         // method body index: 97 method index: 97
         var _loc3_:Entity = null;
         if(param2 == null)
         {
            param2 = Cache.pop(Array);
         }
         for each(_loc3_ in this._entities)
         {
            if(_loc3_ != null)
            {
               _loc3_.getComponents(param1,param2);
            }
         }
         return param2;
      }
      
      public function getComponentsByGroup(param1:uint, param2:Class, param3:* = null) : *
      {
         // method body index: 98 method index: 98
         var _loc5_:* = undefined;
         var _loc6_:Entity = null;
         if(param3 == null)
         {
            param3 = Cache.pop(Array);
         }
         var _loc4_:Array = this.getEntitiesByGroup(param1);
         for each(_loc6_ in _loc4_)
         {
            _loc5_ = _loc6_.getComponent(param2);
            if(_loc5_ != null)
            {
               param3.push(_loc5_);
            }
         }
         Cache.push(_loc4_);
         return param3;
      }
      
      public function getFunction(param1:String) : Function
      {
         // method body index: 99 method index: 99
         if(hasOwnProperty(param1))
         {
            return this[param1];
         }
         return null;
      }
      
      public function tween(param1:Object, param2:Number, param3:Object = null, param4:Boolean = true) : Tween
      {
         // method body index: 100 method index: 100
         return this._holder.tween(param1,param2,param3,param4);
      }
      
      public function cancelTween(param1:Object) : void
      {
         // method body index: 101 method index: 101
         this._holder.cancelTween(param1);
      }
      
      public function cancelAllTweens() : void
      {
         // method body index: 102 method index: 102
         this._holder.cancelAllTweens();
      }
      
      private function getMethod(param1:*) : Function
      {
         // method body index: 103 method index: 103
         var _loc2_:Function = null;
         if(param1 is String)
         {
            _loc2_ = this[param1];
         }
         else
         {
            if(!(param1 is Function))
            {
               throw new Error("Invoke method must be reference or a name of a public function. Parameter is invalid: " + param1);
            }
            _loc2_ = param1;
         }
         return _loc2_;
      }
      
      public function invoke(param1:*, param2:* = null, param3:Number = 0, param4:int = 0) : void
      {
         // method body index: 104 method index: 104
         var _loc5_:Function = this.getMethod(param1);
         if(param3 <= 0)
         {
            while(param4 >= 0)
            {
               if(param2 != null)
               {
                  _loc5_(param2);
               }
               else
               {
                  _loc5_();
               }
               param4--;
            }
         }
         else
         {
            this._holder.invoke(param1,param2,param3,param4);
         }
      }
      
      public function cancelInvoke(param1:*, param2:Boolean) : void
      {
         // method body index: 105 method index: 105
         var _loc3_:Entity = null;
         this._holder.cancelInvoke(this.getMethod(param1));
         if(param2)
         {
            for each(_loc3_ in this._entities)
            {
               if(_loc3_ != null)
               {
                  _loc3_.cancelInvoke(param1);
               }
            }
         }
      }
      
      public function cancelAllInvokes(param1:Boolean) : void
      {
         // method body index: 106 method index: 106
         var _loc2_:Entity = null;
         this._holder.cancelAllInvokes();
         if(param1)
         {
            for each(_loc2_ in this._entities)
            {
               if(_loc2_ != null)
               {
                  _loc2_.cancelAllInvokes();
               }
            }
         }
      }
      
      public function invokeOnAll(param1:String, param2:* = null, param3:Number = 0, param4:int = 0) : void
      {
         // method body index: 107 method index: 107
         var _loc5_:Entity = null;
         for each(_loc5_ in this._entities)
         {
            if(_loc5_ != null)
            {
               _loc5_.invoke(param1,param2,param3,param4);
            }
         }
      }
      
      public function invokeOnType(param1:Class, param2:String, param3:* = null, param4:Number = 0, param5:int = 0) : void
      {
         // method body index: 108 method index: 108
         var _loc6_:Entity = null;
         for each(_loc6_ in this._entities)
         {
            if(_loc6_ is param1)
            {
               _loc6_.invoke(param2,param3,param4,param5);
            }
         }
      }
      
      public function invokeOnGroup(param1:uint, param2:String, param3:* = null, param4:Number = 0, param5:int = 0) : void
      {
         // method body index: 109 method index: 109
         var _loc6_:Entity = null;
         for each(_loc6_ in this._entities)
         {
            if(_loc6_ != null && _loc6_.inGroups(param1))
            {
               _loc6_.invoke(param2,param3,param4,param5);
            }
         }
      }
      
      public function forEach(param1:Function) : void
      {
         // method body index: 110 method index: 110
         var _loc2_:Entity = null;
         for each(_loc2_ in this._entities)
         {
            if(_loc2_ != null)
            {
               param1(_loc2_);
            }
         }
      }
      
      public function forEachInGroup(param1:uint, param2:Function) : void
      {
         // method body index: 111 method index: 111
         var _loc3_:Entity = null;
         for each(_loc3_ in this._entities)
         {
            if(_loc3_ != null && _loc3_.inGroups(param1))
            {
               param2(_loc3_);
            }
         }
      }
      
      public function forEachType(param1:Class, param2:Function) : void
      {
         // method body index: 112 method index: 112
         var _loc3_:Entity = null;
         for each(_loc3_ in this._entities)
         {
            if(_loc3_ is param1)
            {
               param2(_loc3_ as param1);
            }
         }
      }
      
      public function get exists() : Boolean
      {
         // method body index: 113 method index: 113
         return this._engine != null;
      }
      
      public function get engine() : Engine
      {
         // method body index: 114 method index: 114
         return Engine.instance;
      }
      
      public function get sprite() : Sprite
      {
         // method body index: 115 method index: 115
         return this._sprite;
      }
      
      public function get active() : Boolean
      {
         // method body index: 116 method index: 116
         return this._active;
      }
      
      public function set active(param1:Boolean) : void
      {
         // method body index: 117 method index: 117
         this._active = param1;
      }
      
      public function get visible() : Boolean
      {
         // method body index: 118 method index: 118
         return this._sprite.visible;
      }
      
      public function set visible(param1:Boolean) : void
      {
         // method body index: 119 method index: 119
         this._sprite.visible = param1;
      }
      
      public function get camera() : Camera
      {
         // method body index: 120 method index: 120
         return this._camera;
      }
      
      public function get mouseX() : Number
      {
         // method body index: 121 method index: 121
         return this._mouse.x;
      }
      
      public function get mouseY() : Number
      {
         // method body index: 122 method index: 122
         return this._mouse.y;
      }
      
      public function get entityCount() : int
      {
         // method body index: 123 method index: 123
         return this._entities.length;
      }
      
      public function get physics() : Physics
      {
         // method body index: 124 method index: 124
         return this._physics;
      }
   }
}

