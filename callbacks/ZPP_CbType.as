package zpp_nape.callbacks
{
   import flash.Boot;
   import nape.callbacks.CbType;
   import nape.constraint.ConstraintList;
   import nape.phys.InteractorList;
   import zpp_nape.ZPP_ID;
   import zpp_nape.constraint.ZPP_Constraint;
   import zpp_nape.phys.ZPP_Interactor;
   import zpp_nape.util.ZNPList_ZPP_BodyListener;
   import zpp_nape.util.ZNPList_ZPP_CbSet;
   import zpp_nape.util.ZNPList_ZPP_Constraint;
   import zpp_nape.util.ZNPList_ZPP_ConstraintListener;
   import zpp_nape.util.ZNPList_ZPP_InteractionListener;
   import zpp_nape.util.ZNPList_ZPP_Interactor;
   
   public class ZPP_CbType
   {
      
      // method body index: 4213 method index: 4550
      public static var ANY_SHAPE:nape.callbacks.CbType = // method body index: 4218 method index: 4565
      new nape.callbacks.CbType();
      
      public static var ANY_BODY:nape.callbacks.CbType = // method body index: 4218 method index: 4565
      new nape.callbacks.CbType();
      
      public static var ANY_COMPOUND:nape.callbacks.CbType = // method body index: 4218 method index: 4565
      new nape.callbacks.CbType();
      
      public static var ANY_CONSTRAINT:nape.callbacks.CbType = // method body index: 4218 method index: 4565
      new nape.callbacks.CbType();
      
      public var wrap_interactors:InteractorList;
      
      public var wrap_constraints:ConstraintList;
      
      public var userData:*;
      
      public var outer:nape.callbacks.CbType;
      
      public var listeners:ZNPList_ZPP_InteractionListener;
      
      public var interactors:ZNPList_ZPP_Interactor;
      
      public var id:int;
      
      public var constraints:ZNPList_ZPP_Constraint;
      
      public var conlisteners:ZNPList_ZPP_ConstraintListener;
      
      public var cbsets:ZNPList_ZPP_CbSet;
      
      public var bodylisteners:ZNPList_ZPP_BodyListener;
      
      public function ZPP_CbType()
      {
         // method body index: 4217 method index: 4549
         if(Boot.skip_constructor)
         {
            return;
         }
         conlisteners = null;
         bodylisteners = null;
         listeners = null;
         cbsets = null;
         id = 0;
         userData = null;
         outer = null;
         id = ZPP_ID.CbType();
         listeners = new ZNPList_ZPP_InteractionListener();
         bodylisteners = new ZNPList_ZPP_BodyListener();
         conlisteners = new ZNPList_ZPP_ConstraintListener();
         constraints = new ZNPList_ZPP_Constraint();
         interactors = new ZNPList_ZPP_Interactor();
         cbsets = new ZNPList_ZPP_CbSet();
      }
      
      public static function setlt(param1:ZPP_CbType, param2:ZPP_CbType) : Boolean
      {
         // method body index: 4212 method index: 4564
         return param1.id < param2.id;
      }
      
      public function remInteractor(param1:ZPP_Interactor) : void
      {
         // method body index: 4214 method index: 4554
         interactors.remove(param1);
      }
      
      public function remConstraint(param1:ZPP_Constraint) : void
      {
         // method body index: 4215 method index: 4555
         constraints.remove(param1);
      }
      
      public function addInteractor(param1:ZPP_Interactor) : void
      {
         // method body index: 4216 method index: 4562
         interactors.add(param1);
      }
   }
}

import nape.callbacks.§nape.callbacks.CbType§;

