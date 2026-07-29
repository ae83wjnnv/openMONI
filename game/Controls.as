package game
{
   import flashpunk2.global.Key;
   import flashpunk2.input.InputAxis;
   import flashpunk2.input.InputButton;
   
   public class Controls
   {
      
      // method body index: 2692 method index: 2706
      public static const JUMP:InputButton = // method body index: 2692 method index: 2706
      InputButton.create(Key.Z,Key.SPACE,Key.ENTER);
      
      public static const ATTACK:InputButton = // method body index: 2692 method index: 2706
      InputButton.create(Key.X,Key.CONTROL);
      
      public static const ACCEPT:InputButton = // method body index: 2692 method index: 2706
      InputButton.create(Key.SPACE,Key.Z);
      
      public static const AXIS:InputAxis = // method body index: 2692 method index: 2706
      InputAxis.create(false);
      
      public function Controls()
      {
         // method body index: 2693 method index: 2707
         super();
      }
   }
}

