package flashpunk2.input
{
   import flash.geom.Point;
   
   public class InputAxis
   {
      
      private var _point:Point = // method body index: 1777 method index: 1778
      new Point();
      
      private var _right:InputButton = // method body index: 1777 method index: 1778
      new InputButton();
      
      private var _left:InputButton = // method body index: 1777 method index: 1778
      new InputButton();
      
      private var _down:InputButton = // method body index: 1777 method index: 1778
      new InputButton();
      
      private var _up:InputButton = // method body index: 1777 method index: 1778
      new InputButton();
      
      private var _circle:Boolean = false;
      
      public function InputAxis()
      {
         // method body index: 1777 method index: 1778
         super();
      }
      
      public static function create(param1:Boolean = true, param2:uint = 39, param3:uint = 37, param4:uint = 40, param5:uint = 38) : InputAxis
      {
         // method body index: 1776 method index: 1777
         var _loc6_:InputAxis = new InputAxis();
         return _loc6_.setCircle(param1).addKeys(param2,param3,param4,param5);
      }
      
      public function addKeys(param1:uint = 39, param2:uint = 37, param3:uint = 40, param4:uint = 38) : InputAxis
      {
         // method body index: 1778 method index: 1779
         this._right.addKey(param1);
         this._left.addKey(param2);
         this._down.addKey(param3);
         this._up.addKey(param4);
         return this;
      }
      
      public function setKeys(param1:uint = 39, param2:uint = 37, param3:uint = 40, param4:uint = 38) : InputAxis
      {
         // method body index: 1779 method index: 1780
         this._right.clearKeys();
         this._left.clearKeys();
         this._down.clearKeys();
         this._up.clearKeys();
         this._right.addKey(param1);
         this._left.addKey(param2);
         this._down.addKey(param3);
         this._up.addKey(param4);
         return this;
      }
      
      public function addRightKey(param1:uint) : InputAxis
      {
         // method body index: 1780 method index: 1781
         this._right.addKey(param1);
         return this;
      }
      
      public function addRightKeys(... rest) : InputAxis
      {
         // method body index: 1781 method index: 1782
         this._right.addKeys.apply(null,rest);
         return this;
      }
      
      public function setRightKeys(... rest) : InputAxis
      {
         // method body index: 1782 method index: 1783
         this._right.setKeys.apply(null,rest);
         return this;
      }
      
      public function addLeftKey(param1:uint) : InputAxis
      {
         // method body index: 1783 method index: 1784
         this._left.addKey(param1);
         return this;
      }
      
      public function addLeftKeys(... rest) : InputAxis
      {
         // method body index: 1784 method index: 1785
         this._left.addKeys.apply(null,rest);
         return this;
      }
      
      public function setLeftKeys(... rest) : InputAxis
      {
         // method body index: 1785 method index: 1786
         this._left.setKeys.apply(null,rest);
         return this;
      }
      
      public function addDownKey(param1:uint) : InputAxis
      {
         // method body index: 1786 method index: 1787
         this._down.addKey(param1);
         return this;
      }
      
      public function addDownKeys(... rest) : InputAxis
      {
         // method body index: 1787 method index: 1788
         this._down.addKeys.apply(null,rest);
         return this;
      }
      
      public function setDownKeys(... rest) : InputAxis
      {
         // method body index: 1788 method index: 1789
         this._down.setKeys.apply(null,rest);
         return this;
      }
      
      public function addUpKey(param1:uint) : InputAxis
      {
         // method body index: 1789 method index: 1790
         this._up.addKey(param1);
         return this;
      }
      
      public function addUpKeys(... rest) : InputAxis
      {
         // method body index: 1790 method index: 1791
         this._up.addKeys.apply(null,rest);
         return this;
      }
      
      public function setUpKeys(... rest) : InputAxis
      {
         // method body index: 1791 method index: 1792
         this._up.setKeys.apply(null,rest);
         return this;
      }
      
      public function setCircle(param1:Boolean = true) : InputAxis
      {
         // method body index: 1792 method index: 1793
         this._circle = param1;
         return this;
      }
      
      public function setSquare(param1:Boolean = true) : InputAxis
      {
         // method body index: 1793 method index: 1794
         this._circle = !param1;
         return this;
      }
      
      public function get x() : Number
      {
         // method body index: 1794 method index: 1795
         this._point.x = 0;
         if(this.rightButton.down)
         {
            ++this._point.x;
         }
         if(this.leftButton.down)
         {
            --this._point.x;
         }
         if(this._circle)
         {
            if(this.downButton.down)
            {
               ++this._point.y;
            }
            if(this.upButton.down)
            {
               --this._point.y;
            }
            if(this._point.x != 0 && this._point.y != 0)
            {
               this._point.normalize(1);
            }
         }
         return this._point.x;
      }
      
      public function get y() : Number
      {
         // method body index: 1795 method index: 1796
         this._point.y = 0;
         if(this.downButton.down)
         {
            ++this._point.y;
         }
         if(this.upButton.down)
         {
            --this._point.y;
         }
         if(this._circle)
         {
            if(this.rightButton.down)
            {
               ++this._point.x;
            }
            if(this.leftButton.down)
            {
               --this._point.x;
            }
            if(this._point.x != 0 && this._point.y != 0)
            {
               this._point.normalize(1);
            }
         }
         return this._point.y;
      }
      
      public function get rightButton() : InputButton
      {
         // method body index: 1796 method index: 1797
         return this._right;
      }
      
      public function get leftButton() : InputButton
      {
         // method body index: 1797 method index: 1798
         return this._left;
      }
      
      public function get downButton() : InputButton
      {
         // method body index: 1798 method index: 1799
         return this._down;
      }
      
      public function get upButton() : InputButton
      {
         // method body index: 1799 method index: 1800
         return this._up;
      }
      
      public function get isCircle() : Boolean
      {
         // method body index: 1800 method index: 1801
         return this._circle;
      }
      
      public function set isCircle(param1:Boolean) : void
      {
         // method body index: 1801 method index: 1802
         this._circle = param1;
      }
      
      public function get isSquare() : Boolean
      {
         // method body index: 1802 method index: 1803
         return !this._circle;
      }
      
      public function set isSquare(param1:Boolean) : void
      {
         // method body index: 1803 method index: 1804
         this._circle = !param1;
      }
      
      public function get down() : Boolean
      {
         // method body index: 1804 method index: 1805
         return this._right.down || this._left.down || this._down.down || this._up.down;
      }
      
      public function get pressed() : Boolean
      {
         // method body index: 1805 method index: 1806
         return this._right.pressed || this._left.pressed || this._down.pressed || this._up.pressed;
      }
      
      public function get released() : Boolean
      {
         // method body index: 1806 method index: 1807
         return this._right.released || this._left.released || this._down.released || this._up.released;
      }
      
      public function get up() : Boolean
      {
         // method body index: 1807 method index: 1808
         return !this.down;
      }
   }
}

