//+------------------------------------------------------------------+
//||   ||||||||||       St_CDI_MA.mqh                               ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOA\St_CDI_Base.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\B_MQL\CoverOT\tMqlConductor.mqh>
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
struct St_CDI_MA_Data
{         //---used by iMAs();
          int                   PeriodFast, PeriodSlow;
          int                   Period200,  Period500;
          int                   Period26Trend;
          ////////////////////////////////////
          ////////////////////////////////////
          double                Value_NULL_PeriodFast1X_0_MODE_EMA_PRICE_CLOSE_0,               Value_NULL_PeriodSlow1X_0_MODE_EMA_PRICE_CLOSE_0; //(SlowMA))
          double                Value_NULL_PeriodFast2X_0_MODE_EMA_PRICE_CLOSE_0,               Value_NULL_PeriodSlow2X_0_MODE_EMA_PRICE_CLOSE_0;
          double                Value_NULL_PeriodFast3X_0_MODE_EMA_PRICE_CLOSE_0,               Value_NULL_PeriodSlow3X_0_MODE_EMA_PRICE_CLOSE_0;
          ////////////////////////////////////
          double                Value_NULL_0_8_EMA_FLine_Shift5_MODE_EMA_PRICE_CLOSE_DB5;
          double                Value_NULL_0_24_EMA_FLine_Shift5_MODE_EMA_PRICE_CLOSE_DB5;
          double                Value_NULL_0_8_EMA_BLine_Shift5_MODE_EMA_PRICE_CLOSE_DF10;
          double                Value_NULL_0_24_EMA_BLine_Shift5_MODE_EMA_PRICE_CLOSE_DF10;
          ////////////////////////////////////
          double                Value_NULL_0_Period26Trend_0_MODE_EMA_PRICE_CLOSE_0;
          double                Value_NULL_0_Period26Trend_0_MODE_EMA_PRICE_CLOSE_3;
          double                Value_NULL_0_Period26Trend_0_MODE_EMA_PRICE_CLOSE_6;
          double                Value_NULL_0_5_0_MODE_EMA_PRICE_CLOSE_1;
          double                Value_NULL_0_5_0_MODE_SMA_PRICE_CLOSE_1;
          ////////////////////////////////////
          double                Value_NULL_0_Period200_0_MODE_EMA_PRICE_CLOSE_0;
          double                Value_NULL_0_Period500_0_MODE_EMA_PRICE_CLOSE_0;
          double                Value_NULL_0_13_8_MODE_EMA_PRICE_MEDIAN_0;
          //---------------------------------------------------------------
          double                Value_NULL_0_200_8_MODE_EMA_PRICE_MEDIAN_0;
          double                Value_NULL_0_500_8_MODE_EMA_PRICE_MEDIAN_0 ;
          bool                  Is_CrossUp_Value_NULL_0_200_8_MODE_EMA_PRICE_MEDIAN_0__200x ;
          //////////////////////////////
          double                Value_NULL_PeriodFast1X_0_MODE_EMA_PRICE_CLOSE_0_level_123;
          double                Value_NULL_PeriodFast1X_0_MODE_EMA_PRICE_CLOSE_0_level_138;
          double                Value_NULL_PeriodFast1X_0_MODE_EMA_PRICE_CLOSE_0_level_161;
          double                Value_NULL_PeriodFast1X_0_MODE_EMA_PRICE_CLOSE_0_level_178;
          double                Value_NULL_PeriodFast1X_0_MODE_EMA_PRICE_CLOSE_0_level_200;
          double                Value_NULL_PeriodFast1X_0_MODE_EMA_PRICE_CLOSE_0_level_261;
          ////
          double                Value_NULL_PeriodFast1X_0_MODE_EMA_PRICE_CLOSE_0_level_0123;
          double                Value_NULL_PeriodFast1X_0_MODE_EMA_PRICE_CLOSE_0_level_0138;
          double                Value_NULL_PeriodFast1X_0_MODE_EMA_PRICE_CLOSE_0_level_0161;
          double                Value_NULL_PeriodFast1X_0_MODE_EMA_PRICE_CLOSE_0_level_0178;
          double                Value_NULL_PeriodFast1X_0_MODE_EMA_PRICE_CLOSE_0_level_0200;
          double                Value_NULL_PeriodFast1X_0_MODE_EMA_PRICE_CLOSE_0_level_0261;

