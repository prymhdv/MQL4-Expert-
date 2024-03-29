//+------------------------------------------------------------------+
//||   ||||||||||            tDevConductor.mqh                      ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
#ifndef __ST_CDI__
#define __ST_CDI__
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOA\St_CDI_Base.mqh>  //--CDI
//----------------------------------------------------------------------------------------------------------------------------OnArray 7
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOA\St_CDI_MA.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOA\St_CDI_OsMA.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOA\St_CDI_MACD.mqh>
//----------------------------------------------------------------------------------------------------------------------------
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOA\St_CDI_Custom.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOA\St_CDI_Custom_ZigZag.mqh>
//-----
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOA\St_CDI_RVI.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOA\St_CDI_Alligator.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOA\St_CDI_ADX.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOA\St_CDI_Stochastic.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOA\St_CDI_Bands.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOA\St_CDI_Envelopes.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOA\St_CDI_RSI.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOA\St_CDI_BearsPower.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOA\St_CDI_BullsPower.mqh>
//----------------------------------------------------------------------------------------------------------------------------
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOA\St_CDI_WPR.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOA\St_CDI_DeMarker.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOA\St_CDI_Momentum.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOA\St_CDI_CCI.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOA\St_CDI_StdDev.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOA\St_CDI_Force.mqh>
//----------------------------------------------------------------------------------------------------------------------------
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOA\St_CDI_Accelerator.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOA\St_CDI_OBVClose.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOA\St_CDI_SAR.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOA\St_CDI_Fractals.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOA\St_CDI_BWMFI.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOA\St_CDI_Volume.mqh>
//----------------------------------------------------------------------------------------------------------------------------
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOA\St_CDI_Accumulation.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOA\St_CDI_AwesomeOSC.mqh> //AO  iAO( 
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOA\St_CDI_MFI.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOA\St_CDI_ATR.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOA\St_CDI_Ichimoku.mqh>
//----------------------------------------------------------------------------------------------------------------------------
#endif
//


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class St_CDI : public St_CDI_Base
{
public:
          void St_CDI();
          void ~St_CDI() {};
          bool Is_Extern_Indicators_data;
          //---
          St_CDI_MA                             _MA;
          St_CDI_MA_All_Periods                MA_All;//

          St_CDI_MA_All_Periods_Templater<St_CDI_MA_All_All_Modes>     MA_All__CURRENT_;// St_CDI_MA_All_Periods_Templater<St_CDI_MA_All_All_Modes ,St_CDI_MA_All_PeriodCount,St_CDI_MA_All2>
          St_CDI_MA_All_Periods_Templater<St_CDI_MA_All_All_Modes>     MA_All__MN1_;//
          St_CDI_MA_All_Periods_Templater<St_CDI_MA_All_All_Modes>     MA_All__W1_;//
          St_CDI_MA_All_Periods_Templater<St_CDI_MA_All_All_Modes>     MA_All__D1_;//
          St_CDI_MA_All_Periods_Templater<St_CDI_MA_All_All_Modes>     MA_All__H4_;//
          St_CDI_MA_All_Periods_Templater<St_CDI_MA_All_All_Modes>     MA_All__H1_;//
          St_CDI_MA_All_Periods_Templater<St_CDI_MA_All_All_Modes>     MA_All__M30_;//
          St_CDI_MA_All_Periods_Templater<St_CDI_MA_All_All_Modes>     MA_All__M15_;//
          St_CDI_MA_All_Periods_Templater<St_CDI_MA_All_All_Modes>     MA_All__M5_;//
          St_CDI_MA_All_Periods_Templater<St_CDI_MA_All_All_Modes>     MA_All__M1_;//

          St_CDI_MA_All_All_Modes                                       MA_All__CURRENT_Modes_;// St_CDI_MA_All_Periods_Templater<St_CDI_MA_All_All_Modes ,St_CDI_MA_All_PeriodCount,St_CDI_MA_All2>
          St_CDI_MA_All_All_Modes                                       MA_All__MN1_Modes_;//
          St_CDI_MA_All_All_Modes                                       MA_All__W1_Modes_;//
          St_CDI_MA_All_All_Modes                                       MA_All__D1_Modes_;//
          St_CDI_MA_All_All_Modes                                       MA_All__H4_Modes_;//
          St_CDI_MA_All_All_Modes                                       MA_All__H1_Modes_;//
          St_CDI_MA_All_All_Modes                                       MA_All__M30_Modes_;//
          St_CDI_MA_All_All_Modes                                       MA_All__M15_Modes_;//
          St_CDI_MA_All_All_Modes                                       MA_All__M5_Modes_;//
          St_CDI_MA_All_All_Modes                                       MA_All__M1_Modes_;//

          St_CDI_MA_Peroid              _MA_Peroid;
          //------------------------------------------------------------
          St_CDI_OsMA                   _OsMA;
          St_CDI_MACD                   _MACD;
          Sti_MACD_Peroid               _MACD_Peroid;
//
          St_CDI_Custom                 _Custom;
          St_CDI_RVI                    _RVI;
          St_CDI_Alligator              _Alligator;
          St_CDI_ADX                    _ADX;
          //-------------------------------------------------------------
          St_CDI_Stochastic             _Stochastic;
          St_CDI_Stochastic_Peroid      _Stochastic_Peroid;
          //-------------------------------------------------------------
          St_CDI_Bands                  _Bands;
          St_CDI_Envelopes              _Envelopes;
          St_CDI_RSI                    _RSI;
          St_CDI_BearsPower             _BearsPower;
          St_CDI_BullsPower             _BullsPower;
          //-------------------------------------------------------------
          St_CDI_WpR                    _WPR;
          Sti_WPR_Peroid                _WPR_Peroid;
          //------------------------------------------------------------
          St_CDI_DeMarker               _DeMarker;
          St_CDI_Momentum               _Momentum;
          St_CDI_CCI                    _CCI;
          St_CDI_StdDev                 _StdDev;
          St_CDI_Force                  _Force;
//
          St_CDI_Accelerator            _Accelerator;
          St_CDI_OBVClose               _OBVClose;
          St_CDI_SAR                    _SAR;
          St_CDI_Fractals               _Fractals;
          St_CDI_BWMFI                  _BWMFI;
          St_CDI_Volume                 _Volume;
//
          St_CDI_Accumulation           _Accumulation;
          St_CDI_AwesomeOSC             _AwesomeOSC;
          //------------------------------------------------------------
          St_CDI_MFI                    _MFI;
          St_CDI_MFI_TimeFrame          _MFI_TF;
          //------------------------------------------------------------
          St_CDI_ATR                    _ATR;
          St_CDI_Ichimoku               _Ichimoku;
          //---
          St_CDI_CZZ                    _CZZ_;
          St_CDI_CZZ_Periods            _CZZ_Periods;
          //


          bool  Update()
          {         //---
                    //Alert("Start-Stack error " + __FUNCTION__);
                    //---
                    {         ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //
                              _CZZ_.iZigZags("Timer_CZZ_",false);
                              _CZZ_Periods.Update_CZZ();
                              ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
                              _MACD.MACD_init();
                              _MACD_Peroid.Update();
                              _MACD.iMACDs();//
                              ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
                              _MA._Data.MA_init();
                              _MA.iMAs();//
                              MA_All.Update();
                              MA_All__CURRENT_.Update(PERIOD_CURRENT);
                              MA_All__MN1_.Update(PERIOD_MN1);
                              MA_All__W1_.Update(PERIOD_W1);
                              MA_All__D1_.Update(PERIOD_D1);
                              MA_All__H4_.Update(PERIOD_H4);
                              MA_All__H1_.Update(PERIOD_H1);
                              MA_All__M30_.Update(PERIOD_M30);
                              MA_All__M15_.Update(PERIOD_M15);
                              MA_All__M5_.Update(PERIOD_M5);
                              MA_All__M1_.Update(PERIOD_M1);
                              ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
                              MA_All__CURRENT_Modes_.Update2(PERIOD_CURRENT);
                              MA_All__MN1_Modes_.Update2(PERIOD_MN1);
                              MA_All__W1_Modes_.Update2(PERIOD_W1);
                              MA_All__D1_Modes_.Update2(PERIOD_D1);
                              MA_All__H4_Modes_.Update2(PERIOD_H4);
                              MA_All__H1_Modes_.Update2(PERIOD_H1);
                              MA_All__M30_Modes_.Update2(PERIOD_M30);
                              MA_All__M15_Modes_.Update2(PERIOD_M15);
                              MA_All__M5_Modes_.Update2(PERIOD_M5);
                              MA_All__M1_Modes_.Update2(PERIOD_M1);
                              _MA_Peroid.Update();
                              ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
                              _Alligator.iAlligators();//
                              _ADX.iADXs();//_ADX.DIsBull1_Bear0
                              _RVI.iRVIs();//
                              _OsMA.iOsMAs();//
                              _RSI.iRSIs();//
                              _BearsPower.iBearsPowers();//
                              _BullsPower.iBullsPowers();//
                              _DeMarker.iDeMarkers();//
                              ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
                              _WPR.iWPRs();//
                              _WPR_Peroid.Update();
                              ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
                              _Stochastic.iStochastics();//
                              _Stochastic_Peroid.Update();
                              //---------------------------
                              _Bands.iBandss();//
                              _Envelopes.iEnvelopess();//
                              _Accelerator.iACs();//
                              _BWMFI.iBWMFIs();//
                              _Volume.iVolumes();//
                              _Fractals.iFractalss();//
                              _OBVClose.iOBVs();//
                              _SAR.iSARs();//
                              _Accumulation.iADs();//
                              _AwesomeOSC.iAOs();//
                              ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
                              _MFI.iMFIs();//
                              _MFI_TF.Update();
                              ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
                              _ATR.iATRs();//
                              _Custom.iCustoms();//
                              _Force.iForces();//
                              _Momentum.iMomentums();//
                              _CCI.iCCIs();//
                              _StdDev.iStdDevs();//
                              _Ichimoku.iIchimokus();//
                    }
                    ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //
                    return true; //
          }//


};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void St_CDI::St_CDI()
{         if(IsTesting()) return ;//
//=====================================================
          Resize_XModeArray(_Volume.First_Volume,                 _Volume.Second_Volume_EMA20,                  _Volume.Second_Volume_SMA20,                  _Volume.Second_Volume_EMA200,                 _Volume.Second_Volume_SMA200, 200);
          Resize_XModeArray(_BWMFI.First_BWMFI,                   _BWMFI.Second_BWMFI_EMA20,                    _BWMFI.Second_BWMFI_SMA20,                    _BWMFI.Second_BWMFI_EMA200,                   _BWMFI.Second_BWMFI_SMA200, 200);
          Resize_XModeArray(_OBVClose.First_OBVClose,             _OBVClose.Second_OBVClose_EMA20,              _OBVClose.Second_OBVClose_SMA20,              _OBVClose.Second_OBVClose_EMA200,             _OBVClose.Second_OBVClose_SMA200, 200);
          Resize_XModeArray(_SAR.First_SAR,                       _SAR.Second_SAR_EMA20,                        _SAR.Second_SAR_SMA20,                        _SAR.Second_SAR_EMA200,                       _SAR.Second_SAR_SMA200, 200);
          //
          Resize_XModeArray(_Fractals.First_FractalsLOWER,        _Fractals.Second_FractalsLOWER_EMA20,         _Fractals.Second_FractalsLOWER_SMA20,         _Fractals.Second_FractalsLOWER_EMA200,        _Fractals.Second_FractalsLOWER_SMA200, 200);
          Resize_XModeArray(_Fractals.First_FractalsUPPER,        _Fractals.Second_FractalsUPPER_EMA20,         _Fractals.Second_FractalsUPPER_SMA20,         _Fractals.Second_FractalsUPPER_EMA200,        _Fractals.Second_FractalsUPPER_SMA200, 200);
          //
          Resize_XModeArray(_Accelerator.First_Accelerator,       _Accelerator.Second_Accelerator_EMA20,        _Accelerator.Second_Accelerator_SMA20,        _Accelerator.Second_Accelerator_EMA200,       _Accelerator.Second_Accelerator_SMA200, 200);
          Resize_XModeArray(_Accumulation.First_Accumulation,     _Accumulation.Second_Accumulation_EMA20,      _Accumulation.Second_Accumulation_SMA20,      _Accumulation.Second_Accumulation_EMA200,     _Accumulation.Second_Accumulation_SMA200, 200);
          Resize_XModeArray(_AwesomeOSC.First_AwesomeOSC,         _AwesomeOSC.Second_AwesomeOSC_EMA20,          _AwesomeOSC.Second_AwesomeOSC_SMA20,          _AwesomeOSC.Second_AwesomeOSC_EMA200,         _AwesomeOSC.Second_AwesomeOSC_SMA200, 200);
          /////
          Resize_X200Array_X20Array(_MFI.First_MFI200,            _MFI.Second_MFI200_EMA20,                     _MFI.Second_MFI200_SMA20,                     _MFI.Second_MFI200_EMA200,                    _MFI.Second_MFI200_SMA200,            _MFI.First_MFI20,             _MFI.Second_MFI20_EMA20,              _MFI.Second_MFI20_SMA20,              _MFI.Second_MFI20_EMA200,             _MFI.Second_MFI20_SMA200, 200);
          Resize_X200Array_X20Array(_WPR.First_WPRs200,           _WPR.Second_WPRs200_EMA20,                    _WPR.Second_WPRs200_SMA20,                    _WPR.Second_WPRs200_EMA200,                   _WPR.Second_WPRs200_SMA200,           _WPR.First_WPRs20,            _WPR.Second_WPRs20_EMA20,             _WPR.Second_WPRs20_SMA20,             _WPR.Second_WPRs20_EMA200,            _WPR.Second_WPRs20_SMA200, 200);
          Resize_X200Array_X20Array(_DeMarker.First_DeMarker200,  _DeMarker.Second_DeMarker200_EMA20,           _DeMarker.Second_DeMarker200_SMA20,           _DeMarker.Second_DeMarker200_EMA200,          _DeMarker.Second_DeMarker200_SMA200,  _DeMarker.First_DeMarker20,   _DeMarker.Second_DeMarker20_EMA20,    _DeMarker.Second_DeMarker20_SMA20,    _DeMarker.Second_DeMarker20_EMA200,   _DeMarker.Second_DeMarker20_SMA200, 200);
          Resize_X200Array_X20Array(_ATR.First_ATR200,            _ATR.Second_ATR200_EMA20,                     _ATR.Second_ATR200_SMA20,                     _ATR.Second_ATR200_EMA200,                    _ATR.Second_ATR200_SMA200,            _ATR.First_ATR20,             _ATR.Second_ATR20_EMA20,              _ATR.Second_ATR20_SMA20,              _ATR.Second_ATR20_EMA200,             _ATR.Second_ATR20_SMA200, 200);
          //
          _MACD.ArrayResizeOnMACD();
          //
          Resize_X2000Array_X200Array_X20Array(
                    _Alligator.First_AlligatorJAW_1300,       _Alligator.Second_AlligatorJAW_1300_EMA20,    _Alligator.Second_AlligatorJAW_1300_SMA20,    _Alligator.Second_AlligatorJAW_1300_EMA200,   _Alligator.Second_AlligatorJAW_1300_SMA200,
                    _Alligator.First_AlligatorJAW_130,        _Alligator.Second_AlligatorJAW_130_EMA20,     _Alligator.Second_AlligatorJAW_130_SMA20,     _Alligator.Second_AlligatorJAW_130_EMA200,    _Alligator.Second_AlligatorJAW_130_SMA200,
                    _Alligator.First_AlligatorJAW_13,         _Alligator.Second_AlligatorJAW_13_EMA20,      _Alligator.Second_AlligatorJAW_13_SMA20,      _Alligator.Second_AlligatorJAW_13_EMA200,     _Alligator.Second_AlligatorJAW_13_SMA200);
          //
          Resize_X2000Array_X200Array_X20Array(
                    _Alligator.First_AlligatorTEETH_1300,     _Alligator.Second_AlligatorTEETH_1300_EMA20,  _Alligator.Second_AlligatorTEETH_1300_SMA20,  _Alligator.Second_AlligatorTEETH_1300_EMA200, _Alligator.Second_AlligatorTEETH_1300_SMA200,
                    _Alligator.First_AlligatorTEETH_130,      _Alligator.Second_AlligatorTEETH_130_EMA20,   _Alligator.Second_AlligatorTEETH_130_SMA20,   _Alligator.Second_AlligatorTEETH_130_EMA200,  _Alligator.Second_AlligatorTEETH_130_SMA200,
                    _Alligator.First_AlligatorTEETH_13,       _Alligator.Second_AlligatorTEETH_13_EMA20,    _Alligator.Second_AlligatorTEETH_13_SMA20,    _Alligator.Second_AlligatorTEETH_13_EMA200,   _Alligator.Second_AlligatorTEETH_13_SMA200);
          //
          Resize_X2000Array_X200Array_X20Array(
                    _Alligator.First_AlligatorLIPS_1300,      _Alligator.Second_AlligatorLIPS_1300_EMA20,   _Alligator.Second_AlligatorLIPS_1300_SMA20,   _Alligator.Second_AlligatorLIPS_1300_EMA200,  _Alligator.Second_AlligatorLIPS_1300_SMA200,
                    _Alligator.First_AlligatorLIPS_130,       _Alligator.Second_AlligatorLIPS_130_EMA20,    _Alligator.Second_AlligatorLIPS_130_SMA20,    _Alligator.Second_AlligatorLIPS_130_EMA200,   _Alligator.Second_AlligatorLIPS_130_SMA200,
                    _Alligator.First_AlligatorLIPS_13,        _Alligator.Second_AlligatorLIPS_13_EMA20,     _Alligator.Second_AlligatorLIPS_13_SMA20,     _Alligator.Second_AlligatorLIPS_13_EMA200,    _Alligator.Second_AlligatorLIPS_13_SMA200);
          //
          Resize_X200Array_X20Array(_RVI.First_RVI200S,   _RVI.Second_RVI200S_EMA20,    _RVI.Second_RVI200S_SMA20,    _RVI.Second_RVI200S_EMA200,   _RVI.Second_RVI200S_SMA200,   _RVI.First_RVI20S,    _RVI.Second_RVI20S_EMA20,     _RVI.Second_RVI20S_SMA20,     _RVI.Second_RVI20S_EMA200,    _RVI.Second_RVI20S_SMA200,  200);
          Resize_X200Array_X20Array(_RVI.First_RVI200M,   _RVI.Second_RVI200M_EMA20,    _RVI.Second_RVI200M_SMA20,    _RVI.Second_RVI200M_EMA200,   _RVI.Second_RVI200M_SMA200,   _RVI.First_RVI20M,    _RVI.Second_RVI20M_EMA20,     _RVI.Second_RVI20M_SMA20,     _RVI.Second_RVI20M_EMA200,    _RVI.Second_RVI20M_SMA200, 200);
          //
          Resize_X200Array_X20Array(_RSI.First_RSI200,                    _RSI.Second_RSI200_EMA20,                     _RSI.Second_RSI200_SMA20,                     _RSI.Second_RSI200_EMA200,                    _RSI.Second_RSI200_SMA200,                    _RSI.First_RSI20,                     _RSI.Second_RSI20_EMA20,                      _RSI.Second_RSI20_SMA20,                      _RSI.Second_RSI20_EMA200,                     _RSI.Second_RSI20_SMA200, 200);
          Resize_X200Array_X20Array(_BearsPower.First_BearsPower200,      _BearsPower.Second_BearsPower200_EMA20,       _BearsPower.Second_BearsPower200_SMA20,       _BearsPower.Second_BearsPower200_EMA200,      _BearsPower.Second_BearsPower200_SMA200,      _BearsPower.First_BearsPower20,       _BearsPower.Second_BearsPower20_EMA20,        _BearsPower.Second_BearsPower20_SMA20,        _BearsPower.Second_BearsPower20_EMA200,       _BearsPower.Second_BearsPower20_SMA200, 200);
          Resize_X200Array_X20Array(_BullsPower.First_BullsPower200,      _BullsPower.Second_BullsPower200_EMA20,       _BullsPower.Second_BullsPower200_SMA20,       _BullsPower.Second_BullsPower200_EMA200,      _BullsPower.Second_BullsPower200_SMA200,      _BullsPower.First_BullsPower20,       _BullsPower.Second_BullsPower20_EMA20,        _BullsPower.Second_BullsPower20_SMA20,        _BullsPower.Second_BullsPower20_EMA200,       _BullsPower.Second_BullsPower20_SMA200, 200);
          Resize_X200Array_X20Array(_OsMA.First_OsMA200,                  _OsMA.Second_OsMA200_EMA20,                   _OsMA.Second_OsMA200_SMA20,                   _OsMA.Second_OsMA200_EMA200,                  _OsMA.Second_OsMA200_SMA200,                  _OsMA.First_OsMA20,                   _OsMA.Second_OsMA20_EMA20,                    _OsMA.Second_OsMA20_SMA20,                    _OsMA.Second_OsMA20_EMA200,                   _OsMA.Second_OsMA20_SMA200, 200);
          //
          Resize_X200Array_X20Array(_StdDev.First_StdDev200,              _StdDev.Second_StdDev200_EMA20,               _StdDev.Second_StdDev200_SMA20,               _StdDev.Second_StdDev200_EMA200,              _StdDev.Second_StdDev200_SMA200,              _StdDev.First_StdDev20,               _StdDev.Second_StdDev20_EMA20,                _StdDev.Second_StdDev20_SMA20,                _StdDev.Second_StdDev20_EMA200,               _StdDev.Second_StdDev20_SMA200, 200);
          Resize_X200Array_X20Array(_Momentum.First_Momentum200,          _Momentum.Second_Momentum200_EMA20,           _Momentum.Second_Momentum200_SMA20,           _Momentum.Second_Momentum200_EMA200,          _Momentum.Second_Momentum200_SMA200,          _Momentum.First_Momentum20,           _Momentum.Second_Momentum20_EMA20,            _Momentum.Second_Momentum20_SMA20,            _Momentum.Second_Momentum20_EMA200,           _Momentum.Second_Momentum20_SMA200, 200);
          Resize_X200Array_X20Array(_CCI.First_CCI200,                    _CCI.Second_CCI200_EMA20,                     _CCI.Second_CCI200_SMA20,                     _CCI.Second_CCI200_EMA200,                    _CCI.Second_CCI200_SMA200,                    _CCI.First_CCI20,                     _CCI.Second_CCI20_EMA20,                      _CCI.Second_CCI20_SMA20,                      _CCI.Second_CCI20_EMA200,                     _CCI.Second_CCI20_SMA200, 200);
          Resize_X200Array_X20Array(_Force.First_Force200,                _Force.Second_Force200_EMA20,                 _Force.Second_Force200_SMA20,                 _Force.Second_Force200_EMA200,                _Force.Second_Force200_SMA200,                _Force.First_Force20,                 _Force.Second_Force20_EMA20,                  _Force.Second_Force20_SMA20,                  _Force.Second_Force20_EMA200,                 _Force.Second_Force20_SMA200, 200);
          ////
          ////
          Resize_X200Array_X20Array(_Stochastic.First_Stochastic200M,     _Stochastic.Second_Stochastic200M_EMA20,      _Stochastic.Second_Stochastic200M_SMA20,      _Stochastic.Second_Stochastic200M_EMA200,     _Stochastic.Second_Stochastic200M_SMA200,     _Stochastic.First_Stochastic20M,      _Stochastic.Second_Stochastic20M_EMA20,       _Stochastic.Second_Stochastic20M_SMA20,       _Stochastic.Second_Stochastic20M_EMA200,      _Stochastic.Second_Stochastic20M_SMA200, 200);
          Resize_X200Array_X20Array(_Stochastic.First_Stochastic200S,     _Stochastic.Second_Stochastic200S_EMA20,      _Stochastic.Second_Stochastic200S_SMA20,      _Stochastic.Second_Stochastic200S_EMA200,     _Stochastic.Second_Stochastic200S_SMA200,     _Stochastic.First_Stochastic20S,      _Stochastic.Second_Stochastic20S_EMA20,       _Stochastic.Second_Stochastic20S_SMA20,       _Stochastic.Second_Stochastic20S_EMA200,      _Stochastic.Second_Stochastic20S_SMA200, 200);
          ///
          Resize_X200Array_X20Array(_Bands.First_BandsLOWER200M,          _Bands.Second_BandsLOWER200M_EMA20,           _Bands.Second_BandsLOWER200M_SMA20,           _Bands.Second_BandsLOWER200M_EMA200,          _Bands.Second_BandsLOWER200M_SMA200,          _Bands.First_BandsLOWER20M,           _Bands.Second_BandsLOWER20M_EMA20,            _Bands.Second_BandsLOWER20M_SMA20,            _Bands.Second_BandsLOWER20M_EMA200,           _Bands.Second_BandsLOWER20M_SMA200, 200);
          Resize_X200Array_X20Array(_Bands.First_BandsUPPER200S,          _Bands.Second_BandsUPPER200S_EMA20,           _Bands.Second_BandsUPPER200S_SMA20,           _Bands.Second_BandsUPPER200S_EMA200,          _Bands.Second_BandsUPPER200S_SMA200,          _Bands.First_BandsUPPER20S,           _Bands.Second_BandsUPPER20S_EMA20,            _Bands.Second_BandsUPPER20S_SMA20,            _Bands.Second_BandsUPPER20S_EMA200,           _Bands.Second_BandsUPPER20S_SMA200, 200);
          //
          Resize_X200Array_X20Array(_Envelopes.First_EnvelopesLOWER200M, _Envelopes.Second_EnvelopesLOWER200M_EMA20,    _Envelopes.Second_EnvelopesLOWER200M_SMA20,   _Envelopes.Second_EnvelopesLOWER200M_EMA200, _Envelopes.Second_EnvelopesLOWER200M_SMA200,   _Envelopes.First_EnvelopesLOWER20M,   _Envelopes.Second_EnvelopesLOWER20M_EMA20,    _Envelopes.Second_EnvelopesLOWER20M_SMA20,    _Envelopes.Second_EnvelopesLOWER20M_EMA200,   _Envelopes.Second_EnvelopesLOWER20M_SMA200, 200);
          Resize_X200Array_X20Array(_Envelopes.First_EnvelopesUPPER200S, _Envelopes.Second_EnvelopesUPPER200S_EMA20,    _Envelopes.Second_EnvelopesUPPER200S_SMA20,   _Envelopes.Second_EnvelopesUPPER200S_EMA200, _Envelopes.Second_EnvelopesUPPER200S_SMA200,   _Envelopes.First_EnvelopesUPPER20S,   _Envelopes.Second_EnvelopesUPPER20S_EMA20,    _Envelopes.Second_EnvelopesUPPER20S_SMA20,    _Envelopes.Second_EnvelopesUPPER20S_EMA200,   _Envelopes.Second_EnvelopesUPPER20S_SMA200, 200);
          //=========
          //if(!IsTesting())
          {         Is_Extern_Indicators_data = Update();//
          }//
}
//+------------------------------------------------------------------+
