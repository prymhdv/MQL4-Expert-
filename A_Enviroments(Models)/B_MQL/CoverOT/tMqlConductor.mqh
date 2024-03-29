//+------------------------------------------------------------------+
//|                                                  St_MqlCondicator.mqh |
//|                                                    A pourya 2021 |
//|                                                @prymhdvgmail.com |
//+------------------------------------------------------------------+
#property copyright "A pourya 2021"
#property link      "@prymhdvgmail.com"
#property version   "1.00"
#property strict
//#include <0srcCapitan\QuartsExperts\TOOLSController.mqh>
//#include <0srcCapitan\QuartsExperts\ErrorController.mqh>
//#include <0srcCapitan\QuartsExperts\MyRoboTrader.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Bases\.BaseWall.mqh>


//+------------------------------------------------------------------+
//|             Class MyRoboTrader Condicator  BEGIN                 |
//+------------------------------------------------------------------+
template<typename _Period_>
struct St_X_periods
{         _Period_    _CURRENT;
          _Period_    _MN1;
          _Period_    _W1;
          _Period_    _D1;
          _Period_    _H4;
          _Period_    _H1;
          _Period_    _M30;
          _Period_    _M15;
          _Period_    _M5;
          _Period_    _M1;
          //
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

struct Std_LevelPrice_Elements
{         float     Posetive;
          float     Posetive__Distance;
          float     Negative;
          float     Negative__Distance; //
}; //

struct Std_LevelPrice
{         //---
          Std_LevelPrice_Elements Level_X_XPoint;

          //---
          Std_LevelPrice_Elements Level[10];
          //Std_LevelPrice_Elements Level_1_200Point;
          //Std_LevelPrice_Elements Level_2_300Point;
          //Std_LevelPrice_Elements Level_3_500Point;
          //Std_LevelPrice_Elements Level_4_800Point;
          //Std_LevelPrice_Elements Level_5_1300Point;
          //Std_LevelPrice_Elements Level_5_1300Point;
          //Std_LevelPrice_Elements Level_6_2100Point;
          //Std_LevelPrice_Elements Level_7_3400Point;
          //Std_LevelPrice_Elements Level_8_5500Point;
          //Std_LevelPrice_Elements Level_9_8900Point;
          //Std_LevelPrice_Elements Level_10_14400Point;


          //---
};
struct Std_Price
{         double        _Close,         Distance_Close;  //--disdtance to curent value close 0
          double        _Open,          Distance_Open;
          double        _High,          Distance_High;
          double        _Low,           Distance_Low;
          double        _Median,        Distance_Median;  //--- HL/2
          double        _Typical,       Distance_Typical;  //--- HLC/3
          double        _Weighted,      Distance_Weighted; //--- HLCC/4
          double        _previus_Ind,   Distance_previus_Ind;
          double        _frist_Ind,     Distance_frist_Ind;
          //---
          Std_LevelPrice _Close_Level;
          Std_LevelPrice _Open_Level;
          Std_LevelPrice _High_Level;
          Std_LevelPrice _Low_Level;
          Std_LevelPrice _Median_Level;
          Std_LevelPrice _Typical_Level;
          Std_LevelPrice _Weighted_Level;
          Std_LevelPrice _previus_Ind_Level;
          Std_LevelPrice _frist_Ind_Level;
          template<typename T> bool  Set_Price_Values(T &t, int i = 0, ENUM_TIMEFRAMES f = PERIOD_CURRENT);


};
//+------------------------------------------------------------------+
//|                                                                  | !!!  t.EMA500_Close._Valueis  not defined layers.
//+------------------------------------------------------------------+
template<typename T>
bool Std_Price::Set_Price_Values(T &t, int i = 0, ENUM_TIMEFRAMES f = PERIOD_CURRENT)
{         //---
//---
//Indicators_MA.EMA500_Close._Price._Close_Level.Level_3_500Point_Posetive = Indicators_MA.EMA500_Close._Value + (500 * Point);
//Indicators_MA.EMA500_Close._Price._Close_Level.Level_3_500Point_Negative = Indicators_MA.EMA500_Close._Value - (500 * Point);
//---
          _Close_Level.Level[0].Posetive                = (float)NormalizeDouble(t._Value + (200 * Point), Digits);
          _Close_Level.Level[0].Posetive__Distance      = (float)NormalizeDouble(t._Value + (200 * Point) - iClose(NULL, f, i), Digits);;
          _Close_Level.Level[0].Negative                = (float)NormalizeDouble(t._Value - (200 * Point), Digits);
          _Close_Level.Level[0].Negative__Distance      = (float)NormalizeDouble(t._Value - (200 * Point) - iClose(NULL, f, i), Digits);;
//---
          _Close_Level.Level[1].Posetive                = (float)NormalizeDouble(t._Value + (300 * Point), Digits);
          _Close_Level.Level[1].Negative                = (float)NormalizeDouble(t._Value - (300 * Point), Digits);
//---
          _Close_Level.Level[2].Posetive                = (float)NormalizeDouble(t._Value + (500 * Point), Digits);
          _Close_Level.Level[2].Negative                = (float)NormalizeDouble(t._Value - (500 * Point), Digits);
//---
          _Close_Level.Level[3].Posetive                = (float)NormalizeDouble(t._Value + (800 * Point), Digits);
          _Close_Level.Level[3].Negative                = (float)NormalizeDouble(t._Value - (800 * Point), Digits);
//---
          _Close_Level.Level[4].Posetive                = (float)NormalizeDouble(t._Value + (1300 * Point), Digits);
          _Close_Level.Level[4].Posetive__Distance      = (float)NormalizeDouble(t._Value + (1300 * Point) - iClose(NULL, f, i), Digits);;
          _Close_Level.Level[4].Negative                = (float)NormalizeDouble(t._Value - (1300 * Point), Digits);
          _Close_Level.Level[4].Negative__Distance      = (float)NormalizeDouble(t._Value - (1300 * Point) - iClose(NULL, f, i), Digits);;
//---
          _Close_Level.Level[5].Posetive                = (float)NormalizeDouble(t._Value + (2100 * Point), Digits);
          _Close_Level.Level[5].Negative                = (float)NormalizeDouble(t._Value - (2100 * Point), Digits);
//---
          _Close_Level.Level[6].Posetive                = (float)NormalizeDouble(t._Value + (3400 * Point), Digits);
          _Close_Level.Level[6].Negative                = (float)NormalizeDouble(t._Value - (3400 * Point), Digits);
//---
          _Close_Level.Level[7].Posetive                = (float)NormalizeDouble(t._Value + (5500 * Point), Digits);
          _Close_Level.Level[7].Negative                = (float)NormalizeDouble(t._Value - (5500 * Point), Digits);
//---
          _Close_Level.Level[8].Posetive                = (float)NormalizeDouble(t._Value + (8900 * Point), Digits);
          _Close_Level.Level[8].Negative                = (float)NormalizeDouble(t._Value - (8900 * Point), Digits);
//---
          _Close_Level.Level[9].Posetive                = (float)NormalizeDouble(t._Value + (14400 * Point), Digits);
          _Close_Level.Level[9].Negative                = (float)NormalizeDouble(t._Value - (14400 * Point), Digits);
//---
//---
          Distance_Close = t._Value - (float)iClose(NULL, f, i);  //posetive mean uper curent close negativew mean under current close
          Distance_Open  = t._Value - (float)iOpen(NULL, f, i);
          Distance_High  = t._Value - (float)iHigh(NULL, f, i);
          Distance_Low   = t._Value - (float)iLow(NULL, f, i);
//---
//---
          return true;//
}

//+------------------------------------------------------------------+
//|             Class MyRoboTrader Condicator  BEGIN                 |
//+------------------------------------------------------------------+
struct Std_Indicator_Base
{         double       _Value;
          datetime     _Time;    //---candel info
          double       _Close;   //---candel info
          double       _Open;    //---candel info
          double       _High;    //---candel info
          double       _Low;     //---candel info
          double       _Median;
          //
          double       _MovingAvrage;
          bool         Is_Basic_Bulish_MovingAvrage;
          ///int                   Shift;
          Std_Price    _Price;
          //---
          string                symbol;           // symbol
          ENUM_TIMEFRAMES       timeframe;        // timeframe
};
struct Std_Indicator_Base_B
{         double       _Value;
          double       _Value_Level_p300;
          double       _Value_Level_n300;
          double       _Value_Level_p500;
          double       _Value_Level_n500;
          double       _Value_Level_p800;
          double       _Value_Level_n800;
          double       _Value_Level_p1300;
          double       _Value_Level_n1300;
          double       _Value_Level_p2100;
          double       _Value_Level_n2100;
          void          SetLevels()
          {         _Value_Level_p300 = (float)(_Value + 3.00);
                    _Value_Level_n300 = (float)(_Value - 3.00);;
                    _Value_Level_p500 = (float)(_Value + 5.00);;
                    _Value_Level_n500 = (float)(_Value - 5.00);;
                    _Value_Level_p800 = (float)(_Value + 8.00);;
                    _Value_Level_n800 = (float)(_Value - 8.00);;
                    //
          }
          /*---off---
           datetime     _Time;    //---candel info
           double       _Close;   //---candel info
           double       _Open;    //---candel info
           double       _High;    //---candel info
           double       _Low;     //---candel info
           double       _Median;
           //
           double       _MovingAvrage;
           bool         Is_Basic_Bulish_MovingAvrage;
           ///int                   Shift;
          */
          //---
          string                symbol;           // symbol
          ENUM_TIMEFRAMES       timeframe;        // timeframe
};
//---
//---
struct St_iAC: Std_Indicator_Base
{         void St_iAC() {};
          void St_iAC(string s, ENUM_TIMEFRAMES f, int sh) { symbol = s; timeframe = f; shift = sh;};

