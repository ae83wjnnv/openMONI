package zpp_nape.callbacks
{
   import flash.Boot;
   import nape.callbacks.Listener;
   import zpp_nape.ZPP_ID;
   import zpp_nape.space.ZPP_Space;
   
   public class ZPP_Listener
   {
      
      // method body index: 5227 method index: 5611
      public static var §internal§:Boolean = // method body index: 5233 method index: 5617
      false;
      
      public var type:int;
      
      public var space:ZPP_Space;
      
      public var precedence:int;
      
      public var outer:nape.callbacks.Listener;
      
      public var interaction:ZPP_InteractionListener;
      
      public var id:int;
      
      public var event:int;
      
      public var constraint:ZPP_ConstraintListener;
      
      public var body:ZPP_BodyListener;
      
      public function ZPP_Listener()
      {
         // method body index: 5232 method index: 5610
         if(Boot.skip_constructor)
         {
            return;
         }
         space = null;
         interaction = null;
         constraint = null;
         body = null;
         precedence = 0;
         event = 0;
         type = 0;
         id = 0;
         outer = null;
         id = ZPP_ID.Listener();
      }
      
      public static function setlt(param1:ZPP_Listener, param2:ZPP_Listener) : Boolean
      {
         // method body index: 5226 method index: 5616
         return param1.precedence > param2.precedence || param1.precedence == param2.precedence && param1.id > param2.id;
      }
      
      public function swapEvent(param1:int) : void
      {
         // method body index: 5228 method index: 5612
      }
      
      public function removedFromSpace() : void
      {
         // method body index: 5229 method index: 5613
      }
      
      public function invalidate_precedence() : void
      {
         // method body index: 5230 method index: 5614
      }
      
      public function addedToSpace() : void
      {
         // method body index: 5231 method index: 5615
      }
   }
}

