package flashpunk2.assets
{
   import flash.geom.Point;
   import flash.utils.ByteArray;
   
   public class ZipSymbol
   {
      
      private var _zip:ZipAsset;
      
      private var _name:String;
      
      private var _id:String;
      
      private var _labels:Vector.<String>;
      
      private var _names:Vector.<Vector.<Vector.<String>>>;
      
      private var _positions:Vector.<Vector.<Vector.<Point>>>;
      
      private var _scales:Vector.<Vector.<Vector.<Point>>>;
      
      private var _angles:Vector.<Vector.<Vector.<Number>>>;
      
      private var _images:Vector.<String>;
      
      public function ZipSymbol(param1:ZipAsset, param2:ByteArray)
      {
         // method body index: 1562 method index: 1562
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         this._labels = new Vector.<String>();
         this._names = new Vector.<Vector.<Vector.<String>>>();
         this._positions = new Vector.<Vector.<Vector.<Point>>>();
         this._scales = new Vector.<Vector.<Vector.<Point>>>();
         this._angles = new Vector.<Vector.<Vector.<Number>>>();
         this._images = new Vector.<String>();
         super();
         this._zip = param1;
         this._name = param2.readUTFBytes(param2.readInt());
         this._id = param2.readUTFBytes(param2.readInt());
         this._labels = new Vector.<String>(param2.readInt());
         this._names = new Vector.<Vector.<Vector.<String>>>(this._labels.length);
         this._positions = new Vector.<Vector.<Vector.<Point>>>(this._labels.length);
         this._scales = new Vector.<Vector.<Vector.<Point>>>(this._labels.length);
         this._angles = new Vector.<Vector.<Vector.<Number>>>(this._labels.length);
         var _loc3_:int = 0;
         while(_loc3_ < this._labels.length)
         {
            this._labels[_loc3_] = param2.readUTFBytes(param2.readInt());
            _loc4_ = param2.readInt();
            this._names[_loc3_] = new Vector.<Vector.<String>>(_loc4_);
            this._positions[_loc3_] = new Vector.<Vector.<Point>>(_loc4_);
            this._scales[_loc3_] = new Vector.<Vector.<Point>>(_loc4_);
            this._angles[_loc3_] = new Vector.<Vector.<Number>>(_loc4_);
            _loc5_ = 0;
            while(_loc5_ < _loc4_)
            {
               _loc6_ = param2.readInt();
               this._names[_loc3_][_loc5_] = new Vector.<String>(_loc6_);
               this._positions[_loc3_][_loc5_] = new Vector.<Point>(_loc6_);
               this._scales[_loc3_][_loc5_] = new Vector.<Point>(_loc6_);
               this._angles[_loc3_][_loc5_] = new Vector.<Number>(_loc6_);
               _loc7_ = 0;
               while(_loc7_ < _loc6_)
               {
                  this._names[_loc3_][_loc5_][_loc7_] = param2.readUTFBytes(param2.readInt());
                  this._positions[_loc3_][_loc5_][_loc7_] = new Point(param2.readFloat(),param2.readFloat());
                  this._scales[_loc3_][_loc5_][_loc7_] = new Point(param2.readFloat(),param2.readFloat());
                  this._angles[_loc3_][_loc5_][_loc7_] = param2.readFloat();
                  _loc7_++;
               }
               _loc5_++;
            }
            _loc3_++;
         }
      }
      
      public function get zip() : ZipAsset
      {
         // method body index: 1563 method index: 1563
         return this._zip;
      }
      
      public function get name() : String
      {
         // method body index: 1564 method index: 1564
         return this._name;
      }
      
      public function get id() : String
      {
         // method body index: 1565 method index: 1565
         return this._id;
      }
      
      public function get labels() : Vector.<String>
      {
         // method body index: 1566 method index: 1566
         return this._labels;
      }
      
      public function get names() : Vector.<Vector.<Vector.<String>>>
      {
         // method body index: 1567 method index: 1567
         return this._names;
      }
      
      public function get positions() : Vector.<Vector.<Vector.<Point>>>
      {
         // method body index: 1568 method index: 1568
         return this._positions;
      }
      
      public function get scales() : Vector.<Vector.<Vector.<Point>>>
      {
         // method body index: 1569 method index: 1569
         return this._scales;
      }
      
      public function get angles() : Vector.<Vector.<Vector.<Number>>>
      {
         // method body index: 1570 method index: 1570
         return this._angles;
      }
   }
}