          //string                symbol;     // symbol
          //ENUM_TIMEFRAMES       timeframe;  // timeframe
          int                   shift;       // shift
};
struct St_iAD: Std_Indicator_Base
{         void St_iAD() {};
          void St_iAD(string s, ENUM_TIMEFRAMES f, int sh) { symbol = s; timeframe = f; shift = sh;};

          //string                symbol;     // symbol
          //ENUM_TIMEFRAMES       timeframe;  // timeframe
          int                   shift;       // shift
};
struct St_iADX: Std_Indicator_Base
{         void St_iADX() {};
          void St_iADX(string s, ENUM_TIMEFRAMES f, int pe, int ap, int mo, int sh) { symbol = s; timeframe = f; period = pe; applied_price = ap; mode = mo; shift = sh;};

          //string                symbol;        // symbol
          //ENUM_TIMEFRAMES       timeframe;     // timeframe
          int                   period;        // averaging period
          int                   applied_price; // applied price
          int                   mode;          // line index
          int                   shift;          // shift
};
struct St_iAlligator: Std_Indicator_Base
{         void St_iAlligator() {};
          void St_iAlligator(string s, ENUM_TIMEFRAMES f, int ja, int ja_sh, int te, int te_sh, int li, int li_sh, int me, int ap, int mo, int sh) { symbol = s; timeframe = f; jaw_period = ja; jaw_shift = ja_sh; teeth_period = te; teeth_shift = te_sh; lips_period = li; lips_shift = li_sh;   ma_method = me; applied_price = ap; mode = mo; shift = sh;};

          //string                symbol;            // symbol
          //ENUM_TIMEFRAMES       timeframe;         // timeframe
          int                   jaw_period;        // Jaw line averaging period
          int                   jaw_shift;         // Jaw line shift
          int                   teeth_period;      // Teeth line averaging period
          int                   teeth_shift;       // Teeth line shift
          int                   lips_period;       // Lips line averaging period
          int                   lips_shift;        // Lips line shift
          int                   ma_method;         // averaging method
          int                   applied_price;     // applied price
          int                   mode;              // line index
          int                   shift;              // shift
};
struct St_iAO: Std_Indicator_Base
{         void St_iAO() {};
          void St_iAO(string s, ENUM_TIMEFRAMES f, int sh)                                                      { symbol = s;     timeframe = f;      shift = sh;};

          //string                symbol;        // symbol
          //ENUM_TIMEFRAMES       timeframe;      // timeframe
          int                   shift;           // shift
};
struct St_iATR: Std_Indicator_Base
{         void St_iATR() {};
          void St_iATR(string s, ENUM_TIMEFRAMES f, int pe, int sh)                                             { symbol = s;     timeframe = f; period = pe;    shift = sh;};

          //string                symbol;         // symbol
          //ENUM_TIMEFRAMES       timeframe;      // timeframe
          int                   period;         // averaging period
          int                   shift;           // shift
};
struct St_iBearsPower: Std_Indicator_Base
{         void St_iBearsPower() {};
          void St_iBearsPower(string s, ENUM_TIMEFRAMES f, int pe, int ap, int sh)                              { symbol = s;     timeframe = f; period = pe;   applied_price = ap;  shift = sh;};

          //string                symbol;         // symbol
          //ENUM_TIMEFRAMES       timeframe;      // timeframe
          int                   period;         // averaging period
          int                   applied_price;  // applied price
          int                   shift;           // shift
};
struct St_iBullsPower: Std_Indicator_Base
{         void St_iBullsPower() {};
          void St_iBullsPower(string s, ENUM_TIMEFRAMES f, int pe, int ap, int sh)                              { symbol = s;     timeframe = f; period = pe;   applied_price = ap;  shift = sh;};

          //string                symbol;           // symbol
          //ENUM_TIMEFRAMES       timeframe;        // timeframe
          int                   period;           // averaging period
          int                   applied_price;    // applied price
          int                   shift;             // shift
};
struct St_iBands: Std_Indicator_Base
{         void St_iBands() {};
          void St_iBands(string s, ENUM_TIMEFRAMES f, int pe, double de, int ba, int ap, int mo, int sh)        { symbol = s;     timeframe = f; period = pe;  deviation = de; bands_shift = ba; applied_price = ap; mode = mo;  shift = sh;};

          //string                symbol;         // symbol
          //ENUM_TIMEFRAMES       timeframe;      // timeframe
          int                   period;         // averaging period
          double                deviation;      // standard deviations
          int                   bands_shift;    // bands shift
          int                   applied_price;  // applied price
          int                   mode;           // line index
          int                   shift;           // shift
};
struct St_iBandsOnArray: Std_Indicator_Base
{         void St_iBandsOnArray() {};
          void St_iBandsOnArray(double &ar[], int to, int pe, double de, int ba,  int mo, int sh)               { ArrayCopy(array, ar);       total = to; period = pe;  deviation = de; bands_shift = ba;   mode = mo;  shift = sh; };

