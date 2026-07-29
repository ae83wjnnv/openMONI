package starling.events
{
   public class KeyboardEvent extends Event
   {
      
      // method body index: 1848 method index: 1851
      public static const KEY_UP:String = // method body index: 1848 method index: 1851
      "keyUp";
      
      public static const KEY_DOWN:String = // method body index: 1848 method index: 1851
      "keyDown";
      
      private var mCharCode:uint;
      
      private var mKeyCode:uint;
      
      private var mKeyLocation:uint;
      
      private var mAltKey:Boolean;
      
      private var mCtrlKey:Boolean;
      
      private var mShiftKey:Boolean;
      
      public function KeyboardEvent(param1:String, param2:uint = 0, param3:uint = 0, param4:uint = 0, param5:Boolean = false, param6:Boolean = false, param7:Boolean = false)
      {
         // method body index: 1849 method index: 1852
         super(param1,false,param3);
         this.mCharCode = param2;
         this.mKeyCode = param3;
         this.mKeyLocation = param4;
         this.mCtrlKey = param5;
         this.mAltKey = param6;
         this.mShiftKey = param7;
      }
      
      public function get charCode() : uint
      {
         // method body index: 1850 method index: 1853
         return this.mCharCode;
      }
      
      public function get keyCode() : uint
      {
         // method body index: 1851 method index: 1854
         return this.mKeyCode;
      }
      
      public function get keyLocation() : uint
      {
         // method body index: 1852 method index: 1855
         return this.mKeyLocation;
      }
      
      public function get altKey() : Boolean
      {
         // method body index: 1853 method index: 1856
         return this.mAltKey;
      }
      
      public function get ctrlKey() : Boolean
      {
         // method body index: 1854 method index: 1857
         return this.mCtrlKey;
      }
      
      public function get shiftKey() : Boolean
      {
         // method body index: 1855 method index: 1858
         return this.mShiftKey;
      }
   }
}

