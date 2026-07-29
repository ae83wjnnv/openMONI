package nape.phys
{
   import flash.Boot;
   import nape.callbacks.CbTypeList;
   import nape.dynamics.InteractionGroup;
   import nape.shape.Shape;
   import zpp_nape.dynamics.ZPP_InteractionGroup;
   import zpp_nape.phys.ZPP_Body;
   import zpp_nape.phys.ZPP_Compound;
   import zpp_nape.phys.ZPP_Interactor;
   import zpp_nape.shape.ZPP_Shape;
   
   public class Interactor
   {
      
      public var zpp_inner_i:ZPP_Interactor;
      
      public function Interactor()
      {
         // method body index: 2011 method index: 2001
         if(Boot.skip_constructor)
         {
            return;
         }
         zpp_inner_i = null;
         Boot.lastError = new Error();
         throw "Error: Cannot instantiate an Interactor, only Shape/Body/Compound";
      }
      
      public function toString() : String
      {
         // method body index: 1999 method index: 2003
         return "";
      }
      
      public function set group(param1:InteractionGroup) : InteractionGroup
      {
         // method body index: 2000 method index: 2004
         zpp_inner_i.immutable_midstep("Interactor::group");
         zpp_inner_i.setGroup(param1 == null ? null : param1.zpp_inner);
         return zpp_inner_i.group == null ? null : zpp_inner_i.group.outer;
      }
      
      public function isShape() : Boolean
      {
         // method body index: 2001 method index: 2005
         return zpp_inner_i.ishape != null;
      }
      
      public function isCompound() : Boolean
      {
         // method body index: 2002 method index: 2006
         return zpp_inner_i.icompound != null;
      }
      
      public function isBody() : Boolean
      {
         // method body index: 2003 method index: 2007
         return zpp_inner_i.ibody != null;
      }
      
      public function get userData() : *
      {
         // method body index: 2004 method index: 2008
         if(zpp_inner_i.userData == null)
         {
            zpp_inner_i.userData = {};
         }
         return zpp_inner_i.userData;
      }
      
      public function get id() : int
      {
         // method body index: 2005 method index: 2009
         return zpp_inner_i.id;
      }
      
      public function get group() : InteractionGroup
      {
         // method body index: 2006 method index: 2010
         return zpp_inner_i.group == null ? null : zpp_inner_i.group.outer;
      }
      
      public function get cbTypes() : CbTypeList
      {
         // method body index: 2007 method index: 2011
         if(zpp_inner_i.wrap_cbTypes == null)
         {
            zpp_inner_i.setupcbTypes();
         }
         return zpp_inner_i.wrap_cbTypes;
      }
      
      public function get castShape() : Shape
      {
         // method body index: 2008 method index: 2012
         return zpp_inner_i.ishape != null ? zpp_inner_i.ishape.outer : null;
      }
      
      public function get castCompound() : Compound
      {
         // method body index: 2009 method index: 2013
         return zpp_inner_i.icompound != null ? zpp_inner_i.icompound.outer : null;
      }
      
      public function get castBody() : Body
      {
         // method body index: 2010 method index: 2014
         return zpp_inner_i.ibody != null ? zpp_inner_i.ibody.outer : null;
      }
   }
}

