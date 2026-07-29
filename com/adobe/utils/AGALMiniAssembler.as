package com.adobe.utils
{
   import flash.display3D.*;
   import flash.utils.*;
   
   public class AGALMiniAssembler
   {
      
      // method body index: 2762 method index: 2776
      protected static const REGEXP_OUTER_SPACES:RegExp = // method body index: 2762 method index: 2776
      /^\s+|\s+$/g;
      
      private static var initialized:Boolean = // method body index: 2762 method index: 2776
      false;
      
      private static const OPMAP:Dictionary = // method body index: 2762 method index: 2776
      new Dictionary();
      
      private static const REGMAP:Dictionary = // method body index: 2762 method index: 2776
      new Dictionary();
      
      private static const SAMPLEMAP:Dictionary = // method body index: 2762 method index: 2776
      new Dictionary();
      
      private static const MAX_NESTING:int = // method body index: 2762 method index: 2776
      4;
      
      private static const MAX_OPCODES:int = // method body index: 2762 method index: 2776
      2048;
      
      private static const FRAGMENT:String = // method body index: 2762 method index: 2776
      "fragment";
      
      private static const VERTEX:String = // method body index: 2762 method index: 2776
      "vertex";
      
      private static const SAMPLER_TYPE_SHIFT:uint = // method body index: 2762 method index: 2776
      8;
      
      private static const SAMPLER_DIM_SHIFT:uint = // method body index: 2762 method index: 2776
      12;
      
      private static const SAMPLER_SPECIAL_SHIFT:uint = // method body index: 2762 method index: 2776
      16;
      
      private static const SAMPLER_REPEAT_SHIFT:uint = // method body index: 2762 method index: 2776
      20;
      
      private static const SAMPLER_MIPMAP_SHIFT:uint = // method body index: 2762 method index: 2776
      24;
      
      private static const SAMPLER_FILTER_SHIFT:uint = // method body index: 2762 method index: 2776
      28;
      
      private static const REG_WRITE:uint = // method body index: 2762 method index: 2776
      1;
      
      private static const REG_READ:uint = // method body index: 2762 method index: 2776
      2;
      
      private static const REG_FRAG:uint = // method body index: 2762 method index: 2776
      32;
      
      private static const REG_VERT:uint = // method body index: 2762 method index: 2776
      64;
      
      private static const OP_SCALAR:uint = // method body index: 2762 method index: 2776
      1;
      
      private static const OP_SPECIAL_TEX:uint = // method body index: 2762 method index: 2776
      8;
      
      private static const OP_SPECIAL_MATRIX:uint = // method body index: 2762 method index: 2776
      16;
      
      private static const OP_FRAG_ONLY:uint = // method body index: 2762 method index: 2776
      32;
      
      private static const OP_VERT_ONLY:uint = // method body index: 2762 method index: 2776
      64;
      
      private static const OP_NO_DEST:uint = // method body index: 2762 method index: 2776
      128;
      
      private static const OP_VERSION2:uint = // method body index: 2762 method index: 2776
      256;
      
      private static const OP_INCNEST:uint = // method body index: 2762 method index: 2776
      512;
      
      private static const OP_DECNEST:uint = // method body index: 2762 method index: 2776
      1024;
      
      private static const MOV:String = // method body index: 2762 method index: 2776
      "mov";
      
      private static const ADD:String = // method body index: 2762 method index: 2776
      "add";
      
      private static const SUB:String = // method body index: 2762 method index: 2776
      "sub";
      
      private static const MUL:String = // method body index: 2762 method index: 2776
      "mul";
      
      private static const DIV:String = // method body index: 2762 method index: 2776
      "div";
      
      private static const RCP:String = // method body index: 2762 method index: 2776
      "rcp";
      
      private static const MIN:String = // method body index: 2762 method index: 2776
      "min";
      
      private static const MAX:String = // method body index: 2762 method index: 2776
      "max";
      
      private static const FRC:String = // method body index: 2762 method index: 2776
      "frc";
      
      private static const SQT:String = // method body index: 2762 method index: 2776
      "sqt";
      
      private static const RSQ:String = // method body index: 2762 method index: 2776
      "rsq";
      
      private static const POW:String = // method body index: 2762 method index: 2776
      "pow";
      
      private static const LOG:String = // method body index: 2762 method index: 2776
      "log";
      
      private static const EXP:String = // method body index: 2762 method index: 2776
      "exp";
      
      private static const NRM:String = // method body index: 2762 method index: 2776
      "nrm";
      
      private static const SIN:String = // method body index: 2762 method index: 2776
      "sin";
      
      private static const COS:String = // method body index: 2762 method index: 2776
      "cos";
      
      private static const CRS:String = // method body index: 2762 method index: 2776
      "crs";
      
      private static const DP3:String = // method body index: 2762 method index: 2776
      "dp3";
      
      private static const DP4:String = // method body index: 2762 method index: 2776
      "dp4";
      
      private static const ABS:String = // method body index: 2762 method index: 2776
      "abs";
      
      private static const NEG:String = // method body index: 2762 method index: 2776
      "neg";
      
      private static const SAT:String = // method body index: 2762 method index: 2776
      "sat";
      
      private static const M33:String = // method body index: 2762 method index: 2776
      "m33";
      
      private static const M44:String = // method body index: 2762 method index: 2776
      "m44";
      
      private static const M34:String = // method body index: 2762 method index: 2776
      "m34";
      
      private static const DDX:String = // method body index: 2762 method index: 2776
      "ddx";
      
      private static const DDY:String = // method body index: 2762 method index: 2776
      "ddy";
      
      private static const IFE:String = // method body index: 2762 method index: 2776
      "ife";
      
      private static const INE:String = // method body index: 2762 method index: 2776
      "ine";
      
      private static const IFG:String = // method body index: 2762 method index: 2776
      "ifg";
      
      private static const IFL:String = // method body index: 2762 method index: 2776
      "ifl";
      
      private static const ELS:String = // method body index: 2762 method index: 2776
      "els";
      
      private static const EIF:String = // method body index: 2762 method index: 2776
      "eif";
      
      private static const TED:String = // method body index: 2762 method index: 2776
      "ted";
      
      private static const KIL:String = // method body index: 2762 method index: 2776
      "kil";
      
      private static const TEX:String = // method body index: 2762 method index: 2776
      "tex";
      
      private static const SGE:String = // method body index: 2762 method index: 2776
      "sge";
      
      private static const SLT:String = // method body index: 2762 method index: 2776
      "slt";
      
      private static const SGN:String = // method body index: 2762 method index: 2776
      "sgn";
      
      private static const SEQ:String = // method body index: 2762 method index: 2776
      "seq";
      
      private static const SNE:String = // method body index: 2762 method index: 2776
      "sne";
      
      private static const VA:String = // method body index: 2762 method index: 2776
      "va";
      
      private static const VC:String = // method body index: 2762 method index: 2776
      "vc";
      
      private static const VT:String = // method body index: 2762 method index: 2776
      "vt";
      
      private static const VO:String = // method body index: 2762 method index: 2776
      "vo";
      
      private static const VI:String = // method body index: 2762 method index: 2776
      "vi";
      
      private static const FC:String = // method body index: 2762 method index: 2776
      "fc";
      
      private static const FT:String = // method body index: 2762 method index: 2776
      "ft";
      
      private static const FS:String = // method body index: 2762 method index: 2776
      "fs";
      
      private static const FO:String = // method body index: 2762 method index: 2776
      "fo";
      
      private static const FD:String = // method body index: 2762 method index: 2776
      "fd";
      
      private static const D2:String = // method body index: 2762 method index: 2776
      "2d";
      
      private static const D3:String = // method body index: 2762 method index: 2776
      "3d";
      
      private static const CUBE:String = // method body index: 2762 method index: 2776
      "cube";
      
      private static const MIPNEAREST:String = // method body index: 2762 method index: 2776
      "mipnearest";
      
      private static const MIPLINEAR:String = // method body index: 2762 method index: 2776
      "miplinear";
      
      private static const MIPNONE:String = // method body index: 2762 method index: 2776
      "mipnone";
      
      private static const NOMIP:String = // method body index: 2762 method index: 2776
      "nomip";
      
      private static const NEAREST:String = // method body index: 2762 method index: 2776
      "nearest";
      
      private static const LINEAR:String = // method body index: 2762 method index: 2776
      "linear";
      
      private static const CENTROID:String = // method body index: 2762 method index: 2776
      "centroid";
      
      private static const SINGLE:String = // method body index: 2762 method index: 2776
      "single";
      
      private static const IGNORESAMPLER:String = // method body index: 2762 method index: 2776
      "ignoresampler";
      
      private static const REPEAT:String = // method body index: 2762 method index: 2776
      "repeat";
      
      private static const WRAP:String = // method body index: 2762 method index: 2776
      "wrap";
      
      private static const CLAMP:String = // method body index: 2762 method index: 2776
      "clamp";
      
      private static const RGBA:String = // method body index: 2762 method index: 2776
      "rgba";
      
      private static const DXT1:String = // method body index: 2762 method index: 2776
      "dxt1";
      
      private static const DXT5:String = // method body index: 2762 method index: 2776
      "dxt5";
      
      private static const VIDEO:String = // method body index: 2762 method index: 2776
      "video";
      
      private var _agalcode:ByteArray = null;
      
      private var _error:String = "";
      
      private var debugEnabled:Boolean = false;
      
      public var verbose:Boolean = false;
      
      public function AGALMiniAssembler(param1:Boolean = false)
      {
         // method body index: 2766 method index: 2780
         super();
         this.debugEnabled = param1;
         if(!initialized)
         {
            init();
         }
      }
      
      private static function init() : void
      {
         // method body index: 2763 method index: 2777
         initialized = true;
         OPMAP[MOV] = new OpCode(MOV,2,0,0);
         OPMAP[ADD] = new OpCode(ADD,3,1,0);
         OPMAP[SUB] = new OpCode(SUB,3,2,0);
         OPMAP[MUL] = new OpCode(MUL,3,3,0);
         OPMAP[DIV] = new OpCode(DIV,3,4,0);
         OPMAP[RCP] = new OpCode(RCP,2,5,0);
         OPMAP[MIN] = new OpCode(MIN,3,6,0);
         OPMAP[MAX] = new OpCode(MAX,3,7,0);
         OPMAP[FRC] = new OpCode(FRC,2,8,0);
         OPMAP[SQT] = new OpCode(SQT,2,9,0);
         OPMAP[RSQ] = new OpCode(RSQ,2,10,0);
         OPMAP[POW] = new OpCode(POW,3,11,0);
         OPMAP[LOG] = new OpCode(LOG,2,12,0);
         OPMAP[EXP] = new OpCode(EXP,2,13,0);
         OPMAP[NRM] = new OpCode(NRM,2,14,0);
         OPMAP[SIN] = new OpCode(SIN,2,15,0);
         OPMAP[COS] = new OpCode(COS,2,16,0);
         OPMAP[CRS] = new OpCode(CRS,3,17,0);
         OPMAP[DP3] = new OpCode(DP3,3,18,0);
         OPMAP[DP4] = new OpCode(DP4,3,19,0);
         OPMAP[ABS] = new OpCode(ABS,2,20,0);
         OPMAP[NEG] = new OpCode(NEG,2,21,0);
         OPMAP[SAT] = new OpCode(SAT,2,22,0);
         OPMAP[M33] = new OpCode(M33,3,23,OP_SPECIAL_MATRIX);
         OPMAP[M44] = new OpCode(M44,3,24,OP_SPECIAL_MATRIX);
         OPMAP[M34] = new OpCode(M34,3,25,OP_SPECIAL_MATRIX);
         OPMAP[DDX] = new OpCode(DDX,2,26,OP_VERSION2 | OP_FRAG_ONLY);
         OPMAP[DDY] = new OpCode(DDY,2,27,OP_VERSION2 | OP_FRAG_ONLY);
         OPMAP[IFE] = new OpCode(IFE,2,28,OP_NO_DEST | OP_VERSION2 | OP_INCNEST | OP_SCALAR);
         OPMAP[INE] = new OpCode(INE,2,29,OP_NO_DEST | OP_VERSION2 | OP_INCNEST | OP_SCALAR);
         OPMAP[IFG] = new OpCode(IFG,2,30,OP_NO_DEST | OP_VERSION2 | OP_INCNEST | OP_SCALAR);
         OPMAP[IFL] = new OpCode(IFL,2,31,OP_NO_DEST | OP_VERSION2 | OP_INCNEST | OP_SCALAR);
         OPMAP[ELS] = new OpCode(ELS,0,32,OP_NO_DEST | OP_VERSION2 | OP_INCNEST | OP_DECNEST | OP_SCALAR);
         OPMAP[EIF] = new OpCode(EIF,0,33,OP_NO_DEST | OP_VERSION2 | OP_DECNEST | OP_SCALAR);
         OPMAP[TED] = new OpCode(TED,3,38,OP_FRAG_ONLY | OP_SPECIAL_TEX | OP_VERSION2);
         OPMAP[KIL] = new OpCode(KIL,1,39,OP_NO_DEST | OP_FRAG_ONLY);
         OPMAP[TEX] = new OpCode(TEX,3,40,OP_FRAG_ONLY | OP_SPECIAL_TEX);
         OPMAP[SGE] = new OpCode(SGE,3,41,0);
         OPMAP[SLT] = new OpCode(SLT,3,42,0);
         OPMAP[SGN] = new OpCode(SGN,2,43,0);
         OPMAP[SEQ] = new OpCode(SEQ,3,44,0);
         OPMAP[SNE] = new OpCode(SNE,3,45,0);
         SAMPLEMAP[RGBA] = new Sampler(RGBA,SAMPLER_TYPE_SHIFT,0);
         SAMPLEMAP[DXT1] = new Sampler(DXT1,SAMPLER_TYPE_SHIFT,1);
         SAMPLEMAP[DXT5] = new Sampler(DXT5,SAMPLER_TYPE_SHIFT,2);
         SAMPLEMAP[VIDEO] = new Sampler(VIDEO,SAMPLER_TYPE_SHIFT,3);
         SAMPLEMAP[D2] = new Sampler(D2,SAMPLER_DIM_SHIFT,0);
         SAMPLEMAP[D3] = new Sampler(D3,SAMPLER_DIM_SHIFT,2);
         SAMPLEMAP[CUBE] = new Sampler(CUBE,SAMPLER_DIM_SHIFT,1);
         SAMPLEMAP[MIPNEAREST] = new Sampler(MIPNEAREST,SAMPLER_MIPMAP_SHIFT,1);
         SAMPLEMAP[MIPLINEAR] = new Sampler(MIPLINEAR,SAMPLER_MIPMAP_SHIFT,2);
         SAMPLEMAP[MIPNONE] = new Sampler(MIPNONE,SAMPLER_MIPMAP_SHIFT,0);
         SAMPLEMAP[NOMIP] = new Sampler(NOMIP,SAMPLER_MIPMAP_SHIFT,0);
         SAMPLEMAP[NEAREST] = new Sampler(NEAREST,SAMPLER_FILTER_SHIFT,0);
         SAMPLEMAP[LINEAR] = new Sampler(LINEAR,SAMPLER_FILTER_SHIFT,1);
         SAMPLEMAP[CENTROID] = new Sampler(CENTROID,SAMPLER_SPECIAL_SHIFT,1 << 0);
         SAMPLEMAP[SINGLE] = new Sampler(SINGLE,SAMPLER_SPECIAL_SHIFT,1 << 1);
         SAMPLEMAP[IGNORESAMPLER] = new Sampler(IGNORESAMPLER,SAMPLER_SPECIAL_SHIFT,1 << 2);
         SAMPLEMAP[REPEAT] = new Sampler(REPEAT,SAMPLER_REPEAT_SHIFT,1);
         SAMPLEMAP[WRAP] = new Sampler(WRAP,SAMPLER_REPEAT_SHIFT,1);
         SAMPLEMAP[CLAMP] = new Sampler(CLAMP,SAMPLER_REPEAT_SHIFT,0);
      }
      
      public function get error() : String
      {
         // method body index: 2764 method index: 2778
         return this._error;
      }
      
      public function get agalcode() : ByteArray
      {
         // method body index: 2765 method index: 2779
         return this._agalcode;
      }
      
      public function assemble2(param1:Context3D, param2:uint, param3:String, param4:String) : Program3D
      {
         // method body index: 2767 method index: 2781
         var _loc5_:ByteArray = this.assemble(VERTEX,param3,param2);
         var _loc6_:ByteArray = this.assemble(FRAGMENT,param4,param2);
         var _loc7_:Program3D = param1.createProgram();
         _loc7_.upload(_loc5_,_loc6_);
         return _loc7_;
      }
      
      public function assemble(param1:String, param2:String, param3:uint = 1, param4:Boolean = false) : ByteArray
      {
         // method body index: 2768 method index: 2782
         var _loc10_:int = 0;
         var _loc12_:String = null;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:Array = null;
         var _loc16_:Array = null;
         var _loc17_:OpCode = null;
         var _loc18_:Array = null;
         var _loc19_:Boolean = false;
         var _loc20_:uint = 0;
         var _loc21_:uint = 0;
         var _loc22_:int = 0;
         var _loc23_:Boolean = false;
         var _loc24_:Array = null;
         var _loc25_:Array = null;
         var _loc26_:Register = null;
         var _loc27_:Array = null;
         var _loc28_:uint = 0;
         var _loc29_:uint = 0;
         var _loc30_:Array = null;
         var _loc31_:Boolean = false;
         var _loc32_:Boolean = false;
         var _loc33_:uint = 0;
         var _loc34_:uint = 0;
         var _loc35_:int = 0;
         var _loc36_:uint = 0;
         var _loc37_:uint = 0;
         var _loc38_:int = 0;
         var _loc39_:Array = null;
         var _loc40_:Register = null;
         var _loc41_:Array = null;
         var _loc42_:Array = null;
         var _loc43_:uint = 0;
         var _loc44_:uint = 0;
         var _loc45_:Number = NaN;
         var _loc46_:Sampler = null;
         var _loc47_:String = null;
         var _loc48_:uint = 0;
         var _loc49_:uint = 0;
         var _loc50_:String = null;
         var _loc5_:uint = uint(getTimer());
         this._agalcode = new ByteArray();
         this._error = "";
         var _loc6_:Boolean = false;
         if(param1 == FRAGMENT)
         {
            _loc6_ = true;
         }
         else if(param1 != VERTEX)
         {
            this._error = "ERROR: mode needs to be \"" + FRAGMENT + "\" or \"" + VERTEX + "\" but is \"" + param1 + "\".";
         }
         this.agalcode.endian = Endian.LITTLE_ENDIAN;
         this.agalcode.writeByte(160);
         this.agalcode.writeUnsignedInt(param3);
         this.agalcode.writeByte(161);
         this.agalcode.writeByte(_loc6_ ? 1 : 0);
         this.initregmap(param3,param4);
         var _loc7_:Array = param2.replace(/[\f\n\r\v]+/g,"\n").split("\n");
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc11_:int = int(_loc7_.length);
         _loc10_ = 0;
         while(_loc10_ < _loc11_ && this._error == "")
         {
            _loc12_ = new String(_loc7_[_loc10_]);
            _loc12_ = _loc12_.replace(REGEXP_OUTER_SPACES,"");
            _loc13_ = _loc12_.search("//");
            if(_loc13_ != -1)
            {
               _loc12_ = _loc12_.slice(0,_loc13_);
            }
            _loc14_ = _loc12_.search(/<.*>/g);
            if(_loc14_ != -1)
            {
               _loc15_ = _loc12_.slice(_loc14_).match(/([\w\.\-\+]+)/gi);
               _loc12_ = _loc12_.slice(0,_loc14_);
            }
            _loc16_ = _loc12_.match(/^\w{3}/ig);
            if(!_loc16_)
            {
               if(_loc12_.length >= 3)
               {
               }
            }
            else
            {
               _loc17_ = OPMAP[_loc16_[0]];
               if(this.debugEnabled)
               {
               }
               if(_loc17_ == null)
               {
                  if(_loc12_.length >= 3)
                  {
                  }
               }
               else
               {
                  _loc12_ = _loc12_.slice(_loc12_.search(_loc17_.name) + _loc17_.name.length);
                  if(Boolean(_loc17_.flags & OP_VERSION2) && param3 < 2)
                  {
                     this._error = "error: opcode requires version 2.";
                     break;
                  }
                  if(Boolean(_loc17_.flags & OP_VERT_ONLY) && _loc6_)
                  {
                     this._error = "error: opcode is only allowed in vertex programs.";
                     break;
                  }
                  if(Boolean(_loc17_.flags & OP_FRAG_ONLY) && !_loc6_)
                  {
                     this._error = "error: opcode is only allowed in fragment programs.";
                     break;
                  }
                  if(this.verbose)
                  {
                  }
                  this.agalcode.writeUnsignedInt(_loc17_.emitCode);
                  if(++_loc9_ > MAX_OPCODES)
                  {
                     this._error = "error: too many opcodes. maximum is " + MAX_OPCODES + ".";
                     break;
                  }
                  _loc18_ = _loc12_.match(/vc\[([vof][acostdip]?)(\d*)?(\.[xyzw](\+\d{1,3})?)?\](\.[xyzw]{1,4})?|([vof][acostdip]?)(\d*)?(\.[xyzw]{1,4})?/gi);
                  if(!_loc18_ || _loc18_.length != _loc17_.numRegister)
                  {
                     this._error = "error: wrong number of operands. found " + _loc18_.length + " but expected " + _loc17_.numRegister + ".";
                     break;
                  }
                  _loc19_ = false;
                  _loc20_ = 64 + 64 + 32;
                  _loc21_ = _loc18_.length;
                  _loc22_ = 0;
                  while(_loc22_ < _loc21_)
                  {
                     _loc23_ = false;
                     _loc24_ = _loc18_[_loc22_].match(/\[.*\]/ig);
                     if((Boolean(_loc24_)) && _loc24_.length > 0)
                     {
                        _loc18_[_loc22_] = _loc18_[_loc22_].replace(_loc24_[0],"0");
                        if(this.verbose)
                        {
                        }
                        _loc23_ = true;
                     }
                     _loc25_ = _loc18_[_loc22_].match(/^\b[A-Za-z]{1,2}/ig);
                     if(!_loc25_)
                     {
                        this._error = "error: could not parse operand " + _loc22_ + " (" + _loc18_[_loc22_] + ").";
                        _loc19_ = true;
                        break;
                     }
                     _loc26_ = REGMAP[_loc25_[0]];
                     if(this.debugEnabled)
                     {
                     }
                     if(_loc26_ == null)
                     {
                        this._error = "error: could not find register name for operand " + _loc22_ + " (" + _loc18_[_loc22_] + ").";
                        _loc19_ = true;
                        break;
                     }
                     if(_loc6_)
                     {
                        if(!(_loc26_.flags & REG_FRAG))
                        {
                           this._error = "error: register operand " + _loc22_ + " (" + _loc18_[_loc22_] + ") only allowed in vertex programs.";
                           _loc19_ = true;
                           break;
                        }
                        if(_loc23_)
                        {
                           this._error = "error: register operand " + _loc22_ + " (" + _loc18_[_loc22_] + ") relative adressing not allowed in fragment programs.";
                           _loc19_ = true;
                           break;
                        }
                     }
                     else if(!(_loc26_.flags & REG_VERT))
                     {
                        this._error = "error: register operand " + _loc22_ + " (" + _loc18_[_loc22_] + ") only allowed in fragment programs.";
                        _loc19_ = true;
                        break;
                     }
                     _loc18_[_loc22_] = _loc18_[_loc22_].slice(_loc18_[_loc22_].search(_loc26_.name) + _loc26_.name.length);
                     _loc27_ = _loc23_ ? _loc24_[0].match(/\d+/) : _loc18_[_loc22_].match(/\d+/);
                     _loc28_ = 0;
                     if(_loc27_)
                     {
                        _loc28_ = uint(_loc27_[0]);
                     }
                     if(_loc26_.range < _loc28_)
                     {
                        this._error = "error: register operand " + _loc22_ + " (" + _loc18_[_loc22_] + ") index exceeds limit of " + (_loc26_.range + 1) + ".";
                        _loc19_ = true;
                        break;
                     }
                     _loc29_ = 0;
                     _loc30_ = _loc18_[_loc22_].match(/(\.[xyzw]{1,4})/);
                     _loc31_ = _loc22_ == 0 && !(_loc17_.flags & OP_NO_DEST);
                     _loc32_ = _loc22_ == 2 && Boolean(_loc17_.flags & OP_SPECIAL_TEX);
                     _loc33_ = 0;
                     _loc34_ = 0;
                     _loc35_ = 0;
                     if(_loc31_ && _loc23_)
                     {
                        this._error = "error: relative can not be destination";
                        _loc19_ = true;
                        break;
                     }
                     if(_loc30_)
                     {
                        _loc29_ = 0;
                        _loc37_ = uint(_loc30_[0].length);
                        _loc38_ = 1;
                        while(_loc38_ < _loc37_)
                        {
                           _loc36_ = _loc30_[0].charCodeAt(_loc38_) - "x".charCodeAt(0);
                           if(_loc36_ > 2)
                           {
                              _loc36_ = 3;
                           }
                           if(_loc31_)
                           {
                              _loc29_ |= 1 << _loc36_;
                           }
                           else
                           {
                              _loc29_ |= _loc36_ << (_loc38_ - 1 << 1);
                           }
                           _loc38_++;
                        }
                        if(!_loc31_)
                        {
                           while(_loc38_ <= 4)
                           {
                              _loc29_ |= _loc36_ << (_loc38_ - 1 << 1);
                              _loc38_++;
                           }
                        }
                     }
                     else
                     {
                        _loc29_ = _loc31_ ? 15 : 228;
                     }
                     if(_loc23_)
                     {
                        _loc39_ = _loc24_[0].match(/[A-Za-z]{1,2}/ig);
                        _loc40_ = REGMAP[_loc39_[0]];
                        if(_loc40_ == null)
                        {
                           this._error = "error: bad index register";
                           _loc19_ = true;
                           break;
                        }
                        _loc33_ = _loc40_.emitCode;
                        _loc41_ = _loc24_[0].match(/(\.[xyzw]{1,1})/);
                        if(_loc41_.length == 0)
                        {
                           this._error = "error: bad index register select";
                           _loc19_ = true;
                           break;
                        }
                        _loc34_ = _loc41_[0].charCodeAt(1) - "x".charCodeAt(0);
                        if(_loc34_ > 2)
                        {
                           _loc34_ = 3;
                        }
                        _loc42_ = _loc24_[0].match(/\+\d{1,3}/ig);
                        if(_loc42_.length > 0)
                        {
                           _loc35_ = int(_loc42_[0]);
                        }
                        if(_loc35_ < 0 || _loc35_ > 255)
                        {
                           this._error = "error: index offset " + _loc35_ + " out of bounds. [0..255]";
                           _loc19_ = true;
                           break;
                        }
                        if(this.verbose)
                        {
                        }
                     }
                     if(this.verbose)
                     {
                     }
                     if(_loc31_)
                     {
                        this.agalcode.writeShort(_loc28_);
                        this.agalcode.writeByte(_loc29_);
                        this.agalcode.writeByte(_loc26_.emitCode);
                        _loc20_ -= 32;
                     }
                     else if(_loc32_)
                     {
                        if(this.verbose)
                        {
                        }
                        _loc43_ = 5;
                        _loc44_ = _loc15_ == null ? 0 : _loc15_.length;
                        _loc45_ = 0;
                        _loc38_ = 0;
                        while(_loc38_ < _loc44_)
                        {
                           if(this.verbose)
                           {
                           }
                           _loc46_ = SAMPLEMAP[_loc15_[_loc38_]];
                           if(_loc46_ == null)
                           {
                              _loc45_ = Number(_loc15_[_loc38_]);
                              if(this.verbose)
                              {
                              }
                           }
                           else
                           {
                              if(_loc46_.flag != SAMPLER_SPECIAL_SHIFT)
                              {
                                 _loc43_ &= ~(15 << _loc46_.flag);
                              }
                              _loc43_ |= uint(_loc46_.mask) << uint(_loc46_.flag);
                           }
                           _loc38_++;
                        }
                        this.agalcode.writeShort(_loc28_);
                        this.agalcode.writeByte(int(_loc45_ * 8));
                        this.agalcode.writeByte(0);
                        this.agalcode.writeUnsignedInt(_loc43_);
                        if(this.verbose)
                        {
                        }
                        _loc20_ -= 64;
                     }
                     else
                     {
                        if(_loc22_ == 0)
                        {
                           this.agalcode.writeUnsignedInt(0);
                           _loc20_ -= 32;
                        }
                        this.agalcode.writeShort(_loc28_);
                        this.agalcode.writeByte(_loc35_);
                        this.agalcode.writeByte(_loc29_);
                        this.agalcode.writeByte(_loc26_.emitCode);
                        this.agalcode.writeByte(_loc33_);
                        this.agalcode.writeShort(_loc23_ ? _loc34_ | 1 << 15 : 0);
                        _loc20_ -= 64;
                     }
                     _loc22_++;
                  }
                  _loc22_ = 0;
                  while(_loc22_ < _loc20_)
                  {
                     this.agalcode.writeByte(0);
                     _loc22_ += 8;
                  }
                  if(_loc19_)
                  {
                     break;
                  }
               }
            }
            _loc10_++;
         }
         if(this._error != "")
         {
            this._error += "\n  at line " + _loc10_ + " " + _loc7_[_loc10_];
            this.agalcode.length = 0;
         }
         if(this.debugEnabled)
         {
            _loc47_ = "generated bytecode:";
            _loc48_ = this.agalcode.length;
            _loc49_ = 0;
            while(_loc49_ < _loc48_)
            {
               if(!(_loc49_ % 16))
               {
                  _loc47_ += "\n";
               }
               if(!(_loc49_ % 4))
               {
                  _loc47_ += " ";
               }
               _loc50_ = this.agalcode[_loc49_].toString(16);
               if(_loc50_.length < 2)
               {
                  _loc50_ = "0" + _loc50_;
               }
               _loc47_ += _loc50_;
               _loc49_++;
            }
         }
         if(this.verbose)
         {
         }
         return this.agalcode;
      }
      
      private function initregmap(param1:uint, param2:Boolean) : void
      {
         // method body index: 2769 method index: 2783
         REGMAP[VA] = new Register(VA,"vertex attribute",0,param2 ? 1024 : 7,REG_VERT | REG_READ);
         REGMAP[VC] = new Register(VC,"vertex constant",1,param2 ? 1024 : (param1 == 1 ? 127 : 250),REG_VERT | REG_READ);
         REGMAP[VT] = new Register(VT,"vertex temporary",2,param2 ? 1024 : (param1 == 1 ? 7 : 27),REG_VERT | REG_WRITE | REG_READ);
         REGMAP[VO] = new Register(VO,"vertex output",3,param2 ? 1024 : 0,REG_VERT | REG_WRITE);
         REGMAP[VI] = new Register(VI,"varying",4,param2 ? 1024 : (param1 == 1 ? 7 : 11),REG_VERT | REG_FRAG | REG_READ | REG_WRITE);
         REGMAP[FC] = new Register(FC,"fragment constant",1,param2 ? 1024 : (param1 == 1 ? 27 : 63),REG_FRAG | REG_READ);
         REGMAP[FT] = new Register(FT,"fragment temporary",2,param2 ? 1024 : (param1 == 1 ? 7 : 27),REG_FRAG | REG_WRITE | REG_READ);
         REGMAP[FS] = new Register(FS,"texture sampler",5,param2 ? 1024 : 7,REG_FRAG | REG_READ);
         REGMAP[FO] = new Register(FO,"fragment output",3,param2 ? 1024 : (param1 == 1 ? 0 : 3),REG_FRAG | REG_WRITE);
         REGMAP[FD] = new Register(FD,"fragment depth output",6,param2 ? 1024 : (param1 == 1 ? uint(-1) : 0),REG_FRAG | REG_WRITE);
         REGMAP["op"] = REGMAP[VO];
         REGMAP["i"] = REGMAP[VI];
         REGMAP["v"] = REGMAP[VI];
         REGMAP["oc"] = REGMAP[FO];
         REGMAP["od"] = REGMAP[FD];
         REGMAP["fi"] = REGMAP[VI];
      }
   }
}

