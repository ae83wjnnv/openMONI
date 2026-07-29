package zpp_nape.space
{
   import flash.Boot;
   import zpp_nape.dynamics.ZPP_Arbiter;
   
   public class ZPP_AABBPair
   {
      
      // method body index: 3478 method index: 3733
      public static var zpp_pool:ZPP_AABBPair = // method body index: 3480 method index: 3736
      null;
      
      public var sleeping:Boolean;
      
      public var next:ZPP_AABBPair;
      
      public var n2:ZPP_AABBNode;
      
      public var n1:ZPP_AABBNode;
      
      public var id:int;
      
      public var first:Boolean;
      
      public var di:int;
      
      public var arb:ZPP_Arbiter;
      
      public function ZPP_AABBPair()
      {
         // method body index: 3479 method index: 3732
         if(Boot.skip_constructor)
         {
            return;
         }
         next = null;
         arb = null;
         di = 0;
         id = 0;
         sleeping = false;
         first = false;
         n2 = null;
         n1 = null;
      }
   }
}

