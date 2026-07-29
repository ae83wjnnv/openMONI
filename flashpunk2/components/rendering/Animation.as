package flashpunk2.components.rendering
{
   import flashpunk2.global.Asset;
   import starling.textures.Texture;
   
   public class Animation
   {
      
      private var _name:String;
      
      private var _frameRate:Number;
      
      private var _frames:Vector.<String>;
      
      private var _loop:Boolean;
      
      private var _rate:Number = 1;
      
      public function Animation(param1:String, param2:Vector.<String>, param3:Number, param4:Boolean)
      {
         // method body index: 6403 method index: 6947
         super();
         this._name = param1;
         this._frames = param2;
         this._frameRate = param3;
         this._loop = param4;
      }
      
      public function getTextureByIndex(param1:uint) : Texture
      {
         // method body index: 6404 method index: 6948
         return Asset.getSubTextureByName(this.getFrameName(param1));
      }
      
      public function getTextureByName(param1:String) : Texture
      {
         // method body index: 6405 method index: 6949
         if(this._frames.indexOf(param1) < 0)
         {
            throw new Error("Animation does not contain the frame: " + param1);
         }
         return Asset.getSubTextureByName(param1);
      }
      
      public function getFrameName(param1:uint) : String
      {
         // method body index: 6406 method index: 6950
         if(param1 >= this._frames.length)
         {
            throw new Error("Frame index out of bounds.");
         }
         return this._frames[param1];
      }
      
      public function getFrameIndex(param1:String) : int
      {
         // method body index: 6407 method index: 6951
         var _loc2_:int = this._frames.indexOf(param1);
         if(_loc2_ < 0)
         {
            throw new Error("Animation does not contain frame: " + param1);
         }
         return _loc2_;
      }
      
      public function hasFrame(param1:String) : Boolean
      {
         // method body index: 6408 method index: 6952
         return this._frames.indexOf(param1) >= 0;
      }
      
      public function get name() : String
      {
         // method body index: 6409 method index: 6953
         return this._name;
      }
      
      public function get frameRate() : Number
      {
         // method body index: 6410 method index: 6954
         return this._frameRate;
      }
      
      public function set frameRate(param1:Number) : void
      {
         // method body index: 6411 method index: 6955
         this._frameRate = param1;
      }
      
      public function get loop() : Boolean
      {
         // method body index: 6412 method index: 6956
         return this._loop;
      }
      
      public function set loop(param1:Boolean) : void
      {
         // method body index: 6413 method index: 6957
         this._loop = param1;
      }
      
      public function get length() : int
      {
         // method body index: 6414 method index: 6958
         return this._frames.length;
      }
      
      public function get rate() : Number
      {
         // method body index: 6415 method index: 6959
         return this._rate;
      }
      
      public function set rate(param1:Number) : void
      {
         // method body index: 6416 method index: 6960
         this._rate = param1;
      }
      
      public function get frameDuration() : Number
      {
         // method body index: 6417 method index: 6961
         return 1 / this._frameRate * this._rate;
      }
   }
}

