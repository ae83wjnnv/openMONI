package game.collectibles
{
   import flashpunk2.components.rendering.ImageRenderer;
   import game.UserData;
   import game.player.Player;
   import sound.SoundManager;
   
   public class Gem extends Collectible
   {
      
      public function Gem(param1:int, param2:int)
      {
         // method body index: 2407 method index: 2421
         super(param1,param2);
         var _loc3_:ImageRenderer = new ImageRenderer("gem",true);
         add(_loc3_);
      }
      
      override public function collect(param1:Player) : void
      {
         // method body index: 2408 method index: 2422
         UserData.collectGold(10);
         level.hud.updateCoins();
         SoundManager.playSound("coin");
      }
   }
}

