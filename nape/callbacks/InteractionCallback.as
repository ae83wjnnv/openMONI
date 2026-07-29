package nape.callbacks
{
   import flash.Boot;
   import nape.dynamics.ArbiterList;
   import nape.phys.Interactor;
   
   public final class InteractionCallback extends Callback
   {
      
      public function InteractionCallback()
      {
         // method body index: 5930 method index: 6389
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
      }
      
      override public function toString() : String
      {
         // method body index: 5926 method index: 6391
         var _loc1_:String = "Cb:";
         _loc1_ += ["BEGIN","END","","","","","ONGOING"][zpp_inner.event];
         _loc1_ += ":" + zpp_inner.int1.outer_i.toString() + "/" + zpp_inner.int2.outer_i.toString();
         _loc1_ += " : " + zpp_inner.wrap_arbiters.toString();
         return _loc1_ + (" : listener: " + Std.string(zpp_inner.listener.outer));
      }
      
      public function get int2() : Interactor
      {
         // method body index: 5927 method index: 6392
         return zpp_inner.int2.outer_i;
      }
      
      public function get int1() : Interactor
      {
         // method body index: 5928 method index: 6393
         return zpp_inner.int1.outer_i;
      }
      
      public function get arbiters() : ArbiterList
      {
         // method body index: 5929 method index: 6394
         return zpp_inner.wrap_arbiters;
      }
   }
}

