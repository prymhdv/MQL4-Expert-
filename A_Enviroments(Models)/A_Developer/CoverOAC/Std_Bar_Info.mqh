//+------------------------------------------------------------------+
//||   ||||||||||                 Std_Bar_Info.mqh                  ||Ctp_TRADER
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\B_MQL\.B_MQL.mqh>
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOAC\Stc_CP_There_bar.mqh>
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOAC\Stc_CP_InSideBar.mqh>
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOAC\Stc_CP_Two_bar.mqh>
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOAC\Stc_CP_Harmonic.mqh>
//#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOTC\.CoverOTC.mqh>
//---
#property strict
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
struct Bar_Strategies__Solid__Data
{         Ct_MqlSeries    MQL;
          //----[Bar Solid Strategies]
          void          Bar_Strategies__Solid__Data(void);
          void          Define__values(int i = 0, ENUM_TIMEFRAMES f = PERIOD_CURRENT);
          //----[Bar Solid Strategies]
          double        _High;
          double        _Low;
          double        _Open;
          double        _Close;
          //---
          double        m_open_composite;   //=EMPTY_VALUE
          double        m_high_composite;   //=EMPTY_VALUE
          double        m_low_composite;    //=EMPTY_VALUE
          double        m_close_composite;  //=EMPTY_VALUE
          //---
          long          _Volume;
          datetime      _Time;
          datetime      _TimeCycle;
          datetime      _Time_Next;
          datetime      _Time_Remain;
          datetime      _Time_Remain_Sec;
          //---
          int           _Place;                 //  = iBarShift(NULL, 0, _Time);
          //--- cordinating on chart
          string        Name;
          double        _X_;                    //Dev_Chart_Window.TimePrice_To_XY(Time_Cordinate_One, Price_Cordinate_One, CordinateXone, CordinateYone);
          double        _Y_;
          bool          Is_CandleBull;          //=     IsClose_Up_Open;        IsHigh_Up_Open
          bool          Is_CandleBear;          //=I    sClose_Equal_Open       IsLow_Down_Open
          //---
          datetime      _expiration;            // _Time_Remain_Sec
          double        _Range;
          double        _Body;                  // = MqlMath._MathAbs(_Open - _Close);
          double        shadow_high;            // shadow_rang_high                      high - ((!Is_bulish) ? open : close);
          double        shadow_low;             // shadow_rang_low                       ((Is_bulish) ? open : close) - low;
          //----
          //---- candels
          bool          CandleBull(double open, double high, double low, double close);///--sub function
          bool          CandleBear(double open, double high, double low, double close);

