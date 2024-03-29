//+------------------------------------------------------------------+
//||   ||||||||||       St_CDI_MACD.mqh       ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOA\St_CDI_Base.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(MQL4)\Include\Arrays\ArrayDouble(MQL4).mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOA\St_CDI_Custom_ZigZag.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\BasicChartObj\GOB_Elementry.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOA\St_CD_ChartPivots.mqh>
//#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\Cg_DevObjectPack.mqh>
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
class St_CDI_MACD: public St_CDI_Base
{
public:   void          St_CDI_MACD();
          void          iMACDs();
          bool          Is_MACDBuy,
                        Is_MACDSell;
          void          ArrayResizeOnMACD();
          void          MACD_init();
          //****************************
          CArrayDouble_MQL4  MACD_Range;
          double        MACD_Range_10[];
          double        MACD_Range_10_Lowest;
          double        MACD_Range_10_Highest;
          void          Find_Highest_Lowest();
          //*****************************
          double        MACD_M_200_0,   MACD_M_200_1,   MACD_S_200_0,   MACD_S_200_1,
                        MACD_M_14_0,    MACD_M_14_1,    MACD_S_14_0,    MACD_S_14_1;
          //****************************
          bool          Is_MACD_M_14_0_UpTrend,         Is_MACD_S_14_0_UpTrend,
                        Is_MACD_M_200_0_UpTrend,        Is_MACD_S_200_0_UpTrend;
private:


          //---------------------------------------------------------------------------------------------------------------------------------------------------------------

          //---------------------------------------------------------------------------------------------------------------------------------------------------------------
          double        First_MACD200M[],       Second_MACD200M_EMA20[],        Second_MACD200M_SMA20[],        Second_MACD200M_EMA200[],       Second_MACD200M_SMA200[],
                        First_MACD20M[],        Second_MACD20M_EMA20[],         Second_MACD20M_SMA20[],         Second_MACD20M_EMA200[],        Second_MACD20M_SMA200[];
          bool          Is_MACD20M_CrossUp_200M,        Is_MACD200M_EMA20_CrossUp_SMA20,        Is_MACD20M_EMA20_CrossUp_SMA20;
          //---------------------------------------------------------------------------------------------------------------------------------------------------------------
          double        First_MACD200S[],       Second_MACD200S_EMA20[],        Second_MACD200S_SMA20[],        Second_MACD200S_EMA200[],       Second_MACD200S_SMA200[],
                        First_MACD20S[],        Second_MACD20S_EMA20[],         Second_MACD20S_SMA20[],         Second_MACD20S_EMA200[],        Second_MACD20S_SMA200[];
          bool          Is_MACD20S_CrossUp_200,         Is_MACD200S_EMA20_CrossUp_SMA20,        Is_MACD20S_EMA20_CrossUp_SMA20;
          //---------------------------------------------------------------------------------------------------------------------------------------------------------------
          double        MacdCurrent_Fast,
                        MACDOpenLevel,
                        MACDCloseLevel;
          int           total_MACD;
          //======================================
          bool          Is_MACDUpWard;
          //======================================
          double        MacdOldious2_Fast,
                        MacdOldious_Fast,
                        SignalCurrent_Fast,
                        SignalOldious_Fast,
                        SignalOldious2_Fast;
          //======================================
          double        MacdCurrent_Slow,
                        MacdOldious_Slow,
                        MacdOldious2_Slow,
                        SignalCurrent_Slow,
                        SignalOldious_Slow,
                        SignalOldious2_Slow;
          //======================================>>>Is_MACD
          bool          xUpSideMACD,
                        xDownSideMACD,
                        xUpSideMACDsignal,
                        xDownSideMACDsignal,
                        xUpSideMACDSignalOldiousFast,
                        xDownSideMACDSignalOldiousFast,
                        xUpSideMACDSignalOldious2Fast,
                        xDownSideMACDSignalOldious2Fast;
          //bool        Is_UPSideMACDsignalLevel           = MathAbs(MacdCurrentFast) > (MACDCloseLevel * Point);
          //bool        Is_DownSideMACDsignalLevel         = MathAbs(MacdCurrentFast) > (MACDOpenLevel * Point);
          //======================================>>>>Is_Cross
          bool          xCrossUpFastSlowMacdCurren;
          bool          xCrossUpFastSlowMacdOldious;
          bool          xCrossUpFastSlowSignalCurrent;
          bool          xCrossUpFastSlowSignalOldious;
          //======================================>>>>
          bool          IsCrossUp_MacdCurrent_Fast__MACDOpenLevel;


