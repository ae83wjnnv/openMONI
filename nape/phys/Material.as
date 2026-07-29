package nape.phys
{
   import flash.Boot;
   import nape.shape.ShapeList;
   import zpp_nape.phys.ZPP_Material;
   import zpp_nape.util.ZPP_ShapeList;
   
   public final class Material
   {
      
      public var zpp_inner:ZPP_Material;
      
      public function Material(param1:Number = 0, param2:Number = 1, param3:Number = 2, param4:Number = 1, param5:Number = 0.001)
      {
         // method body index: 4152 method index: 4461
         if(Boot.skip_constructor)
         {
            return;
         }
         zpp_inner = null;
         if(ZPP_Material.zpp_pool == null)
         {
            zpp_inner = new ZPP_Material();
         }
         else
         {
            zpp_inner = ZPP_Material.zpp_pool;
            ZPP_Material.zpp_pool = zpp_inner.next;
            zpp_inner.next = null;
         }
         null;
         zpp_inner.outer = this;
         if(param1 != zpp_inner.elasticity)
         {
            if(param1 != param1)
            {
               Boot.lastError = new Error();
               throw "Error: Material::" + "elasticity" + " cannot be NaN";
            }
            zpp_inner.elasticity = param1 / 1;
            zpp_inner.invalidate(ZPP_Material.WAKE | ZPP_Material.ARBITERS);
         }
         zpp_inner.elasticity;
         if(param2 != zpp_inner.dynamicFriction)
         {
            if(param2 != param2)
            {
               Boot.lastError = new Error();
               throw "Error: Material::" + "dynamicFriction" + " cannot be NaN";
            }
            if(param2 < 0)
            {
               Boot.lastError = new Error();
               throw "Error: Material::" + "dynamicFriction" + " cannot be negative";
            }
            zpp_inner.dynamicFriction = param2 / 1;
            zpp_inner.invalidate(ZPP_Material.WAKE | ZPP_Material.ANGDRAG | ZPP_Material.ARBITERS);
         }
         zpp_inner.dynamicFriction;
         if(param3 != zpp_inner.staticFriction)
         {
            if(param3 != param3)
            {
               Boot.lastError = new Error();
               throw "Error: Material::" + "staticFriction" + " cannot be NaN";
            }
            if(param3 < 0)
            {
               Boot.lastError = new Error();
               throw "Error: Material::" + "staticFriction" + " cannot be negative";
            }
            zpp_inner.staticFriction = param3 / 1;
            zpp_inner.invalidate(ZPP_Material.WAKE | ZPP_Material.ARBITERS);
         }
         zpp_inner.staticFriction;
         if(param4 != zpp_inner.density * 1000)
         {
            if(param4 != param4)
            {
               Boot.lastError = new Error();
               throw "Error: Material::" + "density" + " cannot be NaN";
            }
            if(param4 < 0)
            {
               Boot.lastError = new Error();
               throw "Error: Material::density must be positive";
            }
            if(param4 < 0)
            {
               Boot.lastError = new Error();
               throw "Error: Material::" + "density" + " cannot be negative";
            }
            zpp_inner.density = param4 / 1000;
            zpp_inner.invalidate(ZPP_Material.WAKE | ZPP_Material.PROPS);
         }
         zpp_inner.density * 1000;
         if(param5 != zpp_inner.rollingFriction)
         {
            if(param5 != param5)
            {
               Boot.lastError = new Error();
               throw "Error: Material::" + "rollingFriction" + " cannot be NaN";
            }
            if(param5 < 0)
            {
               Boot.lastError = new Error();
               throw "Error: Material::" + "rollingFriction" + " cannot be negative";
            }
            zpp_inner.rollingFriction = param5 / 1;
            zpp_inner.invalidate(ZPP_Material.WAKE | ZPP_Material.ARBITERS);
         }
         zpp_inner.rollingFriction;
      }
      
      public static function wood() : Material
      {
         // method body index: 4131 method index: 4477
         return new Material(0.4,0.2,0.38,0.7,0.005);
      }
      
      public static function steel() : Material
      {
         // method body index: 4132 method index: 4478
         return new Material(0.2,0.57,0.74,7.8,0.001);
      }
      
      public static function ice() : Material
      {
         // method body index: 4133 method index: 4479
         return new Material(0.3,0.03,0.1,0.9,0.0001);
      }
      
      public static function rubber() : Material
      {
         // method body index: 4134 method index: 4480
         return new Material(0.8,1,1.4,1.5,0.01);
      }
      
      public static function glass() : Material
      {
         // method body index: 4135 method index: 4481
         return new Material(0.4,0.4,0.94,2.6,0.002);
      }
      
      public static function sand() : Material
      {
         // method body index: 4136 method index: 4482
         return new Material(-1,0.45,0.6,1.6,16);
      }
      
      public function toString() : String
      {
         // method body index: 4138 method index: 4463
         return "{ elasticity: " + zpp_inner.elasticity + " dynamicFriction: " + zpp_inner.dynamicFriction + " staticFriction: " + zpp_inner.staticFriction + " density: " + zpp_inner.density * 1000 + " rollingFriction: " + zpp_inner.rollingFriction + " }";
      }
      
      public function set staticFriction(param1:Number) : Number
      {
         // method body index: 4139 method index: 4464
         if(param1 != zpp_inner.staticFriction)
         {
            if(param1 != param1)
            {
               Boot.lastError = new Error();
               throw "Error: Material::" + "staticFriction" + " cannot be NaN";
            }
            if(param1 < 0)
            {
               Boot.lastError = new Error();
               throw "Error: Material::" + "staticFriction" + " cannot be negative";
            }
            zpp_inner.staticFriction = param1 / 1;
            zpp_inner.invalidate(ZPP_Material.WAKE | ZPP_Material.ARBITERS);
         }
         return zpp_inner.staticFriction;
      }
      
      public function set rollingFriction(param1:Number) : Number
      {
         // method body index: 4140 method index: 4465
         if(param1 != zpp_inner.rollingFriction)
         {
            if(param1 != param1)
            {
               Boot.lastError = new Error();
               throw "Error: Material::" + "rollingFriction" + " cannot be NaN";
            }
            if(param1 < 0)
            {
               Boot.lastError = new Error();
               throw "Error: Material::" + "rollingFriction" + " cannot be negative";
            }
            zpp_inner.rollingFriction = param1 / 1;
            zpp_inner.invalidate(ZPP_Material.WAKE | ZPP_Material.ARBITERS);
         }
         return zpp_inner.rollingFriction;
      }
      
      public function set elasticity(param1:Number) : Number
      {
         // method body index: 4141 method index: 4466
         if(param1 != zpp_inner.elasticity)
         {
            if(param1 != param1)
            {
               Boot.lastError = new Error();
               throw "Error: Material::" + "elasticity" + " cannot be NaN";
            }
            zpp_inner.elasticity = param1 / 1;
            zpp_inner.invalidate(ZPP_Material.WAKE | ZPP_Material.ARBITERS);
         }
         return zpp_inner.elasticity;
      }
      
      public function set dynamicFriction(param1:Number) : Number
      {
         // method body index: 4142 method index: 4467
         if(param1 != zpp_inner.dynamicFriction)
         {
            if(param1 != param1)
            {
               Boot.lastError = new Error();
               throw "Error: Material::" + "dynamicFriction" + " cannot be NaN";
            }
            if(param1 < 0)
            {
               Boot.lastError = new Error();
               throw "Error: Material::" + "dynamicFriction" + " cannot be negative";
            }
            zpp_inner.dynamicFriction = param1 / 1;
            zpp_inner.invalidate(ZPP_Material.WAKE | ZPP_Material.ANGDRAG | ZPP_Material.ARBITERS);
         }
         return zpp_inner.dynamicFriction;
      }
      
      public function set density(param1:Number) : Number
      {
         // method body index: 4143 method index: 4468
         if(param1 != zpp_inner.density * 1000)
         {
            if(param1 != param1)
            {
               Boot.lastError = new Error();
               throw "Error: Material::" + "density" + " cannot be NaN";
            }
            if(param1 < 0)
            {
               Boot.lastError = new Error();
               throw "Error: Material::density must be positive";
            }
            if(param1 < 0)
            {
               Boot.lastError = new Error();
               throw "Error: Material::" + "density" + " cannot be negative";
            }
            zpp_inner.density = param1 / 1000;
            zpp_inner.invalidate(ZPP_Material.WAKE | ZPP_Material.PROPS);
         }
         return zpp_inner.density * 1000;
      }
      
      public function get userData() : *
      {
         // method body index: 4144 method index: 4469
         if(zpp_inner.userData == null)
         {
            zpp_inner.userData = {};
         }
         return zpp_inner.userData;
      }
      
      public function get staticFriction() : Number
      {
         // method body index: 4145 method index: 4470
         return zpp_inner.staticFriction;
      }
      
      public function get shapes() : ShapeList
      {
         // method body index: 4146 method index: 4471
         if(zpp_inner.wrap_shapes == null)
         {
            zpp_inner.wrap_shapes = ZPP_ShapeList.get(zpp_inner.shapes,true);
         }
         return zpp_inner.wrap_shapes;
      }
      
      public function get rollingFriction() : Number
      {
         // method body index: 4147 method index: 4472
         return zpp_inner.rollingFriction;
      }
      
      public function get elasticity() : Number
      {
         // method body index: 4148 method index: 4473
         return zpp_inner.elasticity;
      }
      
      public function get dynamicFriction() : Number
      {
         // method body index: 4149 method index: 4474
         return zpp_inner.dynamicFriction;
      }
      
      public function get density() : Number
      {
         // method body index: 4150 method index: 4475
         return zpp_inner.density * 1000;
      }
      
      public function copy() : Material
      {
         // method body index: 4151 method index: 4476
         var _loc1_:Material = new Material(zpp_inner.elasticity,zpp_inner.dynamicFriction,zpp_inner.staticFriction,zpp_inner.density * 1000,zpp_inner.rollingFriction);
         if(zpp_inner.userData != null)
         {
            _loc1_.zpp_inner.userData = Reflect.copy(zpp_inner.userData);
         }
         return _loc1_;
      }
   }
}

