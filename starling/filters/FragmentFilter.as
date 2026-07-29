package starling.filters
{
   import com.jpexs.decompiler.flash.debugger.debugGetQualifiedClassName;
   import flash.display3D.Context3D;
   import flash.display3D.Context3DProgramType;
   import flash.display3D.Context3DVertexBufferFormat;
   import flash.display3D.IndexBuffer3D;
   import flash.display3D.Program3D;
   import flash.display3D.VertexBuffer3D;
   import flash.errors.IllegalOperationError;
   import flash.geom.Matrix;
   import flash.geom.Rectangle;
   import flash.system.Capabilities;
   import starling.core.RenderSupport;
   import starling.core.Starling;
   import starling.core.starling_internal;
   import starling.display.BlendMode;
   import starling.display.DisplayObject;
   import starling.display.Image;
   import starling.display.QuadBatch;
   import starling.display.Stage;
   import starling.errors.AbstractClassError;
   import starling.errors.MissingContextError;
   import starling.events.Event;
   import starling.textures.Texture;
   import starling.utils.MatrixUtil;
   import starling.utils.RectangleUtil;
   import starling.utils.VertexData;
   import starling.utils.getNextPowerOfTwo;
   
   use namespace starling_internal;
   
   public class FragmentFilter
   {
      
      // method body index: 1424 method index: 1424
      private static var sBounds:Rectangle = // method body index: 1424 method index: 1424
      new Rectangle();
      
      private static var sStageBounds:Rectangle = // method body index: 1424 method index: 1424
      new Rectangle();
      
      private static var sTransformationMatrix:Matrix = // method body index: 1424 method index: 1424
      new Matrix();
      
      protected const PMA:Boolean = true;
      
      protected const STD_VERTEX_SHADER:String = // method body index: 1425 method index: 1425
      "m44 op, va0, vc0 \n" + "mov v0, va1      \n";
      
      protected const STD_FRAGMENT_SHADER:String = "tex oc, v0, fs0 <2d, clamp, linear, mipnone>";
      
      private var mVertexPosAtID:int = 0;
      
      private var mTexCoordsAtID:int = 1;
      
      private var mBaseTextureID:int = 0;
      
      private var mMvpConstantID:int = 0;
      
      private var mNumPasses:int;
      
      private var mPassTextures:Vector.<Texture>;
      
      private var mMode:String;
      
      private var mResolution:Number;
      
      private var mMarginX:Number;
      
      private var mMarginY:Number;
      
      private var mOffsetX:Number;
      
      private var mOffsetY:Number;
      
      private var mVertexData:VertexData;
      
      private var mVertexBuffer:VertexBuffer3D;
      
      private var mIndexData:Vector.<uint>;
      
      private var mIndexBuffer:IndexBuffer3D;
      
      private var mCacheRequested:Boolean;
      
      private var mCache:QuadBatch;
      
      private var mProjMatrix:Matrix = // method body index: 1425 method index: 1425
      new Matrix();
      
      public function FragmentFilter(param1:int = 1, param2:Number = 1)
      {
         // method body index: 1425 method index: 1425
         super();
         if(Capabilities.isDebugger && debugGetQualifiedClassName(this) == "starling.filters::FragmentFilter")
         {
            throw new AbstractClassError();
         }
         if(param1 < 1)
         {
            throw new ArgumentError("At least one pass is required.");
         }
         this.mNumPasses = param1;
         this.mMarginX = this.mMarginY = 0;
         this.mOffsetX = this.mOffsetY = 0;
         this.mResolution = param2;
         this.mMode = FragmentFilterMode.REPLACE;
         this.mVertexData = new VertexData(4);
         this.mVertexData.setTexCoords(0,0,0);
         this.mVertexData.setTexCoords(1,1,0);
         this.mVertexData.setTexCoords(2,0,1);
         this.mVertexData.setTexCoords(3,1,1);
         this.mIndexData = new <uint>[0,1,2,1,3,2];
         this.mIndexData.fixed = true;
         this.createPrograms();
         Starling.current.stage3D.addEventListener(Event.CONTEXT3D_CREATE,this.onContextCreated,false,0,true);
      }
      
      public function dispose() : void
      {
         // method body index: 1426 method index: 1426
         Starling.current.stage3D.removeEventListener(Event.CONTEXT3D_CREATE,this.onContextCreated);
         if(this.mVertexBuffer)
         {
            this.mVertexBuffer.dispose();
         }
         if(this.mIndexBuffer)
         {
            this.mIndexBuffer.dispose();
         }
         this.disposePassTextures();
         this.disposeCache();
      }
      
      private function onContextCreated(param1:Object) : void
      {
         // method body index: 1427 method index: 1427
         this.mVertexBuffer = null;
         this.mIndexBuffer = null;
         this.mPassTextures = null;
         this.createPrograms();
      }
      
      public function render(param1:DisplayObject, param2:RenderSupport, param3:Number) : void
      {
         // method body index: 1428 method index: 1428
         if(this.mode == FragmentFilterMode.ABOVE)
         {
            param1.render(param2,param3);
         }
         if(this.mCacheRequested)
         {
            this.mCacheRequested = false;
            this.mCache = this.renderPasses(param1,param2,1,true);
            this.disposePassTextures();
         }
         if(this.mCache)
         {
            this.mCache.render(param2,param3);
         }
         else
         {
            this.renderPasses(param1,param2,param3,false);
         }
         if(this.mode == FragmentFilterMode.BELOW)
         {
            param1.render(param2,param3);
         }
      }
      
      private function renderPasses(param1:DisplayObject, param2:RenderSupport, param3:Number, param4:Boolean = false) : QuadBatch
      {
         // method body index: 1429 method index: 1429
         var _loc11_:Texture = null;
         var _loc12_:QuadBatch = null;
         var _loc13_:Image = null;
         var _loc5_:Texture = null;
         var _loc6_:Stage = param1.stage;
         var _loc7_:Context3D = Starling.context;
         var _loc8_:Number = Starling.current.contentScaleFactor;
         if(_loc6_ == null)
         {
            throw new Error("Filtered object must be on the stage.");
         }
         if(_loc7_ == null)
         {
            throw new MissingContextError();
         }
         this.calculateBounds(param1,_loc6_,!param4,sBounds);
         if(sBounds.isEmpty())
         {
            this.disposePassTextures();
            return param4 ? new QuadBatch() : null;
         }
         this.updateBuffers(_loc7_,sBounds);
         this.updatePassTextures(sBounds.width,sBounds.height,this.mResolution * _loc8_);
         param2.finishQuadBatch();
         param2.raiseDrawCount(this.mNumPasses);
         param2.pushMatrix();
         this.mProjMatrix.copyFrom(param2.projectionMatrix);
         var _loc9_:Texture = param2.renderTarget;
         if(_loc9_)
         {
            throw new IllegalOperationError("It\'s currently not possible to stack filters! " + "This limitation will be removed in a future Stage3D version.");
         }
         if(param4)
         {
            _loc5_ = Texture.empty(sBounds.width,sBounds.height,this.PMA,true,this.mResolution * _loc8_);
         }
         param2.renderTarget = this.mPassTextures[0];
         param2.clear();
         param2.blendMode = BlendMode.NORMAL;
         param2.setOrthographicProjection(sBounds.x,sBounds.y,sBounds.width,sBounds.height);
         param1.render(param2,param3);
         param2.finishQuadBatch();
         RenderSupport.setBlendFactors(this.PMA);
         param2.loadIdentity();
         _loc7_.setVertexBufferAt(this.mVertexPosAtID,this.mVertexBuffer,VertexData.POSITION_OFFSET,Context3DVertexBufferFormat.FLOAT_2);
         _loc7_.setVertexBufferAt(this.mTexCoordsAtID,this.mVertexBuffer,VertexData.TEXCOORD_OFFSET,Context3DVertexBufferFormat.FLOAT_2);
         var _loc10_:int = 0;
         while(_loc10_ < this.mNumPasses)
         {
            if(_loc10_ < this.mNumPasses - 1)
            {
               param2.renderTarget = this.getPassTexture(_loc10_ + 1);
               param2.clear();
            }
            else if(param4)
            {
               param2.renderTarget = _loc5_;
               param2.clear();
            }
            else
            {
               param2.projectionMatrix = this.mProjMatrix;
               param2.renderTarget = _loc9_;
               param2.translateMatrix(this.mOffsetX,this.mOffsetY);
               param2.blendMode = param1.blendMode;
               param2.applyBlendMode(this.PMA);
            }
            _loc11_ = this.getPassTexture(_loc10_);
            _loc7_.setProgramConstantsFromMatrix(Context3DProgramType.VERTEX,this.mMvpConstantID,param2.mvpMatrix3D,true);
            _loc7_.setTextureAt(this.mBaseTextureID,_loc11_.base);
            this.activate(_loc10_,_loc7_,_loc11_);
            _loc7_.drawTriangles(this.mIndexBuffer,0,2);
            this.deactivate(_loc10_,_loc7_,_loc11_);
            _loc10_++;
         }
         _loc7_.setVertexBufferAt(this.mVertexPosAtID,null);
         _loc7_.setVertexBufferAt(this.mTexCoordsAtID,null);
         _loc7_.setTextureAt(this.mBaseTextureID,null);
         param2.popMatrix();
         if(param4)
         {
            param2.renderTarget = _loc9_;
            param2.projectionMatrix.copyFrom(this.mProjMatrix);
            _loc12_ = new QuadBatch();
            _loc13_ = new Image(_loc5_);
            _loc6_.getTransformationMatrix(param1,sTransformationMatrix);
            MatrixUtil.prependTranslation(sTransformationMatrix,sBounds.x + this.mOffsetX,sBounds.y + this.mOffsetY);
            _loc12_.addImage(_loc13_,1,sTransformationMatrix);
            return _loc12_;
         }
         return null;
      }
      
      private function updateBuffers(param1:Context3D, param2:Rectangle) : void
      {
         // method body index: 1430 method index: 1430
         this.mVertexData.setPosition(0,param2.x,param2.y);
         this.mVertexData.setPosition(1,param2.right,param2.y);
         this.mVertexData.setPosition(2,param2.x,param2.bottom);
         this.mVertexData.setPosition(3,param2.right,param2.bottom);
         if(this.mVertexBuffer == null)
         {
            this.mVertexBuffer = param1.createVertexBuffer(4,VertexData.ELEMENTS_PER_VERTEX);
            this.mIndexBuffer = param1.createIndexBuffer(6);
            this.mIndexBuffer.uploadFromVector(this.mIndexData,0,6);
         }
         this.mVertexBuffer.uploadFromVector(this.mVertexData.rawData,0,4);
      }
      
      private function updatePassTextures(param1:int, param2:int, param3:Number) : void
      {
         // method body index: 1431 method index: 1431
         var _loc6_:int = 0;
         var _loc7_:Texture = null;
         var _loc4_:int = this.mNumPasses > 1 ? 2 : 1;
         var _loc5_:Boolean = this.mPassTextures == null || this.mPassTextures.length != _loc4_ || this.mPassTextures[0].width != param1 || this.mPassTextures[0].height != param2;
         if(_loc5_)
         {
            if(this.mPassTextures)
            {
               for each(_loc7_ in this.mPassTextures)
               {
                  _loc7_.dispose();
               }
               this.mPassTextures.length = _loc4_;
            }
            else
            {
               this.mPassTextures = new Vector.<Texture>(_loc4_);
            }
            _loc6_ = 0;
            while(_loc6_ < _loc4_)
            {
               this.mPassTextures[_loc6_] = Texture.empty(param1,param2,this.PMA,true,param3);
               _loc6_++;
            }
         }
      }
      
      private function getPassTexture(param1:int) : Texture
      {
         // method body index: 1432 method index: 1432
         return this.mPassTextures[param1 % 2];
      }
      
      private function calculateBounds(param1:DisplayObject, param2:Stage, param3:Boolean, param4:Rectangle) : void
      {
         // method body index: 1433 method index: 1433
         var _loc5_:Number = NaN;
         if(param1 == param2 || param1 == Starling.current.root)
         {
            param4.setTo(0,0,param2.stageWidth,param2.stageHeight);
         }
         else
         {
            param1.getBounds(param2,param4);
         }
         if(param3)
         {
            sStageBounds.setTo(0,0,param2.stageWidth,param2.stageHeight);
            RectangleUtil.intersect(param4,sStageBounds,param4);
         }
         if(!param4.isEmpty())
         {
            _loc5_ = this.mResolution == 1 ? 0 : 1 / this.mResolution;
            param4.x -= this.mMarginX + _loc5_;
            param4.y -= this.mMarginY + _loc5_;
            param4.width += 2 * (this.mMarginX + _loc5_);
            param4.height += 2 * (this.mMarginY + _loc5_);
            param4.width = getNextPowerOfTwo(param4.width * this.mResolution) / this.mResolution;
            param4.height = getNextPowerOfTwo(param4.height * this.mResolution) / this.mResolution;
         }
      }
      
      private function disposePassTextures() : void
      {
         // method body index: 1434 method index: 1434
         var _loc1_:Texture = null;
         for each(_loc1_ in this.mPassTextures)
         {
            _loc1_.dispose();
         }
         this.mPassTextures = null;
      }
      
      private function disposeCache() : void
      {
         // method body index: 1435 method index: 1435
         if(this.mCache)
         {
            if(this.mCache.texture)
            {
               this.mCache.texture.dispose();
            }
            this.mCache.dispose();
            this.mCache = null;
         }
      }
      
      protected function createPrograms() : void
      {
         // method body index: 1436 method index: 1436
         throw new Error("Method has to be implemented in subclass!");
      }
      
      protected function activate(param1:int, param2:Context3D, param3:Texture) : void
      {
         // method body index: 1437 method index: 1437
         throw new Error("Method has to be implemented in subclass!");
      }
      
      protected function deactivate(param1:int, param2:Context3D, param3:Texture) : void
      {
         // method body index: 1438 method index: 1438
      }
      
      protected function assembleAgal(param1:String = null, param2:String = null) : Program3D
      {
         // method body index: 1439 method index: 1439
         if(param1 == null)
         {
            param1 = this.STD_FRAGMENT_SHADER;
         }
         if(param2 == null)
         {
            param2 = this.STD_VERTEX_SHADER;
         }
         return RenderSupport.assembleAgal(param2,param1);
      }
      
      public function cache() : void
      {
         // method body index: 1440 method index: 1440
         this.mCacheRequested = true;
         this.disposeCache();
      }
      
      public function clearCache() : void
      {
         // method body index: 1441 method index: 1441
         this.mCacheRequested = false;
         this.disposeCache();
      }
      
      starling_internal function compile(param1:DisplayObject) : QuadBatch
      {
         // method body index: 1442 method index: 1442
         var _loc2_:RenderSupport = null;
         var _loc3_:Stage = null;
         if(this.mCache)
         {
            return this.mCache;
         }
         _loc3_ = param1.stage;
         if(_loc3_ == null)
         {
            throw new Error("Filtered object must be on the stage.");
         }
         _loc2_ = new RenderSupport();
         param1.getTransformationMatrix(_loc3_,_loc2_.modelViewMatrix);
         return this.renderPasses(param1,_loc2_,1,true);
      }
      
      public function get isCached() : Boolean
      {
         // method body index: 1443 method index: 1443
         return this.mCache != null || this.mCacheRequested;
      }
      
      public function get resolution() : Number
      {
         // method body index: 1444 method index: 1444
         return this.mResolution;
      }
      
      public function set resolution(param1:Number) : void
      {
         // method body index: 1445 method index: 1445
         if(param1 <= 0)
         {
            throw new ArgumentError("Resolution must be > 0");
         }
         this.mResolution = param1;
      }
      
      public function get mode() : String
      {
         // method body index: 1446 method index: 1446
         return this.mMode;
      }
      
      public function set mode(param1:String) : void
      {
         // method body index: 1447 method index: 1447
         this.mMode = param1;
      }
      
      public function get offsetX() : Number
      {
         // method body index: 1448 method index: 1448
         return this.mOffsetX;
      }
      
      public function set offsetX(param1:Number) : void
      {
         // method body index: 1449 method index: 1449
         this.mOffsetX = param1;
      }
      
      public function get offsetY() : Number
      {
         // method body index: 1450 method index: 1450
         return this.mOffsetY;
      }
      
      public function set offsetY(param1:Number) : void
      {
         // method body index: 1451 method index: 1451
         this.mOffsetY = param1;
      }
      
      protected function get marginX() : Number
      {
         // method body index: 1452 method index: 1452
         return this.mMarginX;
      }
      
      protected function set marginX(param1:Number) : void
      {
         // method body index: 1453 method index: 1453
         this.mMarginX = param1;
      }
      
      protected function get marginY() : Number
      {
         // method body index: 1454 method index: 1454
         return this.mMarginY;
      }
      
      protected function set marginY(param1:Number) : void
      {
         // method body index: 1455 method index: 1455
         this.mMarginY = param1;
      }
      
      protected function set numPasses(param1:int) : void
      {
         // method body index: 1456 method index: 1456
         this.mNumPasses = param1;
      }
      
      protected function get numPasses() : int
      {
         // method body index: 1457 method index: 1457
         return this.mNumPasses;
      }
      
      final protected function get vertexPosAtID() : int
      {
         // method body index: 1458 method index: 1458
         return this.mVertexPosAtID;
      }
      
      final protected function set vertexPosAtID(param1:int) : void
      {
         // method body index: 1459 method index: 1459
         this.mVertexPosAtID = param1;
      }
      
      final protected function get texCoordsAtID() : int
      {
         // method body index: 1460 method index: 1460
         return this.mTexCoordsAtID;
      }
      
      final protected function set texCoordsAtID(param1:int) : void
      {
         // method body index: 1461 method index: 1461
         this.mTexCoordsAtID = param1;
      }
      
      final protected function get baseTextureID() : int
      {
         // method body index: 1462 method index: 1462
         return this.mBaseTextureID;
      }
      
      final protected function set baseTextureID(param1:int) : void
      {
         // method body index: 1463 method index: 1463
         this.mBaseTextureID = param1;
      }
      
      final protected function get mvpConstantID() : int
      {
         // method body index: 1464 method index: 1464
         return this.mMvpConstantID;
      }
      
      final protected function set mvpConstantID(param1:int) : void
      {
         // method body index: 1465 method index: 1465
         this.mMvpConstantID = param1;
      }
   }
}

