package nape.constraint
{
   import flash.Boot;
   import nape.callbacks.CbTypeList;
   import nape.geom.MatMN;
   import nape.geom.Vec3;
   import nape.phys.Body;
   import nape.phys.Compound;
   import nape.space.Space;
   import zpp_nape.callbacks.ZPP_CbType;
   import zpp_nape.constraint.ZPP_Constraint;
   import zpp_nape.phys.ZPP_Compound;
   import zpp_nape.space.ZPP_Component;
   import zpp_nape.space.ZPP_Space;
   
   public class Constraint
   {
      
      public var zpp_inner:ZPP_Constraint;
      
      public var debugDraw:Boolean;
      
      public function Constraint()
      {
         // method body index: 3811 method index: 4099
         if(Boot.skip_constructor)
         {
            return;
         }
         debugDraw = true;
         zpp_inner.insert_cbtype(ZPP_CbType.ANY_CONSTRAINT.zpp_inner);
         Boot.lastError = new Error();
         throw "Error: Constraint cannot be instantiated derp!";
      }
      
      public function visitBodies(param1:Function) : void
      {
         // method body index: 3779 method index: 4101
      }
      
      public function toString() : String
      {
         // method body index: 3780 method index: 4102
         return "{Constraint}";
      }
      
      public function set stiff(param1:Boolean) : Boolean
      {
         // method body index: 3781 method index: 4103
         if(zpp_inner.stiff != param1)
         {
            zpp_inner.stiff = param1;
            zpp_inner.wake();
         }
         return zpp_inner.stiff;
      }
      
      public function set space(param1:Space) : Space
      {
         // method body index: 3782 method index: 4104
         var _loc2_:* = null as ConstraintList;
         if(zpp_inner.compound != null)
         {
            Boot.lastError = new Error();
            throw "Error: Cannot set the space of a Constraint belonging to" + " a Compound, only the root Compound space can be set";
         }
         if((zpp_inner.space == null ? null : zpp_inner.space.outer) != param1)
         {
            if(zpp_inner.component != null)
            {
               zpp_inner.component.woken = false;
            }
            zpp_inner.clearcache();
            if(zpp_inner.space != null)
            {
               zpp_inner.space.outer.zpp_inner.wrap_constraints.remove(this);
            }
            if(param1 != null)
            {
               _loc2_ = param1.zpp_inner.wrap_constraints;
               if(_loc2_.zpp_inner.reverse_flag)
               {
                  _loc2_.push(this);
               }
               else
               {
                  _loc2_.unshift(this);
               }
            }
            else
            {
               zpp_inner.space = null;
            }
         }
         return zpp_inner.space == null ? null : zpp_inner.space.outer;
      }
      
      public function set removeOnBreak(param1:Boolean) : Boolean
      {
         // method body index: 3783 method index: 4105
         zpp_inner.removeOnBreak = param1;
         return zpp_inner.removeOnBreak;
      }
      
      public function set maxForce(param1:Number) : Number
      {
         // method body index: 3784 method index: 4106
         if(param1 != param1)
         {
            Boot.lastError = new Error();
            throw "Error: Constraint::maxForce cannot be NaN";
         }
         if(param1 < 0)
         {
            Boot.lastError = new Error();
            throw "Error: Constraint::maxForce must be >=0";
         }
         if(zpp_inner.maxForce != param1)
         {
            zpp_inner.maxForce = param1;
            zpp_inner.wake();
         }
         return zpp_inner.maxForce;
      }
      
      public function set maxError(param1:Number) : Number
      {
         // method body index: 3785 method index: 4107
         if(param1 != param1)
         {
            Boot.lastError = new Error();
            throw "Error: Constraint::maxError cannot be NaN";
         }
         if(param1 < 0)
         {
            Boot.lastError = new Error();
            throw "Error: Constraint::maxError must be >=0";
         }
         if(zpp_inner.maxError != param1)
         {
            zpp_inner.maxError = param1;
            zpp_inner.wake();
         }
         return zpp_inner.maxError;
      }
      
      public function set ignore(param1:Boolean) : Boolean
      {
         // method body index: 3786 method index: 4108
         if(zpp_inner.ignore != param1)
         {
            zpp_inner.ignore = param1;
            zpp_inner.wake();
         }
         return zpp_inner.ignore;
      }
      
      public function set frequency(param1:Number) : Number
      {
         // method body index: 3787 method index: 4109
         if(param1 != param1)
         {
            Boot.lastError = new Error();
            throw "Error: Constraint::Frequency cannot be NaN";
         }
         if(param1 <= 0)
         {
            Boot.lastError = new Error();
            throw "Error: Constraint::Frequency must be >0";
         }
         if(zpp_inner.frequency != param1)
         {
            zpp_inner.frequency = param1;
            if(!zpp_inner.stiff)
            {
               zpp_inner.wake();
            }
         }
         return zpp_inner.frequency;
      }
      
      public function set damping(param1:Number) : Number
      {
         // method body index: 3788 method index: 4110
         if(param1 != param1)
         {
            Boot.lastError = new Error();
            throw "Error: Constraint::Damping cannot be Nan";
         }
         if(param1 < 0)
         {
            Boot.lastError = new Error();
            throw "Error: Constraint::Damping must be >=0";
         }
         if(zpp_inner.damping != param1)
         {
            zpp_inner.damping = param1;
            if(!zpp_inner.stiff)
            {
               zpp_inner.wake();
            }
         }
         return zpp_inner.damping;
      }
      
      public function set compound(param1:Compound) : Compound
      {
         // method body index: 3789 method index: 4111
         var _loc2_:* = null as ConstraintList;
         if((zpp_inner.compound == null ? null : zpp_inner.compound.outer) != param1)
         {
            if((zpp_inner.compound == null ? null : zpp_inner.compound.outer) != null)
            {
               (zpp_inner.compound == null ? null : zpp_inner.compound.outer).zpp_inner.wrap_constraints.remove(this);
            }
            if(param1 != null)
            {
               _loc2_ = param1.zpp_inner.wrap_constraints;
               if(_loc2_.zpp_inner.reverse_flag)
               {
                  _loc2_.push(this);
               }
               else
               {
                  _loc2_.unshift(this);
               }
            }
         }
         return zpp_inner.compound == null ? null : zpp_inner.compound.outer;
      }
      
      public function set breakUnderForce(param1:Boolean) : Boolean
      {
         // method body index: 3790 method index: 4112
         if(zpp_inner.breakUnderForce != param1)
         {
            zpp_inner.breakUnderForce = param1;
            zpp_inner.wake();
         }
         return zpp_inner.breakUnderForce;
      }
      
      public function set breakUnderError(param1:Boolean) : Boolean
      {
         // method body index: 3791 method index: 4113
         if(zpp_inner.breakUnderError != param1)
         {
            zpp_inner.breakUnderError = param1;
            zpp_inner.wake();
         }
         return zpp_inner.breakUnderError;
      }
      
      public function set active(param1:Boolean) : Boolean
      {
         // method body index: 3792 method index: 4114
         if(zpp_inner.active != param1)
         {
            if(zpp_inner.component != null)
            {
               zpp_inner.component.woken = false;
            }
            zpp_inner.clearcache();
            if(param1)
            {
               zpp_inner.active = param1;
               zpp_inner.activate();
               if(zpp_inner.space != null)
               {
                  if(zpp_inner.component != null)
                  {
                     zpp_inner.component.sleeping = true;
                  }
                  zpp_inner.space.wake_constraint(zpp_inner,true);
               }
            }
            else
            {
               if(zpp_inner.space != null)
               {
                  zpp_inner.wake();
                  zpp_inner.space.live_constraints.remove(zpp_inner);
               }
               zpp_inner.active = param1;
               zpp_inner.deactivate();
            }
         }
         return zpp_inner.active;
      }
      
      public function impulse() : MatMN
      {
         // method body index: 3793 method index: 4115
         return null;
      }
      
      public function get userData() : *
      {
         // method body index: 3794 method index: 4116
         if(zpp_inner.userData == null)
         {
            zpp_inner.userData = {};
         }
         return zpp_inner.userData;
      }
      
      public function get stiff() : Boolean
      {
         // method body index: 3795 method index: 4117
         return zpp_inner.stiff;
      }
      
      public function get space() : Space
      {
         // method body index: 3796 method index: 4118
         return zpp_inner.space == null ? null : zpp_inner.space.outer;
      }
      
      public function get removeOnBreak() : Boolean
      {
         // method body index: 3797 method index: 4119
         return zpp_inner.removeOnBreak;
      }
      
      public function get maxForce() : Number
      {
         // method body index: 3798 method index: 4120
         return zpp_inner.maxForce;
      }
      
      public function get maxError() : Number
      {
         // method body index: 3799 method index: 4121
         return zpp_inner.maxError;
      }
      
      public function get isSleeping() : Boolean
      {
         // method body index: 3800 method index: 4122
         if(zpp_inner.space == null || !zpp_inner.active)
         {
            Boot.lastError = new Error();
            throw "Error: isSleeping only makes sense if constraint is" + " active and inside a space";
         }
         return zpp_inner.component.sleeping;
      }
      
      public function get ignore() : Boolean
      {
         // method body index: 3801 method index: 4123
         return zpp_inner.ignore;
      }
      
      public function get frequency() : Number
      {
         // method body index: 3802 method index: 4124
         return zpp_inner.frequency;
      }
      
      public function get damping() : Number
      {
         // method body index: 3803 method index: 4125
         return zpp_inner.damping;
      }
      
      public function get compound() : Compound
      {
         // method body index: 3804 method index: 4126
         return zpp_inner.compound == null ? null : zpp_inner.compound.outer;
      }
      
      public function get cbTypes() : CbTypeList
      {
         // method body index: 3805 method index: 4127
         if(zpp_inner.wrap_cbTypes == null)
         {
            zpp_inner.setupcbTypes();
         }
         return zpp_inner.wrap_cbTypes;
      }
      
      public function get breakUnderForce() : Boolean
      {
         // method body index: 3806 method index: 4128
         return zpp_inner.breakUnderForce;
      }
      
      public function get breakUnderError() : Boolean
      {
         // method body index: 3807 method index: 4129
         return zpp_inner.breakUnderError;
      }
      
      public function get active() : Boolean
      {
         // method body index: 3808 method index: 4130
         return zpp_inner.active;
      }
      
      public function copy() : Constraint
      {
         // method body index: 3809 method index: 4131
         return zpp_inner.copy();
      }
      
      public function bodyImpulse(param1:Body) : Vec3
      {
         // method body index: 3810 method index: 4132
         return null;
      }
   }
}

