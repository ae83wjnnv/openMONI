package game.environment
{
   import flashpunk2.components.rendering.RectRenderer;
   import flashpunk2.global.Debug;
   
   public class MovingPlatform extends Wall
   {
      
      private var xSpeed:Number = 10;
      
      private var ySpeed:Number = 0;
      
      private var debugColor:uint = 16777215;
      
      public function MovingPlatform(param1:Number, param2:Number, param3:int)
      {
         // method body index: 4589 method index: 4959
         super(param1,param2,param3 * 32,32);
         image = new RectRenderer(param3 * 32,32,0,true);
         add(image);
         ON_UPDATE.add(this.onUpdate);
      }
      
      public function willCollide() : void
      {
         // method body index: 4590 method index: 4960
         this.debugColor = 16711680;
      }
      
      override protected function onDebug() : void
      {
         // method body index: 4591 method index: 4961
         Debug.drawRect(x + body.x,y + body.y,body.width,body.height,this.debugColor,0.5);
      }
      
      private function onUpdate() : void
      {
         // method body index: 4592 method index: 4962
         this.debugColor = 16777215;
      }
   }
}

