//+------------------------------------------------------------------+
//||   ||||||||||       Stc_Bar_Info.mqh                    ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOAC\Std_Bar_Info.mqh>
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOAC\uBarNews.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOA\St_Bar_TL_Movment_0_5.mqh>
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class Std_Bar_Info_Demo
{
protected:
          Ct_MqlSeries    MQL;
          bool            Is_Cheacked;



public:   void       Std_Bar_Info_Demo() {};
          void       Std_Bar_Info_Demo(ENUM_TIMEFRAMES tf) {TF = tf;};
          void       ~Std_Bar_Info_Demo(/*delete next; delete previus;*/) {/*delete next; delete previus;*/};
          //----[Data][Fields]
          ENUM_TIMEFRAMES TF;
          //---struct member
          bool       IsNextCalc;
          Bar_Strategies__Solid__Data            Bar_Solid;              //----[Bar Solid Strategies]
          Bar_Strategies__shadow__Data           Bar_shadow;             //----[Bar shadow Strategies]
          Bar_Strategies__Pattern__Data          Bar_Pattern;            //----[Pattern Strategies]
          Bar_Strategies__FiboExtention__Data    Bar_FiboExtention;      //----[Fibo Extention Strategies]
          Bar_Strategies__Trend__Data            Bar_Trend;              //----[Trend Strategies]
          Bar_Strategies__Trend_Direction__Data  Bar_Trend_Direction;    //----[Trend Direction Strategies]
          Bar_Strategies__TrendEMA__Data         Bar_TrendEMA;           //----[Trend EMA Strategies]
          Bar_Strategies__Checks_Up__Data        Bar_Checks_Up;          //----[Checks Up Strategies]

          //----[Actions][interface][Methods]
          //---bool          SetBarInfo(int i, ENUM_TIMEFRAMES _tf);
          //---void          SetBarInfo_next_previus(int, ENUM_TIMEFRAMES _tf);  //--caling paralel of setbar info
          //---void          Find_Highest(int i = 0, int RangeBars = 200);
          //--- ADX indicator parameters
          int                  Flat_ADXPeriod;// = 11;                   //Period ADX
          int                  Flat_FlatLevel;// = 40;
          //---
          //----

};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class Std_Bar_Info
{
protected:
          Ct_MqlSeries    MQL;
          bool            Is_Cheacked;



public:   void       Std_Bar_Info();
          void       Std_Bar_Info(ENUM_TIMEFRAMES tf) {TF = tf;};
          void       ~Std_Bar_Info(/*delete next; delete previus;*/) {/*delete next; delete previus;*/};
          ENUM_TIMEFRAMES TF;
          //---struct member
          //--- Std_Bar_Info *next, *previus;//----right to left indexing //---over data  //---errooor need demo class to store data as normal variabels
          Std_Bar_Info_Demo     next,  previus;
          bool                  IsNextCalc;


          Bar_Strategies__Solid__Data            Bar_Solid;              //----[Bar Solid Strategies]
          Bar_Strategies__shadow__Data           Bar_shadow;             //----[Bar shadow Strategies]
          Bar_Strategies__Pattern__Data          Bar_Pattern;            //----[Pattern Strategies]
          Bar_Strategies__FiboExtention__Data    Bar_FiboExtention;      //----[Fibo Extention Strategies]
          Bar_Strategies__Trend__Data            Bar_Trend;              //----[Trend Strategies]
          Bar_Strategies__Trend_Direction__Data  Bar_Trend_Direction;    //----[Trend Direction Strategies]
          Bar_Strategies__TrendEMA__Data         Bar_TrendEMA;           //----[Trend EMA Strategies]
          Bar_Strategies__Checks_Up__Data        Bar_Checks_Up;          //----[Checks Up Strategies]

          //----[Actions]
          bool          SetBarInfo(int i, ENUM_TIMEFRAMES _tf);
          void          SetBarInfo_next_previus(int, ENUM_TIMEFRAMES _tf);  //--caling paralel of setbar info


          void       Find_Highest(int i = 0, int RangeBars = 200);
          //--- ADX indicator parameters
          int                  Flat_ADXPeriod;// = 11;                   //Period ADX
          int                  Flat_FlatLevel;// = 40;
          //---
          //----

};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Std_Bar_Info::Std_Bar_Info(void)
{
//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Std_Bar_Info::SetBarInfo(int i, ENUM_TIMEFRAMES _tf)
{         //----
//----
          TF = _tf;
          if(Detect_NewBar._CURRENT.CBT.Is_NewBar) {Is_Cheacked = false;};
          if(!Is_Cheacked)
          {         //---
                    Bar_Solid.Define__values(i, TF);
                    Bar_shadow.Define__values(Bar_Solid.shadow_high, Bar_Solid.shadow_low, Bar_Solid._Body);
                    //---
                    Bar_Trend_Direction.__Calc__Is_Direction__Upward_Range200(i, i + 200, TF);
                    //----
                    Bar_Pattern.There_bar.Check_Candlestick_Pattern(i, TF);                // Is_Pattern_All_Any_Bullish ; Is_Pattern_All_Any_Bearish;
                    Bar_Pattern.Inside_Engulfing_Bar.Check_Candlestick_Pattern(i, TF);     // Is_InSideBar_bearish       ; Is_InSideBar_Bulish;
                    Bar_Pattern.Harmonic_Bar.Check_Harmonic_Pattern(i, TF, false, g_Shape_Com, 1);
                    //----
                    Bar_TrendEMA.Define__values();//
                    Is_Cheacked = true; //
          }
//----
//----
//----
//----
          Find_Highest();
          {         // Basically, what it does is comparing the current close price with the previous candle's high.
                    // If the current price is higher than the high of the previous one, likely the price is rising.
                    // It does the same check on different pairs involving the EUR to further validate the theory.
                    // If for all pairs the price is rising, then it prints "EUR is strong!"
                    bool is_EUR_strong = (MQL._iClose("EURUSD.f", TF, 0) > MQL._iHigh("EURUSD.f", TF, 1)) &&
                                         (MQL._iClose("EURCHF.f", TF, 0) > MQL._iHigh("EURCHF.f", TF, 1)) &&
                                         (MQL._iClose("EURAUD.f", TF, 0) > MQL._iHigh("EURAUD.f", TF, 1)) &&
                                         (MQL._iClose("EURJPY.f", TF, 0) > MQL._iHigh("EURJPY.f", TF, 1));
                    //if(is_EUR_strong) {         Print("EUR is strong!"); }
                    //else {         Print("Nothing to report"); } //
          }
//----
//----
//----
//----
          return true;//
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Std_Bar_Info::SetBarInfo_next_previus(int i, ENUM_TIMEFRAMES _tf)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
          TF = _tf;
          //--- next    = new Std_Bar_Info(TF);
          //--- previus = new Std_Bar_Info(TF);
          //--- if(i >= 0)  next.SetBarInfo(i + 1, TF );
          //--- if(i > 0) previus.SetBarInfo(i - 1, TF); //---Stacover flow
          ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
          //Cat.s("next._Range: "  + DoubleToStr(next._Range, 2));
          //--- IsNextCalc = true; //
          //--- delete by deiniting not work
          //--- delete next; delete previus;
          ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
          //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Std_Bar_Info::Find_Highest(int i = 0, int RangeBars = 200)
{         // Initializing the variables.
          double Highest = MQL._iHigh(NULL, TF, i); //High[0];
          double Lowest  = MQL._iLow(NULL, TF, i);
// Scan the 30 candles and update the values of the highest and lowest.
          for (int idx = 0; idx <= RangeBars; idx++)
          {         if (MQL._iHigh(NULL, TF, idx) > Highest)            Highest = MQL._iHigh(NULL, TF, idx);
                    if (MQL._iLow(NULL, TF, idx) < Lowest)              Lowest =  MQL._iLow(NULL, TF, idx);//
          }
// Print the result.
//---Print("Highest price found is ", Highest, " - Lowest price found is ", Lowest);//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
struct Stc_Bar_Info
{         //
          ~Stc_Bar_Info() {}
          Stc_Bar_Info()

          {         ArrayResize(Bars_Current, 10); //
                    ArrayResize(Bars_M1, 10); //
                    ArrayResize(Bars_M5, 10); //
                    ArrayResize(Bars_M15, 10); //
                    ArrayResize(Bars_M30, 10); //
                    ArrayResize(Bars_H1, 10); //
                    ArrayResize(Bars_H4, 10); //
                    ArrayResize(Bars_D1, 10); //
                    ArrayResize(Bars_W1, 10); //
                    ArrayResize(Bars_MN1, 10); //
          }

          St_Bar_TL_Movment_0_5_Periods Bar_TL_Movment_0_5_Periods;
          //
          Std_Bar_Info  Bars_Current[];
          Std_Bar_Info  Bars_M1[];
          Std_Bar_Info  Bars_M5[];
          Std_Bar_Info  Bars_M15[];
          Std_Bar_Info  Bars_M30[];
          Std_Bar_Info  Bars_H1[];
          Std_Bar_Info  Bars_H4[];
          Std_Bar_Info  Bars_D1[];
          Std_Bar_Info  Bars_W1[];
          Std_Bar_Info  Bars_MN1[];
          //
          int ViewRange;// = 500;
          bool Update();

          //Stc_Bar_Info()
          //{         Std_Bar_Info  _Bars_Current[];(PERIOD_CURRENT); ;      Bars_Current    = _Bars_Current; //--array declering not available      Std_Bar_Info  _Bars_Current[];(PERIOD_CURRENT); ;      Bars_Current    = _Bars_Current;
          //          Std_Bar_Info(PERIOD_M1)       _Bars_1M[];           Bars_M1         = _Bars_1M;
          //          Std_Bar_Info(PERIOD_M5)       _Bars_5M[];           Bars_M5         = _Bars_5M;
          //          Std_Bar_Info(PERIOD_M15)      _Bars_15M[];          Bars_M15        = _Bars_15M;
          //          Std_Bar_Info(PERIOD_M30)      _Bars_30M[];          Bars_M30        = _Bars_30M;
          //          Std_Bar_Info(PERIOD_H1)       _Bars_H1[];           Bars_H1         = _Bars_H1;
          //          Std_Bar_Info(PERIOD_H4)       _Bars_H4[];           Bars_H4         = _Bars_H4;
          //          Std_Bar_Info(PERIOD_D1)       _Bars_D1[];           Bars_D1         = _Bars_D1;
          //          Std_Bar_Info(PERIOD_W1)       _Bars_W1[];           Bars_W1         = _Bars_W1;
          //          Std_Bar_Info(PERIOD_MN1)      _Bars_MN1[];          Bars_MN1        = _Bars_MN1; //
          //}


};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Stc_Bar_Info::Update()          //---
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
          //Alert("Start-Stack error " + __FUNCTION__);
          //----
          static bool isExplore = false;
          ViewRange = 500;
          //--
          ArrayResize(Bars_Current,     ViewRange);
          ArrayResize(Bars_M1,          ViewRange);
          ArrayResize(Bars_M5,          ViewRange);
          ArrayResize(Bars_M15,         ViewRange);
          ArrayResize(Bars_M30,         ViewRange);
          ArrayResize(Bars_H1,          ViewRange);
          ArrayResize(Bars_H4,          ViewRange);
          ArrayResize(Bars_D1,          ViewRange);
          ArrayResize(Bars_W1,          ViewRange);
          ArrayResize(Bars_MN1,         ViewRange);
          //
          Bar_TL_Movment_0_5_Periods.update(0, 5, 10, 10, 15, 20);
          ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
          for(int k = ViewRange - 1 ; k >= 0; k-- )
          {         if(isExplore) {ViewRange = k = 0;}
                    //Bars_Current[k].SetBarInfo(k, PERIOD_CURRENT);
                    //Bars_Current[k].SetBarInfo_next_previus(k, PERIOD_CURRENT);
                    ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
                    Bars_M1[k].SetBarInfo(k, PERIOD_M1);
                    //Bars_M1[k].SetBarInfo_next_previus(k, PERIOD_M1);
                    ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
                    Bars_M5[k].SetBarInfo(k, PERIOD_M5);
                    //Bars_M5[k].SetBarInfo_next_previus(k, PERIOD_M5);
                    ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
                    Bars_M15[k].SetBarInfo(k, PERIOD_M15);
                    //Bars_M15[k].SetBarInfo_next_previus(k, PERIOD_M15);
                    ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
                    Bars_M30[k].SetBarInfo(k, PERIOD_M30);
                    //Bars_M30[k].SetBarInfo_next_previus(k, PERIOD_M30);
                    ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
                    Bars_H1[k].SetBarInfo(k, PERIOD_H1);
                    //Bars_H1[k].SetBarInfo_next_previus(k, PERIOD_H1);
                    ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
                    Bars_H4[k].SetBarInfo(k, PERIOD_H4);
                    //Bars_H4[k].SetBarInfo_next_previus(k, PERIOD_H4);
                    ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
                    Bars_D1[k].SetBarInfo(k, PERIOD_D1);
                    //Bars_D1[k].SetBarInfo_next_previus(k, PERIOD_D1);
                    ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
                    Bars_W1[k].SetBarInfo(k, PERIOD_W1);
                    //Bars_W1[k].SetBarInfo_next_previus(k, PERIOD_W1);
                    ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
                    Bars_MN1[k].SetBarInfo(k, PERIOD_MN1);
                    //Bars_MN1[k].SetBarInfo_next_previus(k, PERIOD_MN1);
                    ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
                    //Cat.s("Bars_M5[k]._Time_Next: "       + TimeToStr(Bars_M5[k]._Time_Next,       TIME_SECONDS));
                    //Cat.s("Bars_M5[k]._Time: "            + TimeToStr(Bars_M5[k]._Time,            TIME_SECONDS));
                    //Cat.s("Bars_M5[k]._TimeCycle: "       + TimeToStr(Bars_M5[k]._TimeCycle,       TIME_SECONDS));
                    //Cat.s("Bars_M5[k]._Time_Remain_Sec: " + TimeToStr(Bars_M5[k]._Time_Remain_Sec, TIME_SECONDS));
                    //Cat.s("Bar_1MFrist.CandlePattern.Is_Pattern_BearishEngulfing: " + (string)Bar_1MFrist.CandlePattern.Is_Pattern_BearishEngulfing);
                    //Cat.s("Bar_1MFrist.CandlePattern.Is_Pattern_BullishEngulfing: " + (string)Bar_1MFrist.CandlePattern.Is_Pattern_BullishEngulfing);
                    //Cat.s("Bar_1MFrist._range: "     + DoubleToStr(Bar_1MFrist._Range, 2));
                    //Cat.s("Bars_M5[k]._range: "  + DoubleToStr(Bars_M5[k]._Range, 2));
                    //Cat.s("Bars_M15[k]._range: " + DoubleToStr(Bars_M15[k]._Range, 2));
                    //Cat.s("Bars_H4[k]._range: "  + DoubleToStr(Bars_H4[k]._Range, 2));
                    //Cat.s("***Bars_H4[" + (string)k + "].next._Range: "  + DoubleToStr(Bars_H4[k].next._Range, 2)); //
          }//
          //---
          ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
          //Cat.s("***Bars_");
          isExplore  = true;//
          //==========================================================
          //Print(EnumToString(Bars_M1[0].Bar_Pattern.Harmonic_Bar.e_Harmonics), " 1M "  );
          //Print(EnumToString(Bars_M5[0].Bar_Pattern.Harmonic_Bar.e_Harmonics), " 5M ");
          //Print(EnumToString(Bars_M15[0].Bar_Pattern.Harmonic_Bar.e_Harmonics), " 15M ");
          //Print(EnumToString(Bars_M30[0].Bar_Pattern.Harmonic_Bar.e_Harmonics), " 30M ");
          //Print(EnumToString(Bars_H1[0].Bar_Pattern.Harmonic_Bar.e_Harmonics), " H1 ");
          //Print(EnumToString(Bars_H4[0].Bar_Pattern.Harmonic_Bar.e_Harmonics), " H4 ");
          //Print(EnumToString(Bars_D1[0].Bar_Pattern.Harmonic_Bar.e_Harmonics), " D1 ");
          //Print(EnumToString(Bars_W1[0].Bar_Pattern.Harmonic_Bar.e_Harmonics), " W1 ");
          //Print(EnumToString(Bars_MN1[0].Bar_Pattern.Harmonic_Bar.e_Harmonics), " MN1 ");
          //==========================================================
          return true;
          //---
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
