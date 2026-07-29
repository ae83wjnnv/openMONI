package flashpunk2.particles
{
   import flash.display.Sprite;
   import flashpunk2.Entity;
   import flashpunk2.components.rendering.Renderer;
   import flashpunk2.global.Asset;
   import flashpunk2.global.Time;
   import flashpunk2.namespaces.fp_internal;
   import game.Constants;
   import starling.extensions.PDParticleSystem;
   import starling.textures.Texture;
   
   use namespace fp_internal;
   
   public class ParticleRenderer extends Renderer
   {
      
      // method body index: 4636 method index: 5006
      public static const SQUARE:Texture = // method body index: 4636 method index: 5006
      Texture.fromColor(1,1,4294967295,false,1);
      
      private var _particleSystem:PDParticleSystem;
      
      private var time:Number;
      
      private var parDisplayObject:Sprite;
      
      private var offsetX:int = 0;
      
      private var offsetY:int = 0;
      
      private var killOnEnd:Boolean;
      
      private var name:String;
      
      private var _shouldReset:Boolean = true;
      
      public function ParticleRenderer(param1:XML, param2:String = "unknown")
      {
         // method body index: 4637 method index: 5007
         super();
         this.name = param2;
         var _loc3_:Texture = param1.texture.@name == undefined ? SQUARE : Asset.getTextureFromSource(String(param1.texture.@name));
         this._particleSystem = new PDParticleSystem(param1,_loc3_);
         fp_internal::setDisplayObject(this._particleSystem);
      }
      
      private function onCheckForKill() : void
      {
         // method body index: 4638 method index: 5008
         if(this.killOnEnd && this._particleSystem.numParticles == 0 && !this._particleSystem.isEmitting)
         {
            removeSelf();
         }
      }
      
      override fp_internal function start(param1:Entity) : void
      {
         // method body index: 4639 method index: 5009
         super.fp_internal::start(param1);
         param1.ON_UPDATE.add(this.onJug);
         param1.ON_UPDATE.add(this.onCheckForKill);
      }
      
      private function onJug() : void
      {
         // method body index: 4640 method index: 5010
         this._particleSystem.advanceTime(Constants.SECS_PER_STEP);
      }
      
      override fp_internal function end() : void
      {
         // method body index: 4641 method index: 5011
         super.fp_internal::end();
      }
      
      public function burst(param1:int, param2:Boolean) : void
      {
         // method body index: 4642 method index: 5012
         this.killOnEnd = param2;
         if(param1 < 0)
         {
            this._particleSystem.start();
         }
         else
         {
            this._particleSystem.start(Time.dt * param1);
         }
      }
      
      public function offset(param1:int, param2:int) : void
      {
         // method body index: 4643 method index: 5013
         this.offsetX = param1;
         this.offsetY = param2;
      }
      
      public function moveEmitter(param1:int, param2:int) : void
      {
         // method body index: 4644 method index: 5014
         this._particleSystem.emitterX = param1;
         this._particleSystem.emitterY = param2;
      }
      
      public function stop(param1:Boolean = true) : void
      {
         // method body index: 4645 method index: 5015
         this.killOnEnd = param1;
         this._particleSystem.stop(false);
      }
      
      public function setSourceSize(param1:Number, param2:Number) : ParticleRenderer
      {
         // method body index: 4646 method index: 5016
         this._particleSystem.emitterXVariance = param1 / 2;
         this._particleSystem.emitterYVariance = param2 / 2;
         return this;
      }
      
      public function simulate(param1:Number) : ParticleRenderer
      {
         // method body index: 4647 method index: 5017
         while(param1 > 0)
         {
            this._particleSystem.advanceTime(1 / 60);
            param1 -= 1 / 60;
         }
         return this;
      }
      
      public function kill() : void
      {
         // method body index: 4648 method index: 5018
         this._particleSystem.stop(false);
         this.killOnEnd = true;
      }
      
      public function angleVariation(param1:Number) : ParticleRenderer
      {
         // method body index: 4649 method index: 5019
         this._particleSystem.emitAngleVariance = param1;
         return this;
      }
      
      public function speed(param1:Number) : ParticleRenderer
      {
         // method body index: 4650 method index: 5020
         this._particleSystem.speed = param1;
         return this;
      }
      
      public function max(param1:int) : ParticleRenderer
      {
         // method body index: 4651 method index: 5021
         this._particleSystem.maxNumParticles = param1;
         return this;
      }
      
      public function startSize(param1:Number) : ParticleRenderer
      {
         // method body index: 4652 method index: 5022
         this._particleSystem.startSize = param1;
         return this;
      }
      
      public function shouldReset(param1:Boolean) : ParticleRenderer
      {
         // method body index: 4653 method index: 5023
         this._shouldReset = param1;
         return this;
      }
      
      public function onReset() : void
      {
         // method body index: 4654 method index: 5024
         if(this._shouldReset)
         {
            removeSelf();
         }
      }
   }
}

