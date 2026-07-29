package nape.callbacks
{
   import flash.Boot;
   import nape.dynamics.Arbiter;
   import nape.phys.Interactor;
   
   public final class PreCallback extends Callback
   {
      
      public function PreCallback()
      {
         // method body index: 6167 method index: 6664
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
      }
      
      override public function toString() : String
      {
         // method body index: 6162 method index: 6666
         var _loc1_:String = "Cb:PRE:";
         _loc1_ += ":" + zpp_inner.int1.outer_i.toString() + "/" + zpp_inner.int2.outer_i.toString();
         _loc1_ += " : " + zpp_inner.pre_arbiter.wrapper().toString();
         return _loc1_ + (" : listnener: " + Std.string(zpp_inner.listener.outer));
      }
      
      public function get swapped() : Boolean
      {
         // method body index: 6163 method index: 6667
         return zpp_inner.pre_swapped;
      }
      
      public function get int2() : Interactor
      {
         // method body index: 6164 method index: 6668
         return zpp_inner.int2.outer_i;
      }
      
      public function get int1() : Interactor
      {
         // method body index: 6165 method index: 6669
         return zpp_inner.int1.outer_i;
      }
      
      public function get arbiter() : Arbiter
      {
         // method body index: 6166 method index: 6670
         return zpp_inner.pre_arbiter.wrapper();
      }
   }
}

