package flashpunk2.particles
{
   import flash.utils.Dictionary;
   import flashpunk2.Entity;
   import flashpunk2.global.Debug;
   
   public class ParticlesController extends Entity
   {
      
      private var particles:Dictionary = // method body index: 2362 method index: 2367
      new Dictionary();
      
      public function ParticlesController()
      {
         // method body index: 2362 method index: 2367
         super();
         ON_DEBUG.add(this.onDebug);
      }
      
      private function onDebug() : void
      {
         // method body index: 2363 method index: 2368
         var _loc1_:ParticleRenderer = null;
         for each(_loc1_ in getComponents(ParticleRenderer))
         {
            Debug.drawRectOutline(_loc1_.x,_loc1_.y,10,10,16777215,1,1);
         }
      }
      
      public function burst(param1:int, param2:int, param3:String, param4:int = -1) : ParticleRenderer
      {
         // method body index: 2364 method index: 2369
         if(this.particles[param3] == undefined)
         {
            throw new Error("Undentified particle type");
         }
         var _loc5_:ParticleRenderer = new ParticleRenderer(this.particles[param3],param3);
         addComponent(_loc5_);
         _loc5_.moveEmitter(param1,param2);
         _loc5_.burst(param4,true);
         return _loc5_;
      }
      
      public function addParticleType(param1:String, param2:XML) : void
      {
         // method body index: 2365 method index: 2370
         this.particles[param1] = param2;
      }
      
      public function reset() : void
      {
         // method body index: 2366 method index: 2371
         var _loc1_:ParticleRenderer = null;
         for each(_loc1_ in getComponents(ParticleRenderer))
         {
            _loc1_.onReset();
         }
      }
   }
}

