package game.enemies
{
   import flash.geom.Rectangle;
   import flashpunk2.components.rendering.AnimationRenderer;
   import flashpunk2.global.Calc;
   import flashpunk2.global.Ease;
   import flashpunk2.global.Rand;
   import game.PlatformObject;
   import game.fx.Explosion;
   import game.player.Player;
   import game.world.PlatformLevel;
   import sound.SoundManager;
   import starling.display.Image;
   
   public class Enemy extends PlatformObject
   {
      
      protected var _damage:int = 2;
      
      protected var hp:int = 3;
      
      protected var alive:Boolean = true;
      
      protected var image:AnimationRenderer = // method body index: 2371 method index: 2385
      new AnimationRenderer();
      
      protected var player:Player;
      
      protected var takingHit:Boolean = false;
      
      protected var invulnerable:int = 0;
      
      protected var spot:Image;
      
      public function Enemy(param1:int, param2:int, param3:int, param4:int, param5:Boolean = true)
      {
         // method body index: 2371 method index: 2385
         super(param1 + param3 / 2,param2 + param4,param3,param4,false,param5);
         ON_START.add(this.onStart);
         ON_UPDATE.add(this.onUpdate);
         groups = Groups.ENEMY;
      }
      
      private function onUpdate() : void
      {
         // method body index: 2373 method index: 2387
         if(this.alive)
         {
            if(this.hp <= 0)
            {
               this.alive = false;
               _body = new Rectangle();
               gravity = 0;
               _ySpeed = 0;
               _xSpeed = 0;
               cancelAllTweens();
               if(this.spot)
               {
                  tween(this.spot,0.4).scaleTo(0,0).ease(Ease.cubeOut).onComplete(function():// method body index: 2372 method index: 2386
                  void
                  {
                     // method body index: 2372 method index: 2386
                     level.illumination.removeSpot(spot);
                  });
               }
               tween(this,0.45).scaleFrom(1.25,0.9).scaleTo(0,0).ease(Ease.backIn).onComplete(this.kill);
            }
         }
      }
      
      public function kill() : void
      {
         // method body index: 2374 method index: 2388
         this.dropLoot();
         world.add(new Explosion(x,y));
         removeSelf();
      }
      
      protected function dropLoot() : void
      {
         // method body index: 2375 method index: 2389
         level.randomLoot(x,y);
      }
      
      public function takeHit(param1:int, param2:int) : void
      {
         // method body index: 2376 method index: 2390
         if(!this.takingHit && this.alive)
         {
            SoundManager.playSound("coelhadaHit" + Rand.getInt(2).toString());
            this.hp -= param1;
            tween(this.image,0.5,null,false).scaleFrom(0.8 * param2,1.2).scaleTo(1 * param2,1).ease(Ease.backInOut);
            this.takingHit = true;
            _ySpeed = -200;
            world.add(new Explosion(x,y - this.image.width / 3,"puff",0.3));
         }
      }
      
      public function onBounced(param1:int) : Boolean
      {
         // method body index: 2377 method index: 2391
         var _loc2_:int = 0;
         if(this.alive)
         {
            _loc2_ = Calc.sign(this.image.scaleX);
            this.hp -= param1;
            tween(this.image,0.5,null,false).scaleFrom(1.3 * _loc2_,0.8).scaleTo(1 * _loc2_,1).ease(Ease.backInOut);
            this.takingHit = true;
            _ySpeed = -100;
            world.add(new Explosion(x,y - this.image.width / 3,"puff",0.3));
            return true;
         }
         return false;
      }
      
      override protected function onHitGround() : void
      {
         // method body index: 2378 method index: 2392
         super.onHitGround();
         this.takingHit = false;
      }
      
      private function onStart() : void
      {
         // method body index: 2379 method index: 2393
         this.player = (world as PlatformLevel).player;
      }
      
      public function get canAttack() : Boolean
      {
         // method body index: 2380 method index: 2394
         return !this.takingHit && this.invulnerable <= 0;
      }
      
      public function get damage() : int
      {
         // method body index: 2381 method index: 2395
         return this._damage;
      }
   }
}

