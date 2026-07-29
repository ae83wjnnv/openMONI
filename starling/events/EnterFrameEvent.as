package starling.events
{
   public class EnterFrameEvent extends Event
   {
      
      // method body index: 672 method index: 672
      public static const ENTER_FRAME:String = // method body index: 672 method index: 672
      "enterFrame";
      
      public function EnterFrameEvent(param1:String, param2:Number, param3:Boolean = false)
      {
         // method body index: 673 method index: 673
         super(param1,param3,param2);
      }
      
      public function get passedTime() : Number
      {
         // method body index: 674 method index: 674
         return data as Number;
      }
   }
}