          //---------------------------------------------------------------------------------------------------------------------------------------------------------------
}; //---St_CDI_MACD                   ct_Conductor.Indicators_MACD.;
void St_CDI_MACD::St_CDI_MACD()
{         //
          ArrayResize(MACD_Range_10, 10 + 1);
          MACD_Range.Resize(10 + 1);
//
//
}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void St_CDI_MACD::MACD_init()
{         MACDOpenLevel         = 3;
          MACDCloseLevel        = 2;
//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void St_CDI_MACD::ArrayResizeOnMACD()
{         Resize_X200Array_X20Array(First_MACD200S, Second_MACD200S_EMA20, Second_MACD200S_SMA20, Second_MACD200S_EMA200, Second_MACD200S_SMA200, First_MACD20S, Second_MACD20S_EMA20, Second_MACD20S_SMA20, Second_MACD20S_EMA200, Second_MACD20S_SMA200,  200);
          Resize_X200Array_X20Array(First_MACD200M, Second_MACD200M_EMA20, Second_MACD200M_SMA20, Second_MACD200M_EMA200, Second_MACD200M_SMA200, First_MACD20M, Second_MACD20M_EMA20, Second_MACD20M_SMA20, Second_MACD20M_EMA200, Second_MACD20M_SMA200, 200); //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void St_CDI_MACD::iMACDs()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
///Moving Averages Convergence/Divergence indicator
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>./// MACD condition tracking
//========================================================////--200-120---12-14..slow-fast meaning
          MACD_M_200_0                          = iMACD(NULL, 0, 120, 260, 90, PRICE_CLOSE, MODE_MAIN, 0);
          MACD_M_200_1                          = iMACD(NULL, 0, 120, 260, 90, PRICE_CLOSE, MODE_MAIN, 1);
          MACD_S_200_0                          = iMACD(NULL, 0, 120, 260, 90, PRICE_CLOSE, MODE_SIGNAL, 0);
          MACD_S_200_1                          = iMACD(NULL, 0, 120, 260, 90, PRICE_CLOSE, MODE_SIGNAL, 1);
//==
          MACD_M_14_0                           = iMACD(NULL, 0, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, 0);
          MACD_M_14_1                           = iMACD(NULL, 0, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, 1);
          MACD_S_14_0                           = iMACD(NULL, 0, 12, 26, 9, PRICE_CLOSE, MODE_SIGNAL, 0);
          MACD_S_14_1                           = iMACD(NULL, 0, 12, 26, 9, PRICE_CLOSE, MODE_SIGNAL, 1);
          for(int i = 0; i <= 10; i++)
          {         //
                    MACD_Range_10[i]            = iMACD(NULL, 0, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, i);
                    double c_Macd               = iMACD(NULL, 0, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, i);
                    MACD_Range.Insert(c_Macd, i);
                    //
          }
//========================================================< 55;
          Is_MACD_M_200_0_UpTrend               = MACD_M_200_0  > MACD_M_200_1 ; //Print("money_direction of money");
          Is_MACD_S_200_0_UpTrend               = MACD_S_200_0  > MACD_S_200_1 ; //Print("money_direction of money");
//==
          Is_MACD_M_14_0_UpTrend                = MACD_M_14_0  > MACD_M_14_1 ; //Print("money_direction of money");
          Is_MACD_S_14_0_UpTrend                = MACD_S_14_0  > MACD_S_14_1 ; //Print("money_direction of money");
//--macd zigzag and maximum   in ten bar...
//========================================================< 55;
          Init_X200Array_X20Array("iMACD", First_MACD200M, Second_MACD200M_EMA20, Second_MACD200M_SMA20, Second_MACD200M_EMA200, Second_MACD200M_SMA200, First_MACD20M, Second_MACD20M_EMA20, Second_MACD20M_SMA20, Second_MACD20M_EMA200, Second_MACD20M_SMA200, 200);
          Is_MACD20M_CrossUp_200M               = First_MACD20M[0]              > First_MACD200M[0];
          Is_MACD200M_EMA20_CrossUp_SMA20       = Second_MACD200M_EMA20[0]      > Second_MACD200M_SMA20[0];
          Is_MACD20M_EMA20_CrossUp_SMA20        = Second_MACD20M_EMA20[0]       > Second_MACD20M_SMA20[0];//
//===
          Init_X200Array_X20Array("iMACD", First_MACD200S, Second_MACD200S_EMA20, Second_MACD200S_SMA20, Second_MACD200S_EMA200, Second_MACD200S_SMA200, First_MACD20S, Second_MACD20S_EMA20, Second_MACD20S_SMA20, Second_MACD20S_EMA200, Second_MACD20S_SMA200, 200);
          Is_MACD20S_CrossUp_200                = First_MACD20S[0]              > First_MACD200S[0];
          Is_MACD200S_EMA20_CrossUp_SMA20       = Second_MACD200S_EMA20[0]      > Second_MACD200S_SMA20[0];
          Is_MACD20S_EMA20_CrossUp_SMA20        = Second_MACD20S_EMA20[0]       > Second_MACD20S_SMA20[0];//
//========================================================
          Is_MACDUpWard                         = Is_MACD_M_200_0_UpTrend       && Is_MACD_M_14_0_UpTrend;
          Is_MACDBuy                            = xUpSideMACD                   && xUpSideMACDsignal            && xUpSideMACDSignalOldiousFast ;
          Is_MACDSell                           = xDownSideMACD                 && xDownSideMACDsignal          && xDownSideMACDSignalOldiousFast ;
//---export is handel by trade logic
//========================================================
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>.///
//--- to simplify the coding and speed up access data are put into internal variables
          {         MacdCurrent_Fast                   = iMACD(NULL, 0, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, 0);
                    MacdOldious_Fast                  = iMACD(NULL, 0, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, 3);
                    MacdOldious2_Fast                 = iMACD(NULL, 0, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, 6);
                    SignalCurrent_Fast                 = iMACD(NULL, 0, 12, 26, 9, PRICE_CLOSE, MODE_SIGNAL, 0);
                    SignalOldious_Fast                = iMACD(NULL, 0, 12, 26, 9, PRICE_CLOSE, MODE_SIGNAL, 3);
                    SignalOldious2_Fast               = iMACD(NULL, 0, 12, 26, 9, PRICE_CLOSE, MODE_SIGNAL, 6);
                    ///>>>
                    MacdCurrent_Slow                   = iMACD(NULL, 0, 24, 52, 18, PRICE_CLOSE, MODE_MAIN, 0);
                    MacdOldious_Slow                  = iMACD(NULL, 0, 24, 52, 18, PRICE_CLOSE, MODE_MAIN, 3);
                    MacdOldious2_Slow                 = iMACD(NULL, 0, 24, 52, 18, PRICE_CLOSE, MODE_MAIN, 6);
                    SignalCurrent_Slow                 = iMACD(NULL, 0, 24, 52, 18, PRICE_CLOSE, MODE_SIGNAL, 0);
                    SignalOldious_Slow                = iMACD(NULL, 0, 24, 52, 18, PRICE_CLOSE, MODE_SIGNAL, 3);
                    SignalOldious2_Slow               = iMACD(NULL, 0, 24, 52, 18, PRICE_CLOSE, MODE_SIGNAL, 6);
                    //////>>>Is_MACD
                    xUpSideMACD                        = MacdCurrent_Fast       >       0;
                    xDownSideMACD                      = MacdCurrent_Fast       <       0;
                    xUpSideMACDsignal                  = MacdCurrent_Fast       >       SignalCurrent_Fast;
                    xDownSideMACDsignal                = MacdCurrent_Fast       <       SignalCurrent_Fast;
                    xUpSideMACDSignalOldiousFast      = MacdOldious_Fast      >       SignalOldious_Fast;
                    xDownSideMACDSignalOldiousFast    = MacdOldious_Fast      <       SignalOldious_Fast;
                    xUpSideMACDSignalOldious2Fast     = MacdOldious2_Fast     >       SignalOldious2_Fast;
                    xDownSideMACDSignalOldious2Fast   = MacdOldious2_Fast     <       SignalOldious2_Fast;
                    //bool Is_UPSideMACDsignalLevel           = MathAbs(MacdCurrentFast) > (MACDCloseLevel * Point);
                    //bool Is_DownSideMACDsignalLevel         = MathAbs(MacdCurrentFast) > (MACDOpenLevel * Point);
                    ///>>>>Is_Cross
                    xCrossUpFastSlowMacdCurren         = MacdCurrent_Fast       >       MacdCurrent_Slow;
                    xCrossUpFastSlowMacdOldious       = MacdOldious_Fast      >       MacdOldious_Slow;
                    xCrossUpFastSlowSignalCurrent      = SignalCurrent_Fast     >       SignalCurrent_Slow;
                    xCrossUpFastSlowSignalOldious     = SignalOldious_Fast    >       SignalOldious_Slow; //
          }
          IsCrossUp_MacdCurrent_Fast__MACDOpenLevel =  (MathAbs(MacdCurrent_Fast) > (MACDOpenLevel * Point));
          ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          return;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void St_CDI_MACD::Find_Highest_Lowest()
{         ///
///
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

struct Sti_MACD_data
{         int          Shift;
          double       _Value;//
};
struct Sti_MACD_data2
{         Sti_MACD_data       Max;
          Sti_MACD_data       Min;//
          Sti_MACD_data       Curr; //
};
enum Et_MACD_Cross_Signal
{         Et_MACD_Cross_Signal_Void,
          Et_MACD_Cross_Signal_Down_Buying,
          Et_MACD_Cross_Signal_Up_Selling

//
};
struct St_MACD_RR
{         double                RRR_angeAmount;
          double                MACDamount;
          char                  IsTargetSL1Achived;
          char                  IsTargetTP1Achived;
          char                  IsTargetTP2Achived;
          char                  IsTargetTP3Achived;
          char                  IsBuyp1Selln1;
          double                amountSLPrice;
          double                amountTPPrice;
          ///

};
struct Sti_MACD_Data;
enum E_MACD_STATE { EVoide_MACD_STATE, UP_IN, UP_OUT, DOWN_IN, DOWN_OUT };
struct St_MACD_Cross_Signal
{         int                   Idx;/// Idx_Up, Idx_Down;
          int                   BarShift[];
          double                BarPrice[];
          datetime              BarTime[];
          Et_MACD_Cross_Signal  E_MACD_Cross_Signal[];
          E_MACD_STATE          eMACD_STATE[];

          St_MACD_RR            MACD_RR[];
          Sti_MACD_Data         DATAS[];

          //
};
enum E_AchivmentTargets
{         E_TPVoid, E_TP1, E_TP2, E_TP3 };
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
struct Sti_MACD_Data2
{         //----------------------------------------
          double        CandelHigth     ;//
          double        CandelHigthBody ;//

          datetime      Candel_Time     ;//= t_iMACD_12_26_9_PriceClose[i].Main._Time;
          double        Candel_Open     ;//= t_iMACD_12_26_9_PriceClose[i].Main._Close;
          double        Candel_Close    ;//= t_iMACD_12_26_9_PriceClose[i].Main._Close;
          double        Candel_High     ;//= t_iMACD_12_26_9_PriceClose[i].Main._High;
          double        Candel_Low      ;//= t_iMACD_12_26_9_PriceClose[i].Main._Low;
          double        Candel_Median   ;//= t_iMACD_12_26_9_PriceClose[i].Main._Median;
          //----------------------------------------
          int shiftLowestOld  ;//= iLowest(Symbol(), f, MODE_LOW, RageView / 2, i);
          int shiftHighestOld ;//= iHighest(Symbol(), f, MODE_HIGH, RageView / 2, i);
          //
          int shiftLowestNew ;//= iLowest(Symbol(), f, MODE_LOW, RageView / 2, i - RageView / 2);
          int shiftHighestNew ;//= iHighest(Symbol(), f, MODE_HIGH, RageView / 2, i - RageView / 2);
          //----------------------------------------------------------------------
          double ValueLowestOld   ;//= iLow(Symbol(), f, shiftLowestOld);
          double ValueHighestOld ;//= iHigh(Symbol(), f, shiftHighestOld);
          //
          double ValueLowestNew  ;//= iLow(Symbol(), f, shiftLowestNew);
          double ValueHighestNew ;//= iHigh(Symbol(), f, shiftHighestNew);
          //----------------------------------------------------------------------
          int shiftLowestOldOld ;//= iLowest(Symbol(), f, MODE_LOW, RageView / 2, shiftHighestOld);
          int shiftHighestOldOld ;//= iHighest(Symbol(), f, MODE_HIGH, RageView / 2, shiftLowestOld);
          //
          double ValueLowestOldOld   ;//= iLow(Symbol(), f, shiftLowestOldOld);
          double ValueHighestOldOld ;//= iHigh(Symbol(), f, shiftHighestOldOld);
          //----------------------------------------
          int        shiftLowestNewNew;// = iLowest(Symbol(), f, MODE_LOW, DATAS_Candels[i].shiftHighestNew, RageView / 2);
          int        shiftHighestNewNew;// = iHighest(Symbol(), f, MODE_HIGH, DATAS_Candels[i].shiftLowestNew, RageView / 2);
          //
          double     ValueLowestNewNew;//   = iLow(Symbol(), f, DATAS_Candels[i].shiftLowestNewNew);
          double     ValueHighestNewNew;// = iHigh(Symbol(), f, DATAS_Candels[i].shiftHighestNewNew);
          //----------------------------------------
};
struct Sti_MACD_Data
{         //


          //
          double        main_Value              ;//= t_iMACD_12_26_9_PriceClose[i].Main._Value;
          double        signal_Value            ;//= t_iMACD_12_26_9_PriceClose[i].Signal[i]._Value;

          //--cheak out
          bool          Is_BullSide                          ;//= main_Value   > 0;  //--- signal_Value>main_Value
          bool          Is_Bulish_Signal                     ;//= signal_Value > signal_Value_previus;    /---mean main uper signal
          bool          Is_Bulish_Main                       ;//= main_Value   > main_Value_previus;
          //
          bool          Is_Detected_CrossUp           ;//= false;
          bool          Is_Detected_CrossDown         ;//= false;
          //---------------------------------------------------------------
          bool          Is_Signal_Lower_Main__Buying;
          bool          Is_Signal_Grater_Main__Selling;                         //= signal_Value > main_Value;  //-- main_Value_previus
          bool          Is_Signal_Grater_Main__SellingP;
          bool          Is_Signal_Lower_Main__BuyingP;

          bool          Is_CrossUp_Signal_Selling, Is_CrossDown_Signal_Buying, Is_CrossUp_Old_Signal, Is_CrossDown_Old_Signal;
          //--------------------------------------------------------------
          bool       IsBasic_SignalMain__Expanding;
          bool       IsBasic_SignalMain__Nearing;
          bool       IsBasic_SignalMain_Bulish_Expanding;
          bool       IsBasic_SignalMain_Bulish_Nearing;
          bool       IsBasic_SignalMain_Bearish_Expanding;
          bool       IsBasic_SignalMain_Bearish_Nearing;
          //----------------------------------------
          bool                  IsCrossMACD;
          E_MACD_STATE          eMACD_STATE;
          //----------------------------------------
          color          cE_SL1;// = clrRed;
          color          cE_TP1;// = clrGreen;
          color          cE_TP2;// = clrGreen;
          color          cE_TP3;// = clrGreen;

          uchar      CalcMode;
          //========================================
          double     RRR_0Price1, RRR_0Price2;
          datetime   RRR_0Time1,  RRR_0Time2;
          double     RRR_1Price1, RRR_1Price2;
          datetime   RRR_1Time1,  RRR_1Time2;
          double     RRR_2Price1, RRR_2Price2;
          datetime   RRR_2Time1,  RRR_2Time2;
          double     RRR_3Price1, RRR_3Price2;
          datetime   RRR_3Time1,  RRR_3Time2;
          //----------------------------------------
          double     RangeSL, Price2SL;
          double     TargetSL, AmountSL;
          double     TargetTP1, AmountTP1;
          double     TargetTP2, AmountTP2;
          double     TargetTP3, AmountTP3;
          bool       IsVerifiedSignalBySlRange;
          char       IsTargetSL1Achived, IsTargetTp1Achived, IsTargetTp2Achived, IsTargetTp3Achived;
          E_AchivmentTargets eAchivmentTargets;

          //
};
struct st_iMACDs
{         st_iMACDs() {};
          ~st_iMACDs() {};
          //
          St_MqlCondicator      mql;
          St_iMACD   Main, Signal;
          st_iMACDs  MACD(string s, ENUM_TIMEFRAMES f, int fa, int sl, int si, ENUM_APPLIED_PRICE ap, int sh)
          {         st_iMACDs t_iMACD_12x_26x_9x_PriceClose;
                    t_iMACD_12x_26x_9x_PriceClose.Main   = St_iMACD(s, f, fa, sl, si, ap, MODE_MAIN, sh);         mql._iMACD(t_iMACD_12x_26x_9x_PriceClose.Main);
                    t_iMACD_12x_26x_9x_PriceClose.Signal = St_iMACD(s, f, fa, sl, si, ap, MODE_SIGNAL, sh);       mql._iMACD(t_iMACD_12x_26x_9x_PriceClose.Signal);//
                    return t_iMACD_12x_26x_9x_PriceClose;//
          }
//
};
struct Sti_MACD_DataSignals
{         E_SM_Possition        SM_Possition_0;
          E_SM_Possition        SM_Possition_0_Current;
          bool                  Is_SM_0_Sell_Supportive                         ;//= SM_Possition_0 == E_SMP_Sell_Supportive;
          bool                  Is_SM_0_Sell_Resistancive                       ;//= SM_Possition_0 == E_SMP_Sell_Resistancive;
          bool                  Is_SM_0_Buy_Supportive                          ;//= SM_Possition_0 == E_SMP_Buy_Supportive;
          bool                  Is_SM_0_Buy_Resistancive                        ;//= SM_Possition_0 == E_SMP_Buy_Resistancive;
          //
          E_TL_Movment          TL_Movment_0_5, TL_Movment_0_5_10_15;

          bool                  Is_Movment_UU;
          bool                  Is_Movment_DU;
          bool                  Is_Movment_ULL;
          bool                  Is_Movment_DLL;
          //---
          bool                  Is_Main_0_1_Bulish    ;// = t_iMACD_Main_12_26_9_PriceClose[0]._Value   > t_iMACD_Main_12_26_9_PriceClose[1]._Value;
          bool                  Is_Signal_0_1_Bulish  ;// = t_iMACD_12_26_9_PriceClose[i].Signal[0]._Value > t_iMACD_12_26_9_PriceClose[i].Signal[1]._Value;
          bool                  Is_Main_0_5_Bulish    ;// = t_iMACD_Main_12_26_9_PriceClose[0]._Value   > t_iMACD_Main_12_26_9_PriceClose[5]._Value;
          bool                  Is_Signal_0_5_Bulish  ;// = t_iMACD_12_26_9_PriceClose[i].Signal[0]._Value > t_iMACD_12_26_9_PriceClose[i].Signal[5]._Value;//
          bool                  Is_Main_5_10_Bulish   ;// = t_iMACD_Main_12_26_9_PriceClose[6]._Value   > t_iMACD_Main_12_26_9_PriceClose[10]._Value;
          bool                  Is_Signal_5_10_Bulish ;// = t_iMACD_12_26_9_PriceClose[i].Signal[6]._Value > t_iMACD_12_26_9_PriceClose[i].Signal[10]._Value;//
          bool                  Is_Main_10_15_Bulish  ;//= t_iMACD_Main_12_26_9_PriceClose[11]._Value   > t_iMACD_Main_12_26_9_PriceClose[15]._Value;
          bool                  Is_Signal_10_15_Bulish;//= t_iMACD_12_26_9_PriceClose[i].Signal[11]._Value > t_iMACD_12_26_9_PriceClose[i].Signal[15]._Value;//
          E_SM_Possition  get_SM_P()
          {         switch(SM_Possition_0)
                    {         case E_SMP_Sell_Supportive:   {SM_Possition_0_Current = E_SMP_Sell_Supportive;}
                              case E_SMP_Sell_Resistancive: {SM_Possition_0_Current = E_SMP_Sell_Supportive;}
                              case E_SMP_Buy_Supportive:    {SM_Possition_0_Current = E_SMP_Sell_Supportive;}
                              case E_SMP_Buy_Resistancive:  {SM_Possition_0_Current = E_SMP_Sell_Supportive;} //
                    }
                    return SM_Possition_0_Current;
                    //
          }; //
          void       SetSignal1()
          {         if(Is_Main_0_1_Bulish && Is_Signal_0_1_Bulish && Is_Main_0_5_Bulish && Is_Signal_0_5_Bulish)            { TL_Movment_0_5 = E_Movment_ULL;  }
                    else if(!Is_Main_0_1_Bulish && !Is_Signal_0_1_Bulish && !Is_Main_0_5_Bulish && !Is_Signal_0_5_Bulish)   { TL_Movment_0_5 = E_Movment_DLL;}
                    //
                    if((Is_Main_0_1_Bulish && Is_Signal_0_1_Bulish) && (!Is_Main_0_5_Bulish && !Is_Signal_0_5_Bulish))      { TL_Movment_0_5 = E_Movment_UU; }
                    else if((!Is_Main_0_1_Bulish && !Is_Signal_0_1_Bulish) && (Is_Main_0_5_Bulish && Is_Signal_0_5_Bulish)) { TL_Movment_0_5 = E_Movment_DU;   }
                    //
                    Is_Movment_UU     = TL_Movment_0_5 == E_Movment_UU;
                    Is_Movment_DU     = TL_Movment_0_5 == E_Movment_DU;
                    Is_Movment_ULL    = TL_Movment_0_5 == E_Movment_ULL;
                    Is_Movment_DLL    = TL_Movment_0_5 == E_Movment_DLL;      //
          }//
          void       Signals2(st_iMACDs &arr[], int tot);
          //
};

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Sti_MACD_DataSignals::Signals2(st_iMACDs &arr[], int tot)
{         //
//Define SM_Possition_0
          {         if(arr[0].Main._Value > 0) { SM_Possition_0 = (arr[0].Main._Value > arr[0].Main._Value) ? E_SMP_Buy_Supportive  : E_SMP_Buy_Resistancive;} //
                    if(arr[0].Main._Value < 0) { SM_Possition_0 = (arr[0].Main._Value < arr[0].Main._Value) ? E_SMP_Sell_Supportive : E_SMP_Sell_Resistancive;} //
                    //
                    Is_SM_0_Sell_Supportive                          =   SM_Possition_0 == E_SMP_Sell_Supportive;
                    Is_SM_0_Sell_Resistancive                        =   SM_Possition_0 == E_SMP_Sell_Resistancive;
                    Is_SM_0_Buy_Supportive                           =   SM_Possition_0 == E_SMP_Buy_Supportive;
                    Is_SM_0_Buy_Resistancive                         =   SM_Possition_0 == E_SMP_Buy_Resistancive;//
                    //---  Alert("Period: ", EnumToString(f), "   SM_Possition_0", EnumToString(SM_Possition_0)); //
          }
//Define TL_Movment_0_5
          {         //
                    if(tot > 5)
                    {         Is_Main_0_1_Bulish   = arr[0].Main._Value > arr[1].Main._Value;
                              Is_Signal_0_1_Bulish = arr[0].Main._Value > arr[1].Main._Value;
                              Is_Main_0_5_Bulish   = arr[1].Main._Value > arr[5].Main._Value;
                              Is_Signal_0_5_Bulish = arr[1].Main._Value > arr[5].Main._Value;//
                    }
                    //
                    {         if(Is_Main_0_1_Bulish && Is_Signal_0_1_Bulish && Is_Main_0_5_Bulish && Is_Signal_0_5_Bulish)            { TL_Movment_0_5 = E_Movment_ULL;  }
                              else if(!Is_Main_0_1_Bulish && !Is_Signal_0_1_Bulish && !Is_Main_0_5_Bulish && !Is_Signal_0_5_Bulish)   { TL_Movment_0_5 = E_Movment_DLL;}
                              //
                              if((Is_Main_0_1_Bulish && Is_Signal_0_1_Bulish) && (!Is_Main_0_5_Bulish && !Is_Signal_0_5_Bulish))      { TL_Movment_0_5 = E_Movment_UU; }
                              else if((!Is_Main_0_1_Bulish && !Is_Signal_0_1_Bulish) && (Is_Main_0_5_Bulish && Is_Signal_0_5_Bulish)) { TL_Movment_0_5 = E_Movment_DU;   }
                              //
                              Is_Movment_UU     = TL_Movment_0_5 == E_Movment_UU;
                              Is_Movment_DU     = TL_Movment_0_5 == E_Movment_DU;
                              Is_Movment_ULL    = TL_Movment_0_5 == E_Movment_ULL;
                              Is_Movment_DLL    = TL_Movment_0_5 == E_Movment_DLL;      //
                    }// //
          }
//Define TL_Movment_0_5_10
          {         if(tot > 15)
                    {         Is_Main_0_1_Bulish      = arr[0].Main._Value  > arr[1].Main._Value;
                              Is_Signal_0_1_Bulish    = arr[0].Main._Value  > arr[1].Main._Value;
                              Is_Main_0_5_Bulish      = arr[1].Main._Value  > arr[5].Main._Value;
                              Is_Signal_0_5_Bulish    = arr[1].Main._Value  > arr[5].Main._Value;//
                              //
                              Is_Main_5_10_Bulish     = arr[6].Main._Value  > arr[10].Main._Value;
                              Is_Signal_5_10_Bulish   = arr[6].Main._Value  > arr[10].Main._Value;//
                              Is_Main_10_15_Bulish    = arr[11].Main._Value > arr[15].Main._Value;
                              Is_Signal_10_15_Bulish  = arr[11].Main._Value > arr[15].Main._Value;//
                    }
                    if(Is_Main_0_1_Bulish && Is_Signal_0_1_Bulish && Is_Main_0_5_Bulish && Is_Signal_0_5_Bulish)              //     //
                    {         TL_Movment_0_5_10_15 = E_Movment_ULL;
                              if((Is_Main_5_10_Bulish && Is_Signal_5_10_Bulish) && (Is_Main_10_15_Bulish && Is_Signal_10_15_Bulish))                   { TL_Movment_0_5_10_15 = E_Movment_ULL_ULL;}           ///
                              else if ((!Is_Main_5_10_Bulish && !Is_Signal_5_10_Bulish) && (!Is_Main_10_15_Bulish && !Is_Signal_10_15_Bulish))         { TL_Movment_0_5_10_15 = E_Movment_DLL_ULL;}    //     \\//
                              //
                              if((Is_Main_5_10_Bulish && Is_Signal_5_10_Bulish) && (!Is_Main_10_15_Bulish && !Is_Signal_10_15_Bulish))                 { TL_Movment_0_5_10_15 = E_Movment_UU_ULL;}    //      /\//
                              else if ((!Is_Main_5_10_Bulish && !Is_Signal_5_10_Bulish) && (Is_Main_10_15_Bulish && Is_Signal_10_15_Bulish))           { TL_Movment_0_5_10_15 = E_Movment_DU_ULL;}    //      \///
                    }
                    else if(!Is_Main_0_1_Bulish && !Is_Signal_0_1_Bulish && !Is_Main_0_5_Bulish && !Is_Signal_0_5_Bulish)    //      \\
                    {         TL_Movment_0_5_10_15 = E_Movment_DLL;
                              if((Is_Main_5_10_Bulish && Is_Signal_5_10_Bulish) && (Is_Main_10_15_Bulish && Is_Signal_10_15_Bulish))                   { TL_Movment_0_5_10_15 = E_Movment_ULL_DLL;}           ///
                              else if ((!Is_Main_5_10_Bulish && !Is_Signal_5_10_Bulish) && (!Is_Main_10_15_Bulish && !Is_Signal_10_15_Bulish))         { TL_Movment_0_5_10_15 = E_Movment_DLL_DLL;}    //     \//
                              //
                              if((Is_Main_5_10_Bulish && Is_Signal_5_10_Bulish) && (!Is_Main_10_15_Bulish && !Is_Signal_10_15_Bulish))                 { TL_Movment_0_5_10_15 = E_Movment_UU_DLL;}           ///
                              else if ((!Is_Main_5_10_Bulish && !Is_Signal_5_10_Bulish) && (Is_Main_10_15_Bulish && Is_Signal_10_15_Bulish))           { TL_Movment_0_5_10_15 = E_Movment_DU_DLL;}    //     \//
                    }
                    //
                    if((Is_Main_0_1_Bulish && Is_Signal_0_1_Bulish) && (!Is_Main_0_5_Bulish && !Is_Signal_0_5_Bulish))       //      \/
                    {         TL_Movment_0_5_10_15 = E_Movment_DU;
                              if((Is_Main_5_10_Bulish && Is_Signal_5_10_Bulish) && (Is_Main_10_15_Bulish && Is_Signal_10_15_Bulish))                   { TL_Movment_0_5_10_15 = E_Movment_ULL_UU;}           ///
                              else if ((!Is_Main_5_10_Bulish && !Is_Signal_5_10_Bulish) && (!Is_Main_10_15_Bulish && !Is_Signal_10_15_Bulish))         { TL_Movment_0_5_10_15 = E_Movment_DLL_UU;}    //     \//
                              //
                              if((Is_Main_5_10_Bulish && Is_Signal_5_10_Bulish) && (!Is_Main_10_15_Bulish && !Is_Signal_10_15_Bulish))                { TL_Movment_0_5_10_15 = E_Movment_UU_UU;}           ///
                              else if ((!Is_Main_5_10_Bulish && !Is_Signal_5_10_Bulish) && (Is_Main_10_15_Bulish && Is_Signal_10_15_Bulish))           { TL_Movment_0_5_10_15 = E_Movment_DU_UU;}    //     \//
                    }
                    else if((!Is_Main_0_1_Bulish && !Is_Signal_0_1_Bulish) && (Is_Main_0_5_Bulish && Is_Signal_0_5_Bulish))  //      /\
                    {         TL_Movment_0_5_10_15 = E_Movment_UU;
                              if((Is_Main_5_10_Bulish && Is_Signal_5_10_Bulish) && (Is_Main_10_15_Bulish && Is_Signal_10_15_Bulish))                   { TL_Movment_0_5_10_15 = E_Movment_ULL_DU;}           ///
                              else if ((!Is_Main_5_10_Bulish && !Is_Signal_5_10_Bulish) && (!Is_Main_10_15_Bulish && !Is_Signal_10_15_Bulish))         { TL_Movment_0_5_10_15 = E_Movment_DLL_DU;}    //     \//
                              //
                              if((Is_Main_5_10_Bulish && Is_Signal_5_10_Bulish) && (!Is_Main_10_15_Bulish && !Is_Signal_10_15_Bulish))                { TL_Movment_0_5_10_15 = E_Movment_UU_DU;}     //      \//\
                              else if ((!Is_Main_5_10_Bulish && !Is_Signal_5_10_Bulish) && (Is_Main_10_15_Bulish && Is_Signal_10_15_Bulish))           { TL_Movment_0_5_10_15 = E_Movment_DU_DU;}    //      \/\/
                    }//
          }//
//-------------------------------------------------------------------------------------------------------------------------------------------
}

//2023.12.15 16:20:13.147     QUARTS_AF1 XAUUSD,M1: Creating Object Not IsDone!  1PERIOD_M30_desc.4Macd-SBDI-Selling-Range:M:3 B:368 P The Error:no error : 0

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class Sti_MACD
{         //----------------------------------------------
          // macd > signal buy   low   signal Bulish trend
          // macd < signal sell  upp   signal bearish trend
          //-----------------------------------------------
public:
          void       Sti_MACD(string name,ENUM_TIMEFRAMES F, bool b, int s, int psc)
          {         f = F;
                    Name = name;
                    //if( Sti_MACDSafe.IsInited)
                    {         //if((Sti_MACDSafe.MACD_Cross_Signal.MACD_RR[0].IsTargetTP3Achived == +1  || Sti_MACDSafe.MACD_Cross_Signal.MACD_RR[0].IsTargetSL1Achived == +1))
                              initer(1, b, s, psc); IsInited = true;
                              //
                    }
                    //else return;//
                    //
          };
          //void       Sti_MACD() {Sti_MACD & that} {this = that;};
          //---!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! the creator needd inittting
          void       Sti_MACD() { /*initer(0, false, 0);  no need */ IsInited = true; }
          void      ~Sti_MACD() {};
          string     Name;
          //---
          //St_MqlCondicator      mql;

          st_iMACDs             t_iMACD_12_26_9_PriceClose[];
          //--------------------------------------------------------------
          int                   total_Bar;
          bool                  mIsNew_detected;
          datetime              PrevTimeDetected;
          static datetime       NowTimeDetected;
          int                   idxCross_SignalRR;

          //
          E_SM_Possition        get_SM_P();
          Sti_MACD_Data         DATAS[];
          Sti_MACD_Data2        DATAS_Candels[];
          //--------------------------------------------------------------
          Sti_MACD_DataSignals  Signals;
          St_MACD_Cross_Signal  MACD_Cross_Signal;
          //--------------------------------------------------------------
          double     maCurrent_t_iMACD_Main_12_26_9_PriceClose;
          //-----------------------------------------
          //St_CondicatorData_Pivot MACDPivot[];//no need
          //------------------------------------------
          //int                   Maximum_Shift_Main, Maximum_Shift_Signal;
          //int                   Minimum_Shift_Main, Minimum_Shift_Signal;
          //double                Maximum_Value_Main, Maximum_signal_Value;
          //double                Minimum_Value_Main, Minimum_signal_Value;
          Sti_MACD_data2        Main, Signal;
          ENUM_TIMEFRAMES       f;
          void                  initer( int mode, bool b, int s, int psc);
          bool                  IsInited;
          void                  ExtractSignalBroken_AND_FaceMacdBroken( bool b, int s, int psc);
          //-------------------------------------------

          //-------------------------------------------

};
datetime Sti_MACD::NowTimeDetected = 0;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Sti_MACD::initer( int mode, bool b, int s, int psc)
{         //________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
//if(!Detect_NewBar._M1.CBT__HalfMinute.Is_NewBar)return;
//-----------------------------------------------------
          //if(!b) {ObjectsDeleteAll(0, Name); return;}
          ObjectsDeleteAll(0, Name);
          if(!IsTesting())
          {         if(false)
                    {         /*no need slower calcs DATAS[i].RangeSL it 700bar*///
                              //St_CDI_CZZ _ZigZags_12_5_3_Period(12, 5, 3, f, NULL, 0, 0, 5, 3);    ///--, 10, 200
                              //---
                              //--Alert("SZ: ", ArraySize(_ZigZags_12_5_3_Period.ZigZags));
                              //total_Bar = _ZigZags_12_5_3_Period._CZZ_Point[5]._Shift + 1; //100;
                              //if(total_Bar < _ZigZags_12_5_3_Period._CZZ_Point[4]._Shift) total_Bar = _ZigZags_12_5_3_Period._CZZ_Point[4]._Shift + 1; //100;
                    }
                    else {total_Bar = ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.GDS.Wave1.A._Shift + 450;} //Alert("total_Bar:", total_Bar);
                    if(IsTesting()) {total_Bar = 5;}
                    //---
                    if(ArrayResize(t_iMACD_12_26_9_PriceClose,        total_Bar + 100) < 0) {ArrayResize(t_iMACD_12_26_9_PriceClose,        total_Bar + 1000); return;}
                    // fill array
                    for(int i = 0; i < total_Bar; i++)
                    {         //------------------------------------
                              t_iMACD_12_26_9_PriceClose[i].Main   = St_iMACD(Symbol(), f, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, i);         t_iMACD_12_26_9_PriceClose[i].mql._iMACD(t_iMACD_12_26_9_PriceClose[i].Main);
                              t_iMACD_12_26_9_PriceClose[i].Signal = St_iMACD(Symbol(), f, 12, 26, 9, PRICE_CLOSE, MODE_SIGNAL, i);       t_iMACD_12_26_9_PriceClose[i].mql._iMACD(t_iMACD_12_26_9_PriceClose[i].Signal);//
                              //------------------------------------
                              //bugy
                              //mql._iMACD(t_iMACD_12_26_9_PriceClose[i].Main   = t_iMACD_12_26_9_PriceClose[i].MACD(Symbol(), f, 12, 26, 9, PRICE_CLOSE, i).Main); // t_iMACD_12_26_9_PriceClose[i].Main //
                              //mql._iMACD(t_iMACD_12_26_9_PriceClose[i].Signal = t_iMACD_12_26_9_PriceClose[i].MACD(Symbol(), f, 12, 26, 9, PRICE_CLOSE, i).Signal); //
                    }
                    //
                    Signals.Signals2(t_iMACD_12_26_9_PriceClose, total_Bar);
                    //
                    {         Signal.Max._Value      = 0;//INT_MIN ; //INT_MAX
                              Signal.Min._Value      = 0;//INT_MAX;  //INT_MIN
                              Signal.Curr._Value     = t_iMACD_12_26_9_PriceClose[0].Signal._Value;
                              Main.Min.Shift         = 0;
                              Main.Max.Shift         = 0;
                              Main.Curr._Value       = t_iMACD_12_26_9_PriceClose[0].Main._Value;
                              for(int i = 0; i < total_Bar; i++)
                              {         if(Main.Min._Value   > t_iMACD_12_26_9_PriceClose[i].Main._Value)   { Main.Min._Value          = t_iMACD_12_26_9_PriceClose[i].Main._Value;     Main.Min.Shift   = t_iMACD_12_26_9_PriceClose[i].Main.shift; }//
                                        if(Signal.Min._Value > t_iMACD_12_26_9_PriceClose[i].Signal._Value) { Signal.Min._Value        = t_iMACD_12_26_9_PriceClose[i].Signal._Value;   Signal.Min.Shift = t_iMACD_12_26_9_PriceClose[i].Signal.shift; } //
                                        //
                                        if(Main.Max._Value   < t_iMACD_12_26_9_PriceClose[i].Main._Value)   { Main.Max._Value          = t_iMACD_12_26_9_PriceClose[i].Main._Value;     Main.Max.Shift   = t_iMACD_12_26_9_PriceClose[i].Main.shift; }//
                                        if(Signal.Max._Value < t_iMACD_12_26_9_PriceClose[i].Signal._Value) { Signal.Max._Value        = t_iMACD_12_26_9_PriceClose[i].Signal._Value;   Signal.Max.Shift = t_iMACD_12_26_9_PriceClose[i].Signal.shift; } //
                                        ///***********************************************************************************************************************************************************
                              }
                              Main.Max._Value    = NormalizeDouble(Main.Max._Value, 2);
                              Signal.Max._Value  = NormalizeDouble(Signal.Max._Value, 2);
                              Main.Min._Value    = NormalizeDouble(Main.Min._Value, 2);
                              Signal.Min._Value  = NormalizeDouble(Signal.Min._Value, 2);
                              //Print(  Main.Max.Shift,     "   Main.Max.Shift"); //
                              //Print(  Signal.Max.Shift,   "   inr  Signal.Max.Shift"); //
                              //Print(  Main.Min.Shift,     "   Main.Min.Shift");
                              //Print(  Signal.Min.Shift,   "   Signal.Min.Shift"); //
                              //Print(  Main.Max._Value,     "   Main.Max._Value"); //
                              //Print(  Signal.Max._Value,   "   Signal.Max._Value"); //
                              //Print(  Main.Min._Value,     "   Main.Min._Value"); //
                              //Print(  Signal.Min._Value,   "   Signal.Min._Value"); //
                              //Print( "++++++++++++++++++++++++++++++++" );
                              //Print((string)( Main.Max._Value), "  inr  Main.Max._Value)");
                    }//
          }
          else
          {         if(1)
                    {         /*no need slower calcs DATAS[i].RangeSL it 700bar*///
                              St_CDI_CZZ _ZigZags_12_5_3_Period(false, "_ZigZags_12_5_3_Period" + EnumToString(f), 12, 5, 3, f, NULL, 0, 0, 2, 3);  ///--, 10, 200
                              //---
                              //--Alert("SZ: ", ArraySize(_ZigZags_12_5_3_Period.ZigZags));
                              total_Bar = _ZigZags_12_5_3_Period._CZZ_Point[2]._Shift; //100;
                    }
                    //if(IsTesting()) {total_Bar = 15;}
                    //---
                    if(ArrayResize(t_iMACD_12_26_9_PriceClose,        total_Bar + 0) < 0) {ArrayResize(t_iMACD_12_26_9_PriceClose,        total_Bar + 0); return;}
                    // fill array
                    for(int i = 0; i < total_Bar; i++)
                    {         //------------------------------------
                              t_iMACD_12_26_9_PriceClose[i].Main   = St_iMACD(Symbol(), f, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, i);         t_iMACD_12_26_9_PriceClose[i].mql._iMACD(t_iMACD_12_26_9_PriceClose[i].Main);
                              t_iMACD_12_26_9_PriceClose[i].Signal = St_iMACD(Symbol(), f, 12, 26, 9, PRICE_CLOSE, MODE_SIGNAL, i);       t_iMACD_12_26_9_PriceClose[i].mql._iMACD(t_iMACD_12_26_9_PriceClose[i].Signal);//
                              //------------------------------------
                              //bugy
                              //mql._iMACD(t_iMACD_12_26_9_PriceClose[i].Main   = t_iMACD_12_26_9_PriceClose[i].MACD(Symbol(), f, 12, 26, 9, PRICE_CLOSE, i).Main); // t_iMACD_12_26_9_PriceClose[i].Main //
                              //mql._iMACD(t_iMACD_12_26_9_PriceClose[i].Signal = t_iMACD_12_26_9_PriceClose[i].MACD(Symbol(), f, 12, 26, 9, PRICE_CLOSE, i).Signal); //
                    }//
          }
//-----------------------------------------------------------------------------
          ExtractSignalBroken_AND_FaceMacdBroken( b, s, psc);
//-----------------------------------------------------------------------------
//________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
}//

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Sti_MACD::ExtractSignalBroken_AND_FaceMacdBroken( bool b, int s, int psc)
{         for(int i = 0; i < iBars(Symbol(), f) && false; i++)
          {         //----------------------------------------------------------------------------------------------------
          } //
          int Size_ = ArraySize(t_iMACD_12_26_9_PriceClose);
          Size_ *= 2;
          {         //---resise reset
                    ArrayResize(MACD_Cross_Signal.MACD_RR, Size_);
                    ArrayResize(MACD_Cross_Signal.DATAS, Size_);
                    ArrayResize(MACD_Cross_Signal.eMACD_STATE, Size_);
                    ArrayResize(MACD_Cross_Signal.E_MACD_Cross_Signal, Size_);
                    ArrayResize(MACD_Cross_Signal.BarShift, Size_);
                    ArrayResize(MACD_Cross_Signal.BarPrice, Size_);
                    ArrayResize(MACD_Cross_Signal.BarTime, Size_);
                    //
                    ArrayResize(DATAS, Size_);
                    ArrayResize(DATAS_Candels, Size_ * 2);
                    //---  reset
                    ArrayInitialize(MACD_Cross_Signal.eMACD_STATE, NULL);
                    ArrayInitialize(MACD_Cross_Signal.E_MACD_Cross_Signal, NULL);
                    //
                    MACD_Cross_Signal.E_MACD_Cross_Signal[0]    = Et_MACD_Cross_Signal_Void;
                    MACD_Cross_Signal.eMACD_STATE[0]            = EVoide_MACD_STATE;
                    MACD_Cross_Signal.MACD_RR[0].RRR_angeAmount          = 0;
                    MACD_Cross_Signal.MACD_RR[0].MACDamount             = 0;
                    MACD_Cross_Signal.MACD_RR[0].IsTargetSL1Achived     = 0;
                    MACD_Cross_Signal.MACD_RR[0].IsTargetTP1Achived     = 0;
                    MACD_Cross_Signal.MACD_RR[0].IsTargetTP2Achived     = 0;
                    MACD_Cross_Signal.MACD_RR[0].IsTargetTP3Achived     = 0;
                    MACD_Cross_Signal.MACD_RR[0].IsBuyp1Selln1          = 0;
                    MACD_Cross_Signal.MACD_RR[0].amountSLPrice          = -1;
                    MACD_Cross_Signal.MACD_RR[0].amountTPPrice          = -1 ;
                    //
                    ArrayInitialize(MACD_Cross_Signal.BarShift, NULL);
                    MACD_Cross_Signal.Idx = 0; //
          }
//------------------------------------------------
          {         // Macd EMA 20
                    double macdArray[]; ArrayResize(macdArray, ArraySize(t_iMACD_12_26_9_PriceClose));
                    for(int i = 0; i < ArraySize(macdArray) - 1; i++)
                    {         macdArray[i] = t_iMACD_12_26_9_PriceClose[i].Main._Value; //
                    }
                    bool res = ArraySetAsSeries(macdArray, true);///good job
                    maCurrent_t_iMACD_Main_12_26_9_PriceClose = iMAOnArray(macdArray, 0, 20, 0, MODE_EMA, 0);//
          }
//------------------------------------------------
          if(0)//no need// must come from global var
          {         //
                    //ArrayResize(MACDPivot, Size_); //
                    ////if(f == PERIOD_M5 || f == PERIOD_M5)/*when graphical create is active it gone slow*/
                    //{         for(int i = 0; i < Size_ - 1; i++) { MACDPivot[i] = St_CondicatorData_Pivot(f, false, 0, E_Fibonacci, i, true); } }//
          }
//------------------------------------------------
//Cgs_DevObjectPack     Dev_Object_Pack2;///makes lag and memmory morthan 512kb
          for(int i = 0; i < Size_ / 2 - 1; i++)
          {         // reset DECIDE SIGNAL
                    DATAS[i].Is_Detected_CrossUp                        = false;
                    DATAS[i].Is_Detected_CrossDown                      = false;
                    //----
                    DATAS[i].Is_CrossUp_Signal_Selling                  = false;
                    DATAS[i].Is_CrossDown_Signal_Buying                 = false;
                    //=========================================================
                    // SET VALUES SIGNAL
                    //
                    DATAS[i].main_Value                                         = t_iMACD_12_26_9_PriceClose[i].Main._Value;    //if(t_iMACD_12_26_9_PriceClose[i].Main._Value == 0) {Print("its zero _Value ", f, " ", t_iMACD_12_26_9_PriceClose[i].Main._Value);}
                    DATAS[i].signal_Value                                       = t_iMACD_12_26_9_PriceClose[i].Signal._Value;
                    //================================================================================================
                    //--CHEAK OUTS
                    DATAS[i].Is_BullSide                                = DATAS[i].main_Value > 0;  //--- signal_Value>main_Value
                    DATAS[i].Is_Bulish_Signal                           = DATAS[i].signal_Value  > DATAS[i + 1].signal_Value;
                    DATAS[i].Is_Bulish_Main                             = DATAS[i].main_Value    > DATAS[i + 1].main_Value;
                    //----------------------------------------------------------------------------------------------------
                    DATAS[i].Is_Signal_Grater_Main__Selling             = DATAS[i].signal_Value     >= DATAS[i].main_Value ;
                    DATAS[i].Is_Signal_Grater_Main__SellingP            = DATAS[i + 1].signal_Value >= DATAS[i + 1].main_Value ;
                    //
                    DATAS[i].Is_Signal_Lower_Main__Buying               = DATAS[i].signal_Value     < DATAS[i].main_Value ;
                    DATAS[i].Is_Signal_Lower_Main__BuyingP              = DATAS[i + 1].signal_Value < DATAS[i + 1].main_Value ;
                    //---------------------------------------------------------------------------------------------------- reset
                    DATAS[i].Is_CrossUp_Signal_Selling                  = false;
                    DATAS[i].Is_CrossDown_Signal_Buying                 = false; //
                    DATAS[i].Is_Detected_CrossDown                      = false;
                    DATAS[i].Is_Detected_CrossUp                        = false;//
                    DATAS[i].IsCrossMACD                                = false;//
                    DATAS[i].eMACD_STATE                                = EVoide_MACD_STATE;//
                    //----------------------------------------------------------------------------------------------------
                    DATAS[i].cE_SL1                                     = clrNONE;
                    DATAS[i].cE_TP1                                     = clrNONE;
                    DATAS[i].cE_TP2                                     = clrNONE;
                    DATAS[i].cE_TP3                                     = clrNONE;
                    DATAS[i].CalcMode                                   = 0;
                    DATAS[i].RRR_0Price1 = 0;    DATAS[i].RRR_0Price2     = 0;
                    DATAS[i].RRR_0Time1  = 0;    DATAS[i].RRR_0Time2      = 0;
                    DATAS[i].RRR_1Price1 = 0;    DATAS[i].RRR_1Price2     = 0;
                    DATAS[i].RRR_1Time1  = 0;    DATAS[i].RRR_1Time2      = 0;
                    DATAS[i].RRR_2Price1 = 0;    DATAS[i].RRR_2Price2     = 0;
                    DATAS[i].RRR_2Time1  = 0;    DATAS[i].RRR_2Time2      = 0;
                    DATAS[i].RRR_3Price1 = 0;    DATAS[i].RRR_3Price2     = 0;
                    DATAS[i].RRR_3Time1  = 0;    DATAS[i].RRR_3Time2      = 0;
                    DATAS[i].Price2SL                                   = 0;
                    DATAS[i].RangeSL                                    = 0;
                    DATAS[i].TargetSL                                   = 0;
                    DATAS[i].TargetTP1                                  = 0;
                    DATAS[i].TargetTP2                                  = 0;
                    DATAS[i].TargetTP3                                  = 0;
                    //
                    DATAS[i].AmountSL                                   = 0;
                    DATAS[i].AmountTP1                                  = 0;
                    DATAS[i].AmountTP2                                  = 0;
                    DATAS[i].AmountTP3                                  = 0;
                    //
                    DATAS[i].IsVerifiedSignalBySlRange                  = 0;
                    DATAS[i].IsTargetSL1Achived                         = 0;
                    DATAS[i].IsTargetTp1Achived                         = 0;
                    DATAS[i].IsTargetTp2Achived                         = 0;
                    DATAS[i].IsTargetTp3Achived                         = 0;
                    DATAS[i].eAchivmentTargets                          = E_TPVoid;
                    //----------------------------------------------------------------------------------------------------
          }
          for(int i = 0; i < Size_ * 2 - 0 ; i++)
          {         // SET VALUES MAIN
                    //
                    DATAS_Candels[i].Candel_Time                                        = iTime(Symbol(), f, i);                                //t_iMACD_12_26_9_PriceClose[i].Main._Time;
                    DATAS_Candels[i].Candel_Open                                        = iOpen(Symbol(), f, i);
                    DATAS_Candels[i].Candel_Close                                       = iClose(Symbol(), f, i);                               //t_iMACD_12_26_9_PriceClose[i].Main._Close;
                    DATAS_Candels[i].Candel_High                                        = iHigh(Symbol(), f, i);                                //t_iMACD_12_26_9_PriceClose[i].Main._High;  if(t_iMACD_12_26_9_PriceClose[i].Main._High == 0) {Print(i, "  its zero high ", f, " ", t_iMACD_12_26_9_PriceClose[i].Main._High);}
                    DATAS_Candels[i].Candel_Low                                         = iLow(Symbol(), f, i);                                 //t_iMACD_12_26_9_PriceClose[i].Main._Low;
                    DATAS_Candels[i].Candel_Median                                      = (DATAS_Candels[i].Candel_High + DATAS_Candels[i].Candel_Low ) / 2 ;       //t_iMACD_12_26_9_PriceClose[i].Main._Median;
                    //
                    DATAS_Candels[i].CandelHigth                                        = MathAbs(DATAS_Candels[i].Candel_High - DATAS_Candels[i].Candel_Low); //
                    DATAS_Candels[i].CandelHigthBody                                    = MathAbs(DATAS_Candels[i].Candel_Close - DATAS_Candels[i].Candel_Open); //
                    //--------------------------------------------
                    DATAS_Candels[i].shiftLowestOld      = 0 ; //= iLowest(Symbol(), f, MODE_LOW, RageView / 2, i);
                    DATAS_Candels[i].shiftHighestOld     = 0 ; ;//= iHighest(Symbol(), f, MODE_HIGH, RageView / 2, i);
                    //
                    DATAS_Candels[i].shiftLowestNew      = 0 ; ;//= iLowest(Symbol(), f, MODE_LOW, RageView / 2, i - RageView / 2);
                    DATAS_Candels[i].shiftHighestNew     = 0 ; ;//= iHighest(Symbol(), f, MODE_HIGH, RageView / 2, i - RageView / 2);
                    //----------------------------------------------------------------------
                    DATAS_Candels[i].ValueLowestOld      = 0 ;   ;//= iLow(Symbol(), f, shiftLowestOld);
                    DATAS_Candels[i].ValueHighestOld     = 0 ; ;//= iHigh(Symbol(), f, shiftHighestOld);
                    //
                    DATAS_Candels[i].ValueLowestNew      = 0 ;  ;//= iLow(Symbol(), f, shiftLowestNew);
                    DATAS_Candels[i].ValueHighestNew     = 0 ; ;//= iHigh(Symbol(), f, shiftHighestNew);
                    //----------------------------------------------------------------------
                    DATAS_Candels[i].shiftLowestOldOld   = 0 ; ;//= iLowest(Symbol(), f, MODE_LOW, RageView / 2, shiftHighestOld);
                    DATAS_Candels[i].shiftHighestOldOld  = 0 ; ;//= iHighest(Symbol(), f, MODE_HIGH, RageView / 2, shiftLowestOld);
                    //
                    DATAS_Candels[i].ValueLowestOldOld   = 0 ;   ;//= iLow(Symbol(), f, shiftLowestOldOld);
                    DATAS_Candels[i].ValueHighestOldOld  = 0 ; ;//= iHigh(Symbol(), f, shiftHighestOldOld);
                    //----------------------------------------
                    DATAS_Candels[i].shiftLowestNewNew   = 0 ;;// = iLowest(Symbol(), f, MODE_LOW, DATAS_Candels[i].shiftHighestNew, RageView / 2);
                    DATAS_Candels[i].shiftHighestNewNew  = 0 ;;// = iHighest(Symbol(), f, MODE_HIGH, DATAS_Candels[i].shiftLowestNew, RageView / 2);
                    //
                    DATAS_Candels[i].ValueLowestNewNew   = 0 ;;//   = iLow(Symbol(), f, DATAS_Candels[i].shiftLowestNewNew);
                    DATAS_Candels[i].ValueHighestNewNew  = 0 ;;// = iHigh(Symbol(), f, DATAS_Candels[i].shiftHighestNewNew);
          }
          if(ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Pad_Is_All || (!ct_Drive.TDD.ct_Configs.IsShow_MACD_Shapes&&Initer.IsBasic_Done)) {b = false; }
//------------------------------------------------
          int RageView = 20;
          int PeriodSecondsCount = psc;
          int SLRangePips = 500;
          bool IsAllowRR = 1; //
          if(f == PERIOD_M1 || f == PERIOD_CURRENT) PeriodSecondsCount = 1;
//if(f != PERIOD_M1) return;//
//------------------------------------------------
          ObjectsDeleteAll(0, Name);
          for(int i = 0; i < Size_ * 2 - 3; i++)
          {         //================================================================================================
                    DATAS_Candels[i].shiftLowestOld  = iLowest(Symbol(), f, MODE_LOW, RageView / 2, i);
                    DATAS_Candels[i].shiftHighestOld = iHighest(Symbol(), f, MODE_HIGH, RageView / 2, i);
                    //
                    DATAS_Candels[i].shiftLowestNew = iLowest(Symbol(), f, MODE_LOW, RageView / 2, i - RageView / 2);
                    DATAS_Candels[i].shiftHighestNew = iHighest(Symbol(), f, MODE_HIGH, RageView / 2, i - RageView / 2);
                    //----------------------------------------------------------------------
                    DATAS_Candels[i].ValueLowestOld   = iLow(Symbol(), f, DATAS_Candels[i].shiftLowestOld);
                    DATAS_Candels[i].ValueHighestOld = iHigh(Symbol(), f, DATAS_Candels[i].shiftHighestOld);
                    //
                    DATAS_Candels[i].ValueLowestNew  = iLow(Symbol(), f, DATAS_Candels[i].shiftLowestNew);
                    DATAS_Candels[i].ValueHighestNew = iHigh(Symbol(), f, DATAS_Candels[i].shiftHighestNew);
                    //----------------------------------------------------------------------
                    DATAS_Candels[i].shiftLowestOldOld = iLowest(Symbol(), f, MODE_LOW, RageView / 2, DATAS_Candels[i].shiftHighestOld);
                    DATAS_Candels[i].shiftHighestOldOld = iHighest(Symbol(), f, MODE_HIGH, RageView / 2, DATAS_Candels[i].shiftLowestOld);
                    //
                    DATAS_Candels[i].ValueLowestOldOld   = iLow(Symbol(), f, DATAS_Candels[i].shiftLowestOldOld);
                    DATAS_Candels[i].ValueHighestOldOld = iHigh(Symbol(), f, DATAS_Candels[i].shiftHighestOldOld);
                    //----------------------------------------------------------------------
                    DATAS_Candels[i].shiftLowestNewNew = iLowest(Symbol(), f, MODE_LOW, DATAS_Candels[i].shiftHighestNew, RageView / 2);
                    DATAS_Candels[i].shiftHighestNewNew = iHighest(Symbol(), f, MODE_HIGH, DATAS_Candels[i].shiftLowestNew, RageView / 2);
                    //
                    DATAS_Candels[i].ValueLowestNewNew   = iLow(Symbol(), f, DATAS_Candels[i].shiftLowestNewNew);
                    DATAS_Candels[i].ValueHighestNewNew = iHigh(Symbol(), f, DATAS_Candels[i].shiftHighestNewNew);
                    //================================================================================================
          }
          for(int i = 0; i < Size_ - 3; i++)
          {         // DECIDE SIGNAL
                    //if(i == 0) continue;
                    if(DATAS[i].Is_BullSide && DATAS[i].Is_Signal_Grater_Main__Selling)
                    {         DATAS[i].IsCrossMACD = (DATAS[i + 1].main_Value > DATAS[i + 1].signal_Value) && (DATAS[i + 0].main_Value <  DATAS[i + 0].signal_Value)  ;//&& (DATAS[i - 1].main_Value < DATAS[i - 1].signal_Value);//perfect OK
                              //bool IsCross1 = (DATAS[i - 1].signal_Value > DATAS[i + 0].signal_Value) && (DATAS[i - 1].main_Value < DATAS[i + 0].main_Value);
                              DATAS[i].Is_Detected_CrossUp    = DATAS[i].Is_CrossUp_Signal_Selling   =   (DATAS[i].IsCrossMACD);
                              //DATAS[i].eMACD_STATE = (DATAS[i].Is_CrossUp_Signal_Selling) ? UP_OUT : EVoide_MACD_STATE ; //
                              if(DATAS[i].IsCrossMACD)  {DATAS[i].eMACD_STATE = UP_OUT;} //
                    } //
                    if(!DATAS[i].Is_BullSide && DATAS[i].Is_Signal_Lower_Main__Buying)
                    {         DATAS[i].IsCrossMACD =  (DATAS[i + 1].main_Value < DATAS[i + 1].signal_Value) && (DATAS[i + 0].main_Value >  DATAS[i + 0].signal_Value)  ;//&& (DATAS[i - 1].main_Value > DATAS[i - 1].signal_Value);//perfect OK
                              //bool IsCross1 = (DATAS[i - 1].signal_Value < DATAS[i + 0].signal_Value) && (DATAS[i - 1].main_Value > DATAS[i + 0].main_Value);
                              DATAS[i].Is_Detected_CrossDown  =  DATAS[i].Is_CrossDown_Signal_Buying =   (DATAS[i].IsCrossMACD);
                              //DATAS[i].eMACD_STATE = (DATAS[i].Is_CrossDown_Signal_Buying) ? DOWN_OUT : EVoide_MACD_STATE ; //
                              if(DATAS[i].IsCrossMACD)  {DATAS[i].eMACD_STATE = DOWN_OUT;} //
                    }
                    if(DATAS[i].Is_BullSide )//&& !DATAS[i].Is_Signal_Grater_Main__Selling
                    {         DATAS[i].IsCrossMACD = (DATAS[i + 1].main_Value < DATAS[i + 1].signal_Value) && (DATAS[i + 0].main_Value >  DATAS[i + 0].signal_Value)  ;//&& (DATAS[i - 1].main_Value > DATAS[i - 1].signal_Value);;//perfect OK
                              //bool IsCross1 = (DATAS[i - 1].signal_Value < DATAS[i + 0].signal_Value) && (DATAS[i + 1].main_Value > DATAS[i + 0].main_Value);
                              //DATAS[i].eMACD_STATE = (DATAS[i].IsCrossMACD) ? UP_IN : EVoide_MACD_STATE; ///...---bug reset wrong
                              if(DATAS[i].IsCrossMACD)  {DATAS[i].eMACD_STATE = UP_IN;} //
                    } //
                    if(!DATAS[i].Is_BullSide )//&& !DATAS[i].Is_Signal_Lower_Main__Buying
                    {         DATAS[i].IsCrossMACD = (DATAS[i + 1].main_Value > DATAS[i + 1].signal_Value) && (DATAS[i + 0].main_Value <  DATAS[i + 0].signal_Value)  ;//&& (DATAS[i - 1].main_Value < DATAS[i - 1].signal_Value);;//perfect OK
                              //bool IsCross1 = (DATAS[i - 1].signal_Value < DATAS[i + 0].signal_Value) && (DATAS[i + 1].main_Value < DATAS[i + 0].main_Value);
                              //DATAS[i].eMACD_STATE = (DATAS[i].IsCrossMACD) ? DOWN_IN : EVoide_MACD_STATE; //...---bug reset wrong
                              if(DATAS[i].IsCrossMACD)  {DATAS[i].eMACD_STATE = DOWN_IN;} //
                    }
                    //================================================================================================
                    //Sleep(100);
                    if(DATAS[i].eMACD_STATE == EVoide_MACD_STATE ) continue;
                    //-----------------------------------------------------------------------------------------------
                    int indx = 0;
                    if(i == 0)        { indx = 1;}
                    else              { indx = i; }
                    //================================================================================================
                    if(DATAS[i].eMACD_STATE == UP_IN)
                    {         int shift = DATAS_Candels[i].ValueLowestOld > DATAS_Candels[i].ValueLowestNew ? DATAS_Candels[i].shiftLowestNew : DATAS_Candels[i].shiftLowestOld;
                              shift = DATAS_Candels[i].shiftLowestOld;
                              //----------------------------------------------------------------------
                              {         DATAS[i].CalcMode = 1;
                                        DATAS[i].RangeSL = MathAbs(DATAS_Candels[i].Candel_Low - DATAS_Candels[i].ValueHighestNew);
                                        DATAS[i].Price2SL = DATAS_Candels[i].Candel_Low; //
                              }
                              double price_highest_I_OLDLowest = 0; //
                              if( DATAS_Candels[i].Candel_Low > DATAS_Candels[i].ValueLowestNew) //---//has sl touched tested
                              {         //shift = shiftLowestOldOld;
                                        DATAS[i].CalcMode = 2;
                                        DATAS[i].RangeSL = MathAbs(DATAS_Candels[i].Candel_Low - DATAS_Candels[DATAS_Candels[i].shiftLowestOldOld].Candel_Low); //
                                        DATAS[i].Price2SL = DATAS_Candels[i].Candel_Low - DATAS[i].RangeSL;//
                                        DATAS[i].RangeSL = MathAbs(DATAS[i].Price2SL - DATAS_Candels[i].Candel_Low);//
                              }
                              if( DATAS_Candels[i].Candel_Low > DATAS_Candels[i].ValueLowestOld)//has Old Lower Down
                              {         //shift = shiftLowestOldOld;
                                        DATAS[i].CalcMode = 3;
                                        int highlowRange = MathAbs(i - DATAS_Candels[i].shiftLowestOld);
                                        price_highest_I_OLDLowest = iHigh(Symbol(), f, iHighest(Symbol(), f, MODE_HIGH, highlowRange, i)); //
                                        DATAS[i].RangeSL = MathAbs(price_highest_I_OLDLowest - DATAS_Candels[DATAS_Candels[i].shiftLowestOld].Candel_Low); //
                                        DATAS[i].Price2SL = DATAS_Candels[DATAS_Candels[i].shiftLowestOld].Candel_Low - DATAS[i].RangeSL;//
                                        DATAS[i].RangeSL = MathAbs(DATAS[i].Price2SL - DATAS_Candels[DATAS_Candels[i].shiftLowestOld].Candel_Low);//
                              }
                              //if( DATAS_Candels[i].Candel_Low <= DATAS_Candels[i].ValueLowestNew && DATAS_Candels[i].Candel_Low <= DATAS_Candels[i].ValueLowestOld)// Its the pick Down
                              //{         //shift = shiftLowestOldOld;
                              //          DATAS[i].CalcMode = 4;
                              //          DATAS[i].RangeSL = MathAbs(DATAS_Candels[i].Candel_Low - DATAS[DATAS_Candels[i].shiftHighestOld].Candel_High); //
                              //          DATAS[i].Price2SL = DATAS_Candels[i].Candel_Low - DATAS[i].RangeSL;//
                              //          DATAS[i].RangeSL = MathAbs(DATAS[i].Price2SL - DATAS_Candels[i].Candel_Low);//
                              //}
                              if( false &&  DATAS_Candels[i].Candel_Low > DATAS_Candels[i].ValueLowestNew && DATAS_Candels[i].Candel_Low > DATAS_Candels[i].ValueLowestOld) //has sl touched tested ,old is Lower //\\
                              {         DATAS[i].CalcMode = 5;
                                        DATAS[i].RangeSL = MathAbs(DATAS_Candels[DATAS_Candels[i].shiftLowestOld].Candel_Low - DATAS_Candels[DATAS_Candels[i].shiftHighestNew].Candel_High); //
                                        DATAS[i].Price2SL = DATAS_Candels[i].Candel_Low - DATAS[i].RangeSL;//
                                        DATAS[i].RangeSL = MathAbs(DATAS[i].Price2SL - DATAS_Candels[i].Candel_Low);//
                              }
                              //---------------------------------------------------------------------------------------------
                              if(DATAS_Candels[i].Candel_Low <= DATAS_Candels[i].ValueLowestOld && DATAS_Candels[i].Candel_Low <= DATAS_Candels[i].ValueLowestNew) {}/*as pick down*/
                              //---------------------------------------------------------------------------------------------
                              //---------------------------------------------------------------------------------------------
                              if(DATAS[i].CalcMode == 1)
                              {         DATAS[i].RRR_0Price1 = DATAS_Candels[i].Candel_Low;             DATAS[i].RRR_0Price2     = DATAS[i].RRR_0Price1 - DATAS[i].RangeSL;
                                        DATAS[i].RRR_0Time1  = DATAS_Candels[i].Candel_Time;            DATAS[i].RRR_0Time2      = DATAS[i].RRR_0Time1 + PeriodSeconds() * PeriodSecondsCount;
                                        //
                                        DATAS[i].RRR_1Price1 = DATAS_Candels[i].Candel_Low;             DATAS[i].RRR_1Price2     = DATAS[i].RRR_1Price1 + DATAS[i].RangeSL;
                                        DATAS[i].RRR_1Time1  = DATAS_Candels[i].Candel_Time;            DATAS[i].RRR_1Time2      = DATAS[i].RRR_1Time1 + PeriodSeconds() * PeriodSecondsCount;
                                        //
                                        DATAS[i].RRR_2Price1 = DATAS[i].RRR_1Price2 + 25 * Point();     DATAS[i].RRR_2Price2     = DATAS[i].RRR_2Price1 + DATAS[i].RangeSL;
                                        DATAS[i].RRR_2Time1  = DATAS_Candels[i].Candel_Time;            DATAS[i].RRR_2Time2      = DATAS[i].RRR_2Time1 + PeriodSeconds() * PeriodSecondsCount;;
                                        //
                                        DATAS[i].RRR_3Price1 = DATAS[i].RRR_2Price2 + 25 * Point();     DATAS[i].RRR_3Price2     = DATAS[i].RRR_3Price1 + DATAS[i].RangeSL;
                                        DATAS[i].RRR_3Time1  = DATAS_Candels[i].Candel_Time;            DATAS[i].RRR_3Time2      = DATAS[i].RRR_3Time1 + PeriodSeconds() * PeriodSecondsCount;; //
                              }
                              if(DATAS[i].CalcMode == 3)
                              {         DATAS[i].RRR_0Price1 = DATAS_Candels[DATAS_Candels[i].shiftLowestOld].Candel_Low;       DATAS[i].RRR_0Price2     = DATAS[i].RRR_0Price1 - DATAS[i].RangeSL;
                                        DATAS[i].RRR_0Time1  = DATAS_Candels[DATAS_Candels[i].shiftLowestOld].Candel_Time;      DATAS[i].RRR_0Time2      = DATAS[i].RRR_0Time1 + PeriodSeconds() * PeriodSecondsCount;
                                        //
                                        DATAS[i].RRR_1Price1 = DATAS_Candels[DATAS_Candels[i].shiftLowestOld].Candel_Low;       DATAS[i].RRR_1Price2     = price_highest_I_OLDLowest;
                                        DATAS[i].RRR_1Time1  = DATAS_Candels[DATAS_Candels[i].shiftLowestOld].Candel_Time;      DATAS[i].RRR_1Time2      = DATAS[i].RRR_1Time1 + PeriodSeconds() * PeriodSecondsCount;
                                        //
                                        DATAS[i].RRR_2Price1 = DATAS[i].RRR_1Price2 + 25 * Point();                             DATAS[i].RRR_2Price2     = DATAS[i].RRR_2Price1 + DATAS[i].RangeSL;
                                        DATAS[i].RRR_2Time1  = DATAS_Candels[DATAS_Candels[i].shiftLowestOld].Candel_Time;      DATAS[i].RRR_2Time2      = DATAS[i].RRR_2Time1 + PeriodSeconds() * PeriodSecondsCount;;
                                        //
                                        DATAS[i].RRR_3Price1 = DATAS[i].RRR_2Price2 + 25 * Point();                             DATAS[i].RRR_3Price2     = DATAS[i].RRR_3Price1 + DATAS[i].RangeSL;
                                        DATAS[i].RRR_3Time1  = DATAS_Candels[DATAS_Candels[i].shiftLowestOld].Candel_Time;      DATAS[i].RRR_3Time2      = DATAS[i].RRR_3Time1 + PeriodSeconds() * PeriodSecondsCount;; //
                              }
                              //--------------------------------------------------------------------------------------------------------
                              DATAS[i].TargetSL                                   = DATAS[i].Price2SL;
                              DATAS[i].TargetTP1                                  = DATAS_Candels[DATAS_Candels[i].shiftLowestOld].Candel_Low + DATAS[i].RangeSL;
                              DATAS[i].TargetTP2                                  = DATAS_Candels[DATAS_Candels[i].shiftLowestOld].Candel_Low + DATAS[i].RangeSL * 2;
                              DATAS[i].TargetTP3                                  = DATAS_Candels[DATAS_Candels[i].shiftLowestOld].Candel_Low + DATAS[i].RangeSL * 3;
                              //
                              DATAS[i].AmountSL                                   = MathAbs(DATAS[i].RangeSL);
                              DATAS[i].AmountTP1                                  = MathAbs(DATAS_Candels[DATAS_Candels[i].shiftLowestOld].Candel_Low + DATAS[i].RangeSL);;
                              DATAS[i].AmountTP2                                  = MathAbs(DATAS_Candels[DATAS_Candels[i].shiftLowestOld].Candel_Low + DATAS[i].RangeSL * 2);;
                              DATAS[i].AmountTP3                                  = MathAbs(DATAS_Candels[DATAS_Candels[i].shiftLowestOld].Candel_Low + DATAS[i].RangeSL * 3);;//
                              //---------------------------------------------------------------------------------------------Sparx screwy achivment
                              int shiftNewAchivment = iHighest(Symbol(), f, MODE_HIGH, indx, 0);
                              double HighestNewAchivment = iHigh(Symbol(), f, shiftNewAchivment);
                              DATAS[i].IsTargetSL1Achived =  iLow(Symbol(), f, iLowest(Symbol(), f, MODE_LOW, indx, 0)) < DATAS[i].Price2SL ? +1 : -1;
                              DATAS[i].IsTargetTp1Achived =  HighestNewAchivment > DATAS[i].TargetTP1 ? +1 : -1;
                              DATAS[i].IsTargetTp2Achived =  HighestNewAchivment > DATAS[i].TargetTP2 ? +1 : -1;
                              DATAS[i].IsTargetTp3Achived =  HighestNewAchivment > DATAS[i].TargetTP3 ? +1 : -1;
                              if(HighestNewAchivment > DATAS[i].TargetTP1) {DATAS[i].eAchivmentTargets = E_TP1;}
                              if(HighestNewAchivment > DATAS[i].TargetTP2) {DATAS[i].eAchivmentTargets = E_TP2;}
                              if(HighestNewAchivment > DATAS[i].TargetTP3) {DATAS[i].eAchivmentTargets = E_TP3;}
                              //---------------------------------------------------------------------------------------------
                              DATAS[i].IsVerifiedSignalBySlRange = DATAS[i].RangeSL > SLRangePips * Point(); //
                              //---------------------------------------------------------------------------------------------
                              if(DATAS_Candels[i].Candel_Low <= DATAS_Candels[i].ValueLowestOld && DATAS_Candels[i].Candel_Low <= DATAS_Candels[i].ValueLowestNew) {}/*as pick down*/
                              //---------------------------------------------------------------------------------------------
                    }
                    if(DATAS[i].eMACD_STATE == DOWN_IN)
                    {         int shift = DATAS_Candels[i].ValueHighestOld > DATAS_Candels[i].ValueHighestNew ? DATAS_Candels[i].shiftHighestOld : DATAS_Candels[i].shiftHighestNew;
                              shift = DATAS_Candels[i].shiftHighestOld; //if(DATAS[shift].Candel_High == 0) {      Print(f, "  ", DATAS[shift].Candel_High, "  ", i, "  ", shift, "  ", Size_); DATAS[shift].Candel_High = iHigh(Symbol(), f, shift); }
                              //----------------------------------------------------------------------
                              {         DATAS[i].CalcMode = 1;
                                        DATAS[i].RangeSL = MathAbs(DATAS_Candels[i].Candel_High - DATAS_Candels[i].ValueLowestNew);
                                        DATAS[i].Price2SL = DATAS_Candels[i].Candel_High;//
                              }
                              double price_Lowest_I_OLDHighest = 0; //
                              if( DATAS_Candels[i].Candel_High < DATAS_Candels[i].ValueHighestNew)//has sl touched tested
                              {         //shift = shiftLowestOldOld;
                                        DATAS[i].CalcMode = 2;
                                        DATAS[i].RangeSL = MathAbs(DATAS_Candels[i].Candel_High - DATAS_Candels[DATAS_Candels[i].shiftHighestOldOld].Candel_High); //
                                        DATAS[i].Price2SL = DATAS_Candels[i].Candel_High + DATAS[i].RangeSL;//
                                        DATAS[i].RangeSL = MathAbs(DATAS[i].Price2SL - DATAS_Candels[i].Candel_High);//
                              }
                              if( DATAS_Candels[i].Candel_High < DATAS_Candels[i].ValueHighestOld)//has Old Lower Down
                              {         //shift = shiftHighestOl;
                                        DATAS[i].CalcMode = 3;
                                        int highlowRange = MathAbs(i - DATAS_Candels[i].shiftHighestOld);
                                        price_Lowest_I_OLDHighest = iLow(Symbol(), f, iLowest(Symbol(), f, MODE_LOW, highlowRange, i)); //
                                        DATAS[i].RangeSL = MathAbs(price_Lowest_I_OLDHighest - DATAS_Candels[DATAS_Candels[i].shiftHighestOld].Candel_High); //
                                        DATAS[i].Price2SL = DATAS_Candels[DATAS_Candels[i].shiftHighestOld].Candel_High + DATAS[i].RangeSL;//
                                        DATAS[i].RangeSL = MathAbs(DATAS[i].Price2SL - DATAS_Candels[DATAS_Candels[i].shiftHighestOld].Candel_High);//
                              }
                              //if( DATAS_Candels[i].Candel_High >= DATAS[i].ValuetHighestNew && DATAS_Candels[i].Candel_High >= DATAS_Candels[i].ValueHighestOld)// Its the pick top
                              //{         //shift = shiftLowestOldOld;
                              //          DATAS[i].CalcMode = 4;
                              //          DATAS[i].RangeSL = MathAbs(DATAS_Candels[i].Candel_High - DATAS[DATAS_Candels[i].shiftLowestOld].Candel_Low); //
                              //          DATAS[i].Price2SL = DATAS_Candels[i].Candel_High + DATAS[i].RangeSL;//
                              //          DATAS[i].RangeSL = MathAbs(DATAS[i].Price2SL - DATAS_Candels[i].Candel_High);//
                              //}
                              if( false &&  DATAS_Candels[i].Candel_High < DATAS_Candels[i].ValueHighestNew && DATAS_Candels[i].Candel_High < DATAS_Candels[i].ValueHighestOld) //has sl touched tested ,old is higher //\\
                              {         DATAS[i].CalcMode = 5;
                                        DATAS[i].RangeSL = MathAbs(DATAS_Candels[DATAS_Candels[i].shiftHighestOld].Candel_High - DATAS_Candels[DATAS_Candels[i].shiftLowestNew].Candel_Low); //
                                        DATAS[i].Price2SL = DATAS_Candels[i].Candel_High + DATAS[i].RangeSL;//
                                        DATAS[i].RangeSL = MathAbs(DATAS[i].Price2SL - DATAS_Candels[i].Candel_High);//
                              }
                              //---------------------------------------------------------------------------------------------
                              if(DATAS[i].CalcMode == 1)
                              {         DATAS[i].RRR_0Price1 = DATAS_Candels[i].Candel_High;                    DATAS[i].RRR_0Price2     = DATAS[i].RRR_0Price1 + DATAS[i].RangeSL;
                                        DATAS[i].RRR_0Time1  = DATAS_Candels[i].Candel_Time;                    DATAS[i].RRR_0Time2      = DATAS[i].RRR_0Time1 + PeriodSeconds() * PeriodSecondsCount;
                                        //
                                        DATAS[i].RRR_1Price1 = DATAS_Candels[i].Candel_High;                    DATAS[i].RRR_1Price2     = DATAS[i].RRR_1Price1 - DATAS[i].RangeSL;
                                        DATAS[i].RRR_1Time1  = DATAS_Candels[i].Candel_Time;                    DATAS[i].RRR_1Time2      = DATAS[i].RRR_1Time1 + PeriodSeconds() * PeriodSecondsCount;
                                        DATAS[i].RRR_2Price1 = DATAS[i].RRR_1Price2 - 25 * Point();             DATAS[i].RRR_2Price2     = DATAS[i].RRR_2Price1 - DATAS[i].RangeSL;
                                        DATAS[i].RRR_2Time1  = DATAS_Candels[i].Candel_Time;                    DATAS[i].RRR_2Time2      = DATAS[i].RRR_2Time1 + PeriodSeconds() * PeriodSecondsCount;;
                                        DATAS[i].RRR_3Price1 = DATAS[i].RRR_2Price2 - 25 * Point();             DATAS[i].RRR_3Price2     = DATAS[i].RRR_3Price1 - DATAS[i].RangeSL;
                                        DATAS[i].RRR_3Time1  = DATAS_Candels[i].Candel_Time;                    DATAS[i].RRR_3Time2      = DATAS[i].RRR_3Time1 + PeriodSeconds() * PeriodSecondsCount;;//
                              }
                              if(DATAS[i].CalcMode == 3)
                              {         DATAS[i].RRR_0Price1 = DATAS_Candels[DATAS_Candels[i].shiftHighestOld].Candel_High;             DATAS[i].RRR_0Price2     = DATAS[i].RRR_0Price1 + DATAS[i].RangeSL;
                                        DATAS[i].RRR_0Time1  = DATAS_Candels[DATAS_Candels[i].shiftHighestOld].Candel_Time;             DATAS[i].RRR_0Time2      = DATAS[i].RRR_0Time1 + PeriodSeconds() * PeriodSecondsCount;
                                        //
                                        DATAS[i].RRR_1Price1 = DATAS_Candels[DATAS_Candels[i].shiftHighestOld].Candel_High;             DATAS[i].RRR_1Price2     = price_Lowest_I_OLDHighest;
                                        DATAS[i].RRR_1Time1  = DATAS_Candels[DATAS_Candels[i].shiftHighestOld].Candel_Time;             DATAS[i].RRR_1Time2      = DATAS[i].RRR_1Time1 + PeriodSeconds() * PeriodSecondsCount;
                                        DATAS[i].RRR_2Price1 = DATAS[i].RRR_1Price2 - 25 * Point();                          DATAS[i].RRR_2Price2     = DATAS[i].RRR_2Price1 - DATAS[i].RangeSL;
                                        DATAS[i].RRR_2Time1  = DATAS_Candels[DATAS_Candels[i].shiftHighestOld].Candel_Time;                 DATAS[i].RRR_2Time2      = DATAS[i].RRR_2Time1 + PeriodSeconds() * PeriodSecondsCount;;
                                        DATAS[i].RRR_3Price1 = DATAS[i].RRR_2Price2 - 25 * Point();                          DATAS[i].RRR_3Price2     = DATAS[i].RRR_3Price1 - DATAS[i].RangeSL;
                                        DATAS[i].RRR_3Time1  = DATAS_Candels[DATAS_Candels[i].shiftHighestOld].Candel_Time;                 DATAS[i].RRR_3Time2      = DATAS[i].RRR_3Time1 + PeriodSeconds() * PeriodSecondsCount;;//
                              }
                              //---------------------------------------------------------------------------------------------
                              DATAS[i].TargetSL                                   = DATAS[i].Price2SL;
                              DATAS[i].TargetTP1                                  = DATAS_Candels[DATAS_Candels[i].shiftHighestOld].Candel_High - DATAS[i].RangeSL;
                              DATAS[i].TargetTP2                                  = DATAS_Candels[DATAS_Candels[i].shiftHighestOld].Candel_High - DATAS[i].RangeSL * 2;
                              DATAS[i].TargetTP3                                  = DATAS_Candels[DATAS_Candels[i].shiftHighestOld].Candel_High - DATAS[i].RangeSL * 3;
                              //
                              DATAS[i].AmountSL                                   = MathAbs(DATAS[i].RangeSL);
                              DATAS[i].AmountTP1                                  = MathAbs(DATAS_Candels[DATAS_Candels[i].shiftHighestOld].Candel_High - DATAS[i].RangeSL);;
                              DATAS[i].AmountTP2                                  = MathAbs(DATAS_Candels[DATAS_Candels[i].shiftHighestOld].Candel_High - DATAS[i].RangeSL * 2);;
                              DATAS[i].AmountTP3                                  = MathAbs(DATAS_Candels[DATAS_Candels[i].shiftHighestOld].Candel_High - DATAS[i].RangeSL * 3);;//
                              //---------------------------------------------------------------------------------------------
                              int shiftNewAchivment = iLowest(Symbol(), f, MODE_LOW, indx, 0);
                              double LowestNewAchivment = iLow(Symbol(), f, shiftNewAchivment);
                              DATAS[i].IsTargetSL1Achived =  iHigh(Symbol(), f, iHighest(Symbol(), f, MODE_HIGH, indx, 0)) > DATAS[i].Price2SL ? +1 : -1;
                              DATAS[i].IsTargetTp1Achived =  LowestNewAchivment < DATAS[i].TargetTP1 ? +1 : -1;
                              DATAS[i].IsTargetTp2Achived =  LowestNewAchivment < DATAS[i].TargetTP2 ? +1 : -1;
                              DATAS[i].IsTargetTp3Achived =  LowestNewAchivment < DATAS[i].TargetTP3 ? +1 : -1;
                              if(LowestNewAchivment < DATAS[i].TargetTP1) {DATAS[i].eAchivmentTargets = E_TP1;}
                              if(LowestNewAchivment < DATAS[i].TargetTP2) {DATAS[i].eAchivmentTargets = E_TP2;}
                              if(LowestNewAchivment < DATAS[i].TargetTP3) {DATAS[i].eAchivmentTargets = E_TP3;}
                              //---------------------------------------------------------------------------------------------
                              DATAS[i].IsVerifiedSignalBySlRange = DATAS[i].RangeSL > SLRangePips * Point(); //
                              //---------------------------------------------------------------------------------------------
                    }
                    if(DATAS[i].eMACD_STATE == UP_OUT )
                    {         int shift = DATAS_Candels[i].ValueHighestOld > DATAS_Candels[i].ValueHighestNew ? DATAS_Candels[i].shiftHighestOld : DATAS_Candels[i].shiftHighestNew;
                              shift = DATAS_Candels[i].shiftHighestOld;
                              //----------------------------------------------------------------------
                              {         DATAS[i].CalcMode = 1;
                                        DATAS[i].RangeSL = MathAbs(DATAS_Candels[i].Candel_High -  DATAS_Candels[i].ValueLowestNew);
                                        DATAS[i].Price2SL = DATAS_Candels[i].Candel_High;//
                              }
                              double price_Lowest_I_OLDHighest = 0; //
                              if( DATAS_Candels[i].Candel_High < DATAS_Candels[i].ValueHighestNew)//has sl touched tested
                              {         //shift = shiftLowestOldOld;
                                        DATAS[i].CalcMode = 2;
                                        DATAS[i].RangeSL = MathAbs(DATAS_Candels[i].Candel_High - DATAS_Candels[DATAS_Candels[i].shiftHighestOldOld].Candel_High); //
                                        DATAS[i].Price2SL = DATAS_Candels[i].Candel_High + DATAS[i].RangeSL;//
                                        DATAS[i].RangeSL = MathAbs(DATAS[i].Price2SL - DATAS_Candels[i].Candel_High);//
                              }
                              if( DATAS_Candels[i].Candel_High < DATAS_Candels[i].ValueHighestOld)//has Old Lower Down
                              {         //shift = shiftHighestOl;
                                        DATAS[i].CalcMode = 3;
                                        int highlowRange = MathAbs(i - DATAS_Candels[i].shiftHighestOld);
                                        price_Lowest_I_OLDHighest = iLow(Symbol(), f, iLowest(Symbol(), f, MODE_LOW, highlowRange, i)); //
                                        DATAS[i].RangeSL = MathAbs(price_Lowest_I_OLDHighest - DATAS_Candels[DATAS_Candels[i].shiftHighestOld].Candel_High); //
                                        DATAS[i].Price2SL = DATAS_Candels[DATAS_Candels[i].shiftHighestOld].Candel_High + DATAS[i].RangeSL;//
                                        DATAS[i].RangeSL = MathAbs(DATAS[i].Price2SL - DATAS_Candels[DATAS_Candels[i].shiftHighestOld].Candel_High);//
                              }
                              //if( DATAS_Candels[i].Candel_High >= DATAS[i].ValuetHighestNew && DATAS_Candels[i].Candel_High >= DATAS_Candels[i].ValueHighestOld)// Its the pick top
                              //{         //shift = shiftLowestOldOld;
                              //          DATAS[i].CalcMode = 4;
                              //          DATAS[i].RangeSL = MathAbs(DATAS_Candels[i].Candel_High - DATAS[DATAS_Candels[i].shiftLowestOld].Candel_Low); //
                              //          DATAS[i].Price2SL = DATAS_Candels[i].Candel_High + DATAS[i].RangeSL;//
                              //          DATAS[i].RangeSL = MathAbs(DATAS[i].Price2SL - DATAS_Candels[i].Candel_High);//
                              //}
                              if( false &&  DATAS_Candels[i].Candel_High < DATAS_Candels[i].ValueHighestNew && DATAS_Candels[i].Candel_High < DATAS_Candels[i].ValueHighestOld) //has sl touched tested ,old is higher //\\
                              {         DATAS[i].CalcMode = 5;
                                        DATAS[i].RangeSL = MathAbs(DATAS_Candels[DATAS_Candels[i].shiftHighestOld].Candel_High - DATAS_Candels[DATAS_Candels[i].shiftLowestNew].Candel_Low); //
                                        DATAS[i].Price2SL = DATAS_Candels[i].Candel_High + DATAS[i].RangeSL;//
                                        DATAS[i].RangeSL = MathAbs(DATAS[i].Price2SL - DATAS_Candels[i].Candel_High);//
                              }
                              //---------------------------------------------------------------------------------------------
                              if(DATAS[i].CalcMode == 1)
                              {         DATAS[i].RRR_0Price1 = DATAS_Candels[i].Candel_High;                                        DATAS[i].RRR_0Price2     = DATAS[i].RRR_0Price1 + DATAS[i].RangeSL;
                                        DATAS[i].RRR_0Time1  = DATAS_Candels[i].Candel_Time;                                        DATAS[i].RRR_0Time2      = DATAS[i].RRR_0Time1 + PeriodSeconds() * PeriodSecondsCount;
                                        //
                                        DATAS[i].RRR_1Price1 = DATAS_Candels[i].Candel_High;                                        DATAS[i].RRR_1Price2     = DATAS[i].RRR_1Price1 - DATAS[i].RangeSL;
                                        DATAS[i].RRR_1Time1  = DATAS_Candels[i].Candel_Time;                                        DATAS[i].RRR_1Time2      = DATAS[i].RRR_1Time1 + PeriodSeconds() * PeriodSecondsCount;
                                        DATAS[i].RRR_2Price1 = DATAS[i].RRR_1Price2 - 25 * Point();                          DATAS[i].RRR_2Price2     = DATAS[i].RRR_2Price1 - DATAS[i].RangeSL;
                                        DATAS[i].RRR_2Time1  = DATAS_Candels[i].Candel_Time;                                        DATAS[i].RRR_2Time2      = DATAS[i].RRR_2Time1 + PeriodSeconds() * PeriodSecondsCount;;
                                        DATAS[i].RRR_3Price1 = DATAS[i].RRR_2Price2 - 25 * Point();                          DATAS[i].RRR_3Price2     = DATAS[i].RRR_3Price1 - DATAS[i].RangeSL;
                                        DATAS[i].RRR_3Time1  = DATAS_Candels[i].Candel_Time;                                        DATAS[i].RRR_3Time2      = DATAS[i].RRR_3Time1 + PeriodSeconds() * PeriodSecondsCount;;//
                              }
                              if(DATAS[i].CalcMode == 3)
                              {         DATAS[i].RRR_0Price1 = DATAS_Candels[DATAS_Candels[i].shiftHighestOld].Candel_High;                 DATAS[i].RRR_0Price2     = DATAS[i].RRR_0Price1 + DATAS[i].RangeSL;
                                        DATAS[i].RRR_0Time1  = DATAS_Candels[DATAS_Candels[i].shiftHighestOld].Candel_Time;                 DATAS[i].RRR_0Time2      = DATAS[i].RRR_0Time1 + PeriodSeconds() * PeriodSecondsCount;
                                        //
                                        DATAS[i].RRR_1Price1 = DATAS_Candels[DATAS_Candels[i].shiftHighestOld].Candel_High;                 DATAS[i].RRR_1Price2     = price_Lowest_I_OLDHighest;
                                        DATAS[i].RRR_1Time1  = DATAS_Candels[DATAS_Candels[i].shiftHighestOld].Candel_Time;                 DATAS[i].RRR_1Time2      = DATAS[i].RRR_1Time1 + PeriodSeconds() * PeriodSecondsCount;
                                        DATAS[i].RRR_2Price1 = DATAS[i].RRR_1Price2 - 25 * Point();                          DATAS[i].RRR_2Price2     = DATAS[i].RRR_2Price1 - DATAS[i].RangeSL;
                                        DATAS[i].RRR_2Time1  = DATAS_Candels[DATAS_Candels[i].shiftHighestOld].Candel_Time;                 DATAS[i].RRR_2Time2      = DATAS[i].RRR_2Time1 + PeriodSeconds() * PeriodSecondsCount;;
                                        DATAS[i].RRR_3Price1 = DATAS[i].RRR_2Price2 - 25 * Point();                          DATAS[i].RRR_3Price2     = DATAS[i].RRR_3Price1 - DATAS[i].RangeSL;
                                        DATAS[i].RRR_3Time1  = DATAS_Candels[DATAS_Candels[i].shiftHighestOld].Candel_Time;                 DATAS[i].RRR_3Time2      = DATAS[i].RRR_3Time1 + PeriodSeconds() * PeriodSecondsCount;;//
                              }
                              //---------------------------------------------------------------------------------------------
                              DATAS[i].TargetSL                                   = DATAS[i].Price2SL;
                              DATAS[i].TargetTP1                                  = DATAS_Candels[DATAS_Candels[i].shiftHighestOld].Candel_High - DATAS[i].RangeSL;
                              DATAS[i].TargetTP2                                  = DATAS_Candels[DATAS_Candels[i].shiftHighestOld].Candel_High - DATAS[i].RangeSL * 2;
                              DATAS[i].TargetTP3                                  = DATAS_Candels[DATAS_Candels[i].shiftHighestOld].Candel_High - DATAS[i].RangeSL * 3;
                              //
                              DATAS[i].AmountSL                                   = MathAbs(DATAS[i].RangeSL);
                              DATAS[i].AmountTP1                                  = MathAbs(DATAS_Candels[DATAS_Candels[i].shiftHighestOld].Candel_High - DATAS[i].RangeSL);;
                              DATAS[i].AmountTP2                                  = MathAbs(DATAS_Candels[DATAS_Candels[i].shiftHighestOld].Candel_High - DATAS[i].RangeSL * 2);;
                              DATAS[i].AmountTP3                                  = MathAbs(DATAS_Candels[DATAS_Candels[i].shiftHighestOld].Candel_High - DATAS[i].RangeSL * 3);;
                              //---------------------------------------------------------------------------------------------
                              int shiftNewAchivment = iLowest(Symbol(), f, MODE_LOW, indx, 0);
                              double LowestNewAchivment = iLow(Symbol(), f, shiftNewAchivment); //if(i < 5)Print("  i: ", i, "   ", EnumToString(f), "  LowestNewAchivment: ", LowestNewAchivment, "  shiftNewAchivment: ", shiftNewAchivment, "  DATAS[i].TargetTP1:", DATAS[i].TargetTP1); //
                              DATAS[i].IsTargetSL1Achived =  iHigh(Symbol(), f, iHighest(Symbol(), f, MODE_HIGH, indx, 0)) > DATAS[i].Price2SL ? +1 : -1;
                              DATAS[i].IsTargetTp1Achived =  LowestNewAchivment < DATAS[i].TargetTP1 ? +1 : -1;
                              DATAS[i].IsTargetTp2Achived =  LowestNewAchivment < DATAS[i].TargetTP2 ? +1 : -1;
                              DATAS[i].IsTargetTp3Achived =  LowestNewAchivment < DATAS[i].TargetTP3 ? +1 : -1;
                              if(LowestNewAchivment < DATAS[i].TargetTP1) {DATAS[i].eAchivmentTargets = E_TP1;}
                              if(LowestNewAchivment < DATAS[i].TargetTP2) {DATAS[i].eAchivmentTargets = E_TP2;}
                              if(LowestNewAchivment < DATAS[i].TargetTP3) {DATAS[i].eAchivmentTargets = E_TP3;}
                              //---------------------------------------------------------------------------------------------
                              DATAS[i].IsVerifiedSignalBySlRange = DATAS[i].RangeSL > SLRangePips * Point(); //
                              //---------------------------------------------------------------------------------------------
                    }
                    if(DATAS[i].eMACD_STATE == DOWN_OUT)
                    {         int shift = DATAS_Candels[i].ValueLowestOld > DATAS_Candels[i].ValueLowestNew ? DATAS_Candels[i].shiftLowestNew : DATAS_Candels[i].shiftLowestOld;
                              shift = DATAS_Candels[i].shiftLowestOld;
                              //---------------------------------------------------------------------------------------------
                              /////=====ValueLowestOld <= ValueLowestOldOld &&
                              {         DATAS[i].CalcMode = 1;
                                        DATAS[i].RangeSL = MathAbs(DATAS_Candels[i].Candel_Low - DATAS_Candels[i].ValueHighestNew);
                                        DATAS[i].Price2SL = DATAS_Candels[i].Candel_Low;//
                              }
                              double price_highest_I_OLDLowest = 0;
                              if( DATAS_Candels[i].Candel_Low > DATAS_Candels[i].ValueLowestNew)//has sl touched tested
                              {         //shift = shiftLowestOldOld;
                                        DATAS[i].CalcMode = 2;
                                        DATAS[i].RangeSL = MathAbs(DATAS_Candels[i].Candel_Low - DATAS_Candels[DATAS_Candels[i].shiftLowestOldOld].Candel_Low); //
                                        DATAS[i].Price2SL = DATAS_Candels[i].Candel_Low - DATAS[i].RangeSL;//
                                        DATAS[i].RangeSL = MathAbs(DATAS[i].Price2SL - DATAS_Candels[i].Candel_Low);//
                              }
                              if( DATAS_Candels[i].Candel_Low > DATAS_Candels[i].ValueLowestOld)//has Old Lower Down///before is pick
                              {         //shift = shiftLowestOldOld;
                                        DATAS[i].CalcMode = 3;
                                        int highlowRange = MathAbs(i - DATAS_Candels[i].shiftLowestOld);
                                        price_highest_I_OLDLowest = iHigh(Symbol(), f, iHighest(Symbol(), f, MODE_HIGH, highlowRange, i)); //
                                        DATAS[i].RangeSL = MathAbs(price_highest_I_OLDLowest - DATAS_Candels[DATAS_Candels[i].shiftLowestOld].Candel_Low); //
                                        DATAS[i].Price2SL = DATAS_Candels[DATAS_Candels[i].shiftLowestOld].Candel_Low - DATAS[i].RangeSL;//
                                        DATAS[i].RangeSL = MathAbs(DATAS[i].Price2SL - DATAS_Candels[DATAS_Candels[i].shiftLowestOld].Candel_Low);//
                              }
                              //if( DATAS_Candels[i].Candel_Low <= DATAS_Candels[i].ValueLowestNew && DATAS_Candels[i].Candel_Low <= DATAS_Candels[i].ValueLowestOld)// Its the pick Down
                              //{         //shift = shiftLowestOldOld;
                              //          DATAS[i].CalcMode = 4;
                              //          DATAS[i].RangeSL = MathAbs(DATAS_Candels[i].Candel_Low - DATAS[DATAS_Candels[i].shiftHighestOld].Candel_High); //
                              //          DATAS[i].Price2SL = DATAS_Candels[i].Candel_Low - DATAS[i].RangeSL;//
                              //          DATAS[i].RangeSL = MathAbs(DATAS[i].Price2SL - DATAS_Candels[i].Candel_Low);//
                              //}
                              if( false && DATAS_Candels[i].Candel_Low > DATAS_Candels[i].ValueLowestNew && DATAS_Candels[i].Candel_Low > DATAS_Candels[i].ValueLowestOld) //has sl touched tested ,old is Lower //\\
                              {         DATAS[i].CalcMode = 5;
                                        DATAS[i].RangeSL = MathAbs(DATAS_Candels[DATAS_Candels[i].shiftLowestOld].Candel_Low - DATAS_Candels[DATAS_Candels[i].shiftHighestNew].Candel_High); //
                                        DATAS[i].Price2SL = DATAS_Candels[i].Candel_Low - DATAS[i].RangeSL;//
                                        DATAS[i].RangeSL = MathAbs(DATAS[i].Price2SL - DATAS_Candels[i].Candel_Low);//
                              }
                              //---------------------------------------------------------------------------------------------
                              if(DATAS[i].CalcMode == 1)
                              {         DATAS[i].RRR_0Price1 = DATAS_Candels[i].Candel_Low;                                     DATAS[i].RRR_0Price2     = DATAS[i].RRR_0Price1 - DATAS[i].RangeSL;
                                        DATAS[i].RRR_0Time1  = DATAS_Candels[i].Candel_Time;                                    DATAS[i].RRR_0Time2      = DATAS[i].RRR_0Time1 + PeriodSeconds() * PeriodSecondsCount;
                                        //
                                        DATAS[i].RRR_1Price1 = DATAS_Candels[i].Candel_Low;                                     DATAS[i].RRR_1Price2     = DATAS[i].RRR_1Price1 + DATAS[i].RangeSL;
                                        DATAS[i].RRR_1Time1  = DATAS_Candels[i].Candel_Time;                                    DATAS[i].RRR_1Time2      = DATAS[i].RRR_1Time1 + PeriodSeconds() * PeriodSecondsCount;
                                        DATAS[i].RRR_2Price1 = DATAS[i].RRR_1Price2 + 25 * Point();                             DATAS[i].RRR_2Price2     = DATAS[i].RRR_2Price1 + DATAS[i].RangeSL;
                                        DATAS[i].RRR_2Time1  = DATAS_Candels[i].Candel_Time;                                    DATAS[i].RRR_2Time2      = DATAS[i].RRR_0Time1 + PeriodSeconds() * PeriodSecondsCount;;
                                        DATAS[i].RRR_3Price1 = DATAS[i].RRR_2Price2 + 25 * Point();                             DATAS[i].RRR_3Price2     = DATAS[i].RRR_3Price1 + DATAS[i].RangeSL;
                                        DATAS[i].RRR_3Time1  = DATAS_Candels[i].Candel_Time;                                    DATAS[i].RRR_3Time2      = DATAS[i].RRR_3Time1 + PeriodSeconds() * PeriodSecondsCount;;//
                              }
                              if(DATAS[i].CalcMode == 3)
                              {         //Print("DATAS_Candels[i].shiftLowestOld: ", DATAS_Candels[i].shiftLowestOld);
                                        //Print("DATAS_Candels[DATAS_Candels[i].shiftLowestOld].Candel_Low: ", DATAS_Candels[DATAS_Candels[i].shiftLowestOld].Candel_Low);
                                        DATAS[i].RRR_0Price1 = DATAS_Candels[DATAS_Candels[i].shiftLowestOld].Candel_Low;       DATAS[i].RRR_0Price2     = DATAS[i].RRR_0Price1 - DATAS[i].RangeSL;
                                        DATAS[i].RRR_0Time1  = DATAS_Candels[DATAS_Candels[i].shiftLowestOld].Candel_Time;      DATAS[i].RRR_0Time2      = DATAS[i].RRR_0Time1 + PeriodSeconds() * PeriodSecondsCount;
                                        //
                                        DATAS[i].RRR_1Price1 = DATAS_Candels[DATAS_Candels[i].shiftLowestOld].Candel_Low;       DATAS[i].RRR_1Price2     = price_highest_I_OLDLowest;
                                        DATAS[i].RRR_1Time1  = DATAS_Candels[DATAS_Candels[i].shiftLowestOld].Candel_Time;      DATAS[i].RRR_1Time2      = DATAS[i].RRR_1Time1 + PeriodSeconds() * PeriodSecondsCount;
                                        //
                                        DATAS[i].RRR_2Price1 = DATAS[i].RRR_1Price2 + 25 * Point();                             DATAS[i].RRR_2Price2     = DATAS[i].RRR_2Price1 + DATAS[i].RangeSL;
                                        DATAS[i].RRR_2Time1  = DATAS_Candels[DATAS_Candels[i].shiftLowestOld].Candel_Time;      DATAS[i].RRR_2Time2      = DATAS[i].RRR_2Time1 + PeriodSeconds() * PeriodSecondsCount;;
                                        //
                                        DATAS[i].RRR_3Price1 = DATAS[i].RRR_2Price2 + 25 * Point();                             DATAS[i].RRR_3Price2     = DATAS[i].RRR_3Price1 + DATAS[i].RangeSL;
                                        DATAS[i].RRR_3Time1  = DATAS_Candels[DATAS_Candels[i].shiftLowestOld].Candel_Time;      DATAS[i].RRR_3Time2      = DATAS[i].RRR_3Time1 + PeriodSeconds() * PeriodSecondsCount;;//
                              }
                              //---------------------------------------------------------------------------------------------
                              DATAS[i].TargetSL                                   = DATAS[i].Price2SL;
                              DATAS[i].TargetTP1                                  = DATAS_Candels[DATAS_Candels[i].shiftLowestOld].Candel_Low + DATAS[i].RangeSL;
                              DATAS[i].TargetTP2                                  = DATAS_Candels[DATAS_Candels[i].shiftLowestOld].Candel_Low + DATAS[i].RangeSL * 2;
                              DATAS[i].TargetTP3                                  = DATAS_Candels[DATAS_Candels[i].shiftLowestOld].Candel_Low + DATAS[i].RangeSL * 3;
                              //
                              DATAS[i].AmountSL                                   = MathAbs(DATAS[i].RangeSL);
                              DATAS[i].AmountTP1                                  = MathAbs(DATAS_Candels[DATAS_Candels[i].shiftLowestOld].Candel_Low + DATAS[i].RangeSL);;
                              DATAS[i].AmountTP2                                  = MathAbs(DATAS_Candels[DATAS_Candels[i].shiftLowestOld].Candel_Low + DATAS[i].RangeSL * 2);;
                              DATAS[i].AmountTP3                                  = MathAbs(DATAS_Candels[DATAS_Candels[i].shiftLowestOld].Candel_Low + DATAS[i].RangeSL * 3);;
                              //---------------------------------------------------------------------------------------------
                              int shiftNewAchivment = iHighest(Symbol(), f, MODE_HIGH, indx, 0);
                              double HighestNewAchivment = iHigh(Symbol(), f, shiftNewAchivment);
                              DATAS[i].IsTargetSL1Achived =  iLow(Symbol(), f, iLowest(Symbol(), f, MODE_LOW, indx, 0)) < DATAS[i].Price2SL ? +1 : -1;
                              DATAS[i].IsTargetTp1Achived =  HighestNewAchivment > DATAS[i].TargetTP1 ? +1 : -1;
                              DATAS[i].IsTargetTp2Achived =  HighestNewAchivment > DATAS[i].TargetTP2 ? +1 : -1;
                              DATAS[i].IsTargetTp3Achived =  HighestNewAchivment > DATAS[i].TargetTP3 ? +1 : -1;
                              if(HighestNewAchivment > DATAS[i].TargetTP1) {DATAS[i].eAchivmentTargets = E_TP1;}
                              if(HighestNewAchivment > DATAS[i].TargetTP2) {DATAS[i].eAchivmentTargets = E_TP2;}
                              if(HighestNewAchivment > DATAS[i].TargetTP3) {DATAS[i].eAchivmentTargets = E_TP3;}
                              //---------------------------------------------------------------------------------------------
                              DATAS[i].IsVerifiedSignalBySlRange = DATAS[i].RangeSL > SLRangePips * Point(); //
                              //---------------------------------------------------------------------------------------------
                    }//
                    //================================================================================================
                    //if(!DATAS[i].IsVerifiedSignalBySlRange)DATAS[i].eMACD_STATE = EVoide_MACD_STATE; //
                    DATAS[i].cE_SL1 = C'88,22,22';      //clrRed
                    DATAS[i].cE_TP1 = C'88,88,88'; //clrGreen
                    DATAS[i].cE_TP2 = C'88,88,88';
                    DATAS[i].cE_TP3 = C'88,88,88';
                    //
                    if(DATAS[i].IsTargetSL1Achived == +1) {DATAS[i].cE_SL1 = clrOrangeRed ;}
                    if(DATAS[i].IsTargetTp1Achived == +1) {DATAS[i].cE_TP1 = clrCornflowerBlue ;} //clrMediumSlateBlue //clrCornflowerBlue     C'88,88,88'
                    if(DATAS[i].IsTargetTp2Achived == +1) {DATAS[i].cE_TP2 = clrDodgerBlue ;} //clrDarkSlateBlue   //clrDodgerBlue             C'88,88,88'
                    if(DATAS[i].IsTargetTp3Achived == +1) {DATAS[i].cE_TP3 = clrRoyalBlue ;} //clrMidnightBlue    //clrRoyalBlue               C'88,88,88'
                    //
                    if(DATAS[i].CalcMode == 4) {DATAS[i].cE_TP1 = clrDimGray; DATAS[i].cE_TP2 = clrDimGray; DATAS[i].cE_TP3 = clrDimGray;}
                    if(DATAS[i].CalcMode == 4 && DATAS[i].IsTargetTp1Achived == +1) {DATAS[i].cE_TP1 = clrCornflowerBlue;}
                    if(DATAS[i].CalcMode == 4 && DATAS[i].IsTargetTp2Achived == +1) {DATAS[i].cE_TP2 = clrDodgerBlue;}
                    if(DATAS[i].CalcMode == 4 && DATAS[i].IsTargetTp3Achived == +1) {DATAS[i].cE_TP3 = clrRoyalBlue;}
                    //================================================================================================
                    //--------------------------------------solidation method for know frist detected
                    {         if(DATAS[i].eMACD_STATE == EVoide_MACD_STATE) continue;
                              MACD_Cross_Signal.BarShift[MACD_Cross_Signal.Idx] = i;
                              MACD_Cross_Signal.BarPrice[MACD_Cross_Signal.Idx] = iClose(Symbol(), f, i);
                              MACD_Cross_Signal.BarTime[MACD_Cross_Signal.Idx]  = iTime(Symbol(), f, i);;
                              MACD_Cross_Signal.E_MACD_Cross_Signal[MACD_Cross_Signal.Idx] = DATAS[i].Is_CrossUp_Signal_Selling  ? Et_MACD_Cross_Signal_Up_Selling : Et_MACD_Cross_Signal_Void; //
                              MACD_Cross_Signal.eMACD_STATE[MACD_Cross_Signal.Idx] = DATAS[i].eMACD_STATE;
                              //
                              MACD_Cross_Signal.DATAS[MACD_Cross_Signal.Idx]                          = DATAS[i];
                              //
                              MACD_Cross_Signal.MACD_RR[MACD_Cross_Signal.Idx].RRR_angeAmount          = DATAS[i].RangeSL;
                              MACD_Cross_Signal.MACD_RR[MACD_Cross_Signal.Idx].MACDamount             = DATAS[i].main_Value;
                              MACD_Cross_Signal.MACD_RR[MACD_Cross_Signal.Idx].IsTargetSL1Achived     = DATAS[i].IsTargetSL1Achived;
                              MACD_Cross_Signal.MACD_RR[MACD_Cross_Signal.Idx].IsTargetTP1Achived     = DATAS[i].IsTargetTp1Achived;
                              MACD_Cross_Signal.MACD_RR[MACD_Cross_Signal.Idx].IsTargetTP2Achived     = DATAS[i].IsTargetTp2Achived;
                              MACD_Cross_Signal.MACD_RR[MACD_Cross_Signal.Idx].IsTargetTP3Achived     = DATAS[i].IsTargetTp3Achived;
                              //-------------------------------------------------------------------------
                              if(DATAS[i].eMACD_STATE == UP_IN)    {MACD_Cross_Signal.MACD_RR[MACD_Cross_Signal.Idx].IsBuyp1Selln1 = DATAS[i].IsTargetTp1Achived == -1 ? +1 : 0;}
                              if(DATAS[i].eMACD_STATE == UP_OUT)   {MACD_Cross_Signal.MACD_RR[MACD_Cross_Signal.Idx].IsBuyp1Selln1 = DATAS[i].IsTargetTp1Achived == -1 ? -1 : 0;}
                              if(DATAS[i].eMACD_STATE == DOWN_IN)  {MACD_Cross_Signal.MACD_RR[MACD_Cross_Signal.Idx].IsBuyp1Selln1 = DATAS[i].IsTargetTp1Achived == -1 ? -1 : 0;}
                              if(DATAS[i].eMACD_STATE == DOWN_OUT) {MACD_Cross_Signal.MACD_RR[MACD_Cross_Signal.Idx].IsBuyp1Selln1 = DATAS[i].IsTargetTp1Achived == -1 ? +1 : 0;}
                              MACD_Cross_Signal.MACD_RR[MACD_Cross_Signal.Idx].amountSLPrice          = DATAS[i].RRR_0Price2;
                              MACD_Cross_Signal.MACD_RR[MACD_Cross_Signal.Idx].amountTPPrice          = DATAS[i].RRR_2Price2 ;
                              //
                              if(DATAS[i].eMACD_STATE != EVoide_MACD_STATE) {MACD_Cross_Signal.Idx++;} //
                              if(DATAS[i].eMACD_STATE == DOWN_OUT || DATAS[i].eMACD_STATE == DOWN_IN || DATAS[i].eMACD_STATE == UP_OUT || DATAS[i].eMACD_STATE == UP_IN )
                              {         if(MACD_Cross_Signal.MACD_RR[0].IsTargetSL1Achived == +1 || MACD_Cross_Signal.MACD_RR[0].IsTargetTP3Achived == +1)
                                        {         NowTimeDetected = iTime(_Symbol, PERIOD_M1, 0);
                                                  idxCross_SignalRR = MACD_Cross_Signal.Idx; //
                                                  break;//
                                        }//
                              } //
                    }//
                    //shapes
                    if(IsOffChartShapes) return;//
                    if(DATAS[i].eMACD_STATE != EVoide_MACD_STATE && DATAS[i].IsTargetSL1Achived == -1 )
                    {         string Type = ".."; string Type2 = ".."; double price1Text = 0;  double price2Text = 0;  color clrs = clrNONE; string arrowtext = "..";
                              if(DATAS[i].eMACD_STATE == UP_IN)         {Type = "UI"; Type2 = "Buying";    price1Text = DATAS_Candels[i].Candel_Low - 350 * Point();    price2Text = DATAS_Candels[i].Candel_Low - 550 * Point();   clrs = clrDodgerBlue;       arrowtext = "é";}
                              if(DATAS[i].eMACD_STATE == DOWN_IN)       {Type = "DI"; Type2 = "Selling";   price1Text = DATAS_Candels[i].Candel_High + 350 * Point();   price2Text = DATAS_Candels[i].Candel_High + 550 * Point();  clrs = clrMagenta;          arrowtext = "ê";}
                              if(DATAS[i].eMACD_STATE == UP_OUT)        {Type = "UO"; Type2 = "Selling";   price1Text = DATAS_Candels[i].Candel_High + 350 * Point();   price2Text = DATAS_Candels[i].Candel_High + 550 * Point();  clrs = clrOrangeRed;        arrowtext = "ê";}
                              if(DATAS[i].eMACD_STATE == DOWN_OUT)      {Type = "DO"; Type2 = "Buying";    price1Text = DATAS_Candels[i].Candel_Low - 350 * Point();    price2Text = DATAS_Candels[i].Candel_Low - 550 * Point();   clrs = clrLawnGreen;        arrowtext = "é";}
                              {         //---------------------------------------------------------------------------------------------"
                                        //draw RR box
                                        //if( f == PERIOD_M5 || f == PERIOD_H4 || f == PERIOD_M1 || f == PERIOD_CURRENT)  //if(f != PERIOD_CURRENT || f != PERIOD_M1 )
                                        if(DATAS[i].IsVerifiedSignalBySlRange)
                                        {         if(0)
                                                  {         //
                                                            if(DATAS[i].eMACD_STATE == UP_IN || DATAS[i].eMACD_STATE == DOWN_OUT)
                                                            {         Object_Pack_1.Lines.TrendByAngle.Draw_GDS2(MODE_CREATE, b, Name +  "-1" + Type + "-RR-TLAngle M:" + (string)DATAS[i].CalcMode + " B:" + (string)i,
                                                                                          DATAS[i].RRR_0Time2, DATAS[i].RRR_0Price2, DATAS[i].RRR_0Time2 + PeriodSeconds() * PeriodSecondsCount * 50,
                                                                                          DATAS[i].RRR_0Price2 + 500 * Point(), 0 + 45, false);
                                                                      //datetime t1 = (datetime)ObjectGet("Lines.TrendByAngle"  +  "-1" + Type + "-RR-TLAngle M:" + (string)DATAS[i].CalcMode + " B:" + (string)i, OBJPROP_TIME1);
                                                                      //double   p1 = ObjectGet("Lines.TrendByAngle"  +  "-1" + Type + "-RR-TLAngle M:" + (string)DATAS[i].CalcMode + " B:" + (string)i, OBJPROP_PRICE1);;
                                                                      //datetime t2 = (datetime)ObjectGet("Lines.TrendByAngle"  +  "-1" + Type + "-RR-TLAngle M:" + (string)DATAS[i].CalcMode + " B:" + (string)i, OBJPROP_TIME2);;
                                                                      //double   p2 = (double)ObjectGet("Lines.TrendByAngle"  +  "-1" + Type + "-RR-TLAngle M:" + (string)DATAS[i].CalcMode + " B:" + (string)i, OBJPROP_PRICE2);;
                                                                      //Object_Pack_1.Lines.TrendByAngle.Draw_GDS2(MODE_CREATE, b, Name+ "-1" + Type + "-RR-TLAngle M:" + (string)DATAS[i].CalcMode + " B:" + (string)i,
                                                                      //                    DATAS[i].RRR_0Time2, DATAS[i].RRR_0Price2, DATAS[i].RRR_0Time2 + PeriodSeconds() * PeriodSecondsCount * 50,
                                                                      //                    DATAS[i].RRR_0Price2 + 500 * Point(), 0 + 45, false);
                                                                      //Object_Pack_1.Lines.Trend.Draw_GDS_Lines(MODE_CREATE, b, Name+ "-1" + Type + "-RR-TLAngle M:" + (string)DATAS[i].CalcMode + " B:" + (string)i,  "-1" + Type + "-RR-TLAngle M:" + (string)DATAS[i].CalcMode + " B:" + (string)i,
                                                                      //                    t1, p1, t2, p2, clrYellow, 0, false, STYLE_DOT, false);
                                                                      //
                                                            }
                                                            if(DATAS[i].eMACD_STATE == DOWN_IN || DATAS[i].eMACD_STATE == UP_OUT)
                                                            {         Object_Pack_1.Lines.TrendByAngle.Draw_GDS2(MODE_CREATE, b, Name +  "-1" + Type + "-RR-TLAngle M:" + (string)DATAS[i].CalcMode + " B:" + (string)i,
                                                                                          DATAS[i].RRR_0Time2, DATAS[i].RRR_0Price2, DATAS[i].RRR_0Time2 + PeriodSeconds() * PeriodSecondsCount * 50, DATAS[i].RRR_0Price2 + 500 * Point(), 270 + 45, false);
                                                                      //datetime t1 = (datetime)ObjectGet("Lines.TrendByAngle"  +  "-1" + Type + "-RR-TLAngle M:" + (string)DATAS[i].CalcMode + " B:" + (string)i, OBJPROP_TIME1);
                                                                      //double   p1 = ObjectGet("Lines.TrendByAngle"  +  "-1" + Type + "-RR-TLAngle M:" + (string)DATAS[i].CalcMode + " B:" + (string)i, OBJPROP_PRICE1);;
                                                                      //datetime t2 = (datetime)ObjectGet("Lines.TrendByAngle"  +  "-1" + Type + "-RR-TLAngle M:" + (string)DATAS[i].CalcMode + " B:" + (string)i, OBJPROP_TIME2);;
                                                                      //double   p2 = (double)ObjectGet("Lines.TrendByAngle"  +  "-1" + Type + "-RR-TLAngle M:" + (string)DATAS[i].CalcMode + " B:" + (string)i, OBJPROP_PRICE2);;
                                                                      //Object_Pack_1.Lines.TrendByAngle.Draw_GDS2(MODE_CREATE, b, Name+ "-1" + Type + "-RR-TLAngle M:" + (string)DATAS[i].CalcMode + " B:" + (string)i,
                                                                      //                    DATAS[i].RRR_0Time2, DATAS[i].RRR_0Price2, DATAS[i].RRR_0Time2 + PeriodSeconds() * PeriodSecondsCount * 50,
                                                                      //                    DATAS[i].RRR_0Price2 + 500 * Point(), 270 + 45, false);
                                                                      //Object_Pack_1.Lines.Trend.Draw_GDS_Lines(MODE_CREATE, b, Name+ "-1" + Type + "-RR-TLAngle M:" + (string)DATAS[i].CalcMode + " B:" + (string)i,  "-1" + Type + "-RR-TLAngle M:" + (string)DATAS[i].CalcMode + " B:" + (string)i,
                                                                      //                    t1, p1, t2, p2, clrYellow, 0, false, STYLE_DOT, false);
                                                                      //
                                                            }//
                                                  }
                                                  Object_Pack_1.Shapes.Rectangle.Draw_GDS(MODE_CREATE, b, Name +  "-1" + Type + "-RR-SL M:" + (string)DATAS[i].CalcMode + " B:" + (string)i,
                                                                                          "-1" + Type + "-RR-SL M:" + (string)DATAS[i].CalcMode + " B:" + (string)i, false,
                                                                                          DATAS[i].RRR_0Time1, DATAS[i].RRR_0Price1, DATAS[i].RRR_0Time2, DATAS[i].RRR_0Price2, DATAS[i].cE_SL1, true); //
                                                  Object_Pack_1.Shapes.Rectangle.Draw_GDS(MODE_CREATE, b, Name +  "-1" + Type + "-RR-TP1 M:" + (string)DATAS[i].CalcMode + " B:" + (string)i,
                                                                                          "-1" + Type + "-RR-TP1 M:" + (string)DATAS[i].CalcMode + " B:" + (string)i, false,
                                                                                          DATAS[i].RRR_1Time1, DATAS[i].RRR_1Price1, DATAS[i].RRR_1Time2,  DATAS[i].RRR_1Price2, DATAS[i].cE_TP1, true); //
                                                  Object_Pack_1.Shapes.Rectangle.Draw_GDS(MODE_CREATE, b, Name +  "-1" + Type + "-RR-TP2 M:" + (string)DATAS[i].CalcMode + " B:" + (string)i,
                                                                                          "-1" + Type + "-RR-TP2 M:" + (string)DATAS[i].CalcMode + " B:" + (string)i, false,
                                                                                          DATAS[i].RRR_2Time1, DATAS[i].RRR_2Price1, DATAS[i].RRR_2Time2,  DATAS[i].RRR_2Price2, DATAS[i].cE_TP2, true); //
                                                  Object_Pack_1.Shapes.Rectangle.Draw_GDS(MODE_CREATE, b, Name +  "-1" + Type + "-RR-TP3 M:" + (string)DATAS[i].CalcMode + " B:" + (string)i,
                                                                                          "-1" + Type + "-RR-TP3 M:" + (string)DATAS[i].CalcMode + " B:" + (string)i, false,
                                                                                          DATAS[i].RRR_3Time1, DATAS[i].RRR_3Price1, DATAS[i].RRR_3Time2,  DATAS[i].RRR_3Price2, DATAS[i].cE_TP3, true); //
                                                  //
                                        }
                                        else if(IsAllowRR)
                                        {         if(0)          //
                                                  {         if(DATAS[i].eMACD_STATE == UP_IN || DATAS[i].eMACD_STATE == DOWN_OUT)
                                                            {         Object_Pack_1.Lines.TrendByAngle.Draw_GDS2(MODE_CREATE, b, Name +  "-1" + Type + "-RR-TLAngle M:" + (string)DATAS[i].CalcMode + " B:" + (string)i,
                                                                                          DATAS[i].RRR_0Time2, DATAS[i].RRR_0Price2, DATAS[i].RRR_0Time2 + PeriodSeconds() * PeriodSecondsCount * 50,
                                                                                          DATAS[i].RRR_0Price2 + 500 * Point(), 0 + 45, false);
                                                                      //datetime t1 = (datetime)ObjectGet("Lines.TrendByAngle"  +  "-1" + Type + "-RR-TLAngle M:" + (string)DATAS[i].CalcMode + " B:" + (string)i, OBJPROP_TIME1);
                                                                      //double   p1 = ObjectGet("Lines.TrendByAngle"  +  "-1" + Type + "-RR-TLAngle M:" + (string)DATAS[i].CalcMode + " B:" + (string)i, OBJPROP_PRICE1);;
                                                                      //datetime t2 = (datetime)ObjectGet("Lines.TrendByAngle"  +  "-1" + Type + "-RR-TLAngle M:" + (string)DATAS[i].CalcMode + " B:" + (string)i, OBJPROP_TIME2);;
                                                                      //double   p2 = (double)ObjectGet("Lines.TrendByAngle"  +  "-1" + Type + "-RR-TLAngle M:" + (string)DATAS[i].CalcMode + " B:" + (string)i, OBJPROP_PRICE2);;
                                                                      //Object_Pack_1.Lines.TrendByAngle.Draw_GDS2(MODE_CREATE, b, Name+ "-1" + Type + "-RR-TLAngle M:" + (string)DATAS[i].CalcMode + " B:" + (string)i,
                                                                      //                    DATAS[i].RRR_0Time2, DATAS[i].RRR_0Price2, DATAS[i].RRR_0Time2 + PeriodSeconds() * PeriodSecondsCount * 50,
                                                                      //                    DATAS[i].RRR_0Price2 + 500 * Point(), 0 + 45, false);
                                                                      //Object_Pack_1.Lines.Trend.Draw_GDS_Lines(MODE_CREATE, b, Name+ "-1" + Type + "-RR-TLAngle M:" + (string)DATAS[i].CalcMode + " B:" + (string)i,  "-1" + Type + "-RR-TLAngle M:" + (string)DATAS[i].CalcMode + " B:" + (string)i,
                                                                      //                    t1, p1, t2, p2, clrYellow, 0, false, STYLE_DOT, false);
                                                                      //
                                                            }
                                                            if(DATAS[i].eMACD_STATE == DOWN_IN || DATAS[i].eMACD_STATE == UP_OUT)
                                                            {         Object_Pack_1.Lines.TrendByAngle.Draw_GDS2(MODE_CREATE, b, Name +  "-1" + Type + "-RR-TLAngle M:" + (string)DATAS[i].CalcMode + " B:" + (string)i,
                                                                                          DATAS[i].RRR_0Time2, DATAS[i].RRR_0Price2, DATAS[i].RRR_0Time2 + PeriodSeconds() * PeriodSecondsCount * 50, DATAS[i].RRR_0Price2 + 500 * Point(), 270 + 45, false);
                                                                      //datetime t1 = (datetime)ObjectGet("Lines.TrendByAngle"  +  "-1" + Type + "-RR-TLAngle M:" + (string)DATAS[i].CalcMode + " B:" + (string)i, OBJPROP_TIME1);
                                                                      //double   p1 = ObjectGet("Lines.TrendByAngle"  +  "-1" + Type + "-RR-TLAngle M:" + (string)DATAS[i].CalcMode + " B:" + (string)i, OBJPROP_PRICE1);;
                                                                      //datetime t2 = (datetime)ObjectGet("Lines.TrendByAngle"  +  "-1" + Type + "-RR-TLAngle M:" + (string)DATAS[i].CalcMode + " B:" + (string)i, OBJPROP_TIME2);;
                                                                      //double   p2 = (double)ObjectGet("Lines.TrendByAngle"  +  "-1" + Type + "-RR-TLAngle M:" + (string)DATAS[i].CalcMode + " B:" + (string)i, OBJPROP_PRICE2);;
                                                                      //Object_Pack_1.Lines.TrendByAngle.Draw_GDS2(MODE_CREATE, b, Name+ "-1" + Type + "-RR-TLAngle M:" + (string)DATAS[i].CalcMode + " B:" + (string)i,
                                                                      //                    DATAS[i].RRR_0Time2, DATAS[i].RRR_0Price2, DATAS[i].RRR_0Time2 + PeriodSeconds() * PeriodSecondsCount * 50,
                                                                      //                    DATAS[i].RRR_0Price2 + 500 * Point(), 270 + 45, false);
                                                                      //Object_Pack_1.Lines.Trend.Draw_GDS_Lines(MODE_CREATE, b, Name+ "-1" + Type + "-RR-TLAngle M:" + (string)DATAS[i].CalcMode + " B:" + (string)i,  "-1" + Type + "-RR-TLAngle M:" + (string)DATAS[i].CalcMode + " B:" + (string)i,
                                                                      //                    t1, p1, t2, p2, clrYellow, 0, false, STYLE_DOT, false);
                                                                      //
                                                            }//
                                                  }
                                                  Object_Pack_1.Shapes.Rectangle.Draw_GDS(MODE_CREATE, b, Name +  "-2" + Type + "-RR-SL M:" + (string)DATAS[i].CalcMode + " B:" + (string)i,
                                                                                          "-2" + Type + "-RR-SL M:" + (string)DATAS[i].CalcMode + " B:" + (string)i, false,
                                                                                          DATAS[i].RRR_0Time1, DATAS[i].RRR_0Price1, DATAS[i].RRR_0Time2, DATAS[i].RRR_0Price2, DATAS[i].cE_SL1, true);   //
                                                  Object_Pack_1.Shapes.Rectangle.Draw_GDS(MODE_CREATE, b, Name +  "-2" + Type + "-RR-TP1 M:" + (string)DATAS[i].CalcMode + " B:" + (string)i,
                                                                                          "-2" + Type + "-RR-TP1 M:" + (string)DATAS[i].CalcMode + " B:" + (string)i, false,
                                                                                          DATAS[i].RRR_1Time1, DATAS[i].RRR_1Price1, DATAS[i].RRR_1Time2, DATAS[i].RRR_1Price2, DATAS[i].cE_TP1, true);  //
                                                  Object_Pack_1.Shapes.Rectangle.Draw_GDS(MODE_CREATE, b, Name +  "-2" + Type + "-RR-TP2 M:" + (string)DATAS[i].CalcMode + " B:" + (string)i,
                                                                                          "-2" + Type + "-RR-TP2 M:" + (string)DATAS[i].CalcMode + " B:" + (string)i, false,
                                                                                          DATAS[i].RRR_2Time1, DATAS[i].RRR_2Price1, DATAS[i].RRR_2Time2, DATAS[i].RRR_2Price2, DATAS[i].cE_TP2, true);  //
                                                  Object_Pack_1.Shapes.Rectangle.Draw_GDS(MODE_CREATE, b, Name +  "-2" + Type + "-RR-TP3 M:" + (string)DATAS[i].CalcMode + " B:" + (string)i,
                                                                                          "-2" + Type + "-RR-TP3 M:" + (string)DATAS[i].CalcMode + " B:" + (string)i, false,
                                                                                          DATAS[i].RRR_3Time1, DATAS[i].RRR_3Price1, DATAS[i].RRR_3Time2, DATAS[i].RRR_3Price2, DATAS[i].cE_TP3, true);  //
                                        }
                                        //Dev_Object_Pack.Texts.Description4.Draw_GDS_Text(MODE_CREATE, b, Name+  "_desc.4Macd-SBUI-Buying-Range:M:" + (string)DATAS[i].CalcMode + " B:" + (string)i, DoubleToString(DATAS[i].RangeSL, _Digits), DATAS[i].RRR_0Time1, DATAS[i].Price2SL - 0 * Point(), clrLawnGreen, "Arial", 12 + s, ANCHOR_LEFT, 0, false); //
                                        Dev_Object_Pack.Texts.Description1.Draw_GDS_Text(MODE_CREATE, b, Name +   "_desc.4Macd-SB" + Type + "-" + Type2 + ":M:"       + (string)DATAS[i].CalcMode + " B:" + (string)i,  arrowtext, DATAS_Candels[i].Candel_Time, price1Text, clrs, "Wingdings", 15 + s, ANCHOR_CENTER, 0, false); //
                                        Dev_Object_Pack.Texts.Description4.Draw_GDS_Text(MODE_CREATE, b, Name +   "_desc.4Macd-SB" + Type + "-" + Type2 + "-Range:M:" + (string)DATAS[i].CalcMode + " B:" + (string)i + " P",  Utilities.TimeFrameToString(f) + " M:" + DoubleToString(DATAS[i].main_Value, _Digits) + " $:" + DoubleToString(DATAS[i].RangeSL, _Digits), DATAS[i].RRR_0Time1 + PeriodSeconds() * 3, price2Text, clrs, "Arial", 12 + s, ANCHOR_LEFT, 0, false); //
                                        //Dev_Object_Pack.Texts.Description4.Draw_GDS_Text(MODE_CREATE, b, Name+  "_desc.4Macd-SBUI-Buying-Range:M:" + (string)DATAS[i].CalcMode + " B:" + (string)i + " S",  DoubleToString(DATAS[i].main_Value, _Digits), DATAS[i].RRR_0Time1 - PeriodSeconds() * 0, DATAS[i].Price2SL + (50 + s * 2) * Point(), clrGold, "Arial", 12 + s, ANCHOR_LEFT, 0, false); //
                                        //---------------------------------------------------------------------------------------------
                                        if(0)
                                        {         bool IsBrokenTLAngel = 0;
                                                  if(DATAS[i].eMACD_STATE == UP_IN || DATAS[i].eMACD_STATE == DOWN_OUT)
                                                  {         IsBrokenTLAngel = iClose(_Symbol, f, iBarShift(_Symbol, f, DATAS[i].RRR_0Time2 + PeriodSeconds() * PeriodSecondsCount * 50)) < ObjectGetValueByTime(0, "Lines.TrendByAngle"  +  "-1" + Type + "-RR-TLAngle M:" + (string)DATAS[i].CalcMode + " B:" + (string)i, DATAS[i].RRR_0Time2 + PeriodSeconds() * PeriodSecondsCount * 50);}
                                                  if(DATAS[i].eMACD_STATE == DOWN_IN || DATAS[i].eMACD_STATE == UP_OUT)
                                                  {         IsBrokenTLAngel = iClose(_Symbol, f, iBarShift(_Symbol, f, DATAS[i].RRR_0Time2 + PeriodSeconds() * PeriodSecondsCount * 50)) > ObjectGetValueByTime(0, "Lines.TrendByAngle"  +  "-1" + Type + "-RR-TLAngle M:" + (string)DATAS[i].CalcMode + " B:" + (string)i, DATAS[i].RRR_0Time2 + PeriodSeconds() * PeriodSecondsCount * 50);}
                                                  if(IsBrokenTLAngel)
                                                  {
                                                            {         //
                                                                      if(DATAS[i].eMACD_STATE == UP_IN || DATAS[i].eMACD_STATE == DOWN_OUT)
                                                                      {         Object_Pack_1.Lines.TrendByAngle.Draw_GDS2(MODE_CREATE, !b, Name +  "-1" + Type + "-RR-TLAngle M:" + (string)DATAS[i].CalcMode + " B:" + (string)i,
                                                                                                    DATAS[i].RRR_0Time2, DATAS[i].RRR_0Price2, DATAS[i].RRR_0Time2 + PeriodSeconds() * PeriodSecondsCount * 50, DATAS[i].RRR_0Price2 + 500 * Point(), 0 + 45, false);
                                                                                //
                                                                      }
                                                                      if(DATAS[i].eMACD_STATE == DOWN_IN || DATAS[i].eMACD_STATE == UP_OUT)
                                                                      {         Object_Pack_1.Lines.TrendByAngle.Draw_GDS2(MODE_CREATE, !b, Name +  "-1" + Type + "-RR-TLAngle M:" + (string)DATAS[i].CalcMode + " B:" + (string)i,
                                                                                                    DATAS[i].RRR_0Time2, DATAS[i].RRR_0Price2, DATAS[i].RRR_0Time2 + PeriodSeconds() * PeriodSecondsCount * 50, DATAS[i].RRR_0Price2 + 500 * Point(), 270 + 45, false);
                                                                                //
                                                                      }//
                                                            }
                                                            Object_Pack_1.Shapes.Rectangle.Draw_GDS(MODE_CREATE, !b, Name +  "-1" + Type + "-RR-SL M:" + (string)DATAS[i].CalcMode + " B:" + (string)i,
                                                                                                    "-1" + Type + "-RR-SL M:" + (string)DATAS[i].CalcMode + " B:" + (string)i, false,
                                                                                                    DATAS[i].RRR_0Time1, DATAS[i].RRR_0Price1, DATAS[i].RRR_0Time2, DATAS[i].RRR_0Price2, DATAS[i].cE_SL1, true); //
                                                            Object_Pack_1.Shapes.Rectangle.Draw_GDS(MODE_CREATE, !b, Name +  "-1" + Type + "-RR-TP1 M:" + (string)DATAS[i].CalcMode + " B:" + (string)i,
                                                                                                    "-1" + Type + "-RR-TP1 M:" + (string)DATAS[i].CalcMode + " B:" + (string)i, false,
                                                                                                    DATAS[i].RRR_1Time1, DATAS[i].RRR_1Price1, DATAS[i].RRR_1Time2,  DATAS[i].RRR_1Price2, DATAS[i].cE_TP1, true); //
                                                            Object_Pack_1.Shapes.Rectangle.Draw_GDS(MODE_CREATE, !b, Name +  "-1" + Type + "-RR-TP2 M:" + (string)DATAS[i].CalcMode + " B:" + (string)i,
                                                                                                    "-1" + Type + "-RR-TP2 M:" + (string)DATAS[i].CalcMode + " B:" + (string)i, false,
                                                                                                    DATAS[i].RRR_2Time1, DATAS[i].RRR_2Price1, DATAS[i].RRR_2Time2,  DATAS[i].RRR_2Price2, DATAS[i].cE_TP2, true); //
                                                            Object_Pack_1.Shapes.Rectangle.Draw_GDS(MODE_CREATE, !b, Name +  "-1" + Type + "-RR-TP3 M:" + (string)DATAS[i].CalcMode + " B:" + (string)i,
                                                                                                    "-1" + Type + "-RR-TP3 M:" + (string)DATAS[i].CalcMode + " B:" + (string)i, false,
                                                                                                    DATAS[i].RRR_3Time1, DATAS[i].RRR_3Price1, DATAS[i].RRR_3Time2,  DATAS[i].RRR_3Price2, DATAS[i].cE_TP3, true); //
                                                  }//
                                        }
                                        //---------------------------------------------------------------------------------------------
                              }//
                    } //
                    //================================================================================================
                    //--- DETECT IsBasic_SignalMain_Bulish_Expanding
                    {         bool Is_ExP = MathAbs(DATAS[i].main_Value  - DATAS[i].signal_Value ) > MathAbs(DATAS[i + 2].main_Value    - DATAS[i + 3].signal_Value   ); //--the diff last > diff current is
                              DATAS[i].IsBasic_SignalMain__Expanding            = Is_ExP;
                              DATAS[i].IsBasic_SignalMain__Nearing              = !Is_ExP;
                              DATAS[i].IsBasic_SignalMain_Bulish_Expanding      = DATAS[i].signal_Value  < DATAS[i].main_Value    && Is_ExP;
                              DATAS[i].IsBasic_SignalMain_Bulish_Nearing        = DATAS[i].signal_Value  < DATAS[i].main_Value    && !Is_ExP;
                              DATAS[i].IsBasic_SignalMain_Bearish_Expanding     = DATAS[i].signal_Value  > DATAS[i].main_Value    && Is_ExP;
                              DATAS[i].IsBasic_SignalMain_Bearish_Nearing       = DATAS[i].signal_Value  > DATAS[i].main_Value    && !Is_ExP; //
                    }
                    //  breake OnDetected
                    //if(DATAS[i].IsTargetSL1Achived == 0)break;
                    //if(DATAS[i].eMACD_STATE != EVoide_MACD_STATE  ) ;
          }
//ChartRedraw();//
// END FOR LOOP
          for(int i = 0; i < Size_ - 3; i++)
          {         if(DATAS[i].IsTargetSL1Achived == +1 && b)
                    {         //================================================================================================
                              for(int j = 0; j < 10; j++)
                              {         //if((Detect_NewBar._M1.CBT.Is_NewBar))// || i < 100//;----when new candel come its not deleted
                                        {         //if(Detect_NewBar._M1.CBT__5Seccound.Is_NewBar)if(Detect_NewBar._M1.CBT__Seccound.Is_NewBar)
                                                  ObjectDelete(0, Name +   "_desc.4Macd-SBUO-Selling:M:" + (string)j + " B:" + (string)i);
                                                  ObjectDelete(0, Name +   "_desc.4Macd-SBUO-Selling-Range:M:" + (string)j + " B:" + (string)i);
                                                  ObjectDelete(0, Name +   "_desc.4Macd-SBUO-Selling-Range:M:" + (string)j + " B:" + (string)i + " S");
                                                  ObjectDelete(0, Name +   "_desc.4Macd-SBUO-Selling-Range:M:" + (string)j + " B:" + (string)i + " P");
                                                  //if(Detect_NewBar._M1.CBT__5Seccound.Is_NewBar)
                                                  ObjectDelete(0, Name +   "_desc.4Macd-SBDO-Buying:M:" + (string)j + " B:" + (string)i);
                                                  ObjectDelete(0, Name +   "_desc.4Macd-SBDO-Buying-Range:M:" + (string)j + " B:" + (string)i);
                                                  ObjectDelete(0, Name +   "_desc.4Macd-SBDO-Buying-Range:M:" + (string)j + " B:" + (string)i + " S"); //
                                                  ObjectDelete(0, Name +   "_desc.4Macd-SBDO-Buying-Range:M:" + (string)j + " B:" + (string)i + " P");
                                                  //if(Detect_NewBar._M1.CBT__5Seccound.Is_NewBar)
                                                  ObjectDelete(0, Name +  "_desc.4Macd-SBUI-Buying:M:" + (string)j + " B:" + (string)i);
                                                  ObjectDelete(0, Name +  "_desc.4Macd-SBUI-Buying-Range:M:" + (string)j + " B:" + (string)i);
                                                  ObjectDelete(0, Name +  "_desc.4Macd-SBUI-Buying-Range:M:" + (string)j + " B:" + (string)i + " S"); //
                                                  ObjectDelete(0, Name +  "_desc.4Macd-SBUI-Buying-Range:M:" + (string)j + " B:" + (string)i + " P");
                                                  //if(Detect_NewBar._M1.CBT__5Seccound.Is_NewBar)
                                                  ObjectDelete(0, Name +  "_desc.4Macd-SBDI-Selling:M:" + (string)j + " B:" + (string)i);
                                                  ObjectDelete(0, Name +  "_desc.4Macd-SBDI-Selling-Range:M:" + (string)j + " B:" + (string)i);
                                                  ObjectDelete(0, Name +  "_desc.4Macd-SBDI-Selling-Range:M:" + (string)j + " B:" + (string)i + " S"); //
                                                  ObjectDelete(0, Name +  "_desc.4Macd-SBDI-Selling-Range:M:" + (string)j + " B:" + (string)i + " P");
                                                  //
                                                  ObjectDelete(0,  Name +  "-1UI-RR-SL M:" + (string)j + " B:" + (string)i);    ObjectDelete(0,  Name +  "-1UI-RR-TP1 M:" + (string)j + " B:" + (string)i);    ObjectDelete(0,  Name +  "-1UI-RR-TP2 M:" + (string)j + " B:" + (string)i);    ObjectDelete(0,  Name +  "-1UI-RR-TP3 M:" + (string)j + " B:" + (string)i); ////
                                                  ObjectDelete(0,  Name +  "-1DI-RR-SL M:" + (string)j + " B:" + (string)i);    ObjectDelete(0,  Name +  "-1DI-RR-TP1 M:" + (string)j + " B:" + (string)i);    ObjectDelete(0,  Name +  "-1DI-RR-TP2 M:" + (string)j + " B:" + (string)i);    ObjectDelete(0,  Name +  "-1DI-RR-TP3 M:" + (string)j + " B:" + (string)i); //
                                                  ObjectDelete(0,  Name +  "-1UO-RR-SL M:" + (string)j + " B:" + (string)i);    ObjectDelete(0,  Name +  "-1UO-RR-TP1 M:" + (string)j + " B:" + (string)i);    ObjectDelete(0,  Name +  "-1UO-RR-TP2 M:" + (string)j + " B:" + (string)i);    ObjectDelete(0,  Name +  "-1UO-RR-TP3 M:" + (string)j + " B:" + (string)i); //
                                                  ObjectDelete(0,  Name +  "-1DO-RR-SL M:" + (string)j + " B:" + (string)i);    ObjectDelete(0,  Name +  "-1DO-RR-TP1 M:" + (string)j + " B:" + (string)i);    ObjectDelete(0,  Name +  "-1DO-RR-TP2 M:" + (string)j + " B:" + (string)i);    ObjectDelete(0,  Name +  "-1DO-RR-TP3 M:" + (string)j + " B:" + (string)i); //
                                                  //
                                                  ObjectDelete(0,  Name +  "-2UI-RR-SL M:" + (string)j + " B:" + (string)i);    ObjectDelete(0,  Name +  "-2UI-RR-TP1 M:" + (string)j + " B:" + (string)i);    ObjectDelete(0,  Name +  "-2UI-RR-TP2 M:" + (string)j + " B:" + (string)i);    ObjectDelete(0,  Name +  "-2UI-RR-TP3 M:" + (string)j + " B:" + (string)i); ////
                                                  ObjectDelete(0,  Name +  "-2DI-RR-SL M:" + (string)j + " B:" + (string)i);    ObjectDelete(0,  Name +  "-2DI-RR-TP1 M:" + (string)j + " B:" + (string)i);    ObjectDelete(0,  Name +  "-2DI-RR-TP2 M:" + (string)j + " B:" + (string)i);    ObjectDelete(0,  Name +  "-2DI-RR-TP3 M:" + (string)j + " B:" + (string)i); //
                                                  ObjectDelete(0,  Name +  "-2UO-RR-SL M:" + (string)j + " B:" + (string)i);    ObjectDelete(0,  Name +  "-2UO-RR-TP1 M:" + (string)j + " B:" + (string)i);    ObjectDelete(0,  Name +  "-2UO-RR-TP2 M:" + (string)j + " B:" + (string)i);    ObjectDelete(0,  Name +  "-2UO-RR-TP3 M:" + (string)j + " B:" + (string)i); //
                                                  ObjectDelete(0,  Name +  "-2DO-RR-SL M:" + (string)j + " B:" + (string)i);    ObjectDelete(0,  Name +  "-2DO-RR-TP1 M:" + (string)j + " B:" + (string)i);    ObjectDelete(0,  Name +  "-2DO-RR-TP2 M:" + (string)j + " B:" + (string)i);    ObjectDelete(0,  Name +  "-2DO-RR-TP3 M:" + (string)j + " B:" + (string)i); //
                                                  //
                                        } //
                              }//
                    }//
          }
          {         // frist of series detected idx
                    int Idx_Cross = 0;
                    for(int i = 1; i < Size_; i++)  { if(MACD_Cross_Signal.E_MACD_Cross_Signal[i] > Et_MACD_Cross_Signal_Void ) { Idx_Cross = i; break;} }
                    //--    Alert("MACD_Cross_Signal.MACD_Cross_Signal[Idx_Cross] ", Idx_Cross, "  ", EnumToString(MACD_Cross_Signal.MACD_Cross_Signal[0]), "  BarShift:  ", MACD_Cross_Signal.BarShift[0]); //
          }
//
          if(f == PERIOD_CURRENT && false)
          {         Alert(EnumToString(f), " IsBasic_SignalMain_Bulish_Expanding[50]:",  DATAS[50].IsBasic_SignalMain_Bulish_Expanding,          "  IsBasic_SignalMain__Nearing: ",    DATAS[50].IsBasic_SignalMain__Nearing );  //
                    Alert(EnumToString(f), " IsBasic_SignalMain_Bulish_Nearing[50]:",    DATAS[50].IsBasic_SignalMain_Bulish_Nearing,            "  IsBasic_SignalMain__Expanding: ",  DATAS[50].IsBasic_SignalMain__Expanding );  //
                    Alert(EnumToString(f), " IsBasic_SignalMain_Bearish_Expanding[50]:", DATAS[50].IsBasic_SignalMain_Bearish_Expanding  ); //
                    Alert(EnumToString(f), " IsBasic_SignalMain_Bearish_Nearing[50]:",   DATAS[50].IsBasic_SignalMain_Bearish_Nearing  ); //
          }//
          if(!ct_Drive.TDD.ct_Configs.IsShow_MACD_Shapes&&Initer.IsBasic_Done)ObjectsDeleteAll(0, Name);//
}
//
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class Sti_MACD_Peroid
{
public:
          void       Sti_MACD_Peroid();
          void       ~Sti_MACD_Peroid() {};
          Sti_MACD   _MN;       //
          Sti_MACD   _W1;       //
          Sti_MACD   _D1;       //
          Sti_MACD   _H4;       //
          Sti_MACD   _H1;       //
          Sti_MACD   _M30;      //
          Sti_MACD   _M15;      //
          Sti_MACD   _M5;       //
          Sti_MACD   _M1;       //
          Sti_MACD   _Current;     //
          //Sti_MACD   _Current;  //
          //----------------------
          void       Update()
          {         //________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
                    {         //
                              if(!IsTesting())
                              {         _MN       = Sti_MACD("MNMacd",PERIOD_MN1, 1, 60, 43200);            //Print((string)( MN.Main.Max._Value),      "  inr--  MN.Main.Max._Value)");//  ////
                                        _W1       = Sti_MACD("W1Macd",PERIOD_W1,  1, 50, 10080);            //Print((string)( W1.Main.Max._Value),      "  inr--  W1.Main.Max._Value)");//  ////
                                        _D1       = Sti_MACD("D1Macd",PERIOD_D1,  1, 40, 1440);             //Print((string)( D1.Main.Max._Value),      "  inr--  D1.Main.Max._Value)");//  ////
                                        _H4       = Sti_MACD("H4Macd",PERIOD_H4,  1, 30, 240);              //Print((string)( H4.Main.Max._Value),      "  inr--  H4.Main.Max._Value)");//  ////
                                        _H1       = Sti_MACD("H1Macd",PERIOD_H1,  1, 20, 60);               //Print((string)( H1.Main.Max._Value),      "  inr--  H1.Main.Max._Value)");//  ////
                                        _M30      = Sti_MACD("M30Macd",PERIOD_M30, 1, 10, 30);               //Print((string)( M30.Main.Max._Value),     "  inr-- M30.Main.Max._Value)");//  ////
                                        _M15      = Sti_MACD("M15Macd",PERIOD_M15, 1, 5, 15);                //Print((string)( M15.Main.Max._Value),     "  inr-- M15.Main.Max._Value)");//  ////
                                        _M5       = Sti_MACD("M5Macd",PERIOD_M5,  1, 2, 5);                 //Print((string)( M5.Main.Max._Value),      "  inr--  M5.Main.Max._Value)");//  ////
                                        _M1       = Sti_MACD("M1Macd",PERIOD_M1,  1, -5, 1);//Print((string)( M1.Main.Max._Value),      "  inr--  M1.Main.Max._Value)");//  ////
                              }
                              _M15      = Sti_MACD("M15Macd",PERIOD_M15, 1, 5, 15);                //Print((string)( M15.Main.Max._Value),     "  inr-- M15.Main.Max._Value)");//  ////
                              _M5       = Sti_MACD("M5Macd",PERIOD_M5,  1, 2, 5);                 //Print((string)( M5.Main.Max._Value),      "  inr--  M5.Main.Max._Value)");//  ////
                              _M1       = Sti_MACD("M1Macd",PERIOD_M1,  1, -5, 1);//Print((string)( M1.Main.Max._Value),      "  inr--  M1.Main.Max._Value)");//  ////
                              //_Current  = Sti_MACD(PERIOD_CURRENT, 0, -5, 1);             //Print((string)( Current.Main.Max._Value), "  inr--  Current.Main.Max._Value)");//  //
                              //
                    }//
                    //________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
          } //
          /* _Current make pointer  even false it re inited and bug making*/
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Sti_MACD_Peroid::Sti_MACD_Peroid()
{         //________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
          Sti_MACD   MN         = Sti_MACD("MNMacd",PERIOD_MN1, 1, 0, 300);            _MN          = MN; //
          Sti_MACD   W1         = Sti_MACD("W1Macd",PERIOD_W1,  1, 0, 200);             _W1          = W1; //
          Sti_MACD   D1         = Sti_MACD("D1Macd",PERIOD_D1,  1, 0, 100);             _D1          = D1; //
          Sti_MACD   H4         = Sti_MACD("H4Macd",PERIOD_H4,  1, 0, 120);             _H4          = H4; //
          Sti_MACD   H1         = Sti_MACD("H1Macd",PERIOD_H1,  1, 0, 60);             _H1          = H1; //
          Sti_MACD   M30        = Sti_MACD("M30Macd",PERIOD_M30, 1, 0, 30);            _M30         = M30; //
          Sti_MACD   M15        = Sti_MACD("M15Macd",PERIOD_M15, 1, 0, 15);            _M15         = M15; //
          Sti_MACD   M5         = Sti_MACD("M5Macd",PERIOD_M5,  1, 10, 5);            _M5          = M5; //
          Sti_MACD   M1         = Sti_MACD("M1Macd",PERIOD_M1,  1, 0, 1);             _M1          = M1; //
          //Sti_MACD   Current    = Sti_MACD(PERIOD_CURRENT, 0, 0, 1);        _Current     = Current; //
          ObjectsDeleteAll(0, "MNMacd");
          ObjectsDeleteAll(0, "W1Macd");
          ObjectsDeleteAll(0, "D1Macd");
          ObjectsDeleteAll(0, "H4Macd");
          ObjectsDeleteAll(0, "H1Macd");
          ObjectsDeleteAll(0, "M30Macd");
          ObjectsDeleteAll(0, "M15Macd");
          ObjectsDeleteAll(0, "M5Macd");
          ObjectsDeleteAll(0, "M1Macd");
          ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
}
//+------------------------------------------------------------------+
//||   ||||||||||       St_CDI_MACD.mqh       ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
