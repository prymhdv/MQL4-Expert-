//+------------------------------------------------------------------+
//||   ||||||||||            tDevConductor.mqh                      ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
struct Stcd_Trade_Condition_Risk_Whatch
{

          bool Is_Price_Cross_EMA500_Level_X_Posetive;   //---high rist to trend folow //----Resistance 5$
          bool Is_Price_Cross_EMA500_Level_X_Negative;   //---high rist to trend folow //----Support    5$
          bool Is_Price_BetweenEMA500_Level_X_Posetive_Negative;
          //---
          bool Is_Price_Cross_EMA500_Level_X_Posetive_Touched_In_200Bar;   //---high rist to trend folow
          bool Is_Price_Cross_EMA500_Level_X_Negative_Touched_In_200Bar;   //---high rist to trend folow
          //---
          //---
          //---
          bool Is_Price_Cross_EMA500_Level_5_Posetive;   //---high rist to trend folow //----Resistance 5$
          bool Is_Price_Cross_EMA500_Level_5_Negative;   //---high rist to trend folow //----Support    5$
          bool Is_Price_BetweenEMA500_Level_5_Posetive_Negative;
          //---
          bool Is_Price_Cross_EMA500_Level_5_Posetive_Touched_In_200Bar;   //---high rist to trend folow
          bool Is_Price_Cross_EMA500_Level_5_Negative_Touched_In_200Bar;   //---high rist to trend folow
          //---
          //---
          //---
          bool Is_Price_Cross_EMA500_Level_13_Posetive;   //---high rist to trend folow //----Resistance 5$
          bool Is_Price_Cross_EMA500_Level_13_Negative;   //---high rist to trend folow //----Support    5$
          bool Is_Price_BetweenEMA500_Level_13_Posetive_Negative;
          //---
          bool Is_Price_Cross_EMA500_Level_13_Posetive_Touched_In_200Bar;   //---high rist to trend folow
          bool Is_Price_Cross_EMA500_Level_13_Negative_Touched_In_200Bar;   //---high rist to trend folow
          //---
          //---
          //---
          bool Is_Price_Cross_EMA500_Level_34_Posetive;   //---high rist to trend folow //----Resistance 5$
          bool Is_Price_Cross_EMA500_Level_34_Negative;   //---high rist to trend folow //----Support    5$
          bool Is_Price_BetweenEMA500_Level_34_Posetive_Negative;
          //---
          bool Is_Price_Cross_EMA500_Level_34_Posetive_Touched_In_200Bar;   //---high rist to trend folow
          bool Is_Price_Cross_EMA500_Level_34_Negative_Touched_In_200Bar;   //---high rist to trend folow
          //---
          //---
          //---
          bool Is_Price_Cross_EMA500_Level_88_Posetive;   //---high rist to trend folow //----Resistance 5$
          bool Is_Price_Cross_EMA500_Level_88_Negative;   //---high rist to trend folow //----Support    5$
          bool Is_Price_BetweenEMA500_Level_88_Posetive_Negative;
          //---
          bool Is_Price_Cross_EMA500_Level_88_Posetive_Touched_In_200Bar;   //---high rist to trend folow
          bool Is_Price_Cross_EMA500_Level_88_Negative_Touched_In_200Bar;   //---high rist to trend folow
          //---
          //---
          //---
          bool Is_Price_Cross_EMA500_Level_144_Posetive;   //---high rist to trend folow //----Resistance 5$
          bool Is_Price_Cross_EMA500_Level_144_Negative;   //---high rist to trend folow //----Support    5$
          bool Is_Price_BetweenEMA500_Level_144_Posetive_Negative;
          //---
          bool Is_Price_Cross_EMA500_Level_144_Posetive_Touched_In_200Bar;   //---high rist to trend folow
          bool Is_Price_Cross_EMA500_Level_144_Negative_Touched_In_200Bar;   //---high rist to trend folow
          //---
          //---
          //---



          //-------------------------------------------
          bool Update() {         return false;};
          bool IsUpdate; //
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
struct St_Trade_Signals_base
{         bool          Is_Buy;
          bool          Is_Sell;
          bool          IsWinRate80;
          bool          Set__Signal();
          //bool       Update()            {return true;};
          //---

};

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
struct St_Trade_Signals_CandelsInfo : public St_Trade_Signals_base
{

          bool       Update()
          {         //---- +-240 max
                    ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_MN1[0].Bar_Trend_Direction.Is_Direction__Upward_Range200 ?  ct_Drive.TDD.ct_Conductor.DC_data.Avrage_Percent_Deal += 30 :  ct_Drive.TDD.ct_Conductor.DC_data.Avrage_Percent_Deal += -30 ;
                    ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_W1[0].Bar_Trend_Direction.Is_Direction__Upward_Range200  ?  ct_Drive.TDD.ct_Conductor.DC_data.Avrage_Percent_Deal += 30 :  ct_Drive.TDD.ct_Conductor.DC_data.Avrage_Percent_Deal += -30 ;
                    ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_H4[0].Bar_Trend_Direction.Is_Direction__Upward_Range200  ?  ct_Drive.TDD.ct_Conductor.DC_data.Avrage_Percent_Deal += 30 :  ct_Drive.TDD.ct_Conductor.DC_data.Avrage_Percent_Deal += -30 ;
                    ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_H1[0].Bar_Trend_Direction.Is_Direction__Upward_Range200  ?  ct_Drive.TDD.ct_Conductor.DC_data.Avrage_Percent_Deal += 30 :  ct_Drive.TDD.ct_Conductor.DC_data.Avrage_Percent_Deal += -30 ;
                    ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M30[0].Bar_Trend_Direction.Is_Direction__Upward_Range200 ?  ct_Drive.TDD.ct_Conductor.DC_data.Avrage_Percent_Deal += 30 :  ct_Drive.TDD.ct_Conductor.DC_data.Avrage_Percent_Deal += -30 ;
                    ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M15[0].Bar_Trend_Direction.Is_Direction__Upward_Range200 ?  ct_Drive.TDD.ct_Conductor.DC_data.Avrage_Percent_Deal += 30 :  ct_Drive.TDD.ct_Conductor.DC_data.Avrage_Percent_Deal += -30 ;
                    ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[0].Bar_Trend_Direction.Is_Direction__Upward_Range200  ?  ct_Drive.TDD.ct_Conductor.DC_data.Avrage_Percent_Deal += 30 :  ct_Drive.TDD.ct_Conductor.DC_data.Avrage_Percent_Deal += -30 ;
                    ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M1[0].Bar_Trend_Direction.Is_Direction__Upward_Range200  ?  ct_Drive.TDD.ct_Conductor.DC_data.Avrage_Percent_Deal += 30 :  ct_Drive.TDD.ct_Conductor.DC_data.Avrage_Percent_Deal += -30 ;
//
                    return true;//
          };
          bool          IsMACDTrendUp;

};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
struct St_Trade_Signals_IndicatorInfo : public St_Trade_Signals_base
{

