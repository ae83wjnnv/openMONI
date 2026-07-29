package
{
   import com.jpexs.decompiler.flash.debugger.debugGetDefinitionByName;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.ProgressEvent;
   import flash.text.TextField;
   
   public class Preloader extends MovieClip
   {
      
      // method body index: 0 method index: 0
      [Embed(source="../assets/loading.png")]
      private static var imgLoading:Class = // method body index: 0 method index: 0
      Preloader_imgLoading;
      
      private var loading:Bitmap = // method body index: 1 method index: 1
      new imgLoading();
      
      private var square:Sprite = // method body index: 1 method index: 1
      new Sprite();
      
      private var wd:Number = // method body index: 1 method index: 1
      loaderInfo.bytesLoaded / loaderInfo.bytesTotal * 240;
      
      private var text:TextField = // method body index: 1 method index: 1
      new TextField();
      
      public function Preloader()
      {
         // method body index: 1 method index: 1
         super();
         stage.color = 0;
         addEventListener(Event.ENTER_FRAME,this.checkFrame);
         loaderInfo.addEventListener(ProgressEvent.PROGRESS,this.progress);
         addChild(this.square);
         this.square.x = 180;
         this.square.y = 174;
         addChild(this.loading);
      }
      
      private function progress(param1:ProgressEvent) : void
      {
         // method body index: 2 method index: 2
         this.square.graphics.beginFill(15921906);
         this.square.graphics.drawRect(0,0,loaderInfo.bytesLoaded / loaderInfo.bytesTotal * 280,30);
         this.square.graphics.endFill();
         this.text.textColor = 16777215;
         this.text.text = "Loading: " + Math.ceil(loaderInfo.bytesLoaded / loaderInfo.bytesTotal * 100) + "%";
      }
      
      private function checkFrame(param1:Event) : void
      {
         // method body index: 3 method index: 3
         if(currentFrame == totalFrames)
         {
            removeEventListener(Event.ENTER_FRAME,this.checkFrame);
            this.startup();
         }
      }
      
      private function startup() : void
      {
         // method body index: 4 method index: 4
         removeChild(this.square);
         removeChild(this.loading);
         stop();
         loaderInfo.removeEventListener(ProgressEvent.PROGRESS,this.progress);
         var _loc1_:Class = debugGetDefinitionByName("Main") as Class;
         addChild(new _loc1_() as DisplayObject);
      }
   }
}

