package flashpunk2.global
{
   public final class Calc
   {
      
      // method body index: 1585 method index: 1585
      public static const DEG:Number = // method body index: 1585 method index: 1585
      180 / Math.PI;
      
      public static const RAD:Number = // method body index: 1585 method index: 1585
      Math.PI / 180;
      
      public static const PI:Number = // method body index: 1585 method index: 1585
      Math.PI;
      
      public static const PI2:Number = // method body index: 1585 method index: 1585
      Math.PI * 2;
      
      public static const RIGHT:Number = // method body index: 1585 method index: 1585
      0;
      
      public static const LEFT:Number = // method body index: 1585 method index: 1585
      180;
      
      public static const DOWN:Number = // method body index: 1585 method index: 1585
      90;
      
      public static const UP:Number = // method body index: 1585 method index: 1585
      -90;
      
      public function Calc()
      {
         // method body index: 1643 method index: 1643
         super();
      }
      
      public static function deg(param1:Number) : Number
      {
         // method body index: 1586 method index: 1586
         return param1 * DEG;
      }
      
      public static function rad(param1:Number) : Number
      {
         // method body index: 1587 method index: 1587
         return param1 * RAD;
      }
      
      public static function sin(param1:Number) : Number
      {
         // method body index: 1588 method index: 1588
         return Math.sin(param1 * RAD);
      }
      
      public static function cos(param1:Number) : Number
      {
         // method body index: 1589 method index: 1589
         return Math.cos(param1 * RAD);
      }
      
      public static function tan(param1:Number) : Number
      {
         // method body index: 1590 method index: 1590
         return Math.tan(param1 * RAD);
      }
      
      public static function asin(param1:Number) : Number
      {
         // method body index: 1591 method index: 1591
         return Math.asin(param1 * RAD);
      }
      
      public static function acos(param1:Number) : Number
      {
         // method body index: 1592 method index: 1592
         return Math.acos(param1 * RAD);
      }
      
      public static function atan(param1:Number) : Number
      {
         // method body index: 1593 method index: 1593
         return Math.atan(param1 * RAD);
      }
      
      public static function atan2(param1:Number, param2:Number) : Number
      {
         // method body index: 1594 method index: 1594
         return Math.atan2(param1,param2) * DEG;
      }
      
      public static function log2(param1:uint) : uint
      {
         // method body index: 1595 method index: 1595
         return Math.ceil(Math.log(param1) * Math.LOG2E);
      }
      
      public static function isPowerOf2(param1:uint) : Boolean
      {
         // method body index: 1596 method index: 1596
         return param1 != 0 && (param1 & param1 - 1) == 0;
      }
      
      public static function nextPowerOf2(param1:uint, param2:Boolean = false) : uint
      {
         // method body index: 1597 method index: 1597
         if(!param2)
         {
            param1--;
         }
         param1 |= param1 >> 1;
         param1 |= param1 >> 2;
         param1 |= param1 >> 4;
         param1 |= param1 >> 8;
         param1 |= param1 >> 16;
         return ++param1;
      }
      
      public static function hob(param1:uint) : uint
      {
         // method body index: 1598 method index: 1598
         param1 |= param1 >> 1;
         param1 |= param1 >> 2;
         param1 |= param1 >> 4;
         param1 |= param1 >> 8;
         param1 |= param1 >> 16;
         return param1 - (param1 >> 1);
      }
      
      public static function hobLog2(param1:uint) : uint
      {
         // method body index: 1599 method index: 1599
         param1 |= param1 >> 1;
         param1 |= param1 >> 2;
         param1 |= param1 >> 4;
         param1 |= param1 >> 8;
         param1 |= param1 >> 16;
         return Math.round(Math.log(hob(param1 - (param1 >> 1))) * Math.LOG2E);
      }
      
      public static function sign(param1:Number) : Number
      {
         // method body index: 1600 method index: 1600
         if(param1 > 0)
         {
            return 1;
         }
         if(param1 < 0)
         {
            return -1;
         }
         return 0;
      }
      
      public static function approach(param1:Number, param2:Number, param3:Number) : Number
      {
         // method body index: 1601 method index: 1601
         return param1 < param2 ? (param2 < param1 + param3 ? param2 : param1 + param3) : (param2 > param1 - param3 ? param2 : param1 - param3);
      }
      
      public static function lerp(param1:Number, param2:Number, param3:Number) : Number
      {
         // method body index: 1602 method index: 1602
         return param1 + (param2 - param1) * param3;
      }
      
      public static function lerpClamp(param1:Number, param2:Number, param3:Number) : Number
      {
         // method body index: 1603 method index: 1603
         return lerp(param1,param2,Math.min(param3,1));
      }
      
      public static function inverseLerp(param1:Number, param2:Number, param3:Number) : Number
      {
         // method body index: 1604 method index: 1604
         return (param3 - param1) / (param2 - param1);
      }
      
      public static function angleTo(param1:Number, param2:Number, param3:Number, param4:Number) : Number
      {
         // method body index: 1605 method index: 1605
         return Math.atan2(param4 - param2,param3 - param1) * DEG;
      }
      
      public static function angleOf(param1:Number, param2:Number) : Number
      {
         // method body index: 1606 method index: 1606
         return Math.atan2(param2,param1) * DEG;
      }
      
      public static function angleDifference(param1:Number, param2:Number) : Number
      {
         // method body index: 1607 method index: 1607
         var _loc3_:Number = (param2 - param1) % 360;
         if(_loc3_ > 180)
         {
            return Math.abs(_loc3_ - 360);
         }
         if(_loc3_ <= -180)
         {
            return Math.abs(_loc3_ + 360);
         }
         return Math.abs(_loc3_);
      }
      
      public static function angleOffset(param1:Number, param2:Number) : Number
      {
         // method body index: 1608 method index: 1608
         var _loc3_:Number = (param2 - param1) % 360;
         if(_loc3_ > 180)
         {
            return _loc3_ - 360;
         }
         if(_loc3_ <= -180)
         {
            return _loc3_ + 360;
         }
         return _loc3_;
      }
      
      public static function wrapAngle(param1:Number) : Number
      {
         // method body index: 1609 method index: 1609
         param1 %= 360;
         if(param1 > 180)
         {
            return param1 - 360;
         }
         if(param1 <= -180)
         {
            return param1 + 360;
         }
         return param1;
      }
      
      public static function angleEquals(param1:Number, param2:Number) : Boolean
      {
         // method body index: 1610 method index: 1610
         return angleOffset(param1,param2) == 0;
      }
      
      public static function distance(param1:Number, param2:Number, param3:Number = 0, param4:Number = 0) : Number
      {
         // method body index: 1611 method index: 1611
         return Math.sqrt((param3 - param1) * (param3 - param1) + (param4 - param2) * (param4 - param2));
      }
      
      public static function sqrDistance(param1:Number, param2:Number, param3:Number = 0, param4:Number = 0) : Number
      {
         // method body index: 1612 method index: 1612
         return (param3 - param1) * (param3 - param1) + (param4 - param2) * (param4 - param2);
      }
      
      public static function rectRectDistance(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number) : Number
      {
         // method body index: 1613 method index: 1613
         if(param1 < param5 + param7 && param5 < param1 + param3)
         {
            if(param2 < param6 + param8 && param6 < param2 + param4)
            {
               return 0;
            }
            if(param2 > param6)
            {
               return param2 - (param6 + param8);
            }
            return param6 - (param2 + param4);
         }
         if(param2 < param6 + param8 && param6 < param2 + param4)
         {
            if(param1 > param5)
            {
               return param1 - (param5 + param7);
            }
            return param5 - (param1 + param3);
         }
         if(param1 > param5)
         {
            if(param2 > param6)
            {
               return distance(param1,param2,param5 + param7,param6 + param8);
            }
            return distance(param1,param2 + param4,param5 + param7,param6);
         }
         if(param2 > param6)
         {
            return distance(param1 + param3,param2,param5,param6 + param8);
         }
         return distance(param1 + param3,param2 + param4,param5,param6);
      }
      
      public static function pointRectDistance(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number) : Number
      {
         // method body index: 1614 method index: 1614
         if(param1 >= param3 && param1 <= param3 + param5)
         {
            if(param2 >= param4 && param2 <= param4 + param6)
            {
               return 0;
            }
            if(param2 > param4)
            {
               return param2 - (param4 + param6);
            }
            return param4 - param2;
         }
         if(param2 >= param4 && param2 <= param4 + param6)
         {
            if(param1 > param3)
            {
               return param1 - (param3 + param5);
            }
            return param3 - param1;
         }
         if(param1 > param3)
         {
            if(param2 > param4)
            {
               return distance(param1,param2,param3 + param5,param4 + param6);
            }
            return distance(param1,param2,param3 + param5,param4);
         }
         if(param2 > param4)
         {
            return distance(param1,param2,param3,param4 + param6);
         }
         return distance(param1,param2,param3,param4);
      }
      
      public static function clamp(param1:Number, param2:Number, param3:Number) : Number
      {
         // method body index: 1615 method index: 1615
         if(param3 > param2)
         {
            param1 = param1 < param3 ? param1 : param3;
            return param1 > param2 ? param1 : param2;
         }
         param1 = param1 < param2 ? param1 : param2;
         return param1 > param3 ? param1 : param3;
      }
      
      public static function clamp01(param1:Number) : Number
      {
         // method body index: 1616 method index: 1616
         if(param1 < 0)
         {
            return 0;
         }
         if(param1 > 1)
         {
            return 1;
         }
         return param1;
      }
      
      public static function scale(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number) : Number
      {
         // method body index: 1617 method index: 1617
         return param4 + (param1 - param2) / (param3 - param2) * (param5 - param4);
      }
      
      public static function scale01(param1:Number, param2:Number, param3:Number) : Number
      {
         // method body index: 1618 method index: 1618
         return (param1 - param2) / (param3 - param2);
      }
      
      public static function scaleClamp(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number) : Number
      {
         // method body index: 1619 method index: 1619
         param1 = param4 + (param1 - param2) / (param3 - param2) * (param5 - param4);
         if(param5 > param4)
         {
            param1 = param1 < param5 ? param1 : param5;
            return param1 > param4 ? param1 : param4;
         }
         param1 = param1 < param4 ? param1 : param4;
         return param1 > param5 ? param1 : param5;
      }
      
      public static function quadraticBezier(param1:Number, param2:Number, param3:Number, param4:Number) : Number
      {
         // method body index: 1620 method index: 1620
         return param1 * (1 - param4) * (1 - param4) + param2 * 2 * (1 - param4) * param4 + param3 * param4 * param4;
      }
      
      public static function cubicBezier(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number) : Number
      {
         // method body index: 1621 method index: 1621
         return param5 * param5 * param5 * (param4 + 3 * (param2 - param3) - param1) + 3 * param5 * param5 * (param1 - 2 * param2 + param3) + 3 * param5 * (param2 - param1) + param1;
      }
      
      public static function catmullRom(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number) : Number
      {
         // method body index: 1622 method index: 1622
         return 0.5 * (2 * param2 + (-param1 + param3) * param5 + (2 * param1 - 5 * param2 + 4 * param3 - param4) * param5 * param5 + (-param1 + 3 * param2 - 3 * param3 + param4) * param5 * param5 * param5);
      }
      
      public static function circumference(param1:Number) : Number
      {
         // method body index: 1623 method index: 1623
         return PI2 * param1;
      }
      
      public static function arcLength(param1:Number, param2:Number, param3:Number) : Number
      {
         // method body index: 1624 method index: 1624
         return PI2 * param1 * (angleDifference(param2,param3) / 360);
      }
      
      public static function determinant(param1:Number, param2:Number, param3:Number, param4:Number) : Number
      {
         // method body index: 1625 method index: 1625
         return param1 * param4 - param2 * param3;
      }
      
      public static function dotProduct(param1:Number, param2:Number, param3:Number, param4:Number) : Number
      {
         // method body index: 1626 method index: 1626
         return param1 * param3 + param2 * param4;
      }
      
      public static function loop(param1:Number, param2:Number, param3:Number) : Number
      {
         // method body index: 1627 method index: 1627
         var _loc4_:Number = Math.min(param2,param3);
         var _loc5_:Number = Math.max(param2,param3);
         var _loc6_:Number = _loc5_ - _loc4_;
         param1 %= _loc6_;
         if(param1 < _loc4_)
         {
            return param1 + _loc6_;
         }
         if(param1 > _loc5_)
         {
            return param1 - _loc6_;
         }
         return param1;
      }
      
      public static function loop01(param1:Number) : Number
      {
         // method body index: 1628 method index: 1628
         param1 %= 1;
         if(param1 < 0)
         {
            return param1 + 1;
         }
         return param1;
      }
      
      public static function wave(param1:Number, param2:Number, param3:Number) : Number
      {
         // method body index: 1629 method index: 1629
         return scale(Math.sin(scale(loop(param1,param2,param3),param2,param3,-PI,PI)),-1,1,param2,param3);
      }
      
      public static function wave01(param1:Number) : Number
      {
         // method body index: 1630 method index: 1630
         return scale(Math.sin(scale(loop01(param1),0,1,-PI,PI)),-1,1,0,1);
      }
      
      public static function moveAngleX(param1:Number, param2:Number) : Number
      {
         // method body index: 1631 method index: 1631
         return Math.cos(param1 * RAD) * param2;
      }
      
      public static function moveAngleY(param1:Number, param2:Number) : Number
      {
         // method body index: 1632 method index: 1632
         return Math.sin(param1 * RAD) * param2;
      }
      
      public static function smoothStep(param1:Number) : Number
      {
         // method body index: 1633 method index: 1633
         return param1 * param1 * (3 - 2 * param1);
      }
      
      public static function smoothLerp(param1:Number, param2:Number, param3:Number) : Number
      {
         // method body index: 1634 method index: 1634
         return param1 + smoothStep(param3) * (param2 - param1);
      }
      
      public static function round(param1:Number) : int
      {
         // method body index: 1635 method index: 1635
         return Math.round(param1);
      }
      
      public static function floor(param1:Number) : int
      {
         // method body index: 1636 method index: 1636
         return Math.floor(param1);
      }
      
      public static function ceil(param1:Number) : int
      {
         // method body index: 1637 method index: 1637
         return Math.ceil(param1);
      }
      
      public static function pow(param1:Number, param2:Number) : Number
      {
         // method body index: 1638 method index: 1638
         return Math.pow(param1,param2);
      }
      
      public static function exp(param1:Number) : Number
      {
         // method body index: 1639 method index: 1639
         return Math.exp(param1);
      }
      
      public static function sqrt(param1:Number) : Number
      {
         // method body index: 1640 method index: 1640
         return Math.sqrt(param1);
      }
      
      public static function isMultiple(param1:int, param2:int) : Boolean
      {
         // method body index: 1641 method index: 1641
         return param2 % param1 == 0;
      }
      
      public static function strBool(param1:String) : Boolean
      {
         // method body index: 1642 method index: 1642
         return param1 == "True";
      }
   }
}

