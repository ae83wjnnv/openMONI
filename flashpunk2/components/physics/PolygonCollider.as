package flashpunk2.components.physics
{
   import nape.geom.Vec2;
   import nape.shape.Polygon;
   
   public class PolygonCollider extends Collider
   {
      
      public function PolygonCollider(param1:Vector.<Vec2>, param2:Boolean = true)
      {
         // method body index: 6526 method index: 7071
         super(new Polygon(param1),param2);
      }
   }
}

