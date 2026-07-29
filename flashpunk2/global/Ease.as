package flashpunk2.global
{
   public final class Ease
   {
      
      // method body index: 1134 method index: 1134
      private static const PI:Number = // method body index: 1134 method index: 1134
      Math.PI;
      
      private static const PI2:Number = // method body index: 1134 method index: 1134
      Math.PI / 2;
      
      private static const B1:Number = // method body index: 1134 method index: 1134
      1 / 2.75;
      
      private static const B2:Number = // method body index: 1134 method index: 1134
      2 / 2.75;
      
      private static const B3:Number = // method body index: 1134 method index: 1134
      1.5 / 2.75;
      
      private static const B4:Number = // method body index: 1134 method index: 1134
      2.5 / 2.75;
      
      private static const B5:Number = // method body index: 1134 method index: 1134
      2.25 / 2.75;
      
      private static const B6:Number = // method body index: 1134 method index: 1134
      2.625 / 2.75;
      
      public function Ease()
      {
         // method body index: 1165 method index: 1165
         super();
      }
      
      public static function quadIn(param1:Number) : Number
      {
         // method body index: 1135 method index: 1135
         return param1 * param1;
      }
      
      public static function quadOut(param1:Number) : Number
      {
         // method body index: 1136 method index: 1136
         return -param1 * (param1 - 2);
      }
      
      public static function quadInOut(param1:Number) : Number
      {
         // method body index: 1137 method index: 1137
         return param1 <= 0.5 ? param1 * param1 * 2 : 1 - --param1 * param1 * 2;
      }
      
      public static function cubeIn(param1:Number) : Number
      {
         // method body index: 1138 method index: 1138
         return param1 * param1 * param1;
      }
      
      public static function cubeOut(param1:Number) : Number
      {
         // method body index: 1139 method index: 1139
         return 1 + --param1 * param1 * param1;
      }
      
      public static function cubeInOut(param1:Number) : Number
      {
         // method body index: 1140 method index: 1140
         return param1 <= 0.5 ? param1 * param1 * param1 * 4 : 1 + --param1 * param1 * param1 * 4;
      }
      
      public static function quartIn(param1:Number) : Number
      {
         // method body index: 1141 method index: 1141
         return param1 * param1 * param1 * param1;
      }
      
      public static function quartOut(param1:Number) : Number
      {
         // method body index: 1142 method index: 1142
         return 1 - (param1 = param1 - 1) * param1 * param1 * param1;
      }
      
      public static function quartInOut(param1:Number) : Number
      {
         // method body index: 1143 method index: 1143
         return param1 <= 0.5 ? param1 * param1 * param1 * param1 * 8 : (1 - (param1 = param1 * 2 - 2) * param1 * param1 * param1) / 2 + 0.5;
      }
      
      public static function quintIn(param1:Number) : Number
      {
         // method body index: 1144 method index: 1144
         return param1 * param1 * param1 * param1 * param1;
      }
      
      public static function quintOut(param1:Number) : Number
      {
         // method body index: 1145 method index: 1145
         param1 = param1 - 1;
         return param1 * param1 * param1 * param1 * param1 + 1;
      }
      
      public static function quintInOut(param1:Number) : Number
      {
         // method body index: 1146 method index: 1146
         param1 = param1 - 2;
         param1 = param1 * 2;
         return param1 < 1 ? param1 * param1 * param1 * param1 * param1 / 2 : (param1 * param1 * param1 * param1 * param1 + 2) / 2;
      }
      
      public static function sineIn(param1:Number) : Number
      {
         // method body index: 1147 method index: 1147
         return -Math.cos(PI2 * param1) + 1;
      }
      
      public static function sineOut(param1:Number) : Number
      {
         // method body index: 1148 method index: 1148
         return Math.sin(PI2 * param1);
      }
      
      public static function sineInOut(param1:Number) : Number
      {
         // method body index: 1149 method index: 1149
         return -Math.cos(PI * param1) / 2 + 0.5;
      }
      
      public static function bounceIn(param1:Number) : Number
      {
         // method body index: 1150 method index: 1150
         param1 = 1 - param1;
         if(param1 < B1)
         {
            return 1 - 7.5625 * param1 * param1;
         }
         if(param1 < B2)
         {
            return 1 - (7.5625 * (param1 - B3) * (param1 - B3) + 0.75);
         }
         if(param1 < B4)
         {
            return 1 - (7.5625 * (param1 - B5) * (param1 - B5) + 0.9375);
         }
         return 1 - (7.5625 * (param1 - B6) * (param1 - B6) + 0.984375);
      }
      
      public static function bounceOut(param1:Number) : Number
      {
         // method body index: 1151 method index: 1151
         if(param1 < B1)
         {
            return 7.5625 * param1 * param1;
         }
         if(param1 < B2)
         {
            return 7.5625 * (param1 - B3) * (param1 - B3) + 0.75;
         }
         if(param1 < B4)
         {
            return 7.5625 * (param1 - B5) * (param1 - B5) + 0.9375;
         }
         return 7.5625 * (param1 - B6) * (param1 - B6) + 0.984375;
      }
      
      public static function bounceInOut(param1:Number) : Number
      {
         // method body index: 1152 method index: 1152
         if(param1 < 0.5)
         {
            param1 = 1 - param1 * 2;
            if(param1 < B1)
            {
               return (1 - 7.5625 * param1 * param1) / 2;
            }
            if(param1 < B2)
            {
               return (1 - (7.5625 * (param1 - B3) * (param1 - B3) + 0.75)) / 2;
            }
            if(param1 < B4)
            {
               return (1 - (7.5625 * (param1 - B5) * (param1 - B5) + 0.9375)) / 2;
            }
            return (1 - (7.5625 * (param1 - B6) * (param1 - B6) + 0.984375)) / 2;
         }
         param1 = param1 * 2 - 1;
         if(param1 < B1)
         {
            return 7.5625 * param1 * param1 / 2 + 0.5;
         }
         if(param1 < B2)
         {
            return (7.5625 * (param1 - B3) * (param1 - B3) + 0.75) / 2 + 0.5;
         }
         if(param1 < B4)
         {
            return (7.5625 * (param1 - B5) * (param1 - B5) + 0.9375) / 2 + 0.5;
         }
         return (7.5625 * (param1 - B6) * (param1 - B6) + 0.984375) / 2 + 0.5;
      }
      
      public static function circIn(param1:Number) : Number
      {
         // method body index: 1153 method index: 1153
         return -(Math.sqrt(1 - param1 * param1) - 1);
      }
      
      public static function circOut(param1:Number) : Number
      {
         // method body index: 1154 method index: 1154
         return Math.sqrt(1 - (param1 - 1) * (param1 - 1));
      }
      
      public static function circInOut(param1:Number) : Number
      {
         // method body index: 1155 method index: 1155
         return param1 <= 0.5 ? (Math.sqrt(1 - param1 * param1 * 4) - 1) / -2 : (Math.sqrt(1 - (param1 * 2 - 2) * (param1 * 2 - 2)) + 1) / 2;
      }
      
      public static function expoIn(param1:Number) : Number
      {
         // method body index: 1156 method index: 1156
         return Math.pow(2,10 * (param1 - 1));
      }
      
      public static function expoOut(param1:Number) : Number
      {
         // method body index: 1157 method index: 1157
         return -Math.pow(2,-10 * param1) + 1;
      }
      
      public static function expoInOut(param1:Number) : Number
      {
         // method body index: 1158 method index: 1158
         return param1 < 0.5 ? Math.pow(2,10 * (param1 * 2 - 1)) / 2 : (-Math.pow(2,-10 * (param1 * 2 - 1)) + 2) / 2;
      }
      
      public static function backIn(param1:Number) : Number
      {
         // method body index: 1159 method index: 1159
         return param1 * param1 * (2.70158 * param1 - 1.70158);
      }
      
      public static function backOut(param1:Number) : Number
      {
         // method body index: 1160 method index: 1160
         return 1 - --param1 * param1 * (-2.70158 * param1 - 1.70158);
      }
      
      public static function backInOut(param1:Number) : Number
      {
         // method body index: 1161 method index: 1161
         param1 *= 2;
         if(param1 < 1)
         {
            return param1 * param1 * (2.70158 * param1 - 1.70158) / 2;
         }
         param1--;
         return (1 - --param1 * param1 * (-2.70158 * param1 - 1.70158)) / 2 + 0.5;
      }
      
      public static function elasticIn(param1:Number) : Number
      {
         // method body index: 1162 method index: 1162
         return 1 - elasticOut(1 - param1);
      }
      
      public static function elasticOut(param1:Number) : Number
      {
         // method body index: 1163 method index: 1163
         return Math.pow(2,-10 * param1) * Math.sin((param1 - 0.075) * (2 * Math.PI) / 0.3) + 1;
      }
      
      public static function elasticInOut(param1:Number) : Number
      {
         // method body index: 1164 method index: 1164
         return param1 <= 0.5 ? elasticIn(param1 * 2) / 2 : elasticOut(param1 * 2 - 1) / 2 + 0.5;
      }
   }
}

