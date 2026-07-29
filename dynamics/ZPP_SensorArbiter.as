package zpp_nape.dynamics
{
   import flash.Boot;
   
   public class ZPP_SensorArbiter extends ZPP_Arbiter
   {
      
      // method body index: 3105 method index: 3232
      public static var zpp_pool:ZPP_SensorArbiter = // method body index: 3107 method index: 3239
      null;
      
      public var next:ZPP_SensorArbiter;
      
      public function ZPP_SensorArbiter()
      {
         // method body index: 3106 method index: 3231
         if(Boot.skip_constructor)
         {
            return;
         }
         next = null;
         super();
         type = ZPP_Arbiter.SENSOR;
         sensorarb = this;
      }
   }
}

