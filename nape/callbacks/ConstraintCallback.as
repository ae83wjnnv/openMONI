package nape.callbacks
{
   import flash.Boot;
   import nape.constraint.Constraint;
   import zpp_nape.util.ZPP_Flags;
   
   public final class ConstraintCallback extends Callback
   {
      
      public function ConstraintCallback()
      {
         // method body index: 5935 method index: 6396
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
      }
      
      override public function toString() : String
      {
         // method body index: 5933 method index: 6398
         var _loc1_:String = "Cb:";
         _loc1_ += ["WAKE","SLEEP","BREAK"][zpp_inner.event - ZPP_Flags.id_CbEvent_WAKE];
         _loc1_ += ":" + zpp_inner.constraint.outer.toString();
         return _loc1_ + (" : listener: " + Std.string(zpp_inner.listener.outer));
      }
      
      public function get constraint() : Constraint
      {
         // method body index: 5934 method index: 6399
         return zpp_inner.constraint.outer;
      }
   }
}

