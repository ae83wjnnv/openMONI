package game.collectibles
{
   import flashpunk2.components.rendering.ImageRenderer;
   import flashpunk2.global.Ease;
   import game.UserData;
   import game.player.Player;
   import starling.display.Image;
   
   public class Key extends Collectible
   {
      
      private var levelName:String;
      
      private var id:int;
      
      private var spot:Image;
      
      private var colected:Boolean = false;
      
      public function Key(param1:int, param2:int, param3:String, param4:int)
      {
         // method body index: 2490 method index: 2504
         super(param1 + 40,param2 + 48,true);
         this.id = param4;
         this.levelName = param3;
         var _loc5_:ImageRenderer = new ImageRenderer("environment/key",true);
         add(_loc5_);
         _xSpeed = _ySpeed = 0;
         ON_START.add(this.onStart);
      }
      
      private function onStart() : void
      {
         // method body index: 2492 method index: 2506
         if(level.dark)
         {
            this.spot = level.illumination.addSpot(x - camera.x,y - camera.y,0);
            tween(this.spot,0.5).scaleFrom(0,0).scaleTo(2,2).ease(Ease.bounceOut);
            ON_UPDATE.add(function():// method body index: 2491 method index: 2505
            void
            {
               // method body index: 2491 method index: 2505
               spot.x = x - camera.x;
               spot.y = y - camera.y;
            });
         }
      }
      
      override public function collect(param1:Player) : void
      {
         // method body index: 2494 method index: 2508
         var player:Player = param1;
         if(!this.colected)
         {
            this.colected = true;
            UserData.setTrigger("key" + this.levelName + this.id.toString());
            UserData.collectKey();
            level.hud.updateKeys();
            if(this.spot)
            {
               world.tween(this.spot,0.3).scaleTo(0,0).ease(Ease.cubeOut).onComplete(function():// method body index: 2493 method index: 2507
               void
               {
                  // method body index: 2493 method index: 2507
                  level.illumination.removeSpot(spot);
               });
            }
            level.showMessage("Você pegou uma chave!","Use-a para entrar em portas fechadas.");
         }
      }
   }
}

