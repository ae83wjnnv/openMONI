package starling.core
{
   import flash.system.System;
   import starling.display.BlendMode;
   import starling.display.Quad;
   import starling.display.Sprite;
   import starling.events.EnterFrameEvent;
   import starling.events.Event;
   import starling.text.BitmapFont;
   import starling.text.TextField;
   import starling.utils.HAlign;
   import starling.utils.VAlign;
   
   internal class StatsDisplay extends Sprite
   {
      
      private var mBackground:Quad;
      
      private var mTextField:TextField;
      
      private var mFrameCount:int = 0;
      
      private var mTotalTime:Number = 0;
      
      private var mFps:Number = 0;
      
      private var mMemory:Number = 0;
      
      private var mDrawCount:int = 0;
      
      public function StatsDisplay()
      {
         // method body index: 1866 method index: 1869
         super();
         this.mBackground = new Quad(50,25,0);
         this.mTextField = new TextField(48,25,"",BitmapFont.MINI,BitmapFont.NATIVE_SIZE,16777215);
         this.mTextField.x = 2;
         this.mTextField.hAlign = HAlign.LEFT;
         this.mTextField.vAlign = VAlign.TOP;
         addChild(this.mBackground);
         addChild(this.mTextField);
         blendMode = BlendMode.NONE;
         addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
         addEventListener(Event.REMOVED_FROM_STAGE,this.onRemovedFromStage);
      }
      
      private function onAddedToStage() : void
      {
         // method body index: 1867 method index: 1870
         addEventListener(Event.ENTER_FRAME,this.onEnterFrame);
         this.mTotalTime = this.mFrameCount = 0;
         this.update();
      }
      
      private function onRemovedFromStage() : void
      {
         // method body index: 1868 method index: 1871
         removeEventListener(Event.ENTER_FRAME,this.onEnterFrame);
      }
      
      private function onEnterFrame(param1:EnterFrameEvent) : void
      {
         // method body index: 1869 method index: 1872
         this.mTotalTime += param1.passedTime;
         ++this.mFrameCount;
         if(this.mTotalTime > 1)
         {
            this.update();
            this.mFrameCount = this.mTotalTime = 0;
         }
      }
      
      public function update() : void
      {
         // method body index: 1870 method index: 1873
         this.mFps = this.mTotalTime > 0 ? this.mFrameCount / this.mTotalTime : 0;
         this.mMemory = System.totalMemory * 9.54e-7;
         this.mTextField.text = "FPS: " + this.mFps.toFixed(this.mFps < 100 ? 1 : 0) + "\nMEM: " + this.mMemory.toFixed(this.mMemory < 100 ? 1 : 0) + "\nDRW: " + Math.max(0,this.mDrawCount - 2);
      }
      
      public function get drawCount() : int
      {
         // method body index: 1871 method index: 1874
         return this.mDrawCount;
      }
      
      public function set drawCount(param1:int) : void
      {
         // method body index: 1872 method index: 1875
         this.mDrawCount = param1;
      }
      
      public function get fps() : Number
      {
         // method body index: 1873 method index: 1876
         return this.mFps;
      }
      
      public function set fps(param1:Number) : void
      {
         // method body index: 1874 method index: 1877
         this.mFps = param1;
      }
      
      public function get memory() : Number
      {
         // method body index: 1875 method index: 1878
         return this.mMemory;
      }
      
      public function set memory(param1:Number) : void
      {
         // method body index: 1876 method index: 1879
         this.mMemory = param1;
      }
   }
}

