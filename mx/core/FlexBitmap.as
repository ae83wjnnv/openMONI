package mx.core
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import mx.utils.NameUtil;
   
   use namespace mx_internal;
   
   public class FlexBitmap extends Bitmap
   {
      
      // method body index: 8 method index: 9
      mx_internal static const VERSION:String = // method body index: 8 method index: 9
      "4.6.0.23201";
      
      public function FlexBitmap(param1:BitmapData = null, param2:String = "auto", param3:Boolean = false)
      {
         // method body index: 9 method index: 10
         super(param1,param2,param3);
         try
         {
            name = NameUtil.createUniqueName(this);
         }
         catch(e:Error)
         {
         }
      }
      
      override public function toString() : String
      {
         // method body index: 10 method index: 11
         return NameUtil.displayObjectToString(this);
      }
   }
}

