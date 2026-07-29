package flashpunk2
{
   import flashpunk2.components.physics.RigidBody;
   import flashpunk2.namespaces.fp_internal;
   
   use namespace fp_internal;
   
   public class Component
   {
      
      public const ON_START:Signal = // method body index: 862 method index: 862
      new Signal();
      
      public const ON_END:Signal = // method body index: 862 method index: 862
      new Signal();
      
      public const ON_DEBUG:Signal = // method body index: 862 method index: 862
      new Signal();
      
      private var _entity:Entity;
      
      public function Component()
      {
         // method body index: 862 method index: 862
         super();
      }
      
      fp_internal function start(param1:Entity) : void
      {
         // method body index: 863 method index: 863
         this._entity = param1;
         this.ON_START.dispatch();
      }
      
      fp_internal function end() : void
      {
         // method body index: 864 method index: 864
         this.ON_END.dispatch();
         this._entity = null;
      }
      
      public function getFunction(param1:String) : Function
      {
         // method body index: 865 method index: 865
         if(hasOwnProperty(param1))
         {
            return this[param1];
         }
         return null;
      }
      
      public function removeSelf() : void
      {
         // method body index: 866 method index: 866
         if(this._entity != null)
         {
            this._entity.remove(this);
         }
      }
      
      public function get exists() : Boolean
      {
         // method body index: 867 method index: 867
         return this._entity != null && this._entity.exists;
      }
      
      public function get entity() : Entity
      {
         // method body index: 868 method index: 868
         return this._entity;
      }
      
      public function get world() : World
      {
         // method body index: 869 method index: 869
         return this._entity != null ? this._entity.world : null;
      }
      
      public function get physics() : Physics
      {
         // method body index: 870 method index: 870
         return this._entity != null ? this._entity.physics : null;
      }
      
      public function get camera() : Camera
      {
         // method body index: 871 method index: 871
         return this._entity != null ? this._entity.camera : null;
      }
      
      public function get engine() : Engine
      {
         // method body index: 872 method index: 872
         return Engine.instance;
      }
      
      public function get rigidBody() : RigidBody
      {
         // method body index: 873 method index: 873
         return this._entity != null ? this._entity.rigidBody : null;
      }
   }
}