          double        array[];           // array with data
          int           total;            // number of elements
          int           period;           // averaging period
          double        deviation;        // deviation
          int           bands_shift;      // bands shift
          int           mode;             // line index
          int           shift;             // shift
};

struct St_iCCI: Std_Indicator_Base
{         void St_iCCI() {};
          void St_iCCI(string s, ENUM_TIMEFRAMES f, int pe, int ap, int sh)                                     { symbol = s;     timeframe = f; period = pe;  applied_price = ap; shift = sh;};

          //string                symbol;           // symbol
          //ENUM_TIMEFRAMES       timeframe;        // timeframe
          int                   period;           // averaging period
          int                   applied_price;    // applied price
          int                   shift;             // shift
};
struct St_iCCIOnArray: Std_Indicator_Base
{         void St_iCCIOnArray() {};
          void St_iCCIOnArray(double &ar[], int to, int pe, int sh)                                             { ArrayCopy(array, ar);  total = to; period = pe; shift = sh; };

          double        array[];        // array with data
          int           total;         // number of elements
          int           period;         // averaging period
          int           shift;           // shift
};
struct St_iCustom: Std_Indicator_Base
{         void St_iCustom() {};
          void St_iCustom(string s, ENUM_TIMEFRAMES f, string na, int li, int sh)                               { symbol = s;     timeframe = f; name = na;   line_index = li;  shift = sh;};

          //string                symbol;         // symbol
          //ENUM_TIMEFRAMES       timeframe;      // timeframe
          string                name;           // path/name of the custom indicator compiled program
          // .                                // custom indicator input parameters (if necessary)
          int                   line_index;           // line index
          int                   shift;           // shift
};
struct St_iDeMarker: Std_Indicator_Base
{         void St_iDeMarker() {};
          void St_iDeMarker(string s, ENUM_TIMEFRAMES f, int pe, int ap, int sh)                                { symbol = s;     timeframe = f; period = pe; shift = sh;};

          //string                symbol;         // symbol
          //ENUM_TIMEFRAMES       timeframe;      // timeframe
          int                   period;         // averaging period
          int                   shift;           // shift
};
struct St_iEnvelopes: Std_Indicator_Base
{         void St_iEnvelopes() {};
          void St_iEnvelopes(string s, ENUM_TIMEFRAMES f, int ma_pe, int ma_me, int ma_sh, int ap, int de, int mo, int sh)      { symbol = s;     timeframe = f; ma_period = ma_pe;  ma_method = ma_me;  ma_shift = ma_sh; applied_price = ap; deviation = de; mode = mo; shift = sh;};

          //string                symbol;           // symbol
          //ENUM_TIMEFRAMES       timeframe;        // timeframe
          int                   ma_period;        // MA averaging period
          int                   ma_method;        // MA averaging method
          int                   ma_shift;         // moving average shift
          int                   applied_price;    // applied price
          double                deviation;        // deviation (in percents)
          int                   mode;             // line index
          int                   shift;             // shift
};
struct St_iEnvelopesOnArray: Std_Indicator_Base
{         void St_iEnvelopesOnArray() {};
          void St_iEnvelopesOnArray(double &ar[], int to,  int ma_pe, int ma_me, int ma_sh, int de, int mo, int sh)             { ArrayCopy(array, ar);  total = to; ma_period = ma_pe;  ma_method = ma_me;  ma_shift = ma_sh; deviation = de; mode = mo; shift = sh; };

          double                array[];        // array with data
          int                   total;          // number of elemements
          int                   ma_period;      // MA averaging period
          int                   ma_method;      // MA averaging method
          int                   ma_shift;       // MA shift
          double                deviation;      // deviation (in percents)
          int                   mode;           // line index
          int                   shift;           // shift
};
struct St_iForce: Std_Indicator_Base
{         void St_iForce() {};
          void St_iForce(string s, ENUM_TIMEFRAMES f, int pe, int ma_me, int ap, int sh)                                        { symbol = s;     timeframe = f; period = pe; ma_method = ma_me;  applied_price = ap; shift = sh;};

          //string                symbol;         // symbol
          //ENUM_TIMEFRAMES       timeframe;      // timeframe
          int                   period;         // averaging period
          int                   ma_method;      // averaging method
          int                   applied_price;  // applied price
          int                   shift;           // shift
};
struct St_iFractals: Std_Indicator_Base
{         void St_iFractals() {};
          void St_iForce(string s, ENUM_TIMEFRAMES f, int li,  int sh)                                                          { symbol = s;     timeframe = f; line_index = li;  shift = sh;};

          //string                symbol;         // symbol
          //ENUM_TIMEFRAMES       timeframe;      // timeframe
          int                   line_index;           // line index
          int                   shift;           // shift
};
struct St_iGator: Std_Indicator_Base
{         void St_iGator() {};
          void St_iGator(string s, ENUM_TIMEFRAMES f, int ja, int ja_sh, int te, int te_sh, int li, int li_sh, int me, int ap, int mo, int sh)          { symbol = s; timeframe = f;      jaw_period = ja; jaw_shift = ja_sh;     teeth_period = te; teeth_shift = te_sh;         lips_period = li; lips_shift = li_sh;   ma_method = me; applied_price = ap; mode = mo; shift = sh;};

          //string                symbol;            // symbol
          //ENUM_TIMEFRAMES       timeframe;         // timeframe
          int                   jaw_period;        // Jaw line period
          int                   jaw_shift;         // Jaw line shift
          int                   teeth_period;      // Teeth line period
          int                   teeth_shift;       // Teeth line shift
          int                   lips_period;       // Lips line period
          int                   lips_shift;        // Lips line shift
          int                   ma_method;         // MA averaging method
          int                   applied_price;     // applied price
          int                   mode;              // line index
          int                   shift;              // shift
};
struct St_iIchimoku: Std_Indicator_Base
{         void St_iIchimoku() {};
          void St_iIchimoku(string s, ENUM_TIMEFRAMES f, int ten, int kij, int sen, int mo, int sh)                                                     { symbol = s; timeframe = f;  tenkan_sen = ten;       kijun_sen = kij;        senkou_span_b = sen;    mode =  mo;     shift = sh;};

          //string                symbol;            // symbol
          //ENUM_TIMEFRAMES       timeframe;         // timeframe
          int                   tenkan_sen;        // period of Tenkan-sen line
          int                   kijun_sen;         // period of Kijun-sen line
          int                   senkou_span_b;     // period of Senkou Span B line
          int                   mode;              // line index
          int                   shift;              // shift
};
struct St_iBWMFI: Std_Indicator_Base
{         void St_iBWMFI();
          void St_iBWMFI(string s, ENUM_TIMEFRAMES f, int sh)                                                                                           { symbol = s; timeframe = f;     shift = sh;};

          //string                symbol;         // symbol
          //ENUM_TIMEFRAMES       timeframe;      // timeframe
          int                   shift;           // shift
};
struct St_iMomentum: Std_Indicator_Base
{         void St_iMomentum() {};
          void St_iMomentum(string s, ENUM_TIMEFRAMES f, int pe, int ap, int sh)                                                                        { symbol = s; timeframe = f; period = pe;  applied_price = ap;  shift = sh;};

          //string                symbol;         // symbol
          //ENUM_TIMEFRAMES       timeframe;      // timeframe
          int                   period;         // averaging period
          int                   applied_price;  // applied price
          int                   shift;          // shift
};
struct St_iMomentumOnArray: Std_Indicator_Base
{         void St_iMomentumOnArray() {};
          void St_iMomentumOnArray(double &ar[], int to, int pe, int sh)                                                                                { ArrayCopy(array, ar);  total = to; period = pe; shift = sh; };

