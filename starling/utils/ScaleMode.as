package starling.utils
{
   import starling.errors.AbstractClassError;
   
   public class ScaleMode
   {
      
      // method body index: 3846 method index: 4167
      public static const NONE:String = // method body index: 3846 method index: 4167
      "none";
      
      public static const NO_BORDER:String = // method body index: 3846 method index: 4167
      "noBorder";
      
      public static const SHOW_ALL:String = // method body index: 3846 method index: 4167
      "showAll";
      
      public function ScaleMode()
      {
         // method body index: 3848 method index: 4169
         super();
         throw new AbstractClassError();
      }
      
      public static function isValid(param1:String) : Boolean
      {
         // method body index: 3847 method index: 4168
         return param1 == NONE || param1 == NO_BORDER || param1 == SHOW_ALL;
      }
   }
}

