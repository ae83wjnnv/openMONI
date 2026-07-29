package starling.textures
{
   import flash.display3D.Context3D;
   import flash.display3D.textures.TextureBase;
   import flash.geom.Matrix;
   import flash.geom.Rectangle;
   import starling.core.RenderSupport;
   import starling.core.Starling;
   import starling.display.DisplayObject;
   import starling.display.Image;
   import starling.errors.MissingContextError;
   import starling.utils.getNextPowerOfTwo;
   
   public class RenderTexture extends SubTexture
   {
      
      // method body index: 5022 method index: 5392
      private static var sClipRect:Rectangle = // method body index: 5022 method index: 5392
      new Rectangle();
      
      private const PMA:Boolean = true;
      
      private var mActiveTexture:Texture;
      
      private var mBufferTexture:Texture;
      
      private var mHelperImage:Image;
      
      private var mDrawing:Boolean;
      
      private var mBufferReady:Boolean;
      
      private var mSupport:RenderSupport;
      
      public function RenderTexture(param1:int, param2:int, param3:Boolean = true, param4:Number = -1)
      {
         // method body index: 5023 method index: 5393
         if(param4 <= 0)
         {
            param4 = Starling.contentScaleFactor;
         }
         var _loc5_:int = getNextPowerOfTwo(param1 * param4);
         var _loc6_:int = getNextPowerOfTwo(param2 * param4);
         this.mActiveTexture = Texture.empty(param1,param2,this.PMA,true,param4);
         super(this.mActiveTexture,new Rectangle(0,0,param1,param2),true);
         this.mSupport = new RenderSupport();
         this.mSupport.setOrthographicProjection(0,0,_loc5_ / param4,_loc6_ / param4);
         if(param3)
         {
            this.mBufferTexture = Texture.empty(param1,param2,this.PMA,true,param4);
            this.mHelperImage = new Image(this.mBufferTexture);
            this.mHelperImage.smoothing = TextureSmoothing.NONE;
         }
      }
      
      override public function dispose() : void
      {
         // method body index: 5024 method index: 5394
         this.mSupport.dispose();
         this.mActiveTexture.dispose();
         if(this.isPersistent)
         {
            this.mBufferTexture.dispose();
            this.mHelperImage.dispose();
         }
         super.dispose();
      }
      
      public function draw(param1:DisplayObject, param2:Matrix = null, param3:Number = 1, param4:int = 0) : void
      {
         // method body index: 5026 method index: 5396
         var render:Function = null;
         var object:DisplayObject = param1;
         var matrix:Matrix = param2;
         var alpha:Number = param3;
         var antiAliasing:int = param4;
         render = function():// method body index: 5025 method index: 5395
         void
         {
            // method body index: 5025 method index: 5395
            mSupport.loadIdentity();
            mSupport.blendMode = object.blendMode;
            if(matrix)
            {
               mSupport.prependMatrix(matrix);
            }
            else
            {
               mSupport.transformMatrix(object);
            }
            object.render(mSupport,alpha);
         };
         if(object == null)
         {
            return;
         }
         if(this.mDrawing)
         {
            render();
         }
         else
         {
            this.drawBundled(render,antiAliasing);
         }
      }
      
      public function drawBundled(param1:Function, param2:int = 0) : void
      {
         // method body index: 5027 method index: 5397
         var tmpTexture:Texture = null;
         var drawingBlock:Function = param1;
         var antiAliasing:int = param2;
         var context:Context3D = Starling.context;
         if(context == null)
         {
            throw new MissingContextError();
         }
         if(this.isPersistent)
         {
            tmpTexture = this.mActiveTexture;
            this.mActiveTexture = this.mBufferTexture;
            this.mBufferTexture = tmpTexture;
            this.mHelperImage.texture = this.mBufferTexture;
         }
         sClipRect.setTo(0,0,this.mActiveTexture.width,this.mActiveTexture.height);
         this.mSupport.pushClipRect(sClipRect);
         this.mSupport.renderTarget = this.mActiveTexture;
         this.mSupport.clear();
         if(this.isPersistent && this.mBufferReady)
         {
            this.mHelperImage.render(this.mSupport,1);
         }
         else
         {
            this.mBufferReady = true;
         }
         try
         {
            this.mDrawing = true;
            if(drawingBlock != null)
            {
               drawingBlock();
            }
         }
         finally
         {
            this.mDrawing = false;
            this.mSupport.finishQuadBatch();
            this.mSupport.nextFrame();
            this.mSupport.renderTarget = null;
            this.mSupport.popClipRect();
         }
      }
      
      public function clear() : void
      {
         // method body index: 5028 method index: 5398
         var _loc1_:Context3D = Starling.context;
         if(_loc1_ == null)
         {
            throw new MissingContextError();
         }
         this.mSupport.renderTarget = this.mActiveTexture;
         this.mSupport.clear();
         this.mSupport.renderTarget = null;
      }
      
      public function get isPersistent() : Boolean
      {
         // method body index: 5029 method index: 5399
         return this.mBufferTexture != null;
      }
      
      override public function get base() : TextureBase
      {
         // method body index: 5030 method index: 5400
         return this.mActiveTexture.base;
      }
      
      override public function get root() : ConcreteTexture
      {
         // method body index: 5031 method index: 5401
         return this.mActiveTexture.root;
      }
   }
}

