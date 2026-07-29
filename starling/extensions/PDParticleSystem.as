package starling.extensions
{
   import flash.display3D.Context3DBlendFactor;
   import starling.textures.Texture;
   import starling.utils.deg2rad;
   
   public class PDParticleSystem extends ParticleSystem
   {
      
      private const EMITTER_TYPE_GRAVITY:int = 0;
      
      private const EMITTER_TYPE_RADIAL:int = 1;
      
      private var mEmitterType:int;
      
      private var mEmitterXVariance:Number;
      
      private var mEmitterYVariance:Number;
      
      private var mMaxNumParticles:int;
      
      private var mLifespan:Number;
      
      private var mLifespanVariance:Number;
      
      private var mStartSize:Number;
      
      private var mStartSizeVariance:Number;
      
      private var mEndSize:Number;
      
      private var mEndSizeVariance:Number;
      
      private var mEmitAngle:Number;
      
      private var mEmitAngleVariance:Number;
      
      private var mSpeed:Number;
      
      private var mSpeedVariance:Number;
      
      private var mGravityX:Number;
      
      private var mGravityY:Number;
      
      private var mTangentialAcceleration:Number;
      
      private var mTangentialAccelerationVariance:Number;
      
      private var mStartColor:ColorArgb;
      
      private var mStartColorVariance:ColorArgb;
      
      private var mEndColor:ColorArgb;
      
      private var mEndColorVariance:ColorArgb;
      
      public function PDParticleSystem(param1:XML, param2:Texture)
      {
         // method body index: 6452 method index: 6996
         this.parseConfig(param1);
         var _loc3_:Number = this.mMaxNumParticles / this.mLifespan;
         super(param2,_loc3_,this.mMaxNumParticles,this.mMaxNumParticles,mBlendFactorSource,mBlendFactorDestination);
         mPremultipliedAlpha = false;
      }
      
      override protected function createParticle() : Particle
      {
         // method body index: 6453 method index: 6997
         return new PDParticle();
      }
      
      override protected function initParticle(param1:Particle) : void
      {
         // method body index: 6454 method index: 6998
         var _loc2_:PDParticle = null;
         _loc2_ = param1 as PDParticle;
         var _loc3_:Number = this.mLifespan + this.mLifespanVariance * (Math.random() * 2 - 1);
         if(_loc3_ <= 0)
         {
            return;
         }
         _loc2_.currentTime = 0;
         _loc2_.totalTime = _loc3_;
         _loc2_.x = mEmitterX + this.mEmitterXVariance * (Math.random() * 2 - 1);
         _loc2_.y = mEmitterY + this.mEmitterYVariance * (Math.random() * 2 - 1);
         _loc2_.startX = mEmitterX;
         _loc2_.startY = mEmitterY;
         var _loc4_:Number = this.mEmitAngle + this.mEmitAngleVariance * (Math.random() * 2 - 1);
         var _loc5_:Number = this.mSpeed + this.mSpeedVariance * (Math.random() * 2 - 1);
         _loc2_.velocityX = _loc5_ * Math.cos(_loc4_);
         _loc2_.velocityY = _loc5_ * Math.sin(_loc4_);
         _loc2_.tangentialAcceleration = this.mTangentialAcceleration + this.mTangentialAccelerationVariance * (Math.random() * 2 - 1);
         var _loc6_:Number = this.mStartSize + this.mStartSizeVariance * (Math.random() * 2 - 1);
         var _loc7_:Number = this.mEndSize + this.mEndSizeVariance * (Math.random() * 2 - 1);
         if(_loc6_ < 0.1)
         {
            _loc6_ = 0.1;
         }
         if(_loc7_ < 0.1)
         {
            _loc7_ = 0.1;
         }
         _loc2_.scale = _loc6_ / texture.width;
         _loc2_.scaleDelta = (_loc7_ - _loc6_) / _loc3_ / texture.width;
         var _loc8_:ColorArgb = _loc2_.colorArgb;
         var _loc9_:ColorArgb = _loc2_.colorArgbDelta;
         _loc8_.red = this.mStartColor.red;
         _loc8_.green = this.mStartColor.green;
         _loc8_.blue = this.mStartColor.blue;
         _loc8_.alpha = this.mStartColor.alpha;
         if(this.mStartColorVariance.red != 0)
         {
            _loc8_.red += this.mStartColorVariance.red * (Math.random() * 2 - 1);
         }
         if(this.mStartColorVariance.green != 0)
         {
            _loc8_.green += this.mStartColorVariance.green * (Math.random() * 2 - 1);
         }
         if(this.mStartColorVariance.blue != 0)
         {
            _loc8_.blue += this.mStartColorVariance.blue * (Math.random() * 2 - 1);
         }
         if(this.mStartColorVariance.alpha != 0)
         {
            _loc8_.alpha += this.mStartColorVariance.alpha * (Math.random() * 2 - 1);
         }
         var _loc10_:Number = this.mEndColor.red;
         var _loc11_:Number = this.mEndColor.green;
         var _loc12_:Number = this.mEndColor.blue;
         var _loc13_:Number = this.mEndColor.alpha;
         if(this.mEndColorVariance.red != 0)
         {
            _loc10_ += this.mEndColorVariance.red * (Math.random() * 2 - 1);
         }
         if(this.mEndColorVariance.green != 0)
         {
            _loc11_ += this.mEndColorVariance.green * (Math.random() * 2 - 1);
         }
         if(this.mEndColorVariance.blue != 0)
         {
            _loc12_ += this.mEndColorVariance.blue * (Math.random() * 2 - 1);
         }
         if(this.mEndColorVariance.alpha != 0)
         {
            _loc13_ += this.mEndColorVariance.alpha * (Math.random() * 2 - 1);
         }
         _loc9_.red = (_loc10_ - _loc8_.red) / _loc3_;
         _loc9_.green = (_loc11_ - _loc8_.green) / _loc3_;
         _loc9_.blue = (_loc12_ - _loc8_.blue) / _loc3_;
         _loc9_.alpha = (_loc13_ - _loc8_.alpha) / _loc3_;
      }
      
      override protected function advanceParticle(param1:Particle, param2:Number) : void
      {
         // method body index: 6455 method index: 6999
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc3_:PDParticle = param1 as PDParticle;
         var _loc4_:Number = _loc3_.totalTime - _loc3_.currentTime;
         param2 = _loc4_ > param2 ? param2 : _loc4_;
         _loc3_.currentTime += param2;
         if(this.mEmitterType == this.EMITTER_TYPE_RADIAL)
         {
            throw new Error("Radial aceleration not supported anymore - saint11");
         }
         _loc5_ = _loc3_.x - _loc3_.startX;
         _loc6_ = _loc3_.y - _loc3_.startY;
         _loc7_ = Math.sqrt(_loc5_ * _loc5_ + _loc6_ * _loc6_);
         if(_loc7_ < 0.01)
         {
            _loc7_ = 0.01;
         }
         _loc8_ = _loc5_ / _loc7_;
         _loc9_ = _loc6_ / _loc7_;
         _loc10_ = _loc8_;
         _loc11_ = _loc9_;
         _loc12_ = _loc10_;
         _loc10_ = -_loc11_ * _loc3_.tangentialAcceleration;
         _loc11_ = _loc12_ * _loc3_.tangentialAcceleration;
         _loc3_.velocityX += param2 * (this.mGravityX + _loc10_);
         _loc3_.velocityY += param2 * (this.mGravityY + _loc11_);
         _loc3_.x += _loc3_.velocityX * param2;
         _loc3_.y += _loc3_.velocityY * param2;
         _loc3_.scale += _loc3_.scaleDelta * param2;
         _loc3_.colorArgb.red += _loc3_.colorArgbDelta.red * param2;
         _loc3_.colorArgb.green += _loc3_.colorArgbDelta.green * param2;
         _loc3_.colorArgb.blue += _loc3_.colorArgbDelta.blue * param2;
         _loc3_.colorArgb.alpha += _loc3_.colorArgbDelta.alpha * param2;
         _loc3_.color = _loc3_.colorArgb.toRgb();
         _loc3_.alpha = _loc3_.colorArgb.alpha;
      }
      
      private function updateEmissionRate() : void
      {
         // method body index: 6456 method index: 7000
         emissionRate = this.mMaxNumParticles / this.mLifespan;
      }
      
      private function parseConfig(param1:XML) : void
      {
         // method body index: 6461 method index: 7005
         var config:XML = param1;
         var getIntValue:Function = function(param1:XMLList):// method body index: 6457 method index: 7001
         int
         {
            // method body index: 6457 method index: 7001
            return parseInt(param1.attribute("value"));
         };
         var getFloatValue:Function = function(param1:XMLList):// method body index: 6458 method index: 7002
         Number
         {
            // method body index: 6458 method index: 7002
            return parseFloat(param1.attribute("value"));
         };
         var getColor:Function = function(param1:XMLList):// method body index: 6459 method index: 7003
         ColorArgb
         {
            // method body index: 6459 method index: 7003
            var _loc2_:ColorArgb = new ColorArgb();
            _loc2_.red = parseFloat(param1.attribute("red"));
            _loc2_.green = parseFloat(param1.attribute("green"));
            _loc2_.blue = parseFloat(param1.attribute("blue"));
            _loc2_.alpha = parseFloat(param1.attribute("alpha"));
            return _loc2_;
         };
         var getBlendFunc:Function = function(param1:XMLList):// method body index: 6460 method index: 7004
         String
         {
            // method body index: 6460 method index: 7004
            var _loc2_:int = int(getIntValue(param1));
            switch(_loc2_)
            {
               case 0:
                  return Context3DBlendFactor.ZERO;
               case 1:
                  return Context3DBlendFactor.ONE;
               case 768:
                  return Context3DBlendFactor.SOURCE_COLOR;
               case 769:
                  return Context3DBlendFactor.ONE_MINUS_SOURCE_COLOR;
               case 770:
                  return Context3DBlendFactor.SOURCE_ALPHA;
               case 771:
                  return Context3DBlendFactor.ONE_MINUS_SOURCE_ALPHA;
               case 772:
                  return Context3DBlendFactor.DESTINATION_ALPHA;
               case 773:
                  return Context3DBlendFactor.ONE_MINUS_DESTINATION_ALPHA;
               case 774:
                  return Context3DBlendFactor.DESTINATION_COLOR;
               case 775:
                  return Context3DBlendFactor.ONE_MINUS_DESTINATION_COLOR;
               default:
                  throw new ArgumentError("unsupported blending function: " + _loc2_);
            }
         };
         this.mEmitterXVariance = parseFloat(config.sourcePositionVariance.attribute("x"));
         this.mEmitterYVariance = parseFloat(config.sourcePositionVariance.attribute("y"));
         this.mGravityX = parseFloat(config.gravity.attribute("x"));
         this.mGravityY = parseFloat(config.gravity.attribute("y"));
         this.mEmitterType = getIntValue(config.emitterType);
         this.mMaxNumParticles = getIntValue(config.maxParticles);
         this.mLifespan = Math.max(0.01,getFloatValue(config.particleLifeSpan));
         this.mLifespanVariance = getFloatValue(config.particleLifespanVariance);
         this.mStartSize = getFloatValue(config.startParticleSize);
         this.mStartSizeVariance = getFloatValue(config.startParticleSizeVariance);
         this.mEndSize = getFloatValue(config.finishParticleSize);
         this.mEndSizeVariance = getFloatValue(config.FinishParticleSizeVariance);
         this.mEmitAngle = deg2rad(getFloatValue(config.angle));
         this.mEmitAngleVariance = deg2rad(getFloatValue(config.angleVariance));
         this.mSpeed = getFloatValue(config.speed);
         this.mSpeedVariance = getFloatValue(config.speedVariance);
         this.mTangentialAcceleration = getFloatValue(config.tangentialAcceleration);
         this.mTangentialAccelerationVariance = getFloatValue(config.tangentialAccelVariance);
         this.mStartColor = getColor(config.startColor);
         this.mStartColorVariance = getColor(config.startColorVariance);
         this.mEndColor = getColor(config.finishColor);
         this.mEndColorVariance = getColor(config.finishColorVariance);
         mBlendFactorSource = getBlendFunc(config.blendFuncSource);
         mBlendFactorDestination = getBlendFunc(config.blendFuncDestination);
      }
      
      public function get emitterType() : int
      {
         // method body index: 6462 method index: 7006
         return this.mEmitterType;
      }
      
      public function set emitterType(param1:int) : void
      {
         // method body index: 6463 method index: 7007
         this.mEmitterType = param1;
      }
      
      public function get emitterXVariance() : Number
      {
         // method body index: 6464 method index: 7008
         return this.mEmitterXVariance;
      }
      
      public function set emitterXVariance(param1:Number) : void
      {
         // method body index: 6465 method index: 7009
         this.mEmitterXVariance = param1;
      }
      
      public function get emitterYVariance() : Number
      {
         // method body index: 6466 method index: 7010
         return this.mEmitterYVariance;
      }
      
      public function set emitterYVariance(param1:Number) : void
      {
         // method body index: 6467 method index: 7011
         this.mEmitterYVariance = param1;
      }
      
      public function get maxNumParticles() : int
      {
         // method body index: 6468 method index: 7012
         return this.mMaxNumParticles;
      }
      
      public function set maxNumParticles(param1:int) : void
      {
         // method body index: 6469 method index: 7013
         maxCapacity = param1;
         this.mMaxNumParticles = maxCapacity;
         this.updateEmissionRate();
      }
      
      public function get lifespan() : Number
      {
         // method body index: 6470 method index: 7014
         return this.mLifespan;
      }
      
      public function set lifespan(param1:Number) : void
      {
         // method body index: 6471 method index: 7015
         this.mLifespan = Math.max(0.01,param1);
         this.updateEmissionRate();
      }
      
      public function get lifespanVariance() : Number
      {
         // method body index: 6472 method index: 7016
         return this.mLifespanVariance;
      }
      
      public function set lifespanVariance(param1:Number) : void
      {
         // method body index: 6473 method index: 7017
         this.mLifespanVariance = param1;
      }
      
      public function get startSize() : Number
      {
         // method body index: 6474 method index: 7018
         return this.mStartSize;
      }
      
      public function set startSize(param1:Number) : void
      {
         // method body index: 6475 method index: 7019
         this.mStartSize = param1;
      }
      
      public function get startSizeVariance() : Number
      {
         // method body index: 6476 method index: 7020
         return this.mStartSizeVariance;
      }
      
      public function set startSizeVariance(param1:Number) : void
      {
         // method body index: 6477 method index: 7021
         this.mStartSizeVariance = param1;
      }
      
      public function get endSize() : Number
      {
         // method body index: 6478 method index: 7022
         return this.mEndSize;
      }
      
      public function set endSize(param1:Number) : void
      {
         // method body index: 6479 method index: 7023
         this.mEndSize = param1;
      }
      
      public function get endSizeVariance() : Number
      {
         // method body index: 6480 method index: 7024
         return this.mEndSizeVariance;
      }
      
      public function set endSizeVariance(param1:Number) : void
      {
         // method body index: 6481 method index: 7025
         this.mEndSizeVariance = param1;
      }
      
      public function get emitAngle() : Number
      {
         // method body index: 6482 method index: 7026
         return this.mEmitAngle;
      }
      
      public function set emitAngle(param1:Number) : void
      {
         // method body index: 6483 method index: 7027
         this.mEmitAngle = param1;
      }
      
      public function get emitAngleVariance() : Number
      {
         // method body index: 6484 method index: 7028
         return this.mEmitAngleVariance;
      }
      
      public function set emitAngleVariance(param1:Number) : void
      {
         // method body index: 6485 method index: 7029
         this.mEmitAngleVariance = param1;
      }
      
      public function get speed() : Number
      {
         // method body index: 6486 method index: 7030
         return this.mSpeed;
      }
      
      public function set speed(param1:Number) : void
      {
         // method body index: 6487 method index: 7031
         this.mSpeed = param1;
      }
      
      public function get speedVariance() : Number
      {
         // method body index: 6488 method index: 7032
         return this.mSpeedVariance;
      }
      
      public function set speedVariance(param1:Number) : void
      {
         // method body index: 6489 method index: 7033
         this.mSpeedVariance = param1;
      }
      
      public function get gravityX() : Number
      {
         // method body index: 6490 method index: 7034
         return this.mGravityX;
      }
      
      public function set gravityX(param1:Number) : void
      {
         // method body index: 6491 method index: 7035
         this.mGravityX = param1;
      }
      
      public function get gravityY() : Number
      {
         // method body index: 6492 method index: 7036
         return this.mGravityY;
      }
      
      public function set gravityY(param1:Number) : void
      {
         // method body index: 6493 method index: 7037
         this.mGravityY = param1;
      }
      
      public function get tangentialAcceleration() : Number
      {
         // method body index: 6494 method index: 7038
         return this.mTangentialAcceleration;
      }
      
      public function set tangentialAcceleration(param1:Number) : void
      {
         // method body index: 6495 method index: 7039
         this.mTangentialAcceleration = param1;
      }
      
      public function get tangentialAccelerationVariance() : Number
      {
         // method body index: 6496 method index: 7040
         return this.mTangentialAccelerationVariance;
      }
      
      public function set tangentialAccelerationVariance(param1:Number) : void
      {
         // method body index: 6497 method index: 7041
         this.mTangentialAccelerationVariance = param1;
      }
      
      public function get startColor() : ColorArgb
      {
         // method body index: 6498 method index: 7042
         return this.mStartColor;
      }
      
      public function set startColor(param1:ColorArgb) : void
      {
         // method body index: 6499 method index: 7043
         this.mStartColor = param1;
      }
      
      public function get startColorVariance() : ColorArgb
      {
         // method body index: 6500 method index: 7044
         return this.mStartColorVariance;
      }
      
      public function set startColorVariance(param1:ColorArgb) : void
      {
         // method body index: 6501 method index: 7045
         this.mStartColorVariance = param1;
      }
      
      public function get endColor() : ColorArgb
      {
         // method body index: 6502 method index: 7046
         return this.mEndColor;
      }
      
      public function set endColor(param1:ColorArgb) : void
      {
         // method body index: 6503 method index: 7047
         this.mEndColor = param1;
      }
      
      public function get endColorVariance() : ColorArgb
      {
         // method body index: 6504 method index: 7048
         return this.mEndColorVariance;
      }
      
      public function set endColorVariance(param1:ColorArgb) : void
      {
         // method body index: 6505 method index: 7049
         this.mEndColorVariance = param1;
      }
   }
}

