package zpp_nape.geom
{
   import flash.Boot;
   import nape.geom.GeomPoly;
   
   public class ZPP_GeomPoly
   {
      
      public var vertices:ZPP_GeomVert;
      
      public var outer:GeomPoly;
      
      public function ZPP_GeomPoly(param1:GeomPoly = undefined)
      {
         // method body index: 5051 method index: 5420
         if(Boot.skip_constructor)
         {
            return;
         }
         vertices = null;
         outer = null;
         outer = param1;
      }
   }
}

