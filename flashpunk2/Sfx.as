package flashpunk2
{
   import flash.events.Event;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import flash.media.SoundTransform;
   import flash.utils.Dictionary;
   import flashpunk2.global.Calc;
   
   public class Sfx
   {
      
      // method body index: 2728 method index: 2742
      private static var _sounds:Dictionary = // method body index: 2728 method index: 2742
      new Dictionary();
      
      private static var _typePlaying:Dictionary = // method body index: 2728 method index: 2742
      new Dictionary();
      
      private static var _typeTransforms:Dictionary = // method body index: 2728 method index: 2742
      new Dictionary();
      
      public var complete:Function;
      
      private var _type:String;
      
      private var _vol:Number = 1;
      
      private var _pan:Number = 0;
      
      private var _filteredVol:Number;
      
      private var _filteredPan:Number;
      
      private var _sound:Sound;
      
      private var _channel:SoundChannel;
      
      private var _transform:SoundTransform = // method body index: 2733 method index: 2747
      new SoundTransform();
      
      private var _position:Number = 0;
      
      private var _looping:Boolean;
      
      public function Sfx(param1:*, param2:Function = null, param3:String = null)
      {
         // method body index: 2733 method index: 2747
         super();
         this._type = param3;
         if(param1 is Class)
         {
            this._sound = _sounds[param1];
            if(!this._sound)
            {
               this._sound = _sounds[param1] = new param1();
            }
         }
         else
         {
            if(!(param1 is Sound))
            {
               throw new Error("Sfx source needs to be of type Class or Sound");
            }
            this._sound = param1;
         }
         this.complete = param2;
      }
      
      public static function getPan(param1:String) : Number
      {
         // method body index: 2729 method index: 2743
         var _loc2_:SoundTransform = _typeTransforms[param1];
         return _loc2_ ? _loc2_.pan : 0;
      }
      
      public static function getVolume(param1:String) : Number
      {
         // method body index: 2730 method index: 2744
         var _loc2_:SoundTransform = _typeTransforms[param1];
         return _loc2_ ? _loc2_.volume : 1;
      }
      
      public static function setPan(param1:String, param2:Number) : void
      {
         // method body index: 2731 method index: 2745
         var _loc4_:Sfx = null;
         var _loc3_:SoundTransform = _typeTransforms[param1];
         if(!_loc3_)
         {
            _loc3_ = _typeTransforms[param1] = new SoundTransform();
         }
         _loc3_.pan = Calc.clamp(param2,-1,1);
         for each(_loc4_ in _typePlaying[param1])
         {
            _loc4_.pan = _loc4_.pan;
         }
      }
      
      public static function setVolume(param1:String, param2:Number) : void
      {
         // method body index: 2732 method index: 2746
         var _loc4_:Sfx = null;
         var _loc3_:SoundTransform = _typeTransforms[param1];
         if(!_loc3_)
         {
            _loc3_ = _typeTransforms[param1] = new SoundTransform();
         }
         _loc3_.volume = param2 < 0 ? 0 : param2;
         for each(_loc4_ in _typePlaying[param1])
         {
            _loc4_.volume = _loc4_.volume;
         }
      }
      
      public function play(param1:Number = 1, param2:Number = 0) : void
      {
         // method body index: 2734 method index: 2748
         if(this._channel)
         {
            this.stop();
         }
         this._pan = Calc.clamp(param2,-1,1);
         this._vol = param1 < 0 ? 0 : param1;
         this._filteredPan = Calc.clamp(this._pan + getPan(this._type),-1,1);
         this._filteredVol = Math.max(0,this._vol * getVolume(this._type));
         this._transform.pan = this._filteredPan;
         this._transform.volume = this._filteredVol;
         this._channel = this._sound.play(0,0,this._transform);
         if(this._channel)
         {
            this.addPlaying();
            this._channel.addEventListener(Event.SOUND_COMPLETE,this.onComplete);
         }
         this._looping = false;
         this._position = 0;
      }
      
      public function loop(param1:Number = 1, param2:Number = 0) : void
      {
         // method body index: 2735 method index: 2749
         this.play(param1,param2);
         this._looping = true;
      }
      
      public function stop() : Boolean
      {
         // method body index: 2736 method index: 2750
         if(!this._channel)
         {
            return false;
         }
         this.removePlaying();
         this._position = this._channel.position;
         this._channel.removeEventListener(Event.SOUND_COMPLETE,this.onComplete);
         this._channel.stop();
         this._channel = null;
         return true;
      }
      
      public function resume() : void
      {
         // method body index: 2737 method index: 2751
         this._channel = this._sound.play(this._position,0,this._transform);
         if(this._channel)
         {
            this.addPlaying();
            this._channel.addEventListener(Event.SOUND_COMPLETE,this.onComplete);
         }
         this._position = 0;
      }
      
      private function onComplete(param1:Event = null) : void
      {
         // method body index: 2738 method index: 2752
         if(this._looping)
         {
            this.loop(this._vol,this._pan);
         }
         else
         {
            this.stop();
         }
         this._position = 0;
         if(this.complete != null)
         {
            this.complete();
         }
      }
      
      private function addPlaying() : void
      {
         // method body index: 2739 method index: 2753
         if(!_typePlaying[this._type])
         {
            _typePlaying[this._type] = new Dictionary();
         }
         _typePlaying[this._type][this] = this;
      }
      
      private function removePlaying() : void
      {
         // method body index: 2740 method index: 2754
         if(_typePlaying[this._type])
         {
            delete _typePlaying[this._type][this];
         }
      }
      
      public function get volume() : Number
      {
         // method body index: 2741 method index: 2755
         return this._vol;
      }
      
      public function set volume(param1:Number) : void
      {
         // method body index: 2742 method index: 2756
         var _loc2_:Number = NaN;
         if(this._vol != param1)
         {
            if(!this._channel)
            {
               return;
            }
            if(param1 < 0)
            {
               param1 = 0;
            }
            _loc2_ = param1 * getVolume(this._type);
            if(_loc2_ < 0)
            {
               _loc2_ = 0;
            }
            if(this._filteredVol === _loc2_)
            {
               return;
            }
            this._vol = param1;
            this._filteredVol = this._transform.volume = _loc2_;
            this._channel.soundTransform = this._transform;
         }
      }
      
      public function get pan() : Number
      {
         // method body index: 2743 method index: 2757
         return this._pan;
      }
      
      public function set pan(param1:Number) : void
      {
         // method body index: 2744 method index: 2758
         if(!this._channel)
         {
            return;
         }
         param1 = Calc.clamp(param1,-1,1);
         var _loc2_:Number = Calc.clamp(param1 + getPan(this._type),-1,1);
         if(this._filteredPan === _loc2_)
         {
            return;
         }
         this._pan = param1;
         this._filteredPan = this._transform.pan = _loc2_;
         this._channel.soundTransform = this._transform;
      }
      
      public function get type() : String
      {
         // method body index: 2745 method index: 2759
         return this._type;
      }
      
      public function set type(param1:String) : void
      {
         // method body index: 2746 method index: 2760
         if(this._type == param1)
         {
            return;
         }
         if(this._channel)
         {
            this.removePlaying();
            this._type = param1;
            this.addPlaying();
            this.pan = this.pan;
            this.volume = this.volume;
         }
         else
         {
            this._type = param1;
         }
      }
      
      public function get playing() : Boolean
      {
         // method body index: 2747 method index: 2761
         return this._channel != null;
      }
      
      public function get position() : Number
      {
         // method body index: 2748 method index: 2762
         return (this._channel ? this._channel.position : this._position) / 1000;
      }
      
      public function get length() : Number
      {
         // method body index: 2749 method index: 2763
         return this._sound.length / 1000;
      }
   }
}