class OpCode
{
   
   private var _emitCode:uint;
   
   private var _flags:uint;
   
   private var _name:String;
   
   private var _numRegister:uint;
   
   public function OpCode(param1:String, param2:uint, param3:uint, param4:uint)
   {
      // method body index: 2775 method index: 2789
      super();
      this._name = param1;
      this._numRegister = param2;
      this._emitCode = param3;
      this._flags = param4;
   }
   
   public function get emitCode() : uint
   {
      // method body index: 2771 method index: 2785
      return this._emitCode;
   }
   
   public function get flags() : uint
   {
      // method body index: 2772 method index: 2786
      return this._flags;
   }
   
   public function get name() : String
   {
      // method body index: 2773 method index: 2787
      return this._name;
   }
   
   public function get numRegister() : uint
   {
      // method body index: 2774 method index: 2788
      return this._numRegister;
   }
   
   public function toString() : String
   {
      // method body index: 2776 method index: 2790
      return "[OpCode name=\"" + this._name + "\", numRegister=" + this._numRegister + ", emitCode=" + this._emitCode + ", flags=" + this._flags + "]";
   }
}

class Register
{
   
   private var _emitCode:uint;
   
   private var _name:String;
   
   private var _longName:String;
   
   private var _flags:uint;
   
   private var _range:uint;
   
