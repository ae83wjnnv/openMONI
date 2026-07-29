package game.enemies
{
   import flashpunk2.Entity;
   import flashpunk2.components.rendering.AnimationRenderer;
   import flashpunk2.global.Ease;
   import game.fx.ScreenFlash;
   import game.world.Cutscene;
   import game.world.PlatformLevel;
   import sound.MusicPlayer;
   
   public class MermanBoss extends Enemy
   {
      
      // method body index: 2649 method index: 2663
      public static const IDLE:String = // method body index: 2649 method index: 2663
      "idle";
      
      public static const WALK:String = // method body index: 2649 method index: 2663
      "walk";
      
      public static const JUMP:String = // method body index: 2649 method index: 2663
      "jump";
      
      private var currentMove:String;
      
      private var thinking:int;
      
      private var side:int;
      
      private var jumping:Boolean = false;
      
      private var startY:Number;
      
      private var levelSide:int = -1;
      
      private var canShot:Boolean = false;
      
      public function MermanBoss(param1:int, param2:int)
      {
         // method body index: 2650 method index: 2664
         super(param1,param2,64,64);
         image = new AnimationRenderer();
         image.addPrefix("idle","enemies/bossMermanIdle",10,true);
         image.addPrefix("jump","enemies/bossMermanJumpB",10,true);
         image.addPrefix("rotate","enemies/bossMermanFlip",10,true);
         image.addPrefix("shot","enemies/bossMermanShoot",12,false);
         image.play("idle");
         image.centerOrigin();
         image.originY -= 48;
         add(image);
         image.y -= 31;
         this.currentMove = IDLE;
         this.thinking = 10;
         ON_START.add(this.onStart);
         this.side = 1;
         _damage = 1;
         hp = 6;
         gravity = 0;
         ON_UPDATE.add(this.onUpdate);
         tween(this,3,null,false).onComplete(this.onStartJump);
         this.startY = param2 + 64;
      }
      
      private function onStart() : void
      {
         // method body index: 2651 method index: 2665
         x += image.width / 2;
         y += image.height / 2;
      }
      
      private function onStartJump() : void
      {
         // method body index: 2653 method index: 2667
         var entity:Entity = null;
         image.play("jump",true);
         entity = this;
         tween(this,1.5).to("y",this.startY - 300).ease(Ease.circOut).onComplete(function():// method body index: 2652 method index: 2666
         void
         {
            // method body index: 2652 method index: 2666
            onStartShot();
            tween(entity,1.7).delay(0.1).to("y",startY).ease(Ease.cubeInOut).onComplete(backToIdle);
            tween(entity,1.7,null,false).delay(0.1).to("angle",levelSide == -1 ? 180 : -180).ease(Ease.cubeOut);
            tween(entity,1.7,null,false).delay(0.1).to("x",levelSide == 1 ? 128 : level.width - 128).ease(Ease.cubeOut);
         });
         tween(this,1.8,null,false).delay(0.2).to("x",level.width / 2).ease(null);
         tween(entity,1.7,null,false).delay(0.1).to("angle",this.levelSide == -1 ? 90 : -90).ease(Ease.cubeOut);
      }
      
      private function onStartShot() : void
      {
         // method body index: 2655 method index: 2669
         image.play("shot");
         image.ON_COMPLETE.add(function():// method body index: 2654 method index: 2668
         void
         {
            // method body index: 2654 method index: 2668
            image.play("idle");
            image.ON_COMPLETE.clear();
         });
         this.canShot = true;
      }
      
      private function backToIdle() : void
      {
         // method body index: 2657 method index: 2671
         cancelAllTweens();
         this.levelSide *= -1;
         image.scaleX = -this.levelSide;
         this.side = this.levelSide;
         image.play("rotate");
         angle = 0;
         image.ON_COMPLETE.add(function():// method body index: 2656 method index: 2670
         void
         {
            // method body index: 2656 method index: 2670
            image.play("idle");
            image.ON_COMPLETE.clear();
         });
         tween(this,2,null,false).onComplete(this.onStartJump);
      }
      
      override public function onBounced(param1:int) : Boolean
      {
         // method body index: 2658 method index: 2672
         return false;
      }
      
      override public function kill() : void
      {
         // method body index: 2660 method index: 2674
         var merm:Merman = null;
         MusicPlayer.playMusic("vitoria",1,true);
         world.add(new ScreenFlash(0,1,0,function():// method body index: 2659 method index: 2673
         void
         {
            // method body index: 2659 method index: 2673
            engine.setWorld(new Cutscene("saveCascao",new PlatformLevel(2,92,player),false));
         }));
         for each(merm in level.getEntitiesByType(Merman))
         {
            merm.kill();
         }
         super.kill();
      }
      
      override public function takeHit(param1:int, param2:int) : void
      {
         // method body index: 2661 method index: 2675
         if(invulnerable <= 0 && alive)
         {
            hp -= param1;
            tween(image,0.5,null,false).scaleFrom(0.8 * param2,1.2).scaleTo(1 * param2,1).ease(Ease.backInOut);
            invulnerable = 30;
         }
      }
      
      private function onUpdate() : void
      {
         // method body index: 2662 method index: 2676
         if(image.index == 3 && image.animationName == "shot")
         {
            this.onShot();
         }
         --invulnerable;
         if(invulnerable > 0)
         {
            if(invulnerable % 6 < 3)
            {
               image.alpha = 0.5;
            }
            else
            {
               image.alpha = 1;
            }
         }
         else
         {
            image.alpha = 1;
         }
      }
      
      private function onShot() : void
      {
         // method body index: 2663 method index: 2677
         if(this.canShot)
         {
            this.canShot = false;
            world.add(new Projectile(x,y + 32,"fx/waterShot",1 * (player.x - x < 0 ? -1 : 1),1.5));
            world.add(new Projectile(x,y + 32,"fx/waterShot",1 * (player.x - x > 0 ? -1 : 1),1.5));
         }
      }
   }
}