          //====================================================================================
          //---used by some;
          //int                   argcnt,  argtotal ;
          //====================================================================================
          //------MovingAverage_Cross
          bool          IsCross_Up_MA200_MA500;
          bool          IsCross_Up_MAFast_MASlow;
          bool          IsCross_Up_EMA5MicroFast_SMA5MicroFast;
          bool          IsCross_Up_MAFastSlow_Previous;
          bool          ISCross_Up_MAFastSlow_Previous2;
          bool          ISCross_Up_EMA_Slow1X_EMA500;
          //====================================================================================
          //------MovingAverage_Condition
          bool          IsDirectUP,     IsDirectMicroUP;
          //====================================================================================
          void          CALC_MA__Alfa();//
          void          MA_init(); //
          void getAsFiboLevels()

          {         Value_NULL_PeriodFast1X_0_MODE_EMA_PRICE_CLOSE_0_level_123    = Value_NULL_PeriodFast1X_0_MODE_EMA_PRICE_CLOSE_0 * 1.238;
                    Value_NULL_PeriodFast1X_0_MODE_EMA_PRICE_CLOSE_0_level_138    = Value_NULL_PeriodFast1X_0_MODE_EMA_PRICE_CLOSE_0 * 1.382;
                    Value_NULL_PeriodFast1X_0_MODE_EMA_PRICE_CLOSE_0_level_161    = Value_NULL_PeriodFast1X_0_MODE_EMA_PRICE_CLOSE_0 * 1.618;
                    Value_NULL_PeriodFast1X_0_MODE_EMA_PRICE_CLOSE_0_level_178    = Value_NULL_PeriodFast1X_0_MODE_EMA_PRICE_CLOSE_0 * 1.786;
                    Value_NULL_PeriodFast1X_0_MODE_EMA_PRICE_CLOSE_0_level_200    = Value_NULL_PeriodFast1X_0_MODE_EMA_PRICE_CLOSE_0 * 2.000;
                    Value_NULL_PeriodFast1X_0_MODE_EMA_PRICE_CLOSE_0_level_261    = Value_NULL_PeriodFast1X_0_MODE_EMA_PRICE_CLOSE_0 * 2.618;
                    ////
                    Value_NULL_PeriodFast1X_0_MODE_EMA_PRICE_CLOSE_0_level_0123   = Value_NULL_PeriodFast1X_0_MODE_EMA_PRICE_CLOSE_0 / 1.238;
                    Value_NULL_PeriodFast1X_0_MODE_EMA_PRICE_CLOSE_0_level_0138   = Value_NULL_PeriodFast1X_0_MODE_EMA_PRICE_CLOSE_0 / 1.382;
                    Value_NULL_PeriodFast1X_0_MODE_EMA_PRICE_CLOSE_0_level_0161   = Value_NULL_PeriodFast1X_0_MODE_EMA_PRICE_CLOSE_0 / 1.618;
                    Value_NULL_PeriodFast1X_0_MODE_EMA_PRICE_CLOSE_0_level_0178   = Value_NULL_PeriodFast1X_0_MODE_EMA_PRICE_CLOSE_0 / 1.786;
                    Value_NULL_PeriodFast1X_0_MODE_EMA_PRICE_CLOSE_0_level_0200   = Value_NULL_PeriodFast1X_0_MODE_EMA_PRICE_CLOSE_0 / 2.000;
                    Value_NULL_PeriodFast1X_0_MODE_EMA_PRICE_CLOSE_0_level_0261   = Value_NULL_PeriodFast1X_0_MODE_EMA_PRICE_CLOSE_0 / 2.618;//
          }//
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void St_CDI_MA_Data::MA_init()
{
//
          Period26Trend         = 26;
          IsDirectUP            =  IsCross_Up_MAFast_MASlow &&  IsCross_Up_MA200_MA500  ;
          IsDirectMicroUP       =  IsCross_Up_EMA5MicroFast_SMA5MicroFast;//
          //
          PeriodFast            = 8;
          PeriodSlow            = 30;
          Period200             = 200;
          Period500             = 500;
//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void St_CDI_MA_Data::CALC_MA__Alfa()
{         // Moving averages MA500Period
          Value_NULL_0_5_0_MODE_EMA_PRICE_CLOSE_1                       = iMA(NULL, PERIOD_CURRENT, 5, 0, MODE_EMA, PRICE_CLOSE, 1);///strill set one
          Value_NULL_0_5_0_MODE_SMA_PRICE_CLOSE_1                       = iMA(NULL, PERIOD_CURRENT, 5, 0, MODE_SMA, PRICE_CLOSE, 1);
          //--------------------------------------------------------------------------------------------------------------------------------------------
          Value_NULL_PeriodFast1X_0_MODE_EMA_PRICE_CLOSE_0              = iMA(NULL, PERIOD_CURRENT,     PeriodFast, 0, MODE_EMA, PRICE_CLOSE, 0);
          Value_NULL_PeriodFast2X_0_MODE_EMA_PRICE_CLOSE_0              = iMA(NULL, PERIOD_CURRENT, 2 * PeriodFast, 0, MODE_EMA, PRICE_CLOSE, 0);
          Value_NULL_PeriodFast3X_0_MODE_EMA_PRICE_CLOSE_0              = iMA(NULL, PERIOD_CURRENT, 3 * PeriodFast, 0, MODE_EMA, PRICE_CLOSE, 0);
          //--------------------------------------------------------------------------------------------------------------------------------------------
          Value_NULL_PeriodSlow1X_0_MODE_EMA_PRICE_CLOSE_0              = iMA(NULL, PERIOD_CURRENT,     PeriodSlow, 0, MODE_EMA, PRICE_CLOSE, 0);
          Value_NULL_PeriodSlow2X_0_MODE_EMA_PRICE_CLOSE_0              = iMA(NULL, PERIOD_CURRENT, 2 * PeriodSlow, 0, MODE_EMA, PRICE_CLOSE, 0);
          Value_NULL_PeriodSlow3X_0_MODE_EMA_PRICE_CLOSE_0              = iMA(NULL, PERIOD_CURRENT, 3 * PeriodSlow, 0, MODE_EMA, PRICE_CLOSE, 0);
          //--------------------------------------------------------------------------------------------------------------------------------------------
          Value_NULL_0_13_8_MODE_EMA_PRICE_MEDIAN_0                     = iMA(NULL, PERIOD_CURRENT, 13,  8, MODE_EMA, PRICE_MEDIAN, 0);
          Value_NULL_0_200_8_MODE_EMA_PRICE_MEDIAN_0                    = iMA(NULL, PERIOD_CURRENT, 200, 8, MODE_EMA, PRICE_MEDIAN, 0);
          Value_NULL_0_500_8_MODE_EMA_PRICE_MEDIAN_0                    = iMA(NULL, PERIOD_CURRENT, 500, 8, MODE_EMA, PRICE_MEDIAN, 0);
          //--------------------------------------------------------------------------------------------------------------------------------------------
          Value_NULL_0_8_EMA_FLine_Shift5_MODE_EMA_PRICE_CLOSE_DB5      = iMA(NULL, PERIOD_CURRENT, 8, EMA_FLine_Shift5, MODE_EMA, PRICE_CLOSE, DirecrBackward5);
          Value_NULL_0_24_EMA_FLine_Shift5_MODE_EMA_PRICE_CLOSE_DB5     = iMA(NULL, PERIOD_CURRENT, 24, EMA_FLine_Shift5, MODE_EMA, PRICE_CLOSE, DirecrBackward5);
          Value_NULL_0_8_EMA_BLine_Shift5_MODE_EMA_PRICE_CLOSE_DF10     = iMA(NULL, PERIOD_CURRENT, 8, EMA_BLine_Shift5, MODE_EMA, PRICE_CLOSE, DirecrForward10);
          Value_NULL_0_24_EMA_BLine_Shift5_MODE_EMA_PRICE_CLOSE_DF10    = iMA(NULL, PERIOD_CURRENT, 24, EMA_BLine_Shift5, MODE_EMA, PRICE_CLOSE, DirecrForward10);
          //--------------------------------------------------------------------------------------------------------------------------------------------
          Value_NULL_0_Period26Trend_0_MODE_EMA_PRICE_CLOSE_0           = iMA(NULL, PERIOD_CURRENT, Period26Trend, 0, MODE_EMA, PRICE_CLOSE, 0);
          Value_NULL_0_Period26Trend_0_MODE_EMA_PRICE_CLOSE_3           = iMA(NULL, PERIOD_CURRENT, Period26Trend, 0, MODE_EMA, PRICE_CLOSE, 3);
          Value_NULL_0_Period26Trend_0_MODE_EMA_PRICE_CLOSE_6           = iMA(NULL, PERIOD_CURRENT, Period26Trend, 0, MODE_EMA, PRICE_CLOSE, 6);
          //--------------------------------------------------------------------------------------------------------------------------------------------
          Value_NULL_0_Period200_0_MODE_EMA_PRICE_CLOSE_0               = iMA(NULL, 0, Period200, 0, MODE_EMA, PRICE_CLOSE, 0);
          Value_NULL_0_Period500_0_MODE_EMA_PRICE_CLOSE_0               = iMA(NULL, 0, Period500, 0, MODE_EMA, PRICE_CLOSE, 0);
          //-------------------------------------------------------------------------------------------------------------------------------------------------------------
          getAsFiboLevels();
          //-------------------------------------------------------------------------------------------------------------------------------------------------------------
          IsCross_Up_MAFast_MASlow                      = Value_NULL_PeriodFast1X_0_MODE_EMA_PRICE_CLOSE_0      > Value_NULL_PeriodSlow1X_0_MODE_EMA_PRICE_CLOSE_0;
          IsCross_Up_EMA5MicroFast_SMA5MicroFast        = Value_NULL_0_5_0_MODE_EMA_PRICE_CLOSE_1               > Value_NULL_0_5_0_MODE_SMA_PRICE_CLOSE_1;
          IsCross_Up_MAFastSlow_Previous                = Value_NULL_0_Period26Trend_0_MODE_EMA_PRICE_CLOSE_0   > Value_NULL_0_Period26Trend_0_MODE_EMA_PRICE_CLOSE_3;
          ISCross_Up_MAFastSlow_Previous2               = Value_NULL_0_Period26Trend_0_MODE_EMA_PRICE_CLOSE_3   > Value_NULL_0_Period26Trend_0_MODE_EMA_PRICE_CLOSE_6;
          ISCross_Up_EMA_Slow1X_EMA500                  = Value_NULL_PeriodSlow1X_0_MODE_EMA_PRICE_CLOSE_0      > Value_NULL_0_Period500_0_MODE_EMA_PRICE_CLOSE_0;
          //-------------------------------------------------------------------------------------------------------------------------------------------------------------
          IsCross_Up_MA200_MA500    = (Value_NULL_0_Period200_0_MODE_EMA_PRICE_CLOSE_0 > Value_NULL_0_Period500_0_MODE_EMA_PRICE_CLOSE_0);
          //-------------------------------------------------------------------------------------------------------------------------------------------------------------
          Is_CrossUp_Value_NULL_0_200_8_MODE_EMA_PRICE_MEDIAN_0__200x   = (Value_NULL_0_Period200_0_MODE_EMA_PRICE_CLOSE_0 > Value_NULL_0_Period500_0_MODE_EMA_PRICE_CLOSE_0) ? true : false; //cheack numbers only
          //-------------------------------------------------------------------------------------------------------------------------------------------------------------
}
struct St_CDI_MA_Conditions0
{         bool Is_Basic_Bulish;//
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class St_CDI_MA : public St_CDI_Base
{
public:
          void St_CDI_MA() { _Data.MA_init();}
          //---------------------------------------------------
          void St_CDI_MA(ENUM_MA_METHOD mode, ENUM_TIMEFRAMES tf, ENUM_APPLIED_PRICE Ap, int PeriodCount );
          St_iMA        _iMa_;
          //--------------------------------------------------
          St_CDI_MA_Data           _Data;
          //     if(ma_prev < ma_prevslow && ma_current >= ma_currentslow)Alert("crossing up"); //
          //---MovingAverage_Value
          //---Struct Member
          St_X_periods<St_iMA>        EMA500_Close, EMA200_Close, EMA30_Close, EMA20_Close;
          //--------------------------------------iMA(NULL, 0, 13, 8, MODE_EMA, PRICE_MEDIAN, 0);
          //--------------------------------------
          template<typename Typer>
          void CALC__iMAs(Typer & typer, ENUM_MA_METHOD mode, int i = 0, ENUM_TIMEFRAMES f = PERIOD_CURRENT, int p = 0);

          St_CDI_MA_Conditions0          Conditions;
        
          //====================================================================================
          void                          iMAs();
          //---
          Stcd_Indicators_MA_Frist      EMA500;
          //====================================================================================
          string        GetDesc_MA_Method( ENUM_MA_METHOD f_maMethod);

}; //---St_CDI_MA                     Indicators_MA;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void St_CDI_MA :: St_CDI_MA(ENUM_MA_METHOD mode, ENUM_TIMEFRAMES tf, ENUM_APPLIED_PRICE Ap, int PeriodCount )
{
//
          int i = 0;
          St_iMA        iMa_;
          // iMa_          = 0;
          CALC__iMAs(iMa_, mode, 0, tf, i);
          _iMa_          = iMa_; //
//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void St_CDI_MA::iMAs()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          _Data.CALC_MA__Alfa();
          CALC__iMAs(EMA500_Close._CURRENT, MODE_EMA, 0, PERIOD_CURRENT, 500);
          CALC__iMAs(EMA200_Close._CURRENT, MODE_EMA, 0, PERIOD_CURRENT, 200);
          CALC__iMAs(EMA20_Close._CURRENT, MODE_EMA,  0, PERIOD_CURRENT, 20);
          CALC__iMAs(EMA30_Close._CURRENT, MODE_EMA,  0, PERIOD_CURRENT, 30);
          //---
          ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          return;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string St_CDI_MA::GetDesc_MA_Method ( ENUM_MA_METHOD f_maMethod) // moving average
{         switch (f_maMethod)
          {         case  MODE_SMA :   return  "SMA" ;
                    case  MODE_EMA :   return  "EMA" ;
                    case  MODE_SMMA :  return  "SMMA" ;
                    case  MODE_LWMA :  return  "LWMA" ;
                    default :          return  "Unknown MA" ; //
          }//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
template<typename Typer>
void St_CDI_MA::CALC__iMAs(Typer & typer, ENUM_MA_METHOD mode, int i = 0, ENUM_TIMEFRAMES f = PERIOD_CURRENT, int ma_p = 0)
{         //---[        ]
          {         typer.symbol             = NULL ;
                    typer.timeframe          = f ;
                    typer.ma_period          = ma_p ;
                    typer.ma_shift_Line      = 0 ;
                    typer.ma_method          = mode;//MODE_EMA
                    typer.applied_price      = MODE_CLOSE ;
                    typer.shift              = i ;
                    typer._Value              = MQL._iMA(typer); //
                    typer._Price.Set_Price_Values(typer, i, f); //
          }//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
