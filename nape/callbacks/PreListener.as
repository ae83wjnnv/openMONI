package nape.callbacks
{
   import flash.Boot;
   import zpp_nape.callbacks.ZPP_InteractionListener;
   import zpp_nape.callbacks.ZPP_Listener;
   import zpp_nape.callbacks.ZPP_OptionType;
   import zpp_nape.util.ZPP_Flags;
   
   public final class PreListener extends Listener
   {
      
      public var zpp_inner_zn:ZPP_InteractionListener;
      
      public function PreListener(param1:InteractionType, param2:*, param3:*, param4:Function, param5:int = 0, param6:Boolean = false)
      {
         // method body index: 6561 method index: 7096
         var _loc7_:int = 0;
         if(Boot.skip_constructor)
         {
            return;
         }
         zpp_inner_zn = null;
         ZPP_Listener.§internal§ = true;
         super();
         ZPP_Listener.§internal§ = false;
         if(param4 == null)
         {
            Boot.lastError = new Error();
            throw "Error: PreListener must take a handler!";
         }
         zpp_inner_zn = new ZPP_InteractionListener(ZPP_OptionType.argument(param2),ZPP_OptionType.argument(param3),ZPP_Flags.id_CbEvent_PRE,ZPP_Flags.id_ListenerType_PRE);
         zpp_inner = zpp_inner_zn;
         zpp_inner.outer = this;
         zpp_inner_zn.outer_znp = this;
         zpp_inner.precedence = param5;
         zpp_inner_zn.pure = param6;
         zpp_inner_zn.handlerp = param4;
         if(param1 == null)
         {
            Boot.lastError = new Error();
            throw "Error: Cannot set listener interaction type to null";
         }
         _loc7_ = zpp_inner_zn.itype;
         if(_loc7_ == ZPP_Flags.id_InteractionType_COLLISION)
         {
            if(ZPP_Flags.InteractionType_COLLISION == null)
            {
               ZPP_Flags.§internal§ = true;
               ZPP_Flags.InteractionType_COLLISION = new InteractionType();
               ZPP_Flags.§internal§ = false;
            }
            §§push(ZPP_Flags.InteractionType_COLLISION);
         }
         else if(_loc7_ == ZPP_Flags.id_InteractionType_SENSOR)
         {
            if(ZPP_Flags.InteractionType_SENSOR == null)
            {
               ZPP_Flags.§internal§ = true;
               ZPP_Flags.InteractionType_SENSOR = new InteractionType();
               ZPP_Flags.§internal§ = false;
            }
            §§push(ZPP_Flags.InteractionType_SENSOR);
         }
         else if(_loc7_ == ZPP_Flags.id_InteractionType_FLUID)
         {
            if(ZPP_Flags.InteractionType_FLUID == null)
            {
               ZPP_Flags.§internal§ = true;
               ZPP_Flags.InteractionType_FLUID = new InteractionType();
               ZPP_Flags.§internal§ = false;
            }
            §§push(ZPP_Flags.InteractionType_FLUID);
         }
         else if(_loc7_ == ZPP_Flags.id_InteractionType_ANY)
         {
            if(ZPP_Flags.InteractionType_ANY == null)
            {
               ZPP_Flags.§internal§ = true;
               ZPP_Flags.InteractionType_ANY = new InteractionType();
               ZPP_Flags.§internal§ = false;
            }
            §§push(ZPP_Flags.InteractionType_ANY);
         }
         else
         {
            §§push(null);
         }
         if(§§pop() != param1)
         {
            §§push(param1);
            if(ZPP_Flags.InteractionType_COLLISION == null)
            {
               ZPP_Flags.§internal§ = true;
               ZPP_Flags.InteractionType_COLLISION = new InteractionType();
               ZPP_Flags.§internal§ = false;
            }
            if(§§pop() == ZPP_Flags.InteractionType_COLLISION)
            {
               §§push(ZPP_Flags.id_InteractionType_COLLISION);
            }
            else
            {
               §§push(param1);
               if(ZPP_Flags.InteractionType_SENSOR == null)
               {
                  ZPP_Flags.§internal§ = true;
                  ZPP_Flags.InteractionType_SENSOR = new InteractionType();
                  ZPP_Flags.§internal§ = false;
               }
               if(§§pop() == ZPP_Flags.InteractionType_SENSOR)
               {
                  §§push(ZPP_Flags.id_InteractionType_SENSOR);
               }
               else
               {
                  §§push(param1);
                  if(ZPP_Flags.InteractionType_FLUID == null)
                  {
                     ZPP_Flags.§internal§ = true;
                     ZPP_Flags.InteractionType_FLUID = new InteractionType();
                     ZPP_Flags.§internal§ = false;
                  }
                  §§push(§§pop() == ZPP_Flags.InteractionType_FLUID ? ZPP_Flags.id_InteractionType_FLUID : ZPP_Flags.id_InteractionType_ANY);
               }
            }
            _loc7_ = §§pop();
            zpp_inner_zn.itype = _loc7_;
         }
         _loc7_ = zpp_inner_zn.itype;
         if(_loc7_ == ZPP_Flags.id_InteractionType_COLLISION)
         {
            if(ZPP_Flags.InteractionType_COLLISION == null)
            {
               ZPP_Flags.§internal§ = true;
               ZPP_Flags.InteractionType_COLLISION = new InteractionType();
               ZPP_Flags.§internal§ = false;
            }
            ZPP_Flags.InteractionType_COLLISION;
         }
         else if(_loc7_ == ZPP_Flags.id_InteractionType_SENSOR)
         {
            if(ZPP_Flags.InteractionType_SENSOR == null)
            {
               ZPP_Flags.§internal§ = true;
               ZPP_Flags.InteractionType_SENSOR = new InteractionType();
               ZPP_Flags.§internal§ = false;
            }
            ZPP_Flags.InteractionType_SENSOR;
         }
         else if(_loc7_ == ZPP_Flags.id_InteractionType_FLUID)
         {
            if(ZPP_Flags.InteractionType_FLUID == null)
            {
               ZPP_Flags.§internal§ = true;
               ZPP_Flags.InteractionType_FLUID = new InteractionType();
               ZPP_Flags.§internal§ = false;
            }
            ZPP_Flags.InteractionType_FLUID;
         }
         else if(_loc7_ == ZPP_Flags.id_InteractionType_ANY)
         {
            if(ZPP_Flags.InteractionType_ANY == null)
            {
               ZPP_Flags.§internal§ = true;
               ZPP_Flags.InteractionType_ANY = new InteractionType();
               ZPP_Flags.§internal§ = false;
            }
            ZPP_Flags.InteractionType_ANY;
         }
         else
         {
            null;
         }
      }
      
      public function set pure(param1:Boolean) : Boolean
      {
         // method body index: 6551 method index: 7098
         if(!param1)
         {
            zpp_inner_zn.wake();
         }
         zpp_inner_zn.pure = param1;
         return zpp_inner_zn.pure;
      }
      
      public function set options2(param1:OptionType) : OptionType
      {
         // method body index: 6552 method index: 7099
         zpp_inner_zn.options2.set(param1.zpp_inner);
         return zpp_inner_zn.options2.outer;
      }
      
      public function set options1(param1:OptionType) : OptionType
      {
         // method body index: 6553 method index: 7100
         zpp_inner_zn.options1.set(param1.zpp_inner);
         return zpp_inner_zn.options1.outer;
      }
      
      public function set interactionType(param1:InteractionType) : InteractionType
      {
         // method body index: 6554 method index: 7101
         var _loc2_:int = 0;
         if(param1 == null)
         {
            Boot.lastError = new Error();
            throw "Error: Cannot set listener interaction type to null";
         }
         _loc2_ = zpp_inner_zn.itype;
         if(_loc2_ == ZPP_Flags.id_InteractionType_COLLISION)
         {
            if(ZPP_Flags.InteractionType_COLLISION == null)
            {
               ZPP_Flags.§internal§ = true;
               ZPP_Flags.InteractionType_COLLISION = new InteractionType();
               ZPP_Flags.§internal§ = false;
            }
            §§push(ZPP_Flags.InteractionType_COLLISION);
         }
         else if(_loc2_ == ZPP_Flags.id_InteractionType_SENSOR)
         {
            if(ZPP_Flags.InteractionType_SENSOR == null)
            {
               ZPP_Flags.§internal§ = true;
               ZPP_Flags.InteractionType_SENSOR = new InteractionType();
               ZPP_Flags.§internal§ = false;
            }
            §§push(ZPP_Flags.InteractionType_SENSOR);
         }
         else if(_loc2_ == ZPP_Flags.id_InteractionType_FLUID)
         {
            if(ZPP_Flags.InteractionType_FLUID == null)
            {
               ZPP_Flags.§internal§ = true;
               ZPP_Flags.InteractionType_FLUID = new InteractionType();
               ZPP_Flags.§internal§ = false;
            }
            §§push(ZPP_Flags.InteractionType_FLUID);
         }
         else if(_loc2_ == ZPP_Flags.id_InteractionType_ANY)
         {
            if(ZPP_Flags.InteractionType_ANY == null)
            {
               ZPP_Flags.§internal§ = true;
               ZPP_Flags.InteractionType_ANY = new InteractionType();
               ZPP_Flags.§internal§ = false;
            }
            §§push(ZPP_Flags.InteractionType_ANY);
         }
         else
         {
            §§push(null);
         }
         if(§§pop() != param1)
         {
            §§push(param1);
            if(ZPP_Flags.InteractionType_COLLISION == null)
            {
               ZPP_Flags.§internal§ = true;
               ZPP_Flags.InteractionType_COLLISION = new InteractionType();
               ZPP_Flags.§internal§ = false;
            }
            if(§§pop() == ZPP_Flags.InteractionType_COLLISION)
            {
               §§push(ZPP_Flags.id_InteractionType_COLLISION);
            }
            else
            {
               §§push(param1);
               if(ZPP_Flags.InteractionType_SENSOR == null)
               {
                  ZPP_Flags.§internal§ = true;
                  ZPP_Flags.InteractionType_SENSOR = new InteractionType();
                  ZPP_Flags.§internal§ = false;
               }
               if(§§pop() == ZPP_Flags.InteractionType_SENSOR)
               {
                  §§push(ZPP_Flags.id_InteractionType_SENSOR);
               }
               else
               {
                  §§push(param1);
                  if(ZPP_Flags.InteractionType_FLUID == null)
                  {
                     ZPP_Flags.§internal§ = true;
                     ZPP_Flags.InteractionType_FLUID = new InteractionType();
                     ZPP_Flags.§internal§ = false;
                  }
                  §§push(§§pop() == ZPP_Flags.InteractionType_FLUID ? ZPP_Flags.id_InteractionType_FLUID : ZPP_Flags.id_InteractionType_ANY);
               }
            }
            _loc2_ = §§pop();
            zpp_inner_zn.itype = _loc2_;
         }
         _loc2_ = zpp_inner_zn.itype;
         if(_loc2_ == ZPP_Flags.id_InteractionType_COLLISION)
         {
            if(ZPP_Flags.InteractionType_COLLISION == null)
            {
               ZPP_Flags.§internal§ = true;
               ZPP_Flags.InteractionType_COLLISION = new InteractionType();
               ZPP_Flags.§internal§ = false;
            }
            return ZPP_Flags.InteractionType_COLLISION;
         }
         else if(_loc2_ == ZPP_Flags.id_InteractionType_SENSOR)
         {
            if(ZPP_Flags.InteractionType_SENSOR == null)
            {
               ZPP_Flags.§internal§ = true;
               ZPP_Flags.InteractionType_SENSOR = new InteractionType();
               ZPP_Flags.§internal§ = false;
            }
            return ZPP_Flags.InteractionType_SENSOR;
         }
         else if(_loc2_ == ZPP_Flags.id_InteractionType_FLUID)
         {
            if(ZPP_Flags.InteractionType_FLUID == null)
            {
               ZPP_Flags.§internal§ = true;
               ZPP_Flags.InteractionType_FLUID = new InteractionType();
               ZPP_Flags.§internal§ = false;
            }
            return ZPP_Flags.InteractionType_FLUID;
         }
         else if(_loc2_ == ZPP_Flags.id_InteractionType_ANY)
         {
            if(ZPP_Flags.InteractionType_ANY == null)
            {
               ZPP_Flags.§internal§ = true;
               ZPP_Flags.InteractionType_ANY = new InteractionType();
               ZPP_Flags.§internal§ = false;
            }
            return ZPP_Flags.InteractionType_ANY;
         }
         else
         {
            return null;
         }
      }
      
      public function set handler(param1:Function) : Function
      {
         // method body index: 6555 method index: 7102
         if(param1 == null)
         {
            Boot.lastError = new Error();
            throw "Error: PreListener must take a non-null handler!";
         }
         zpp_inner_zn.handlerp = param1;
         zpp_inner_zn.wake();
         return zpp_inner_zn.handlerp;
      }
      
      public function get pure() : Boolean
      {
         // method body index: 6556 method index: 7103
         return zpp_inner_zn.pure;
      }
      
      public function get options2() : OptionType
      {
         // method body index: 6557 method index: 7104
         return zpp_inner_zn.options2.outer;
      }
      
      public function get options1() : OptionType
      {
         // method body index: 6558 method index: 7105
         return zpp_inner_zn.options1.outer;
      }
      
      public function get interactionType() : InteractionType
      {
         // method body index: 6559 method index: 7106
         var _loc1_:int = zpp_inner_zn.itype;
         if(_loc1_ == ZPP_Flags.id_InteractionType_COLLISION)
         {
            if(ZPP_Flags.InteractionType_COLLISION == null)
            {
               ZPP_Flags.§internal§ = true;
               ZPP_Flags.InteractionType_COLLISION = new InteractionType();
               ZPP_Flags.§internal§ = false;
            }
            return ZPP_Flags.InteractionType_COLLISION;
         }
         else if(_loc1_ == ZPP_Flags.id_InteractionType_SENSOR)
         {
            if(ZPP_Flags.InteractionType_SENSOR == null)
            {
               ZPP_Flags.§internal§ = true;
               ZPP_Flags.InteractionType_SENSOR = new InteractionType();
               ZPP_Flags.§internal§ = false;
            }
            return ZPP_Flags.InteractionType_SENSOR;
         }
         else if(_loc1_ == ZPP_Flags.id_InteractionType_FLUID)
         {
            if(ZPP_Flags.InteractionType_FLUID == null)
            {
               ZPP_Flags.§internal§ = true;
               ZPP_Flags.InteractionType_FLUID = new InteractionType();
               ZPP_Flags.§internal§ = false;
            }
            return ZPP_Flags.InteractionType_FLUID;
         }
         else if(_loc1_ == ZPP_Flags.id_InteractionType_ANY)
         {
            if(ZPP_Flags.InteractionType_ANY == null)
            {
               ZPP_Flags.§internal§ = true;
               ZPP_Flags.InteractionType_ANY = new InteractionType();
               ZPP_Flags.§internal§ = false;
            }
            return ZPP_Flags.InteractionType_ANY;
         }
         else
         {
            return null;
         }
      }
      
      public function get handler() : Function
      {
         // method body index: 6560 method index: 7107
         return zpp_inner_zn.handlerp;
      }
   }
}

