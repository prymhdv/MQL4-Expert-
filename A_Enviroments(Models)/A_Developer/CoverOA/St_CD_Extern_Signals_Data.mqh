//+------------------------------------------------------------------+
//||   ||||||||||            tDevConductor.mqh                      ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOTB\Ct_Conductor.mqh>
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
enum Ste_Swing_Point { VOID, LOW, HIGH };
enum Ste_Swing { up, down, side };

struct Sts_Swing_Point { bool Is_low, Is_high, Is_void;   Ste_Swing_Point Swing_Point; };
struct Sts_Swing
{         Sts_Swing_Point  A;
          Sts_Swing_Point  B;
          bool       get_Point_A_Is_low()  { return   A.Is_low  == true; }
          bool       get_Point_A_Is_high() { return   A.Is_high == true; }
          bool       get_Point_B_Is_low()  { return   B.Is_low  == true; }
          bool       get_Point_B_Is_high() { return   B.Is_high == true; }
          //
          void       set_Point_A_Is_low(bool Is_Key)  { A.Is_low  = Is_Key;      A.Is_low  ?    A.Swing_Point = LOW   :  A.Swing_Point = VOID     ; }
          void       set_Point_A_Is_high(bool Is_Key) { A.Is_high = Is_Key;      A.Is_high ?    A.Swing_Point = HIGH  :  A.Swing_Point = VOID     ; }
          void       set_Point_B_Is_low(bool Is_Key)  { B.Is_low  = Is_Key;      B.Is_low  ?    B.Swing_Point = LOW   :  B.Swing_Point = VOID     ; }
          void       set_Point_B_Is_high(bool Is_Key) { B.Is_high = Is_Key;      B.Is_high ?    B.Swing_Point = HIGH  :  B.Swing_Point = VOID     ; }
          //
};
//-------------------------------------------
struct St_Signal_Base_Data
{         bool          Is_Buy, Is_Sell;
          double        Power;
          double        WinRate;
          string        Text;
          //
};

struct St_Trade__Commands__Alfa_resultS
{         //
          St_Signal_Base_Data   Indicators_IMA_EMA_500;
          //
          St_Signal_Base_Data   Charter_Lines_Trend;
          St_Signal_Base_Data   Charter_Lines_TrendByAngle;
          //
          St_Signal_Base_Data   Charter_Channels_Equidistant;
          St_Signal_Base_Data   Charter_Channels_Regression;
          St_Signal_Base_Data   Charter_Channels_StandardDeviation;
          St_Signal_Base_Data   Charter_Channels_Pitchfork;
          //
          St_Signal_Base_Data   Charter_Fibos_Retracement;
          St_Signal_Base_Data   Charter_Fibos_Expansion;
          St_Signal_Base_Data   Charter_Fibos_TimeZone;
          St_Signal_Base_Data   Charter_Fibos_Channel;
          St_Signal_Base_Data   Charter_Fibos_Fan;
          St_Signal_Base_Data   Charter_Fibos_Arc;
          //
          St_Signal_Base_Data   Patterns_2Bar_Engulfing;
          St_Signal_Base_Data   Patterns_2Bar_InSideBar;
          St_Signal_Base_Data   Patterns_3Bar;
          St_Signal_Base_Data   Patterns_Harmonic;
          //
          St_Signal_Base_Data   BarShadow;
          St_Signal_Base_Data   Extra_RS;
          //
}; St_Trade__Commands__Alfa_resultS Alfa_resultS;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
struct Commands_Alfa
{         string                                Text;
          string                                Desc;
          bool                                  Macro_Condition_Buy;
          int                                   Int_Signal;//
          E_Signals_Type                        E4_Signal;
};
struct St_CondicatorData_Extern_Signals_Data
{         St_FLAGs                              FLAGs; //--all
          Commands_Alfa                         _Alfa;
          string                                Enum_Signal_temp_Desc;
          //---Enum_Signal_temp               = ES_VOID;//
};
//
struct St_CondicatorData_Extern_Signals_Datas
{         St_CondicatorData_Extern_Signals_Data   Data; };
//
struct St_CondicatorData_Extern_Signals_Method: public St_CondicatorData_Extern_Signals_Datas
{         bool                                  Update(); };
//+------------------------------------------------------------------+
//|                                                                  |St_LineSence  _LineSence(__LINE__, OP_VOID , 0, 1, 0, 0,1,"SL-DW"); _LineSence.Optimize();//
//+------------------------------------------------------------------+
interface It_CondicatorData_Extern_Signals_Base
{         void                                  CHEACK_OUT_Limits();                  // #2b#3c#4c#5a
          void                                  CHEACK_OUT_Objects();                 // #2b#3c#4c#5b
          void                                  CHEACK_OUT_Criterions();              // #2b#3c#4c#5c
          void                                  CHEACK_OUT_Alternative();             // #2b#3c#4c#5d
          void                                  CHEACK_OUT_Implanting();              // #2b#3c#4c#5e
}; 
