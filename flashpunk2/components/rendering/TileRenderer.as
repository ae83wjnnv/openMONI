package flashpunk2.components.rendering
{
   import flashpunk2.Entity;
   import flashpunk2.namespaces.fp_internal;
   import starling.display.Image;
   import starling.display.Sprite;
   import starling.textures.TextureSmoothing;
   
   use namespace fp_internal;
   
   public class TileRenderer extends Renderer
   {
      
      private var _sprite:Sprite;
      
      private var _tileset:Tileset;
      
      private var _columns:int;
      
      private var _rows:int;
      
      private var _tiles:Vector.<Image>;
      
      private var _tileCache:Vector.<Image>;
      
      private var _autoLock:Boolean;
      
      private var _batchColumns:int;
      
      private var _batchRows:int;
      
      private var _chunkColumns:int;
      
      private var _chunkRows:int;
      
      private var _chunks:Vector.<Sprite>;
      
      public function TileRenderer(param1:Tileset, param2:uint, param3:uint, param4:uint = 0, param5:uint = 0, param6:Boolean = true)
      {
         // method body index: 4997 method index: 5367
         var _loc9_:Sprite = null;
         this._sprite = new Sprite();
         this._tileCache = new Vector.<Image>();
         super();
         if(param2 == 0)
         {
            throw new Error("Cannot have tilemap with 0 columns.");
         }
         if(param3 == 0)
         {
            throw new Error("Cannot have tilemap with 0 rows.");
         }
         if(param4 == 0)
         {
            param4 = param2;
         }
         if(param5 == 0)
         {
            param5 = param3;
         }
         this._tileset = param1;
         this._columns = param2;
         this._rows = param3;
         this._tiles = new Vector.<Image>(param2 * param3);
         this._autoLock = param6;
         this._batchColumns = param4;
         this._batchRows = param5;
         this._chunkColumns = Math.ceil(param2 / param4);
         this._chunkRows = Math.ceil(param3 / param5);
         this._chunks = new Vector.<Sprite>(this._chunkColumns * this._chunkRows);
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc10_:int = 0;
         while(_loc10_ < this._chunks.length)
         {
            _loc9_ = new Sprite();
            _loc9_.x = _loc7_;
            _loc9_.y = _loc8_;
            _loc9_.visible = false;
            this._sprite.addChild(_loc9_);
            this._chunks[_loc10_] = _loc9_;
            _loc7_ += this.batchWidth;
            if(_loc7_ >= this.width)
            {
               _loc7_ = 0;
               _loc8_ += this.batchHeight;
            }
            _loc10_++;
         }
         fp_internal::setDisplayObject(this._sprite);
      }
      
      override fp_internal function start(param1:Entity) : void
      {
         // method body index: 4998 method index: 5368
         super.fp_internal::start(param1);
         if(this._autoLock)
         {
            this.lock();
         }
      }
      
      override fp_internal function end() : void
      {
         // method body index: 4999 method index: 5369
         var _loc1_:Image = null;
         if(this._autoLock)
         {
            this.unlock();
         }
         this.clear();
         for each(_loc1_ in this._tileCache)
         {
            _loc1_.dispose();
         }
         this._tileCache.length = 0;
         super.fp_internal::end();
      }
      
      private function getChunk(param1:uint, param2:uint) : Sprite
      {
         // method body index: 5000 method index: 5370
         return this._chunks[this._chunkColumns * int(param2 / this._batchRows) + int(param1 / this._batchColumns)];
      }
      
      public function setTile(param1:uint, param2:uint, param3:int) : void
      {
         // method body index: 5001 method index: 5371
         var _loc6_:Sprite = null;
         if(this._sprite.isFlattened)
         {
            throw new Error("Cannot edit locked tile renderer.");
         }
         if(param1 >= this._columns)
         {
            throw new Error("Column out of bounds: " + param1);
         }
         if(param2 >= this._rows)
         {
            throw new Error("Row out of bounds: " + param2);
         }
         var _loc4_:int = this._columns * param2 + param1;
         var _loc5_:Image = this._tiles[_loc4_];
         if(param3 >= 0)
         {
            if(_loc5_ != null)
            {
               _loc5_.texture = this._tileset.getTileByIndex(param3);
            }
            else
            {
               if(this._tileCache.length > 0)
               {
                  _loc5_ = this._tileCache.pop();
                  _loc5_.texture = this._tileset.getTileByIndex(param3);
               }
               else
               {
                  _loc5_ = new Image(this._tileset.getTileByIndex(param3));
                  _loc5_.smoothing = TextureSmoothing.NONE;
               }
               this._tiles[_loc4_] = _loc5_;
               _loc5_.x = param1 % this._batchColumns * this._tileset.tileWidth;
               _loc5_.y = param2 % this._batchRows * this._tileset.tileHeight;
               _loc6_ = this.getChunk(param1,param2);
               _loc6_.addChild(_loc5_);
               _loc6_.visible = true;
            }
         }
         else if(_loc5_ != null)
         {
            if(_loc5_.parent.numChildren == 1)
            {
               _loc5_.parent.visible = false;
            }
            _loc5_.removeFromParent();
            this._tileCache.push(_loc5_);
            this._tiles[_loc4_] = null;
         }
      }
      
      public function setRect(param1:uint, param2:uint, param3:uint, param4:uint, param5:int) : void
      {
         // method body index: 5002 method index: 5372
         var _loc7_:int = 0;
         if(this._sprite.isFlattened)
         {
            throw new Error("Cannot edit locked tile renderer.");
         }
         if(param1 + param3 > this._columns)
         {
            throw new Error("Rectangle width out of bounds: " + (param1 + param3));
         }
         if(param2 + param4 > this._rows)
         {
            throw new Error("Rectangle height out of bounds: " + (param2 + param4));
         }
         param3 += param1;
         param4 += param2;
         var _loc6_:int = int(param1);
         while(_loc6_ < param3)
         {
            _loc7_ = int(param2);
            while(_loc7_ < param4)
            {
               this.setTile(_loc6_,_loc7_,param5);
               _loc7_++;
            }
            _loc6_++;
         }
      }
      
      public function getTile(param1:uint, param2:uint) : int
      {
         // method body index: 5003 method index: 5373
         if(param1 >= this._columns)
         {
            throw new Error("Column out of bounds: " + param1);
         }
         if(param2 >= this._rows)
         {
            throw new Error("Row out of bounds: " + param2);
         }
         var _loc3_:int = this._columns * param2 + param1;
         return this._tiles[_loc3_] != null ? this._tileset.getTileIndex(this._tiles[_loc3_].texture) : -1;
      }
      
      public function clear() : void
      {
         // method body index: 5004 method index: 5374
         this.setRect(0,0,this._columns,this._rows,-1);
      }
      
      public function lock() : void
      {
         // method body index: 5005 method index: 5375
         if(!this._sprite.isFlattened)
         {
            this._sprite.flatten();
         }
      }
      
      public function unlock() : void
      {
         // method body index: 5006 method index: 5376
         if(this._sprite.isFlattened)
         {
            this._sprite.unflatten();
         }
      }
      
      public function get locked() : Boolean
      {
         // method body index: 5007 method index: 5377
         return this._sprite.isFlattened;
      }
      
      public function set locked(param1:Boolean) : void
      {
         // method body index: 5008 method index: 5378
         if(this._sprite.isFlattened != param1)
         {
            if(param1)
            {
               this._sprite.flatten();
            }
            else
            {
               this._sprite.unflatten();
            }
         }
      }
      
      public function get columns() : int
      {
         // method body index: 5009 method index: 5379
         return this._columns;
      }
      
      public function get rows() : int
      {
         // method body index: 5010 method index: 5380
         return this._rows;
      }
      
      public function get batchColumns() : int
      {
         // method body index: 5011 method index: 5381
         return this._batchColumns;
      }
      
      public function get batchRows() : int
      {
         // method body index: 5012 method index: 5382
         return this._batchRows;
      }
      
      public function get tileWidth() : int
      {
         // method body index: 5013 method index: 5383
         return this._tileset.tileWidth;
      }
      
      public function get tileHeight() : int
      {
         // method body index: 5014 method index: 5384
         return this._tileset.tileHeight;
      }
      
      public function get batchWidth() : int
      {
         // method body index: 5015 method index: 5385
         return this._batchColumns * this._tileset.tileWidth;
      }
      
      public function get batchHeight() : int
      {
         // method body index: 5016 method index: 5386
         return this._batchRows * this._tileset.tileHeight;
      }
      
      override public function get width() : Number
      {
         // method body index: 5017 method index: 5387
         return this._columns * this._tileset.tileWidth;
      }
      
      override public function get height() : Number
      {
         // method body index: 5018 method index: 5388
         return this._rows * this._tileset.tileHeight;
      }
      
      public function get autoLock() : Boolean
      {
         // method body index: 5019 method index: 5389
         return this._autoLock;
      }
      
      public function set autoLock(param1:Boolean) : void
      {
         // method body index: 5020 method index: 5390
         this._autoLock = param1;
      }
   }
}

