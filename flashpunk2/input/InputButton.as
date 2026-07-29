package flashpunk2.input
{
   import flashpunk2.global.Cache;
   import flashpunk2.global.Input;
   
   public class InputButton
   {
      
      private var _keys:Vector.<int> = // method body index: 1760 method index: 1761
      new Vector.<int>();
      
      public function InputButton()
      {
         // method body index: 1760 method index: 1761
         super();
      }
      
      public static function create(... rest) : InputButton
      {
         // method body index: 1759 method index: 1760
         var _loc2_:InputButton = new InputButton();
         return _loc2_.addKeys.apply(null,rest);
      }
      
      public function addKey(param1:int) : void
      {
         // method body index: 1761 method index: 1762
         if(this._keys.indexOf(param1) >= 0)
         {
            throw new Error("Duplicate key code: " + param1);
         }
         this._keys.push(param1);
      }
      
      public function addKeys(... rest) : InputButton
      {
         // method body index: 1762 method index: 1763
         var _loc2_:int = 0;
         while(_loc2_ < rest.length)
         {
            if(typeof rest[_loc2_] != "number")
            {
               throw new Error("Invalid key code: " + rest[_loc2_]);
            }
            this.addKey(int(rest[_loc2_]));
            _loc2_++;
         }
         return this;
      }
      
      public function setKeys(... rest) : InputButton
      {
         // method body index: 1763 method index: 1764
         this._keys.length = 0;
         var _loc2_:int = 0;
         while(_loc2_ < rest.length)
         {
            if(typeof rest[_loc2_] != "number")
            {
               throw new Error("Invalid key code: " + rest[_loc2_]);
            }
            this.addKey(int(rest[_loc2_]));
            _loc2_++;
         }
         return this;
      }
      
      public function clearKeys() : void
      {
         // method body index: 1764 method index: 1765
         this._keys.length = 0;
      }
      
      public function get down() : Boolean
      {
         // method body index: 1765 method index: 1766
         var _loc1_:int = 0;
         for each(_loc1_ in this._keys)
         {
            if(Input.keyDown(_loc1_))
            {
               return true;
            }
         }
         return false;
      }
      
      public function get pressed() : Boolean
      {
         // method body index: 1766 method index: 1767
         var _loc1_:int = 0;
         for each(_loc1_ in this._keys)
         {
            if(Input.keyPressed(_loc1_))
            {
               return true;
            }
         }
         return false;
      }
      
      public function get released() : Boolean
      {
         // method body index: 1767 method index: 1768
         var _loc1_:int = 0;
         for each(_loc1_ in this._keys)
         {
            if(Input.keyReleased(_loc1_))
            {
               return true;
            }
         }
         return false;
      }
      
      public function get up() : Boolean
      {
         // method body index: 1768 method index: 1769
         return !this.up;
      }
      
      public function get allDown() : Boolean
      {
         // method body index: 1769 method index: 1770
         var _loc1_:int = 0;
         for each(_loc1_ in this._keys)
         {
            if(!Input.keyDown(_loc1_))
            {
               return false;
            }
         }
         return true;
      }
      
      public function get allPressed() : Boolean
      {
         // method body index: 1770 method index: 1771
         var _loc1_:int = 0;
         for each(_loc1_ in this._keys)
         {
            if(!Input.keyPressed(_loc1_))
            {
               return false;
            }
         }
         return true;
      }
      
      public function get allReleased() : Boolean
      {
         // method body index: 1771 method index: 1772
         var _loc1_:int = 0;
         for each(_loc1_ in this._keys)
         {
            if(!Input.keyReleased(_loc1_))
            {
               return false;
            }
         }
         return true;
      }
      
      public function getKeys(param1:* = null) : *
      {
         // method body index: 1772 method index: 1773
         var _loc2_:int = 0;
         if(param1 == null)
         {
            param1 = Cache.pop(Array);
         }
         for each(_loc2_ in this._keys)
         {
            param1.push(_loc2_);
         }
         return param1;
      }
      
      public function keyCount() : int
      {
         // method body index: 1773 method index: 1774
         return this._keys.length;
      }
   }
}