          bool       Update()
          {
                    {         //SuperKeys
                              CD_Status_PAD.Pad_SuperIndicators_TrendUp.IsTrue =
                                        ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR.IsWpR20_CrossUp_200            &&
                                        ct_Drive.TDD.ct_Conductor.DC_data.Indicators._Accelerator.IsAccelerator_Up       &&
                                        ct_Drive.TDD.ct_Conductor.DC_data.Indicators._BullsPower.IsBullsPower_14_UpTrend &&
                                        ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MFI.IsMFI_Up                       &&
                                        ct_Drive.TDD.ct_Conductor.DC_data.Indicators._OBVClose.IsOBVClose_EMA20_CrossUp_SMA20;//---
                              //---
                              CD_Status_PAD.Pad_MAmicro_TrendUp.IsTrue = ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA._Data.IsDirectMicroUP;
                              //---
                    } //
                    return true;///
          }
          //---
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
struct St_Trade_Signals_ChartAnalise : public St_Trade_Signals_base
{         bool          Is_Bulish;
          bool          Update();/// {                     return true;};


};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool St_Trade_Signals_ChartAnalise::Update()
{
//---
//---
          bool Is_All_Any_Bulish = ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.Equidistant.GDS.Is_Bulish       ||
                                   ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.Regression.GDS.Is_Bulish        ||
                                   ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.StandardDeviation.GDS.Is_Bulish ||
                                   ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.Pitchfork.GDS.Is_Bulish         ||
//---
                                   ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Fibos.Retracement.GDS.Is_Bulish          ||
                                   ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Fibos.Expansion.GDS.Is_Bulish            ||
                                   ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Fibos.Channel.GDS.Is_Bulish              ||
                                   ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Fibos.TimeZone.GDS.Is_Bulish             ||
                                   ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Fibos.Fan.GDS.Is_Bulish                  ||
                                   ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Fibos.Arc.GDS.Is_Bulish;
//---
          Is_Buy  = (Is_All_Any_Bulish)  ? true : false;
          Is_Sell = (!Is_All_Any_Bulish) ? true : false;
          return true;
//---
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
struct St_Trade_Signals_FiboExtention : public St_Trade_Signals_base
{         bool          IsFiboTrendUp;


          bool          Is_Bulish;
          double        tp1, tp2, tp3,    sl,     startPrice       ;
          bool          Is_CrossSL;
          bool          Is_CrossTp1,    Is_CrossTp2,    Is_CrossTp3;
          bool          Update();/// {                     return true;};


};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool St_Trade_Signals_FiboExtention::Update()
{
//---
          Is_Bulish = ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Fibos.Expansion.GDS.Is_Bulish;
          sl        = ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Fibos.Expansion._Periods._CURRENT._Signal.sl;
//---
          Is_CrossTp1 = Is_CrossTp2 = Is_CrossTp3 = Is_CrossSL = false;
//---
          if(Is_Bulish)
          {         Is_CrossTp1 = ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Fibos.Expansion._Periods._CURRENT._Signal.tp1 < Close[0];
                    Is_CrossTp2 = ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Fibos.Expansion._Periods._CURRENT._Signal.tp2 < Close[0];
                    Is_CrossTp3 = ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Fibos.Expansion._Periods._CURRENT._Signal.tp3 < Close[0];//
                    Is_CrossSL  = ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Fibos.Expansion._Periods._CURRENT._Signal.sl  > Close[0];//
          }
          else
          {         Is_CrossTp1 = ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Fibos.Expansion._Periods._CURRENT._Signal.tp1 > Close[0];
                    Is_CrossTp2 = ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Fibos.Expansion._Periods._CURRENT._Signal.tp2 > Close[0];
                    Is_CrossTp3 = ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Fibos.Expansion._Periods._CURRENT._Signal.tp3 > Close[0];//
                    Is_CrossSL  = ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Fibos.Expansion._Periods._CURRENT._Signal.sl  < Close[0];//
          }
//---
          Is_Buy  = (Is_Bulish)  ? true : false;
          Is_Sell = (!Is_Bulish) ? true : false;
          return true;
//---
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
struct St_Trade_Signals_Trend_EMA : public St_Trade_Signals_base
{         //---

          bool                  Is_GoneUP_Buy_UT_Cross_C;      ///---UpTrend
          bool                  Is_GoneUP_Buy_UT_Cross_A;
          bool                  Is_GoneUP_Buy_UT_M_Cross_C;
          bool                  Is_GoneUP_Buy_DT_Cross_A;
          bool                  Is_GoneUP_Buy_DT_Cross_B;

          //---
          bool                  Is_GoneDown_Sell_DT_Cross_C;   ///---DownTrend
          bool                  Is_GoneDown_Sell_DT_Cross_A;
          bool                  Is_GoneDown_Sell_DT_M_Cross_C;
          bool                  Is_GoneDown_Sell_UT_Cross_A;
          bool                  Is_GoneDown_Sell_UT_Cross_B;//
          //---
          bool       Update()
          {         Is_GoneUP_Buy_UT_Cross_C      = ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA._Data.IsCross_Up_MAFast_MASlow            &&
                                                    ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA._Data.IsCross_Up_MA200_MA500              &&
                                                    ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR.IsWpR20_CrossUp_200                &&
                                                    ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR.IsWpR_200_UpTrend                  &&
                                                    ct_Drive.TDD.ct_Conductor.DC_data.Indicators._RSI.IsRSI_14_UpTrend;
//---
                    Is_GoneUP_Buy_UT_Cross_A      = ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA._Data.IsCross_Up_MAFast_MASlow            &&
                                                    ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA._Data.IsCross_Up_MA200_MA500              &&
                                                    !ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA._Data.ISCross_Up_EMA_Slow1X_EMA500       &&
                                                    ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR.IsWpR20_CrossUp_200                &&
                                                    ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR.IsWpR_200_UpTrend                  &&
                                                    ct_Drive.TDD.ct_Conductor.DC_data.Indicators._RSI.IsRSI_14_UpTrend;
//---
                    Is_GoneUP_Buy_UT_M_Cross_C    = ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA._Data.IsCross_Up_MAFast_MASlow            &&
                                                    ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA._Data.IsCross_Up_MA200_MA500              &&
                                                    ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA._Data.ISCross_Up_EMA_Slow1X_EMA500        &&
                                                    ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR.IsWpR20_CrossUp_200                &&
                                                    ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR.IsWpR_200_UpTrend                  &&
                                                    ct_Drive.TDD.ct_Conductor.DC_data.Indicators._RSI.IsRSI_14_UpTrend;
//---
                    Is_GoneUP_Buy_DT_Cross_A      = ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA._Data.IsCross_Up_MAFast_MASlow            &&
                                                    !ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA._Data.IsCross_Up_MA200_MA500             &&
                                                    ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR.IsWpR20_CrossUp_200                &&
                                                    ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR.IsWpR_200_UpTrend                  &&
                                                    ct_Drive.TDD.ct_Conductor.DC_data.Indicators._RSI.IsRSI_14_UpTrend;
//---
                    Is_GoneUP_Buy_DT_Cross_B      = ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA._Data.IsCross_Up_MAFast_MASlow            &&
                                                    !ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA._Data.IsCross_Up_MA200_MA500             &&
                                                    ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA._Data.ISCross_Up_EMA_Slow1X_EMA500        &&
                                                    ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR.IsWpR20_CrossUp_200                &&
                                                    ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR.IsWpR_200_UpTrend                  &&
                                                    ct_Drive.TDD.ct_Conductor.DC_data.Indicators._RSI.IsRSI_14_UpTrend;
//---
//----------------------------------------------------------------------------
//---
                    Is_GoneDown_Sell_DT_Cross_C   = !ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA._Data.IsCross_Up_MAFast_MASlow &&
                                                    !ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA._Data.IsCross_Up_MA200_MA500             &&
                                                    !ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR.IsWpR20_CrossUp_200               &&
                                                    !ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR.IsWpR_200_UpTrend                 &&
                                                    !ct_Drive.TDD.ct_Conductor.DC_data.Indicators._RSI.IsRSI_14_UpTrend;
//---
                    Is_GoneDown_Sell_DT_Cross_A   = !ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA._Data.IsCross_Up_MAFast_MASlow           &&
                                                    !ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA._Data.IsCross_Up_MA200_MA500             &&
                                                    ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA._Data.ISCross_Up_EMA_Slow1X_EMA500        &&
                                                    !ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR.IsWpR20_CrossUp_200               &&
                                                    !ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR.IsWpR_200_UpTrend                 &&
                                                    !ct_Drive.TDD.ct_Conductor.DC_data.Indicators._RSI.IsRSI_14_UpTrend;
//---
                    Is_GoneDown_Sell_DT_M_Cross_C = !ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA._Data.IsCross_Up_MAFast_MASlow           &&
                                                    !ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA._Data.IsCross_Up_MA200_MA500             &&
                                                    !ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA._Data.ISCross_Up_EMA_Slow1X_EMA500       &&
                                                    !ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR.IsWpR20_CrossUp_200               &&
                                                    !ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR.IsWpR_200_UpTrend                 &&
                                                    !ct_Drive.TDD.ct_Conductor.DC_data.Indicators._RSI.IsRSI_14_UpTrend;
//---
                    Is_GoneDown_Sell_UT_Cross_A   = !ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA._Data.IsCross_Up_MAFast_MASlow           &&
                                                    ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA._Data.IsCross_Up_MA200_MA500              &&
                                                    !ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR.IsWpR20_CrossUp_200               &&
                                                    !ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR.IsWpR_200_UpTrend                 &&
                                                    !ct_Drive.TDD.ct_Conductor.DC_data.Indicators._RSI.IsRSI_14_UpTrend;
//---
                    Is_GoneDown_Sell_UT_Cross_B   = !ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA._Data.IsCross_Up_MAFast_MASlow           &&
                                                    ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA._Data.IsCross_Up_MA200_MA500              &&
                                                    !ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA._Data.ISCross_Up_EMA_Slow1X_EMA500       &&
                                                    !ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR.IsWpR20_CrossUp_200               &&
                                                    !ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR.IsWpR_200_UpTrend                 &&
                                                    !ct_Drive.TDD.ct_Conductor.DC_data.Indicators._RSI.IsRSI_14_UpTrend; //
                    //---
                    Is_GoneUP_Buy_UT_Cross_C            ?       ct_Drive.TDD.ct_Conductor.DC_data.Avrage_Percent_Deal += 30 :  ct_Drive.TDD.ct_Conductor.DC_data.Avrage_Percent_Deal -= 30;
                    Is_GoneUP_Buy_UT_Cross_A            ?       ct_Drive.TDD.ct_Conductor.DC_data.Avrage_Percent_Deal += 30 :  ct_Drive.TDD.ct_Conductor.DC_data.Avrage_Percent_Deal -= 30;
                    Is_GoneUP_Buy_UT_M_Cross_C          ?       ct_Drive.TDD.ct_Conductor.DC_data.Avrage_Percent_Deal += 30 :  ct_Drive.TDD.ct_Conductor.DC_data.Avrage_Percent_Deal -= 30;
                    Is_GoneUP_Buy_DT_Cross_A            ?       ct_Drive.TDD.ct_Conductor.DC_data.Avrage_Percent_Deal += 30 :  ct_Drive.TDD.ct_Conductor.DC_data.Avrage_Percent_Deal -= 30;
                    Is_GoneUP_Buy_DT_Cross_B            ?       ct_Drive.TDD.ct_Conductor.DC_data.Avrage_Percent_Deal += 30 :  ct_Drive.TDD.ct_Conductor.DC_data.Avrage_Percent_Deal -= 30;
                    //---
                    Is_GoneDown_Sell_DT_Cross_C         ?       ct_Drive.TDD.ct_Conductor.DC_data.Avrage_Percent_Deal -= 30 :  ct_Drive.TDD.ct_Conductor.DC_data.Avrage_Percent_Deal += 30;
                    Is_GoneDown_Sell_DT_Cross_A         ?       ct_Drive.TDD.ct_Conductor.DC_data.Avrage_Percent_Deal -= 30 :  ct_Drive.TDD.ct_Conductor.DC_data.Avrage_Percent_Deal += 30;
                    Is_GoneDown_Sell_DT_M_Cross_C       ?       ct_Drive.TDD.ct_Conductor.DC_data.Avrage_Percent_Deal -= 30 :  ct_Drive.TDD.ct_Conductor.DC_data.Avrage_Percent_Deal += 30;
                    Is_GoneDown_Sell_UT_Cross_A         ?       ct_Drive.TDD.ct_Conductor.DC_data.Avrage_Percent_Deal -= 30 :  ct_Drive.TDD.ct_Conductor.DC_data.Avrage_Percent_Deal += 30;
                    Is_GoneDown_Sell_UT_Cross_B         ?       ct_Drive.TDD.ct_Conductor.DC_data.Avrage_Percent_Deal -= 30 :  ct_Drive.TDD.ct_Conductor.DC_data.Avrage_Percent_Deal += 30;
//
//
//---
                    Is_Buy  = (Is_GoneUP_Buy_UT_Cross_C    || Is_GoneUP_Buy_UT_Cross_A)  ? true : false;
                    Is_Sell = (Is_GoneDown_Sell_DT_Cross_C || Is_GoneDown_Sell_DT_Cross_A) ? true : false;
                    return true; //
          };


};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
struct St_Trade_Signals_Trend_Line : public St_Trade_Signals_base
{

          bool       Update() {                     return true;};


};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
struct St_Trade_Signals_Pattern_Candlestick_2 : public St_Trade_Signals_base
{         bool       Is_Engulfing_bullish;
          bool       Is_Engulfing_bearish;
          bool       Is_InSideBar_Bulish;
          bool       Is_InSideBar_bearish;
          bool       Update(); // {                     return true;};


};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool St_Trade_Signals_Pattern_Candlestick_2::Update()
{         //---
          Is_Engulfing_bullish  = ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_Current[0].Bar_Pattern.Inside_Engulfing_Bar.Is_Engulfing_bullish  ;
          Is_Engulfing_bearish  = ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_Current[0].Bar_Pattern.Inside_Engulfing_Bar.Is_Engulfing_bearish  ;
//---
          Is_InSideBar_Bulish   = ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_Current[0].Bar_Pattern.Inside_Engulfing_Bar.Is_InSideBar_Bulish   ;
          Is_InSideBar_bearish  = ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_Current[0].Bar_Pattern.Inside_Engulfing_Bar.Is_InSideBar_bearish  ;
//---
          Is_Buy  = (Is_Engulfing_bullish || Is_InSideBar_Bulish)  ? true : false;
          Is_Sell = (Is_Engulfing_bearish || Is_InSideBar_bearish) ? true : false;
          return true;
//---
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
struct St_Trade_Signals_Pattern_Candlestick_3 : public St_Trade_Signals_base
{         //---
          //---the flags
          bool          Is_Pattern_All_Any_Bullish;
          bool          Is_Pattern_All_Any_Bearish;
          //---
          bool          Is_Pattern_ThreeBlackCrows;
          bool          Is_Pattern_ThreeWhiteSoldiers;

          bool          Is_Pattern_DarkCloudCover;
          bool          Is_Pattern_PiercingLine;

          bool          Is_Pattern_MorningDoji;
          bool          Is_Pattern_EveningDoji;

          bool          Is_Pattern_Bearish_Engulfing;
          bool          Is_Pattern_Bullish_Engulfing;

          bool          Is_Pattern_EveningStar;
          bool          Is_Pattern_MorningStar;

          bool          Is_Pattern_Hammer;
          bool          Is_Pattern_HangingMan;

          bool          Is_Pattern_Bearish_Harami;
          bool          Is_Pattern_Bullish_Harami;

          bool          Is_Pattern_Bearish_MeetingLines;
          bool          Is_Pattern_Bullish_MeetingLines;

          bool          Update();// {                     return true;};


};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool St_Trade_Signals_Pattern_Candlestick_3::Update()
{         //---
          Is_Pattern_All_Any_Bullish            = ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_Current[0].Bar_Pattern.There_bar.Is_Pattern_All_Any_Bullish;
          Is_Pattern_All_Any_Bearish            = ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_Current[0].Bar_Pattern.There_bar.Is_Pattern_All_Any_Bearish ;
//---
          Is_Pattern_ThreeBlackCrows            = ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_Current[0].Bar_Pattern.There_bar.Is_Pattern_ThreeBlackCrows;
          Is_Pattern_ThreeWhiteSoldiers         = ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_Current[0].Bar_Pattern.There_bar.Is_Pattern_ThreeWhiteSoldiers;
//---
          Is_Pattern_DarkCloudCover             = ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_Current[0].Bar_Pattern.There_bar.Is_Pattern_DarkCloudCover;
          Is_Pattern_PiercingLine               = ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_Current[0].Bar_Pattern.There_bar.Is_Pattern_PiercingLine;
//---
          Is_Pattern_MorningDoji                = ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_Current[0].Bar_Pattern.There_bar.Is_Pattern_MorningDoji;
          Is_Pattern_EveningDoji                = ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_Current[0].Bar_Pattern.There_bar.Is_Pattern_EveningDoji;
//---
          Is_Pattern_Bearish_Engulfing          = ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_Current[0].Bar_Pattern.There_bar.Is_Pattern_BearishEngulfing;
          Is_Pattern_Bullish_Engulfing          = ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_Current[0].Bar_Pattern.There_bar.Is_Pattern_BullishEngulfing;
//---
          Is_Pattern_Hammer                     = ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_Current[0].Bar_Pattern.There_bar.Is_Pattern_Hammer;
          Is_Pattern_HangingMan                 = ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_Current[0].Bar_Pattern.There_bar.Is_Pattern_HangingMan;
//---
          Is_Pattern_Bearish_Harami             = ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_Current[0].Bar_Pattern.There_bar.Is_Pattern_BearishHarami;
          Is_Pattern_Bullish_Harami             = ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_Current[0].Bar_Pattern.There_bar.Is_Pattern_BullishHarami;
//---
          Is_Pattern_Bearish_MeetingLines       = ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_Current[0].Bar_Pattern.There_bar.Is_Pattern_BearishMeetingLines;
          Is_Pattern_Bullish_MeetingLines       = ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_Current[0].Bar_Pattern.There_bar.Is_Pattern_BullishMeetingLines;
//---
          Is_Buy  = (Is_Pattern_ThreeWhiteSoldiers || Is_Pattern_PiercingLine   || Is_Pattern_EveningDoji || Is_Pattern_Bullish_Engulfing || Is_Pattern_HangingMan || Is_Pattern_Bullish_Harami || Is_Pattern_Bullish_MeetingLines) ? true : false;
          Is_Sell = (Is_Pattern_ThreeBlackCrows    || Is_Pattern_DarkCloudCover || Is_Pattern_MorningDoji || Is_Pattern_Bearish_Engulfing || Is_Pattern_Hammer     || Is_Pattern_Bearish_Harami || Is_Pattern_Bearish_MeetingLines) ? true : false;
//---
          Is_Buy  = (Is_Pattern_All_Any_Bullish) ? true : false;
          Is_Sell = (Is_Pattern_All_Any_Bearish) ? true : false;
          return true;
//---
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
struct St_Trade_Signals_Harmonics : public St_Trade_Signals_base
{         //---the flags
          bool       Is_ABCD,         Is_ABCD_Is_Bulish;
          bool       Is_Butterfly,    Is_Butterfly_Is_Bulish;
          bool       Is_Bat,          Is_Bat_Is_Bulish;
          bool       Is_Crab,         Is_Crab_Is_Bulish;
          bool       Is_Cypher,       Is_Cypher_Is_Bulish;
          bool       Is_Gartley,      Is_Gartley_Is_Bulish;
          bool       Is_Shark,        Is_Shark_Is_Bulish;
          bool       Is_3Drives,      Is_3Drives_Is_Bulish;
          bool       Is_5Drives,      Is_5Drives_Is_Bulish;

          bool       Update();// {                     return true;};
          //---

};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool St_Trade_Signals_Harmonics::Update()
{
//---
          Is_ABCD                       = ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_Current[0].Bar_Pattern.Harmonic_Bar.Harmonic__ABCD.Is_ABCD;
          Is_ABCD_Is_Bulish             = ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_Current[0].Bar_Pattern.Harmonic_Bar.Harmonic__ABCD.Is_Bulish;
//--
          Is_Butterfly                  = ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_Current[0].Bar_Pattern.Harmonic_Bar.Harmonic__Butterfly.Is_Butterfly;
          Is_Butterfly_Is_Bulish        = ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_Current[0].Bar_Pattern.Harmonic_Bar.Harmonic__Butterfly.Is_Bulish;
//--
          Is_Bat                        = ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_Current[0].Bar_Pattern.Harmonic_Bar.Harmonic__Bat.Is_Bat;
          Is_Bat_Is_Bulish              = ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_Current[0].Bar_Pattern.Harmonic_Bar.Harmonic__Bat.Is_Bulish;
//--
          Is_Crab                       = ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_Current[0].Bar_Pattern.Harmonic_Bar.Harmonic__Crab .Is_Crab ;
          Is_Crab_Is_Bulish             = ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_Current[0].Bar_Pattern.Harmonic_Bar.Harmonic__Crab .Is_Bulish;
//--
          Is_Cypher                     = ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_Current[0].Bar_Pattern.Harmonic_Bar.Harmonic__Cypher.Is_Cypher;
          Is_Cypher_Is_Bulish           = ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_Current[0].Bar_Pattern.Harmonic_Bar.Harmonic__Cypher.Is_Bulish;
//--
          Is_Gartley                    = ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_Current[0].Bar_Pattern.Harmonic_Bar.Harmonic__Gartley.Is_Gartley;
          Is_Gartley_Is_Bulish          = ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_Current[0].Bar_Pattern.Harmonic_Bar.Harmonic__Gartley.Is_Bulish;
//--
          Is_Shark                      = ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_Current[0].Bar_Pattern.Harmonic_Bar.Harmonic__Shark.Is_Shark;
          Is_Shark_Is_Bulish            = ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_Current[0].Bar_Pattern.Harmonic_Bar.Harmonic__Shark.Is_Bulish;
//--
          Is_3Drives                    = ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_Current[0].Bar_Pattern.Harmonic_Bar.Harmonic__3Drives.Is_3Drives;
          Is_3Drives_Is_Bulish          = ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_Current[0].Bar_Pattern.Harmonic_Bar.Harmonic__3Drives.Is_Bulish;
//--
          Is_5Drives                    = ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_Current[0].Bar_Pattern.Harmonic_Bar.Harmonic__5Drives.Is_5Drives;
          Is_5Drives_Is_Bulish          = ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_Current[0].Bar_Pattern.Harmonic_Bar.Harmonic__5Drives.Is_Bulish;
//--
//---
          Is_Buy  = ((Is_ABCD && Is_ABCD_Is_Bulish)  || (Is_Butterfly && Is_Butterfly_Is_Bulish)   || (Is_Bat && Is_Bat_Is_Bulish)   || (Is_Crab && Is_Crab_Is_Bulish)   || (Is_Cypher && Is_Cypher_Is_Bulish)   || (Is_Gartley && Is_Gartley_Is_Bulish)  || (Is_Shark && Is_Shark_Is_Bulish)  || (Is_3Drives && Is_3Drives_Is_Bulish) || (Is_5Drives && Is_5Drives_Is_Bulish)) ? true : false;
          Is_Sell = ((Is_ABCD && !Is_ABCD_Is_Bulish) || (Is_Butterfly && !Is_Butterfly_Is_Bulish)  || (Is_Bat && !Is_Bat_Is_Bulish)  || (Is_Crab && !Is_Crab_Is_Bulish)  || (Is_Cypher && !Is_Cypher_Is_Bulish)  || (Is_Gartley && !Is_Gartley_Is_Bulish) || (Is_Shark && !Is_Shark_Is_Bulish) || (Is_3Drives && !Is_3Drives_Is_Bulish) || (Is_5Drives && !Is_5Drives_Is_Bulish)) ? true : false;
//---
//Is_Buy  = (Is_Pattern_All_Any_Bullish) ? true : false;
//Is_Sell = (Is_Pattern_All_Any_Bearish) ? true : false;
          return true;
//---
//---
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
struct St_Trade_Signals_FiboRS : public St_Trade_Signals_base
{
//---the flags

          bool       Update() {                     return true;};

};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
struct St_Trade_Signals_BarShadow : public St_Trade_Signals_base
{         //the flags
          int           Highest_Shadow_InRange_Place;
          double        _Value;
          //---
          bool       IsShadow_All_Support_Sell;
          bool       IsShadow_All_Support_Buy;
          //
          bool       IsShadow_All_Support_Sell__Fast;
          bool       IsShadow_All_Support_Buy__Fast;
          //
          bool       IsShadow_All_Support_Sell__Middle;
          bool       IsShadow_All_Support_Buy__Middle;
          //
          bool       IsShadow_All_Support_Sell__Slow;
          bool       IsShadow_All_Support_Buy__Slow;
          bool       Update();// {                     return true;};

};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool St_Trade_Signals_BarShadow::Update()
{         //--
          IsShadow_All_Support_Sell             = ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_Current[0].Bar_shadow.ShadowHigh.Is_Range_High     || ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_Current[0].Bar_shadow.ShadowHigh.Is_Range_ExrtraHigh ||
//
                                                  ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M1[0].Bar_shadow.ShadowHigh.Is_Range_High          || ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M1[0].Bar_shadow.ShadowHigh.Is_Range_ExrtraHigh ||
                                                  ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[0].Bar_shadow.ShadowHigh.Is_Range_High          || ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[0].Bar_shadow.ShadowHigh.Is_Range_ExrtraHigh ||
                                                  ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M15[0].Bar_shadow.ShadowHigh.Is_Range_High         || ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M15[0].Bar_shadow.ShadowHigh.Is_Range_ExrtraHigh ||
//
                                                  ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M30[0].Bar_shadow.ShadowHigh.Is_Range_High         || ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M30[0].Bar_shadow.ShadowHigh.Is_Range_ExrtraHigh ||
                                                  ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_H1[0].Bar_shadow.ShadowHigh.Is_Range_High          || ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_H1[0].Bar_shadow.ShadowHigh.Is_Range_ExrtraHigh ||
                                                  ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_H4[0].Bar_shadow.ShadowHigh.Is_Range_High          || ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_H4[0].Bar_shadow.ShadowHigh.Is_Range_ExrtraHigh ||
//
                                                  ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_D1[0].Bar_shadow.ShadowHigh.Is_Range_High          || ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_D1[0].Bar_shadow.ShadowHigh.Is_Range_ExrtraHigh ||
                                                  ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_W1[0].Bar_shadow.ShadowHigh.Is_Range_High          || ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_W1[0].Bar_shadow.ShadowHigh.Is_Range_ExrtraHigh ||
                                                  ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_MN1[0].Bar_shadow.ShadowHigh.Is_Range_High         || ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_MN1[0].Bar_shadow.ShadowHigh.Is_Range_ExrtraHigh;
//---
          IsShadow_All_Support_Buy              = ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_Current[0].Bar_shadow.ShadowLow.Is_Range_High      || ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_Current[0].Bar_shadow.ShadowLow.Is_Range_ExrtraHigh ||
//
                                                  ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M1[0].Bar_shadow.ShadowLow.Is_Range_High           || ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M1[0].Bar_shadow.ShadowLow.Is_Range_ExrtraHigh ||
                                                  ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[0].Bar_shadow.ShadowLow.Is_Range_High           || ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[0].Bar_shadow.ShadowLow.Is_Range_ExrtraHigh ||
                                                  ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M15[0].Bar_shadow.ShadowLow.Is_Range_High          || ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M15[0].Bar_shadow.ShadowLow.Is_Range_ExrtraHigh ||
//
                                                  ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M30[0].Bar_shadow.ShadowLow.Is_Range_High          || ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M30[0].Bar_shadow.ShadowLow.Is_Range_ExrtraHigh ||
                                                  ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_H1[0].Bar_shadow.ShadowLow.Is_Range_High           || ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_H1[0].Bar_shadow.ShadowLow.Is_Range_ExrtraHigh ||
                                                  ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_H4[0].Bar_shadow.ShadowLow.Is_Range_High           || ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_H4[0].Bar_shadow.ShadowLow.Is_Range_ExrtraHigh ||
//
                                                  ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_D1[0].Bar_shadow.ShadowLow.Is_Range_High           || ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_D1[0].Bar_shadow.ShadowLow.Is_Range_ExrtraHigh ||
                                                  ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_W1[0].Bar_shadow.ShadowLow.Is_Range_High           || ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_W1[0].Bar_shadow.ShadowLow.Is_Range_ExrtraHigh ||
                                                  ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_MN1[0].Bar_shadow.ShadowLow.Is_Range_High          || ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_MN1[0].Bar_shadow.ShadowLow.Is_Range_ExrtraHigh;
//-----
          IsShadow_All_Support_Sell__Fast       = ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M1[0].Bar_shadow.ShadowHigh.Is_Range_High          || ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M1[0].Bar_shadow.ShadowHigh.Is_Range_ExrtraHigh ||
                                                  ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[0].Bar_shadow.ShadowHigh.Is_Range_High          || ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[0].Bar_shadow.ShadowHigh.Is_Range_ExrtraHigh ||
                                                  ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M15[0].Bar_shadow.ShadowHigh.Is_Range_High         || ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M15[0].Bar_shadow.ShadowHigh.Is_Range_ExrtraHigh ;
//---
          IsShadow_All_Support_Buy__Fast        = ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M1[0].Bar_shadow.ShadowLow.Is_Range_High           || ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M1[0].Bar_shadow.ShadowLow.Is_Range_ExrtraHigh ||
                                                  ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[0].Bar_shadow.ShadowLow.Is_Range_High           || ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[0].Bar_shadow.ShadowLow.Is_Range_ExrtraHigh ||
                                                  ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M15[0].Bar_shadow.ShadowLow.Is_Range_High          || ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M15[0].Bar_shadow.ShadowLow.Is_Range_ExrtraHigh ;
//
          IsShadow_All_Support_Sell__Middle     = ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M30[0].Bar_shadow.ShadowHigh.Is_Range_High         || ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M30[0].Bar_shadow.ShadowHigh.Is_Range_ExrtraHigh ||
                                                  ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_H1[0].Bar_shadow.ShadowHigh.Is_Range_High          || ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_H1[0].Bar_shadow.ShadowHigh.Is_Range_ExrtraHigh ||
                                                  ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_H4[0].Bar_shadow.ShadowHigh.Is_Range_High          || ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_H4[0].Bar_shadow.ShadowHigh.Is_Range_ExrtraHigh;
//--
          IsShadow_All_Support_Buy__Middle      = ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M30[0].Bar_shadow.ShadowLow.Is_Range_High          || ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M30[0].Bar_shadow.ShadowLow.Is_Range_ExrtraHigh ||
                                                  ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_H1[0].Bar_shadow.ShadowLow.Is_Range_High           || ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_H1[0].Bar_shadow.ShadowLow.Is_Range_ExrtraHigh ||
                                                  ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_H4[0].Bar_shadow.ShadowLow.Is_Range_High           || ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_H4[0].Bar_shadow.ShadowLow.Is_Range_ExrtraHigh;
//
          IsShadow_All_Support_Sell__Slow       = ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_D1[0].Bar_shadow.ShadowHigh.Is_Range_High          || ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_D1[0].Bar_shadow.ShadowHigh.Is_Range_ExrtraHigh ||
                                                  ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_W1[0].Bar_shadow.ShadowHigh.Is_Range_High          || ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_W1[0].Bar_shadow.ShadowHigh.Is_Range_ExrtraHigh ||
                                                  ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_MN1[0].Bar_shadow.ShadowHigh.Is_Range_High         || ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_MN1[0].Bar_shadow.ShadowHigh.Is_Range_ExrtraHigh;
//---
          IsShadow_All_Support_Buy__Slow        = ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_D1[0].Bar_shadow.ShadowLow.Is_Range_High           || ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_D1[0].Bar_shadow.ShadowLow.Is_Range_ExrtraHigh ||
                                                  ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_W1[0].Bar_shadow.ShadowLow.Is_Range_High           || ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_W1[0].Bar_shadow.ShadowLow.Is_Range_ExrtraHigh ||
                                                  ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_MN1[0].Bar_shadow.ShadowLow.Is_Range_High          || ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_MN1[0].Bar_shadow.ShadowLow.Is_Range_ExrtraHigh;
//---
          Is_Buy  = (IsShadow_All_Support_Sell) ? true : false;
          Is_Sell = (IsShadow_All_Support_Buy)  ? true : false;
//---
          return true;
//---
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
struct St_Trade_Signals_DealsForce_Deal_data
{         //---the flags
          bool                  Is__none;
          bool                  Is__normal;
          bool                  Is__High;
          bool                  Is__UltraHigh;
          bool                  Is__ExrtraHigh;

};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
struct St_Trade_Signals_DealsForce_Deal
{         //---the flags
          St_Trade_Signals_DealsForce_Deal_data         Buy, Sell;

};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
struct St_Trade_Signals_DealsForce : public St_Trade_Signals_base
{         //
          double                                force_of_deals;                 //4.00 3.00 2.00 1.00 0.00  -1.00 -2.00 -3.00 -4.00
          St_Trade_Signals_DealsForce_Deal      _Deal;

          bool          Update(St_Trade_Signals_BarShadow &m)
          {         _Deal.Buy.Is__UltraHigh    = m.IsShadow_All_Support_Sell__Fast;
                    _Deal.Sell.Is__UltraHigh   = m.IsShadow_All_Support_Buy__Fast; //
                    //---
                    return true; //
          };

};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
struct Stc_Trade_ConceptLogic
{         //---the flags
          bool       Is_FiboExtention;               // ( last 200 bar) ( current ) ( tp1)
          bool       Is_Trend_EMA;                   // (EMA) (500) (Level + 5$) (forwarding)
          bool       Is_Trend_Line;                  // (LINE) (200 bar);
          bool       Is_Pattern_Candlestick_2;       // (candlestick)(3 bar) ( current )
          bool       Is_Pattern_Candlestick_3;       // (candlestick)(2 bar) ( current )
          bool       Is_Pattern_Harmonics;           // (harmonics)(200 bar) ( current )
          bool       Is_FiboRS;                      // (200 bar); ( current )
          //--
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
struct Stc_Trade_Keep
{         //---the flags
          bool  Is_Long;
          bool  Is_Short;
          //---
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
struct Stc_Trade_Chance
{         //---the flags
          int        Win;
          int        Loss;
          //---
          int        Sell;
          int        Buy;
          //---
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
struct St_Trade_Signals_Risk
{         //---the flags
          //---Extern_data__EMA Channals
          Stcd_Trade_Condition_Risk_Whatch      _Risk_Whatch, _Risk_Whatch_5_Dolar, _Risk_Whatch_13_Dolar;
          void                                  Get_Risk_Whatch_EMA_Channals();  //---ema channals
          void                                  Update();

};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void St_Trade_Signals_Risk::Update()
{         //---
          Get_Risk_Whatch_EMA_Channals();
//---
}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void St_Trade_Signals_Risk::Get_Risk_Whatch_EMA_Channals()
{         //---
//---
//---
          {         int    Bar_Number_High_In_200                 = iHighest(NULL, 0, MODE_HIGH, 200);
                    int    Bar_Number_Low_In_200                  = iLowest(NULL, 0, MODE_LOW, 200);
                    double Bar_Value_Highest_High_In_200          = iHigh(NULL, 0, Bar_Number_High_In_200);
                    double Bar_Value_Lowest_Low_In_200            = iLow(NULL, 0, Bar_Number_Low_In_200) ;
                    //---
                    bool   Is_Highest_In_Middle                   =  0;
                    bool   Is_Highest_In_Right                    =  0;
                    bool   Is_Highest_In_RightMiddle              =  0;
                    bool   Is_Highest_In_Left                     =  0;
                    bool   Is_Highest_In_LeftMiddle               =  0;
                    //---
                    bool   Is_Lowest_In_Middle                    =  0;
                    bool   Is_Lowest_In_Right                     =  0;
                    bool   Is_Lowest_In_RightMiddle               =  0;
                    bool   Is_Lowest_In_Left                      =  0;
                    bool   Is_Lowest_In_LeftMiddle                =  0;
                    //---
                    //---
                    //---
                    //--- every variable need to adjusting
                    {         _Risk_Whatch.Is_Price_Cross_EMA500_Level_5_Posetive                               = ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA.EMA500_Close._CURRENT._Price._Close_Level.Level[2].Posetive < Close[0];
                              _Risk_Whatch.Is_Price_Cross_EMA500_Level_5_Negative                               = ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA.EMA500_Close._CURRENT._Price._Close_Level.Level[2].Negative > Close[0];//---is cross
                              _Risk_Whatch.Is_Price_BetweenEMA500_Level_5_Posetive_Negative                     = !_Risk_Whatch.Is_Price_Cross_EMA500_Level_5_Posetive && !_Risk_Whatch.Is_Price_Cross_EMA500_Level_5_Negative;
                              //---
                              _Risk_Whatch.Is_Price_Cross_EMA500_Level_5_Posetive_Touched_In_200Bar             = Bar_Value_Highest_High_In_200 > ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA.EMA500_Close._CURRENT._Price._Close_Level.Level[2].Posetive; //---on progress
                              _Risk_Whatch.Is_Price_Cross_EMA500_Level_5_Negative_Touched_In_200Bar             = Bar_Value_Lowest_Low_In_200  < ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA.EMA500_Close._CURRENT._Price._Close_Level.Level[2].Negative;;///
                    }
                    //--- as solid object can naming for doing action ... name change its action.. no need class adjusting... for any variable...
                    {         _Risk_Whatch_5_Dolar.Is_Price_Cross_EMA500_Level_X_Posetive                       = (ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA.EMA500_Close._CURRENT._Value + (500 * Point)) < Close[0];
                              _Risk_Whatch_5_Dolar.Is_Price_Cross_EMA500_Level_X_Negative                       = (ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA.EMA500_Close._CURRENT._Value - (500 * Point)) > Close[0];//---is cross
                              _Risk_Whatch_5_Dolar.Is_Price_BetweenEMA500_Level_X_Posetive_Negative             = !_Risk_Whatch_5_Dolar.Is_Price_Cross_EMA500_Level_X_Posetive && !_Risk_Whatch_5_Dolar.Is_Price_Cross_EMA500_Level_X_Negative;
                              //---
                              _Risk_Whatch_5_Dolar.Is_Price_Cross_EMA500_Level_X_Posetive_Touched_In_200Bar     = 0; //---on progress
                              _Risk_Whatch_5_Dolar.Is_Price_Cross_EMA500_Level_X_Posetive_Touched_In_200Bar     = 0;///
                    }
                    {         _Risk_Whatch_13_Dolar.Is_Price_Cross_EMA500_Level_X_Posetive                      = (ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA.EMA500_Close._CURRENT._Value + (1300 * Point)) < Close[0];
                              _Risk_Whatch_13_Dolar.Is_Price_Cross_EMA500_Level_X_Negative                      = (ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA.EMA500_Close._CURRENT._Value - (1300 * Point)) > Close[0];//---is cross
                              _Risk_Whatch_13_Dolar.Is_Price_BetweenEMA500_Level_X_Posetive_Negative            = !_Risk_Whatch_13_Dolar.Is_Price_Cross_EMA500_Level_5_Posetive && !_Risk_Whatch_13_Dolar.Is_Price_Cross_EMA500_Level_X_Negative;
                              //---
                              _Risk_Whatch_13_Dolar.Is_Price_Cross_EMA500_Level_X_Posetive_Touched_In_200Bar    = 0; //---on progress
                              _Risk_Whatch_13_Dolar.Is_Price_Cross_EMA500_Level_X_Posetive_Touched_In_200Bar    = 0;///
                    }//
                    if(false)
                    {         Cat.say("_Risk_Whatch.Is_Price_Cross_EMA500_Level_5_Negative: " + (string)_Risk_Whatch.Is_Price_Cross_EMA500_Level_5_Negative);
                              Cat.say("Indicators._MA.EMA500_Close._Value + 500 * Point: " + DoubleToStr(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA.EMA500_Close._CURRENT._Value + (500 * Point), 2));
                              Cat.say("_Risk_Whatch.Is_Price_Cross_EMA500_Level_5_Posetive: " + (string)_Risk_Whatch.Is_Price_Cross_EMA500_Level_5_Posetive);
                              Cat.say("Close[0]: " + (string)Close[0]);
                              Cat.say("Indicators._MA.EMA500_Close._Value: " + DoubleToStr(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA.EMA500_Close._CURRENT._Value, 2));
                              Cat.say("_Risk_Whatch.Is_Price_BetweenEMA500_Level_5_Posetive_Negative : " + (string)_Risk_Whatch.Is_Price_BetweenEMA500_Level_5_Posetive_Negative);
                              Cat.say("_Risk_Whatch.Is_Price_Cross_EMA500_Level_5_Posetive_Touched_In_200Bar : " + (string)_Risk_Whatch.Is_Price_Cross_EMA500_Level_5_Posetive_Touched_In_200Bar + "  ---  " + DoubleToStr(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA.EMA500_Close._CURRENT._Price._Close_Level.Level[2].Posetive, 2) + "  ---Highest200:  " + DoubleToStr(Bar_Value_Highest_High_In_200, 2) + "  ---Highest200 BarNum:  " + (string)Bar_Number_Low_In_200 );
                              Cat.say("_Risk_Whatch.Is_Price_Cross_EMA500_Level_5_Negative_Touched_In_200Bar : " + (string)_Risk_Whatch.Is_Price_Cross_EMA500_Level_5_Negative_Touched_In_200Bar + "  ---  " + DoubleToStr(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA.EMA500_Close._CURRENT._Price._Close_Level.Level[2].Negative, 2) + "  ---Lowest200:  " + DoubleToStr(Bar_Value_Lowest_Low_In_200, 2) + "  ---Lowest200 BarNum:  " + (string)Bar_Number_High_In_200 );//
                    } //
          }//
//---
//---
//---
//---
}//
enum TradeRange
{         Long_Smal,
          Short_Smal,
          Long_Middle,
          Short_Middle,
          Long_High,
          Short_High,
//
};
TradeRange tradeRange;

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+Trade_Command
struct St_CondicatorData_Trade_Logic
{

          /*
                Collect all Conccept Condition in Itself           --Passage one of Conditon Determine
                Extern Condition Flags By Logic of each Concept    --Update Flag of each concept--
                For Trade Comment



          */

          void                          St_CondicatorData_Trade_Logic();
          void                          St_CondicatorData_Trade_Logic(TradeRange t);

          bool                          Update();
          //---
          Stc_Trade_Chance              chance;
          Stc_Trade_Keep                keep;
          Stc_Trade_ConceptLogic        conceptLogic;
          bool                          IsWinRate80;
          double                        WinRate;
          string                        Trade_Command_Desc;
          TradeRange                    _tradeRange;
          //---Plans
          //----



          //---conceptLogic Plans
          //---Chart Analise
          St_Trade_Signals_ChartAnalise                 _ChartAnalise;
          St_Trade_Signals_FiboExtention                _FiboExtention;
          St_Trade_Signals_Trend_Line                   _Trend_Line;
          ////---Indicators Analise
          St_Trade_Signals_IndicatorInfo                _IndicatorInfo ;
          St_Trade_Signals_Trend_EMA                    _Trend_EMA;
          ////---CandleBars Analise
          St_Trade_Signals_CandelsInfo                  _CandelsInfo;
          St_Trade_Signals_Pattern_Candlestick_2        _Candlestick_2;
          St_Trade_Signals_Pattern_Candlestick_3        _Candlestick_3;
          St_Trade_Signals_Harmonics                    _Harmonics;
          ////---Extra Analise
          St_Trade_Signals_FiboRS                       _FiboRS;
          St_Trade_Signals_BarShadow                    _BarShadow;
          St_Trade_Signals_DealsForce                   _DealsForce;
          //---
          St_Trade_Signals_Risk                         _Signals_Risk;
          //
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void St_CondicatorData_Trade_Logic::St_CondicatorData_Trade_Logic()
{         _tradeRange = tradeRange;
//---
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void St_CondicatorData_Trade_Logic::St_CondicatorData_Trade_Logic(TradeRange t)
{         _tradeRange = t;
//---
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool St_CondicatorData_Trade_Logic::Update()
{         //---
          if(!Detect_NewBar._M1.CBT__HalfMinute.Is_NewBar)return false;
          // Alert("Start-Stack error " + __FUNCTION__);
          //---Chart Analise
          {         //---ChartAnalise elements
                    _FiboExtention.Update();              if(_FiboExtention.Is_Buy)       { chance.Buy += 5; chance.Sell -= 5;  }  if(_FiboExtention.Is_Sell)     { chance.Buy -= 5; chance.Sell += 5; }
                    _Trend_Line.Update();                 if(_Trend_Line.Is_Buy)          { chance.Buy += 5; chance.Sell -= 5;  }  if(_Trend_Line.Is_Sell)        { chance.Buy -= 5; chance.Sell += 5; }//
                    _ChartAnalise.Update();               if(_ChartAnalise.Is_Buy)        { chance.Buy += 5; chance.Sell -= 5;  }  if(_ChartAnalise.Is_Sell)      { chance.Buy -= 5; chance.Sell += 5; }//
          }
          //---Indicators Analise
          {         //---Indicators Data
                    _IndicatorInfo.Update();              if(_IndicatorInfo.Is_Buy)       { chance.Buy += 5; chance.Sell -= 5;  }  if(_IndicatorInfo.Is_Sell)     { chance.Buy -= 5; chance.Sell += 5; }
                    //---Indicators Levels
                    _Trend_EMA.Update();                  if(_Trend_EMA.Is_Buy)           { chance.Buy += 5; chance.Sell -= 5;  }  if(_Trend_EMA.Is_Sell)         { chance.Buy -= 5; chance.Sell += 5; }//
          }
          //---CandleBars Analise
          {         //---CandleBars Data
                    _CandelsInfo.Update();                if(_CandelsInfo.Is_Buy)         { chance.Buy += 5; chance.Sell -= 5;  }  if(_CandelsInfo.Is_Sell)       { chance.Buy -= 5; chance.Sell += 5; }
                    //---CandleBars Pattern
                    _Candlestick_2.Update();              if(_Candlestick_2.Is_Buy)       { chance.Buy += 5; chance.Sell -= 5;  }  if(_Candlestick_2.Is_Sell)     { chance.Buy -= 5; chance.Sell += 5; } //---OK
                    _Candlestick_3.Update();              if(_Candlestick_3.Is_Buy)       { chance.Buy += 5; chance.Sell -= 5;  }  if(_Candlestick_3.Is_Sell)     { chance.Buy -= 5; chance.Sell += 5; } //---OK
                    _Harmonics.Update();                  if(_Harmonics.Is_Buy)           { chance.Buy += 5; chance.Sell -= 5;  }  if(_Harmonics.Is_Sell)         { chance.Buy -= 5; chance.Sell += 5; } //---OK
          }
          //---Extra Analise
          {         //---Extra
                    _FiboRS.Update();                     if(_FiboRS.Is_Buy)              { chance.Buy += 5; chance.Sell -= 5;  }  if(_FiboRS.Is_Sell)            { chance.Buy -= 5; chance.Sell += 5; }
                    _BarShadow.Update();                  if(_BarShadow.Is_Buy)           { chance.Buy += 5; chance.Sell -= 5;  }  if(_BarShadow.Is_Sell)         { chance.Buy -= 5; chance.Sell += 5; } //---OK
                    _DealsForce.Update(_BarShadow);       if(_DealsForce.Is_Buy)          { chance.Buy += 5; chance.Sell -= 5;  }  if(_FiboRS.Is_Sell)            { chance.Buy -= 5; chance.Sell += 5; }//
                    //
                    double DayOpen                         = iOpen(NULL, PERIOD_D1, 0);//-- GetOpen&Close
                    double DayClose                        = iClose(NULL, PERIOD_D1, 0);
                    double DayHigh                         = iHigh(NULL, PERIOD_D1, 0);//-- GetOpen&Close
                    double DayLow                          = iLow(NULL, PERIOD_D1, 0);//
          } //---
//---
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
          _Signals_Risk.Update();
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
          chance.Win = 50;      chance.Loss = 50;
          if(chance.Win > 0)    {keep.Is_Long = true;}
          if(chance.Loss > 0)   {keep.Is_Short = true;}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
          {         //---
                    if(false)Trade_Command_Desc = "Support_Indicators_IMA_EMA_500"; //
          }
//---
//--- As Charter   //-- Win Rate 80%
          {         //---
                    if(false)Trade_Command_Desc = "Support_Bulish_Lines_Trend";
                    if(false)Trade_Command_Desc = "Support_Bearish_Lines_Trend";
                    //******
                    if(false)Trade_Command_Desc = "Support_Bulish_Lines_TrendByAngle";
                    if(false)Trade_Command_Desc = "Support_Bearish_Lines_TrendByAngle";
                    //---
                    if(false)Trade_Command_Desc = "Support_Bulish_Channels_Equidistant";
                    if(false)Trade_Command_Desc = "Support_Bearish_Channels_Equidistant";
                    //******
                    if(false)Trade_Command_Desc = "Support_Bulish_Channels_Regression";
                    if(false)Trade_Command_Desc = "Support_Bearish_Channels_Regression";
                    //******
                    if(false)Trade_Command_Desc = "Support_Bulish_Channels_StandardDeviation";
                    if(false)Trade_Command_Desc = "Support_Bearish_Channels_StandardDeviation";
                    //******
                    if(false)Trade_Command_Desc = "Support_Bulish_Channels_Pitchfork";
                    if(false)Trade_Command_Desc = "Support_Bearish_Channels_Pitchfork";
                    //******
                    //---
                    if(false)Trade_Command_Desc = "Support_Bulish_Fibos_Retracement";
                    if(false)Trade_Command_Desc = "Support_Bearish_Fibos_Retracement";
                    //******
                    if(false)Trade_Command_Desc = "Support_Bulish_Fibos_Expansion";
                    if(false)Trade_Command_Desc = "Support_Bearish_Fibos_Expansion";
                    //******
                    if(false)Trade_Command_Desc = "Support_Bulish_Fibos_TimeZone";
                    if(false)Trade_Command_Desc = "Support_Bearish_Fibos_TimeZone";
                    //******
                    if(false)Trade_Command_Desc = "Support_Bulish_Fibos_Channel";
                    if(false)Trade_Command_Desc = "Support_Bearish_Fibos_Channel";
                    //******
                    if(false)Trade_Command_Desc = "Support_Bulish_Fibos_Fan";
                    if(false)Trade_Command_Desc = "Support_Bearish_Fibos_Fan";
                    //******
                    if(false)Trade_Command_Desc = "Support_Bulish_Fibos_Arc";
                    if(false)Trade_Command_Desc = "Support_Bearish_Fibos_Arc";
                    //******
                    //---
          }
//--- As Patternic //-- Win Rate 80%
          {         if(false)Trade_Command_Desc = "Support_Bulish_Patterns_2Bar";
                    if(false)Trade_Command_Desc = "Support_Bearish_Patterns_2Bar";
                    //******
                    if(false)Trade_Command_Desc = "Support_Bulish_Patterns_3Bar";
                    if(false)Trade_Command_Desc = "Support_Bearish_Patterns_3Bar";
                    //******
                    if(false)Trade_Command_Desc = "Support_Bulish_Patterns_Harmonic"; //
                    if(false)Trade_Command_Desc = "Support_Bearish_Patterns_Harmonic"; //
                    //******
                    if(false)Trade_Command_Desc = "Support_Bulish_Patterns_Head_And_Shoulder"; ////ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Is_Trend_Line_Touched_UpSide_Forwarding_Price
                    if(false)Trade_Command_Desc = "Support_Bearish_Patterns_Head_And_Shoulder";
                    //******
          }
//--- As Bar info //-- Win Rate 80%
          {         //---
                    if(false)Trade_Command_Desc = "Support_Bulish_Bar_Bulish";
                    if(false)Trade_Command_Desc = "Support_Bearish_Bar_Bulish";
                    //******
                    //---
          }//
//--- As Extra info //-- Win Rate 80%
          {         //---
                    if(false)Trade_Command_Desc = "Support_Bulish_Extra_RS";//
                    if(false)Trade_Command_Desc = "Support_Bearish_Extra_RS";//
                    //******
          }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
//---
//---
          return true;
//---
}
//+------------------------------------------------------------------+