          double        m_range;                //= 6;    default range
          int           m_minimum;              //= 25;   default minimum
          double        m_shadow_big;           //= 0.5;  default shadow_big
          double        m_shadow_small;         //= 0.2;  default shadow_small
          double        m_limit;                //= 0.0;  default limit
          double        m_stop_loss;            //= 2.0;  default stop_loss
          double        m_take_profit;          //= 1.0;  default take_profit
          int           m_expiration;           //= 4;

};

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Bar_Strategies__Solid__Data::Bar_Strategies__Solid__Data(void)
{
//--- set default inputs
          m_range          = 6;
          m_minimum        = 25;
          m_shadow_big     = 0.5;
          m_shadow_small   = 0.2;
          m_limit          = 0.0;
          m_stop_loss      = 2.0;   //--- -200%
          m_take_profit    = 1.0;   //--- -100%
          m_expiration     = 4;
//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Bar_Strategies__Solid__Data::Define__values(int i = 0, ENUM_TIMEFRAMES f = PERIOD_CURRENT)
{         _High                 =  MQL._iHigh(NULL, f, i);   //High[i];
          _Low                  =  MQL._iLow(NULL, f, i);    //Low[i];
          _Open                 =  MQL._iOpen(NULL, f, i);   //Open[i];
          _Close                =  MQL._iClose(NULL, f, i);  //Close[i];
//----
          _Volume               =  MQL._iVolume(NULL, f, i); //Volume[i];
//----
          _Time                 =  MQL._iTime(NULL, f, i); //Time[i];
          _TimeCycle            =  MQL._iTime(NULL, f, i) - MQL._iTime(NULL, f, i + 1); //Time[0] - Time[1];
          _Time_Next            =  _Time + _TimeCycle;
          _Time_Remain          =  _Time_Next - _Time;
          _Time_Remain_Sec      =  _Time_Next - MQL_DateTime._TimeCurrent();
//----
          _Place                =  MQL._iBarShift(NULL, f, _Time);
//----
          _X_                   =  ObjectGetValueByTime(0, Name = "Bar_" + (string) _Place, _Time );
          _Y_                   =  0;
//---
          _expiration           =  _Time_Remain_Sec;
          _Range                =  _High -  _Low;
          _Body                 =  MqlMath._MathAbs( _Open - _Close) + .00001; //---dived zeroo...
          CandleBull( _Open, _High, _Low, _Close);
          CandleBear( _Open, _High, _Low, _Close);//
}
//+------------------------------------------------------------------+
//| Check the candles on her membership bulls.                       |
//| INPUT:  open  - price open candles,                              |
//|         high  - price high candles,                              |
//|         low   - price low candles,                               |
//|         close - price close candles.                             |
//| OUTPUT: true-if candles bulls, false otherwise.                  |
//| REMARK: no.                                                      |
//+------------------------------------------------------------------+
bool Bar_Strategies__Solid__Data::CandleBull(double open, double high, double low, double close)
{         int    shadow_mode = 1;
          double size = high - low;
          double shadow_h = 0, shadow_l = 0;
//---
          bool Is_bulish = open < close;
          switch(shadow_mode)
          {         case 0:  // classic
                              shadow_h = high - ((!Is_bulish) ? open : close);
                              shadow_l = ((Is_bulish) ? open : close) - low;
                              break;
                    case 1:  // modern 1
                              shadow_high = shadow_h = high - ((!Is_bulish) ? open : close);
                              shadow_low  = shadow_l = ((Is_bulish) ? open : close) - low;
                              break;
                    case 2:  // modern 2
                              shadow_h = high - open;
                              shadow_l = close - low;
                              break; }
//---
          if(shadow_h < m_shadow_small * size && shadow_l > m_shadow_big * size)
          {         m_open_composite = open;
                    m_high_composite = high;
                    m_low_composite  = low;
                    m_close_composite = close;
                    return(Is_CandleBull = true); }
//---
          return(Is_CandleBull = false); //
}
//+------------------------------------------------------------------+
//| Check the candles on her membership bears.                       |
//| INPUT:  open  - price open candles,                              |
//|         high  - price high candles,                              |
//|         low   - price low candles,                               |
//|         close - price close candles.                             |
//| OUTPUT: true-if candles bears, false otherwise.                  |
//| REMARK: no.                                                      |
//+------------------------------------------------------------------+
bool Bar_Strategies__Solid__Data::CandleBear(double open, double high, double low, double close)
{         int    shadow_mode = 1;
          double size = high - low;
          double shadow_h = 0, shadow_l = 0;
//---
          bool Is_bulish = open < close;
          switch(shadow_mode)
          {         case 0:  // classic
                              shadow_h = high - ((!Is_bulish) ? open : close);
                              shadow_l = ((Is_bulish) ? open : close) - low;
                              break;
                    case 1:  // modern 1
                              shadow_high = shadow_h = high - ((!Is_bulish) ? open : close);
                              shadow_low  = shadow_l = ((Is_bulish) ? open : close) - low;
                              break;
                    case 2:  // modern 2
                              shadow_h = high - close;
                              shadow_l = open - low;
                              break; }
//---
          if(shadow_l < m_shadow_small * size && shadow_h > m_shadow_big * size)
          {         m_open_composite = open;
                    m_high_composite = high;
                    m_low_composite  = low;
                    m_close_composite = close;
                    return(Is_CandleBear = true); //
          }
//---
          return(Is_CandleBear = false); //
}
struct Bar_Strategies__shadow__Data_prpo
{         bool          Is_Range_None;
          bool          Is_Range_Normal;
          bool          Is_Range_High;
          bool          Is_Range_UltraHigh;
          bool          Is_Range_ExrtraHigh;

};
struct Bar_Strategies__shadow__Data
{         //----[Bar shadow Strategies]
          double        shadow_high_per_Body;   //   = shadow_high/_Body        <0.5     <1.0     <1.5             >2.0
          double        shadow_low_per_Body;    //   = shadow_low/_Body         <0.5     <1.0     <1.5             >2.0
          bool          Is_high_shadow_longer;  //                              normal  High    UltraHigh       ExrtraHigh
          //
          Bar_Strategies__shadow__Data_prpo    ShadowHigh, ShadowLow;

          //----[Bar Force Shadow Strategies]
          void          Define__values(double shadow_high, double shadow_low, double _Body);
          double        force_of_deals;
          //--

          //----
          double        force_of_deals_value_Buy;     //Is_high_shadow_longer
          double        force_of_deals_value_Sell;    //!Is_high_shadow_longer
          double        force_of_deals_Value_Last_5Bar;
          double        force_of_deals_Value_Last_10Bar;
          double        force_of_deals_Value_Last_15Bar;
          double        force_of_deals_Value_Last_20Bar;
          double        force_of_deals_Value_Last_200Bar;
          double        force_of_deals_Value_Last_500Bar;//

};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Bar_Strategies__shadow__Data::Define__values(double shadow_high, double shadow_low, double _Body)
{
          {         //---
                    //---
                    //---
                    shadow_high_per_Body        = shadow_high / _Body; /// 0.5     1.0     1.5             2.0   impluse of shadow helo to determine force of deals in 200 range...
                    shadow_low_per_Body         = shadow_low  / _Body ;/// 0.5     1.0     1.5             2.0
                    Is_high_shadow_longer       = shadow_high_per_Body > shadow_low_per_Body; //
          }
//---------[order of calc is important too know]  normal  High    UltraHigh       ExrtraHigh
          {         ShadowHigh.Is_Range_None            = (shadow_high_per_Body ==  0.00 ) ? true : false;
                    ShadowHigh.Is_Range_Normal          = (shadow_high_per_Body  <  0.50 ) ? true : false;
                    ShadowHigh.Is_Range_High            = (shadow_high_per_Body  >  0.50 ) && (shadow_high_per_Body <  1.00 ) ? true : false;
                    ShadowHigh.Is_Range_UltraHigh       = (shadow_high_per_Body  >  1.00 ) && (shadow_high_per_Body <  1.50 ) ? true : false;
                    ShadowHigh.Is_Range_ExrtraHigh      = (shadow_high_per_Body  >  2.00 ) ? true : false;
                    //
                    ShadowLow.Is_Range_None             = (shadow_low_per_Body  ==  0.00 ) ? true : false;
                    ShadowLow.Is_Range_Normal           = (shadow_low_per_Body   <  0.50 ) ? true : false;
                    ShadowLow.Is_Range_High             = (shadow_low_per_Body   >  0.50 ) && (shadow_low_per_Body <  1.00 )  ? true : false;
                    ShadowLow.Is_Range_UltraHigh        = (shadow_low_per_Body   >  1.00 ) && (shadow_low_per_Body <  1.50 )  ? true : false;
                    ShadowLow.Is_Range_ExrtraHigh       = (shadow_low_per_Body   >  2.00 ) ? true : false;
                    //Alert(shadow_low_per_Body);
                    //---
                    //---
                    //----
                    if(ShadowHigh.Is_Range_None)       {force_of_deals = 0.0;  if(0)Alert(force_of_deals);}
                    if(ShadowHigh.Is_Range_Normal)     {force_of_deals = 1.0;  if(0)Alert(force_of_deals);}
                    if(ShadowHigh.Is_Range_High)       {force_of_deals = 2.0;  if(0)Alert(force_of_deals);}
                    if(ShadowHigh.Is_Range_UltraHigh)  {force_of_deals = 3.0;  if(0)Alert(force_of_deals);}
                    if(ShadowHigh.Is_Range_ExrtraHigh) {force_of_deals = 4.0;  if(0)Alert(force_of_deals);}//mean buy
                    //---
                    if(ShadowLow.Is_Range_None)        {force_of_deals = -0.0; if(0)Alert(force_of_deals);}
                    if(ShadowLow.Is_Range_Normal)      {force_of_deals = -1.0; if(0)Alert(force_of_deals);}
                    if(ShadowLow.Is_Range_High)        {force_of_deals = -2.0; if(0)Alert(force_of_deals);}
                    if(ShadowLow.Is_Range_UltraHigh)   {force_of_deals = -3.0; if(0)Alert(force_of_deals);}
                    if(ShadowLow.Is_Range_ExrtraHigh)  {force_of_deals = -4.0; if(0)Alert(force_of_deals);}//mean sell
          }//
}
struct Bar_Strategies__Pattern__Data
{         //----[Pattern Strategies]
          Stc_CandlePattern__InSideBar          Inside_Engulfing_Bar;  // Is_InSideBar_bearish       ; Is_InSideBar_Bulish;    Is_Engulfing_bullish;  Is_Engulfing_bearish     //---Current Inside Bar  previous Mother bar
          Stc_CandlePattern__There_bar          There_bar;             // Is_Pattern_All_Any_Bullish ; Is_Pattern_All_Any_Bearish;
          Stc_CandlePattern__Two_bar            Two_bar; //--off//---
          //
          Stc_CandlePattern__Harmonic           Harmonic_Bar; //

};

struct Bar_Strategies__FiboExtention__Data
{         //----[Fibo Extention Strategies]
          int           __Calc__HighestBar_Index;//              = iHighest(StSymbol.Current, Calc.PeriodTF, MODE_HIGH, UseCount = 200, UseStart); //ok
          int           __Calc__LowestBar_Index;//               = iLowest (StSymbol.Current, Calc.PeriodTF, MODE_LOW,  UseCount = 200, UseStart);        //ok
          bool          Is_Direction__Upward_Range200;  //    Is_Direction__Upward = _Data.__Calc__HighestBar_Index < _Data.__Calc__LowestBar_Index; // realy cool
};
struct Bar_Strategies__Trend__Data
{         //----[Trend Strategies]
          bool                                  IsTREND_BackWarding;
          bool                                  IsTREND_ForWarding;
          double                                Trend_Overbuying;  //= 70;                 //Overbuying zone
          double                                Trend_Overselling; //= 30;                //Overselling zone
};
struct Bar_Strategies__TrendEMA__Data
{         //----[Trend EMA Strategies]
          void       Define__values();
          double                                Close__Distance__EMA500;                //--- Negative is
          double                                Close__Distance__EMA200;
          double                                Close__Distance__EMA30;
          double                                Close__Distance__EMA20; //

};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Bar_Strategies__TrendEMA__Data::Define__values()
{         Close__Distance__EMA500  = ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA.EMA500_Close._CURRENT._Price.Distance_Close;  // ct_Conductor.Indicators._MA.EMA500_Close._Price._Close_Level.Level[4].Posetive__Distance;//ct_Conductor.Indicators._MA.EMA500_Close._Price._Close_Level.Level_5_1300Point_Posetive;
          Close__Distance__EMA200  = ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA.EMA200_Close._CURRENT._Price.Distance_Close;  //ct_Conductor.Indicators._MA.EMA200_Close._Price._Close_Level.Level[4].Posetive__Distance; //800Point
          Close__Distance__EMA30   = ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA.EMA30_Close._CURRENT._Price.Distance_Close;  //ct_Conductor.Indicators._MA.EMA30_Close._Price._Close_Level.Level[4].Posetive__Distance;
          Close__Distance__EMA20   = ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA.EMA20_Close._CURRENT._Price.Distance_Close;  //ct_Conductor.Indicators._MA.EMA20_Close._Price._Close_Level.Level[4].Posetive__Distance;
//
//Cat.s("Close__Distance__EMA500:" + (string)NormalizeDouble(Close__Distance__EMA500, 2));
//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
struct Bar_Strategies__Trend_Direction__Data
{         //----[Trend Direction Strategies]
          bool       Is_Direction__Upward_Range200;
          void          __Calc__Is_Direction__Upward_Range200(int StartBar, int LastBar, ENUM_TIMEFRAMES PeriodTF)
          {         double __Calc__HighestBar_Index            = iHighest(StSymbol.Current, PeriodTF, MODE_HIGH, LastBar, StartBar);
                    double __Calc__LowestBar_Index             = iLowest (StSymbol.Current, PeriodTF, MODE_LOW,  LastBar, StartBar);
                    Is_Direction__Upward_Range200       = __Calc__HighestBar_Index < __Calc__LowestBar_Index; //
          }//
};
struct Bar_Strategies__Checks_Up__Data
{         //----[Checks Up Strategies]

          bool       Is_Forwarding_Upward,          Is_Backwarding_Upward;
          bool       Is_Forwarding_Downward,        Is_Backwarding_Downward;
          //
          bool       Is_Crossed_Up_bar__Support_Level;
          bool       Is_Forwarding_Upward_bar__Resistance_Level;
          //
          bool       Is_Crossed_bar__highHighest200_Level;
          bool       Is_Crossed_bar__lowLowest200_Level;
          //
          bool       Is_Crossed_bar__CloseEMA500_Level;
          bool       Is_Crossed_bar_CloseEMA500_Level_5_dollar_Posetive;
          //
          bool       Is_Crossed_bar_CloseEMA500_Level_21_dollar_Negative;
          //
          bool       Is_Crossed_bar__CloseSMA500_Level;
          bool       Is_Crossed_bar__CloseWMA500_Level;
          //
          bool       Is_Crossed_bar__CloseEMA200_Level;
//
//
          bool       Is_Fast__Upper__Slow;                                    //(ima(2) > ima(5))
          bool       Is_SlowHigh__Downner__Slow_Fast;                         //(ima(5) < ima(8)) && (ima(2) < ima(8))

          bool       Is_Fast__Upper__Slow___Downner__SlowHigh;                //  (ima(2) > ima(5)) < ima(8)//  under8 upward   //      (ima(i + 2) > ima(i + 5)) < ima(i + 8)  //under8 upward for every bar cycle
          bool       Is_Fast__Upper__Slow___Upper__SlowHigh;                  //  (ima(2) > ima(5)) > ima(8)//  above8 upward   //      (ima(i + 2) > ima(i + 5)) > ima(i + 8)  //above8 upward
//
          bool       Is_Fast__Downer__Slow___Downer__SlowHigh;               // (ima(2) < ima(5)) < ima(8)  under8 Downward
          bool       Is_Fast__Downer__Slow___Upper__SlowHigh;                // (ima(2) < ima(5)) > ima(8)  above8 upward
//
//
          bool       Is_Fast__Downer__Slow___Upper__FiboExp160_Posetive;      //(ima(2) < ima(5)) > FiboExp160_Posetive  FiboExp160_Posetive Downward
//

          bool       Is_FE260_P__Upper__SlowHigh__Upper__Slow___Upper__FE160;       // (FiboExp260_Posetive  > (ima(8) > ima(5))) > FiboExp160_Posetive          // above160 Downward. Tp3 overbugh and is ressistance now.



          bool       Is_FE100_P__Upper__SlowHigh__Upper__Slow___Upper__FE160;       // (FiboExp100_Posetive  > (ima(8) > ima(5) > ima(3))) > FiboExp61_Posetive  // above61 Downward. Tp1 overbugh and is ressistance now.

};
//+------------------------------------------------------------------+
//|                                                                  | Dev_Chart_Window.TimePrice_To_XY(Time_Cordinate_One, Price_Cordinate_One, CordinateXone, CordinateYone);
//+------------------------------------------------------------------+
/*





*/