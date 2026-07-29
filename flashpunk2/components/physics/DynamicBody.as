package flashpunk2.components.physics
{
   import flashpunk2.Entity;
   import flashpunk2.global.Calc;
   import flashpunk2.namespaces.fp_internal;
   import nape.phys.BodyType;
   
   use namespace fp_internal;
   
   public class DynamicBody extends RigidBody
   {
      
      public function DynamicBody(param1:Boolean = true, param2:Boolean = true, param3:Boolean = true)
      {
         // method body index: 6532 method index: 7077
         super(BodyType.DYNAMIC,param1,param2,param3);
      }
      
      override fp_internal function start(param1:Entity) : void
      {
         // method body index: 6533 method index: 7078
         super.fp_internal::start(param1);
         param1.ON_UPDATE.add(this.onUpdate);
      }
      
      override fp_internal function end() : void
      {
         // method body index: 6534 method index: 7079
         entity.ON_UPDATE.remove(this.onUpdate);
         super.fp_internal::end();
      }
      
      private function onUpdate() : void
      {
         // method body index: 6535 method index: 7080
         entity.setPositionAngle(body.position.x,body.position.y,body.rotation * Calc.DEG);
      }
   }
}

