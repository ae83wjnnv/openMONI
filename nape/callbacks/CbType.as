package nape.callbacks
{
   import flash.Boot;
   import nape.constraint.ConstraintList;
   import nape.phys.InteractorList;
   import zpp_nape.callbacks.ZPP_CbType;
   import zpp_nape.util.ZPP_ConstraintList;
   import zpp_nape.util.ZPP_InteractorList;
   
   public final class CbType
   {
      
      public var zpp_inner:ZPP_CbType;
      
      public function CbType()
      {
         // method body index: 5337 method index: 5726
         if(Boot.skip_constructor)
         {
            return;
         }
         zpp_inner = null;
         zpp_inner = new ZPP_CbType();
         zpp_inner.outer = this;
      }
      
      public static function get ANY_BODY() : CbType
      {
         // method body index: 5325 method index: 5735
         return ZPP_CbType.ANY_BODY;
      }
      
      public static function get ANY_CONSTRAINT() : CbType
      {
         // method body index: 5326 method index: 5736
         return ZPP_CbType.ANY_CONSTRAINT;
      }
      
      public static function get ANY_SHAPE() : CbType
      {
         // method body index: 5327 method index: 5737
         return ZPP_CbType.ANY_SHAPE;
      }
      
      public static function get ANY_COMPOUND() : CbType
      {
         // method body index: 5328 method index: 5738
         return ZPP_CbType.ANY_COMPOUND;
      }
      
      public function toString() : String
      {
         // method body index: 5330 method index: 5728
         return this == ZPP_CbType.ANY_BODY ? "ANY_BODY" : (this == ZPP_CbType.ANY_SHAPE ? "ANY_SHAPE" : (this == ZPP_CbType.ANY_COMPOUND ? "ANY_COMPOUND" : (this == ZPP_CbType.ANY_CONSTRAINT ? "ANY_CONSTRAINT" : "CbType#" + zpp_inner.id)));
      }
      
      public function including(param1:*) : OptionType
      {
         // method body index: 5331 method index: 5729
         return new OptionType(this).including(param1);
      }
      
      public function get userData() : *
      {
         // method body index: 5332 method index: 5730
         if(zpp_inner.userData == null)
         {
            zpp_inner.userData = {};
         }
         return zpp_inner.userData;
      }
      
      public function get interactors() : InteractorList
      {
         // method body index: 5333 method index: 5731
         if(zpp_inner.wrap_interactors == null)
         {
            zpp_inner.wrap_interactors = ZPP_InteractorList.get(zpp_inner.interactors,true);
         }
         return zpp_inner.wrap_interactors;
      }
      
      public function get id() : int
      {
         // method body index: 5334 method index: 5732
         return zpp_inner.id;
      }
      
      public function get constraints() : ConstraintList
      {
         // method body index: 5335 method index: 5733
         if(zpp_inner.wrap_constraints == null)
         {
            zpp_inner.wrap_constraints = ZPP_ConstraintList.get(zpp_inner.constraints,true);
         }
         return zpp_inner.wrap_constraints;
      }
      
      public function excluding(param1:*) : OptionType
      {
         // method body index: 5336 method index: 5734
         return new OptionType(this).excluding(param1);
      }
   }
}

