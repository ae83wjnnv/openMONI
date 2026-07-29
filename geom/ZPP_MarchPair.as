package zpp_nape.geom
{
   import flash.Boot;
   
   public class ZPP_MarchPair
   {
      
      // method body index: 3111 method index: 3247
      public static var zpp_pool:ZPP_MarchPair = // method body index: 3113 method index: 3250
      null;
      
      public var spanr:ZPP_MarchSpan;
      
      public var span2:ZPP_MarchSpan;
      
      public var span1:ZPP_MarchSpan;
      
      public var pr:ZPP_GeomVert;
      
      public var pd:ZPP_GeomVert;
      
      public var p2:ZPP_GeomVert;
      
      public var p1:ZPP_GeomVert;
      
      public var okeyr:int;
      
      public var okey2:int;
      
      public var okey1:int;
      
      public var next:ZPP_MarchPair;
      
      public var keyr:int;
      
      public var key2:int;
      
      public var key1:int;
      
      public function ZPP_MarchPair()
      {
         // method body index: 3112 method index: 3246
         if(Boot.skip_constructor)
         {
            return;
         }
         next = null;
         spanr = null;
         span2 = null;
         span1 = null;
         pd = null;
         okeyr = 0;
         keyr = 0;
         pr = null;
         okey2 = 0;
         key2 = 0;
         p2 = null;
         okey1 = 0;
         key1 = 0;
         p1 = null;
      }
   }
}

