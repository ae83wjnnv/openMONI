package starling.utils
{
   import starling.errors.AbstractClassError;
   
   public final class VAlign
   {
      
      // method body index: 1319 method index: 1319
      public static const TOP:String = // method body index: 1319 method index: 1319
      "top";
      
      public static const CENTER:String = // method body index: 1319 method index: 1319
      "center";
      
      public static const BOTTOM:String = // method body index: 1319 method index: 1319
      "bottom";
      
      public function VAlign()
      {
         // method body index: 1321 method index: 1321
         super();
         throw new AbstractClassError();
      }
      
      public static function isValid(param1:String) : Boolean
      {
         // method body index: 1320 method index: 1320
         return param1 == TOP || param1 == CENTER || param1 == BOTTOM;
      }
   }
}

