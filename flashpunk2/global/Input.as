package flashpunk2.global
{
   import flash.display.Stage;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flashpunk2.Engine;
   import flashpunk2.input.InputAxis;
   import flashpunk2.input.InputButton;
   import flashpunk2.namespaces.fp_internal;
   
   use namespace fp_internal;
   
   public final class Input
   {
      
      private static var _stage:Stage;
      
      private static var _mouseDown:Boolean;
      
      private static var _mousePressed:Boolean;
      
      private static var _mouseReleased:Boolean;
      
      private static var _rightMouseDown:Boolean;
      
      private static var _rightMousePressed:Boolean;
      
      private static var _rightMouseReleased:Boolean;
      
      private static var _mouseX:int;
      
      private static var _mouseY:int;
      
      private static var _mouseWheel:int;
      
      // method body index: 736 method index: 736
      public static var enabled:Boolean = // method body index: 736 method index: 736
      true;
      
      private static var _keyStates:Vector.<Boolean> = // method body index: 736 method index: 736
      new Vector.<Boolean>(256);
      
      private static var _pressedKeys:Vector.<uint> = // method body index: 736 method index: 736
      new Vector.<uint>();
      
      private static var _releasedKeys:Vector.<uint> = // method body index: 736 method index: 736
      new Vector.<uint>();
      
      private static var _downKeys:int = // method body index: 736 method index: 736
      0;
      
      private static var _buttonLookup:Object = // method body index: 736 method index: 736
      {};
      
      private static var _axisLookup:Object = // method body index: 736 method index: 736
      {};
      
      public function Input()
      {
         // method body index: 780 method index: 780
         super();
      }
      
      fp_internal static function start() : void
      {
         // method body index: 737 method index: 737
         _stage = Engine.instance.main.stage;
         _stage.addEventListener(KeyboardEvent.KEY_DOWN,onKeyDown);
         _stage.addEventListener(KeyboardEvent.KEY_UP,onKeyUp);
         _stage.addEventListener(MouseEvent.MOUSE_DOWN,onMouseDown);
         _stage.addEventListener(MouseEvent.MOUSE_UP,onMouseUp);
         _mouseX = _stage.mouseX;
         _mouseY = _stage.mouseY;
      }
      
      fp_internal static function end() : void
      {
         // method body index: 738 method index: 738
         _stage.removeEventListener(KeyboardEvent.KEY_DOWN,onKeyDown);
         _stage.removeEventListener(KeyboardEvent.KEY_UP,onKeyUp);
         _stage.removeEventListener(MouseEvent.MOUSE_DOWN,onMouseDown);
         _stage.removeEventListener(MouseEvent.MOUSE_UP,onMouseUp);
         _stage.removeEventListener(MouseEvent.RIGHT_MOUSE_DOWN,onRightMouseDown);
         _stage.removeEventListener(MouseEvent.RIGHT_MOUSE_UP,onRightMouseUp);
         _stage.removeEventListener(MouseEvent.MOUSE_WHEEL,onMouseWheel);
         _stage = null;
      }
      
      fp_internal static function update() : void
      {
         // method body index: 739 method index: 739
         _pressedKeys.length = 0;
         _releasedKeys.length = 0;
         _mousePressed = false;
         _mouseReleased = false;
         _rightMousePressed = false;
         _rightMouseReleased = false;
         _mouseX = _stage.mouseX;
         _mouseY = _stage.mouseY;
         _mouseWheel = 0;
      }
      
      private static function onKeyDown(param1:KeyboardEvent) : void
      {
         // method body index: 740 method index: 740
         if(!_keyStates[param1.keyCode] && enabled)
         {
            ++_downKeys;
            _keyStates[param1.keyCode] = true;
            _pressedKeys.push(param1.keyCode);
         }
      }
      
      private static function onKeyUp(param1:KeyboardEvent) : void
      {
         // method body index: 741 method index: 741
         if(enabled)
         {
            --_downKeys;
            _keyStates[param1.keyCode] = false;
            _releasedKeys.push(param1.keyCode);
         }
      }
      
      private static function onMouseDown(param1:MouseEvent) : void
      {
         // method body index: 742 method index: 742
         if(enabled)
         {
            _mouseDown = true;
            _mousePressed = true;
         }
      }
      
      private static function onMouseUp(param1:MouseEvent) : void
      {
         // method body index: 743 method index: 743
         if(enabled)
         {
            _mouseDown = false;
            _mouseReleased = true;
         }
      }
      
      private static function onRightMouseDown(param1:MouseEvent) : void
      {
         // method body index: 744 method index: 744
         if(enabled)
         {
            _rightMouseDown = true;
            _rightMousePressed = true;
         }
      }
      
      private static function onRightMouseUp(param1:MouseEvent) : void
      {
         // method body index: 745 method index: 745
         if(enabled)
         {
            _rightMouseDown = false;
            _rightMouseReleased = true;
         }
      }
      
      private static function onMouseWheel(param1:MouseEvent) : void
      {
         // method body index: 746 method index: 746
         if(enabled)
         {
            _mouseWheel = param1.delta > 0 ? 1 : -1;
         }
      }
      
      public static function addButton(param1:String, param2:InputButton) : InputButton
      {
         // method body index: 747 method index: 747
         _buttonLookup[param1] = param2;
         return param2;
      }
      
      public static function createButton(param1:String) : InputButton
      {
         // method body index: 748 method index: 748
         return addButton(param1,new InputButton());
      }
      
      public static function removeButton(param1:String) : void
      {
         // method body index: 749 method index: 749
         if(param1 in _buttonLookup)
         {
            delete _buttonLookup[param1];
         }
      }
      
      public static function clearButtons() : void
      {
         // method body index: 750 method index: 750
         var _loc1_:String = null;
         for(_loc1_ in _buttonLookup)
         {
            delete _buttonLookup[_loc1_];
         }
      }
      
      public static function addAxis(param1:String, param2:InputAxis) : InputAxis
      {
         // method body index: 751 method index: 751
         _axisLookup[param1] = param2;
         return param2;
      }
      
      public static function createAxis(param1:String) : InputAxis
      {
         // method body index: 752 method index: 752
         return addAxis(param1,new InputAxis());
      }
      
      public static function removeAxis(param1:String) : void
      {
         // method body index: 753 method index: 753
         if(param1 in _axisLookup)
         {
            delete _axisLookup[param1];
         }
      }
      
      public static function clearAxes() : void
      {
         // method body index: 754 method index: 754
         var _loc1_:String = null;
         for(_loc1_ in _axisLookup)
         {
            delete _axisLookup[_loc1_];
         }
      }
      
      public static function getButton(param1:String) : InputButton
      {
         // method body index: 755 method index: 755
         if(!(param1 in _buttonLookup))
         {
            throw new Error("Button not defined: " + param1);
         }
         return _buttonLookup[param1];
      }
      
      public static function getAxis(param1:String) : InputAxis
      {
         // method body index: 756 method index: 756
         if(!(param1 in _axisLookup))
         {
            throw new Error("Button not defined: " + param1);
         }
         return _axisLookup[param1];
      }
      
      public static function keyDown(param1:uint) : Boolean
      {
         // method body index: 757 method index: 757
         return param1 >= 0 ? _keyStates[param1] : _downKeys > 0;
      }
      
      public static function keyPressed(param1:uint) : Boolean
      {
         // method body index: 758 method index: 758
         return param1 >= 0 ? _pressedKeys.indexOf(param1) >= 0 : _pressedKeys.length > 0;
      }
      
      public static function keyReleased(param1:uint) : Boolean
      {
         // method body index: 759 method index: 759
         return param1 >= 0 ? _releasedKeys.indexOf(param1) >= 0 : _releasedKeys.length > 0;
      }
      
      public static function keyUp(param1:uint) : Boolean
      {
         // method body index: 760 method index: 760
         return !keyDown(param1);
      }
      
      public static function buttonDown(param1:String) : Boolean
      {
         // method body index: 761 method index: 761
         return getButton(param1).down;
      }
      
      public static function buttonPressed(param1:String) : Boolean
      {
         // method body index: 762 method index: 762
         return getButton(param1).pressed;
      }
      
      public static function buttonReleased(param1:String) : Boolean
      {
         // method body index: 763 method index: 763
         return getButton(param1).released;
      }
      
      public static function buttonUp(param1:String) : Boolean
      {
         // method body index: 764 method index: 764
         return getButton(param1).up;
      }
      
      public static function axisDown(param1:String) : Boolean
      {
         // method body index: 765 method index: 765
         return getAxis(param1).down;
      }
      
      public static function axisPressed(param1:String) : Boolean
      {
         // method body index: 766 method index: 766
         return getAxis(param1).pressed;
      }
      
      public static function axisReleased(param1:String) : Boolean
      {
         // method body index: 767 method index: 767
         return getAxis(param1).released;
      }
      
      public static function axisUp(param1:String) : Boolean
      {
         // method body index: 768 method index: 768
         return getAxis(param1).up;
      }
      
      public static function axisX(param1:String) : Number
      {
         // method body index: 769 method index: 769
         return getAxis(param1).x;
      }
      
      public static function axisY(param1:String) : Number
      {
         // method body index: 770 method index: 770
         return getAxis(param1).y;
      }
      
      public static function get mouseDown() : Boolean
      {
         // method body index: 771 method index: 771
         return _mouseDown;
      }
      
      public static function get mousePressed() : Boolean
      {
         // method body index: 772 method index: 772
         return _mousePressed;
      }
      
      public static function get mouseReleased() : Boolean
      {
         // method body index: 773 method index: 773
         return _mouseReleased;
      }
      
      public static function get rightMouseDown() : Boolean
      {
         // method body index: 774 method index: 774
         return _rightMouseDown;
      }
      
      public static function get rightMousePressed() : Boolean
      {
         // method body index: 775 method index: 775
         return _rightMousePressed;
      }
      
      public static function get rightMouseReleased() : Boolean
      {
         // method body index: 776 method index: 776
         return _rightMouseReleased;
      }
      
      public static function get mouseX() : int
      {
         // method body index: 777 method index: 777
         return _mouseX;
      }
      
      public static function get mouseY() : int
      {
         // method body index: 778 method index: 778
         return _mouseY;
      }
      
      public static function get mouseWheel() : int
      {
         // method body index: 779 method index: 779
         return _mouseWheel;
      }
   }
}

