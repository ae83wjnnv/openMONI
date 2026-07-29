package flashpunk2.components.physics
{
   import flashpunk2.Component;
   import flashpunk2.Entity;
   import flashpunk2.global.Cache;
   import flashpunk2.global.Calc;
   import flashpunk2.namespaces.fp_internal;
   import nape.dynamics.Arbiter;
   import nape.dynamics.ArbiterList;
   import nape.dynamics.CollisionArbiter;
   import nape.geom.Vec2;
   import nape.phys.Body;
   import nape.phys.BodyType;
   import nape.shape.Shape;
   
   use namespace fp_internal;
   
   public class RigidBody extends Component
   {
      
      public var autoSync:Boolean = true;
      
      private var _body:Body;
      
      private var _scaledX:Number;
      
      private var _scaledY:Number;
      
      public function RigidBody(param1:BodyType, param2:Boolean = true, param3:Boolean = true, param4:Boolean = true)
      {
         // method body index: 1879 method index: 1882
         super();
         this.autoSync = param2;
         this._body = new Body(param1);
         this._body.userData.rigidBody = this;
         this._body.userData.tag = null;
         this._body.allowRotation = param3;
         this._body.allowMovement = param4;
      }
      
      override fp_internal function start(param1:Entity) : void
      {
         // method body index: 1880 method index: 1883
         super.fp_internal::start(param1);
         this._body.userData.entity = param1;
      }
      
      override fp_internal function end() : void
      {
         // method body index: 1881 method index: 1884
         this._body.userData.entity = null;
         super.fp_internal::end();
      }
      
      fp_internal function addToSpace() : void
      {
         // method body index: 1882 method index: 1885
         this._body.position.setxy(entity.x,entity.y);
         this._body.rotation = entity.angle * Calc.RAD;
         this._scaledX = entity.scaleX;
         this._scaledY = entity.scaleY;
         if(this._scaledX != 1 || this._scaledY != 1)
         {
            this._body.scaleShapes(this._scaledX,this._scaledY);
         }
         this._body.space = physics.space;
      }
      
      fp_internal function removeFromSpace() : void
      {
         // method body index: 1883 method index: 1886
         this._body.space = null;
         if(this._scaledX != 1 || this._scaledY != 1)
         {
            this._body.scaleShapes(1 / this._scaledX,1 / this._scaledY);
         }
      }
      
      public function setVelocity(param1:Number, param2:Number) : void
      {
         // method body index: 1884 method index: 1887
         this._body.velocity.setxy(param1,param2);
      }
      
      public function setVelocityAngle(param1:Number, param2:Number) : void
      {
         // method body index: 1885 method index: 1888
         this._body.velocity = Vec2.fromPolar(param2,param1 * Calc.RAD,true);
      }
      
      public function setVeloctiyTowards(param1:Number, param2:Number, param3:Number) : void
      {
         // method body index: 1886 method index: 1889
         this._body.velocity = Vec2.fromPolar(param3,Calc.angleTo(this._body.position.x,this._body.position.y,param1,param2) * Calc.RAD,true);
      }
      
      public function setAllow(param1:Boolean, param2:Boolean) : void
      {
         // method body index: 1887 method index: 1890
         this._body.allowMovement = param1;
         this._body.allowRotation = param2;
      }
      
      public function addImpulse(param1:Number, param2:Number) : void
      {
         // method body index: 1888 method index: 1891
         this._body.applyImpulse(Vec2.weak(param1,param2));
      }
      
      public function addAngularImpulse(param1:Number) : void
      {
         // method body index: 1889 method index: 1892
         this._body.applyAngularImpulse(param1);
      }
      
      public function colliding() : *
      {
         // method body index: 1890 method index: 1893
         var _loc1_:Arbiter = null;
         if(this._body.arbiters.length > 0)
         {
            _loc1_ = this._body.arbiters.at(0);
            return this._body == _loc1_.body1 ? _loc1_.body2.userData.entity : _loc1_.body1.userData.entity;
         }
         return null;
      }
      
      public function collidingWithEntity(param1:Entity) : Boolean
      {
         // method body index: 1891 method index: 1894
         var _loc3_:Arbiter = null;
         var _loc4_:Shape = null;
         var _loc2_:ArbiterList = this._body.arbiters;
         var _loc5_:int = 0;
         while(_loc5_ < _loc2_.length)
         {
            _loc3_ = _loc2_.at(_loc5_);
            _loc4_ = this._body == _loc3_.body1 ? _loc3_.shape2 : _loc3_.shape1;
            if(_loc4_.userData.entity == param1)
            {
               return true;
            }
            _loc5_++;
         }
         return false;
      }
      
      public function collidingWithType(param1:Class) : *
      {
         // method body index: 1892 method index: 1895
         var _loc3_:Arbiter = null;
         var _loc4_:Shape = null;
         var _loc2_:ArbiterList = this._body.arbiters;
         var _loc5_:int = 0;
         while(_loc5_ < _loc2_.length)
         {
            _loc3_ = _loc2_.at(_loc5_);
            _loc4_ = this._body == _loc3_.body1 ? _loc3_.shape2 : _loc3_.shape1;
            if(_loc4_.userData.entity is param1)
            {
               return _loc4_.userData.entity;
            }
            _loc5_++;
         }
         return null;
      }
      
      public function collidingWithTag(param1:String) : *
      {
         // method body index: 1893 method index: 1896
         var _loc3_:Arbiter = null;
         var _loc4_:Shape = null;
         var _loc2_:ArbiterList = this._body.arbiters;
         var _loc5_:int = 0;
         while(_loc5_ < _loc2_.length)
         {
            _loc3_ = _loc2_.at(_loc5_);
            _loc4_ = this._body == _loc3_.body1 ? _loc3_.shape2 : _loc3_.shape1;
            if(_loc4_.userData.tag == param1 || _loc4_.body.userData.tag == param1)
            {
               return _loc4_.userData.entity;
            }
            _loc5_++;
         }
         return null;
      }
      
      public function collidingWithGroups(param1:uint, param2:Boolean = true) : *
      {
         // method body index: 1894 method index: 1897
         var _loc4_:Arbiter = null;
         var _loc5_:Shape = null;
         var _loc3_:ArbiterList = this._body.arbiters;
         var _loc6_:int = 0;
         while(_loc6_ < _loc3_.length)
         {
            _loc4_ = _loc3_.at(_loc6_);
            _loc5_ = this._body == _loc4_.body1 ? _loc4_.shape2 : _loc4_.shape1;
            if(_loc5_.userData.entity.inGroups(param1,param2))
            {
               return _loc5_.userData.entity;
            }
            _loc6_++;
         }
         return null;
      }
      
      public function getCollisions(param1:* = null) : *
      {
         // method body index: 1895 method index: 1898
         var _loc3_:Arbiter = null;
         if(param1 == null)
         {
            param1 = Cache.pop(Array);
         }
         var _loc2_:ArbiterList = this._body.arbiters;
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_.length)
         {
            _loc3_ = _loc2_.at(_loc4_);
            param1.push(this._body == _loc3_.body1 ? _loc3_.body2.userData.entity : _loc3_.body1.userData.entity);
            _loc4_++;
         }
         return param1;
      }
      
      public function getCollisionsByType(param1:Class, param2:* = null) : *
      {
         // method body index: 1896 method index: 1899
         var _loc4_:Arbiter = null;
         var _loc5_:Shape = null;
         if(param2 == null)
         {
            param2 = Cache.pop(Array);
         }
         var _loc3_:ArbiterList = this._body.arbiters;
         var _loc6_:int = 0;
         while(_loc6_ < _loc3_.length)
         {
            _loc4_ = _loc3_.at(_loc6_);
            _loc5_ = this._body == _loc4_.body1 ? _loc4_.shape2 : _loc4_.shape1;
            if(_loc5_.userData.entity is param1)
            {
               param2.push(_loc5_.userData.entity);
            }
            _loc6_++;
         }
         return param2;
      }
      
      public function getCollisionsByTag(param1:String, param2:* = null) : *
      {
         // method body index: 1897 method index: 1900
         var _loc4_:Arbiter = null;
         var _loc5_:Shape = null;
         if(param2 == null)
         {
            param2 = Cache.pop(Array);
         }
         var _loc3_:ArbiterList = this._body.arbiters;
         var _loc6_:int = 0;
         while(_loc6_ < _loc3_.length)
         {
            _loc4_ = _loc3_.at(_loc6_);
            _loc5_ = this._body == _loc4_.body1 ? _loc4_.shape2 : _loc4_.shape1;
            if(_loc5_.userData.tag == param1 || _loc5_.body.userData.tag == param1)
            {
               param2.push(_loc5_.userData.entity);
            }
            _loc6_++;
         }
         return param2;
      }
      
      public function getCollisionsByGroups(param1:uint, param2:Boolean = true, param3:* = null) : *
      {
         // method body index: 1898 method index: 1901
         var _loc5_:Arbiter = null;
         var _loc6_:Shape = null;
         if(param3 == null)
         {
            param3 = Cache.pop(Array);
         }
         var _loc4_:ArbiterList = this._body.arbiters;
         var _loc7_:int = 0;
         while(_loc7_ < _loc4_.length)
         {
            _loc5_ = _loc4_.at(_loc7_);
            _loc6_ = this._body == _loc5_.body1 ? _loc5_.shape2 : _loc5_.shape1;
            if(_loc6_.userData.entity.inGroups(param1,param2))
            {
               param3.push(_loc6_.userData.entity);
            }
            _loc7_++;
         }
         return param3;
      }
      
      public function getNormal(param1:Vec2 = null) : Vec2
      {
         // method body index: 1899 method index: 1902
         var _loc3_:CollisionArbiter = null;
         if(param1 == null)
         {
            param1 = Vec2.get(0,0);
         }
         var _loc2_:ArbiterList = this._body.arbiters;
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_.length)
         {
            _loc3_ = _loc2_.at(_loc4_) as CollisionArbiter;
            if(_loc3_ != null)
            {
               if(this._body == _loc3_.body1)
               {
                  param1.x -= _loc3_.normal.x;
                  param1.y -= _loc3_.normal.y;
               }
               else
               {
                  param1.x += _loc3_.normal.x;
                  param1.y += _loc3_.normal.y;
               }
            }
            _loc4_++;
         }
         param1.normalise();
         return param1;
      }
      
      public function getNormalByType(param1:Class, param2:Vec2 = null) : Vec2
      {
         // method body index: 1900 method index: 1903
         var _loc4_:CollisionArbiter = null;
         var _loc5_:Shape = null;
         if(param2 == null)
         {
            param2 = Vec2.get(0,0);
         }
         var _loc3_:ArbiterList = this._body.arbiters;
         var _loc6_:int = 0;
         while(_loc6_ < _loc3_.length)
         {
            _loc4_ = _loc3_.at(_loc6_) as CollisionArbiter;
            if(_loc4_ != null)
            {
               if(this._body == _loc4_.body1)
               {
                  if(_loc4_.body2.userData.entity is param1)
                  {
                     param2.x -= _loc4_.normal.x;
                     param2.y -= _loc4_.normal.y;
                  }
               }
               else if(_loc4_.body1.userData.entity is param1)
               {
                  param2.x += _loc4_.normal.x;
                  param2.y += _loc4_.normal.y;
               }
            }
            _loc6_++;
         }
         param2.normalise();
         return param2;
      }
      
      public function getNormalByTag(param1:String, param2:Vec2 = null) : Vec2
      {
         // method body index: 1901 method index: 1904
         var _loc4_:CollisionArbiter = null;
         var _loc5_:Shape = null;
         if(param2 == null)
         {
            param2 = Vec2.get(0,0);
         }
         var _loc3_:ArbiterList = this._body.arbiters;
         var _loc6_:int = 0;
         while(_loc6_ < _loc3_.length)
         {
            _loc4_ = _loc3_.at(_loc6_) as CollisionArbiter;
            if(_loc4_ != null)
            {
               if(this._body == _loc4_.body1)
               {
                  if(_loc4_.shape2.userData.tag == param1 || _loc4_.body2.userData.tag == param1)
                  {
                     param2.x -= _loc4_.normal.x;
                     param2.y -= _loc4_.normal.y;
                  }
               }
               else if(_loc4_.shape1.userData.tag == param1 || _loc4_.body1.userData.tag == param1)
               {
                  param2.x += _loc4_.normal.x;
                  param2.y += _loc4_.normal.y;
               }
            }
            _loc6_++;
         }
         param2.normalise();
         return param2;
      }
      
      public function getNormalByGroups(param1:uint, param2:Boolean = true, param3:Vec2 = null) : Vec2
      {
         // method body index: 1902 method index: 1905
         var _loc5_:CollisionArbiter = null;
         var _loc6_:Shape = null;
         if(param3 == null)
         {
            param3 = Vec2.get(0,0);
         }
         var _loc4_:ArbiterList = this._body.arbiters;
         var _loc7_:int = 0;
         while(_loc7_ < _loc4_.length)
         {
            _loc5_ = _loc4_.at(_loc7_) as CollisionArbiter;
            if(_loc5_ != null)
            {
               if(this._body == _loc5_.body1)
               {
                  if(_loc5_.body2.userData.entity.inGroups(param1,param2))
                  {
                     param3.x -= _loc5_.normal.x;
                     param3.y -= _loc5_.normal.y;
                  }
               }
               else if(_loc5_.body1.userData.entity.inGroups(param1,param2))
               {
                  param3.x += _loc5_.normal.x;
                  param3.y += _loc5_.normal.y;
               }
            }
            _loc7_++;
         }
         param3.normalise();
         return param3;
      }
      
      public function collidingWithTypeAtAngle(param1:Class, param2:Number, param3:Number) : *
      {
         // method body index: 1903 method index: 1906
         var _loc5_:CollisionArbiter = null;
         var _loc4_:ArbiterList = this._body.arbiters;
         var _loc6_:int = 0;
         while(_loc6_ < _loc4_.length)
         {
            _loc5_ = _loc4_.at(_loc6_) as CollisionArbiter;
            if(_loc5_ != null)
            {
               if(this._body == _loc5_.body1)
               {
                  if(_loc5_.body2.userData.entity is param1 && Calc.angleDifference(param2,Calc.deg(_loc5_.normal.angle)) <= param3)
                  {
                     return _loc5_.body2.userData.entity;
                  }
               }
               else if(_loc5_.body1.userData.entity is param1 && Calc.angleDifference(param2,Calc.deg(_loc5_.normal.angle) + 180) <= param3)
               {
                  return _loc5_.body1.userData.entity;
               }
            }
            _loc6_++;
         }
         return null;
      }
      
      public function collidingWithTagAtAngle(param1:String, param2:Number, param3:Number) : *
      {
         // method body index: 1904 method index: 1907
         var _loc5_:CollisionArbiter = null;
         var _loc4_:ArbiterList = this._body.arbiters;
         var _loc6_:int = 0;
         while(_loc6_ < _loc4_.length)
         {
            _loc5_ = _loc4_.at(_loc6_) as CollisionArbiter;
            if(_loc5_ != null)
            {
               if(this._body == _loc5_.body1)
               {
                  if((_loc5_.shape2.userData.tag == param1 || _loc5_.body2.userData.tag == param1) && Calc.angleDifference(param2,Calc.deg(_loc5_.normal.angle)) <= param3)
                  {
                     return _loc5_.body2.userData.entity;
                  }
               }
               else if((_loc5_.shape1.userData.tag == param1 || _loc5_.body1.userData.tag == param1) && Calc.angleDifference(param2,Calc.deg(_loc5_.normal.angle) + 180) <= param3)
               {
                  return _loc5_.body1.userData.entity;
               }
            }
            _loc6_++;
         }
         return null;
      }
      
      public function collidingWithGroupsAtAngle(param1:uint, param2:Boolean, param3:Number, param4:Number) : *
      {
         // method body index: 1905 method index: 1908
         var _loc6_:CollisionArbiter = null;
         var _loc5_:ArbiterList = this._body.arbiters;
         var _loc7_:int = 0;
         while(_loc7_ < _loc5_.length)
         {
            _loc6_ = _loc5_.at(_loc7_) as CollisionArbiter;
            if(_loc6_ != null)
            {
               if(this._body == _loc6_.body1)
               {
                  if(Boolean(_loc6_.body2.userData.entity.inGroups(param1,param2)) && Calc.angleDifference(param3,Calc.deg(_loc6_.normal.angle)) <= param4)
                  {
                     return _loc6_.body2.userData.entity;
                  }
               }
               else if(Boolean(_loc6_.body1.userData.entity.inGroups(param1,param2)) && Calc.angleDifference(param3,Calc.deg(_loc6_.normal.angle) + 180) <= param4)
               {
                  return _loc6_.body1.userData.entity;
               }
            }
            _loc7_++;
         }
         return false;
      }
      
      public function groundedOnType(param1:Class, param2:Number = -90, param3:Number = 89) : *
      {
         // method body index: 1906 method index: 1909
         return this.collidingWithTypeAtAngle(param1,param2,param3);
      }
      
      public function groundedOnTag(param1:String, param2:Number = -90, param3:Number = 89) : *
      {
         // method body index: 1907 method index: 1910
         return this.collidingWithTagAtAngle(param1,param2,param3);
      }
      
      public function groundedOnGroups(param1:uint, param2:Boolean = true, param3:Number = -90, param4:Number = 89) : *
      {
         // method body index: 1908 method index: 1911
         return this.collidingWithGroupsAtAngle(param1,param2,param3,param4);
      }
      
      public function invokeOnColliding(param1:String, param2:* = null, param3:Number = 0, param4:int = 0) : void
      {
         // method body index: 1909 method index: 1912
         var _loc5_:Array = this.getCollisions();
         while(_loc5_.length > 0)
         {
            _loc5_.pop().invoke(param1,param2,param3,param4);
         }
         Cache.push(_loc5_);
      }
      
      public function invokeOnCollidingType(param1:Class, param2:String, param3:* = null, param4:Number = 0, param5:int = 0) : void
      {
         // method body index: 1910 method index: 1913
         var _loc6_:Array = this.getCollisionsByType(param1);
         while(_loc6_.length > 0)
         {
            _loc6_.pop().invoke(param2,param3,param4,param5);
         }
         Cache.push(_loc6_);
      }
      
      public function invokeOnCollidingTag(param1:String, param2:String, param3:* = null, param4:Number = 0, param5:int = 0) : void
      {
         // method body index: 1911 method index: 1914
         var _loc6_:Array = this.getCollisionsByTag(param1);
         while(_loc6_.length > 0)
         {
            _loc6_.pop().invoke(param2,param3,param4,param5);
         }
         Cache.push(_loc6_);
      }
      
      public function invokeOnCollidingGroups(param1:uint, param2:Boolean, param3:String, param4:* = null, param5:Number = 0, param6:int = 0) : void
      {
         // method body index: 1912 method index: 1915
         var _loc7_:Array = this.getCollisionsByGroups(param1,param2);
         while(_loc7_.length > 0)
         {
            _loc7_.pop().invoke(param3,param4,param5,param6);
         }
         Cache.push(_loc7_);
      }
      
      public function get body() : Body
      {
         // method body index: 1913 method index: 1916
         return this._body;
      }
      
      public function get type() : BodyType
      {
         // method body index: 1914 method index: 1917
         return this._body.type;
      }
      
      public function set type(param1:BodyType) : void
      {
         // method body index: 1915 method index: 1918
         this._body.type = param1;
      }
      
      public function get x() : Number
      {
         // method body index: 1916 method index: 1919
         return this._body.position.x;
      }
      
      public function set x(param1:Number) : void
      {
         // method body index: 1917 method index: 1920
         this._body.position.x = param1;
      }
      
      public function get y() : Number
      {
         // method body index: 1918 method index: 1921
         return this._body.position.y;
      }
      
      public function set y(param1:Number) : void
      {
         // method body index: 1919 method index: 1922
         this._body.position.y = param1;
      }
      
      public function get angle() : Number
      {
         // method body index: 1920 method index: 1923
         return this._body.rotation * Calc.DEG;
      }
      
      public function set angle(param1:Number) : void
      {
         // method body index: 1921 method index: 1924
         this._body.rotation = param1 * Calc.RAD;
      }
      
      public function get velocity() : Number
      {
         // method body index: 1922 method index: 1925
         return this._body.velocity.length;
      }
      
      public function set velocity(param1:Number) : void
      {
         // method body index: 1923 method index: 1926
         this._body.velocity.normalise();
         this._body.velocity.x *= param1;
         this._body.velocity.y *= param1;
      }
      
      public function get velocityX() : Number
      {
         // method body index: 1924 method index: 1927
         return this._body.velocity.x;
      }
      
      public function set velocityX(param1:Number) : void
      {
         // method body index: 1925 method index: 1928
         this._body.velocity.x = param1;
      }
      
      public function get velocityY() : Number
      {
         // method body index: 1926 method index: 1929
         return this._body.velocity.y;
      }
      
      public function set velocityY(param1:Number) : void
      {
         // method body index: 1927 method index: 1930
         this._body.velocity.y = param1;
      }
      
      public function get angularVelocity() : Number
      {
         // method body index: 1928 method index: 1931
         return this._body.angularVel * Calc.DEG;
      }
      
      public function set angularVelocity(param1:Number) : void
      {
         // method body index: 1929 method index: 1932
         this._body.angularVel = param1 * Calc.RAD;
      }
      
      public function get allowMovement() : Boolean
      {
         // method body index: 1930 method index: 1933
         return this._body.allowMovement;
      }
      
      public function set allowMovement(param1:Boolean) : void
      {
         // method body index: 1931 method index: 1934
         this._body.allowMovement = param1;
      }
      
      public function get allowRotation() : Boolean
      {
         // method body index: 1932 method index: 1935
         return this._body.allowRotation;
      }
      
      public function set allowRotation(param1:Boolean) : void
      {
         // method body index: 1933 method index: 1936
         this._body.allowRotation = param1;
      }
      
      public function get tag() : String
      {
         // method body index: 1934 method index: 1937
         return this._body.userData.tag;
      }
      
      public function set tag(param1:String) : void
      {
         // method body index: 1935 method index: 1938
         this._body.userData.tag = param1;
      }
      
      public function get resting() : Boolean
      {
         // method body index: 1936 method index: 1939
         return this._body.isSleeping;
      }
   }
}

