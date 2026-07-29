package flashpunk2
{
   import flashpunk2.components.physics.RigidBody;
   import flashpunk2.components.timing.Invoker;
   import flashpunk2.components.timing.Tween;
   import flashpunk2.global.Cache;
   import flashpunk2.global.Calc;
   import flashpunk2.namespaces.fp_internal;
   import starling.display.Sprite;
   
   use namespace fp_internal;
   
   public class Entity
   {
      
      // method body index: 984 method index: 984
      private static var _componentsTemp:Vector.<Component> = // method body index: 984 method index: 984
      new Vector.<Component>();
      
      public const ON_START:Signal = // method body index: 985 method index: 985
      new Signal();
      
      public const ON_END:Signal = // method body index: 985 method index: 985
      new Signal();
      
      public const ON_UPDATE:Signal = // method body index: 985 method index: 985
      new Signal();
      
      public const ON_DEBUG:Signal = // method body index: 985 method index: 985
      new Signal();
      
      private var _world:World;
      
      private var _sprite:Sprite = // method body index: 985 method index: 985
      new Sprite();
      
      private var _active:Boolean = true;
      
      private var _components:Vector.<Component> = // method body index: 985 method index: 985
      new Vector.<Component>();
      
      private var _cleanComponents:Boolean = false;
      
      private var _groups:uint = 0;
      
      private var _angle:Number = 0;
      
      private var _depth:int = 0;
      
      private var _name:String = null;
      
      private var _cached:Boolean;
      
      private var _rigidBody:RigidBody;
      
      public function Entity(param1:Number = 0, param2:Number = 0, param3:Function = null)
      {
         // method body index: 985 method index: 985
         super();
         this._sprite.x = param1;
         this._sprite.y = param2;
         if(param3 != null)
         {
            this.ON_UPDATE.add(param3);
         }
      }
      
      fp_internal function start(param1:World) : void
      {
         // method body index: 986 method index: 986
         this._world = param1;
         this._world.sprite.addChild(this._sprite);
         if(this._name != null)
         {
            this._world.addName(this._name,this);
         }
         var _loc2_:int = int(this._components.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if(this._components[_loc3_] != null)
            {
               this._components[_loc3_].start(this);
            }
            _loc3_++;
         }
         if(this._rigidBody != null)
         {
            this._rigidBody.addToSpace();
         }
         this.ON_START.dispatch();
      }
      
      fp_internal function end() : void
      {
         // method body index: 987 method index: 987
         this.ON_END.dispatch();
         if(this._rigidBody != null)
         {
            this._rigidBody.removeFromSpace();
         }
         var _loc1_:int = int(this._components.length);
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_)
         {
            if(this._components[_loc2_] != null)
            {
               this._components[_loc2_].end();
            }
            _loc2_++;
         }
         if(this._name != null)
         {
            this._world.removeName(this._name);
         }
         this._world.sprite.removeChild(this._sprite);
         this._world = null;
      }
      
      fp_internal function update() : void
      {
         // method body index: 988 method index: 988
         this.ON_UPDATE.dispatch();
         if(this._cleanComponents)
         {
            this._cleanComponents = false;
            this.cleanComponents();
         }
      }
      
      fp_internal function setCached() : void
      {
         // method body index: 989 method index: 989
         this._cached = true;
      }
      
      fp_internal function setPositionAngle(param1:Number, param2:Number, param3:Number) : void
      {
         // method body index: 990 method index: 990
         this._sprite.x = param1;
         this._sprite.y = param2;
         this._angle = param3;
         this._sprite.rotation = param3 * Calc.RAD;
      }
      
      private function cleanComponents() : void
      {
         // method body index: 991 method index: 991
         var _loc1_:int = 0;
         while(_loc1_ < this._components.length)
         {
            if(this._components[_loc1_] != null)
            {
               _componentsTemp.push(this._components[_loc1_]);
            }
            _loc1_++;
         }
         var _loc2_:Vector.<Component> = this._components;
         this._components = _componentsTemp;
         _componentsTemp = _loc2_;
         _componentsTemp.length = 0;
      }
      
      public function setSignals(param1:Function, param2:Function = null, param3:Function = null) : void
      {
         // method body index: 992 method index: 992
         if(param1 != null)
         {
            this.ON_START.add(param1);
         }
         if(param2 != null)
         {
            this.ON_UPDATE.add(param2);
         }
         if(param3 != null)
         {
            this.ON_END.add(param3);
         }
      }
      
      public function add(param1:Component) : void
      {
         // method body index: 993 method index: 993
         if(param1 is RigidBody)
         {
            if(this._rigidBody != null)
            {
               throw new Error("An Entity can only have one RigidBody.");
            }
            this._rigidBody = RigidBody(param1);
         }
         this._components.push(param1);
         if(this.exists)
         {
            param1.start(this);
         }
      }
      
      public function addComponent(param1:Component) : void
      {
         // method body index: 994 method index: 994
         this.add(param1);
      }
      
      public function addComponents(... rest) : void
      {
         // method body index: 995 method index: 995
         var _loc2_:Component = null;
         for each(_loc2_ in rest)
         {
            this.add(_loc2_);
         }
      }
      
      public function remove(param1:Component) : void
      {
         // method body index: 996 method index: 996
         if(this._rigidBody == param1)
         {
            this._rigidBody = null;
         }
         if(this.exists)
         {
            param1.end();
         }
         this._components[this._components.indexOf(param1)] = null;
         this._cleanComponents = true;
      }
      
      public function removeComponent(param1:Component) : void
      {
         // method body index: 997 method index: 997
         this.remove(param1);
      }
      
      public function removeComponents(... rest) : void
      {
         // method body index: 998 method index: 998
         var _loc2_:Component = null;
         for each(_loc2_ in rest)
         {
            this.remove(_loc2_);
         }
      }
      
      public function pullComponentToFront(param1:Component) : void
      {
         // method body index: 999 method index: 999
         if(this._components.indexOf(param1) < 0)
         {
            return;
         }
         this._components[this._components.indexOf(param1)] = null;
         this._components.push(param1);
      }
      
      public function getComponent(param1:Class) : *
      {
         // method body index: 1000 method index: 1000
         var _loc2_:Component = null;
         for each(_loc2_ in this._components)
         {
            if(_loc2_ is param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function getComponents(param1:Class, param2:* = null) : *
      {
         // method body index: 1001 method index: 1001
         var _loc3_:Component = null;
         if(param2 == null)
         {
            param2 = new Vector.<Component>();
         }
         for each(_loc3_ in this._components)
         {
            if(_loc3_ is param1)
            {
               param2.push(_loc3_);
            }
         }
         return param2;
      }
      
      public function inGroups(param1:uint, param2:Boolean = true) : Boolean
      {
         // method body index: 1002 method index: 1002
         return param2 ? (this._groups & param1) > 0 : (this._groups & param1) == param1;
      }
      
      public function removeSelf() : void
      {
         // method body index: 1003 method index: 1003
         if(this.exists)
         {
            this.world.remove(this);
         }
      }
      
      public function setPosition(param1:Number, param2:Number) : void
      {
         // method body index: 1004 method index: 1004
         this.x = param1;
         this.y = param2;
      }
      
      public function setScale(param1:Number, param2:Number) : void
      {
         // method body index: 1005 method index: 1005
         this.scaleX = param1;
         this.scaleY = param2;
      }
      
      public function lookAt(param1:Number, param2:Number) : void
      {
         // method body index: 1006 method index: 1006
         this.angle = Calc.atan2(param2 - this.y,param1 - this.x);
      }
      
      public function tween(param1:Object, param2:Number, param3:Object = null, param4:Boolean = true) : Tween
      {
         // method body index: 1007 method index: 1007
         if(param4)
         {
            this.cancelTween(param1);
         }
         var _loc5_:Tween = Cache.pop(Tween);
         _loc5_.init(param1,param2,param3);
         this.add(_loc5_);
         return _loc5_;
      }
      
      public function cancelTween(param1:Object) : void
      {
         // method body index: 1008 method index: 1008
         var _loc2_:Component = null;
         for each(_loc2_ in this._components)
         {
            if(_loc2_ is Tween && Tween(_loc2_).target == param1)
            {
               _loc2_.removeSelf();
            }
         }
      }
      
      public function cancelAllTweens() : void
      {
         // method body index: 1009 method index: 1009
         var _loc1_:Component = null;
         for each(_loc1_ in this._components)
         {
            if(_loc1_ is Tween)
            {
               _loc1_.removeSelf();
            }
         }
      }
      
      private function getMethod(param1:*) : Function
      {
         // method body index: 1010 method index: 1010
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
         // method body index: 1011 method index: 1011
         var _loc6_:Invoker = null;
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
            _loc6_ = Cache.pop(Invoker);
            _loc6_.init(this.getMethod(param1),param2,param3,param4);
            this.add(_loc6_);
         }
      }
      
      public function cancelInvoke(param1:*) : void
      {
         // method body index: 1012 method index: 1012
         var _loc3_:Component = null;
         var _loc2_:Function = this.getMethod(param1);
         for each(_loc3_ in this._components)
         {
            if(_loc3_ is Invoker && Invoker(_loc3_).callback == _loc2_)
            {
               _loc3_.removeSelf();
            }
         }
      }
      
      public function cancelAllInvokes() : void
      {
         // method body index: 1013 method index: 1013
         var _loc1_:Component = null;
         for each(_loc1_ in this._components)
         {
            if(_loc1_ is Invoker)
            {
               _loc1_.removeSelf();
            }
         }
      }
      
      public function distanceFrom(param1:Entity) : Number
      {
         // method body index: 1014 method index: 1014
         return Calc.distance(this.x,this.y,param1.x,param1.y);
      }
      
      public function activate() : void
      {
         // method body index: 1015 method index: 1015
         this.active = true;
      }
      
      public function deactivate() : void
      {
         // method body index: 1016 method index: 1016
         this.active = false;
      }
      
      public function show() : void
      {
         // method body index: 1017 method index: 1017
         this.visible = true;
      }
      
      public function hide() : void
      {
         // method body index: 1018 method index: 1018
         this.visible = false;
      }
      
      public function getFunction(param1:String) : Function
      {
         // method body index: 1019 method index: 1019
         if(hasOwnProperty(param1))
         {
            return this[param1];
         }
         return null;
      }
      
      public function get exists() : Boolean
      {
         // method body index: 1020 method index: 1020
         return this._world != null && this._world.exists;
      }
      
      public function get world() : World
      {
         // method body index: 1021 method index: 1021
         return this._world;
      }
      
      public function get physics() : Physics
      {
         // method body index: 1022 method index: 1022
         return this._world != null ? this._world.physics : null;
      }
      
      public function get camera() : Camera
      {
         // method body index: 1023 method index: 1023
         return this._world != null ? this._world.camera : null;
      }
      
      public function get engine() : Engine
      {
         // method body index: 1024 method index: 1024
         return Engine.instance;
      }
      
      public function get sprite() : Sprite
      {
         // method body index: 1025 method index: 1025
         return this._sprite;
      }
      
      public function get active() : Boolean
      {
         // method body index: 1026 method index: 1026
         return this._active;
      }
      
      public function set active(param1:Boolean) : void
      {
         // method body index: 1027 method index: 1027
         this._active = param1;
      }
      
      public function get visible() : Boolean
      {
         // method body index: 1028 method index: 1028
         return this._sprite.visible;
      }
      
      public function set visible(param1:Boolean) : void
      {
         // method body index: 1029 method index: 1029
         this._sprite.visible = param1;
      }
      
      public function get depth() : int
      {
         // method body index: 1030 method index: 1030
         return this._depth;
      }
      
      public function set depth(param1:int) : void
      {
         // method body index: 1031 method index: 1031
         if(this._depth != param1)
         {
            this._depth = param1;
            if(this._world != null)
            {
               this._world.requestSortEntities();
            }
         }
      }
      
      public function get groups() : uint
      {
         // method body index: 1032 method index: 1032
         return this._groups;
      }
      
      public function set groups(param1:uint) : void
      {
         // method body index: 1033 method index: 1033
         if(this._groups != param1)
         {
            this._groups = param1;
         }
      }
      
      public function get x() : Number
      {
         // method body index: 1034 method index: 1034
         return this._sprite.x;
      }
      
      public function set x(param1:Number) : void
      {
         // method body index: 1035 method index: 1035
         this._sprite.x = param1;
         if(this._rigidBody != null)
         {
            this._rigidBody.x = param1;
         }
      }
      
      public function get y() : Number
      {
         // method body index: 1036 method index: 1036
         return this._sprite.y;
      }
      
      public function set y(param1:Number) : void
      {
         // method body index: 1037 method index: 1037
         this._sprite.y = param1;
         if(this._rigidBody != null)
         {
            this._rigidBody.y = param1;
         }
      }
      
      public function get scaleX() : Number
      {
         // method body index: 1038 method index: 1038
         return this._sprite.scaleX;
      }
      
      public function set scaleX(param1:Number) : void
      {
         // method body index: 1039 method index: 1039
         this._sprite.scaleX = param1;
      }
      
      public function get scaleY() : Number
      {
         // method body index: 1040 method index: 1040
         return this._sprite.scaleY;
      }
      
      public function set scaleY(param1:Number) : void
      {
         // method body index: 1041 method index: 1041
         this._sprite.scaleY = param1;
      }
      
      public function get angle() : Number
      {
         // method body index: 1042 method index: 1042
         return this._angle;
      }
      
      public function set angle(param1:Number) : void
      {
         // method body index: 1043 method index: 1043
         if(this._angle != param1)
         {
            this._angle = param1;
            this._sprite.rotation = param1 * Calc.RAD;
            if(this._rigidBody != null)
            {
               this._rigidBody.angle = this._sprite.rotation;
            }
         }
      }
      
      public function get name() : String
      {
         // method body index: 1044 method index: 1044
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         // method body index: 1045 method index: 1045
         if(this._name != param1)
         {
            if(param1 == "")
            {
               throw new Error("Name cannot be empty string.");
            }
            if(this.exists)
            {
               if(this._name != null)
               {
                  this.world.removeName(this._name);
               }
               if(param1 != null)
               {
                  this.world.addName(param1,this);
               }
            }
            this._name = param1;
         }
      }
      
      public function get width() : Number
      {
         // method body index: 1046 method index: 1046
         return this._sprite.width;
      }
      
      public function get height() : Number
      {
         // method body index: 1047 method index: 1047
         return this._sprite.height;
      }
      
      public function get cached() : Boolean
      {
         // method body index: 1048 method index: 1048
         return this._cached;
      }
      
      public function get rigidBody() : RigidBody
      {
         // method body index: 1049 method index: 1049
         return this._rigidBody;
      }
   }
}

