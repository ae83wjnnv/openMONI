package flashpunk2.assets
{
   import flashpunk2.Signal;
   import flashpunk2.namespaces.fp_internal;
   
   use namespace fp_internal;
   
   public class BaseAsset
   {
      
      public const ON_LOAD_PROGRESS:Signal = // method body index: 13 method index: 13
      new Signal();
      
      public const ON_LOAD_COMPLETE:Signal = // method body index: 13 method index: 13
      new Signal();
      
      private var _loading:Boolean;
      
      private var _loaded:Boolean;
      
      private var _percentLoaded:Number = 0;
      
      public function BaseAsset()
      {
         // method body index: 13 method index: 13
         super();
      }
      
      fp_internal function loadProgress(param1:Number) : void
      {
         // method body index: 14 method index: 14
         this._percentLoaded = param1;
         this.ON_LOAD_PROGRESS.dispatch();
      }
      
      fp_internal function loadComplete() : void
      {
         // method body index: 15 method index: 15
         if(this._loading)
         {
            this._loading = false;
            this._loaded = true;
            this._percentLoaded = 1;
            this.ON_LOAD_COMPLETE.dispatch();
         }
      }
      
      public function load() : void
      {
         // method body index: 16 method index: 16
         if(this._loading)
         {
            throw new Error("Asset already loading.");
         }
         if(this._loaded)
         {
            throw new Error("Asset already loaded.");
         }
         this._loading = true;
      }
      
      public function dispose() : void
      {
         // method body index: 17 method index: 17
         if(!this._loaded)
         {
            throw new Error("Asset not loaded.");
         }
         this._loaded = false;
      }
      
      public function get loading() : Boolean
      {
         // method body index: 18 method index: 18
         return this._loading;
      }
      
      public function get loaded() : Boolean
      {
         // method body index: 19 method index: 19
         return this._loaded;
      }
      
      public function get percentLoaded() : Number
      {
         // method body index: 20 method index: 20
         return this._percentLoaded;
      }
   }
}