          double        array[];        // array with data
          int           total;          // number of elements
          int           period;         // averaging period
          int           shift;           // shift
};
struct St_iMFI: Std_Indicator_Base_B
{         void St_iMFI() {};
          void St_iMFI(string s, ENUM_TIMEFRAMES f, int pe, int sh)                                                                                     { symbol = s; timeframe = f;  period = pe;   shift = sh;};

          //string                symbol;     // symbol
          //ENUM_TIMEFRAMES       timeframe;  // timeframe
          int                   period;     // averaging period
          int                   shift;       // shift
};
struct St_iMA: Std_Indicator_Base ///Std_Indicator_Base_B
{         void St_iMA() {};
          void St_iMA(string s, ENUM_TIMEFRAMES f, int ma_pe, int ma_sh, int ma_me, int ap, int sh)                       { symbol = s; timeframe = f;  ma_period = ma_pe;  ma_shift_Line = ma_sh;   ma_method = ma_me;   applied_price = ap; shift = sh;};

          //string                symbol;           // symbol
          //ENUM_TIMEFRAMES       timeframe;        // timeframe          //--or return int
          int                   ma_period;        // MA averaging period
          int                   ma_shift_Line;    // MA shift
          int                   ma_method;        // averaging method //--or return int       int   ENUM_MA_METHOD
          int                   applied_price;    // applied price
          int                   shift;             // shift
};
struct St_iMA_B: Std_Indicator_Base_B ///Std_Indicator_Base_B
{         void St_iMA() {};
          void St_iMA(string s, ENUM_TIMEFRAMES f, int ma_pe, int ma_sh, int ma_me, int ap, int sh)                       { symbol = s; timeframe = f;  ma_period = ma_pe;  ma_shift_Line = ma_sh;   ma_method = ma_me;   applied_price = ap; shift = sh;};

          //string                symbol;           // symbol
          //ENUM_TIMEFRAMES       timeframe;        // timeframe          //--or return int
          int                   ma_period;        // MA averaging period
          int                   ma_shift_Line;    // MA shift
          int                   ma_method;        // averaging method //--or return int       int   ENUM_MA_METHOD
          int                   applied_price;    // applied price
          int                   shift;             // shift
};

struct St_iMAOnArray: Std_Indicator_Base
{         void St_iMAOnArray() {};
          void St_iMAOnArray(double &ar[], int to, int ma_pe, int ma_sh, ENUM_MA_METHOD ma_me, int sh)                                                  { ArrayCopy(array, ar);  total = to;  ma_period = ma_pe;  ma_shift = ma_sh;   ma_method = ma_me; shift = sh; };

          double                array[];          // array with data
          int                   total;            // number of elements
          int                   ma_period;        // MA averaging period
          int                   ma_shift;         // MA shift
          ENUM_MA_METHOD        ma_method;        // MA averaging method
          int                   shift;             // shift
};
struct St_iOsMA: Std_Indicator_Base
{         void St_iOsMA() {};
          void St_iOsMA(string s, ENUM_TIMEFRAMES f, int fa, int sl, int si, int ap, int sh)                                                            { symbol = s;     timeframe = f;  fast_ema_period = fa;   slow_ema_period = sl;    signal_period = si;     applied_price = ap;     shift = sh;};
          //string                symbol;           // symbol
          //ENUM_TIMEFRAMES       timeframe;       // timeframe
          int                   fast_ema_period;  // Fast EMA period
          int                   slow_ema_period;  // Slow EMA period
          int                   signal_period;    // Signal line period
          int                   applied_price;    // applied price
          int                   shift;             // shift
};
struct St_iMACD: Std_Indicator_Base
{         void St_iMACD() {};
          void St_iMACD(string s, ENUM_TIMEFRAMES f, int fa, int sl, int si, ENUM_APPLIED_PRICE ap, int mo, int sh)                                                    { symbol = s;     timeframe = f;  fast_ema_period = fa;   slow_ema_period = sl;    signal_period = si;     applied_price = ap;     mode = mo;      shift = sh;};

          //string                symbol;           // symbol
          //ENUM_TIMEFRAMES       timeframe;        // timeframe
          int                   fast_ema_period;  // Fast EMA period
          int                   slow_ema_period;  // Slow EMA period
          int                   signal_period;    // Signal line period
          ENUM_APPLIED_PRICE    applied_price;    // applied price
          int                   mode;             // line index
          int                   shift;             // shift
};

struct St_iOBV: Std_Indicator_Base
{         void St_iOBV() {};
          void St_iOBV(string s, ENUM_TIMEFRAMES f, int ap, int sh)                                                                                     { symbol = s; timeframe = f;  applied_price = ap;   shift = sh;};

          //string                symbol;           // symbol
          //ENUM_TIMEFRAMES       timeframe;        // timeframe
          int                   applied_price;    // applied price
          int                   shift;             // shift
};
struct St_iSAR: Std_Indicator_Base
{         void St_iSAR() {};
          void St_iSAR(string s, ENUM_TIMEFRAMES f, double st, double ma,  int sh)                                                                     { symbol = s; timeframe = f;  step = st; maximum = ma;  shift = sh;};

          //string                symbol;            // symbol
          //ENUM_TIMEFRAMES       timeframe;         // timeframe
          double                step;              // price increment step - acceleration factor
          double                maximum;           // maximum value of step
          int                   shift;              // shift
};
struct St_iRSI: Std_Indicator_Base
{         void St_iRSI() {};
          void St_iRSI(string s, ENUM_TIMEFRAMES f, int pe, int ap, int sh)                                                                             { symbol = s; timeframe = f; period = pe;  applied_price = pe;   shift = sh;};

          //string                symbol;           // symbol
          //ENUM_TIMEFRAMES       timeframe;        // timeframe
          int                   period;           // period
          int                   applied_price;    // applied price
          int                   shift;             // shift
};
struct St_iRSIOnArray: Std_Indicator_Base
{         void St_iRSIOnArray() {};
          void St_iRSIOnArray(double &ar[], int to, int pe, int sh)                                                                                     { ArrayCopy(array, ar);  total = to; period = pe; shift = sh; };

          double        array[];         // array with data
          int           total;           // number of elements
          int           period;          // averaging period
          int           shift;           // shift
};
struct St_iRVI: Std_Indicator_Base
{         void St_iRVI() {};
          void St_iRVI(string s, ENUM_TIMEFRAMES f, int pe, int mo, int sh)                                                                             { symbol = s; timeframe = f; period = pe;  mode = mo;   shift = sh;};

          //string                symbol;           // symbol
          //ENUM_TIMEFRAMES       timeframe;        // timeframe
          int                   period;           // averaging period
          int                   mode;             // line index
          int                   shift;             // shift
};
struct St_iStdDev: Std_Indicator_Base
{         void St_iStdDev() {};
          void St_iStdDev(string s, ENUM_TIMEFRAMES f,   int ma_pe, int ma_sh, int ma_me, int ap, int sh)                                               { symbol = s; timeframe = f; ma_period = ma_pe;  ma_shift = ma_sh;   ma_method = ma_me;   applied_price = ap;   shift = sh;};

          //string                symbol;           // symbol
          //ENUM_TIMEFRAMES       timeframe;        // timeframe
          int                   ma_period;        // MA averaging period
          int                   ma_shift;         // MA shift
          int                   ma_method;        // MA averaging method
          int                   applied_price;    // applied price
          int                   shift;            // shift
};
struct St_iStdDevOnArray: Std_Indicator_Base
{         void St_iStdDevOnArray() {};
          void St_iStdDevOnArray(double &ar[], int to, int ma_pe, int ma_sh, int ma_me, int sh)                                                         { ArrayCopy(array, ar);  total = to; ma_period = ma_pe;  ma_shift = ma_sh;  ma_method = ma_me; shift = sh; };

