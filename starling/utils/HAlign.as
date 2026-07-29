package starling.utils
{
   import starling.errors.AbstractClassError;
   
   public final class HAlign
   {
      
      // method body index: 1241 method index: 1241
      public static const LEFT:String = // method body index: 1241 method index: 1241
      "left";
      
      public static const CENTER:String = // method body index: 1241 method index: 1241
      "center";
      
      public static const RIGHT:String = // method body index: 1241 method index: 1241
      "right";
      
      public function HAlign()
      {
         // method body index: 1243 method index: 1243
         super();
         throw new AbstractClassError();
      }
      
      public static function isValid(param1:String) : Boolean
      {
         // method body index: 1242 method index: 1242
         return param1 == LEFT || param1 == CENTER || param1 == RIGHT;
      }
   }
}

