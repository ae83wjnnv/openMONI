package flashpunk2
{
   import flashpunk2.components.physics.Collider;
   import flashpunk2.components.physics.RigidBody;
   import flashpunk2.global.Cache;
   import flashpunk2.global.Calc;
   import flashpunk2.global.Time;
   import flashpunk2.namespaces.fp_internal;
   import nape.dynamics.InteractionFilter;
   import nape.geom.AABB;
   import nape.geom.Vec2;
   import nape.phys.Body;
   import nape.phys.BodyList;
   import nape.shape.Shape;
   import nape.shape.ShapeList;
   import nape.space.Space;
   
   use namespace fp_internal;
   
   public class Physics
   {
      
      // method body index: 931 method index: 931
      private static var _bodies:BodyList = // method body index: 931 method index: 931
      new BodyList();
      
      private static var _shapes:ShapeList = // method body index: 931 method index: 931
      new ShapeList();
      
      private static var _filter:InteractionFilter = // method body index: 931 method index: 931
      new InteractionFilter(uint.MAX_VALUE,-1,uint.MAX_VALUE,-1,uint.MAX_VALUE,-1);
      
      private static var _aabb:AABB = // method body index: 931 method index: 931
      new AABB();
      
      private var _space:Space = // method body index: 932 method index: 932
      new Space();
      
      private var _velocityIterations:uint = 10;
      
      private var _positionIterations:uint = 10;
      
      public function Physics()
      {
         // method body index: 932 method index: 932
         super();
      }
      
      fp_internal function update() : void
      {
         // method body index: 933 method index: 933
         if(Time.dt > 0)
         {
            this._space.step(Time.dt,this._velocityIterations,this._positionIterations);
         }
      }
      
      private function getFilter(param1:uint) : InteractionFilter
      {
         // method body index: 934 method index: 934
         _filter.collisionMask = param1;
         _filter.sensorMask = param1;
         _filter.fluidMask = param1;
         return _filter;
      }
      
      public function setGravity(param1:Number, param2:Number) : void
      {
         // method body index: 935 method index: 935
         this._space.gravity.setxy(param1,param2);
      }
      
      public function setGravityAngle(param1:Number, param2:Number) : void
      {
         // method body index: 936 method index: 936
         this._space.gravity = Vec2.fromPolar(param2,param1 * Calc.RAD,true);
      }
      
      public function findTypeAtPoint(param1:Class, param2:Number, param3:Number, param4:* = null) : *
      {
         // method body index: 937 method index: 937
         var _loc5_:Body = null;
         if(param4 == null)
         {
            param4 = Cache.pop(Array);
         }
         this._space.bodiesUnderPoint(Vec2.weak(param2,param3),null,_bodies);
         while(!_bodies.empty())
         {
            _loc5_ = _bodies.pop();
            if(_loc5_.userData.entity is param1)
            {
               param4.push(_loc5_.userData.entity);
            }
         }
         return param4;
      }
      
      public function firstTypeAtPoint(param1:Class, param2:Number, param3:Number) : *
      {
         // method body index: 938 method index: 938
         var _loc4_:Array = this.findTypeAtPoint(param1,param2,param3);
         var _loc5_:* = _loc4_.length > 0 ? _loc4_[0] : null;
         Cache.push(_loc4_);
         return _loc5_;
      }
      
      public function findTagAtPoint(param1:String, param2:Number, param3:Number, param4:* = null) : *
      {
         // method body index: 939 method index: 939
         var _loc5_:Shape = null;
         if(param4 == null)
         {
            param4 = Cache.pop(Array);
         }
         this._space.shapesUnderPoint(Vec2.weak(param2,param3),null,_shapes);
         while(!_shapes.empty())
         {
            _loc5_ = _shapes.pop();
            if(_loc5_.userData.tag == param1 || _loc5_.body.userData.tag == param1)
            {
               param4.push(_loc5_.userData.entity);
            }
         }
         return param4;
      }
      
      public function firstTagAtPoint(param1:String, param2:Number, param3:Number) : *
      {
         // method body index: 940 method index: 940
         var _loc4_:Array = this.findTagAtPoint(param1,param2,param3);
         var _loc5_:* = _loc4_.length > 0 ? _loc4_[0] : null;
         Cache.push(_loc4_);
         return _loc5_;
      }
      
      public function findGroupAtPoint(param1:uint, param2:Number, param3:Number, param4:* = null) : *
      {
         // method body index: 941 method index: 941
         var _loc5_:Body = null;
         if(param4 == null)
         {
            param4 = Cache.pop(Array);
         }
         this._space.bodiesUnderPoint(Vec2.weak(param2,param3),this.getFilter(param1),_bodies);
         while(!_bodies.empty())
         {
            _loc5_ = _bodies.pop();
            if(_loc5_.userData.entity.inGroups(param1,true))
            {
               param4.push(_loc5_.userData.entity);
            }
         }
         return param4;
      }
      
      public function firstGroupAtPoint(param1:uint, param2:Number, param3:Number) : *
      {
         // method body index: 942 method index: 942
         var _loc4_:Array = this.findGroupAtPoint(param1,param2,param3);
         var _loc5_:* = _loc4_.length > 0 ? _loc4_[0] : null;
         Cache.push(_loc4_);
         return _loc5_;
      }
      
      public function findTypeInRect(param1:Class, param2:Number, param3:Number, param4:Number, param5:Number, param6:Boolean = true, param7:* = null) : *
      {
         // method body index: 943 method index: 943
         var _loc8_:Body = null;
         if(param7 == null)
         {
            param7 = Cache.pop(Array);
         }
         if(param4 < 0)
         {
            param2 += param4;
            param4 = -param4;
         }
         if(param5 < 0)
         {
            param3 += param5;
            param5 = -param5;
         }
         _aabb.min.setxy(param2,param3);
         _aabb.max.setxy(param2 + param4,param3 + param5);
         this._space.bodiesInAABB(_aabb,false,!param6,null,_bodies);
         while(!_bodies.empty())
         {
            _loc8_ = _bodies.pop();
            if(_loc8_.userData.entity is param1)
            {
               param7.push(_loc8_.userData.entity);
            }
         }
         return param7;
      }
      
      public function firstTypeInRect(param1:Class, param2:Number, param3:Number, param4:Number, param5:Number, param6:Boolean = true) : *
      {
         // method body index: 944 method index: 944
         var _loc7_:Array = this.findTypeInRect(param1,param2,param3,param4,param5,param6);
         var _loc8_:* = _loc7_.length > 0 ? _loc7_[0] : null;
         Cache.push(_loc7_);
         return _loc8_;
      }
      
      public function findTagInRect(param1:String, param2:Number, param3:Number, param4:Number, param5:Number, param6:Boolean = true, param7:* = null) : *
      {
         // method body index: 945 method index: 945
         var _loc8_:Shape = null;
         if(param7 == null)
         {
            param7 = Cache.pop(Array);
         }
         if(param4 < 0)
         {
            param2 += param4;
            param4 = -param4;
         }
         if(param5 < 0)
         {
            param3 += param5;
            param5 = -param5;
         }
         _aabb.min.setxy(param2,param3);
         _aabb.max.setxy(param2 + param4,param3 + param5);
         this._space.bodiesInAABB(_aabb,false,!param6,null,_bodies);
         while(!_shapes.empty())
         {
            _loc8_ = _shapes.pop();
            if(_loc8_.userData.tag == param1 || _loc8_.body.userData.tag == param1)
            {
               param7.push(_loc8_.userData.entity);
            }
         }
         return param7;
      }
      
      public function firstTagInRect(param1:String, param2:Number, param3:Number, param4:Number, param5:Number, param6:Boolean = true) : *
      {
         // method body index: 946 method index: 946
         var _loc7_:Array = this.findTagInRect(param1,param2,param3,param4,param5,param6);
         var _loc8_:* = _loc7_.length > 0 ? _loc7_[0] : null;
         Cache.push(_loc7_);
         return _loc8_;
      }
      
      public function findGroupInRect(param1:uint, param2:Number, param3:Number, param4:Number, param5:Number, param6:Boolean = true, param7:* = null) : *
      {
         // method body index: 947 method index: 947
         var _loc8_:Shape = null;
         if(param7 == null)
         {
            param7 = Cache.pop(Array);
         }
         if(param4 < 0)
         {
            param2 += param4;
            param4 = -param4;
         }
         if(param5 < 0)
         {
            param3 += param5;
            param5 = -param5;
         }
         _aabb.min.setxy(param2,param3);
         _aabb.max.setxy(param2 + param4,param3 + param5);
         this._space.shapesInAABB(_aabb,false,!param6,this.getFilter(param1),_shapes);
         while(!_shapes.empty())
         {
            _loc8_ = _shapes.pop();
            if(_loc8_.userData.entity.inGroups(param1,true))
            {
               param7.push(_loc8_.userData.entity);
            }
         }
         return param7;
      }
      
      public function firstGroupInRect(param1:uint, param2:Number, param3:Number, param4:Number, param5:Number, param6:Boolean = true) : *
      {
         // method body index: 948 method index: 948
         var _loc7_:Array = this.findGroupInRect(param1,param2,param3,param4,param5,param6);
         var _loc8_:* = _loc7_.length > 0 ? _loc7_[0] : null;
         Cache.push(_loc7_);
         return _loc8_;
      }
      
      public function findTypeInCircle(param1:Class, param2:Number, param3:Number, param4:Number, param5:* = null) : *
      {
         // method body index: 949 method index: 949
         var _loc6_:Body = null;
         if(param5 == null)
         {
            param5 = Cache.pop(Array);
         }
         this._space.bodiesInCircle(Vec2.weak(param2,param3),param4,false,null,_bodies);
         while(!_bodies.empty())
         {
            _loc6_ = _bodies.pop();
            if(_loc6_.userData.entity is param1)
            {
               param5.push(_loc6_.userData.entity);
            }
         }
         return param5;
      }
      
      public function firstTypeInCircle(param1:Class, param2:Number, param3:Number, param4:Number) : *
      {
         // method body index: 950 method index: 950
         var _loc5_:Array = this.findTypeInCircle(param1,param2,param3,param4);
         var _loc6_:* = _loc5_.length > 0 ? _loc5_[0] : null;
         Cache.push(_loc5_);
         return _loc6_;
      }
      
      public function findTagInCircle(param1:String, param2:Number, param3:Number, param4:Number, param5:* = null) : *
      {
         // method body index: 951 method index: 951
         var _loc6_:Shape = null;
         if(param5 == null)
         {
            param5 = Cache.pop(Array);
         }
         this._space.shapesInCircle(Vec2.weak(param2,param3),param4,false,null,_shapes);
         while(!_shapes.empty())
         {
            _loc6_ = _shapes.pop();
            if(_loc6_.userData.tag == param1 || _loc6_.body.userData.tag == param1)
            {
               param5.push(_loc6_.userData.entity);
            }
         }
         return param5;
      }
      
      public function firstTagInCircle(param1:String, param2:Number, param3:Number, param4:Number) : *
      {
         // method body index: 952 method index: 952
         var _loc5_:Array = this.findTagInCircle(param1,param2,param3,param4);
         var _loc6_:* = _loc5_.length > 0 ? _loc5_[0] : null;
         Cache.push(_loc5_);
         return _loc6_;
      }
      
      public function findGroupInCircle(param1:uint, param2:Number, param3:Number, param4:Number, param5:* = null) : *
      {
         // method body index: 953 method index: 953
         var _loc6_:Body = null;
         if(param5 == null)
         {
            param5 = Cache.pop(Array);
         }
         this._space.bodiesInCircle(Vec2.weak(param2,param3),param4,false,this.getFilter(param1),_bodies);
         while(!_bodies.empty())
         {
            _loc6_ = _bodies.pop();
            if(_loc6_.userData.entity.inGroups(param1,true))
            {
               param5.push(_loc6_.userData.entity);
            }
         }
         return param5;
      }
      
      public function firstGroupInCircle(param1:uint, param2:Number, param3:Number, param4:Number) : *
      {
         // method body index: 954 method index: 954
         var _loc5_:Array = this.findGroupInCircle(param1,param2,param3,param4);
         var _loc6_:* = _loc5_.length > 0 ? _loc5_[0] : null;
         Cache.push(_loc5_);
         return _loc6_;
      }
      
      public function findTypeInBody(param1:Class, param2:RigidBody, param3:* = null) : *
      {
         // method body index: 955 method index: 955
         var _loc4_:Body = null;
         if(param3 == null)
         {
            param3 = Cache.pop(Array);
         }
         this._space.bodiesInBody(param2.body,null,_bodies);
         while(!_bodies.empty())
         {
            _loc4_ = _bodies.pop();
            if(_loc4_.userData.entity is param1)
            {
               param3.push(_loc4_.userData.entity);
            }
         }
         return param3;
      }
      
      public function firstTypeInBody(param1:Class, param2:RigidBody) : *
      {
         // method body index: 956 method index: 956
         var _loc3_:Array = this.findTypeInBody(param1,param2);
         var _loc4_:* = _loc3_.length > 0 ? _loc3_[0] : null;
         Cache.push(_loc3_);
         return _loc4_;
      }
      
      public function findTagInBody(param1:String, param2:RigidBody, param3:* = null) : *
      {
         // method body index: 957 method index: 957
         var _loc4_:Shape = null;
         if(param3 == null)
         {
            param3 = Cache.pop(Array);
         }
         this._space.shapesInBody(param2.body,null,_shapes);
         while(!_shapes.empty())
         {
            _loc4_ = _shapes.pop();
            if(_loc4_.userData.tag == param1 || _loc4_.body.userData.tag == param1)
            {
               param3.push(_loc4_.userData.entity);
            }
         }
         return param3;
      }
      
      public function firstTagInBody(param1:String, param2:RigidBody) : *
      {
         // method body index: 958 method index: 958
         var _loc3_:Array = this.findTagInBody(param1,param2);
         var _loc4_:* = _loc3_.length > 0 ? _loc3_[0] : null;
         Cache.push(_loc3_);
         return _loc4_;
      }
      
      public function findGroupInBody(param1:uint, param2:RigidBody, param3:* = null) : *
      {
         // method body index: 959 method index: 959
         var _loc4_:Body = null;
         if(param3 == null)
         {
            param3 = Cache.pop(Array);
         }
         this._space.bodiesInBody(param2.body,this.getFilter(param1),_bodies);
         while(!_bodies.empty())
         {
            _loc4_ = _bodies.pop();
            if(_loc4_.userData.entity.inGroups(param1,true))
            {
               param3.push(_loc4_.userData.entity);
            }
         }
         return param3;
      }
      
      public function firstGroupInBody(param1:uint, param2:RigidBody) : *
      {
         // method body index: 960 method index: 960
         var _loc3_:Array = this.findGroupInBody(param1,param2);
         var _loc4_:* = _loc3_.length > 0 ? _loc3_[0] : null;
         Cache.push(_loc3_);
         return _loc4_;
      }
      
      public function findTypeInEntity(param1:Class, param2:Entity, param3:* = null) : *
      {
         // method body index: 961 method index: 961
         if(param2.rigidBody == null)
         {
            throw new Error("Entity does not have a rigid body!");
         }
         return this.findTypeInBody(param1,param2.rigidBody,param3);
      }
      
      public function firstTypeInEntity(param1:Class, param2:Entity) : *
      {
         // method body index: 962 method index: 962
         var _loc3_:Array = this.findTypeInEntity(param1,param2);
         var _loc4_:* = _loc3_.length > 0 ? _loc3_[0] : null;
         Cache.push(_loc3_);
         return _loc4_;
      }
      
      public function findTagInEntity(param1:String, param2:Entity, param3:* = null) : *
      {
         // method body index: 963 method index: 963
         if(param2.rigidBody == null)
         {
            throw new Error("Entity does not have a rigid body!");
         }
         return this.findTagInBody(param1,param2.rigidBody,param3);
      }
      
      public function firstTagInEntity(param1:String, param2:Entity) : *
      {
         // method body index: 964 method index: 964
         var _loc3_:Array = this.findTagInEntity(param1,param2);
         var _loc4_:* = _loc3_.length > 0 ? _loc3_[0] : null;
         Cache.push(_loc3_);
         return _loc4_;
      }
      
      public function findGroupInEntity(param1:uint, param2:Entity, param3:* = null) : *
      {
         // method body index: 965 method index: 965
         if(param2.rigidBody == null)
         {
            throw new Error("Entity does not have a rigid body!");
         }
         return this.findGroupInBody(param1,param2.rigidBody,param3);
      }
      
      public function firstGroupInEntity(param1:uint, param2:Entity) : *
      {
         // method body index: 966 method index: 966
         var _loc3_:Array = this.findGroupInEntity(param1,param2);
         var _loc4_:* = _loc3_.length > 0 ? _loc3_[0] : null;
         Cache.push(_loc3_);
         return _loc4_;
      }
      
      public function findTypeInCollider(param1:Class, param2:Collider, param3:* = null) : *
      {
         // method body index: 967 method index: 967
         var _loc4_:Body = null;
         if(param3 == null)
         {
            param3 = Cache.pop(Array);
         }
         this._space.bodiesInShape(param2.shape,false,null,_bodies);
         while(!_bodies.empty())
         {
            _loc4_ = _bodies.pop();
            if(_loc4_.userData.entity is param1)
            {
               param3.push(_loc4_.userData.entity);
            }
         }
         return param3;
      }
      
      public function firstTypeInCollider(param1:Class, param2:Collider) : *
      {
         // method body index: 968 method index: 968
         var _loc3_:Array = this.findTypeInCollider(param1,param2);
         var _loc4_:* = _loc3_.length > 0 ? _loc3_[0] : null;
         Cache.push(_loc3_);
         return _loc4_;
      }
      
      public function findTagInCollider(param1:String, param2:Collider, param3:* = null) : *
      {
         // method body index: 969 method index: 969
         var _loc4_:Shape = null;
         if(param3 == null)
         {
            param3 = Cache.pop(Array);
         }
         this._space.shapesInShape(param2.shape,false,null,_shapes);
         while(!_shapes.empty())
         {
            _loc4_ = _shapes.pop();
            if(_loc4_.userData.tag == param1 || _loc4_.body.userData.tag == param1)
            {
               param3.push(_loc4_.userData.entity);
            }
         }
         return param3;
      }
      
      public function firstTagInCollider(param1:String, param2:Collider) : *
      {
         // method body index: 970 method index: 970
         var _loc3_:Array = this.findTagInCollider(param1,param2);
         var _loc4_:* = _loc3_.length > 0 ? _loc3_[0] : null;
         Cache.push(_loc3_);
         return _loc4_;
      }
      
      public function findGroupInCollider(param1:uint, param2:Collider, param3:* = null) : *
      {
         // method body index: 971 method index: 971
         var _loc4_:Body = null;
         if(param3 == null)
         {
            param3 = Cache.pop(Array);
         }
         this._space.bodiesInShape(param2.shape,false,this.getFilter(param1),_bodies);
         while(!_bodies.empty())
         {
            _loc4_ = _bodies.pop();
            if(_loc4_.userData.entity.inGroups(param1,true))
            {
               param3.push(_loc4_.userData.entity);
            }
         }
         return param3;
      }
      
      public function firstGroupInCollider(param1:uint, param2:Collider) : *
      {
         // method body index: 972 method index: 972
         var _loc3_:Array = this.findGroupInCollider(param1,param2);
         var _loc4_:* = _loc3_.length > 0 ? _loc3_[0] : null;
         Cache.push(_loc3_);
         return _loc4_;
      }
      
      public function setIterations(param1:uint, param2:uint) : void
      {
         // method body index: 973 method index: 973
         this.velocityIterations = param1;
         this.positionIterations = param2;
      }
      
      public function get space() : Space
      {
         // method body index: 974 method index: 974
         return this._space;
      }
      
      public function get gravityX() : Number
      {
         // method body index: 975 method index: 975
         return this._space.gravity.x;
      }
      
      public function set gravityX(param1:Number) : void
      {
         // method body index: 976 method index: 976
         this._space.gravity.x = param1;
      }
      
      public function get gravityY() : Number
      {
         // method body index: 977 method index: 977
         return this._space.gravity.y;
      }
      
      public function set gravityY(param1:Number) : void
      {
         // method body index: 978 method index: 978
         this._space.gravity.y = param1;
      }
      
      public function get velocityIterations() : uint
      {
         // method body index: 979 method index: 979
         return this._velocityIterations;
      }
      
      public function set velocityIterations(param1:uint) : void
      {
         // method body index: 980 method index: 980
         if(param1 == 0)
         {
            throw new Error("Velocity iterations cannot be zero.");
         }
         this._velocityIterations = param1;
      }
      
      public function get positionIterations() : uint
      {
         // method body index: 981 method index: 981
         return this._positionIterations;
      }
      
      public function set positionIterations(param1:uint) : void
      {
         // method body index: 982 method index: 982
         if(param1 == 0)
         {
            throw new Error("Position iterations cannot be zero.");
         }
         this._positionIterations = param1;
      }
   }
}