          double        array[];          // array with data
          int           total;            // number of elements
          int           ma_period;        // MA averaging period
          int           ma_shift;         // MA shift
          int           ma_method;        // MA averaging method
          int           shift;             // shift
};
struct St_iStochastic: Std_Indicator_Base
{         void St_iStochastic() {};
          void St_iStochastic(string s, ENUM_TIMEFRAMES f,   int Kp, int Dp, int sl, int me, int pf, int mo, int sh)                                    { symbol = s; timeframe = f; Kperiod = Kp;  Dperiod = Dp;   slowing = sl;   method = me; price_field = pf; mode = mo;  shift = sh;};

          //string                symbol;           // symbol
          //ENUM_TIMEFRAMES       timeframe;        // timeframe
          int                   Kperiod;          // K line period
          int                   Dperiod;          // D line period
          int                   slowing;          // slowing
          int                   method;           // averaging method
          int                   price_field;      // price (Low/High or Close/Close)
          int                   mode;             // line index
          int                   shift;             // shift
};
struct St_iWPR: Std_Indicator_Base
{         void St_iWPR() {};
          void St_iWPR(string s, ENUM_TIMEFRAMES f, int pe, int sh)                                                                             { symbol = s; timeframe = f; period = pe; shift = sh;};

          //string                symbol;           // symbol
          //ENUM_TIMEFRAMES       timeframe;        // timeframe
          int                   period;           // period
          int                   shift;            // shift
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class St_MqlCondicator//---- : public A_CONDUCTOR  //---error--- 'Conductor' - cannot instantiate abstract class   .CoverOT.mqh        18        99
{         /* =====================================================================================================================================
          *  =====================================================================================================================================
          * MQL4 Reference / Technical Indicators  ???????????
          * Technical Indicator Functions
          * A group of functions intended for calculation of standard and custom indicators.
          *
          * For an Expert Advisor (or any other MQL4 program) to take up the value of any indicator,
          * it is not necessary that this indicator is present in the chart. The requested indicator
          * will be loaded and calculated in the thread of the module that has called it.
          *
          * Any indicator can be calculated on the data of not only current chart, but also on
          * the data of any available symbol/period. If data (symbol name and/or timeframe differ from
          * the current ones) are requested from another chart, the situation is possible
          * that the corresponding chart was not opened in the client terminal and
          * the necessary data must be requested from the server. In this case,
          * error ERR_HISTORY_WILL_UPDATED (4066 - the requested history data are
          * under updating) will be placed in the last_error variable,
          * and one will has to re-request (see example of ArrayCopySeries()).

          * All indicator functions have at least 2 parameters - symbol and period.
          * The NULL value of the symbol means the current symbol, the 0 value of the period means the current timeframe.
          * =====================================================================================================================================
          * Function                     Returns the indicator value
          * =====================================================================================================================================
          * iAC                           Accelerator Oscillator
          * iAD                           Accumulation/Distribution
          * iADX                          Average Directional Index
          * iAlligator                    Alligator
          * iAO                           Awesome Oscillator
          * iATR                          Average True Range
          * iBearsPower                   Bears Power
          * iBands                        Bollinger Bands®
          * iBandsOnArray                 Calculation of Bollinger Bands® indicator on data, stored in a numeric array
          * iBullsPower                   Bulls Power
          * iCCI                          Commodity Channel Index
          * iCCIOnArray                   Calculation of Commodity Channel Index indicator on data, stored in a numeric array
          * iCustom                       Custom indicator
          * iDeMarker                     DeMarker
          * iEnvelopes                    Envelopes
          * iEnvelopesOnArray             Calculation of Envelopes indicator on data, stored in a numeric array
          * iForce                        Force Index
          * iFractals                     Fractals
          * iGator                        Gator Oscillator
          * iIchimoku                     Ichimoku Kinko Hyo
          * iBWMFI                        Market Facilitation Index by Bill Williams
          * iMomentum                     Momentum
          * iMomentumOnArray              Calculation of Momentum indicator on data, stored in a numeric array
          * iMFI                          Money Flow Index
          * iMA                           Moving Average
          * iMAOnArray                    Calculation of Moving Average indicator on data, stored in a numeric array
          * iOsMA                         Moving Average of Oscillator (MACD histogram)
          * iMACD                         Moving Averages Convergence-Divergence
          * iOBV                          On Balance Volume
          * iSAR                          Parabolic Stop And Reverse System
          * iRSI                          Relative Strength Index
          * iRSIOnArray                   Calculation of Momentum indicator on data, stored in a numeric array
          * iRVI                          Relative Vigor Index
          * iStdDev                       Standard Deviation
          * iStdDevOnArray                Calculation of Standard Deviation indicator on data, stored in a numeric array
          * iStochastic                   Stochastic Oscillator
          * iWPR                          Williams' Percent Range
          * =====================================================================================================================================
          *
          *
          * =====================================================================================================================================
          * =====================================================================================================================================
          */
public:
          void          St_MqlCondicator::St_MqlCondicator() {};
          void          St_MqlCondicator::~St_MqlCondicator() {};
          //
          //----------------------------------------------------------------------------------------------------------------
          double        _iAC(St_iAC &AC)                                                { SetTime(AC);                  return AC._Value                =  iAC(AC.symbol, AC.timeframe, AC.shift );}
          //----------------------------------------------------------------------------------------------------------------
          double        _iAD(St_iAD &AD)                                                { SetTime(AD);                  return AD._Value                =  iAD(AD.symbol, AD.timeframe, AD.shift);}
          //----------------------------------------------------------------------------------------------------------------
          double        _iADX(St_iADX &ADX)                                             { SetTime(ADX);                 return ADX._Value               =  iADX(ADX.symbol, ADX.timeframe, ADX.period, ADX.applied_price, ADX.mode, ADX.shift);}
          //----------------------------------------------------------------------------------------------------------------
          double        _iAlligator(St_iAlligator &Alligator)                           { SetTime(Alligator);           return Alligator._Value         =  iAlligator(Alligator.symbol, Alligator.timeframe, Alligator.jaw_period, Alligator.jaw_shift, Alligator.teeth_period, Alligator.teeth_shift,  Alligator.lips_period,  Alligator.lips_shift, Alligator.ma_method, Alligator.applied_price, Alligator.mode, Alligator.shift);}
          //----------------------------------------------------------------------------------------------------------------
          double        _iAO(St_iAO &AO)                                                { SetTime(AO);                  return AO._Value                =  iAO(AO.symbol, AO.timeframe, AO.shift);}
          //----------------------------------------------------------------------------------------------------------------
          double        _iATR(St_iATR &ATR)                                             { SetTime(ATR);                 return ATR._Value               =  iATR(ATR.symbol, ATR.timeframe, ATR.period, ATR.shift);}
          //----------------------------------------------------------------------------------------------------------------
          double        _iBearsPower(St_iBearsPower &BearsPower)                        { SetTime(BearsPower);          return BearsPower._Value        = iBearsPower(BearsPower.symbol, BearsPower.timeframe, BearsPower.period, BearsPower.applied_price, BearsPower.shift );}
          //----------------------------------------------------------------------------------------------------------------
          double        _iBands(St_iBands &Bands)                                       { SetTime(Bands);               return Bands._Value             =  iBands(Bands.symbol, Bands.timeframe, Bands.period, Bands.deviation, Bands.bands_shift, Bands.applied_price, Bands.mode, Bands.shift);}
          //----------------------------------------------------------------------------------------------------------------
          double        _iBandsOnArray(St_iBandsOnArray &BandsOnArray)                  { SetTime(BandsOnArray);        return BandsOnArray._Value      =  iBandsOnArray(BandsOnArray.array, BandsOnArray.total, BandsOnArray.period, BandsOnArray.deviation, BandsOnArray.bands_shift, BandsOnArray.mode, BandsOnArray.shift );}
          //----------------------------------------------------------------------------------------------------------------
          double        _iBullsPower(St_iBullsPower &BullsPower)                        { SetTime(BullsPower);          return BullsPower._Value        =  iBullsPower(BullsPower.symbol, BullsPower.timeframe, BullsPower.period, BullsPower.applied_price, BullsPower.shift);}
          //----------------------------------------------------------------------------------------------------------------
          double        _iCCI(St_iCCI &CCI)                                             { SetTime(CCI);                 return CCI._Value               =  iCCI(CCI.symbol, CCI.timeframe, CCI.period, CCI.applied_price, CCI.shift );}
          //----------------------------------------------------------------------------------------------------------------
          double        _iCCIOnArray(St_iCCIOnArray &CCIOnArray)                        { SetTime(CCIOnArray);          return CCIOnArray._Value        =  iCCIOnArray(CCIOnArray.array, CCIOnArray.total, CCIOnArray.period, CCIOnArray.shift );}
          //----------------------------------------------------------------------------------------------------------------
          double        _iCustom(St_iCustom &Custom)                                    { SetTime(Custom);              return Custom._Value            =  iCustom(Custom.symbol, Custom.timeframe, Custom.name, Custom.line_index, Custom.shift);}
          //----------------------------------------------------------------------------------------------------------------
          double        _iDeMarker(St_iDeMarker &DeMarker)                              { SetTime(DeMarker);            return DeMarker._Value          =  iDeMarker(DeMarker.symbol, DeMarker.timeframe, DeMarker.period, DeMarker.shift );}
          //----------------------------------------------------------------------------------------------------------------
          double        _iEnvelopes(St_iEnvelopes &Envelopes)                           { SetTime(Envelopes);           return Envelopes._Value         =  iEnvelopes(Envelopes.symbol, Envelopes.timeframe, Envelopes.ma_period, Envelopes.ma_method, Envelopes.ma_shift, Envelopes.applied_price, Envelopes.deviation, Envelopes.mode, Envelopes.shift);}
          //----------------------------------------------------------------------------------------------------------------
          double        _iEnvelopesOnArray(St_iEnvelopesOnArray &EnvelopesOnArray)      { SetTime(EnvelopesOnArray);    return EnvelopesOnArray._Value  =  iEnvelopesOnArray(EnvelopesOnArray.array, EnvelopesOnArray.total, EnvelopesOnArray.ma_period, EnvelopesOnArray.ma_method, EnvelopesOnArray.ma_shift, EnvelopesOnArray.deviation, EnvelopesOnArray.mode, EnvelopesOnArray.shift);}
          //----------------------------------------------------------------------------------------------------------------
          double        _iForce(St_iForce &Force)                                       { SetTime(Force);               return Force._Value             =  iForce(Force.symbol, Force.timeframe, Force.period, Force.ma_method, Force.applied_price, Force.shift);}
          //----------------------------------------------------------------------------------------------------------------
          double        _iFractals(St_iFractals &Fractals)                              { SetTime(Fractals);            return Fractals._Value          =  iFractals(Fractals.symbol, Fractals.timeframe, Fractals.line_index, Fractals.shift );}
          //----------------------------------------------------------------------------------------------------------------
          double        _iGator(St_iGator &Gator)                                       { SetTime(Gator);               return Gator._Value             =  iGator(Gator.symbol, Gator.timeframe, Gator.jaw_period, Gator.jaw_shift, Gator.teeth_period, Gator.teeth_shift, Gator.lips_period, Gator.lips_shift, Gator.ma_method, Gator.applied_price, Gator.mode, Gator.shift);}
          //----------------------------------------------------------------------------------------------------------------
          double        _iIchimoku(St_iIchimoku &Ichimoku )                             { SetTime(Ichimoku);            return Ichimoku._Value          =  iIchimoku(Ichimoku.symbol, Ichimoku.timeframe, Ichimoku.tenkan_sen, Ichimoku.kijun_sen, Ichimoku.senkou_span_b, Ichimoku.mode, Ichimoku.shift );}
          //----------------------------------------------------------------------------------------------------------------
          double        _iBWMFI(St_iBWMFI &BWMFI)                                       { SetTime(BWMFI);               return BWMFI._Value             =  iBWMFI(BWMFI.symbol, BWMFI.timeframe, BWMFI.shift);}
          //----------------------------------------------------------------------------------------------------------------
          double        _iMomentum(St_iMomentum &Momentum)                              { SetTime(Momentum);            return Momentum._Value          =  iMomentum(Momentum.symbol, Momentum.timeframe, Momentum.period, Momentum.applied_price, Momentum.shift);}
          //----------------------------------------------------------------------------------------------------------------
          double        _iMomentumOnArray(St_iMomentumOnArray &MomentumOnArray)         { SetTime(MomentumOnArray);     return MomentumOnArray._Value   =  iMomentumOnArray(MomentumOnArray.array, MomentumOnArray.total, MomentumOnArray.period, MomentumOnArray.shift);}
          //----------------------------------------------------------------------------------------------------------------
          double        _iMFI(St_iMFI &MFI)                                             { /*SetTime(MFI);*/             return MFI._Value               =  iMFI(MFI.symbol, MFI.timeframe, MFI.period, MFI.shift);}
          //----------------------------------------------------------------------------------------------------------------
          double        _iMA(St_iMA &MA)                                                { SetTime(MA);                                                 MA._Value   =  iMA(MA.symbol, MA.timeframe, MA.ma_period, MA.ma_shift_Line, MA.ma_method, MA.applied_price, MA.shift);  return (float)NormalizeDouble(MA._Value, _Digits); }
          double        _iMA_B(St_iMA_B &MA[])                                          { SetTime_Array(MA); for(int i = 0; i < ArraySize(MA); i++)  { MA[i]._Value =  iMA(MA[i].symbol, MA[i].timeframe, MA[i].ma_period, MA[i].ma_shift_Line, MA[i].ma_method, MA[i].applied_price, MA[i].shift); (float)NormalizeDouble(MA[i]._Value, _Digits);} return 1; }
          //----------------------------------------------------------------------------------------------------------------
          double        _iMAOnArray(St_iMAOnArray &MAOnArray)                           { SetTime(MAOnArray);           return MAOnArray._Value         =  iMAOnArray(MAOnArray.array, MAOnArray.total, MAOnArray.ma_period, MAOnArray.ma_shift, MAOnArray.ma_method, MAOnArray.shift);}
          //----------------------------------------------------------------------------------------------------------------
          double        _iOsMA(St_iOsMA &OsMA)                                          { SetTime(OsMA);                return OsMA._Value              =  iOsMA(OsMA.symbol, OsMA.timeframe, OsMA.fast_ema_period, OsMA.slow_ema_period, OsMA.signal_period, OsMA.applied_price, OsMA.shift);}
          //----------------------------------------------------------------------------------------------------------------
          double        _iMACD(St_iMACD &MACD )                                         { SetTime(MACD);                return MACD._Value              = NormalizeDouble(iMACD( MACD.symbol, MACD.timeframe, MACD.fast_ema_period, MACD.slow_ema_period, MACD.signal_period, MACD.applied_price, MACD.mode, MACD.shift ), 3);}
          //----------------------------------------------------------------------------------------------------------------
          double        _iOBV(St_iOBV &OBV)                                             { SetTime(OBV);                 return OBV._Value               =  iOBV( OBV.symbol, OBV.timeframe, OBV.applied_price, OBV.shift );}
          //----------------------------------------------------------------------------------------------------------------
          double        _iSAR(St_iSAR &SAR)                                             { SetTime(SAR);                 return SAR._Value               =  iSAR( SAR.symbol, SAR.timeframe, SAR.step, SAR.maximum, SAR.shift );};
          //----------------------------------------------------------------------------------------------------------------
          double        _iRSI(St_iRSI &RSI)                                             { SetTime(RSI);                 return RSI._Value               =  iRSI( RSI.symbol, RSI.timeframe, RSI.period, RSI.applied_price, RSI.shift );}
          //----------------------------------------------------------------------------------------------------------------
          double        _iRSIOnArray(St_iRSIOnArray &RSIOnArray)                        { SetTime(RSIOnArray);          return RSIOnArray._Value        =  iRSIOnArray(RSIOnArray.array, RSIOnArray.total, RSIOnArray.period, RSIOnArray.shift);}
          //----------------------------------------------------------------------------------------------------------------
          double        _iRVI(St_iRVI &RVI)                                             { SetTime(RVI);                 return RVI._Value               =  iRVI( RVI.symbol, RVI.timeframe, RVI.period, RVI.mode, RVI.shift );}
          //----------------------------------------------------------------------------------------------------------------
          double        _iStdDev(St_iStdDev &StdDev)                                    { SetTime(StdDev);              return StdDev._Value            =  iStdDev(StdDev.symbol, StdDev.timeframe, StdDev.ma_period, StdDev.ma_shift, StdDev.ma_method, StdDev.applied_price, StdDev.shift ); };
          //----------------------------------------------------------------------------------------------------------------
          double        _iStdDevOnArray(St_iStdDevOnArray &StdDevOnArray)               { SetTime(StdDevOnArray);       return StdDevOnArray._Value     =  iStdDevOnArray(StdDevOnArray.array, StdDevOnArray.total, StdDevOnArray.ma_period, StdDevOnArray.ma_shift, StdDevOnArray.ma_method, StdDevOnArray.shift ); }
          //----------------------------------------------------------------------------------------------------------------
          double        _iStochastic(St_iStochastic &Stochastic)                        { SetTime(Stochastic);          return Stochastic._Value        =  iStochastic(Stochastic.symbol, Stochastic.timeframe, Stochastic.Kperiod, Stochastic.Dperiod, Stochastic.slowing, Stochastic.method, Stochastic.price_field, Stochastic.mode, Stochastic.shift); }
          //----------------------------------------------------------------------------------------------------------------
          double        _iWPR(St_iWPR &WPR)                                             { SetTime(WPR);                 return WPR._Value               =  iWPR(WPR.symbol, WPR.timeframe, WPR.period, WPR.shift);}
          //----------------------------------------------------------------------------------------------------------------
          template<typename Typer_1>
          void SetTime(Typer_1 &typer_1)
          {         typer_1._Time       = iTime(typer_1.symbol, typer_1.timeframe, typer_1.shift);
                    typer_1._Close      = iClose(typer_1.symbol, typer_1.timeframe, typer_1.shift);
                    typer_1._Open       = iOpen(typer_1.symbol, typer_1.timeframe, typer_1.shift);
                    typer_1._High       = iHigh(typer_1.symbol, typer_1.timeframe, typer_1.shift);
                    typer_1._Low        = iLow(typer_1.symbol, typer_1.timeframe, typer_1.shift);
                    typer_1._Median     = (typer_1._High + typer_1._Low ) / 2 ;
                    //
          }
          template<typename Typer_1>
          void SetTime_Array(Typer_1 &typer_1[])
          {         /*---off---
                    for(int i = 0; i < ArraySize(typer_1); i++)
                     {         typer_1[i]._Time       = iTime(NULL, PERIOD_CURRENT, typer_1[i].shift);
                               typer_1[i]._Close      = iClose(NULL, PERIOD_CURRENT, typer_1[i].shift);
                               typer_1[i]._Open       = iOpen(NULL, PERIOD_CURRENT, typer_1[i].shift);
                               typer_1[i]._High       = iHigh(NULL, PERIOD_CURRENT, typer_1[i].shift);
                               typer_1[i]._Low        = iLow(NULL, PERIOD_CURRENT, typer_1[i].shift);
                               typer_1[i]._Median     = (typer_1[i]._High + typer_1[i]._Low ) / 2 ;
                               //
                     } //
                     */
          }
//

};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

struct Sg_Line_Prop_Condition
{         bool        Is_E_Above_Ask                ;
          bool        Is_Ressistancer               ;
          double      Diff_Open                     ;
          bool        Is_OnLine                     ;
          double      Diff_Ask                      ;
          string      name                          ;
          bool        Is_Basic__Bulish_Line         ;
          bool        Is_Diff_Ask_Array_Bulish      ;
          bool        Is_Diff_Close_Array_Bulish    ;
          bool        Is_Diff_Open_Array_Bulish     ;
          //----------------
          double Profit, Correction_Profit;//
};
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\B_MQL\CoverOT\iEt_ENUMs_.mqh>
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\B_MQL\CoverOT\iSt_FLAGs_ChartAnalise_Channel.mqh>
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\B_MQL\CoverOT\iSt_FLAGs_Indicators_MACD.mqh>
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\B_MQL\CoverOT\iSt_FLAGs_Indicators_iMA.mqh>
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\B_MQL\CoverOT\iSt_FLAGs_Indicators_WPR.mqh>
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\B_MQL\CoverOT\iSt_FLAGs_.mqh>

struct St_TIC_Condition_Final_TraderMems
{         bool          IsStartBuy;
          bool          IsStartSell;
          bool          IsEndBuy;
          bool          IsEndSell;
          bool          IsVoid;//
          string        Desc;
          string        ModeDesc;
          //
          //
};
struct st_IsWhoFinal_Condition_Signal
{         bool IsBUY;
          bool IsSELL;
          bool IsVOID;//
};
struct St_TIC_Condition
{         bool Final_BUY_Power__Point                   ;//= Enum_Signal__Power__Point > 0;
          bool Final_SELL_Power__Point                  ;//= Enum_Signal__Power__Point < 0;
          bool Final_VOID_Power__Point                  ;//= Enum_Signal__Power__Point == 0;
          bool Final_BUY_Power                          ;//= Enum_Signal__Power__ > 0;
          bool Final_SELL_Power                         ;//= Enum_Signal__Power__ < 0;
          bool Final_VOID_Power                         ;//= Enum_Signal__Power__ == 0;
          //--------------------------------------------------------------------------------------------------------------------------------------------------------------
          bool Final_BUY_Condition_CandleBars         ;//= FLAGs.CandleBars_Movment.Basic.flag_4_E_Bar_TL_Movment == E_Movment_ULL; // E_Movment_Void,E_Movment_BUp_U,E_Movment_BDown_U,E_Movment_ULL,E_Movment_DLL,
          bool Final_Sell_Condition_CandleBars        ;//= FLAGs.CandleBars_Movment.Basic.flag_4_E_Bar_TL_Movment == E_Movment_DLL; //
          bool Final_VOID_Condition_CandleBars        ;//= !Final_BUY_Condition_CandleBars    && !Final_Sell_Condition_CandleBars; //
          //--------------------------------------------------------------------------------------------------------------------------------------------------------------
          bool Final_BUY_Condition_ChartAnalise       ;//= false; //
          bool Final_Sell_Condition_ChartAnalise      ;//= false; //
          bool Final_VOID_Condition_ChartAnalise      ;//= !Final_BUY_Condition_ChartAnalise  && !Final_Sell_Condition_ChartAnalise; //
          //--------------------------------------------------------------------------------------------------------------------------------------------------------------
          bool Final_BUY_Condition_Indicators_MACD    ;//=  FLAGs.Indicators_MACD.Basic.flag_2_Is_Basic_CrossUp_Signal_;                   //--Alert("CrossUp_Signal: ",FLAGs.Indicators_MACD.Basic.flag_2_Is_Basic_CrossUp_Signal_);
          bool Final_Sell_Condition_Indicators_MACD   ;//=  FLAGs.Indicators_MACD.Basic.flag_2_Is_Basic_CrossDown_Signal_;                 //--Alert("CrossDown_Signal_: ",FLAGs.Indicators_MACD.Basic.flag_2_Is_Basic_CrossDown_Signal_);
          bool Final_VOID_Condition_Indicators_MACD   ;//= !Final_BUY_Condition_Indicators_MACD && !Final_Sell_Condition_Indicators_MACD;
          //----
          bool Final_BUY_Condition_Indicators_WPR     ;//=  FLAGs.Indicators_WPR.Complex.flag_2_Is_Complex__WPR_Buy_Support;
          bool Final_Sell_Condition_Indicators_WPR    ;//= !FLAGs.Indicators_WPR.Complex.flag_2_Is_Complex__WPR_Buy_Support;
          bool Final_VOID_Condition_Indicators_WPR    ;//= !Final_BUY_Condition_Indicators_WPR  && !Final_Sell_Condition_Indicators_WPR;
          //----
          bool Final_BUY_Condition_Indicators_iMA     ;//=  FLAGs.Indicators_iMA.Complex.flag_2_Is_Complex_EMA_Close_Bulish && !FLAGs.Indicators_iMA.Basic.flag_2_Is_Basic_5_Above_3;
          bool Final_Sell_Condition_Indicators_iMA    ;//= !FLAGs.Indicators_iMA.Complex.flag_2_Is_Complex_EMA_Close_Bulish &&  FLAGs.Indicators_iMA.Basic.flag_2_Is_Basic_5_Above_3;
          bool Final_VOID_Condition_Indicators_iMA    ;//= !Final_BUY_Condition_Indicators_iMA  && !Final_Sell_Condition_Indicators_iMA;
          //---------------------------------------------
          bool Final_BUY_Condition_Indicators         ;//=  Final_BUY_Condition_Indicators_WPR  || Final_BUY_Condition_Indicators_iMA  || Final_BUY_Condition_Indicators_MACD;
          bool Final_Sell_Condition_Indicators        ;//=  Final_Sell_Condition_Indicators_WPR || Final_Sell_Condition_Indicators_iMA || Final_Sell_Condition_Indicators_MACD;
          bool Final_VOID_Condition_Indicators        ;//= !Final_BUY_Condition_Indicators      && !Final_Sell_Condition_Indicators;
          //--------------------------------------------------------------------------------------------------------------------------------------------------------------
          st_IsWhoFinal_Condition_Signal              IsWhoFinal_Condition_Signal;//
          //--------------------------------------------------------------------------------------------------------------------------------------------------------------
          bool Final_Convergent_Condition;
          bool Final_Divergent_Condition;
          //--------------------------------------------------------------------------------------------------------------------------------------------------------------
          bool Final_TREE_BUY_Condition_Signal;
          bool Final_TREE_SELL_Condition_Signal;
          bool Final_TREE_VOID_Condition_Signal;
          //--------------------------------------------------------------------------------------------------------------------------------------------------------------
          St_TIC_Condition_Final_TraderMems Final_MACD_Trade_Condition_Signal;
          St_TIC_Condition_Final_TraderMems Final_MACDSolo_Trade_Condition_Signal;
          St_TIC_Condition_Final_TraderMems Final_NNSence_Trade_Condition_Signal;
          St_TIC_Condition_Final_TraderMems Final_FE_Trade_Condition_Signal;
          //--------------------------------------------------------------------------------------------------------------------------------------------------------------


};

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
struct Ct_CondicatorData_Status
{         //===============================================================
          void       Ct_CondicatorData_Status();
          StrDescName        Pad_MAmicro_TrendUp;
          StrDescName        Pad_SuperIndicators_TrendUp;                               ///CondicatorData_Status_PAD.Pad_SuperIndicators_TrendUp.IsTrue
          StrDescName        Pad_OBVClose_EMA20_CrossUp_SMA20;
          StrDescName        Pad_MFI_Up;
          StrDescName        Pad_BullsPower_14_UpTrend;
          StrDescName        Pad_Accelerator_Up;
          StrDescName        Pad_WpR20_CrossUp_200;
          //===============================================================
          //===============================================================
}; Ct_CondicatorData_Status CD_Status_PAD;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Ct_CondicatorData_Status::Ct_CondicatorData_Status()
{         if(true)
          {         //=========================================
                    Pad_MAmicro_TrendUp.Desc                  = "MicroTrendUP";                       // + (string)Pad_MAmicro_TrendUp.IsTrue;
                    Pad_SuperIndicators_TrendUp.Desc          = "SuperKeysUP";                        // + (string)Pad_SuperIndicators_TrendUp.IsTrue ;
                    Pad_OBVClose_EMA20_CrossUp_SMA20.Desc     = "Pad_OBVClose_EMA20_CrossUp_SMA20";   // + (string)Pad_OBVClose_EMA20_CrossUp_SMA20.IsTrue;
                    Pad_MFI_Up.Desc                           = "MFI_UP";                             // + (string)Pad_MFI_Up.IsTrue;
                    Pad_BullsPower_14_UpTrend.Desc            = "Pad_BullsPower_14_UT";          // + (string)IsBullsPower_14_UT;
                    Pad_Accelerator_Up.Desc                   = "Accelerator_UP";                     // + (string)Pad_Accelerator_Up.IsTrue;
                    Pad_WpR20_CrossUp_200.Desc                = "Pad_WpR20_CrossUp_200";              // + (string)Pad_WpR20_CrossUp_200.IsTrue; //
                    //=========================================
                    Pad_MAmicro_TrendUp.Name                  = "MicroTrendUP";
                    Pad_SuperIndicators_TrendUp.Name          = "SuperKeysUP";
                    Pad_OBVClose_EMA20_CrossUp_SMA20.Name     = "Pad_OBVClose_EMA20_CrossUp_SMA20";
                    Pad_MFI_Up.Name                           = "MFI_UP";
                    Pad_BullsPower_14_UpTrend.Name            = "Pad_BullsPower_14_UT";
                    Pad_Accelerator_Up.Name                   = "Accelerator_UP";
                    Pad_WpR20_CrossUp_200.Name                = "Pad_WpR20_CrossUp_200";
                    //========================================
          }//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