   public function Register(param1:String, param2:String, param3:uint, param4:uint, param5:uint)
   {
      // method body index: 2783 method index: 2797
      super();
      this._name = param1;
      this._longName = param2;
      this._emitCode = param3;
      this._range = param4;
      this._flags = param5;
   }
   
   public function get emitCode() : uint
   {
      // method body index: 2778 method index: 2792
      return this._emitCode;
   }
   
   public function get longName() : String
   {
      // method body index: 2779 method index: 2793
      return this._longName;
   }
   
   public function get name() : String
   {
      // method body index: 2780 method index: 2794
      return this._name;
   }
   
   public function get flags() : uint
   {
      // method body index: 2781 method index: 2795
      return this._flags;
   }
   
   public function get range() : uint
   {
      // method body index: 2782 method index: 2796
      return this._range;
   }
   
   public function toString() : String
   {
      // method body index: 2784 method index: 2798
      return "[Register name=\"" + this._name + "\", longName=\"" + this._longName + "\", emitCode=" + this._emitCode + ", range=" + this._range + ", flags=" + this._flags + "]";
   }
}

class Sampler
{
   
   private var _flag:uint;
   
   private var _mask:uint;
   
   private var _name:String;
   
   public function Sampler(param1:String, param2:uint, param3:uint)
   {
      // method body index: 2789 method index: 2803
      super();
      this._name = param1;
      this._flag = param2;
      this._mask = param3;
   }
   
   public function get flag() : uint
   {
      // method body index: 2786 method index: 2800
      return this._flag;
   }
   
   public function get mask() : uint
   {
      // method body index: 2787 method index: 2801
      return this._mask;
   }
   
   public function get name() : String
   {
      // method body index: 2788 method index: 2802
      return this._name;
   }
   
   public function toString() : String
   {
      // method body index: 2790 method index: 2804
      return "[Sampler name=\"" + this._name + "\", flag=\"" + this._flag + "\", mask=" + this.mask + "]";
   }
}
