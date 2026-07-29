package starling.textures
{
   import starling.errors.AbstractClassError;
   
   public class TextureSmoothing
   {
      
      // method body index: 1285 method index: 1285
      public static const NONE:String = // method body index: 1285 method index: 1285
      "none";
      
      public static const BILINEAR:String = // method body index: 1285 method index: 1285
      "bilinear";
      
      public static const TRILINEAR:String = // method body index: 1285 method index: 1285
      "trilinear";
      
      public function TextureSmoothing()
      {
         // method body index: 1287 method index: 1287
         super();
         throw new AbstractClassError();
      }
      
      public static function isValid(param1:String) : Boolean
      {
         // method body index: 1286 method index: 1286
         return param1 == NONE || param1 == BILINEAR || param1 == TRILINEAR;
      }
   }
}

