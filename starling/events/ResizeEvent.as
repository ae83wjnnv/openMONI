package starling.events
{
   import flash.geom.Point;
   
   public class ResizeEvent extends Event
   {
      
      // method body index: 1857 method index: 1860
      public static const RESIZE:String = // method body index: 1857 method index: 1860
      "resize";
      
      public function ResizeEvent(param1:String, param2:int, param3:int, param4:Boolean = false)
      {
         // method body index: 1858 method index: 1861
         super(param1,param4,new Point(param2,param3));
      }
      
      public function get width() : int
      {
         // method body index: 1859 method index: 1862
         return (data as Point).x;
      }
      
      public function get height() : int
      {
         // method body index: 1860 method index: 1863
         return (data as Point).y;
      }
   }
}

