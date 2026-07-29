package nape.geom
{
   import flash.Boot;
   import nape.shape.Shape;
   import zpp_nape.geom.ZPP_ConvexRayResult;
   
   public class RayResult
   {
      
      public var zpp_inner:ZPP_ConvexRayResult;
      
      public function RayResult()
      {
         // method body index: 4542 method index: 4904
         if(Boot.skip_constructor)
         {
            return;
         }
         zpp_inner = null;
         if(!ZPP_ConvexRayResult.§internal§)
         {
            Boot.lastError = new Error();
            throw "Error: RayResult cannot be instantiated derp!";
         }
      }
      
      public function toString() : String
      {
         // method body index: 4536 method index: 4906
         if(zpp_inner.next != null)
         {
            Boot.lastError = new Error();
            throw "Error: This object has been disposed of and cannot be used";
         }
         §§push("{ shape: ");
         §§push(Std);
         if(zpp_inner.next != null)
         {
            Boot.lastError = new Error();
            throw "Error: This object has been disposed of and cannot be used";
         }
         §§push(§§pop() + §§pop().string(zpp_inner.shape) + " distance: ");
         if(zpp_inner.next != null)
         {
            Boot.lastError = new Error();
            throw "Error: This object has been disposed of and cannot be used";
         }
         §§push(§§pop() + zpp_inner.toiDistance + " ?inner: ");
         §§push(Std);
         if(zpp_inner.next != null)
         {
            Boot.lastError = new Error();
            throw "Error: This object has been disposed of and cannot be used";
         }
         return §§pop() + §§pop().string(zpp_inner.inner) + " }";
      }
      
      public function get shape() : Shape
      {
         // method body index: 4537 method index: 4907
         if(zpp_inner.next != null)
         {
            Boot.lastError = new Error();
            throw "Error: This object has been disposed of and cannot be used";
         }
         return zpp_inner.shape;
      }
      
      public function get normal() : Vec2
      {
         // method body index: 4538 method index: 4908
         if(zpp_inner.next != null)
         {
            Boot.lastError = new Error();
            throw "Error: This object has been disposed of and cannot be used";
         }
         return zpp_inner.normal;
      }
      
      public function get inner() : Boolean
      {
         // method body index: 4539 method index: 4909
         if(zpp_inner.next != null)
         {
            Boot.lastError = new Error();
            throw "Error: This object has been disposed of and cannot be used";
         }
         return zpp_inner.inner;
      }
      
      public function get distance() : Number
      {
         // method body index: 4540 method index: 4910
         if(zpp_inner.next != null)
         {
            Boot.lastError = new Error();
            throw "Error: This object has been disposed of and cannot be used";
         }
         return zpp_inner.toiDistance;
      }
      
      public function dispose() : void
      {
         // method body index: 4541 method index: 4912
         if(zpp_inner.next != null)
         {
            Boot.lastError = new Error();
            throw "Error: This object has been disposed of and cannot be used";
         }
         zpp_inner.free();
      }
   }
}

