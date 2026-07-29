package flashpunk2.components.physics
{
   import flashpunk2.Component;
   import flashpunk2.Entity;
   import flashpunk2.global.Cache;
   import flashpunk2.namespaces.fp_internal;
   import nape.dynamics.Arbiter;
   import nape.dynamics.ArbiterList;
   import nape.phys.Body;
   import nape.phys.Material;
   import nape.shape.Shape;
   
   use namespace fp_internal;
   
   public class Collider extends Component
   {
      
      private var _shape:Shape;
      
      public function Collider(param1:Shape, param2:Boolean)
      {
         // method body index: 2248 method index: 2253
         super();
         this._shape = param1;
         this._shape.sensorEnabled = !param2;
         this._shape.userData.tag = null;
      }
      
      override fp_internal function start(param1:Entity) : void
      {
         // method body index: 2249 method index: 2254
         super.fp_internal::start(param1);
         if(param1.rigidBody != null)
         {
            this._shape.filter.collisionGroup = param1.groups;
            this._shape.userData.entity = param1;
            this._shape.body = rigidBody.body;
         }
      }
      
      override fp_internal function end() : void
      {
         // method body index: 2250 method index: 2255
         this._shape.filter.collisionGroup = 1;
         this._shape.userData.entity = null;
         this._shape.body = null;
         super.fp_internal::end();
      }
      
      public function colliding() : *
      {
         // method body index: 2251 method index: 2256
         var _loc1_:Arbiter = null;
         if(this._shape.body.arbiters.length > 0)
         {
            _loc1_ = this._shape.body.arbiters.at(0);
            return this._shape == _loc1_.shape1 ? _loc1_.body2.userData.entity : _loc1_.body1.userData.entity;
         }
         return null;
      }
      
      public function collidingWithEntity(param1:Entity) : Boolean
      {
         // method body index: 2252 method index: 2257
         var _loc3_:Arbiter = null;
         var _loc4_:Body = null;
         var _loc2_:ArbiterList = this._shape.body.arbiters;
         var _loc5_:int = 0;
         for(; _loc5_ < _loc2_.length; _loc5_++)
         {
            _loc3_ = _loc2_.at(_loc5_);
            if(this._shape == _loc3_.shape1)
            {
               _loc4_ = _loc3_.body2;
            }
            else
            {
               if(this._shape != _loc3_.shape2)
               {
                  continue;
               }
               _loc4_ = _loc3_.body1;
            }
            if(_loc4_.userData.entity == param1)
            {
               return true;
            }
         }
         return false;
      }
      
      public function collidingWithTag(param1:String) : *
      {
         // method body index: 2253 method index: 2258
         var _loc3_:Arbiter = null;
         var _loc4_:Shape = null;
         var _loc2_:ArbiterList = this._shape.body.arbiters;
         var _loc5_:int = 0;
         for(; _loc5_ < _loc2_.length; _loc5_++)
         {
            _loc3_ = _loc2_.at(_loc5_);
            if(this._shape == _loc3_.shape1)
            {
               _loc4_ = _loc3_.shape2;
            }
            else
            {
               if(this._shape != _loc3_.shape2)
               {
                  continue;
               }
               _loc4_ = _loc3_.shape1;
            }
            if(_loc4_.userData.tag == param1)
            {
               return _loc4_.body.userData.entity;
            }
         }
         return null;
      }
      
      public function collidingWithGroup(param1:uint) : *
      {
         // method body index: 2254 method index: 2259
         var _loc3_:Arbiter = null;
         var _loc4_:Body = null;
         var _loc2_:ArbiterList = this._shape.body.arbiters;
         var _loc5_:int = 0;
         for(; _loc5_ < _loc2_.length; _loc5_++)
         {
            _loc3_ = _loc2_.at(_loc5_);
            if(this._shape == _loc3_.shape1)
            {
               _loc4_ = _loc3_.body2;
            }
            else
            {
               if(this._shape != _loc3_.shape2)
               {
                  continue;
               }
               _loc4_ = _loc3_.body1;
            }
            if(_loc4_.userData.entity.inGroups(param1))
            {
               return _loc4_.userData.entity;
            }
         }
         return null;
      }
      
      public function collidingWithGroups(param1:uint, param2:Boolean = true) : *
      {
         // method body index: 2255 method index: 2260
         var _loc4_:Arbiter = null;
         var _loc5_:Body = null;
         var _loc3_:ArbiterList = this._shape.body.arbiters;
         var _loc6_:int = 0;
         for(; _loc6_ < _loc3_.length; _loc6_++)
         {
            _loc4_ = _loc3_.at(_loc6_);
            if(this._shape == _loc4_.shape1)
            {
               _loc5_ = _loc4_.body2;
            }
            else
            {
               if(this._shape != _loc4_.shape2)
               {
                  continue;
               }
               _loc5_ = _loc4_.body1;
            }
            if(_loc5_.userData.entity.inGroups(param1,param2))
            {
               return _loc5_.userData.entity;
            }
         }
         return null;
      }
      
      public function collidingWithType(param1:Class) : *
      {
         // method body index: 2256 method index: 2261
         var _loc3_:Arbiter = null;
         var _loc4_:Shape = null;
         var _loc2_:ArbiterList = this._shape.body.arbiters;
         var _loc5_:int = 0;
         for(; _loc5_ < _loc2_.length; _loc5_++)
         {
            _loc3_ = _loc2_.at(_loc5_);
            if(this._shape == _loc3_.shape1)
            {
               _loc4_ = _loc3_.shape2;
            }
            else
            {
               if(this._shape != _loc3_.shape2)
               {
                  continue;
               }
               _loc4_ = _loc3_.shape1;
            }
            if(_loc4_.body.userData.entity is param1)
            {
               return _loc4_.body.userData.entity;
            }
         }
         return null;
      }
      
      public function getCollisions(param1:* = null) : *
      {
         // method body index: 2257 method index: 2262
         var _loc3_:Arbiter = null;
         var _loc4_:Entity = null;
         if(param1 == null)
         {
            param1 = Cache.pop(Array);
         }
         var _loc2_:ArbiterList = this._shape.body.arbiters;
         var _loc5_:int = 0;
         while(_loc5_ < _loc2_.length)
         {
            _loc3_ = _loc2_.at(_loc5_);
            _loc4_ = this._shape == _loc3_.shape1 ? _loc3_.body2.userData.entity : _loc3_.body1.userData.entity;
            if(param1.indexOf(_loc4_) < 0)
            {
               param1.push(_loc4_);
            }
            _loc5_++;
         }
         return param1;
      }
      
      public function getCollisionsByTag(param1:String, param2:* = null) : *
      {
         // method body index: 2258 method index: 2263
         var _loc4_:Arbiter = null;
         var _loc5_:Shape = null;
         var _loc6_:Entity = null;
         if(param2 == null)
         {
            param2 = Cache.pop(Array);
         }
         var _loc3_:ArbiterList = this._shape.body.arbiters;
         var _loc7_:int = 0;
         for(; _loc7_ < _loc3_.length; _loc7_++)
         {
            _loc4_ = _loc3_.at(_loc7_);
            if(this._shape == _loc4_.shape1)
            {
               _loc5_ = _loc4_.shape2;
            }
            else
            {
               if(this._shape != _loc4_.shape2)
               {
                  continue;
               }
               _loc5_ = _loc4_.shape1;
            }
            if(_loc5_.userData.tag == param1 || _loc5_.body.userData.tag == param1)
            {
               _loc6_ = _loc5_.body.userData.entity;
               if(param2.indexOf(_loc6_) < 0)
               {
                  param2.push(_loc6_);
               }
            }
         }
         return param2;
      }
      
      public function getCollisionsByType(param1:Class, param2:* = null) : *
      {
         // method body index: 2259 method index: 2264
         var _loc4_:Arbiter = null;
         var _loc5_:Shape = null;
         var _loc6_:Entity = null;
         if(param2 == null)
         {
            param2 = Cache.pop(Array);
         }
         var _loc3_:ArbiterList = this._shape.body.arbiters;
         var _loc7_:int = 0;
         for(; _loc7_ < _loc3_.length; _loc7_++)
         {
            _loc4_ = _loc3_.at(_loc7_);
            if(this._shape == _loc4_.shape1)
            {
               _loc5_ = _loc4_.shape2;
            }
            else
            {
               if(this._shape != _loc4_.shape2)
               {
                  continue;
               }
               _loc5_ = _loc4_.shape1;
            }
            _loc6_ = _loc5_.body.userData.entity;
            if(_loc6_ is param1 && param2.indexOf(_loc6_) < 0)
            {
               param2.push(_loc6_);
            }
         }
         return param2;
      }
      
      public function invokeOnColliding(param1:String, param2:* = null, param3:Number = 0, param4:int = 0) : void
      {
         // method body index: 2260 method index: 2265
         var _loc5_:Vector.<Entity> = this.getCollisions();
         while(_loc5_.length > 0)
         {
            _loc5_.pop().invoke(param1,param2,param3,param4);
         }
         Cache.push(_loc5_);
      }
      
      public function invokeOnCollidingTag(param1:String, param2:String, param3:* = null, param4:Number = 0, param5:int = 0) : void
      {
         // method body index: 2261 method index: 2266
         var _loc6_:Vector.<Entity> = this.getCollisionsByTag(param1);
         while(_loc6_.length > 0)
         {
            _loc6_.pop().invoke(param2,param3,param4,param5);
         }
         Cache.push(_loc6_);
      }
      
      public function invokeOnCollidingType(param1:Class, param2:String, param3:* = null, param4:Number = 0, param5:int = 0) : void
      {
         // method body index: 2262 method index: 2267
         var _loc6_:Vector.<Entity> = this.getCollisionsByType(param1);
         while(_loc6_.length > 0)
         {
            _loc6_.pop().invoke(param2,param3,param4,param5);
         }
         Cache.push(_loc6_);
      }
      
      public function get shape() : Shape
      {
         // method body index: 2263 method index: 2268
         return this._shape;
      }
      
      public function get solid() : Boolean
      {
         // method body index: 2264 method index: 2269
         return !this._shape.sensorEnabled;
      }
      
      public function set solid(param1:Boolean) : void
      {
         // method body index: 2265 method index: 2270
         this._shape.sensorEnabled = !param1;
      }
      
      public function get tag() : String
      {
         // method body index: 2266 method index: 2271
         return this._shape.userData.tag;
      }
      
      public function set tag(param1:String) : void
      {
         // method body index: 2267 method index: 2272
         this._shape.userData.tag = param1;
      }
      
      public function get material() : Material
      {
         // method body index: 2268 method index: 2273
         return this._shape.material;
      }
      
      public function set material(param1:Material) : void
      {
         // method body index: 2269 method index: 2274
         this._shape.material = param1;
      }
      
      public function get mask() : uint
      {
         // method body index: 2270 method index: 2275
         return this._shape.filter.collisionMask;
      }
      
      public function set mask(param1:uint) : void
      {
         // method body index: 2271 method index: 2276
         this._shape.filter.collisionMask = param1;
      }
   }
}

