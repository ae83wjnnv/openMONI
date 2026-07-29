package zpp_nape.geom
{
   import flash.Boot;
   
   public class ZPP_MarchSpan
   {
      
      // method body index: 3688 method index: 3994
      public static var zpp_pool:ZPP_MarchSpan = // method body index: 3690 method index: 3997
      null;
      
      public var rank:int;
      
      public var parent:ZPP_MarchSpan;
      
      public var out:Boolean;
      
      public var next:ZPP_MarchSpan;
      
      public function ZPP_MarchSpan()
      {
         // method body index: 3689 method index: 3993
         if(Boot.skip_constructor)
         {
            return;
         }
         next = null;
         out = false;
         rank = 0;
         parent = null;
         parent = this;
      }
   }
}

