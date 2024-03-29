//+------------------------------------------------------------------+
//||   ||||||||||            tDevConductor.mqh                      ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOTB\Ct_Conductor.mqh>
//#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(Views)\CoverOGCP\.CoverOGCP.mqh>//error
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+sparklex screwy achievements
//----Alternative   - (Gozine)          (Sechenek)
//----Criterions    - (Shakhesha)       (meyarha)       (Propertise)(Attribes)    a principle or standard by which something may be judged or decided.
//----Objects       - (Hadafha)         (Goals)         (Achivments)(Results)
//----Limits        - (mahdudiyatha)    (Determining)   (Post-Attribes)
//----Implanting    - (fix)             (tissue-Logic)  (Mission to do)    (Steps)
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
/*
Get signal()
Confirming signal()
Confirming signal_long_time()
Confirming signal_short_time()
Confirming signal_trend_not_broken ()
Confirming signal_suportive_time()
Confirming signal_wining_accure()
Chance of sell
Chabce of buy
Chance of sell win
Chance of buy win
*/
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOA\St_CD_Extern_Signals_Data.mqh>
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOA\St_CD_Extern_Signals_MapTradeSence.mqh>
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOAINN\NN_Neurons_Scaler\NN_Neurons_Scaler_Run.mqh>
//+------------------------------------------------------------------+deduction
//|                                                                  |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
//C_TD2 MTSTD;  /*Map Trade Sence TreeDecition*/    /*not run in class or out*/    /*make global to remmebering in class not remmebering __not effected cange to global__*/
class St_CondicatorData_Extern_Signals
{
public:
          St_CondicatorData_Extern_Signals() {};
          ~St_CondicatorData_Extern_Signals() {};
          St_CondicatorData_Extern_Signals_Data   Data;
          St_CondicatorData_Extern_Signals_Method Method;
          //-- It_CondicatorData_Extern_Signals_Base   IBase;  //---'IBase' - cannot instantiate abstract class    St_CD_Extern_Signals.mqh      156       51

          St_MapTradeSence                      MTSA;   /*Map Trade Sence Array*/
          C_TD2                                 MTSTD;  /*Map Trade Sence TreeDecition*/        /*make global to remmebering in class not remmebering __not effected cange to global__*/
          NN_Neurons_Scaler_Run              MTSNN;  /*Map Trade Sence NeuralNetwork*/
          bool                                  IsAllowNN;
          bool                                  IsAllowTree;
          bool                                  IsAllowArray;
          ////!!!!!!its struct that not suport heap an ddont run it!!not efected change to class
          //===============================================================
          void                                  Indicators_Face_divergence_MACD__waves( );//
          //-------------------------------------------------------------------
          bool                                  Is_Trend_Bulish_Forward;//
          bool                                  Is_Trend_Bulish_Backward;//
          bool                                  Is_Trend_Bearish_Forward;//
          bool                                  Is_Trend_Bearish_Backward;//
          //------------------------------------------------------------------------------------
          bool                                  Update() ;                                         // #1 --inventing complex result to Signal buy or Sell or void;
          void                                  Define_Signal_Masters_Aproche();                           // #2a
          void                                  Extern_Trade__Signals__Alfa();                    // #2b
          void                                  Extern_Trade__Signals__Beta();                    // #2c
          void                                  Extern_Trade__Signals__theta();                   // #2d
          void                                  Extern_Trade__Signals_By_Strategies();
          void                                  Strategies_NNSence_Trade();
          void                                  Strategies_MACD_TRADER();
          void                                  Strategies_MACD_Solo_TRADER();
          void                                  Strategies_FE_TRADER();
          //*********************************************************************
          void                                  CHEACK_OUT_TRADE_SIGNAL_For_Complex();                   // #2b#3a   --0

          ///
          void                                  CHEACK_OUT_TRADE_SIGNAL_For_Indicators();                //---FLAGS ALTERNATIVE
          void                                  CHEACK_OUT_TRADE_SIGNAL_For_CandelBars();                //---FLAGS ALTERNATIVE
          void                                  CHEACK_OUT_TRADE_SIGNAL_For_ChartAnalise();              //---FLAGS ALTERNATIVE
          //
          void                                  CHEACK_OUT_TRADE_SIGNAL_For_ComplexA();
          ///
          void                                  CHEACK_OUT_TRADE_SIGNAL_Flags_______For_ChartAnalise_Channel();                   // #2b#3c#4c]
          void                                  CHEACK_OUT_TRADE_Limits_______For_ChartAnalise_Channel();                  // #2b#3c#4c#5a
          void                                  CHEACK_OUT_TRADE_Objects______For_ChartAnalise_Channel();                 // #2b#3c#4c#5b
          void                                  CHEACK_OUT_TRADE_Criterions___For_ChartAnalise_Channel();              // #2b#3c#4c#5c
          void                                  CHEACK_OUT_TRADE_Alternative__For_ChartAnalise_Channel();             // #2b#3c#4c#5d
          void                                  CHEACK_OUT_TRADE_Implanting___For_ChartAnalise_Channel();              // #2b#3c#4c#5e


          void                                  switcher_flags();                                  // #2b#3c#4c#5b
          //-- void                             get_Signal_Over_Nested_Complex();                 // #2b#3c#4c#5c    FAULTED dive and achive CONDINATION FLAG EXPORT

          void                                  ControlTPSL_By_WinRate(bool b);                          // #2b#3e

          template<typename Typer1, typename Typer2>
          void       SetFlag_Line(Typer1 &t1, Typer2 &t2);
          //*********************************************************************
          //--- As Indicators //-- Win Rate 80%

          void                                  Set__Trade__Signals__Indicators_IMA_();
          void                                  Set__Trade__Signals__Indicators_MACD_();         //--- ##3b#4a
          void                                  Set__Trade__Signals__Indicators_RSI_() {};          //--- ##3b#4a
          void                                  Set__Trade__Signals__Indicators_WPR_();           //--- ##3b#4a
          void                                  Set__Trade__Signals__Indicators_Volum_() {};        //--- ##3b#4a
          void                                  Set__Trade__Signals__Indicators_Stochastic_() {};   //--- ##3b#4a
          //---
          //--- As Charter   //-- Win Rate 80%
          void                                  Set__Trade__Signals__Charter_Lines_Trend();         //--- ##3b#4a
          void                                  Set__Trade__Signals__Charter_Lines_TrendByAngle();  //--- ##3b#4a
          //---
          void                                  Set__Trade__Signals__Charter_Channels_Equidistant(); //--- ##3b#4a
          void                                  Set__Trade__Signals__Charter_Channels_Regression();  //--- ##3b#4a
          void                                  Set__Trade__Signals__Charter_Channels_StandardDeviation(); //--- ##3b#4a
          void                                  Set__Trade__Signals__Charter_Channels_Pitchfork();        //--- ##3b#4a
          //
          void                                  Set__Trade__Signals__Charter_Channels_Extention();        //--- ##3b#4a
          //---
          void                                  Set__Trade__Signals__Charter_Fibos_Retracement();         //--- ##3b#4a
          void                                  Set__Trade__Signals__Charter_Fibos_Expansion();           //--- ##3b#4a
          void                                  Set__Trade__Signals__Charter_Fibos_TimeZone();            //--- ##3b#4a
          void                                  Set__Trade__Signals__Charter_Fibos_Channel();             //--- ##3b#4a
          void                                  Set__Trade__Signals__Charter_Fibos_Fan();        //--- ##3b#4a
          void                                  Set__Trade__Signals__Charter_Fibos_Arc();        //--- ##3b#4a
          //--- As Patternic //-- Win Rate 80%
          void                                  Set__Trade__Signals__Patterns_2Bar();        //--- ##3b#4a
          void                                  Set__Trade__Signals__Patterns_3Bar();        //--- ##3b#4a
          void                                  Set__Trade__Signals__Patterns_Harmonic();    //--- ##3b#4a
          //--- As Bar info //-- Win Rate 80%
          void                                  Set__Trade__Signals__BarShadow();        //--- ##3b#4a
          //--- As Extra info //-- Win Rate 80%
          void                                  Set__Trade__Signals__Extra_RS();         //--- ##3b#4a
          //*********************************************************************
          void                                  CommandCenter(int m, int m2, string d, bool c1, bool c2, bool c3, bool c4, bool sb, bool ss, string dsc, string md, bool eb, bool es);
          //
};

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool St_CondicatorData_Extern_Signals::Update()       //Alert("Extern_Indicator_data work");
{         /*--[Host To This]---------------------------------------
                Is_Extern_Indicators_data   = ct_Drive.TDD.ct_Conductor.DC_data.Indicators.Update();
                Is_Extern_CandleBars_data   = ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Update();
                Is_Extern_ChartAnalise_data = ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Update();  //--stackoverflow  //---can be face of indicators
                Is_Extern_TradeLogic_data   = ct_Drive.TDD.ct_Signals.TradeLogic.Update();
          /*---------------------------------------*/
          //Alert("Start-Stack error " + __FUNCTION__);
          Define_Signal_Masters_Aproche();
          //---[Define Trade Signals Method]--------------------------
          Extern_Trade__Signals__Alfa();
          //---off---Extern_Trade__Signals__Beta();//--some extention
          //---off---Extern_Trade__Signals__theta();
          //---END
          return true;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+ //---Cat.say(Desc);
void St_CondicatorData_Extern_Signals::Extern_Trade__Signals__Alfa()
{
          {         //---reset
                    //************************************************************************************************
                    Data._Alfa.E4_Signal                                        = ES_VOID;
                    Data._Alfa.Text                                             = "---> UnMatched Condition Waiting <---  " + ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels._Extention.Channels_Extention_Current.ChannelNavigation_Desc;
                    Data._Alfa.Desc                                             = "  IsWpR20_CrossUp_200: " + (string)ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR.IsWpR20_CrossUp_200 + "    IsWpR_200_UT: " + (string)ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR.IsWpR_200_UpTrend;
                    //************************************************************************************************
                    ct_Drive.TDD.ct_Signals.DATAS.Decition_Array_SignalEstimateOut.Enum__Power__                    = 0;
                    ct_Drive.TDD.ct_Signals.DATAS.Decition_Array_SignalEstimateOut.Enum__Power__Point               = 0;
                    ct_Drive.TDD.ct_Signals.DATAS.Power                                   = 0;
                    ct_Drive.TDD.ct_Signals.DATAS.Is_DoComment                            = true;
                    ct_Drive.TDD.ct_Signals.DATAS.Comment_Desc                            = Data._Alfa.Text + ct_Drive.TDD.ct_Signals.DATAS.Comment_Desc;
                    ct_Drive.TDD.ct_Signals.GetWinRate();
                    //ct_Drive.TDD.ct_Signals.DATAS.Enum_Desc                        = "";
                    //ct_Drive.TDD.ct_Signals.DATAS.Enum_Desc0                       = "";
                    //ct_Drive.TDD.ct_Signals.DATAS.Enum_Desc1                       = "";
                    //************************************************************************************************
                    Data.Enum_Signal_temp_Desc                                  = "";//"{SVoid}"; //---E_Signals_Type        Enum_Signal_temp;
          }
          //********************************************
          //---Anaslise signals conditon     ( * _|_ * )
          //********************************************
          //--------------------------------------------
          CHEACK_OUT_TRADE_SIGNAL_For_Indicators();  //---FLAGS ALTERNATIVE
          CHEACK_OUT_TRADE_SIGNAL_For_CandelBars();  //---FLAGS ALTERNATIVE
          CHEACK_OUT_TRADE_SIGNAL_For_ChartAnalise();//---FLAGS ALTERNATIVE
          CHEACK_OUT_TRADE_SIGNAL_For_ComplexA();
          CHEACK_OUT_TRADE_SIGNAL_For_Complex();
          //-------------------------------------------------------------
          switcher_flags();
          //------------------------------------------
          //---FLAGS CRITERI GET 2$ PROFIT
          //---FLAGS CRITERI
          //---FLAGS CRITERI
          //---FLAGS CRITERI
          //------------------------------------------MTSNN.MainProgress(true) 36 million milisecound run for seven time 5saniye
          {         if(IsAllowArray)
                    {         if( MTSA.MainProgress(true) < -1) {Print("___ARRAY__NOT__RUN__SUCCESSFULY__", __FUNCTION__);};} //
                    if(IsAllowTree)
                    {         if( MTSTD.MainProgress(true) < -1) {Print("___TREE__NOT__RUN__SUCCESSFULY__", __FUNCTION__);};} //  //MTSTD.MainProgress(true); run on timer fast not here
                    if(IsAllowNN)
                    {         if( MTSNN.MainProgress(true) < -1) {Print("___NeuralNetwork__NOT__RUN__SUCCESSFULY__", __FUNCTION__);}; }//  //MTSTD.MainProgress(true); run on timer fast not here
                    //===============================================================================================================================================================================
          } //
          //**************************************************
          //---Extern Trade signals By Strategies  ( * _|_ * )
          //**************************************************
          Extern_Trade__Signals_By_Strategies();//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
          //------------------------------------------
          ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc      = Data.Enum_Signal_temp_Desc;//
          //************************************************************
          ControlTPSL_By_WinRate(false);
          //reverse signals //--off---ct_Drive.TDD.ct_Signals.Signal = ct_Drive.TDD.ct_Signals.Signal == ES_BUY ? ES_SELL : ES_BUY;
          //-------------------------------------------------
} //
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void St_CondicatorData_Extern_Signals::CommandCenter(int m, int m2, string d, bool c1, bool c2, bool c3, bool c4, bool sb, bool ss, string dsc, string md, bool eb, bool es)
{         //
          //if(TradeModel == 1)
          //{         Print("MACDSolo-TradeModel == 1 5DO-1UI");
          //          if(IsConfirmed_M5_Buy)
          //          {         Print("MACDSolo-IsConfirmed_M5_Buy");
          //                    if(IsConfirmed_Current_Buy)
          //                    {         Print("MACDSolo-IsConfirmed_Current_Buy");
          //                              if(IsConfirmed_MACD_M1_MAIN_Grater_Signal)
          //                              {         if(IsConfirmed_MACD_Current_MAIN_Lower_n0_x_Buy)
          //                                        {         Print("MACDSolo-IsConfirmed_MACD_Current_MAIN_Lower_n0_x_Buy");
          //                                                  ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.IsStartBuy   = true;  //
          //                                                  ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.IsStartSell  = false; //
          //                                                  ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.Desc         = "ms-1B5DO-1UIStart"; ////--  Trender OK 5up 1up
          //                                                  ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.ModeDesc     = "TM1"; //
          //                                                  ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.IsEndBuy     = false; //
          //                                                  ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.IsEndSell    = true;  //
          //                                        }//
          //                              }//
          //                    }//
          //          } //
          //}//
          if(m == m2)
          {         Print("MACDSolo-" + d);
                    if(c1)
                    {         Print("MACDSolo-IsConfirmed_M5_Buy");
                              if(c2)
                              {         Print("MACDSolo-IsConfirmed_Current_Buy");
                                        if(c3)
                                        {         if(c4)
                                                  {         Print("MACDSolo-IsConfirmed_MACD_Current_MAIN_Lower_n0_x_Buy");
                                                            ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.IsStartBuy   = sb;  //
                                                            ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.IsStartSell  = ss; //
                                                            ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.Desc         = dsc; ////--  Trender OK 5up 1up
                                                            ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.ModeDesc     = md; //
                                                            ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.IsEndBuy     = eb; //
                                                            ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.IsEndSell    = es;  //
                                                  }//
                                        }//
                              }//
                    } //
          }//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void St_CondicatorData_Extern_Signals::Extern_Trade__Signals_By_Strategies()
{         //***************************************************************************************************
          //'NNSence_Trade'
          Strategies_NNSence_Trade();//
          //'MACD_Trade'
          Strategies_MACD_TRADER();
          //'MACDSolo_Trade'
          Strategies_MACD_Solo_TRADER();
          //'FE_Trade'
          Strategies_FE_TRADER();
          //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void St_CondicatorData_Extern_Signals::CHEACK_OUT_TRADE_SIGNAL_For_Complex()
{         bool Is_Selling_Mode_Navigation_Channel                     = false;;
          bool Is_Selling_Mode_Navigation_Wave_DownTrend_Forwarding   = false;;
          bool Is_Selling_Mode_Navigation_Wave_Trend_Bulish           = false;;
          bool Is_ChannelNavigation_Upper_UP                          = false;
          bool Is_ChannelNavigation_Upper_Down                        = false;
          bool Is_ChannelNavigation_Middle_UP                         = false;
          bool Is_ChannelNavigation_Middle_Midle                      = false;
          bool Is_ChannelNavigation_Middle_Down                       = false;
          bool Is_ChannelNavigation_Lower_UP                          = false;
          bool Is_ChannelNavigation_Lower_Down                        = false;
          //
          bool Cond_A = (Is_ChannelNavigation_Upper_UP      || Is_ChannelNavigation_Upper_Down      || Is_ChannelNavigation_Middle_UP ) && ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Is_TrendUp_Forwarding;
          bool Cond_B = Is_ChannelNavigation_Middle_Midle   &&  ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Is_TrendUp_Forwarding;
          bool Cond_C = Is_ChannelNavigation_Middle_Midle   && !ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Is_TrendUp_Forwarding;
          bool Cond_D = (Is_ChannelNavigation_Middle_Down   || Is_ChannelNavigation_Lower_UP        || Is_ChannelNavigation_Lower_Down ) && !ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Is_TrendUp_Forwarding  ;
          {         //
                    if(Cond_A)        {ct_Drive.TDD.ct_Signals.DATAS.Power += 20; Is_Selling_Mode_Navigation_Channel = false; Is_Selling_Mode_Navigation_Wave_DownTrend_Forwarding = false;}
                    if(Cond_B)        {ct_Drive.TDD.ct_Signals.DATAS.Power += 20; Is_Selling_Mode_Navigation_Channel = false;}
                    if(Cond_C)        {ct_Drive.TDD.ct_Signals.DATAS.Power -= 20; Is_Selling_Mode_Navigation_Channel = true; }
                    if(Cond_D)        {ct_Drive.TDD.ct_Signals.DATAS.Power -= 20; Is_Selling_Mode_Navigation_Channel = true; Is_Selling_Mode_Navigation_Wave_DownTrend_Forwarding = true;}
                    //
          }//
          //
          {         if(ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Is_TrendDown_Forwarding_Correcting)  {ct_Drive.TDD.ct_Signals.DATAS.Power += 20; Is_Selling_Mode_Navigation_Wave_Trend_Bulish = true;}
                    if(ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Is_TrendUp_Forwarding_Correcting)    {ct_Drive.TDD.ct_Signals.DATAS.Power -= 20; Is_Selling_Mode_Navigation_Wave_Trend_Bulish = false;}
                    //
                    if(ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Is_Bulish_TL_2_4)                    {ct_Drive.TDD.ct_Signals.DATAS.Power += 20;}
                    else                                                                                                       {ct_Drive.TDD.ct_Signals.DATAS.Power -= 20;}
                    //
                    if(ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Is_Bulish_TL_1_3)                    {ct_Drive.TDD.ct_Signals.DATAS.Power += 20;}
                    else                                                                                                       {ct_Drive.TDD.ct_Signals.DATAS.Power -= 20;}
                    //
                    ct_Drive.TDD.ct_Conductor.DC_data.Is_Market_Correction_Sell      = (ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Is_Bulish_TL_1_3 && ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Is_Bulish_TL_2_4  ) && ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR.WpR_200_1 > -50;
                    if(ct_Drive.TDD.ct_Conductor.DC_data.Is_Market_Correction_Sell)                                                                      {ct_Drive.TDD.ct_Signals.DATAS.Power += 20;}
                    else                                                                                                       {ct_Drive.TDD.ct_Signals.DATAS.Power -= 20;}
                    //
          }
          //--Alert(GoldVIP_PanelPeriodsData._ClientTPX.TPX_Set_TypeDesc);
          //---Main Position //---passage controlled
          {         Data._Alfa.Macro_Condition_Buy = ( ct_Drive.TDD.ct_Conductor.DC_data.Indicators._RSI.IsRSI_14_UpTrend || ct_Drive.TDD.ct_Conductor.DC_data.Indicators._RSI.Is_RSI_14_Near_CU_80  ) &&
                                                     ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD.Is_MACD_M_14_0_UpTrend                                               &&
                                                     //---off---ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD.MACD_Range_10_Lowest > 0                                  &&
                                                     ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Is_TrendUp_Forwarding      &&
                                                     GoldVIP_PanelPeriodsData._ClientTPX.TPX_Set_TypeDesc == "Buy";
                    //--
          }//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void St_CondicatorData_Extern_Signals::Strategies_NNSence_Trade()
{         ct_Drive.TDD.ct_Signals.TICC.Final_NNSence_Trade_Condition_Signal.IsStartBuy    = 0;
          ct_Drive.TDD.ct_Signals.TICC.Final_NNSence_Trade_Condition_Signal.IsStartSell   = 0; //
          ct_Drive.TDD.ct_Signals.TICC.Final_NNSence_Trade_Condition_Signal.Desc     = "";
          if(ct_Drive.TDD.ct_Signals.DATAS.Is_Pressed_NNSence_Trader)
          {         //------------------------------
                    if(ct_Drive.TDD.ct_Signals.Extern_Signals.MTSNN.DATAS.SignalCommand == "BuyCorrectionL"  || ct_Drive.TDD.ct_Signals.Extern_Signals.MTSNN.DATAS.SignalCommand == "BuyDirectionL"  || ct_Drive.TDD.ct_Signals.Extern_Signals.MTSNN.DATAS.SignalCommand == "BuyCorrectionH")
                    {         ct_Drive.TDD.ct_Signals.TICC.Final_NNSence_Trade_Condition_Signal.IsStartBuy      = 1;
                              ct_Drive.TDD.ct_Signals.TICC.Final_NNSence_Trade_Condition_Signal.IsStartSell     = 0; //
                              ct_Drive.TDD.ct_Signals.TICC.Final_NNSence_Trade_Condition_Signal.Desc       = "NN-B"; //
                              ct_Drive.TDD.ct_Signals.TICC.Final_NNSence_Trade_Condition_Signal.ModeDesc   = "DirectTrade";//
                    }
                    if(ct_Drive.TDD.ct_Signals.Extern_Signals.MTSNN.DATAS.SignalCommand == "SellCorrectionH" || ct_Drive.TDD.ct_Signals.Extern_Signals.MTSNN.DATAS.SignalCommand == "SellDirectionH" || ct_Drive.TDD.ct_Signals.Extern_Signals.MTSNN.DATAS.SignalCommand == "SellCorrectionL")
                    {         ct_Drive.TDD.ct_Signals.TICC.Final_NNSence_Trade_Condition_Signal.IsStartBuy      = 0;
                              ct_Drive.TDD.ct_Signals.TICC.Final_NNSence_Trade_Condition_Signal.IsStartSell     = 1; //
                              ct_Drive.TDD.ct_Signals.TICC.Final_NNSence_Trade_Condition_Signal.Desc       = "NN-S"; //
                              ct_Drive.TDD.ct_Signals.TICC.Final_NNSence_Trade_Condition_Signal.ModeDesc   = "DirectTrade";//
                    }
                    //------------------------------
          } //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void St_CondicatorData_Extern_Signals::Strategies_MACD_TRADER()
{         ct_Drive.TDD.ct_Signals.TICC.Final_MACD_Trade_Condition_Signal.IsStartBuy  = false;
          ct_Drive.TDD.ct_Signals.TICC.Final_MACD_Trade_Condition_Signal.IsStartSell = false;
          ct_Drive.TDD.ct_Signals.TICC.Final_MACD_Trade_Condition_Signal.IsVoid = false;
          //***************************************************************************************************
          if(ct_Drive.TDD.ct_Signals.DATAS.Is_Pressed_MACD_Trader)
          {         ct_Drive.TDD.ct_Signals.TICC.Final_MACD_Trade_Condition_Signal.Desc = "";
                    if(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.E_MACD_Cross_Signal[0] == Et_MACD_Cross_Signal_Up_Selling   &&
                                        ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M5.MACD_Cross_Signal.E_MACD_Cross_Signal[0] == Et_MACD_Cross_Signal_Up_Selling   &&
                                        //!ct_Drive.TDD.ct_Conductor.DC_data.Indicators._ADX.DIsBull1_Bear0 &&
                                        ct_Drive.TDD.ct_Conductor.DC_data.Indicators._ADX.IsBulishDIn &&
                                        ct_Drive.TDD.ct_Conductor.DC_data.Indicators._ADX.IsCrossOkBulishDIp && !ct_Drive.TDD.ct_Conductor.DC_data.Indicators._ADX.IsCrossOkBulishDIn &&
                                        Close[1] < ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.BarPrice[0])
                    {         ct_Drive.TDD.ct_Signals.TICC.Final_MACD_Trade_Condition_Signal.IsStartSell  = true;//
                              ct_Drive.TDD.ct_Signals.TICC.Final_MACD_Trade_Condition_Signal.IsStartBuy   = 0;
                              ct_Drive.TDD.ct_Signals.TICC.Final_MACD_Trade_Condition_Signal.Desc = "A0-S"; //
                    }
                    //----------
                    if(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.E_MACD_Cross_Signal[0] == Et_MACD_Cross_Signal_Down_Buying &&
                                        //ct_Drive.TDD.ct_Conductor.DC_data.Indicators._ADX.DIsBull1_Bear0 &&
                                        ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M5.MACD_Cross_Signal.E_MACD_Cross_Signal[0] == Et_MACD_Cross_Signal_Down_Buying &&
                                        ct_Drive.TDD.ct_Conductor.DC_data.Indicators._ADX.IsBulishDIp  &&
                                        ct_Drive.TDD.ct_Conductor.DC_data.Indicators._ADX.IsCrossOkBulishDIn && !ct_Drive.TDD.ct_Conductor.DC_data.Indicators._ADX.IsCrossOkBulishDIp &&
                                        Close[1] > ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.BarPrice[0])
                    {         ct_Drive.TDD.ct_Signals.TICC.Final_MACD_Trade_Condition_Signal.IsStartBuy   = true;
                              ct_Drive.TDD.ct_Signals.TICC.Final_MACD_Trade_Condition_Signal.IsStartSell  = 0;//
                              ct_Drive.TDD.ct_Signals.TICC.Final_MACD_Trade_Condition_Signal.Desc = "A0-B";//
                    }
                    //-----------
                    ct_Drive.TDD.ct_Signals.TICC.Final_MACD_Trade_Condition_Signal.IsVoid  = ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.E_MACD_Cross_Signal[0] == Et_MACD_Cross_Signal_Void ; //
                    if(true)
                    {         if(!ct_Drive.TDD.ct_Signals.TICC.Final_MACD_Trade_Condition_Signal.IsStartBuy && !ct_Drive.TDD.ct_Signals.TICC.Final_MACD_Trade_Condition_Signal.IsStartSell)
                              {         //
                                        if(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.E_MACD_Cross_Signal[0] == Et_MACD_Cross_Signal_Down_Buying &&
                                                            ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M5.MACD_Cross_Signal.E_MACD_Cross_Signal[0] == Et_MACD_Cross_Signal_Down_Buying
                                          )
                                        {         //if(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._ADX.DIsBull1_Bear0)//is bull market
                                                  {         if(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._ADX.IsCrossOkBulishDIp && !ct_Drive.TDD.ct_Conductor.DC_data.Indicators._ADX.IsCrossOkBulishDIn)//cross now bulishp
                                                            {         if(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._ADX.IsBulishDIp)
                                                                      {         ct_Drive.TDD.ct_Signals.TICC.Final_MACD_Trade_Condition_Signal.IsStartBuy = true; //
                                                                                ct_Drive.TDD.ct_Signals.TICC.Final_MACD_Trade_Condition_Signal.IsStartSell = false;//
                                                                                ct_Drive.TDD.ct_Signals.TICC.Final_MACD_Trade_Condition_Signal.Desc = "A2-B"; // its ok profited
                                                                      }//
                                                                      else
                                                                      {         //
                                                                      }//
                                                            } //
                                                            else
                                                            {         //
                                                            }//
                                                  }//
                                                  //if(!ct_Drive.TDD.ct_Conductor.DC_data.Indicators._ADX.DIsBull1_Bear0)//is bear market
                                                  {         if(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._ADX.IsCrossOkBulishDIn && !ct_Drive.TDD.ct_Conductor.DC_data.Indicators._ADX.IsCrossOkBulishDIp)//cross now bulishn
                                                            {         if(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._ADX.IsBulishDIn)
                                                                      {         ct_Drive.TDD.ct_Signals.TICC.Final_MACD_Trade_Condition_Signal.IsStartSell = true;
                                                                                ct_Drive.TDD.ct_Signals.TICC.Final_MACD_Trade_Condition_Signal.IsStartBuy = false; //
                                                                                ct_Drive.TDD.ct_Signals.TICC.Final_MACD_Trade_Condition_Signal.Desc = "A2-S"; //
                                                                      }//
                                                                      else
                                                                      {         //
                                                                      }//
                                                            } //
                                                            else
                                                            {         //
                                                            } //
                                                  }//
                                        }
                                        else if(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.E_MACD_Cross_Signal[0] == Et_MACD_Cross_Signal_Up_Selling &&
                                                            ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M5.MACD_Cross_Signal.E_MACD_Cross_Signal[0] == Et_MACD_Cross_Signal_Up_Selling )
                                        {         //if(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._ADX.DIsBull1_Bear0)//is bull market
                                                  {         if(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._ADX.IsCrossOkBulishDIn && !ct_Drive.TDD.ct_Conductor.DC_data.Indicators._ADX.IsCrossOkBulishDIp) //cross now bulishn
                                                            {         if(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._ADX.IsBulishDIn)
                                                                      {         ct_Drive.TDD.ct_Signals.TICC.Final_MACD_Trade_Condition_Signal.IsStartSell = true;
                                                                                ct_Drive.TDD.ct_Signals.TICC.Final_MACD_Trade_Condition_Signal.IsStartBuy = false; //
                                                                                ct_Drive.TDD.ct_Signals.TICC.Final_MACD_Trade_Condition_Signal.Desc = "B1-S"; // it ok
                                                                      } //
                                                                      else
                                                                      {         //
                                                                      } //
                                                            }//
                                                  }//
                                                  //if(!ct_Drive.TDD.ct_Conductor.DC_data.Indicators._ADX.DIsBull1_Bear0)//is bear market
                                                  {         if(!ct_Drive.TDD.ct_Conductor.DC_data.Indicators._ADX.IsCrossOkBulishDIp && ct_Drive.TDD.ct_Conductor.DC_data.Indicators._ADX.IsCrossOkBulishDIn)//cross now bulishp
                                                            {         if(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._ADX.IsBulishDIn)
                                                                      {         ct_Drive.TDD.ct_Signals.TICC.Final_MACD_Trade_Condition_Signal.IsStartBuy = 0;
                                                                                ct_Drive.TDD.ct_Signals.TICC.Final_MACD_Trade_Condition_Signal.IsStartSell = 1; //
                                                                                ct_Drive.TDD.ct_Signals.TICC.Final_MACD_Trade_Condition_Signal.Desc = "B2-S"; //
                                                                      } //
                                                                      else
                                                                      {         //
                                                                      } //
                                                            }//
                                                  }//
                                        }//
                              } //
                              //
                    }//
          }//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void St_CondicatorData_Extern_Signals::Strategies_MACD_Solo_TRADER()
{         ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.IsStartBuy   = false;
          ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.IsStartSell  = false; //
          ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.Desc         = ""; //
          ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.ModeDesc     = ""; //
          ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.IsEndBuy     = false; //
          ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.IsEndSell    = false; //
          //Print("MACDSolo-Scope-x");
          //***************************************************************************************************
          if(ct_Drive.TDD.ct_Signals.DATAS.Is_Pressed_MACDSolo_Trader)
          {         //Print("MACDSolo-Scope-Pressed");
                    //Print("MACDSolo-Scope Detected ", EnumToString(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.eMACD_STATE[0]));//
                    uchar TradeModel = 0;
                    uchar TradeModel03 = 0;
                    //============================================================================================================================ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1
                    //============================================================================================================================
                    Sti_MACD PeriodM1  = ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1;
                    Sti_MACD PeriodM5  = ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M5;
                    Sti_MACD PeriodM15 = ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M15;
                    Sti_MACD PeriodM30 = ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M30;
                    Sti_MACD PeriodH4  = ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._H4;
                    Sti_MACD PeriodH1  = ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._H1;
                    //
                    //PeriodFast = ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M5;
                    //PeriodSLow = ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M15;
                    {         // PeriodM1.MACD_Cross_Signal.MACD_RR[0].IsTargetTP1Achived
                              //Print("PeriodM1.MACD_Cross_Signal.MACD_RR[0].IsTargetTP1Achived: ", PeriodM1.MACD_Cross_Signal.MACD_RR[0].IsTargetTP1Achived, "  PeriodM1.MACD_Cross_Signal.MACD_RR[0].RRR_angeAmount: ", PeriodM1.MACD_Cross_Signal.MACD_RR[0].RRR_angeAmount ); ///
                              if(PeriodM5.MACD_Cross_Signal.MACD_RR[0].RRR_angeAmount > 1.5 || PeriodM15.MACD_Cross_Signal.MACD_RR[0].RRR_angeAmount > 1.5)
                              {         Print("PeriodM5.MACD_Cross_Signal.MACD_RR[0].RRR_angeAmount > 1.5  ", PeriodM5.MACD_Cross_Signal.MACD_RR[0].RRR_angeAmount > 1.5, "  PeriodM15.MACD_Cross_Signal.MACD_RR[0].RRR_angeAmount > 1.5", PeriodM15.MACD_Cross_Signal.MACD_RR[0].RRR_angeAmount > 1.5);
                                        if( PeriodM5.MACD_Cross_Signal.eMACD_STATE[0] == UP_IN || PeriodM5.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_OUT )//buy
                                        {         Print("PeriodM5.MACD_Cross_Signal.eMACD_STATE[0] == UP_IN || PeriodM5.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_OUT  ", PeriodM5.MACD_Cross_Signal.eMACD_STATE[0] == UP_IN || PeriodM5.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_OUT);
                                                  if( PeriodM1.MACD_Cross_Signal.eMACD_STATE[0] == UP_IN || PeriodM1.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_OUT )//buy
                                                  {         Print("PeriodM1.MACD_Cross_Signal.eMACD_STATE[0] == UP_IN || PeriodM1.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_OUT  ", PeriodM1.MACD_Cross_Signal.eMACD_STATE[0] == UP_IN || PeriodM1.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_OUT);
                                                            if(!PeriodM5.MACD_Cross_Signal.MACD_RR[0].IsTargetSL1Achived && !PeriodM5.MACD_Cross_Signal.MACD_RR[0].IsTargetTP2Achived)
                                                            {         Print("!PeriodM5.MACD_Cross_Signal.MACD_RR[0].IsTargetSL1Achived && !PeriodM5.MACD_Cross_Signal.MACD_RR[0].IsTargetTP2Achived  ", !PeriodM5.MACD_Cross_Signal.MACD_RR[0].IsTargetSL1Achived && !PeriodM5.MACD_Cross_Signal.MACD_RR[0].IsTargetTP2Achived);
                                                                      bool IsMaAllow = iMA(Symbol(), PERIOD_M1, 10, 0, MODE_SMA, PRICE_CLOSE, 0) < iMA(Symbol(), PERIOD_M1, 3, 0, MODE_SMA, PRICE_CLOSE, 0);
                                                                      if(PeriodM15.MACD_Cross_Signal.DATAS[0].main_Value < -1)
                                                                      {         Print("PeriodM15.MACD_Cross_Signal.DATAS[0].main_Value > 1: ", PeriodM15.MACD_Cross_Signal.DATAS[0].main_Value < -1);
                                                                                if(IsMaAllow)
                                                                                {         Print("IsMaAllow MA_10_3_Bulish", IsMaAllow);
                                                                                          //if((iWPR(Symbol(), PERIOD_M5, 200, 0) > -20) && (iWPR(Symbol(), PERIOD_M5, 14, 0) < -80))
                                                                                          {         //Print("IsMaAllow WPR_200_14_Bulish", (iWPR(Symbol(), PERIOD_M5, 200, 0) > -20) && (iWPR(Symbol(), PERIOD_M5, 14, 0) < -80));
                                                                                                    ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.IsStartBuy   = 1; //
                                                                                                    ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.IsStartSell  = 0; //
                                                                                                    ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.Desc         = "ms-1B5UI-Start"; ////--  Trender OK 5up 1up
                                                                                                    ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.ModeDesc     = "TM1"; //
                                                                                                    ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.IsEndBuy     = 0; //
                                                                                                    ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.IsEndSell    = 1;  //
                                                                                          }//
                                                                                }//
                                                                      }//
                                                            } //
                                                  }//
                                        } //
                                        if(PeriodM5.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_IN || PeriodM5.MACD_Cross_Signal.eMACD_STATE[0] == UP_OUT)//sell
                                        {         Print("PeriodM5.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_IN || PeriodM5.MACD_Cross_Signal.eMACD_STATE[0] == UP_OUT  ", PeriodM5.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_IN || PeriodM5.MACD_Cross_Signal.eMACD_STATE[0] == UP_OUT);
                                                  if(PeriodM1.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_IN || PeriodM1.MACD_Cross_Signal.eMACD_STATE[0] == UP_OUT)//sell
                                                  {         Print("PeriodM1.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_IN || PeriodM1.MACD_Cross_Signal.eMACD_STATE[0] == UP_OUT  ", PeriodM1.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_IN || PeriodM1.MACD_Cross_Signal.eMACD_STATE[0] == UP_OUT);
                                                            if(!PeriodM5.MACD_Cross_Signal.MACD_RR[0].IsTargetSL1Achived && !PeriodM5.MACD_Cross_Signal.MACD_RR[0].IsTargetTP2Achived)
                                                            {         Print("!PeriodM5.MACD_Cross_Signal.MACD_RR[0].IsTargetSL1Achived && !PeriodM5.MACD_Cross_Signal.MACD_RR[0].IsTargetTP2Achived  ", !PeriodM5.MACD_Cross_Signal.MACD_RR[0].IsTargetSL1Achived && !PeriodM5.MACD_Cross_Signal.MACD_RR[0].IsTargetTP2Achived);
                                                                      bool IsMaAllow = iMA(Symbol(), PERIOD_M1, 10, 0, MODE_SMA, PRICE_CLOSE, 0) > iMA(Symbol(), PERIOD_M1, 3, 0, MODE_SMA, PRICE_CLOSE, 0);
                                                                      if(IsMaAllow)
                                                                      {         Print("IsMaAllow MA_10_3_Bearish", IsMaAllow);
                                                                                if(PeriodM15.MACD_Cross_Signal.DATAS[0].main_Value > 1)
                                                                                {         Print("PeriodM15.MACD_Cross_Signal.DATAS[0].main_Value > 1: ", PeriodM15.MACD_Cross_Signal.DATAS[0].main_Value > 1);
                                                                                          //if((iWPR(Symbol(), PERIOD_M5, 200, 0) < -80) && (iWPR(Symbol(), PERIOD_M5, 14, 0) > -20))
                                                                                          {         // Print("IsMaAllow WPR_200_14_Bearish", (iWPR(Symbol(), PERIOD_M5, 200, 0) < -80) && (iWPR(Symbol(), PERIOD_M5, 14, 0) > -20));
                                                                                                    ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.IsStartBuy   = 0;  //
                                                                                                    ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.IsStartSell  = 1; //
                                                                                                    ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.Desc         = "ms-1S5UO-Start"; ////--  Trender OK 5up 1up
                                                                                                    ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.ModeDesc     = "TM1"; //
                                                                                                    ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.IsEndBuy     = 1; //
                                                                                                    ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.IsEndSell    = 0;  //
                                                                                          }//
                                                                                }//
                                                                      }//
                                                            } //
                                                  }//
                                        } //
                              }//
                    }//
                    return;//
                    //============================================================================================================================
                    if(PeriodM1.MACD_Cross_Signal.eMACD_STATE[0] == UP_IN    && PeriodM5.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_OUT) TradeModel = 1;
                    if(PeriodM1.MACD_Cross_Signal.eMACD_STATE[0] == UP_OUT   && PeriodM5.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_OUT) TradeModel = 2;
                    if(PeriodM1.MACD_Cross_Signal.eMACD_STATE[0] == UP_IN    && PeriodM5.MACD_Cross_Signal.eMACD_STATE[0] == UP_OUT)   TradeModel = 3;
                    if(PeriodM1.MACD_Cross_Signal.eMACD_STATE[0] == UP_OUT   && PeriodM5.MACD_Cross_Signal.eMACD_STATE[0] == UP_OUT)   TradeModel = 4;
                    //
                    if(PeriodM1.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_OUT && PeriodM5.MACD_Cross_Signal.eMACD_STATE[0] == UP_OUT)   TradeModel = 5;
                    if(PeriodM1.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_IN  && PeriodM5.MACD_Cross_Signal.eMACD_STATE[0] == UP_OUT)   TradeModel = 6;
                    if(PeriodM1.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_OUT && PeriodM5.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_OUT) TradeModel = 7;
                    if(PeriodM1.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_IN  && PeriodM5.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_OUT) TradeModel = 8;
                    //============================================================================================================================ 4*4*4 =64state
                    if(0)
                    {         //
                              if(PeriodM30.MACD_Cross_Signal.eMACD_STATE[0] == UP_OUT        && PeriodM5.MACD_Cross_Signal.eMACD_STATE[0] == UP_OUT      && PeriodM1.MACD_Cross_Signal.eMACD_STATE[0] == UP_OUT)       {TradeModel03 = 1; Print("MACDSolo-TradeModel03 == 1 30UO 5UO -1UO ");}
                              if(PeriodM30.MACD_Cross_Signal.eMACD_STATE[0] == UP_OUT        && PeriodM5.MACD_Cross_Signal.eMACD_STATE[0] == UP_OUT      && PeriodM1.MACD_Cross_Signal.eMACD_STATE[0] == UP_IN)        {TradeModel03 = 2; Print("MACDSolo-TradeModel03 == 2 30UO 5UO -1UI ");}
                              if(PeriodM30.MACD_Cross_Signal.eMACD_STATE[0] == UP_OUT        && PeriodM5.MACD_Cross_Signal.eMACD_STATE[0] == UP_OUT      && PeriodM1.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_IN)      {TradeModel03 = 3; Print("MACDSolo-TradeModel03 == 3 30UO 5UO -1DI ");}
                              if(PeriodM30.MACD_Cross_Signal.eMACD_STATE[0] == UP_OUT        && PeriodM5.MACD_Cross_Signal.eMACD_STATE[0] == UP_OUT      && PeriodM1.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_OUT)     {TradeModel03 = 4; Print("MACDSolo-TradeModel03 == 4 30UO 5UO -1DO ");}
                              //
                              if(PeriodM30.MACD_Cross_Signal.eMACD_STATE[0] == UP_OUT        && PeriodM5.MACD_Cross_Signal.eMACD_STATE[0] == UP_IN       && PeriodM1.MACD_Cross_Signal.eMACD_STATE[0] == UP_OUT)       {TradeModel03 = 5; Print("MACDSolo-TradeModel03 == 5 30UO 5UI -1UO ");}
                              if(PeriodM30.MACD_Cross_Signal.eMACD_STATE[0] == UP_OUT        && PeriodM5.MACD_Cross_Signal.eMACD_STATE[0] == UP_IN       && PeriodM1.MACD_Cross_Signal.eMACD_STATE[0] == UP_IN)        {TradeModel03 = 6; Print("MACDSolo-TradeModel03 == 6 30UO 5UI -1UI ");}
                              if(PeriodM30.MACD_Cross_Signal.eMACD_STATE[0] == UP_OUT        && PeriodM5.MACD_Cross_Signal.eMACD_STATE[0] == UP_IN       && PeriodM1.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_IN)      {TradeModel03 = 7; Print("MACDSolo-TradeModel03 == 7 30UO 5UI -1DI ");}
                              if(PeriodM30.MACD_Cross_Signal.eMACD_STATE[0] == UP_OUT        && PeriodM5.MACD_Cross_Signal.eMACD_STATE[0] == UP_IN       && PeriodM1.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_OUT)     {TradeModel03 = 8; Print("MACDSolo-TradeModel03 == 8 30UO 5UI -1DO ");}
                              //
                              if(PeriodM30.MACD_Cross_Signal.eMACD_STATE[0] == UP_OUT        && PeriodM5.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_IN       && PeriodM1.MACD_Cross_Signal.eMACD_STATE[0] == UP_OUT)     { TradeModel03 = 9; Print("MACDSolo-TradeModel03 == 9   30UO 5DI -1UO ");}
                              if(PeriodM30.MACD_Cross_Signal.eMACD_STATE[0] == UP_OUT        && PeriodM5.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_IN       && PeriodM1.MACD_Cross_Signal.eMACD_STATE[0] == UP_IN)      { TradeModel03 = 10; Print("MACDSolo-TradeModel03 == 10 30UO 5DI -1UI ");}
                              if(PeriodM30.MACD_Cross_Signal.eMACD_STATE[0] == UP_OUT        && PeriodM5.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_IN       && PeriodM1.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_IN)    { TradeModel03 = 11; Print("MACDSolo-TradeModel03 == 11 30UO 5DI -1DI ");}
                              if(PeriodM30.MACD_Cross_Signal.eMACD_STATE[0] == UP_OUT        && PeriodM5.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_IN       && PeriodM1.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_OUT)   { TradeModel03 = 12; Print("MACDSolo-TradeModel03 == 12 30UO 5DI -1DO ");}
                              //
                              if(PeriodM30.MACD_Cross_Signal.eMACD_STATE[0] == UP_OUT        && PeriodM5.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_OUT       && PeriodM1.MACD_Cross_Signal.eMACD_STATE[0] == UP_OUT)    { TradeModel03 = 13; Print("MACDSolo-TradeModel03 == 13 30UO 5DO -1UO ");}
                              if(PeriodM30.MACD_Cross_Signal.eMACD_STATE[0] == UP_OUT        && PeriodM5.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_OUT       && PeriodM1.MACD_Cross_Signal.eMACD_STATE[0] == UP_IN)     { TradeModel03 = 14; Print("MACDSolo-TradeModel03 == 14 30UO 5DO -1UI ");}
                              if(PeriodM30.MACD_Cross_Signal.eMACD_STATE[0] == UP_OUT        && PeriodM5.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_OUT       && PeriodM1.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_IN)   { TradeModel03 = 15; Print("MACDSolo-TradeModel03 == 15 30UO 5DO -1DI ");}
                              if(PeriodM30.MACD_Cross_Signal.eMACD_STATE[0] == UP_OUT        && PeriodM5.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_OUT       && PeriodM1.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_OUT)  { TradeModel03 = 16; Print("MACDSolo-TradeModel03 == 16 30UO 5DO -1DO ");}
                              //============================================================================================================================
                              //
                              if(PeriodM30.MACD_Cross_Signal.eMACD_STATE[0] == UP_IN        && PeriodM5.MACD_Cross_Signal.eMACD_STATE[0] == UP_OUT      && PeriodM1.MACD_Cross_Signal.eMACD_STATE[0] == UP_OUT)         { TradeModel03 = 17; Print("MACDSolo-TradeModel03 == 17 30UI 5UO -1UO ");}
                              if(PeriodM30.MACD_Cross_Signal.eMACD_STATE[0] == UP_IN        && PeriodM5.MACD_Cross_Signal.eMACD_STATE[0] == UP_OUT      && PeriodM1.MACD_Cross_Signal.eMACD_STATE[0] == UP_IN)          { TradeModel03 = 18; Print("MACDSolo-TradeModel03 == 18 30UI 5UO -1UI ");}
                              if(PeriodM30.MACD_Cross_Signal.eMACD_STATE[0] == UP_IN        && PeriodM5.MACD_Cross_Signal.eMACD_STATE[0] == UP_OUT      && PeriodM1.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_IN)        { TradeModel03 = 19; Print("MACDSolo-TradeModel03 == 19 30UI 5UO -1DI ");}
                              if(PeriodM30.MACD_Cross_Signal.eMACD_STATE[0] == UP_IN        && PeriodM5.MACD_Cross_Signal.eMACD_STATE[0] == UP_OUT      && PeriodM1.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_OUT)       { TradeModel03 = 20; Print("MACDSolo-TradeModel03 == 20 30UI 5UO -1DO ");}
                              //
                              if(PeriodM30.MACD_Cross_Signal.eMACD_STATE[0] == UP_IN        && PeriodM5.MACD_Cross_Signal.eMACD_STATE[0] == UP_IN       && PeriodM1.MACD_Cross_Signal.eMACD_STATE[0] == UP_OUT)         { TradeModel03 = 21; Print("MACDSolo-TradeModel03 == 21 30UI 5UI -1UO ");}
                              if(PeriodM30.MACD_Cross_Signal.eMACD_STATE[0] == UP_IN        && PeriodM5.MACD_Cross_Signal.eMACD_STATE[0] == UP_IN       && PeriodM1.MACD_Cross_Signal.eMACD_STATE[0] == UP_IN)          { TradeModel03 = 22; Print("MACDSolo-TradeModel03 == 22 30UI 5UI -1UI ");}
                              if(PeriodM30.MACD_Cross_Signal.eMACD_STATE[0] == UP_IN        && PeriodM5.MACD_Cross_Signal.eMACD_STATE[0] == UP_IN       && PeriodM1.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_IN)        { TradeModel03 = 23; Print("MACDSolo-TradeModel03 == 23 30UI 5UI -1DI ");}
                              if(PeriodM30.MACD_Cross_Signal.eMACD_STATE[0] == UP_IN        && PeriodM5.MACD_Cross_Signal.eMACD_STATE[0] == UP_IN       && PeriodM1.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_OUT)       { TradeModel03 = 24; Print("MACDSolo-TradeModel03 == 24 30UI 5UI -1DO ");}
                              //
                              if(PeriodM30.MACD_Cross_Signal.eMACD_STATE[0] == UP_IN        && PeriodM5.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_IN       && PeriodM1.MACD_Cross_Signal.eMACD_STATE[0] == UP_OUT)       { TradeModel03 = 25; Print("MACDSolo-TradeModel03 == 25 30UI 5DI -1UO ");}
                              if(PeriodM30.MACD_Cross_Signal.eMACD_STATE[0] == UP_IN        && PeriodM5.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_IN       && PeriodM1.MACD_Cross_Signal.eMACD_STATE[0] == UP_IN)        { TradeModel03 = 26; Print("MACDSolo-TradeModel03 == 26 30UI 5DI -1UI ");}
                              if(PeriodM30.MACD_Cross_Signal.eMACD_STATE[0] == UP_IN        && PeriodM5.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_IN       && PeriodM1.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_IN)      { TradeModel03 = 27; Print("MACDSolo-TradeModel03 == 27 30UI 5DI -1DI ");}
                              if(PeriodM30.MACD_Cross_Signal.eMACD_STATE[0] == UP_IN        && PeriodM5.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_IN       && PeriodM1.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_OUT)     { TradeModel03 = 28; Print("MACDSolo-TradeModel03 == 28 30UI 5DI -1DO ");}
                              //
                              if(PeriodM30.MACD_Cross_Signal.eMACD_STATE[0] == UP_IN        && PeriodM5.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_OUT       && PeriodM1.MACD_Cross_Signal.eMACD_STATE[0] == UP_OUT)      { TradeModel03 = 29; Print("MACDSolo-TradeModel03 == 29 30UI 5DO -1UO ");}
                              if(PeriodM30.MACD_Cross_Signal.eMACD_STATE[0] == UP_IN        && PeriodM5.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_OUT       && PeriodM1.MACD_Cross_Signal.eMACD_STATE[0] == UP_IN)       { TradeModel03 = 30; Print("MACDSolo-TradeModel03 == 30 30UI 5DO -1UI ");}
                              if(PeriodM30.MACD_Cross_Signal.eMACD_STATE[0] == UP_IN        && PeriodM5.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_OUT       && PeriodM1.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_IN)     { TradeModel03 = 31; Print("MACDSolo-TradeModel03 == 31 30UI 5DO -1DI ");}
                              if(PeriodM30.MACD_Cross_Signal.eMACD_STATE[0] == UP_IN        && PeriodM5.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_OUT       && PeriodM1.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_OUT)    { TradeModel03 = 32; Print("MACDSolo-TradeModel03 == 32 30UI 5DO -1DO ");}
                              //============================================================================================================================
                              //
                              if(PeriodM30.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_IN        && PeriodM5.MACD_Cross_Signal.eMACD_STATE[0] == UP_OUT      && PeriodM1.MACD_Cross_Signal.eMACD_STATE[0] == UP_OUT)        { TradeModel03 = 33; Print("MACDSolo-TradeModel03 == 33 30DI 5UO -1UO ");}
                              if(PeriodM30.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_IN        && PeriodM5.MACD_Cross_Signal.eMACD_STATE[0] == UP_OUT      && PeriodM1.MACD_Cross_Signal.eMACD_STATE[0] == UP_IN)         { TradeModel03 = 34; Print("MACDSolo-TradeModel03 == 34 30DI 5UO -1UI ");}
                              if(PeriodM30.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_IN        && PeriodM5.MACD_Cross_Signal.eMACD_STATE[0] == UP_OUT      && PeriodM1.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_IN)       { TradeModel03 = 35; Print("MACDSolo-TradeModel03 == 35 30DI 5UO -1DI ");}
                              if(PeriodM30.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_IN        && PeriodM5.MACD_Cross_Signal.eMACD_STATE[0] == UP_OUT      && PeriodM1.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_OUT)      { TradeModel03 = 36; Print("MACDSolo-TradeModel03 == 36 30DI 5UO -1UO ");}
                              //
                              if(PeriodM30.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_IN        && PeriodM5.MACD_Cross_Signal.eMACD_STATE[0] == UP_IN       && PeriodM1.MACD_Cross_Signal.eMACD_STATE[0] == UP_OUT)        { TradeModel03 = 37; Print("MACDSolo-TradeModel03 == 37 30DI 5UI -1UO ");}
                              if(PeriodM30.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_IN        && PeriodM5.MACD_Cross_Signal.eMACD_STATE[0] == UP_IN       && PeriodM1.MACD_Cross_Signal.eMACD_STATE[0] == UP_IN)         { TradeModel03 = 38; Print("MACDSolo-TradeModel03 == 38 30DI 5UI -1UI ");}
                              if(PeriodM30.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_IN        && PeriodM5.MACD_Cross_Signal.eMACD_STATE[0] == UP_IN       && PeriodM1.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_IN)       { TradeModel03 = 39; Print("MACDSolo-TradeModel03 == 39 30DI 5UI -1DI ");}
                              if(PeriodM30.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_IN        && PeriodM5.MACD_Cross_Signal.eMACD_STATE[0] == UP_IN       && PeriodM1.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_OUT)      { TradeModel03 = 40; Print("MACDSolo-TradeModel03 == 40 30DI 5UI -1DO ");}
                              //
                              if(PeriodM30.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_IN        && PeriodM5.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_IN       && PeriodM1.MACD_Cross_Signal.eMACD_STATE[0] == UP_OUT)      { TradeModel03 = 41; Print("MACDSolo-TradeModel03 == 41 30DI 5DI -1UO ");}
                              if(PeriodM30.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_IN        && PeriodM5.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_IN       && PeriodM1.MACD_Cross_Signal.eMACD_STATE[0] == UP_IN)       { TradeModel03 = 42; Print("MACDSolo-TradeModel03 == 42 30DI 5DI -1UI ");}
                              if(PeriodM30.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_IN        && PeriodM5.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_IN       && PeriodM1.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_IN)     { TradeModel03 = 43; Print("MACDSolo-TradeModel03 == 43 30DI 5DI -1DI ");}
                              if(PeriodM30.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_IN        && PeriodM5.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_IN       && PeriodM1.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_OUT)    { TradeModel03 = 44; Print("MACDSolo-TradeModel03 == 44 30DI 5DI -1DO ");}
                              //
                              if(PeriodM30.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_IN        && PeriodM5.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_OUT       && PeriodM1.MACD_Cross_Signal.eMACD_STATE[0] == UP_OUT)     { TradeModel03 = 45; Print("MACDSolo-TradeModel03 == 45 30DI 5DO -1UO ");}
                              if(PeriodM30.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_IN        && PeriodM5.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_OUT       && PeriodM1.MACD_Cross_Signal.eMACD_STATE[0] == UP_IN)      { TradeModel03 = 46; Print("MACDSolo-TradeModel03 == 46 30DI 5DO -1UI ");}
                              if(PeriodM30.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_IN        && PeriodM5.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_OUT       && PeriodM1.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_IN)    { TradeModel03 = 47; Print("MACDSolo-TradeModel03 == 47 30DI 5DO -1DI ");}
                              if(PeriodM30.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_IN        && PeriodM5.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_OUT       && PeriodM1.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_OUT)   { TradeModel03 = 48; Print("MACDSolo-TradeModel03 == 48 30DI 5DO -1DO ");}
                              //============================================================================================================================
                              //
                              if(PeriodM30.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_OUT        && PeriodM5.MACD_Cross_Signal.eMACD_STATE[0] == UP_OUT      && PeriodM1.MACD_Cross_Signal.eMACD_STATE[0] == UP_OUT)       { TradeModel03 = 49; Print("MACDSolo-TradeModel03 == 49 30DO 5UO -1UO ");}
                              if(PeriodM30.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_OUT        && PeriodM5.MACD_Cross_Signal.eMACD_STATE[0] == UP_OUT      && PeriodM1.MACD_Cross_Signal.eMACD_STATE[0] == UP_IN)        { TradeModel03 = 50; Print("MACDSolo-TradeModel03 == 50 30DO 5UO -1UI ");}
                              if(PeriodM30.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_OUT        && PeriodM5.MACD_Cross_Signal.eMACD_STATE[0] == UP_OUT      && PeriodM1.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_IN)      { TradeModel03 = 51; Print("MACDSolo-TradeModel03 == 51 30DO 5UO -1DI ");}
                              if(PeriodM30.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_OUT        && PeriodM5.MACD_Cross_Signal.eMACD_STATE[0] == UP_OUT      && PeriodM1.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_OUT)     { TradeModel03 = 52; Print("MACDSolo-TradeModel03 == 52 30DO 5UO -1DO ");}
                              //
                              if(PeriodM30.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_OUT        && PeriodM5.MACD_Cross_Signal.eMACD_STATE[0] == UP_IN       && PeriodM1.MACD_Cross_Signal.eMACD_STATE[0] == UP_OUT)       { TradeModel03 = 53; Print("MACDSolo-TradeModel03 == 53 30DO 5UI -1UO ");}
                              if(PeriodM30.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_OUT        && PeriodM5.MACD_Cross_Signal.eMACD_STATE[0] == UP_IN       && PeriodM1.MACD_Cross_Signal.eMACD_STATE[0] == UP_IN)        { TradeModel03 = 54; Print("MACDSolo-TradeModel03 == 54 30DO 5UI -1UI ");}
                              if(PeriodM30.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_OUT        && PeriodM5.MACD_Cross_Signal.eMACD_STATE[0] == UP_IN       && PeriodM1.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_IN)      { TradeModel03 = 55; Print("MACDSolo-TradeModel03 == 55 30DO 5UI -1DI ");}
                              if(PeriodM30.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_OUT        && PeriodM5.MACD_Cross_Signal.eMACD_STATE[0] == UP_IN       && PeriodM1.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_OUT)     { TradeModel03 = 56; Print("MACDSolo-TradeModel03 == 56 30DO 5UI -1DO ");}
                              //
                              if(PeriodM30.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_OUT        && PeriodM5.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_IN       && PeriodM1.MACD_Cross_Signal.eMACD_STATE[0] == UP_OUT)     { TradeModel03 = 57; Print("MACDSolo-TradeModel03 == 57 30DO 5DI -1UO ");}
                              if(PeriodM30.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_OUT        && PeriodM5.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_IN       && PeriodM1.MACD_Cross_Signal.eMACD_STATE[0] == UP_IN)      { TradeModel03 = 58; Print("MACDSolo-TradeModel03 == 58 30DO 5DI -1UI ");}
                              if(PeriodM30.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_OUT        && PeriodM5.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_IN       && PeriodM1.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_IN)    { TradeModel03 = 59; Print("MACDSolo-TradeModel03 == 59 30DO 5DI -1DI ");}
                              if(PeriodM30.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_OUT        && PeriodM5.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_IN       && PeriodM1.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_OUT)   { TradeModel03 = 60; Print("MACDSolo-TradeModel03 == 60 30DO 5DI -1DO ");}
                              //
                              if(PeriodM30.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_OUT        && PeriodM5.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_OUT       && PeriodM1.MACD_Cross_Signal.eMACD_STATE[0] == UP_OUT)    { TradeModel03 = 61; Print("MACDSolo-TradeModel03 == 51 30DO 5DO -1UO ");}
                              if(PeriodM30.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_OUT        && PeriodM5.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_OUT       && PeriodM1.MACD_Cross_Signal.eMACD_STATE[0] == UP_IN)     { TradeModel03 = 62; Print("MACDSolo-TradeModel03 == 52 30DO 5DO -1UI ");}
                              if(PeriodM30.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_OUT        && PeriodM5.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_OUT       && PeriodM1.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_IN)   { TradeModel03 = 63; Print("MACDSolo-TradeModel03 == 53 30DO 5DO -1DI ");}
                              if(PeriodM30.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_OUT        && PeriodM5.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_OUT       && PeriodM1.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_OUT)  { TradeModel03 = 64; Print("MACDSolo-TradeModel03 == 64 30DO 5DO -1DO ");}
                              //
                    }
                    //============================================================================================================================
                    //============================================================================================================================
                    //============================================================================================================================
                    //============================================================================================================================
                    //============================================================================================================================
                    bool IsConfirmed_H4_Sell      = Close[0] < PeriodH4.MACD_Cross_Signal.BarPrice[0] - 150 * Point(); //Print("Close[0] < PeriodM5.MACD_Cross_Signal.BarPrice[0] - 50 * Point()  ", PeriodM5.MACD_Cross_Signal.BarPrice[0] , "   " , Close[0], "   ", PeriodM5.MACD_Cross_Signal.BarPrice[0] - 50 * Point());
                    bool IsConfirmed_H4_Buy       = Close[0] > PeriodH4.MACD_Cross_Signal.BarPrice[0] + 150 * Point();
                    bool IsConfirmed_H1_Sell      = Close[0] < PeriodH1.MACD_Cross_Signal.BarPrice[0] - 150 * Point(); //Print("Close[0] < PeriodM5.MACD_Cross_Signal.BarPrice[0] - 50 * Point()  ", PeriodM5.MACD_Cross_Signal.BarPrice[0] , "   " , Close[0], "   ", PeriodM5.MACD_Cross_Signal.BarPrice[0] - 50 * Point());
                    bool IsConfirmed_H1_Buy       = Close[0] > PeriodH1.MACD_Cross_Signal.BarPrice[0] + 150 * Point();
                    bool IsConfirmed_M30_Sell     = Close[0] < PeriodM30.MACD_Cross_Signal.BarPrice[0] - 150 * Point(); //Print("Close[0] < PeriodM5.MACD_Cross_Signal.BarPrice[0] - 50 * Point()  ", PeriodM5.MACD_Cross_Signal.BarPrice[0] , "   " , Close[0], "   ", PeriodM5.MACD_Cross_Signal.BarPrice[0] - 50 * Point());
                    bool IsConfirmed_M30_Buy      = Close[0] > PeriodM30.MACD_Cross_Signal.BarPrice[0] + 150 * Point();
                    bool IsConfirmed_M5_Sell      = Close[0] < PeriodM5.MACD_Cross_Signal.BarPrice[0] - 150 * Point(); //Print("Close[0] < PeriodM5.MACD_Cross_Signal.BarPrice[0] - 50 * Point()  ", PeriodM5.MACD_Cross_Signal.BarPrice[0] , "   " , Close[0], "   ", PeriodM5.MACD_Cross_Signal.BarPrice[0] - 50 * Point());
                    bool IsConfirmed_M5_Buy       = Close[0] > PeriodM5.MACD_Cross_Signal.BarPrice[0] + 150 * Point(); //Print("Close[0] > PeriodM5.MACD_Cross_Signal.BarPrice[0]", Close[0], " ", PeriodM5.MACD_Cross_Signal.BarPrice[0]);
                    bool IsConfirmed_Current_Sell = Close[0] < PeriodM1.MACD_Cross_Signal.BarPrice[0] - 150 * Point();
                    bool IsConfirmed_Current_Buy  = Close[0] > PeriodM1.MACD_Cross_Signal.BarPrice[0] + 150 * Point();
                    //============================================================================================================================
                    //============================================================================================================================
                    bool IsConfirmed_MACD_Current_MAIN_Lower_n0_x_Buy     = PeriodM1.DATAS[1].main_Value < -0.3;
                    bool IsConfirmed_MACD_Current_MAIN_Grater_p0_x_Sell   = PeriodM1.DATAS[1].main_Value > 0.3;
                    //============================================================================================================================
                    //============================================================================================================================
                    bool IsConfirmed_MACD_M1_MAIN_Grater_Signal = PeriodM1.DATAS[1].main_Value > PeriodM1.DATAS[1].signal_Value; //Print("IsConfirmed_MACD_M1_MAIN_Grater_Signal:", IsConfirmed_MACD_M1_MAIN_Grater_Signal); //
                    bool IsConfirmed_MACD_M5_MAIN_Grater_Signal = PeriodM5.DATAS[1].main_Value > PeriodM5.DATAS[1].signal_Value;
                    //============================================================================================================================
                    bool IsConfirmed_MACD_M5_Pivot_PP_Lower_Close     = ct_Drive.TDD.ct_Conductor.DC_data.Pivot_Periods._M5.PP < Close[0];
                    //============================================================================================================================
                    //CommandCenter(1, "TradeModel == 1 5DO-1UI", IsConfirmed_M5_Buy, IsConfirmed_Current_Buy, IsConfirmed_MACD_M1_MAIN_Grater_Signal, IsConfirmed_MACD_Current_MAIN_Lower_n0_x_Buy, 1, 0, "ms-1B5DO-1UIStart", "TM1", 0, 1);
                    //CommandCenter(2, "TradeModel == 1 5DO-1UI", IsConfirmed_M5_Buy, IsConfirmed_Current_Buy, IsConfirmed_MACD_M1_MAIN_Grater_Signal, IsConfirmed_MACD_Current_MAIN_Lower_n0_x_Buy, 1, 0, "ms-1B5DO-1UIStart", "TM1", 0, 1);
                    //CommandCenter(3, "TradeModel == 1 5DO-1UI", IsConfirmed_M5_Buy, IsConfirmed_Current_Buy, IsConfirmed_MACD_M1_MAIN_Grater_Signal, IsConfirmed_MACD_Current_MAIN_Lower_n0_x_Buy, 1, 0, "ms-1B5DO-1UIStart", "TM1", 0, 1);
                    //CommandCenter(4, "TradeModel == 1 5DO-1UI", IsConfirmed_M5_Buy, IsConfirmed_Current_Buy, IsConfirmed_MACD_M1_MAIN_Grater_Signal, IsConfirmed_MACD_Current_MAIN_Lower_n0_x_Buy, 1, 0, "ms-1B5DO-1UIStart", "TM1", 0, 1);
                    //============================================================================================================================
                    double PowerIndexPeriodsFrame = 0;
                    string DescSignals = "";
                    if(1)
                    {         switch(PeriodH4.MACD_Cross_Signal.eMACD_STATE[0])
                              {         case UP_OUT:
                                        {         //
                                                  DescSignals += "H4UO ";
                                                  //Print("MACDSolo-TradeModel == 1 H4UO");
                                                  if(IsConfirmed_H4_Sell)
                                                  {         //Print("MACDSolo-IsConfirmed_H4_Sell");//
                                                            PowerIndexPeriodsFrame -= 240;//
                                                  } //
                                                  break;//
                                        }
                                        case UP_IN:
                                        {         //
                                                  //Print("MACDSolo-TradeModel == 2 H4UI");
                                                  DescSignals += "H4UI ";
                                                  if(IsConfirmed_H4_Buy)
                                                  {         //Print("MACDSolo-IsConfirmed_H4_Buy");//
                                                            PowerIndexPeriodsFrame += 240;//
                                                  }//
                                                  break;//
                                        }
                                        case DOWN_IN:
                                        {         //
                                                  //Print("MACDSolo-TradeModel == 3 H4DI");
                                                  DescSignals += "H4DI ";
                                                  if(IsConfirmed_H4_Sell)
                                                  {         //Print("MACDSolo-IsConfirmed_H4_Sell");//
                                                            PowerIndexPeriodsFrame -= 240;//
                                                  }//
                                                  break;//
                                        }
                                        case DOWN_OUT:
                                        {         //
                                                  //Print("MACDSolo-TradeModel == 4 H4DO");
                                                  DescSignals += "H4DO ";
                                                  if(IsConfirmed_H4_Buy)
                                                  {         //Print("MACDSolo-IsConfirmed_H4_Buy");//
                                                            PowerIndexPeriodsFrame += 240;//
                                                  }//
                                                  break;//
                                        }
                                        default:   break; //
                              } //
                              switch(PeriodH1.MACD_Cross_Signal.eMACD_STATE[0])
                              {         case UP_OUT:
                                        {         //
                                                  //Print("MACDSolo-TradeModel == 1 H1UO");
                                                  DescSignals += "H1UO ";
                                                  if(IsConfirmed_H1_Sell)
                                                  {         //Print("MACDSolo-IsConfirmed_H1_Sell");//
                                                            PowerIndexPeriodsFrame -= 60;//
                                                  } //
                                                  break;//
                                        }
                                        case UP_IN:
                                        {         //
                                                  //Print("MACDSolo-TradeModel == 2 H1UI");
                                                  DescSignals += "H1UI ";
                                                  if(IsConfirmed_H1_Buy)
                                                  {         //Print("MACDSolo-IsConfirmed_H1_Buy");//
                                                            PowerIndexPeriodsFrame += 60;//
                                                  }//
                                                  break;//
                                        }
                                        case DOWN_IN:
                                        {         //
                                                  //Print("MACDSolo-TradeModel == 3 H1DI");
                                                  DescSignals += "H1DI ";
                                                  if(IsConfirmed_H1_Sell)
                                                  {         //Print("MACDSolo-IsConfirmed_H1_Sell");//
                                                            PowerIndexPeriodsFrame -= 60;//
                                                  }//
                                                  break;//
                                        }
                                        case DOWN_OUT:
                                        {         //
                                                  //Print("MACDSolo-TradeModel == 4 H1DO");
                                                  DescSignals += "H1DO ";
                                                  if(IsConfirmed_H1_Buy)
                                                  {         //Print("MACDSolo-IsConfirmed_H1_Buy");//
                                                            PowerIndexPeriodsFrame += 60;//
                                                  }//
                                                  break;//
                                        }
                                        default:   break; //
                              } //
                              switch(PeriodM30.MACD_Cross_Signal.eMACD_STATE[0])
                              {         case UP_OUT:
                                        {         //
                                                  //Print("MACDSolo-TradeModel == 1 M30UO");
                                                  DescSignals += "M30UO ";
                                                  if(IsConfirmed_M30_Sell)
                                                  {         //Print("MACDSolo-IsConfirmed_M30_Sell");//
                                                            PowerIndexPeriodsFrame -= 30;//
                                                  } //
                                                  break;//
                                        }
                                        case UP_IN:
                                        {         //
                                                  //Print("MACDSolo-TradeModel == 2 M30UI");
                                                  DescSignals += "M30UI ";
                                                  if(IsConfirmed_M30_Buy)
                                                  {         //Print("MACDSolo-IsConfirmed_M30_Buy");//
                                                            PowerIndexPeriodsFrame += 30;//
                                                  }//
                                                  break;//
                                        }
                                        case DOWN_IN:
                                        {         //
                                                  //Print("MACDSolo-TradeModel == 3 M30DI");
                                                  DescSignals += "M30DI ";
                                                  if(IsConfirmed_M30_Sell)
                                                  {         //Print("MACDSolo-IsConfirmed_M30_Sell");//
                                                            PowerIndexPeriodsFrame -= 30;//
                                                  }//
                                                  break;//
                                        }
                                        case DOWN_OUT:
                                        {         //
                                                  //Print("MACDSolo-TradeModel == 4 M30DO");
                                                  DescSignals += "M30DO ";
                                                  if(IsConfirmed_M30_Buy)
                                                  {         //Print("MACDSolo-IsConfirmed_M30_Buy");//
                                                            PowerIndexPeriodsFrame += 30;//
                                                  }//
                                                  break;//
                                        }
                                        default:   break; //
                              } //
                              switch(PeriodM5.MACD_Cross_Signal.eMACD_STATE[0])
                              {         case UP_OUT:
                                        {         //
                                                  //Print("MACDSolo-TradeModel == 1 M5UO");
                                                  DescSignals += "M5UO ";
                                                  if(IsConfirmed_M5_Sell)
                                                  {         //Print("MACDSolo-IsConfirmed_M5_Sell");//
                                                            PowerIndexPeriodsFrame -= 5;//
                                                  } //
                                                  break;//
                                        }
                                        case UP_IN:
                                        {         //
                                                  //Print("MACDSolo-TradeModel == 2 M30UI");
                                                  DescSignals += "M5UI ";
                                                  if(IsConfirmed_M5_Buy)
                                                  {         //Print("MACDSolo-IsConfirmed_M5_Buy");//
                                                            PowerIndexPeriodsFrame += 5;//
                                                  }//
                                                  break;//
                                        }
                                        case DOWN_IN:
                                        {         //
                                                  //Print("MACDSolo-TradeModel == 3 M5DI");
                                                  DescSignals += "M5DI ";
                                                  if(IsConfirmed_M30_Sell)
                                                  {         //Print("MACDSolo-IsConfirmed_M30_Sell");//
                                                            PowerIndexPeriodsFrame -= 5;//
                                                  }//
                                                  break;//
                                        }
                                        case DOWN_OUT:
                                        {         //
                                                  //Print("MACDSolo-TradeModel == 4 M5DO");
                                                  DescSignals += "M5DO ";
                                                  if(IsConfirmed_M5_Buy)
                                                  {         //Print("MACDSolo-IsConfirmed_M5_Buy");//
                                                            PowerIndexPeriodsFrame += 5;//
                                                  }//
                                                  break;//
                                        }
                                        default:   break; //
                              } //
                    }
                    Print("MACDSolo-", DescSignals);
                    //============================================================================================================================
                    if(1)
                    {         if(PeriodM5.MACD_Cross_Signal.eMACD_STATE[0] == UP_OUT)
                              {         Print("MACDSolo-TradeModel == 1 5UO" + " " + DoubleToString(PowerIndexPeriodsFrame, 0));
                                        if(IsConfirmed_M5_Sell)
                                        {         Print("MACDSolo-IsConfirmed_M5_Sell");
                                                  if(!PeriodM5.MACD_Cross_Signal.MACD_RR[0].IsTargetTP1Achived)
                                                  {         Print("MACDSolo-!IsConfirmed_M5_IsTargetTp1Achived");
                                                            //if(IsConfirmed_Current_Buy)
                                                            {         //Print("MACDSolo-IsConfirmed_Current_Buy");
                                                                      if(!IsConfirmed_MACD_M1_MAIN_Grater_Signal)
                                                                      {         Print("MACDSolo-!IsConfirmed_MACD_M1_MAIN_Grater_Signal");
                                                                                // if(IsConfirmed_MACD_Current_MAIN_Grater_p0_x_Sell) //  || (PeriodM1.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_IN &&  IsConfirmed_Current_Sell)
                                                                                {         //Print("MACDSolo-IsConfirmed_MACD_Current_MAIN_Lower_n0_x_Buy");//!!!!! not handel waves
                                                                                          //if(!IsConfirmed_MACD_M5_Pivot_PP_Lower_Close)
                                                                                          {         //Print("MACDSolo-!IsConfirmed_MACD_M5_Pivot_PP_Lower_Close");
                                                                                                    if(!ct_Drive.TDD.ct_Conductor.DC_data.Indicators._Stochastic_Peroid._M5.IsSignalBuy1_Sell0[0])
                                                                                                    {         Print("MACDSolo-!ct_Drive.TDD.ct_Conductor.DC_data.Indicators._Stochastic_Peroid._M5.IsSignalBuy1_Sell0[0]");
                                                                                                              if(ct_Drive.TDD.ct_Conductor.DC_data.Pivot_Periods._M5.R2 < Close[0] && ct_Drive.TDD.ct_Conductor.DC_data.Pivot_Periods._M5.R3 > Close[0])
                                                                                                              {         Print("MACDSolo-ct_Drive.TDD.ct_Conductor.DC_data.Pivot_Periods._M5.R2 < Close[0] && ct_Drive.TDD.ct_Conductor.DC_data.Pivot_Periods._M5.R3 > Close[0]");
                                                                                                                        ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.IsStartBuy   = 0;  //
                                                                                                                        ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.IsStartSell  = 1; //
                                                                                                                        ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.Desc         = "ms-1S5UO-Start"; ////--  Trender OK 5up 1up
                                                                                                                        ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.ModeDesc     = "TM1"; //
                                                                                                                        ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.IsEndBuy     = 1; //
                                                                                                                        ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.IsEndSell    = 0;  //
                                                                                                              }//
                                                                                                    }//
                                                                                          }//
                                                                                }//
                                                                      }//
                                                                      else
                                                                      {         //buy is better anti trend
                                                                      }//
                                                                      //--------------------------------------------------
                                                                      if(!ct_Drive.TDD.ct_Conductor.DC_data.Indicators._Stochastic_Peroid._M5.IsSignalBuy1_Sell0[0])
                                                                      {         Print("MACDSolo-!ct_Drive.TDD.ct_Conductor.DC_data.Indicators._Stochastic_Peroid._M5.IsSignalBuy1_Sell0[0]");//
                                                                                //if(ct_Drive.TDD.ct_Conductor.DC_data.Pivot_Periods._M5.R2 < Close[0] && ct_Drive.TDD.ct_Conductor.DC_data.Pivot_Periods._M5.R3 > Close[0])
                                                                                {         //Print("ct_Drive.TDD.ct_Conductor.DC_data.Pivot_Periods._M5.R2 < Close[0] && ct_Drive.TDD.ct_Conductor.DC_data.Pivot_Periods._M5.R3 > Close[0]");
                                                                                          ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.IsStartBuy   = 0;  //
                                                                                          ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.IsStartSell  = 1; //
                                                                                          ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.Desc         = "ms-1S5UO-Start"; ////--  Trender OK 5up 1up
                                                                                          ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.ModeDesc     = "TM1"; //
                                                                                          ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.IsEndBuy     = 1; //
                                                                                          ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.IsEndSell    = 0;  //
                                                                                }//
                                                                      }
                                                                      //--------------------------------------------------
                                                            }//
                                                  } //
                                        }//
                              }//
                              if(PeriodM5.MACD_Cross_Signal.eMACD_STATE[0] == UP_IN)
                              {         Print("MACDSolo-TradeModel == 2 5UI" + " " + DoubleToString(PowerIndexPeriodsFrame, 0));
                                        if(IsConfirmed_M5_Buy)
                                        {         Print("MACDSolo-IsConfirmed_M5_Buy");
                                                  if(!PeriodM5.MACD_Cross_Signal.MACD_RR[0].IsTargetTP1Achived)
                                                  {         Print("MACDSolo-!IsConfirmed_M5_IsTargetTp1Achived");//if(IsConfirmed_Current_Buy)
                                                            {         // Print("MACDSolo-IsConfirmed_Current_Buy");
                                                                      if(IsConfirmed_MACD_M1_MAIN_Grater_Signal)
                                                                      {         Print("MACDSolo-IsConfirmed_MACD_M1_MAIN_Grater_Signal");
                                                                                //if(IsConfirmed_MACD_Current_MAIN_Lower_n0_x_Buy)  //!!!!! not handel waves
                                                                                {         //Print("MACDSolo-IsConfirmed_MACD_Current_MAIN_Lower_n0_x_Buy");
                                                                                          //if(IsConfirmed_MACD_M5_Pivot_PP_Lower_Close)
                                                                                          {         //Print("MACDSolo-IsConfirmed_MACD_M5_Pivot_PP_Lower_Close");
                                                                                                    if(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._Stochastic_Peroid._M5.IsSignalBuy1_Sell0[0])
                                                                                                    {         Print("MACDSolo-ct_Drive.TDD.ct_Conductor.DC_data.Indicators._Stochastic_Peroid._M5.IsSignalBuy1_Sell0[0]");
                                                                                                              if(ct_Drive.TDD.ct_Conductor.DC_data.Pivot_Periods._M5.S2 > Close[0] && ct_Drive.TDD.ct_Conductor.DC_data.Pivot_Periods._M5.S3 < Close[0])
                                                                                                              {         Print("MACDSolo-ct_Drive.TDD.ct_Conductor.DC_data.Pivot_Periods._M5.S2 > Close[0] && ct_Drive.TDD.ct_Conductor.DC_data.Pivot_Periods._M5.S3 < Close[0]");
                                                                                                                        ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.IsStartBuy   = 1; //
                                                                                                                        ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.IsStartSell  = 0; //
                                                                                                                        ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.Desc         = "ms-1B5UI-Start"; ////--  Trender OK 5up 1up
                                                                                                                        ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.ModeDesc     = "TM1"; //
                                                                                                                        ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.IsEndBuy     = 0; //
                                                                                                                        ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.IsEndSell    = 1;  //
                                                                                                              }//
                                                                                                    }//
                                                                                          }//
                                                                                }//
                                                                      }//
                                                                      else
                                                                      {         //sell is better anti trend
                                                                      }//
                                                                      //--------------------------------------------------
                                                                      if(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._Stochastic_Peroid._M5.IsSignalBuy1_Sell0[0])
                                                                      {         Print("MACDSolo-ct_Drive.TDD.ct_Conductor.DC_data.Indicators._Stochastic_Peroid._M5.IsSignalBuy1_Sell0[0]");//
                                                                                //if(ct_Drive.TDD.ct_Conductor.DC_data.Pivot_Periods._M5.R2 < Close[0] && ct_Drive.TDD.ct_Conductor.DC_data.Pivot_Periods._M5.R3 > Close[0])
                                                                                {         //Print("ct_Drive.TDD.ct_Conductor.DC_data.Pivot_Periods._M5.R2 < Close[0] && ct_Drive.TDD.ct_Conductor.DC_data.Pivot_Periods._M5.R3 > Close[0]");
                                                                                          ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.IsStartBuy   = 1; //
                                                                                          ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.IsStartSell  = 0; //
                                                                                          ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.Desc         = "ms-1B5UI-Start"; ////--  Trender OK 5up 1up
                                                                                          ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.ModeDesc     = "TM1"; //
                                                                                          ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.IsEndBuy     = 0; //
                                                                                          ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.IsEndSell    = 1;  //
                                                                                }//
                                                                      }
                                                                      //--------------------------------------------------
                                                            }//
                                                  }//
                                        } //
                              }//
                              if(PeriodM5.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_IN)
                              {         Print("MACDSolo-TradeModel == 3 5DI" + " " + DoubleToString(PowerIndexPeriodsFrame, 0));
                                        if(IsConfirmed_M5_Sell)
                                        {         Print("MACDSolo-IsConfirmed_M5_Sell");
                                                  if(!PeriodM5.MACD_Cross_Signal.MACD_RR[0].IsTargetTP1Achived)
                                                  {         Print("MACDSolo-!IsConfirmed_M5_IsTargetTp1Achived");
                                                            //if(IsConfirmed_Current_Buy)
                                                            {         //Print("MACDSolo-IsConfirmed_Current_Buy");
                                                                      if(!IsConfirmed_MACD_M1_MAIN_Grater_Signal)
                                                                      {         Print("MACDSolo-!IsConfirmed_MACD_M1_MAIN_Grater_Signal");
                                                                                //if(IsConfirmed_MACD_Current_MAIN_Lower_n0_x_Buy)//!!!!! not handel waves
                                                                                {         //Print("MACDSolo-IsConfirmed_MACD_Current_MAIN_Lower_n0_x_Buy");
                                                                                          //if(!IsConfirmed_MACD_M5_Pivot_PP_Lower_Close)
                                                                                          {         // Print("MACDSolo-!IsConfirmed_MACD_M5_Pivot_PP_Lower_Close");
                                                                                                    if(!ct_Drive.TDD.ct_Conductor.DC_data.Indicators._Stochastic_Peroid._M5.IsSignalBuy1_Sell0[0])
                                                                                                    {         Print("MACDSolo-!ct_Drive.TDD.ct_Conductor.DC_data.Indicators._Stochastic_Peroid._M5.IsSignalBuy1_Sell0[0]");
                                                                                                              if(ct_Drive.TDD.ct_Conductor.DC_data.Pivot_Periods._M5.R2 < Close[0] && ct_Drive.TDD.ct_Conductor.DC_data.Pivot_Periods._M5.R3 > Close[0])
                                                                                                              {         Print("ct_Drive.TDD.ct_Conductor.DC_data.Pivot_Periods._M5.R2 < Close[0] && ct_Drive.TDD.ct_Conductor.DC_data.Pivot_Periods._M5.R3 > Close[0]");
                                                                                                                        ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.IsStartBuy   = 0;  //
                                                                                                                        ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.IsStartSell  = 1; //
                                                                                                                        ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.Desc         = "ms-1S5DI-Start"; ////--  Trender OK 5up 1up
                                                                                                                        ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.ModeDesc     = "TM1"; //
                                                                                                                        ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.IsEndBuy     = 1; //
                                                                                                                        ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.IsEndSell    = 0;  //
                                                                                                              }//
                                                                                                    }//
                                                                                          }//
                                                                                }//
                                                                      }//
                                                                      else
                                                                      {         //buy is better anti trend
                                                                      }//
                                                                      //--------------------------------------------------
                                                                      if(!ct_Drive.TDD.ct_Conductor.DC_data.Indicators._Stochastic_Peroid._M5.IsSignalBuy1_Sell0[0])
                                                                      {         Print("MACDSolo-!ct_Drive.TDD.ct_Conductor.DC_data.Indicators._Stochastic_Peroid._M5.IsSignalBuy1_Sell0[0]");//
                                                                                //if(ct_Drive.TDD.ct_Conductor.DC_data.Pivot_Periods._M5.R2 < Close[0] && ct_Drive.TDD.ct_Conductor.DC_data.Pivot_Periods._M5.R3 > Close[0])
                                                                                {         //Print("ct_Drive.TDD.ct_Conductor.DC_data.Pivot_Periods._M5.R2 < Close[0] && ct_Drive.TDD.ct_Conductor.DC_data.Pivot_Periods._M5.R3 > Close[0]");
                                                                                          ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.IsStartBuy   = 0;  //
                                                                                          ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.IsStartSell  = 1; //
                                                                                          ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.Desc         = "ms-1S5DI-Start"; ////--  Trender OK 5up 1up
                                                                                          ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.ModeDesc     = "TM1"; //
                                                                                          ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.IsEndBuy     = 1; //
                                                                                          ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.IsEndSell    = 0;  //
                                                                                }//
                                                                      }
                                                                      //--------------------------------------------------
                                                            }//
                                                  }//
                                        } //
                                        else
                                        {         Print("MACDSolo-!IsConfirmed_M5_Sell");//
                                        }//
                              }//
                              if(PeriodM5.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_OUT)               ///////             iMA(NULL,0,70,0,MODE_EMA,PRICE_CLOSE,0) < Close[0];     iMA(NULL,0,1000,0,MODE_EMA,PRICE_CLOSE,0) < Close[0];
                              {         Print("MACDSolo-TradeModel == 4 5DO" + " " + DoubleToString(PowerIndexPeriodsFrame, 0));                        ///////             ct_Drive.TDD.ct_Conductor.DC_data.Indicators._Stochastic_Peroid._M5.IsSignalBuy1_Sell0[0]
                                        if(IsConfirmed_M5_Buy)
                                        {         Print("MACDSolo-IsConfirmed_M5_Buy");
                                                  if(!PeriodM5.MACD_Cross_Signal.MACD_RR[0].IsTargetTP1Achived)
                                                  {         Print("MACDSolo-!IsConfirmed_M5_IsTargetTp1Achived");
                                                            //if(IsConfirmed_Current_Buy)
                                                            {         //Print("MACDSolo-IsConfirmed_Current_Buy");
                                                                      if(IsConfirmed_MACD_M1_MAIN_Grater_Signal)
                                                                      {         Print("MACDSolo-IsConfirmed_MACD_M1_MAIN_Grater_Signal");
                                                                                //if(IsConfirmed_MACD_Current_MAIN_Lower_n0_x_Buy)
                                                                                {         //Print("MACDSolo-IsConfirmed_MACD_Current_MAIN_Lower_n0_x_Buy");//!!!!! not handel waves
                                                                                          //if(IsConfirmed_MACD_M5_Pivot_PP_Lower_Close)
                                                                                          {         //Print("MACDSolo-IsConfirmed_MACD_M5_Pivot_PP_Lower_Close");
                                                                                                    if(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._Stochastic_Peroid._M5.IsSignalBuy1_Sell0[0])
                                                                                                    {         Print("MACDSolo-ct_Drive.TDD.ct_Conductor.DC_data.Indicators._Stochastic_Peroid._M5.IsSignalBuy1_Sell0[0]");
                                                                                                              if(ct_Drive.TDD.ct_Conductor.DC_data.Pivot_Periods._M5.S2 > Close[0] && ct_Drive.TDD.ct_Conductor.DC_data.Pivot_Periods._M5.S3 < Close[0])
                                                                                                              {         Print("MACDSolo-ct_Drive.TDD.ct_Conductor.DC_data.Pivot_Periods._M5.S2 > Close[0] && ct_Drive.TDD.ct_Conductor.DC_data.Pivot_Periods._M5.S3 < Close[0]");
                                                                                                                        ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.IsStartBuy   = 1; //
                                                                                                                        ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.IsStartSell  = 0; //
                                                                                                                        ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.Desc         = "ms-1B5DO-Start"; ////--  Trender OK 5up 1up
                                                                                                                        ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.ModeDesc     = "TM1"; //
                                                                                                                        ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.IsEndBuy     = 0; //
                                                                                                                        ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.IsEndSell    = 1;  //
                                                                                                              }//
                                                                                                    }//
                                                                                          }//
                                                                                }//
                                                                      }//
                                                                      else
                                                                      {         //sell is better anti trend
                                                                      }//
                                                                      //--------------------------------------------------
                                                                      if(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._Stochastic_Peroid._M5.IsSignalBuy1_Sell0[0])
                                                                      {         Print("MACDSolo-ct_Drive.TDD.ct_Conductor.DC_data.Indicators._Stochastic_Peroid._M5.IsSignalBuy1_Sell0[0]");//
                                                                                //if(ct_Drive.TDD.ct_Conductor.DC_data.Pivot_Periods._M5.R2 < Close[0] && ct_Drive.TDD.ct_Conductor.DC_data.Pivot_Periods._M5.R3 > Close[0])
                                                                                {         //Print("ct_Drive.TDD.ct_Conductor.DC_data.Pivot_Periods._M5.R2 < Close[0] && ct_Drive.TDD.ct_Conductor.DC_data.Pivot_Periods._M5.R3 > Close[0]");
                                                                                          ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.IsStartBuy   = 1; //
                                                                                          ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.IsStartSell  = 0; //
                                                                                          ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.Desc         = "ms-1B5DO-Start"; ////--  Trender OK 5up 1up
                                                                                          ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.ModeDesc     = "TM1"; //
                                                                                          ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.IsEndBuy     = 0; //
                                                                                          ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.IsEndSell    = 1;  //
                                                                                }//
                                                                      }
                                                                      //--------------------------------------------------
                                                            }//
                                                  }//
                                        } //
                              }//
                    }//
                    //============================================================================================================================
                    if(0)
                    {         if(TradeModel == 1)
                              {         Print("MACDSolo-TradeModel == 1 5DO-1UI");
                                        if(IsConfirmed_M5_Buy)
                                        {         Print("MACDSolo-IsConfirmed_M5_Buy");
                                                  if(IsConfirmed_Current_Buy)
                                                  {         Print("MACDSolo-IsConfirmed_Current_Buy");
                                                            if(IsConfirmed_MACD_M1_MAIN_Grater_Signal)
                                                            {         Print("MACDSolo-IsConfirmed_MACD_M1_MAIN_Grater_Signal");
                                                                      if(IsConfirmed_MACD_Current_MAIN_Lower_n0_x_Buy)
                                                                      {         Print("MACDSolo-IsConfirmed_MACD_Current_MAIN_Lower_n0_x_Buy");
                                                                                ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.IsStartBuy   = true;  //
                                                                                ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.IsStartSell  = false; //
                                                                                ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.Desc         = "ms-1B5DO-1UIStart"; ////--  Trender OK 5up 1up
                                                                                ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.ModeDesc     = "TM1"; //
                                                                                ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.IsEndBuy     = false; //
                                                                                ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.IsEndSell    = true;  //
                                                                      }//
                                                            }//
                                                  }//
                                        } //
                              }
                              if(TradeModel == 2)
                              {         Print("MACDSolo-TradeModel == 2 5DO-1UO");
                                        if(IsConfirmed_M5_Buy)
                                        {         Print("MACDSolo-IsConfirmed_M5_Buy");
                                                  if(IsConfirmed_Current_Sell)
                                                  {         Print("MACDSolo-IsConfirmed_Current_Sell");
                                                            if(!IsConfirmed_MACD_M1_MAIN_Grater_Signal)
                                                            {         Print("MACDSolo-!IsConfirmed_MACD_M1_MAIN_Grater_Signal");
                                                                      if(IsConfirmed_MACD_Current_MAIN_Grater_p0_x_Sell)
                                                                      {         Print("MACDSolo-IsConfirmed_MACD_Current_MAIN_Grater_p0_x_Sell");
                                                                                ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.IsStartBuy   = false;
                                                                                ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.IsStartSell  = false;  //
                                                                                ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.Desc         = "ms-2B5DO-1UOstop"; ////-- not good to buy antiTrender 5up 1down
                                                                                ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.ModeDesc     = "TM2"; //
                                                                                ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.IsEndBuy     = true;  //
                                                                                ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.IsEndSell    = false; //
                                                                      }//
                                                            }//
                                                  }//
                                        }//
                              }
                              if(TradeModel == 3)
                              {         Print("MACDSolo-TradeModel == 3 5UO-1UI");
                                        if(IsConfirmed_M5_Sell)
                                        {         Print("MACDSolo-IsConfirmed_M5_Sell");
                                                  if(IsConfirmed_Current_Buy)
                                                  {         Print("MACDSolo-IsConfirmed_Current_Buy");
                                                            if(IsConfirmed_MACD_M1_MAIN_Grater_Signal)
                                                            {         Print("MACDSolo-IsConfirmed_MACD_M1_MAIN_Grater_Signal");
                                                                      if(IsConfirmed_MACD_Current_MAIN_Lower_n0_x_Buy)
                                                                      {         Print("MACDSolo-IsConfirmed_MACD_Current_MAIN_Lower_n0_x_Buy"); ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.IsStartBuy   = true;
                                                                                ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.IsStartSell  = false;  //
                                                                                ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.Desc         = "ms-3S5UO-1UIStart"; ////--  Trender
                                                                                ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.ModeDesc     = "TM3"; //
                                                                                ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.IsEndBuy     = false;  //
                                                                                ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.IsEndSell    = true; //
                                                                      }//
                                                            }//
                                                  }//
                                        }//
                              }
                              if(TradeModel == 4)
                              {         Print("MACDSolo-TradeModel == 4 5UO-1UO");
                                        if(IsConfirmed_M5_Sell)
                                        {         Print("MACDSolo-IsConfirmed_M5_Sell");
                                                  if(IsConfirmed_Current_Sell)
                                                  {         Print("IsConfirmed_Current_Sell");
                                                            if(!IsConfirmed_MACD_M1_MAIN_Grater_Signal)
                                                            {         Print("MACDSolo-!IsConfirmed_MACD_M1_MAIN_Grater_Signal");
                                                                      if(IsConfirmed_MACD_Current_MAIN_Grater_p0_x_Sell)
                                                                      {         Print("MACDSolo-IsConfirmed_MACD_Current_MAIN_Grater_p0_x_Sell"); ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.IsStartBuy   = false;
                                                                                ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.IsStartSell  = true;
                                                                                ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.Desc         = "ms-4S5UO-1UOstart"; ////-- Trender 5Down 1Down
                                                                                ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.ModeDesc     = "TM4"; //
                                                                                ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.IsEndBuy     = true;  //
                                                                                ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.IsEndSell    = false; //
                                                                      }//
                                                            }//
                                                  }//
                                        }//
                              }
                              if(TradeModel == 5)
                              {         Print("MACDSolo-TradeModel == 5 UO-1DO");
                                        if(IsConfirmed_M5_Sell)
                                        {         Print("MACDSolo-IsConfirmed_M5_Sell");
                                                  if(IsConfirmed_Current_Buy)
                                                  {         Print("MACDSolo-IsConfirmed_Current_Buy");
                                                            if(IsConfirmed_MACD_M1_MAIN_Grater_Signal )
                                                            {         Print("MACDSolo-IsConfirmed_MACD_M1_MAIN_Grater_Signal");
                                                                      if(IsConfirmed_MACD_Current_MAIN_Lower_n0_x_Buy)
                                                                      {         Print("MACDSolo-IsConfirmed_MACD_Current_MAIN_Lower_n0_x_Buy");  ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.IsStartBuy   = false; //
                                                                                ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.IsStartSell  = false;  //
                                                                                ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.Desc         = "ms-5S5UO-1DOstop"; ////-- not good to Sell antiTrender
                                                                                ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.ModeDesc     = "TM5"; //
                                                                                ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.IsEndBuy     = true;  //
                                                                                ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.IsEndSell    = false; //
                                                                      }//
                                                            }//
                                                  }//
                                        }//
                              }
                              if(TradeModel == 6)
                              {         Print("MACDSolo-TradeModel == 6 5UO-1DI");
                                        if(IsConfirmed_M5_Sell)
                                        {         Print("MACDSolo-IsConfirmed_M5_Sell");
                                                  if(IsConfirmed_Current_Sell)
                                                  {         Print("MACDSolo-IsConfirmed_Current_Sell");
                                                            if(!IsConfirmed_MACD_M1_MAIN_Grater_Signal)
                                                            {         Print("MACDSolo-!IsConfirmed_MACD_M1_MAIN_Grater_Signal");
                                                                      if(IsConfirmed_MACD_Current_MAIN_Grater_p0_x_Sell)
                                                                      {         Print("MACDSolo-IsConfirmed_MACD_Current_MAIN_Grater_p0_x_Sell"); ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.IsStartBuy   = false; //
                                                                                ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.IsStartSell  = true; //
                                                                                ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.Desc         = "ms-6S5UO-1DIstop"; ////-- Trender 5Down 1Down
                                                                                ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.ModeDesc     = "TM6"; //
                                                                                ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.IsEndBuy     = true; //
                                                                                ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.IsEndSell    = false; //
                                                                      }//
                                                            }//
                                                  }//
                                        }//
                              }
                              if(TradeModel == 7)
                              {         Print("MACDSolo-TradeModel == 7 5DO-1DO");
                                        if(IsConfirmed_M5_Buy)
                                        {         Print("MACDSolo-IsConfirmed_M5_Buy");
                                                  if(IsConfirmed_Current_Buy)
                                                  {         Print("MACDSolo-IsConfirmed_Current_Buy");
                                                            if(IsConfirmed_MACD_M1_MAIN_Grater_Signal)
                                                            {         Print("MACDSolo-IsConfirmed_MACD_M1_MAIN_Grater_Signal");
                                                                      if(IsConfirmed_MACD_Current_MAIN_Lower_n0_x_Buy)
                                                                      {         Print("MACDSolo-IsConfirmed_MACD_Current_MAIN_Lower_n0_x_Buy"); ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.IsStartBuy   = true; //
                                                                                ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.IsStartSell  = false;  //
                                                                                ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.Desc         = "ms-7B5DO-1DOstart"; ////-- Trender 5up 1up
                                                                                ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.ModeDesc     = "TM7"; //
                                                                                ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.IsEndBuy     = false;  //
                                                                                ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.IsEndSell    = true; //
                                                                      }//
                                                            }//
                                                  }//
                                        }//
                              }
                              if(TradeModel == 8)
                              {         Print("MACDSolo-TradeModel == 8 5DO-1DI");
                                        if(IsConfirmed_M5_Buy)
                                        {         Print("MACDSolo-IsConfirmed_M5_Buy");
                                                  if(IsConfirmed_Current_Buy)
                                                  {         Print("MACDSolo-IsConfirmed_Current_Buy");
                                                            if(!IsConfirmed_MACD_M1_MAIN_Grater_Signal)
                                                            {         Print("MACDSolo-!IsConfirmed_MACD_M1_MAIN_Grater_Signal");
                                                                      if(IsConfirmed_MACD_Current_MAIN_Lower_n0_x_Buy)
                                                                      {         Print("MACDSolo-IsConfirmed_MACD_Current_MAIN_Lower_n0_x_Buy");  ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.IsStartBuy   = false; //
                                                                                ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.IsStartSell  = false; //
                                                                                ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.Desc         = "ms-8B5DO-1DIstop"; ////-- not good to Sell antiTrender
                                                                                ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.ModeDesc     = "TM8"; //
                                                                                ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.IsEndBuy     = false; //
                                                                                ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.IsEndSell    = false; //
                                                                      }//
                                                            }//
                                                  }//
                                        }//
                              }//
                    }//
//============================================================================================================================
                    /*
                     if
                     (
                               //ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.E_MACD_Cross_Signal[0] == Et_MACD_Cross_Signal_Up_Selling &&
                               //ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M5.MACD_Cross_Signal.E_MACD_Cross_Signal[0] == Et_MACD_Cross_Signal_Up_Selling ||
                               ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.eMACD_STATE[0] == UP_IN ||
                               ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_OUT
                     )//gone sell
                     {         //
                               //Print("maCurrent_t_iMACD_Main_12_26_9_PriceClose: ", DoubleToString(maCurrent_t_iMACD_Main_12_26_9_PriceClose, 3), " " "t_iMACD_Signal_12_26_9_PriceClose[0]._Value:", DoubleToString(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.t_iMACD_Signal_12_26_9_PriceClose[0]._Value, 3)); //
                               Print("MACDSolo_Trader Detected Sell 1 ", EnumToString(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.eMACD_STATE[0])); //
                               if(Close[1] < ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.BarPrice[0])
                               {         Print("MACDSolo_Trader Detected Sell 1.1 ", EnumToString(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.eMACD_STATE[0]));//
                                         //if
                                         //(
                                         //          ct_Drive.TDD.ct_Conductor.DC_data.Pivot_Periods._M1.R2 < Bid &&
                                         //          ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.maCurrent_t_iMACD_Main_12_26_9_PriceClose > ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.t_iMACD_Signal_12_26_9_PriceClose[1]._Value
                                         //)
                                         {         Print("MACDSolo_Trader Detected Sell 1.1.1 ", EnumToString(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.eMACD_STATE[0]));//
                                                   ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.IsStartBuy      = 0;
                                                   ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.IsStartSell     = 1; //
                                                   ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.Desc       = "ms-S"; //
                                                   ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.ModeDesc   = "DirectTrade"; //
                                         } //
                               }//
                               else
                               {         Print("MACDSolo_Trader Detected Sell 1.2 ", EnumToString(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.eMACD_STATE[0]));//
                                         //if
                                         //(
                                         //          ct_Drive.TDD.ct_Conductor.DC_data.Pivot_Periods._M1.S2 > Ask &&
                                         //          ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M5.maCurrent_t_iMACD_Main_12_26_9_PriceClose < ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M5.t_iMACD_Signal_12_26_9_PriceClose[1]._Value
                                         //)
                                         {         Print("MACDSolo_Trader Detected Sell 1.2.1 ", EnumToString(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.eMACD_STATE[0]));//
                                                   ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.IsStartBuy      = 1;
                                                   ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.IsStartSell     = 0; //
                                                   ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.Desc       = "ms2-B"; //
                                                   ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.ModeDesc   = "unDirectTrade"; //
                                         } //
                               }//
                     }
                     //---------------------------------------------------------------------------------------------------------------------------------------------------------------
                     if
                     (
                               //ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.E_MACD_Cross_Signal[0] == Et_MACD_Cross_Signal_Down_Buying &&
                               //ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M5.MACD_Cross_Signal.E_MACD_Cross_Signal[0] == Et_MACD_Cross_Signal_Down_Buying ||
                               ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_IN ||
                               ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.eMACD_STATE[0] == UP_OUT
                     )//gone buy
                     {         //
                               //Print("maCurrent_t_iMACD_Main_12_26_9_PriceClose: ", DoubleToString(maCurrent_t_iMACD_Main_12_26_9_PriceClose, 3), " " "t_iMACD_Signal_12_26_9_PriceClose[0]._Value:", DoubleToString(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.t_iMACD_Signal_12_26_9_PriceClose[0]._Value, 3)); //
                               Print("MACDSolo_Trader Detected Buy 1 ", EnumToString(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.eMACD_STATE[0]));//
                               if
                               (
                                         Close[1] > ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.BarPrice[0]
                               )
                               {         Print("MACDSolo_Trader Detected Buy 1.1 ", EnumToString(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.eMACD_STATE[0]));//
                                         //if
                                         //(
                                         //          ct_Drive.TDD.ct_Conductor.DC_data.Pivot_Periods._M1.R2 < Bid &&
                                         //          ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.maCurrent_t_iMACD_Main_12_26_9_PriceClose < ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.t_iMACD_Signal_12_26_9_PriceClose[1]._Value
                                         //)
                                         {         Print("MACDSolo_Trader Detected Buy 1.1.1 ", EnumToString(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.eMACD_STATE[0]));//
                                                   ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.IsStartBuy      = 1;
                                                   ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.IsStartSell     = 0; //
                                                   ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.Desc       = "ms-B"; //
                                                   ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.ModeDesc   = "DirectTrade"; //
                                         } //
                               }//
                               else
                               {         Print("MACDSolo_Trader Detected Buy 1.2 ", EnumToString(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.eMACD_STATE[0]));//
                                         //if
                                         //(
                                         //          ct_Drive.TDD.ct_Conductor.DC_data.Pivot_Periods._M1.S2 > Ask &&
                                         //          ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.maCurrent_t_iMACD_Main_12_26_9_PriceClose > ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.t_iMACD_Signal_12_26_9_PriceClose[1]._Value
                                         //)
                                         {         Print("MACDSolo_Trader Detected Buy 1.2.1 ", EnumToString(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.eMACD_STATE[0]));//
                                                   ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.IsStartBuy      = 0;
                                                   ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.IsStartSell     = 1; //
                                                   ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.Desc       = "ms2-S"; //
                                                   ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.ModeDesc   = "unDirectTrade"; //
                                         } //
                               }//
                     } //
                     */
          }//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void St_CondicatorData_Extern_Signals::Strategies_FE_TRADER()
{
//---
          ct_Drive.TDD.ct_Signals.TICC.Final_FE_Trade_Condition_Signal.IsStartBuy    = 0;
          ct_Drive.TDD.ct_Signals.TICC.Final_FE_Trade_Condition_Signal.IsStartSell   = 0; //
          ct_Drive.TDD.ct_Signals.TICC.Final_FE_Trade_Condition_Signal.Desc     = "";
          if(ct_Drive.TDD.ct_Signals.DATAS.Is_Pressed_FE_Trader)
          {         //------------------------------
                    //--Signal onTp1 Bulish
                    Print("GoldVIP.Signals_Periods._M5.IsTp1Achived: ", GoldVIP.Signals_Periods._M5.IsTp1Achived);
                    if(GoldVIP.Signals_Periods._M5.IsBulish)//Signals_Periods._M5/// period._M5.Is_TP1_Achived //Signals_Periods._M5.TP1ValueCalc
                    {         Print("GoldVIP.Signals_Periods._M5.IsBulish: ", GoldVIP.Signals_Periods._M5.IsBulish);
                              if(!GoldVIP.Signals_Periods._M5.IsTp1Achived)
                              {         Print("GoldVIP.Signals_Periods._M5.IsTp1Achived: ", GoldVIP.Signals_Periods._M5.IsTp1Achived);
                                        ct_Drive.TDD.ct_Signals.TICC.Final_FE_Trade_Condition_Signal.IsStartBuy      = 1;
                                        ct_Drive.TDD.ct_Signals.TICC.Final_FE_Trade_Condition_Signal.IsStartSell     = 0; //
                                        ct_Drive.TDD.ct_Signals.TICC.Final_FE_Trade_Condition_Signal.Desc       = "FE-B0.61"; //
                                        ct_Drive.TDD.ct_Signals.TICC.Final_FE_Trade_Condition_Signal.ModeDesc   = "DirectTrade";//
                              }
                              //--Signal onTp2  Bulish
                              if(GoldVIP.Signals_Periods._M5.IsTp2Achived)
                              {         Print("GoldVIP.Signals_Periods._M5.IsTp2Achived: ", GoldVIP.Signals_Periods._M5.IsTp2Achived);
                                        ct_Drive.TDD.ct_Signals.TICC.Final_FE_Trade_Condition_Signal.IsStartBuy      = 1;
                                        ct_Drive.TDD.ct_Signals.TICC.Final_FE_Trade_Condition_Signal.IsStartSell     = 1; //
                                        ct_Drive.TDD.ct_Signals.TICC.Final_FE_Trade_Condition_Signal.Desc       = "FE-B1.00"; //
                                        ct_Drive.TDD.ct_Signals.TICC.Final_FE_Trade_Condition_Signal.ModeDesc   = "DirectTrade";//
                              }
                              //--Signal onTp3  Bulish
                              if(GoldVIP.Signals_Periods._M5.IsTp3Achived)
                              {         Print("GoldVIP.Signals_Periods._M5.IsTp3Achived: ", GoldVIP.Signals_Periods._M5.IsTp3Achived);
                                        ct_Drive.TDD.ct_Signals.TICC.Final_FE_Trade_Condition_Signal.IsStartBuy      = 0;
                                        ct_Drive.TDD.ct_Signals.TICC.Final_FE_Trade_Condition_Signal.IsStartSell     = 1; //
                                        ct_Drive.TDD.ct_Signals.TICC.Final_FE_Trade_Condition_Signal.Desc       = "FE-B1.61"; //
                                        ct_Drive.TDD.ct_Signals.TICC.Final_FE_Trade_Condition_Signal.ModeDesc   = "DirectTrade";//
                              } //
                    }
                    //------------------------------
                    //--Signal onTp1 Bearish
                    else
                    {         Print("GoldVIP.Signals_Periods._M5.IsBulish: ", GoldVIP.Signals_Periods._M5.IsBulish);
                              if(!GoldVIP.Signals_Periods._M5.IsTp1Achived  )
                              {         Print("GoldVIP.Signals_Periods._M5.IsTp1Achived: ", GoldVIP.Signals_Periods._M5.IsTp1Achived);
                                        ct_Drive.TDD.ct_Signals.TICC.Final_FE_Trade_Condition_Signal.IsStartBuy      = 1;
                                        ct_Drive.TDD.ct_Signals.TICC.Final_FE_Trade_Condition_Signal.IsStartSell     = 0; //
                                        ct_Drive.TDD.ct_Signals.TICC.Final_FE_Trade_Condition_Signal.Desc       = "FE-S0.61"; //
                                        ct_Drive.TDD.ct_Signals.TICC.Final_FE_Trade_Condition_Signal.ModeDesc   = "DirectTrade";//
                              }
                              //--Signal onTp2  Bearish
                              if(GoldVIP.Signals_Periods._M5.IsTp2Achived  )
                              {         Print("GoldVIP.Signals_Periods._M5.IsTp2Achived: ", GoldVIP.Signals_Periods._M5.IsTp2Achived);
                                        ct_Drive.TDD.ct_Signals.TICC.Final_FE_Trade_Condition_Signal.IsStartBuy      = 0;
                                        ct_Drive.TDD.ct_Signals.TICC.Final_FE_Trade_Condition_Signal.IsStartSell     = 1; //
                                        ct_Drive.TDD.ct_Signals.TICC.Final_FE_Trade_Condition_Signal.Desc       = "FE-S1.00"; //
                                        ct_Drive.TDD.ct_Signals.TICC.Final_FE_Trade_Condition_Signal.ModeDesc   = "DirectTrade";//
                              }
                              //--Signal onTp3  Bearish
                              if(GoldVIP.Signals_Periods._M5.IsTp3Achived  )
                              {         Print("GoldVIP.Signals_Periods._M5.IsTp3Achived: ", GoldVIP.Signals_Periods._M5.IsTp3Achived);
                                        ct_Drive.TDD.ct_Signals.TICC.Final_FE_Trade_Condition_Signal.IsStartBuy      = 0;
                                        ct_Drive.TDD.ct_Signals.TICC.Final_FE_Trade_Condition_Signal.IsStartSell     = 1; //
                                        ct_Drive.TDD.ct_Signals.TICC.Final_FE_Trade_Condition_Signal.Desc       = "FE-S1.61"; //
                                        ct_Drive.TDD.ct_Signals.TICC.Final_FE_Trade_Condition_Signal.ModeDesc   = "DirectTrade";//
                              }//
                    }
                    //------------------------------
          } //
//---
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void St_CondicatorData_Extern_Signals::CHEACK_OUT_TRADE_SIGNAL_Flags_______For_ChartAnalise_Channel()
{         //-----------------------
          CHEACK_OUT_TRADE_Objects______For_ChartAnalise_Channel();           // #2b#3c#4c#5a
          CHEACK_OUT_TRADE_Criterions___For_ChartAnalise_Channel();        // #2b#3c#4c#5b
          CHEACK_OUT_TRADE_Alternative__For_ChartAnalise_Channel();       // #2b#3c#4c#5c
          //-----------------------
          //+------------------------------------------------------------------+
          //|        Reset Variables simple Complex Condition                  |
          //+------------------------------------------------------------------+
          Data.FLAGs.ChartAnalise_Channel.Basic.flag_2_Is_Basic__Is_Range_Accepted_Buy_long      = false;
          Data.FLAGs.ChartAnalise_Channel.Basic.flag_2_Is_Basic__Is_Under_Middle                 = false;
          Data.FLAGs.ChartAnalise_Channel.Super.flag_2_Is_Super__Buy_Condition                   = false;
          Data.FLAGs.ChartAnalise_Channel.Super.flag_2_Is_Super__Sell_Condition                  = false;
          //-------------------------
          Data.FLAGs.ChartAnalise_Channel.Super.flag_2_Is_Super__Result_Coming_Down_Wave_Sell  = false;//
          Data.FLAGs.ChartAnalise_Channel.Super.flag_2_Is_Super__Result_Coming_Down_Wave_Buy   = false;//
          Data.FLAGs.ChartAnalise_Channel.Super.flag_2_Is_Super__Result_Coming_Up_Wave_Buy     = false;//
          Data.FLAGs.ChartAnalise_Channel.Super.flag_2_Is_Super__Result_Coming_Up_Wave_Sell    = false;//
          //+------------------------------------------------------------------+
          //|        Cheack simple Complex Condition                           |
          //+------------------------------------------------------------------+
          //---cheack outs Complex set flags
          {         Data.FLAGs.ChartAnalise_Channel.Complex.dbl_Complex_Range_Channel_half_thirs_Up                      = ( ( ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Middle_Up.Z._Price - ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.GDS.Wave0_1_4_5_Middle.S._Price) / 3);
                    Data.FLAGs.ChartAnalise_Channel.Complex.dbl_Complex_Traget_Up_middle_channel_Price                   =  ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.GDS.Wave0_1_4_5_Middle.Z._Price + Data.FLAGs.ChartAnalise_Channel.Complex.dbl_Complex_Range_Channel_half_thirs_Up * 1.5;
                    //
                    Data.FLAGs.ChartAnalise_Channel.Complex.dbl_Complex_Range_Channel_half_thirs_Down                    = ( ( ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.GDS.Wave0_1_4_5_Middle.S._Price - ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Middle_Down.Z._Price) / 3);
                    Data.FLAGs.ChartAnalise_Channel.Complex.dbl_Complex_Traget_Down_middle_channel_Price                 =  ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.GDS.Wave0_1_4_5_Middle.Z._Price - Data.FLAGs.ChartAnalise_Channel.Complex.dbl_Complex_Range_Channel_half_thirs_Down * 1.5;//
          }
          //---cheack outs simple set flags
          {         //
                    Data.FLAGs.ChartAnalise_Channel.Basic.flag_2_Is_Basic__Trend_Keep_TL_2_4_TL_1_3___Keep_Up              = ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Current_Trend_Keep_TL_2_4_TL_1_3 == E_Keep_Up;
                    Data.FLAGs.ChartAnalise_Channel.Basic.flag_2_Is_Basic__Trend_Keep_TL_2_4_TL_1_3__Keep_Down             = ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Current_Trend_Keep_TL_2_4_TL_1_3 == E_Keep_Down;
                    Data.FLAGs.ChartAnalise_Channel.Basic.flag_2_Is_Basic__Is_Range_Accepted_Buy_long                      = ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Middle_Channel_Ceil_Bar0.Diff_Ask > ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Middle_Channel_Floor_Bar0.Diff_Ask;
                    Data.FLAGs.ChartAnalise_Channel.Basic.flag_2_Is_Basic__Is_Under_Middle                                 = ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.GDS.Wave0_1_4_5_Middle.S._Price > Ask;
                    //
                    Data.FLAGs.ChartAnalise_Channel.Basic.flag_2_Is_Basic__W4_Under_W2                                     = ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.GDS.Wave4.Z._Price < ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.GDS.Wave2.Z._Price;
                    Data.FLAGs.ChartAnalise_Channel.Basic.flag_2_Is_Basic__W5_Above_W3                                     = ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.GDS.Wave3.Z._Price < ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.GDS.Wave5.Z._Price;
                    Data.FLAGs.ChartAnalise_Channel.Basic.flag_2_Is_Basic__Before_Wave_Passed                              = ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.GDS.Wave5.Wave_Type_Before == E_Passed;
                    Data.FLAGs.ChartAnalise_Channel.Complex.flag_2_Is_Complex__Maximum_Correction_Under_Correction_50      = (ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.GDS.Wave5.Wave_Type_After == E_Correcton_50) || (ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.GDS.Wave5.Wave_Type_After == E_Correcton_30) || (ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.GDS.Wave5.Wave_Type_After == E_Correcton_10);
                    //--
          }
          //---cheack outs complex set flags
          {         Data.FLAGs.ChartAnalise_Channel.Super.flag_2_Is_Super__Buy_Condition                                   = (Data.FLAGs.ChartAnalise_Channel.Basic.flag_2_Is_Basic__Trend_Keep_TL_2_4_TL_1_3___Keep_Up && Data.FLAGs.Indicators_WPR.Basic.flag_2_Is_Basic__Bulish_MovingAvrage_iWPR_200)    || (ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.E_MACD_Cross_Signal[0] == Et_MACD_Cross_Signal_Down_Buying ) ;
                    Data.FLAGs.ChartAnalise_Channel.Super.flag_2_Is_Super__Sell_Condition                                  = (Data.FLAGs.ChartAnalise_Channel.Basic.flag_2_Is_Basic__Trend_Keep_TL_2_4_TL_1_3__Keep_Down && !Data.FLAGs.Indicators_WPR.Basic.flag_2_Is_Basic__Bulish_MovingAvrage_iWPR_200)  || (ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.E_MACD_Cross_Signal[0] == Et_MACD_Cross_Signal_Up_Selling);
                    //
                    Data.FLAGs.ChartAnalise_Channel.Complex.flag_2_Is_Complex__Allow                                       = Data.FLAGs.ChartAnalise_Channel.Basic.flag_2_Is_Basic__Is_Range_Accepted_Buy_long && Data.FLAGs.ChartAnalise_Channel.Basic.flag_2_Is_Basic__Is_Under_Middle;
                    //
                    Data.FLAGs.ChartAnalise_Channel.Super.flag_2_Is_Super__Result_Coming_Down_Wave_Sell                    = Data.FLAGs.ChartAnalise_Channel.Basic.flag_2_Is_Basic__W4_Under_W2 && Data.FLAGs.ChartAnalise_Channel.Basic.flag_2_Is_Basic__Before_Wave_Passed && Data.FLAGs.ChartAnalise_Channel.Complex.flag_2_Is_Complex__Maximum_Correction_Under_Correction_50      && ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.Signals.Is_SM_0_Sell_Supportive;   //--- && Is_Place_Thirden__E_Lower_Thirden
                    Data.FLAGs.ChartAnalise_Channel.Super.flag_2_Is_Super__Result_Coming_Down_Wave_Buy                     = Data.FLAGs.ChartAnalise_Channel.Basic.flag_2_Is_Basic__W4_Under_W2 && Data.FLAGs.ChartAnalise_Channel.Basic.flag_2_Is_Basic__Before_Wave_Passed && Data.FLAGs.ChartAnalise_Channel.Complex.flag_2_Is_Complex__Maximum_Correction_Under_Correction_50      && ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.Signals.Is_SM_0_Sell_Resistancive; //--- && Is_Place_Thirden__E_Lower_Thirden
                    Data.FLAGs.ChartAnalise_Channel.Super.flag_2_Is_Super__Result_Coming_Up_Wave_Buy                       = Data.FLAGs.ChartAnalise_Channel.Basic.flag_2_Is_Basic__W4_Under_W2 && Data.FLAGs.ChartAnalise_Channel.Basic.flag_2_Is_Basic__Before_Wave_Passed && Data.FLAGs.ChartAnalise_Channel.Basic.flag_2_Is_Basic__W5_Above_W3 && ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.Signals.Is_SM_0_Buy_Supportive;
                    Data.FLAGs.ChartAnalise_Channel.Super.flag_2_Is_Super__Result_Coming_Up_Wave_Sell                      = Data.FLAGs.ChartAnalise_Channel.Basic.flag_2_Is_Basic__W4_Under_W2 && Data.FLAGs.ChartAnalise_Channel.Basic.flag_2_Is_Basic__Before_Wave_Passed && Data.FLAGs.ChartAnalise_Channel.Basic.flag_2_Is_Basic__W5_Above_W3 && ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.Signals.Is_SM_0_Buy_Resistancive;
                    //
          }//
          {         if(ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Is_InSide_Middle_Channel_Floor_Ceil_Bar0)                 {Data.FLAGs.ChartAnalise_Channel.Basic.flag_2_Is_InsideChannel        = true;                                        Data.Enum_Signal_temp_Desc = gf_Desc_ADD(Data.Enum_Signal_temp_Desc, "[IsMC]");   }
                    else                                                                                                                         {Data.FLAGs.ChartAnalise_Channel.Basic.flag_2_Is_InsideChannel        = false;                                       Data.Enum_Signal_temp_Desc = gf_Desc_ADD(Data.Enum_Signal_temp_Desc, "[OSMC]");    }
                    //---------------------------------------------------
                    if(ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Is_Bulish_All_Middle)                                  {Data.FLAGs.ChartAnalise_Channel.Basic.flag_2_Is_Bullish              = true;                                        Data.Enum_Signal_temp_Desc = gf_Desc_ADD(Data.Enum_Signal_temp_Desc, "[+B]");  ct_Drive.TDD.ct_Signals.DATAS.Signals_ChartAnalises.Point_Suport = ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Middle_Down.S;   ct_Drive.TDD.ct_Signals.DATAS.Signals_ChartAnalises.Point_Resstance = ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Middle_Up.S; }         //-- [Bulish] [+B]
                    else                                                                                                                         {Data.FLAGs.ChartAnalise_Channel.Basic.flag_2_Is_Bullish              = false;                                       Data.Enum_Signal_temp_Desc = gf_Desc_ADD(Data.Enum_Signal_temp_Desc, "[-B]]"); ct_Drive.TDD.ct_Signals.DATAS.Signals_ChartAnalises.Point_Suport = ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Middle_Up.S;     ct_Drive.TDD.ct_Signals.DATAS.Signals_ChartAnalises.Point_Resstance = ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Middle_Down.S; }         //-- [Bearish][-B]
                    //---------------------------------------------------
                    if(ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Middle_Channel_Ceil_Bar0.Is_Touched)                     {Data.FLAGs.ChartAnalise_Channel.Basic.flag_3_MCDB0IT                 = E_MCDB0IT_Up;                                Data.Enum_Signal_temp_Desc = gf_Desc_ADD(Data.Enum_Signal_temp_Desc, "[UBT]");      }
                    else if(ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Middle_Channel_Floor_Bar0.Is_Touched)              {Data.FLAGs.ChartAnalise_Channel.Basic.flag_3_MCDB0IT                 = E_MCDB0IT_Down;                              Data.Enum_Signal_temp_Desc = gf_Desc_ADD(Data.Enum_Signal_temp_Desc, "[DBT]");      }
                    else                                                                                                                         {Data.FLAGs.ChartAnalise_Channel.Basic.flag_3_MCDB0IT                 = E_MCDB0IT_Void;                              Data.Enum_Signal_temp_Desc = gf_Desc_ADD(Data.Enum_Signal_temp_Desc, "[VBT]");      }
                    //---------------------------------------------------
                    if(ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Is_OutSide_Middle_Channel_Floor_Bar0)                   {Data.FLAGs.ChartAnalise_Channel.Basic.flag_3_IOSMCDB0                = E_IOSMCDB0_Down;                             Data.Enum_Signal_temp_Desc = gf_Desc_ADD(Data.Enum_Signal_temp_Desc, "[DB0]");      }
                    else if(ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Is_OutSide_Middle_Channel_Ceil_Bar0)                {Data.FLAGs.ChartAnalise_Channel.Basic.flag_3_IOSMCDB0                = E_IOSMCDB0_Down;                             Data.Enum_Signal_temp_Desc = gf_Desc_ADD(Data.Enum_Signal_temp_Desc, "[UB0]");      }
                    else                                                                                                                         {Data.FLAGs.ChartAnalise_Channel.Basic.flag_3_IOSMCDB0                = E_IOSMCDB0_Void;                             Data.Enum_Signal_temp_Desc = gf_Desc_ADD(Data.Enum_Signal_temp_Desc, "[VB0]");      }
                    //---------------------------------------------------
                    if      (ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Is_Place_Thirden__E_Lower)               {Data.FLAGs.ChartAnalise_Channel.Basic.flag_3_Place_Thirden           = E_Place_Thirden_Lower;                        Data.Enum_Signal_temp_Desc = gf_Desc_ADD(Data.Enum_Signal_temp_Desc, "[LT]");      ct_Drive.TDD.ct_Signals.DATAS.Signals_ChartAnalises.Point_Suport = ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Middle_Down.S;               ct_Drive.TDD.ct_Signals.DATAS.Signals_ChartAnalises.Point_Resstance = ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Middle_Middle_Down.S; }         //
                    else if (ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Is_Place_Thirden__E_Middle)              {Data.FLAGs.ChartAnalise_Channel.Basic.flag_3_Place_Thirden           = E_Place_Thirden_Middle;                       Data.Enum_Signal_temp_Desc = gf_Desc_ADD(Data.Enum_Signal_temp_Desc, "[MT]");      ct_Drive.TDD.ct_Signals.DATAS.Signals_ChartAnalises.Point_Suport = ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Middle_Middle_Down.S;        ct_Drive.TDD.ct_Signals.DATAS.Signals_ChartAnalises.Point_Resstance = ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Middle_Middle_Up.S; }         //
                    else if (ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Is_Place_Thirden__E_Upper)               {Data.FLAGs.ChartAnalise_Channel.Basic.flag_3_Place_Thirden           = E_Place_Thirden_Upper;                        Data.Enum_Signal_temp_Desc = gf_Desc_ADD(Data.Enum_Signal_temp_Desc, "[UT]");      ct_Drive.TDD.ct_Signals.DATAS.Signals_ChartAnalises.Point_Suport = ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Middle_Middle_Up.S;          ct_Drive.TDD.ct_Signals.DATAS.Signals_ChartAnalises.Point_Resstance = ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Middle_Up.S;}         //
                    else                                                                                                                         {Data.FLAGs.ChartAnalise_Channel.Basic.flag_3_Place_Thirden           = E_Place_Thirden_Void;                         Data.Enum_Signal_temp_Desc = gf_Desc_ADD(Data.Enum_Signal_temp_Desc, "[VT]");}
                    //---------------------------------------------------
                    if(ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Is_Current_Direction_TL_2_4_TL_1_3_UpWard)             {Data.FLAGs.ChartAnalise_Channel.Basic.flag_3_Direction               = E_Direction_UpWard;                           Data.Enum_Signal_temp_Desc = gf_Desc_ADD(Data.Enum_Signal_temp_Desc, "[UW]");       }         //// UpWard
                    else if (ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Is_Current_Direction_TL_2_4_TL_1_3_DownWard)     {Data.FLAGs.ChartAnalise_Channel.Basic.flag_3_Direction               = E_Direction_DownWard;                         Data.Enum_Signal_temp_Desc = gf_Desc_ADD(Data.Enum_Signal_temp_Desc, "[DW]");       }         //// DownWard
                    else if (ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Is_Current_Direction_TL_2_4_TL_1_3_Side)         {Data.FLAGs.ChartAnalise_Channel.Basic.flag_3_Direction               = E_Direction_Side;                             Data.Enum_Signal_temp_Desc = gf_Desc_ADD(Data.Enum_Signal_temp_Desc, "[SW]");       }         //// SideWard
                    else                                                                                                                         {Data.FLAGs.ChartAnalise_Channel.Basic.flag_3_Direction               = E_Direction_Void;                             Data.Enum_Signal_temp_Desc = gf_Desc_ADD(Data.Enum_Signal_temp_Desc, "[VW]");}
                    //
          }//
          {         if(Data.FLAGs.ChartAnalise_Channel.Complex.dbl_Complex_Traget_Up_middle_channel_Price < Bid)                                 {Data.FLAGs.ChartAnalise_Channel.Basic.flag_2_Is_Over_Up_Buy              = true;                                         ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc0 = gf_Desc_ADD(ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc0, "[+OUB]"); }       //-- Is_Over_Up_Sell                                 = (Traget_Down_middle_channel_Price > Ask) ? true : false;
                    else                                                                                                                         {Data.FLAGs.ChartAnalise_Channel.Basic.flag_2_Is_Over_Up_Buy              = false;                                        ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc0 = gf_Desc_ADD(ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc0, "[-OUB]"); }
                    if(Data.FLAGs.ChartAnalise_Channel.Complex.dbl_Complex_Traget_Down_middle_channel_Price > Ask)                               {Data.FLAGs.ChartAnalise_Channel.Basic.flag_2_Is_Over_Down_Sell           = true;                                         ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc0 = gf_Desc_ADD(ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc0, "[+ODS]"); }
                    else                                                                                                                         {Data.FLAGs.ChartAnalise_Channel.Basic.flag_2_Is_Over_Down_Sell           = false;                                        ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc0 = gf_Desc_ADD(ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc0, "[-ODS]"); }
                    //------------------------------------------------
                    if(Data.FLAGs.ChartAnalise_Channel.Basic.flag_2_Is_Basic__Is_Range_Accepted_Buy_long)                                        {Data.FLAGs.ChartAnalise_Channel.Basic.flag_2_Is_Basic__Is_Range_Accepted_Buy_long  = true;                                         ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc0 = gf_Desc_ADD(ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc0, "[+IRABL]"); }
                    else                                                                                                                         {Data.FLAGs.ChartAnalise_Channel.Basic.flag_2_Is_Basic__Is_Range_Accepted_Buy_long  = false;                                        ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc0 = gf_Desc_ADD(ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc0, "[-IRABL]"); }
                    //------------------------------------------------
                    if(Data.FLAGs.ChartAnalise_Channel.Basic.flag_2_Is_Basic__Is_Under_Middle)                                                   {Data.FLAGs.ChartAnalise_Channel.Basic.flag_2_Is_Basic__Is_Under_Middle             = true;                                         ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc0 = gf_Desc_ADD(ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc0, "[+IUM]");   }
                    else                                                                                                                         {Data.FLAGs.ChartAnalise_Channel.Basic.flag_2_Is_Basic__Is_Under_Middle             = false;                                        ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc0 = gf_Desc_ADD(ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc0, "[-IUM]");   }
                    //
                    if(ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.GDS.Wave5.Wave_Type_Before      == E_Passed)           {Data.FLAGs.ChartAnalise_Channel.Basic.flag_2_Is_Wave5_WTB__Current       = E_Passed;                                     ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc0 = gf_Desc_ADD(ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc0, "[WBTP]");             }
                    else                                                                                                                         {Data.FLAGs.ChartAnalise_Channel.Basic.flag_2_Is_Wave5_WTB__Current       = E_Correcton;                                  ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc0 = gf_Desc_ADD(ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc0, "[WBTC]");             }
                    //
                    Data.FLAGs.ChartAnalise_Channel.Basic.flag_8_Is_Complx_Wave5_WTA__Current = ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.GDS.Wave5.Wave_Type_After; //---copy value
                    if(ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.GDS.Wave5.Wave_Type_After       == E_Passed_70)        {Data.FLAGs.ChartAnalise_Channel.Basic.flag_8_Is_Complx_Wave5_WTA__Current       = E_Passed_70;                                  ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc0 = gf_Desc_ADD(ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc0, "[WATP70]");       }
                    else  if(ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.GDS.Wave5.Wave_Type_After == E_Correcton_70)     {Data.FLAGs.ChartAnalise_Channel.Basic.flag_8_Is_Complx_Wave5_WTA__Current       = E_Correcton_70;                               ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc0 = gf_Desc_ADD(ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc0, "[WATC70]");       }
                    if(ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.GDS.Wave5.Wave_Type_After       == E_Passed_50)        {Data.FLAGs.ChartAnalise_Channel.Basic.flag_8_Is_Complx_Wave5_WTA__Current       = E_Passed_50;                                  ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc0 = gf_Desc_ADD(ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc0, "[WATP50]");       }
                    else if(ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.GDS.Wave5.Wave_Type_After  == E_Correcton_50)     {Data.FLAGs.ChartAnalise_Channel.Basic.flag_8_Is_Complx_Wave5_WTA__Current       = E_Correcton_50;                               ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc0 = gf_Desc_ADD(ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc0, "[WATC50]");       }
                    if(ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.GDS.Wave5.Wave_Type_After       == E_Passed_30)        {Data.FLAGs.ChartAnalise_Channel.Basic.flag_8_Is_Complx_Wave5_WTA__Current       = E_Passed_30;                                  ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc0 = gf_Desc_ADD(ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc0, "[WATP30]");       }
                    else if(ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.GDS.Wave5.Wave_Type_After  == E_Correcton_30)     {Data.FLAGs.ChartAnalise_Channel.Basic.flag_8_Is_Complx_Wave5_WTA__Current       = E_Correcton_30;                               ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc0 = gf_Desc_ADD(ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc0, "[WATC30]");       }
                    if(ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.GDS.Wave5.Wave_Type_After       == E_Passed_10)        {Data.FLAGs.ChartAnalise_Channel.Basic.flag_8_Is_Complx_Wave5_WTA__Current       = E_Passed_10;                                  ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc0 = gf_Desc_ADD(ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc0, "[WATP10]");       }
                    else if(ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.GDS.Wave5.Wave_Type_After  == E_Correcton_10)     {Data.FLAGs.ChartAnalise_Channel.Basic.flag_8_Is_Complx_Wave5_WTA__Current       = E_Correcton_10;                               ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc0 = gf_Desc_ADD(ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc0, "[WATC10]");       }     //
                    //
                    if(Data.FLAGs.ChartAnalise_Channel.Super.flag_2_Is_Super__Buy_Condition)                                                    {/*Data.FLAGs.Indicators_x.Complex.flag_2_Is_Complex__x_Buy_Support             = true;  */                                       ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc0 = gf_Desc_ADD(ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc0, "[+IBC]");         }
                    else if(!Data.FLAGs.ChartAnalise_Channel.Super.flag_2_Is_Super__Buy_Condition)                                              {/*Data.FLAGs.Indicators_x.Complex.flag_2_Is_Complex__x_Buy_Support             = true;  */                                       ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc0 = gf_Desc_ADD(ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc0, "[-IBC]");         }
                    else if(Data.FLAGs.ChartAnalise_Channel.Super.flag_2_Is_Super__Sell_Condition)                                              {/*Data.FLAGs.Indicators_x.Complex.flag_2_Is_Complex__x_Buy_Support             = true;  */                                       ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc0 = gf_Desc_ADD(ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc0, "[+ISC]");         }
                    else                                                                                                                        {/*Data.FLAGs.Indicators_x.Complex.flag_2_Is_Complex__x_Buy_Support             = true;  */                                       ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc0 = gf_Desc_ADD(ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc0, "[-ISC]");         }       //
                    //------
                    if(Data.FLAGs.ChartAnalise_Channel.Super.flag_2_Is_Super__Result_Coming_Down_Wave_Sell)                                     {/*Data.FLAGs.Indicators_x.Complex.flag_2_Is_Complex__x_Buy_Support             = true;   */                                      ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc0 = gf_Desc_ADD(ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc0, "[CDWS]");         }       //
                    else if(Data.FLAGs.ChartAnalise_Channel.Super.flag_2_Is_Super__Result_Coming_Down_Wave_Buy)                                 {/*Data.FLAGs.Indicators_x.Complex.flag_2_Is_Complex__x_Buy_Support             = true;   */                                      ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc0 = gf_Desc_ADD(ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc0, "[CDWB]");         }       //
                    else if(Data.FLAGs.ChartAnalise_Channel.Super.flag_2_Is_Super__Result_Coming_Up_Wave_Buy)                                   {/*Data.FLAGs.Indicators_x.Complex.flag_2_Is_Complex__x_Buy_Support             = true;   */                                      ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc0 = gf_Desc_ADD(ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc0, "[CUWB]");         }       //
                    else if(Data.FLAGs.ChartAnalise_Channel.Super.flag_2_Is_Super__Result_Coming_Up_Wave_Sell)                                  {/*Data.FLAGs.Indicators_x.Complex.flag_2_Is_Complex__x_Buy_Support             = true;   */                                      ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc0 = gf_Desc_ADD(ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc0, "[CUWS]");         }       //
                    else                                                                                                                        {/*Data.FLAGs.Indicators_x.Complex.flag_2_Is_Complex__x_Buy_Support             = true;   */                                ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc0 = gf_Desc_ADD(ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc0, "[CVWV]");               }       //
          }//
          {         //+------------------------------------------------------------------+ ENUM_INIT_RETCODE C_INIT::Run()  ..---backing sth by enum
                    //|        Analise Condition   Set Points Power                      |  //chack flags  outer   //---condition cheacking
                    //+------------------------------------------------------------------+
                    //--- fetch points
                    {         //
                              ct_Drive.TDD.ct_Signals.DATAS.Signals_ChartAnalises.Point_Resstance_W5_Bar0 = ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Wave5_Bar0_channel_High.S; ;
                              ct_Drive.TDD.ct_Signals.DATAS.Signals_ChartAnalises.Point_Suport__W5_Bar0   = ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Wave5_Bar0_channel_Low.S; ;//
                    }///
          }//
          {         //+------------------------------------------------------------------+
                    //|      Extra testing                                               |
                    //+------------------------------------------------------------------+
                    //     Alert("dif Open S: ", ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.C_Lines_ElliotsWave3_Wave5.Trend._High_Channel_TL_R.Diff_Open);
                    SetFlag_Line(Data.FLAGs.ChartAnalise_Channel.Macro.Line_Prop_Condition_W5_High_,    ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.C_Lines_ElliotsWave3_Wave5.Trend._High_Channel_TL_R);
                    SetFlag_Line(Data.FLAGs.ChartAnalise_Channel.Macro.Line_Prop_Condition_W5_Low_,     ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.C_Lines_ElliotsWave3_Wave5.Trend._Low_Channel_TL_S);
                    SetFlag_Line(Data.FLAGs.ChartAnalise_Channel.Macro.Line_Prop_Condition_W5_Bar0_Low_,     ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.C_Lines_ElliotsWave3_Wave5_Bar0.Trend._Low_Channel_TL_S);
                    SetFlag_Line(Data.FLAGs.ChartAnalise_Channel.Macro.Line_Prop_Condition_W5_Bar0_High_,   ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.C_Lines_ElliotsWave3_Wave5_Bar0.Trend._High_Channel_TL_R);
                    if(false)
                    {         //--alert it
                              if(ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.C_Lines_ElliotsWave3_Wave5.Trend._Low_Channel_TL_S.Conditions.Cond_A1_TLBulish__AskBelow__Trend_Bulish)                  {  Alert(Data.FLAGs.ChartAnalise_Channel.Macro.Line_Prop_Condition_W5_Low_.name + " Cond_A1_TLBulish__AskBelow__Trend_Bulish: "   ); } //
                              else if(ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.C_Lines_ElliotsWave3_Wave5.Trend._Low_Channel_TL_S.Conditions.Cond_A1_TLBulish__AskBelow__Trend_Bearish)            {  Alert(Data.FLAGs.ChartAnalise_Channel.Macro.Line_Prop_Condition_W5_Low_.name + " Cond_A1_TLBulish__AskBelow__Trend_Bearish: "  ); }
                              else if(ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.C_Lines_ElliotsWave3_Wave5.Trend._Low_Channel_TL_S.Conditions.Cond_A1_TLBearish__AskBelow__Trend_Bulish)            {  Alert(Data.FLAGs.ChartAnalise_Channel.Macro.Line_Prop_Condition_W5_Low_.name + " Cond_A1_TLBearish__AskBelow__Trend_Bulish: "  ); }
                              else if(ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.C_Lines_ElliotsWave3_Wave5.Trend._Low_Channel_TL_S.Conditions.Cond_A1_TLBearish__AskBelow__Trend_Bearish)           {  Alert(Data.FLAGs.ChartAnalise_Channel.Macro.Line_Prop_Condition_W5_Low_.name + " Cond_A1_TLBearish__AskBelow__Trend_Bearish: " ); }
                              else if(ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.C_Lines_ElliotsWave3_Wave5.Trend._Low_Channel_TL_S.Conditions.Cond_A2_TLBulish__AskAbove__Trend_Bearish)            {  Alert(Data.FLAGs.ChartAnalise_Channel.Macro.Line_Prop_Condition_W5_Low_.name + " Cond_A2_TLBulish__AskAbove__Trend_Bearish: "  ); }
                              else if(ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.C_Lines_ElliotsWave3_Wave5.Trend._Low_Channel_TL_S.Conditions.Cond_A2_TLBulish__AskAbove__Trend_Bulish)             {  Alert(Data.FLAGs.ChartAnalise_Channel.Macro.Line_Prop_Condition_W5_Low_.name + " Cond_A2_TLBulish__AskAbove__Trend_Bulish: "   ); }
                              else if(ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.C_Lines_ElliotsWave3_Wave5.Trend._Low_Channel_TL_S.Conditions.Cond_A2_TLBearish__AskAbove__Trend_Bulish)            {  Alert(Data.FLAGs.ChartAnalise_Channel.Macro.Line_Prop_Condition_W5_Low_.name + " Cond_A2_TLBearish__AskAbove__Trend_Bulish: "  ); }
                              else if(ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.C_Lines_ElliotsWave3_Wave5.Trend._Low_Channel_TL_S.Conditions.Cond_A2_TLBearish__AskAbove__Trend_Bearish)           {  Alert(Data.FLAGs.ChartAnalise_Channel.Macro.Line_Prop_Condition_W5_Low_.name + " Cond_A2_TLBearish__AskAbove__Trend_Bearish: " ); }
                              else { Alert(" Cond_A2_Not detected"); }
                              //
                    }//
          } //
          {         //---   Alert("Correction_Profit$: ", ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.C_Lines_ElliotsWave3_Wave5.Trend._Low_Channel_TL_S.Conditions.Correction_Profit); //
          }//
}
//+------------------------------------------------------------------+
//|                                                                  |over AI :Constraints Satisfiying : not negative Profit and Flowing Profited Traders
//+------------------------------------------------------------------+
void St_CondicatorData_Extern_Signals::CHEACK_OUT_TRADE_Limits_______For_ChartAnalise_Channel()                   // #2b#3c#4c#5a
{         //----   Over Bool
          //----  Sorces -> Basic         Limits-> sth >> Is_Basic_iEMA5_Bulish
          //----  Sorces -> Complex       Limits-> sth >> Is_Basic_iEMA5_Bulish &&  Is_iEMA5_Cross_Bulish_iEMA15 && ...                                     >> Is_Complex_Indicator_IMAs_EMAs_BUY  //---in self
          //----  Sorces -> Super         Limits-> sth >> Is_Complex_Indicator_IMAs_EMAs_BUY  &&  Is_ComplexSignal_ChartAnalisr_Channel_BUY && ...          >> Is_Super_IC_BUY
          //----  Sorces -> Macro         Limits-> sth >> Is_Super_IC_BUY && Power > 0 &&...                                                                >> Is_Macro_ICP_BUY
          //----  Sorces -> Ultra         Limits-> sth >> Is_Macro_ICP_BUY && MemoryScore > 0  &&...                                                        >> Is_Ultra_ICPMS_BUY
          //----
          //----   Over Enum 3
          //----  Sorces -> Basic         Limits-> sth >> E_iEMA5_Bulish   //-- E_iEMA5_Bearish  , E_iEMA5_Void
          //----  Sorces -> Complex       Limits-> sth >> E_iEMA5_Bulish &&  E__iEMA5_Cross_Bulish_iEMA15 && ...                                                 >> E_ComplexSignal_Indicator_IMAs_EMAs__ES_BUY
          //----  Sorces -> Super         Limits-> sth >> E_ComplexSignal_Indicator_IMAs_EMAs__ES_BUY  &&  E_ComplexSignal_ChartAnalisr_Channel__ES_BUY && ...   >> E_SuperSignal_IC__ES_BUY
          //----  Sorces -> Macro         Limits-> sth >>                                                                                                        >> E_Macro_ICP__ES_BUY
          //----  Sorces -> Ultra         Limits-> sth >>                                                                                                        >> E_Ultra_ICPMS__ES_BUY
          //----
          //----
          //----   Over Enum 5 - 10 fuzzy logic {Void,1,2,3,4,5}
          //----  Sorces -> Basic         Limits-> sth >> E_iEMA5_Bulish_5   //-- E_iEMA5_Bearish_5  , E_iEMA5_Void
          //----  Sorces -> Complex       Limits-> sth >> E_iEMA5_Bulish_5 &&  E__iEMA5_Cross_Bulish_5_iEMA15 && ...                                                 >> E_ComplexSignal_Indicator_IMAs_EMAs__ES_BUY_5
          //----  Sorces -> Super         Limits-> sth >> E_ComplexSignal_Indicator_IMAs_EMAs__ES_BUY_5  &&  E_ComplexSignal_ChartAnalisr_Channel__ES_BUY_5 && ...   >> E_SuperSignal_IC__ES_BUY_5
          //----  Sorces -> Macro         Limits-> sth >>                                                                                                            >> E_Macro_ICP__ES_BUY_5
          //----  Sorces -> Ultra         Limits-> sth >>                                                                                                            >> E_Ultra_ICPMS__ES_BUY_5
          //----
}
//+------------------------------------------------------------------+
//|                                                                  |over AI :Constraints Satisfiying and Object Functions
//+------------------------------------------------------------------+
void St_CondicatorData_Extern_Signals::CHEACK_OUT_TRADE_Objects______For_ChartAnalise_Channel()                 // #2b#3c#4c#5a
{         //---- #1 Trade by channal limits to get profit as selling or buying.
          //---- #2 Score Benefits of trader in each Progress start to end (start trade End Trade).
          //---- #3 Development of Solution for this/
}
//+------------------------------------------------------------------+
//|                                                                  |over AI :Constraints Satisfiying and Object Functions
//+------------------------------------------------------------------+
void St_CondicatorData_Extern_Signals::CHEACK_OUT_TRADE_Criterions___For_ChartAnalise_Channel()              // #2b#3c#4c#5b
{         //---- As Criterions Main-Criterions    "[FV]"
          //---- As Criterions Sub-Criterions     "[FVCB]" "[FVCA]"  [FVI]"
          //---- As Criterions SubSub-Criterions  "[FVIi]"   "[FVIW]"  [FVIM]
          //----
          //----  Find out How is going on channel by Limits defined.                                             Supportive or Ressistancive Condition   to Sells or Buys
          //----  Find out When is Time to Act in channel by Limits defined.                                      Supportive or Ressistancive TIME        to Sells or Buys
          //----  Find out Where is Place to Act in channel by Limits defined.                                    Supportive or Ressistancive PRICE       to Sells or Buys
          //----  Find out What is Risk/Riward/Chance/potential/capacity  to Act in channel by Limits defined.    Supportive or Ressistancive ACT         to Sells or Buys             enum chance or double chance or bool chance]
          //----  Find out Whom Has Chance/potential/capacity  to Act in channel by Limits defined.               Supportive or Ressistancive ACT         to Sells or Buys              Sellers or buyers //-- in time frames or news..
          //----  Is Good to sell or waiting Until Sth to sell
          //----  Is Good to Buy or waiting Until Sth to Buy
          //----  Is Good to sell-Limit or waiting Until Sth to sell-Limit
          //----  Is Good to Buy-Limit or waiting Until Sth to Buy-Limit
          //----  Is Good to sell-Stop or waiting Until Sth to sell-Stop
          //----  Is Good to Buy-Stop or waiting Until Sth to Buy-Stop
          //----
          //----  Is Bad to sell or waiting Until Sth to sell
          //----  Is Bad to Buy or waiting Until Sth to Buy
          //----  Is Bad to sell-Limit or waiting Until Sth to sell-Limit
          //----  Is Bad to Buy-Limit or waiting Until Sth to Buy-Limit
          //----  Is Bad to sell-Stop or waiting Until Sth to sell-Stop
          //----  Is Bad to Buy-Stop or waiting Until Sth to Buy-Stop
}
//+------------------------------------------------------------------+
//|                                                                  |over AI :Constraints Satisfiying and Object Functions
//+------------------------------------------------------------------+
void St_CondicatorData_Extern_Signals::CHEACK_OUT_TRADE_Alternative__For_ChartAnalise_Channel()             // #2b#3c#4c#5c
{         //----  E_Signals_Type as  ES_NEUTRAL , ES_VOID , ES_Sell , ES_BUY  in Low ProLog Development
          //----  E_Signals_Type as  ES_BUY_Good , ES_SELL_Good ,    ES_BUY_Bad , ES_SELL_Bad ,   ES_BUY_Best , ES_SELL_Best ,  ES_BUY_Wors , ES_SELL_Wors   in High ProLog Development
          //----  Each Enum or define has own way to trade or comulation by method.
}
//+------------------------------------------------------------------+
//|                                                                  |over AI :Constraints Satisfiying and Object Functions
//+------------------------------------------------------------------+
void  St_CondicatorData_Extern_Signals::CHEACK_OUT_TRADE_Implanting___For_ChartAnalise_Channel()               // #2b#3c#4c#5e
{         //---- Steps Maximum;Steps Minimum; Minimum Function or interface ; Minumum Fields or types   type primitive or complex
          //---- top to down system  ot down to top sysytem
          //---- targets -> Open Price, Open Time, StopLoss, TakeProfit, minimum TralingSl , Minimum Profit, Minimum Loss , over maximum minimum or standard
          //---- Sorces -> Basic          Limits->  Ask, Bid, Time[0],
          //---- Sorces -> Complex        Limits-> Ranges, Is_Keys, Powers, Nested if else,
          //---- Sorces -> Super          Limits-> CandleBars Paterns ,ChartAnalise,Indicators,  //---just chart channel of 5 wave ---
          //----
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
template<typename def>
struct St_Base_Values_Range { def Standard, Maximum, Minimum; };
struct St_Base_Values
{         St_Base_Values_Range<double>     Price_Open, Price_Close, Price_StopLoss, Price_TakeProfit, Profite_Value, Loss_Value;
          St_Base_Values_Range<datetime>   Time_Open, Time_Close;

          void       setFields(St_Base_Values & st);
          //
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void St_Base_Values::setFields(St_Base_Values & st)
{         //----
          Price_Open.Standard           = 0;  Price_Open.Maximum        = 0;   Price_Open.Minimum       = 0;
          Price_Close.Standard          = 0;  Price_Close.Maximum       = 0;   Price_Close.Minimum      = 0;
          Price_StopLoss.Standard       = 0;  Price_StopLoss.Maximum    = 0;   Price_StopLoss.Minimum   = 0;
          Price_TakeProfit.Standard     = 0;  Price_TakeProfit.Maximum  = 0;   Price_TakeProfit.Minimum = 0;
          Profite_Value.Standard        = 0;  Profite_Value.Maximum     = 0;   Profite_Value.Minimum    = 0;
          Loss_Value.Standard           = 0;  Loss_Value.Maximum        = 0;   Loss_Value.Minimum       = 0;
          //-------------------------------------------------------------------------------------------------------
          Time_Open.Standard            = 0;  Time_Open.Maximum         = 0;   Time_Open.Minimum        = 0;
          Time_Close.Standard           = 0;  Time_Close.Maximum        = 0;   Time_Close.Minimum       = 0;//
          //-------------------------------------------------------------------------------------------------------
          //----
          /* Set out class...
                   St_Base_Values st;
                   st.Price_Open.Standard           = 0;  st.Price_Open.Maximum        = 0;   st.Price_Open.Minimum       = 0;
                   st.Price_Close.Standard          = 0;  st.Price_Close.Maximum       = 0;   st.Price_Close.Minimum      = 0;
                   st.Price_StopLoss.Standard       = 0;  st.Price_StopLoss.Maximum    = 0;   st.Price_StopLoss.Minimum   = 0;
                   st.Price_TakeProfit.Standard     = 0;  st.Price_TakeProfit.Maximum  = 0;   st.Price_TakeProfit.Minimum = 0;
                   st.Profite_Value.Standard        = 0;  st.Profite_Value.Maximum     = 0;   st.Profite_Value.Minimum    = 0;
                   st.Loss_Value.Standard           = 0;  st.Loss_Value.Maximum        = 0;   st.Loss_Value.Minimum       = 0;
                   //-------------------------------------------------------------------------------------------------------
                   st.Time_Open.Standard            = 0;  st.Time_Open.Maximum         = 0;   st.Time_Open.Minimum        = 0;
                   st.Time_Close.Standard           = 0;  st.Time_Close.Maximum        = 0;   st.Time_Close.Minimum       = 0;//
                   //-------------------------------------------------------------------------------------------------------
                   st.Function();
                   //-------------------------------------------------------------------------------------------------------

          */
          //----
}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void St_CondicatorData_Extern_Signals::Extern_Trade__Signals__Beta()
{         //---------------------------------------------------------------------------------------
          //      [---Concept of Buy---]   Make Profite 80% deal -> case proof      #1 remind of UpTrend_Micro      #2 remind of UpTrend_Super     #2 remind of UpTrend_Margin            #2 Brocken UpTrend_Micro        #2 Brocken UpTrend_Super
          //      [---Concept of Sell---]  Make Profite 80% deal -> case proof      #1 remind of DownTrend_Micro    #2 remind of DownTrend_Super   #2 remind of DownTrend_Margin          #2 Brocken DownTrend_Micro      #2 Brocken DownTrend_Super
          //      [---Concept of Sell---]         __Buy__After__Break__Out__Channel__Horizontal
          //      [---Concept of Sell---]         __Buy__After__Break__Out__Channel__Ward__Up
          //      [---Concept of Sell---]         __Sell__After__Break__Out__Channel__Horizontal
          //      [---Concept of Sell---]         __Sell__After__Break__Out__Channel__Ward__Down
          //      [---Concept of Sell---]         __Control__Befor__Break__Out__Channel__Horizontal
          //      [---Concept of Sell---]         __Control__Befor__Break__Out__Channel__Ward__Up
          //      [---Concept of Sell---]         __Control__Befor__Break__Out__Channel__Horizontal
          //      [---Concept of Sell---]         __Control__Befor__Break__Out__Channel__Ward__Down
          //
          //       [---Concept of Buy---]case proof #1 Retun From EMA 500 Level -13$ to EMA500 Close
          //       [---Concept of Buy---]case proof #2 Harmonic to sell.
          //       [---Concept of Buy---]case proof #1
          //       [---Concept of Buy---]case proof #1
          //       [---Concept of Buy---]case proof #1
          //       [---Concept of Buy---]case proof #1
          //-------------------------------------------------------------------------------------------------
          //       [---Concept of Sell---]case proof #1 Retun From EMA 500 Level +13$ to EMA500 Close
          //       [---Concept of Sell---]case proof #1
          //       [---Concept of Sell---]case proof #1
          //       [---Concept of Sell---]case proof #1
          //       [---Concept of Sell---]case proof #1
          //       [---Concept of Sell---]case proof #1
          //---------------------------------------------------------------------------------------
          //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void St_CondicatorData_Extern_Signals::Extern_Trade__Signals__theta(void)
{         //ct_Drive.TDD.ct_Conductor.TI_Curr defines
          //--- As Charter   //-- Win Rate 80%
          {         //---
                    if(ct_Drive.TDD.ct_Signals.DATAS.Desc_Prencip == "Support_Lines_Trend")               Set__Trade__Signals__Charter_Lines_Trend();
                    if(ct_Drive.TDD.ct_Signals.DATAS.Desc_Prencip == "Support_Lines_TrendByAngle")        Set__Trade__Signals__Charter_Lines_TrendByAngle();
                    //---
                    if(ct_Drive.TDD.ct_Signals.DATAS.Desc_Prencip == "Support_Channels_Equidistant")      Set__Trade__Signals__Charter_Channels_Equidistant();
                    if(ct_Drive.TDD.ct_Signals.DATAS.Desc_Prencip == "Support_Channels_Regression")       Set__Trade__Signals__Charter_Channels_Regression();
                    if(ct_Drive.TDD.ct_Signals.DATAS.Desc_Prencip == "Support_Channels_StandardDeviation")Set__Trade__Signals__Charter_Channels_StandardDeviation();
                    if(ct_Drive.TDD.ct_Signals.DATAS.Desc_Prencip == "Support_Channels_Pitchfork")        Set__Trade__Signals__Charter_Channels_Pitchfork();
                    //---
                    if(ct_Drive.TDD.ct_Signals.DATAS.Desc_Prencip == "Support_Fibos_Retracement")         Set__Trade__Signals__Charter_Fibos_Retracement();
                    if(ct_Drive.TDD.ct_Signals.DATAS.Desc_Prencip == "Support_Fibos_Expansion")           Set__Trade__Signals__Charter_Fibos_Expansion();
                    if(ct_Drive.TDD.ct_Signals.DATAS.Desc_Prencip == "Support_Fibos_TimeZone")            Set__Trade__Signals__Charter_Fibos_TimeZone();
                    if(ct_Drive.TDD.ct_Signals.DATAS.Desc_Prencip == "Support_Fibos_Channel")             Set__Trade__Signals__Charter_Fibos_Channel();
                    if(ct_Drive.TDD.ct_Signals.DATAS.Desc_Prencip == "Support_Fibos_Fan")                 Set__Trade__Signals__Charter_Fibos_Fan();
                    if(ct_Drive.TDD.ct_Signals.DATAS.Desc_Prencip == "Support_Fibos_Arc")                 Set__Trade__Signals__Charter_Fibos_Arc();
                    //---
          }
          //--- As Patternic //-- Win Rate 80%
          {         if(ct_Drive.TDD.ct_Signals.DATAS.Desc_Prencip == "Support_Patterns_2Bar")             Set__Trade__Signals__Patterns_2Bar();
                    if(ct_Drive.TDD.ct_Signals.DATAS.Desc_Prencip == "Support_Patterns_3Bar")             Set__Trade__Signals__Patterns_3Bar();
                    if(ct_Drive.TDD.ct_Signals.DATAS.Desc_Prencip == "Support_Patterns_Harmonic")         Set__Trade__Signals__Patterns_Harmonic();//
          }
          //--- As Bar info //-- Win Rate 80%
          {         //---
                    if(ct_Drive.TDD.ct_Signals.DATAS.Desc_Prencip == "Support_Bar_Bulish")                Set__Trade__Signals__BarShadow();
                    //---
          }//
          //--- As Extra info //-- Win Rate 80%
          {         //---
                    if(ct_Drive.TDD.ct_Signals.DATAS.Desc_Prencip == "Support_Extra_RS")                  Set__Trade__Signals__Extra_RS();
                    //---
          }//
}//
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

//---
//--- As Charter   //-- Win Rate 80%
void St_CondicatorData_Extern_Signals::Set__Trade__Signals__Charter_Lines_Trend()
{         //---
          //---
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void St_CondicatorData_Extern_Signals::Set__Trade__Signals__Charter_Lines_TrendByAngle()
{         //---
          //---
}
//---
void St_CondicatorData_Extern_Signals::Set__Trade__Signals__Charter_Channels_Equidistant()
{         //---
          //---
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void St_CondicatorData_Extern_Signals::Set__Trade__Signals__Charter_Channels_Regression()
{         //---
          //---
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void St_CondicatorData_Extern_Signals::Set__Trade__Signals__Charter_Channels_StandardDeviation()
{         //---
          //---
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void St_CondicatorData_Extern_Signals::Set__Trade__Signals__Charter_Channels_Pitchfork()
{         //---
          //---
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void St_CondicatorData_Extern_Signals::Set__Trade__Signals__Charter_Channels_Extention()
{         //
}
//---
void St_CondicatorData_Extern_Signals::Set__Trade__Signals__Charter_Fibos_Retracement()
{         //---
          //---
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void St_CondicatorData_Extern_Signals::Set__Trade__Signals__Charter_Fibos_Expansion()
{         Alfa_resultS.Charter_Fibos_Expansion.Is_Sell = FALSE; //
          Alfa_resultS.Charter_Fibos_Expansion.Is_Buy  = FALSE; //
          //---
          //--if(!ct_Drive.TDD.ct_Signals.TradeLogic._FiboExtention.Is_CrossSL);
          //--ct_Drive.TDD.ct_Signals.TradeLogic._FiboExtention.Is_CrossTp1;
          //--ct_Drive.TDD.ct_Signals.TradeLogic._FiboExtention.Is_CrossTp2;
          //--ct_Drive.TDD.ct_Signals.TradeLogic._FiboExtention.Is_CrossTp3;
          if(!ct_Drive.TDD.ct_Signals.TradeLogic._FiboExtention.Is_CrossSL) ct_Drive.TDD.ct_Signals.TradeLogic._FiboExtention.IsWinRate80 = true;
          //---Define FiboExtention rules
          if(true)
          {         if(ct_Drive.TDD.ct_Signals.TradeLogic._FiboExtention.Is_CrossSL)
                    {         //Alert( "_FiboExtention.Is_CrossSL" + "  ct_Drive.TDD.ct_Signals.TradeLogic._FiboExtention.Is_Bulish: ", ct_Drive.TDD.ct_Signals.TradeLogic._FiboExtention.Is_Bulish );
                              if(ct_Drive.TDD.ct_Signals.TradeLogic._FiboExtention.Is_Bulish)
                              {         //---off--Data._Alfa.E4_Signal = Signal_BUY_FiboExtention_SL_Cross;
                                        Data._Alfa.Text = "Signal_BUY_FiboExtention_SL_Cross";//
                                        ct_Drive.TDD.ct_Signals.DATAS.Power -= 3;//
                              }
                              else
                              {         //---off--Data._Alfa.E4_Signal = Signal_SELL_FiboExtention_SL_Cross;
                                        Data._Alfa.Text = "Signal_SELL_FiboExtention_SL_Cross";//
                                        ct_Drive.TDD.ct_Signals.DATAS.Power += 3;//
                              }
                              //
                    }
                    //
                    if(ct_Drive.TDD.ct_Signals.TradeLogic._FiboExtention.Is_CrossTp1)
                    {         if(ct_Drive.TDD.ct_Signals.TradeLogic._FiboExtention.Is_Bulish)
                              {         //Alert( "_FiboExtention.Is_CrossTp1" );
                                        //---off--Data._Alfa.E4_Signal = Signal_BUY_FiboExtention_Tp1;
                                        Data._Alfa.Text = "Signal_BUY_FiboExtention_Tp1";//
                                        ct_Drive.TDD.ct_Signals.DATAS.Power += 3;//
                              }
                              else
                              {         //---off--Data._Alfa.E4_Signal = Signal_SELL_FiboExtention_Tp1;
                                        Data._Alfa.Text = "Signal_SELL_FiboExtention_Tp1";//
                                        ct_Drive.TDD.ct_Signals.DATAS.Power -= 3;//
                              } //
                    }//
                    if(ct_Drive.TDD.ct_Signals.TradeLogic._FiboExtention.Is_CrossTp2)
                    {         if(ct_Drive.TDD.ct_Signals.TradeLogic._FiboExtention.Is_Bulish)
                              {         //Alert( "_FiboExtention.Is_CrossTp2" );
                                        //---off--Data._Alfa.E4_Signal = Signal_BUY_FiboExtention_Tp2;
                                        Data._Alfa.Text = "Signal_BUY_FiboExtention_Tp2";//
                                        ct_Drive.TDD.ct_Signals.DATAS.Power += 2;//
                              }
                              else
                              {         //---off--Data._Alfa.E4_Signal = Signal_SELL_FiboExtention_Tp2;
                                        Data._Alfa.Text = "Signal_SELL_FiboExtention_Tp2";//
                                        ct_Drive.TDD.ct_Signals.DATAS.Power -= 2;//
                              } //
                    }
                    if(ct_Drive.TDD.ct_Signals.TradeLogic._FiboExtention.Is_CrossTp3)
                    {         if(ct_Drive.TDD.ct_Signals.TradeLogic._FiboExtention.Is_Bulish)
                              {         //Alert( "_FiboExtention.Is_CrossTp3" );
                                        //---off--Data._Alfa.E4_Signal = Signal_BUY_FiboExtention_Tp3;
                                        Data._Alfa.Text = "Signal_BUY_FiboExtention_Tp3";//
                                        ct_Drive.TDD.ct_Signals.DATAS.Power += 1;//
                              }//
                              else
                              {         //---off--Data._Alfa.E4_Signal = Signal_SELL_FiboExtention_Tp3;
                                        Data._Alfa.Text = "Signal_SELL_FiboExtention_Tp3";//
                                        ct_Drive.TDD.ct_Signals.DATAS.Power -= 1;//
                              } //
                    }
                    //
          }//
          //---
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void St_CondicatorData_Extern_Signals::Set__Trade__Signals__Charter_Fibos_TimeZone()
{         //---
          //---
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void St_CondicatorData_Extern_Signals::Set__Trade__Signals__Charter_Fibos_Channel()
{         //---
          //---
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void St_CondicatorData_Extern_Signals::Set__Trade__Signals__Charter_Fibos_Fan()
{         //---
          //---
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void St_CondicatorData_Extern_Signals::Set__Trade__Signals__Charter_Fibos_Arc()
{         //---
          //---
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
//--- As Patternic //-- Win Rate 80%
void St_CondicatorData_Extern_Signals::Set__Trade__Signals__Patterns_2Bar()
{         Alfa_resultS.Patterns_2Bar_Engulfing.Is_Buy  = FALSE; //
          Alfa_resultS.Patterns_2Bar_InSideBar.Is_Buy  = FALSE; //
          Alfa_resultS.Patterns_2Bar_Engulfing.Is_Sell = FALSE; //
          Alfa_resultS.Patterns_2Bar_InSideBar.Is_Sell = FALSE; //
          //---
          //---Define _Candlestick_2 rules Engulfing
          if(ct_Drive.TDD.ct_Signals.TradeLogic._Candlestick_2.Is_Engulfing_bullish   )
          {         //Alert( "Is_Engulfing_bullish");
                    //---off--Data._Alfa.E4_Signal = Signal_BUY_Engulfing2Bar   ;//
                    Data._Alfa.Text = "Signal_BUY_Engulfing2Bar";//
                    ct_Drive.TDD.ct_Signals.DATAS.Power += 2;//
                    Alfa_resultS.Patterns_2Bar_Engulfing.Text    = "BUY 2Bar_Engulfing Bullish";
                    Alfa_resultS.Patterns_2Bar_Engulfing.Is_Buy  = true; //
          }
          //
          if(ct_Drive.TDD.ct_Signals.TradeLogic._Candlestick_2.Is_Engulfing_bearish   )
          {         //Alert( "Is_Engulfing_bearish");
                    //---off--Data._Alfa.E4_Signal = Signal_SELL_Engulfing2Bar   ;//
                    Data._Alfa.Text = "Signal_SELL_Engulfing2Bar";//
                    ct_Drive.TDD.ct_Signals.DATAS.Power -= 2;//
                    Alfa_resultS.Patterns_2Bar_Engulfing.Text    = "SELL 2Bar_Engulfing Bearish";
                    Alfa_resultS.Patterns_2Bar_Engulfing.Is_Sell  = true; //
          }
          //---Define _Candlestick_2 rules
          if(true)
          {         //
                    //---Define _Candlestick_2 rules InSideBar
                    if(  ct_Drive.TDD.ct_Signals.TradeLogic._Candlestick_2.Is_InSideBar_Bulish )
                    {         //Alert( "Is_InSideBar_Bulish"     );
                              //---off--Data._Alfa.E4_Signal =   Signal_BUY_Insidebar2Bar;//
                              Data._Alfa.Text = "Signal_BUY_Insidebar2Bar";//
                              ct_Drive.TDD.ct_Signals.DATAS.Power += 2;//
                              Alfa_resultS.Patterns_2Bar_InSideBar.Text    = "BUY 2Bar_InSideBar Bullish";
                              Alfa_resultS.Patterns_2Bar_InSideBar.Is_Buy  = true;//
                    }
                    //
                    if(ct_Drive.TDD.ct_Signals.TradeLogic._Candlestick_2.Is_InSideBar_bearish )
                    {         // Alert( "Is_InSideBar_bearish"     );
                              //---off--Data._Alfa.E4_Signal =    Signal_SELL_Insidebar2Bar;//
                              Data._Alfa.Text = "Signal_SELL_Insidebar2Bar";//
                              ct_Drive.TDD.ct_Signals.DATAS.Power -= 2;//
                              Alfa_resultS.Patterns_2Bar_InSideBar.Text    = "SELL 2Bar_InSideBar Bearish";
                              Alfa_resultS.Patterns_2Bar_InSideBar.Is_Sell  = true; //
                    }
                    //
          }
          //---
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void St_CondicatorData_Extern_Signals::Set__Trade__Signals__Patterns_3Bar()
{         Alfa_resultS.Patterns_3Bar.Is_Sell = FALSE; //
          Alfa_resultS.Patterns_3Bar.Is_Buy  = FALSE; //
          //---
          //---Define _Candlestick_3 rules
          if(true)
          {         if(ct_Drive.TDD.ct_Signals.TradeLogic._Candlestick_3.Is_Pattern_All_Any_Bullish )
                    {         //Alert( "_Candlestick_3.Is_Pattern_All_Any_Bullish"     );
                              //---off--Data._Alfa.E4_Signal = Signal_BUY_Bullish3Bar  ;//
                              Data._Alfa.Text = "Signal_BUY_Bullish3Bar";//
                              ct_Drive.TDD.ct_Signals.DATAS.Power += 3;//
                              Alfa_resultS.Patterns_3Bar.Text    = "BUY 3Bar Bullish";
                              Alfa_resultS.Patterns_3Bar.Is_Buy = true; //
                    }
                    //
                    if(ct_Drive.TDD.ct_Signals.TradeLogic._Candlestick_3.Is_Pattern_All_Any_Bearish)
                    {         //Alert( "_Candlestick_3.Is_Pattern_All_Any_Bearish"     );
                              //---off--Data._Alfa.E4_Signal = Signal_SELL_Bearish3Bar ;//
                              Data._Alfa.Text = "Signal_SELL_Bearish3Bar";//
                              ct_Drive.TDD.ct_Signals.DATAS.Power -= 3;//
                              Alfa_resultS.Patterns_3Bar.Text    = "SELL 3Bar Bearish";
                              Alfa_resultS.Patterns_3Bar.Is_Sell = true; //
                    }
                    //
          }
          //---
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void St_CondicatorData_Extern_Signals::Set__Trade__Signals__Patterns_Harmonic()
{         //---
          //---
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
//--- As Bar info //-- Win Rate 80%
void St_CondicatorData_Extern_Signals::Set__Trade__Signals__BarShadow()
{         Alfa_resultS.BarShadow.Is_Sell = FALSE; //
          Alfa_resultS.BarShadow.Is_Buy  = FALSE; //
          //---
          //---Define BarShadow rules
          if(true)
          {         if(ct_Drive.TDD.ct_Signals.TradeLogic._BarShadow.IsShadow_All_Support_Buy)
                    {         //Alert( "._BarShadow.IsShadow_All_Support_Buy" ); //
                              //---off--Data._Alfa.E4_Signal = Signal_BUY_BarShadow;//
                              Data._Alfa.Text = "Signal_BUY_BarShadow"; //
                              ct_Drive.TDD.ct_Signals.DATAS.Power += 2;//
                              Alfa_resultS.BarShadow.Is_Buy  = true; //
                    } //
                    if(ct_Drive.TDD.ct_Signals.TradeLogic._BarShadow.IsShadow_All_Support_Sell)
                    {         //Alert( "._BarShadow.IsShadow_All_Support_Sell" );//
                              //---off--Data._Alfa.E4_Signal = Signal_SELL_BarShadow;//
                              Data._Alfa.Text = "Signal_SELL_BarShadow";//
                              ct_Drive.TDD.ct_Signals.DATAS.Power -= 2;//
                              Alfa_resultS.BarShadow.Is_Sell = true; //
                    } //
          }//
          //---
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
//--- As Extra info //-- Win Rate 80%
void St_CondicatorData_Extern_Signals::Set__Trade__Signals__Extra_RS()
{         //---
          //---
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void St_CondicatorData_Extern_Signals::ControlTPSL_By_WinRate(bool b)
{         if(b)          //Alert("  ->SL" + (string)ct_Drive.TDD.ct_StopLoss.Curr_Pip);
          {         //----------------------------------------------------------------------
                    //---Change SL TP Range By WinRate  * update tacktics
                    //----------------------------------------------------------------------
                    if((ct_Drive.TDD.ct_Signals.DATAS.WinRate <= 0.40 && ct_Drive.TDD.ct_Signals.DATAS.WinRate >= 0.00 ) || (ct_Drive.TDD.ct_Signals.DATAS.WinRate >= -0.40 && ct_Drive.TDD.ct_Signals.DATAS.WinRate <= 0.00))
                    {         ct_Drive.TDD.ct_StopLoss.Curr_Pip   = 100;     ct_Drive.TDD.ct_StopLoss.Fixed_Pip   = 100;
                              ct_Drive.TDD.ct_TakeProfit.Curr_Pip = 100;     ct_Drive.TDD.ct_TakeProfit.Fixed_Pip = 100;
                              //
                    } //
                    else
                    {         ct_Drive.TDD.ct_StopLoss.Curr_Pip   = 200;     ct_Drive.TDD.ct_StopLoss.Fixed_Pip   = 200;
                              ct_Drive.TDD.ct_TakeProfit.Curr_Pip = 200;     ct_Drive.TDD.ct_TakeProfit.Fixed_Pip = 200;
                              //
                    }
                    //----------------------------------------------------------------------
                    //----END---Change SL TP Range By WinRate  * update tacktics
                    //----------------------------------------------------------------------
                    //Alert("  ->SL" + (string)ct_Drive.TDD.ct_StopLoss.Curr_Pip);
          }//
          ct_Drive.TDD.ct_Signals.DATAS.WinRate_Desc =    " WR:" +  (string)ct_Drive.TDD.ct_Signals.DATAS.WinRate; //; ct_Drive.TDD.ct_Signals.GetSignalDesc()  WinRate
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void St_CondicatorData_Extern_Signals::CHEACK_OUT_TRADE_SIGNAL_For_Indicators()
{         ////---Indicators Analise
          Set__Trade__Signals__Indicators_IMA_();
          Set__Trade__Signals__Indicators_MACD_();
          Set__Trade__Signals__Indicators_RSI_();
          Set__Trade__Signals__Indicators_WPR_();
          Set__Trade__Signals__Indicators_Volum_();
          Set__Trade__Signals__Indicators_Stochastic_();//
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void St_CondicatorData_Extern_Signals::CHEACK_OUT_TRADE_SIGNAL_For_CandelBars()
{         ////---CandleBars Analise
          Set__Trade__Signals__Patterns_2Bar();
          Set__Trade__Signals__Patterns_3Bar();
          Set__Trade__Signals__Patterns_Harmonic();
          //--- As Bar info
          Set__Trade__Signals__BarShadow();
          ////---Extra Analise
          Set__Trade__Signals__Extra_RS();
          //
          {         if(ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bar_TL_Movment_0_5_Periods._Current.s_E_TL_Movment_AB._Bar_Is_E_Movment_DLL)                           {Data.FLAGs.CandleBars_Movment.Basic.flag_4_E_Bar_TL_Movment = E_Movment_DLL;  Data.Enum_Signal_temp_Desc = gf_Desc_ADD(Data.Enum_Signal_temp_Desc, "[CBM-DLL]"); }    //
                    else if (ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bar_TL_Movment_0_5_Periods._Current.s_E_TL_Movment_AB._Bar_Is_E_Movment_ULL)                     {Data.FLAGs.CandleBars_Movment.Basic.flag_4_E_Bar_TL_Movment = E_Movment_ULL;  Data.Enum_Signal_temp_Desc = gf_Desc_ADD(Data.Enum_Signal_temp_Desc, "[CBM-ULL]"); }    //
                    else if (ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bar_TL_Movment_0_5_Periods._Current.s_E_TL_Movment_AB._Bar_Is_E_Movment_DU)                      {Data.FLAGs.CandleBars_Movment.Basic.flag_4_E_Bar_TL_Movment = E_Movment_DU;   Data.Enum_Signal_temp_Desc = gf_Desc_ADD(Data.Enum_Signal_temp_Desc, "[CBM-DU]");  }     //
                    else if (ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bar_TL_Movment_0_5_Periods._Current.s_E_TL_Movment_AB._Bar_Is_E_Movment_UU)                      {Data.FLAGs.CandleBars_Movment.Basic.flag_4_E_Bar_TL_Movment = E_Movment_UU;   Data.Enum_Signal_temp_Desc = gf_Desc_ADD(Data.Enum_Signal_temp_Desc, "[CBM-UU]"); }     //
                    else                                                                                                                         {Data.FLAGs.CandleBars_Movment.Basic.flag_4_E_Bar_TL_Movment = E_Movment_Void; Data.Enum_Signal_temp_Desc = gf_Desc_ADD(Data.Enum_Signal_temp_Desc, "[CBM-V]");}
                    //--------------------------------------------------------------
                    Data.FLAGs.CandleBars_Movment.Basic.flag_8_E_Bar_TL_Movment_0_5_10_15         = ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bar_TL_Movment_0_5_Periods._Current.s_E_TL_Movment_ABCD.E_Bar_TL_Movment_wAwBwCwD;
                    //---  Alert("_Bar_TL_Movment_0_5_10_15: ", EnumToString(ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bar_TL_Movment_0_5_Periods._Current.E_Bar_TL_Movment_0_5_10_15));
                    //----
          }//
          {         //------------------------------------------------
                    if(ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bar_TL_Movment_0_5_Periods._Current.s_E_TL_Movment_ABCD._Bar_Is_E_Movment_ULL_ULL)    { ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc1 = gf_Desc_ADD(ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc1, "[BarsC-ULL_ULL]");}
                    if(ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bar_TL_Movment_0_5_Periods._Current.s_E_TL_Movment_ABCD._Bar_Is_E_Movment_DLL_ULL)    { ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc1 = gf_Desc_ADD(ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc1, "[BarsC-DLL_ULL]");}
                    //
                    if(ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bar_TL_Movment_0_5_Periods._Current.s_E_TL_Movment_ABCD._Bar_Is_E_Movment_UU_ULL)     { ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc1 = gf_Desc_ADD(ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc1, "[BarsC-UU_ULL]");}
                    if(ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bar_TL_Movment_0_5_Periods._Current.s_E_TL_Movment_ABCD._Bar_Is_E_Movment_DU_ULL)     { ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc1 = gf_Desc_ADD(ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc1, "[BarsC-DU_ULL]");}
                    if(ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bar_TL_Movment_0_5_Periods._Current.s_E_TL_Movment_ABCD._Bar_Is_E_Movment_ULL_DLL)    { ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc1 = gf_Desc_ADD(ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc1, "[BarsC-ULL_DLL]");}
                    if(ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bar_TL_Movment_0_5_Periods._Current.s_E_TL_Movment_ABCD._Bar_Is_E_Movment_DLL_DLL)    { ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc1 = gf_Desc_ADD(ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc1, "[BarsC-DLL_DLL]");}
                    //
                    if(ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bar_TL_Movment_0_5_Periods._Current.s_E_TL_Movment_ABCD._Bar_Is_E_Movment_UU_DLL)     { ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc1 = gf_Desc_ADD(ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc1, "[BarsC-UU_DLL]");}
                    if(ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bar_TL_Movment_0_5_Periods._Current.s_E_TL_Movment_ABCD._Bar_Is_E_Movment_DU_DLL)     { ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc1 = gf_Desc_ADD(ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc1, "[BarsC-DU_DLL]");}
                    //
                    if(ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bar_TL_Movment_0_5_Periods._Current.s_E_TL_Movment_ABCD._Bar_Is_E_Movment_ULL_UU)     { ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc1 = gf_Desc_ADD(ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc1, "[BarsC-ULL_UU]");}
                    if(ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bar_TL_Movment_0_5_Periods._Current.s_E_TL_Movment_ABCD._Bar_Is_E_Movment_DLL_UU)     { ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc1 = gf_Desc_ADD(ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc1, "[BarsC-DLL_UU]");}
                    //
                    if(ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bar_TL_Movment_0_5_Periods._Current.s_E_TL_Movment_ABCD._Bar_Is_E_Movment_UU_UU)      { ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc1 = gf_Desc_ADD(ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc1, "[BarsC-UU_UU]");}
                    if(ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bar_TL_Movment_0_5_Periods._Current.s_E_TL_Movment_ABCD._Bar_Is_E_Movment_DU_UU)      { ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc1 = gf_Desc_ADD(ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc1, "[BarsC-DU_UU]");}
                    if(ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bar_TL_Movment_0_5_Periods._Current.s_E_TL_Movment_ABCD._Bar_Is_E_Movment_ULL_DU)     { ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc1 = gf_Desc_ADD(ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc1, "[BarsC-ULL_DU]");}
                    if(ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bar_TL_Movment_0_5_Periods._Current.s_E_TL_Movment_ABCD._Bar_Is_E_Movment_DLL_DU)     { ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc1 = gf_Desc_ADD(ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc1, "[BarsC-DLL_DU]");}
                    //
                    if(ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bar_TL_Movment_0_5_Periods._Current.s_E_TL_Movment_ABCD._Bar_Is_E_Movment_UU_DU)      { ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc1 = gf_Desc_ADD(ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc1, "[BarsC-UU_DU]");}
                    if(ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bar_TL_Movment_0_5_Periods._Current.s_E_TL_Movment_ABCD._Bar_Is_E_Movment_DU_DU)      { ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc1 = gf_Desc_ADD(ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc1, "[BarsC-DU_DU]");} //
          } //
          {         //Is_Test_Compex_Bar_Strategies
                    bool Is_Test_Compex_Bar_Strategies = false;
                    if(Is_Test_Compex_Bar_Strategies )
                    {         Bar_Strategies__Pattern__Data          Bar_Pattern;            //----[Pattern Strategies]
                              Bar_Pattern.Harmonic_Bar.Check_Harmonic_Pattern(0, PERIOD_CURRENT, false, g_Shape_Com, 1);
                              Stc_CandlePattern__Harmonic           Harmonic_Bar; //
                              Sg_Shape_<int>      _Shape_Zigzag(5, PERIOD_CURRENT);
                              Harmonic_Bar.Check_Harmonic_Pattern(0, PERIOD_CURRENT, true, _Shape_Zigzag, 3); //
                              //
                    }//
          }///
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void St_CondicatorData_Extern_Signals::CHEACK_OUT_TRADE_SIGNAL_For_ChartAnalise()
{         //---conceptLogic Plans  every one has own flag and power to sell or buy///
          //---Chart Analise
          Set__Trade__Signals__Charter_Lines_Trend();
          Set__Trade__Signals__Charter_Lines_TrendByAngle();
          //---
          Set__Trade__Signals__Charter_Channels_Equidistant();
          Set__Trade__Signals__Charter_Channels_Regression();
          Set__Trade__Signals__Charter_Channels_StandardDeviation();
          Set__Trade__Signals__Charter_Channels_Pitchfork();
          Set__Trade__Signals__Charter_Channels_Extention();
          //
          Set__Trade__Signals__Charter_Fibos_Retracement();
          Set__Trade__Signals__Charter_Fibos_Expansion();
          //---CHEACK FIBO EXPANSIONHJ SIGNALS
          {         ct_Drive.TDD.ct_Signals.DATAS.Signals_Indicators.Expansion =    GoldVIP_PanelPeriodsData._ClientTPX.TPX_Set_TypeDesc == "Buy" ?    ES_BUY : ES_SELL; }
          Set__Trade__Signals__Charter_Fibos_TimeZone();
          Set__Trade__Signals__Charter_Fibos_Channel();
          Set__Trade__Signals__Charter_Fibos_Fan();
          Set__Trade__Signals__Charter_Fibos_Arc();
          //
          CHEACK_OUT_TRADE_SIGNAL_Flags_______For_ChartAnalise_Channel(); //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void St_CondicatorData_Extern_Signals::CHEACK_OUT_TRADE_SIGNAL_For_ComplexA()
{
//
//
//
//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
template<typename Typer1, typename Typer2>
void St_CondicatorData_Extern_Signals::SetFlag_Line(Typer1 & t1, Typer2 & t2)
{         t1.Is_E_Above_Ask                  = t2.Conditions.Line_Possition_Ask == E_Above_Ask;
          t1.Is_Ressistancer                 = t2.Conditions.Is_Ressistancer;
          t1.Diff_Open                       = t2.Conditions.Diff_Open;
          t1.Is_OnLine                       = t2.Conditions.Is_OnLine;
          t1.Diff_Ask                        = t2.Conditions.Diff_Ask;
          t1.name                            = t2.name;
          t1.Correction_Profit               = t2.Conditions.Correction_Profit;
          t1.Profit                          = t2.Conditions.Profit;
          t1.Is_Basic__Bulish_Line           = t2.Conditions.Is_Basic__Bulish_Line;
          t1.Is_Diff_Ask_Array_Bulish        = t2.Conditions.Is_Diff_Ask_Array_Bulish;
          t1.Is_Diff_Close_Array_Bulish      = t2.Conditions.Is_Diff_Close_Array_Bulish;
          t1.Is_Diff_Open_Array_Bulish       = t2.Conditions.Is_Diff_Open_Array_Bulish;
          //
          //-- Alert("name : ", t1.name, "   Is_Bulish_Line : ", t1.Is_Bulish_Line, "   Is_E_Above_Ask : ", t1.Is_E_Above_Ask, "   Is_Ressistancer : ", t1.Is_Ressistancer, "   Diff_Open : ", t1.Diff_Open, "   Is_OnLine : ", t1.Is_OnLine, "   Diff_Ask : ", t1.Diff_Ask, "   Is_Diff_Open_Array_Bulish : ", t1.Is_Diff_Open_Array_Bulish);
          //
}//
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void St_CondicatorData_Extern_Signals::switcher_flags()
{         //---switcher flags
          //         switch(Data.FLAGs.ChartAnalise_Channel.Basic.flag_2_Is_InsideChannel)
          //          {  case Data.FLAGs.ChartAnalise_Channel.Basic.flag_2_Is_InsideChannel  :       {       } break;         //--- "Trade Conception" "--Low  Channel Buy--"
          //             case !Data.FLAGs.ChartAnalise_Channel.Basic.flag_2_Is_InsideChannel :       {       } break;         //--- "Trade Conception" "--High Channel Sell--"
          //             default:                                              break;//
          //          }//
          //          switch(Data.FLAGs.ChartAnalise_Channel.Basic.flag_2_Is_Bullish)
          //          {         case Data.FLAGs.ChartAnalise_Channel.Basic.flag_2_Is_Bullish  :      {       } break;         //--- "Trade Conception" "--Support      Channel Low--"
          //                    case !Data.FLAGs.ChartAnalise_Channel.Basic.flag_2_Is_Bullish :      {       } break;         //--- "Trade Conception" "--Ressistance  Channel High--"
          //                    default:                                       break;//
          //          }//
          switch(Data.FLAGs.ChartAnalise_Channel.Basic.flag_3_Place_Thirden)
          {         case E_Place_Thirden_Lower :                      {       } break;        //--- "Trade Conception" "-- BreakOut Down Sell                   , Return U Buy--"
                    case E_Place_Thirden_Middle :                     {       } break;        //--- "Trade Conception" "-- BreakOut Down Sell BreakOut Up Buy   , Return UUp Buy-- Return UDown Sell--"
                    case E_Place_Thirden_Upper :                      {       } break;        //--- "Trade Conception" "-- BreakOut Up   Buy                    , Return U Buy--"
                    case E_Place_Thirden_Void :                       {       } break;
                    default:                                                    break;//
          }//
          switch(Data.FLAGs.ChartAnalise_Channel.Basic.flag_3_Direction)
          {         case E_Direction_UpWard :                         {       } break;        //--- "Trade Conception" "-- Buy  As Break out up --"
                    case E_Direction_DownWard :                       {       } break;        //--- "Trade Conception" "-- Sell As Break out Down --"
                    case E_Direction_Side :                           {       } break;        //--- "Trade Conception" "-- Trade Range --"
                    case E_Direction_Void :                           {       } break;
                    default:                                                    break;//
          }//
          switch(Data.FLAGs.CandleBars_Movment.Basic.flag_4_E_Bar_TL_Movment)
          {         case E_Movment_ULL :                           {       } break;        //--- "Trade Conception" "-- Buy  Trend Up      in Lowers --"
                    case E_Movment_DLL :                         {       } break;        //--- "Trade Conception" "-- Sell Trend Down    in Highers --"
                    case E_Movment_DU :                          {       } break;        //--- "Trade Conception" "-- Buy Trend UpTest   in Lowers --"
                    case E_Movment_UU :                            {       } break;        //--- "Trade Conception" "-- Buy Trend DownTest in Highers --"
                    case E_Movment_Void :                             {       } break;        //--- "Trade Conception" "---"
                    default:                                                    break;//
          }//
          switch(Data.FLAGs.Indicators_MACD.Basic.flag_4_SM_Possition_Current)
          {         case E_SMP_Sell_Supportive :                      {       } break;        //--- "Trade Conception" "-- Sell Support       Macd Down       in Highers --"
                    case E_SMP_Sell_Resistancive :                    {       } break;        //--- "Trade Conception" "-- Buy  Ressistance   Macd Up         in Lowers --"
                    case E_SMP_Buy_Supportive :                       {       } break;        //--- "Trade Conception" "-- Buy  Support       Macd Up         in Lowers --"
                    case E_SMP_Buy_Resistancive :                     {       } break;        //--- "Trade Conception" "-- Sell Ressistance   Macd Down       in Highers --"
                    case E_SMP_Void :                                 {       } break;        //--- "Trade Conception" "---"
                    default:                                                    break;//
          }//
          //---? Is Buy  In Support Trend?
          //---? Is Sell In Ressistance Trend?
}//
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void St_CondicatorData_Extern_Signals::Define_Signal_Masters_Aproche()
{         /****************************************************************************************
          /* Signals Result Types
                      Condition to put buys                   Market Is_Bulish        WinRate > 0.40 %
                      Condition to put buyMarket
                      Condition to put buyStop
                      Condition to put buyLimit
                      //
                      Condition to put sells                  Market Is_Bearish        WinRate < -0.40 %
                      Condition to put sellMarket
                      Condition to put sellStop
                      Condition to put sellLimit
          *****************************************************************************************/
          /****************************************************************************************
           Signals methods By indicators -- channels -- breackouts -- technical -- fibo expantion -- pivot RS

          /* Signals Price zone can use buy Types
          /* Signals Price zone can use sel Types

          /* Signals Time zone can use buy Types
          /* Signals Time zone can use sel Types

          /* Signals Paterns zone can use buy Types
          /* Signals Paterns zone can use sel Types
          ******************************************************************************************/
          /*****************************************************************************************
          General Method
          #-1 Define in Channel
          #-2 Define in Thirden Place Up - Middle - Down
          #-3 Define Buyers Condition as one Ship 3 level with 9 Stair diff 4 direction  -- M1 -- M5 -- M15 ---- M30 -- H1 -- H4 ---- D1 -- W1 -- MN1   SS-SR--BS-BS      Start SS   End SS
          #-3 #-A Buy  Support
          #-3 #-B Sell Ressistence
          #-4 Define Sellers Condition
          #-3 #-A Sell Support
          #-3 #-B Buy  Ressistence
          #-4
          ******************************************************************************************/
          /*
          Risk Reward of signal from result...?
          */
}
//+------------------------------------------------------------------+
void St_CondicatorData_Extern_Signals::Set__Trade__Signals__Indicators_IMA_()
{
          {         ///
                    //-----------------------------------------------------------------------------------------------------------------
                    //    ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA.Conditions.
                    //---Alert( ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_._Def_._EMA_._PRICE_CLOSE_._500_._iMa_[0]._Value);
                    //---Alert( ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_._500_._iMa_[0]._Value);
                    //---Alert( ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_._Def_EMA_._EMA_._PRICE_CLOSE_._500_._iMa_[0]._Value);
                    //---Alert( ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA.);
                    //---Alert( ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA.EMA500_Close._CURRENT._Price.Distance_Close);//
                    //-----------------------------------------------------------------------------------------------------------------
                    //-- Alert(ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_._500_.Is_Basic_Bulish_MA__0_1);
                    //---    Alert("500 Is_Basic_Bulish_MA__0_10: ",     ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_._500_.Is_Basic_Bulish_MA__0_10);
                    //---    Alert("500 Is_Basic_AboveAsk: ",            ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_._500_.Is_Basic_AboveAsk);
                    //---    Alert("500 Diff_Open: ",                    ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_._500_.Diff_Open);
                    //---    Alert(" ma Is_Basic_500_Above_300: ",       ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_.Is_Basic_500_Above_300);
                    //---    Alert(" ma Is_Basic_30_Above_20: ",         ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_.Is_Basic_30_Above_20);
                    //---    Alert(" ma Is_Complex_EMA_Close_Bulish: ",  ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_.Is_Complex_EMA_Close_Bulish );
                    //
                    Data.FLAGs.Indicators_iMA.Complex.flag_2_Is_Complex_EMA_Close_Bulish                             = ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_.Is_Complex_EMA_Close_Bulish;
                    Data.FLAGs.Indicators_iMA.Basic.flag_2_Is_Basic_5_Above_3                                        = ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_.IsBasic_5_Above_3_Bearish;
                    Data.FLAGs.Indicators_iMA.Super.flag_2_IsSuper_ON_Buy__OFF_Sell_500_300                          = ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_.IsSuper_ON_Buy__OFF_Sell_500_300;
                    //--- Alert("et_IMA_NEAR:", EnumToString( ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_._500_.et_IMA_NEAR)); //
                    //---Alert("flag_2_IsSuper_ON_Buy__OFF_Sell_500_300: ", Data.FLAGs.Indicators_iMA.Super.flag_2_IsSuper_ON_Buy__OFF_Sell_500_300); //
                    //
          } //
}
//+------------------------------------------------------------------+
void St_CondicatorData_Extern_Signals::Set__Trade__Signals__Indicators_WPR_()
{         //---Indicators_WPR
          Data.FLAGs.Indicators_WPR.Basic.flag_2_Is_Basic__Bulish_MovingAvrage_iWPR_200                              = ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR_Peroid._Current.t_iWPR_200[0].Is_Basic_Bulish_MovingAvrage;
          //
          {         if(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR_Peroid._Current.IsComplex_WPR200_WPR14_0_BS)                                                      {Data.FLAGs.Indicators_WPR.Complex.flag_2_Is_Complex__WPR_Buy_Support       = true;    Data.Enum_Signal_temp_Desc = gf_Desc_ADD(Data.Enum_Signal_temp_Desc, "[+WPRBS]");        }       ////---WR%200 >-50
                    else                                                                                                                         {Data.FLAGs.Indicators_WPR.Complex.flag_2_Is_Complex__WPR_Buy_Support       = false;   Data.Enum_Signal_temp_Desc = gf_Desc_ADD(Data.Enum_Signal_temp_Desc, "[-WPRBS]");        }       // //---WR%200 <-50
                    //ASSIGN NOT DEFINE DESC
                    Data.FLAGs.Indicators_WPR.Complex.flag_2_Is_Complex__WPR_Buy_Support = ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR_Peroid._Current.IsComplex_WPR200_WPR14_0_BS;
                    //
                    if(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR_Peroid._Current.IsComplex_WPR200_WPR14_0_SS)                                                      {Data.FLAGs.Indicators_WPR.Complex.flag_2_Is_Complex__WPR_Sell_Support       = true;   Data.Enum_Signal_temp_Desc = gf_Desc_ADD(Data.Enum_Signal_temp_Desc, "[+WPRSS]");        }       ////---WR%200 >-50
                    else                                                                                                                         {Data.FLAGs.Indicators_WPR.Complex.flag_2_Is_Complex__WPR_Sell_Support      = false;   Data.Enum_Signal_temp_Desc = gf_Desc_ADD(Data.Enum_Signal_temp_Desc, "[-WPRSS]");        }       ////---WR%200 >-50}
                    Data.FLAGs.Indicators_WPR.Complex.flag_2_Is_Complex__WPR_Sell_Support = ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR_Peroid._Current.IsComplex_WPR200_WPR14_0_SS;
                    //
          } //
          {         //******************************************************************************
                    Is_Trend_Bulish_Forward = ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Is_Bulish_All_Middle
                                              && ct_Drive.TDD.ct_Conductor.DC_data.Trigers.IsExpanding_20_Bulish;
                    Is_Trend_Bulish_Backward = ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Is_Bulish_All_Middle
                                               && ct_Drive.TDD.ct_Conductor.DC_data.Trigers.IsExpanding_20_Bearish;
                    Is_Trend_Bearish_Forward = !ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Is_Bulish_All_Middle
                                               && ct_Drive.TDD.ct_Conductor.DC_data.Trigers.IsExpanding_20_Bearish;
                    Is_Trend_Bearish_Backward = !ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Is_Bulish_All_Middle
                                                && ct_Drive.TDD.ct_Conductor.DC_data.Trigers.IsExpanding_20_Bulish;//
          } }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void St_CondicatorData_Extern_Signals::Set__Trade__Signals__Indicators_MACD_()
{
          {         //
                    //---Indicators_MACD
                    Data.FLAGs.Indicators_MACD.Basic.flag_2_Is_Basic_CrossDown_Signal_ = ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.E_MACD_Cross_Signal[0] == Et_MACD_Cross_Signal_Down_Buying;
                    Data.FLAGs.Indicators_MACD.Basic.flag_2_Is_Basic_CrossUp_Signal_   = ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.E_MACD_Cross_Signal[0] == Et_MACD_Cross_Signal_Up_Selling;  //--signal movements
                    //
          }//
          //--------------------------------------------------
          {         if(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.Signals.Is_SM_0_Sell_Supportive)                                                         {Data.FLAGs.Indicators_MACD.Basic.flag_4_SM_Possition_Current              = E_SMP_Sell_Supportive;                        Data.Enum_Signal_temp_Desc = gf_Desc_ADD(Data.Enum_Signal_temp_Desc, "[CMPSS]"); }      //
                    else if (ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.Signals.Is_SM_0_Sell_Resistancive)                                                 {Data.FLAGs.Indicators_MACD.Basic.flag_4_SM_Possition_Current              = E_SMP_Sell_Resistancive;                      Data.Enum_Signal_temp_Desc = gf_Desc_ADD(Data.Enum_Signal_temp_Desc, "[CMPSR]"); }      //
                    else if (ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.Signals.Is_SM_0_Buy_Supportive)                                                    {Data.FLAGs.Indicators_MACD.Basic.flag_4_SM_Possition_Current              = E_SMP_Buy_Supportive;                         Data.Enum_Signal_temp_Desc = gf_Desc_ADD(Data.Enum_Signal_temp_Desc, "[CMPBS]"); }      //
                    else if (ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.Signals.Is_SM_0_Buy_Resistancive)                                                  {Data.FLAGs.Indicators_MACD.Basic.flag_4_SM_Possition_Current              = E_SMP_Buy_Resistancive;                       Data.Enum_Signal_temp_Desc = gf_Desc_ADD(Data.Enum_Signal_temp_Desc, "[CMPBR]"); }      //
                    else                                                                                                                         {Data.FLAGs.Indicators_MACD.Basic.flag_4_SM_Possition_Current              = E_SMP_Void;                                   Data.Enum_Signal_temp_Desc = gf_Desc_ADD(Data.Enum_Signal_temp_Desc, "[CMPVV]");}
                    //
          }
          //------------------------------------------------
          {         //chack Enum_Signal_Desc0 complex
                    if(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M5.Signals.SM_Possition_0 == E_SMP_Buy_Supportive)                                                {/*Data.FLAGs.Indicators_x.Complex.flag_2_Is_Complex__x_Buy_Support             = true;  */   ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc1 = gf_Desc_ADD(ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc1, "[5MPBS]"); }
                    else if(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M5.Signals.SM_Possition_0 == E_SMP_Buy_Resistancive)                                         {/*Data.FLAGs.Indicators_x.Complex.flag_2_Is_Complex__x_Buy_Support             = true;  */   ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc1 = gf_Desc_ADD(ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc1, "[5MPBR]"); }
                    else if(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M5.Signals.SM_Possition_0 == E_SMP_Sell_Supportive)                                          {/*Data.FLAGs.Indicators_x.Complex.flag_2_Is_Complex__x_Buy_Support             = true;  */   ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc1 = gf_Desc_ADD(ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc1, "[5MPSS]"); }
                    else if(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M5.Signals.SM_Possition_0 == E_SMP_Sell_Resistancive)                                        {/*Data.FLAGs.Indicators_x.Complex.flag_2_Is_Complex__x_Buy_Support             = true;  */   ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc1 = gf_Desc_ADD(ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc1, "[5MPSR]"); }//
                    //
                    if(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._H1.Signals.SM_Possition_0 == E_SMP_Buy_Supportive)                                                {/*Data.FLAGs.Indicators_x.Complex.flag_2_Is_Complex__x_Buy_Support             = true;  */   ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc1 = gf_Desc_ADD(ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc1, "[H1MPBS]"); }
                    else if(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._H1.Signals.SM_Possition_0 == E_SMP_Buy_Resistancive)                                         {/*Data.FLAGs.Indicators_x.Complex.flag_2_Is_Complex__x_Buy_Support             = true;  */   ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc1 = gf_Desc_ADD(ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc1, "[H1MPBR]"); }
                    else if(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._H1.Signals.SM_Possition_0 == E_SMP_Sell_Supportive)                                          {/*Data.FLAGs.Indicators_x.Complex.flag_2_Is_Complex__x_Buy_Support             = true;  */   ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc1 = gf_Desc_ADD(ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc1, "[H1MPSS]"); }
                    else if(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._H1.Signals.SM_Possition_0 == E_SMP_Sell_Resistancive)                                        {/*Data.FLAGs.Indicators_x.Complex.flag_2_Is_Complex__x_Buy_Support             = true;  */   ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc1 = gf_Desc_ADD(ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc1, "[H1MPSR]"); }//
                    //
                    // define
                    if(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M5.Signals.TL_Movment_0_5 == E_Movment_UU)                                                     {/*Data.FLAGs.Indicators_x.Complex.flag_2_Is_Complex__x_Buy_Support             = true;  */      ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc1 = gf_Desc_ADD(ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc1, "[5MMM-UU]");   }
                    else if(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M5.Signals.TL_Movment_0_5 == E_Movment_DU)                                                {/*Data.FLAGs.Indicators_x.Complex.flag_2_Is_Complex__x_Buy_Support             = true;  */      ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc1 = gf_Desc_ADD(ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc1, "[5MMM-DU]"); }
                    else if(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M5.Signals.TL_Movment_0_5 == E_Movment_ULL)                                               {/*Data.FLAGs.Indicators_x.Complex.flag_2_Is_Complex__x_Buy_Support             = true;  */      ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc1 = gf_Desc_ADD(ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc1, "[5MMM-ULL]");  }
                    else if(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M5.Signals.TL_Movment_0_5 == E_Movment_DLL)                                               {/*Data.FLAGs.Indicators_x.Complex.flag_2_Is_Complex__x_Buy_Support             = true;  */      ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc1 = gf_Desc_ADD(ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc1, "[5MMM-DLL]");}
                    //
                    //
                    if(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._H1.Signals.TL_Movment_0_5 == E_Movment_UU)                                                     {/*Data.FLAGs.Indicators_x.Complex.flag_2_Is_Complex__x_Buy_Support             = true;  */      ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc1 = gf_Desc_ADD(ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc1, "[H1MM-UU]");     }
                    else if(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._H1.Signals.TL_Movment_0_5 == E_Movment_DU)                                                {/*Data.FLAGs.Indicators_x.Complex.flag_2_Is_Complex__x_Buy_Support             = true;  */      ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc1 = gf_Desc_ADD(ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc1, "[H1MM-DU]");   }
                    else if(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._H1.Signals.TL_Movment_0_5 == E_Movment_ULL)                                               {/*Data.FLAGs.Indicators_x.Complex.flag_2_Is_Complex__x_Buy_Support             = true;  */      ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc1 = gf_Desc_ADD(ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc1, "[H1MM-ULL]");    }
                    else if(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._H1.Signals.TL_Movment_0_5 == E_Movment_DLL)                                               {/*Data.FLAGs.Indicators_x.Complex.flag_2_Is_Complex__x_Buy_Support             = true;  */      ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc1 = gf_Desc_ADD(ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc1, "[H1MM-DLL]");  }
                    //
          }//
          {         //--- movment and macd
                    {         if (ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.Signals.Is_SM_0_Sell_Resistancive && ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bar_TL_Movment_0_5_Periods._Current.s_E_TL_Movment_AB._Bar_Is_E_Movment_DU)      { ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc1 = gf_Desc_ADD(ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc1, "[SR][DU]"); } ;  //---Can Buy
                              if (ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.Signals.Is_SM_0_Sell_Resistancive && ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bar_TL_Movment_0_5_Periods._Current.s_E_TL_Movment_AB._Bar_Is_E_Movment_ULL)     { ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc1 = gf_Desc_ADD(ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc1, "[SR][ULL]"); } ; //---Can Buy
                              //
                              if (ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.Signals.Is_SM_0_Buy_Resistancive && ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bar_TL_Movment_0_5_Periods._Current.s_E_TL_Movment_AB._Bar_Is_E_Movment_UU)       { ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc1 = gf_Desc_ADD(ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc1, "[BR][UU]"); } ;     //---Can Sell
                              if (ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.Signals.Is_SM_0_Buy_Resistancive && ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bar_TL_Movment_0_5_Periods._Current.s_E_TL_Movment_AB._Bar_Is_E_Movment_DLL)      { ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc1 = gf_Desc_ADD(ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc1, "[BR][DLL]"); } ; //---Can Sell
                    }//
                    //---Is_Test_Compex_Indicators_MACD
                    bool Is_Test_Compex_Indicators_MACD = false;
                    if(Is_Test_Compex_Indicators_MACD) //--test sample Compex of  Indicators._MACD_Peroid._M5 Indicators._MACD_Peroid._M1
                    {         bool       Is_SEller       = ( ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M5.Signals.Is_SM_0_Buy_Resistancive || ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M5.Signals.Is_SM_0_Sell_Supportive) && (ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.Signals.Is_SM_0_Sell_Supportive   ||   ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.Signals.Is_SM_0_Buy_Resistancive);
                              bool       Is_Buyer        = ( ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M5.Signals.Is_SM_0_Sell_Resistancive || ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M5.Signals.Is_SM_0_Buy_Supportive) && (ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.Signals.Is_SM_0_Sell_Resistancive ||   ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.Signals.Is_SM_0_Buy_Supportive);
                              //
                              if(Is_SEller)             {    Data.Enum_Signal_temp_Desc = gf_Desc_ADD(Data.Enum_Signal_temp_Desc, "[Is_SEller]"); }
                              else if(Is_Buyer)         {    Data.Enum_Signal_temp_Desc = gf_Desc_ADD(Data.Enum_Signal_temp_Desc, "[Is_Buyer]"); }  //
                    }//
          }//
          {         //--[Indicators Face 2 challange divergence MACD & waves]----
                    Indicators_Face_divergence_MACD__waves();
                    //
          }//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void St_CondicatorData_Extern_Signals::Indicators_Face_divergence_MACD__waves()
{         bool IsKey = true;
          if(ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Pad_Is_All) {IsKey = false;}
          {         //ObjectDelete(0, EnumToString(f) +  "_desc.Macd-Signal-Broken-Up:" + (string)i);
                    ObjectDelete(0, "TL.MACD_Divergenced_0_2"); //
                    ObjectDelete(0, "TL.MACD_Divergenced_1_3"); //
                    ObjectDelete(0, "TL.MACD_Divergenced_2_4"); //0
                    ObjectDelete(0, "TL.MACD_Divergenced_3_5"); //
          }
          ///--if(Detect_NewBar._M1.Is_NewBar)IsKey = true; //-run twice needed
          //
          //--Alert(ArraySize(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.t_iMACD_Main_12_26_9_PriceClose));
          if(!ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.GDS.Wave1.IsBasic_Existed()) { return; }
          //---------------------------------------------------------------------------------------------------------------
          int  size_arrayMACD     = ArraySize(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.t_iMACD_12_26_9_PriceClose);
          bool IsBasic_Grater = ct_Drive.TDD.ct_Conductor.DC_data.Wave1_A._Shift > size_arrayMACD ;
          if(IsBasic_Grater)  {ArrayResize(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.t_iMACD_12_26_9_PriceClose, size_arrayMACD + 15);}
          int size_array2MACD     = ArraySize(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.t_iMACD_12_26_9_PriceClose);
          IsBasic_Grater      = ct_Drive.TDD.ct_Conductor.DC_data.Wave1_A._Shift > size_array2MACD ;
          //---if(IsBasic_Grater)  { Alert("IsBasic_Grater:", IsBasic_Grater, "  ct_Drive.TDD.ct_Conductor.DC_data.Wave1_A._Shift: ", ct_Drive.TDD.ct_Conductor.DC_data.Wave1_A._Shift, "   size_arrayMACD: ", size_arrayMACD, "   size_array2MACD: ", size_array2MACD); return;}
          //---------------------------------------------------------------------------------------------------------------
          ct_Drive.TDD.ct_Conductor.DC_data.Wave1_A                       = ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.GDS.Wave1.A;
          ct_Drive.TDD.ct_Conductor.DC_data.Wave1_A.MACD_Value_Main       = ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.t_iMACD_12_26_9_PriceClose[ct_Drive.TDD.ct_Conductor.DC_data.Wave1_A._Shift].Main._Value;
          //
          ct_Drive.TDD.ct_Conductor.DC_data.Wave1_Z                       = ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.GDS.Wave1.Z;
          ct_Drive.TDD.ct_Conductor.DC_data.Wave1_Z.MACD_Value_Main       = ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.t_iMACD_12_26_9_PriceClose[ct_Drive.TDD.ct_Conductor.DC_data.Wave1_Z._Shift].Main._Value;
          //
          ct_Drive.TDD.ct_Conductor.DC_data.Wave2_Z                       = ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.GDS.Wave2.Z;
          ct_Drive.TDD.ct_Conductor.DC_data.Wave2_Z.MACD_Value_Main       = ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.t_iMACD_12_26_9_PriceClose[ct_Drive.TDD.ct_Conductor.DC_data.Wave2_Z._Shift].Main._Value;
          //
          ct_Drive.TDD.ct_Conductor.DC_data.Wave3_Z                       = ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.GDS.Wave3.Z;
          ct_Drive.TDD.ct_Conductor.DC_data.Wave3_Z.MACD_Value_Main       = ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.t_iMACD_12_26_9_PriceClose[ct_Drive.TDD.ct_Conductor.DC_data.Wave3_Z._Shift].Main._Value;
          //
          ct_Drive.TDD.ct_Conductor.DC_data.Wave4_Z                       = ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.GDS.Wave4.Z;
          ct_Drive.TDD.ct_Conductor.DC_data.Wave4_Z.MACD_Value_Main       = ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.t_iMACD_12_26_9_PriceClose[ct_Drive.TDD.ct_Conductor.DC_data.Wave4_Z._Shift].Main._Value;
          //
          ct_Drive.TDD.ct_Conductor.DC_data.Wave5_Z                       = ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.GDS.Wave5.Z;
          ct_Drive.TDD.ct_Conductor.DC_data.Wave5_Z.MACD_Value_Main       = ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.t_iMACD_12_26_9_PriceClose[ct_Drive.TDD.ct_Conductor.DC_data.Wave5_Z._Shift].Main._Value;
          //
          //---set is diverganced
          {         ct_Drive.TDD.ct_Conductor.DC_data.Is_MACD_Divergenced_0_2 = false;
                    ct_Drive.TDD.ct_Conductor.DC_data.Is_MACD_Divergenced_1_3 = false;
                    ct_Drive.TDD.ct_Conductor.DC_data.Is_MACD_Divergenced_2_4 = false;
                    ct_Drive.TDD.ct_Conductor.DC_data.Is_MACD_Divergenced_3_5 = false;
                    //--0-2
                    if(ct_Drive.TDD.ct_Conductor.DC_data.Wave1_A._Price > ct_Drive.TDD.ct_Conductor.DC_data.Wave2_Z._Price) //---mean bearish                             -> \
                    {         //
                              if(ct_Drive.TDD.ct_Conductor.DC_data.Wave1_A.MACD_Value_Main < ct_Drive.TDD.ct_Conductor.DC_data.Wave2_Z.MACD_Value_Main)   //                              -> /
                              {         //
                                        ct_Drive.TDD.ct_Conductor.DC_data.Is_MACD_Divergenced_0_2 = true;  //Alert("Is_MACD_Divergenced_0_2: ", Is_MACD_Divergenced_0_2); //
                              } //
                              else
                              {         ct_Drive.TDD.ct_Conductor.DC_data.Is_MACD_Divergenced_0_2 = false; //                   //                -> \
                              } //
                    } //
                    else //---mean bearish bulish                                                                       -> /
                    {         if(ct_Drive.TDD.ct_Conductor.DC_data.Wave1_A.MACD_Value_Main > ct_Drive.TDD.ct_Conductor.DC_data.Wave2_Z.MACD_Value_Main)    //               -> \
                              {         //
                                        ct_Drive.TDD.ct_Conductor.DC_data.Is_MACD_Divergenced_0_2 = true;  //Alert("Is_MACD_Divergenced_0_2: ", Is_MACD_Divergenced_0_2); //
                              } //
                              else                                                      //                              -> /
                              {         ct_Drive.TDD.ct_Conductor.DC_data.Is_MACD_Divergenced_0_2 = false; //
                              }//
                    } //
                    //--1-3
                    if(ct_Drive.TDD.ct_Conductor.DC_data.Wave1_Z._Price > ct_Drive.TDD.ct_Conductor.DC_data.Wave3_Z._Price) //---mean bearish               -> \
                    {         //
                              if(ct_Drive.TDD.ct_Conductor.DC_data.Wave1_Z.MACD_Value_Main < ct_Drive.TDD.ct_Conductor.DC_data.Wave3_Z.MACD_Value_Main)   //                -> /
                              {         //
                                        ct_Drive.TDD.ct_Conductor.DC_data.Is_MACD_Divergenced_1_3 = true;  //Alert("Is_MACD_Divergenced_1_3: ", Is_MACD_Divergenced_1_3); //
                              } //
                              else
                              {         ct_Drive.TDD.ct_Conductor.DC_data.Is_MACD_Divergenced_1_3 = false; //               //                    -> \
                              } //
                    } //
                    else //---mean bearish bulish                                                                       -> /
                    {         if(ct_Drive.TDD.ct_Conductor.DC_data.Wave1_Z.MACD_Value_Main > ct_Drive.TDD.ct_Conductor.DC_data.Wave3_Z.MACD_Value_Main)    //               -> \
                              {         //
                                        ct_Drive.TDD.ct_Conductor.DC_data.Is_MACD_Divergenced_1_3 = true;  //Alert("Is_MACD_Divergenced_1_3: ", Is_MACD_Divergenced_1_3); //
                              } //
                              else                                                      //                              -> /
                              {         ct_Drive.TDD.ct_Conductor.DC_data.Is_MACD_Divergenced_1_3 = false; //
                              }//
                    } //
                    //2-4
                    //
                    if(ct_Drive.TDD.ct_Conductor.DC_data.Wave2_Z._Price > ct_Drive.TDD.ct_Conductor.DC_data.Wave4_Z._Price) //---mean bearish               -> \
                    {         //
                              if(ct_Drive.TDD.ct_Conductor.DC_data.Wave2_Z.MACD_Value_Main < ct_Drive.TDD.ct_Conductor.DC_data.Wave4_Z.MACD_Value_Main)   //                -> /
                              {         //
                                        ct_Drive.TDD.ct_Conductor.DC_data.Is_MACD_Divergenced_2_4 = true;  // Alert("Is_MACD_Divergenced_2_4: ", Is_MACD_Divergenced_2_4); //
                              } //
                              else
                              {         ct_Drive.TDD.ct_Conductor.DC_data.Is_MACD_Divergenced_2_4 = false; //               //                    -> \
                              } //
                    } //
                    else //---mean bearish bulish                                                                       -> /
                    {         if(ct_Drive.TDD.ct_Conductor.DC_data.Wave2_Z.MACD_Value_Main > ct_Drive.TDD.ct_Conductor.DC_data.Wave4_Z.MACD_Value_Main)    //               -> \
                              {         //
                                        ct_Drive.TDD.ct_Conductor.DC_data.Is_MACD_Divergenced_2_4 = true; //  Alert("Is_MACD_Divergenced_2_4: ", Is_MACD_Divergenced_2_4); //
                              } //
                              else                                                      //                              -> /
                              {         ct_Drive.TDD.ct_Conductor.DC_data.Is_MACD_Divergenced_2_4 = false; //
                              }//
                    } //
                    // 3-5
                    //
                    if(ct_Drive.TDD.ct_Conductor.DC_data.Wave3_Z._Price > ct_Drive.TDD.ct_Conductor.DC_data.Wave5_Z._Price) //---mean bearish               -> \
                    {         //
                              if(ct_Drive.TDD.ct_Conductor.DC_data.Wave3_Z.MACD_Value_Main < ct_Drive.TDD.ct_Conductor.DC_data.Wave5_Z.MACD_Value_Main)   //                -> /
                              {         //
                                        ct_Drive.TDD.ct_Conductor.DC_data.Is_MACD_Divergenced_3_5 = true;  //Alert("Is_MACD_Divergenced_3_5: ", Is_MACD_Divergenced_3_5); //
                              } //
                              else
                              {         ct_Drive.TDD.ct_Conductor.DC_data.Is_MACD_Divergenced_3_5 = false; //               //                    -> \
                              } //
                    } //
                    else //---mean bearish bulish                                                                       -> /
                    {         if(ct_Drive.TDD.ct_Conductor.DC_data.Wave3_Z.MACD_Value_Main > ct_Drive.TDD.ct_Conductor.DC_data.Wave5_Z.MACD_Value_Main)    //               -> \
                              {         //
                                        ct_Drive.TDD.ct_Conductor.DC_data.Is_MACD_Divergenced_3_5 = true;  //Alert("Is_MACD_Divergenced_3_5: ", Is_MACD_Divergenced_3_5); //
                              } //
                              else                                                      //                              -> /
                              {         ct_Drive.TDD.ct_Conductor.DC_data.Is_MACD_Divergenced_3_5 = false; //
                              }//
                    } //
                    ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.GDS.Wave2.Is_MACD_Divergenced = ct_Drive.TDD.ct_Conductor.DC_data.Is_MACD_Divergenced_0_2;
                    ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.GDS.Wave3.Is_MACD_Divergenced = ct_Drive.TDD.ct_Conductor.DC_data.Is_MACD_Divergenced_1_3;
                    ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.GDS.Wave4.Is_MACD_Divergenced = ct_Drive.TDD.ct_Conductor.DC_data.Is_MACD_Divergenced_2_4;
                    ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.GDS.Wave5.Is_MACD_Divergenced = ct_Drive.TDD.ct_Conductor.DC_data.Is_MACD_Divergenced_3_5; //
          }//
          Sg_Point_ BarUse, BarUse2;
          BarUse._Time    = 0;
          BarUse._Price   = 0;
          BarUse2._Time   = 0;
          BarUse2._Price  = 0;
          //------------------------------------------------------------------------------
          {         //-------------------------------------------------------------------------------
                    if( ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.GDS.Wave2.Is_MACD_Divergenced)
                    {         BarUse._Time        = ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.GDS.Wave1.A._Time;
                              BarUse._Price       = ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.GDS.Wave1.A._Price;
                              BarUse2._Time       = ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.GDS.Wave2.Z._Time;
                              BarUse2._Price      = ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.GDS.Wave2.Z._Price;
                              Dev_Object_Pack.Lines.Trend.Draw_GDS_Lines(MODE_CREATE, IsKey, "TL.MACD_Divergenced_0_2", "", BarUse._Time, BarUse._Price + 20 * Point, BarUse2._Time, BarUse2._Price + 20 * Point, clrYellow, 2, false, STYLE_DASH, false); //
                    }
                    if( ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.GDS.Wave3.Is_MACD_Divergenced)
                    {         BarUse._Time        = ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.GDS.Wave1.Z._Time;
                              BarUse._Price       = ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.GDS.Wave1.Z._Price;
                              BarUse2._Time       = ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.GDS.Wave3.Z._Time;
                              BarUse2._Price      = ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.GDS.Wave3.Z._Price;
                              Dev_Object_Pack.Lines.Trend.Draw_GDS_Lines(MODE_CREATE, IsKey, "TL.MACD_Divergenced_1_3", "", BarUse._Time, BarUse._Price + 20 * Point, BarUse2._Time, BarUse2._Price + 20 * Point, clrYellow, 2, false, STYLE_DASH, false); //
                    }
                    if( ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.GDS.Wave4.Is_MACD_Divergenced)
                    {         BarUse._Time        = ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.GDS.Wave2.Z._Time;
                              BarUse._Price       = ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.GDS.Wave2.Z._Price;
                              BarUse2._Time       = ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.GDS.Wave4.Z._Time;
                              BarUse2._Price      = ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.GDS.Wave4.Z._Price;
                              Dev_Object_Pack.Lines.Trend.Draw_GDS_Lines(MODE_CREATE, IsKey, "TL.MACD_Divergenced_2_4", "", BarUse._Time, BarUse._Price + 20 * Point, BarUse2._Time, BarUse2._Price + 20 * Point, clrYellow, 2, false, STYLE_DASH, false); //
                    }
                    if( ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.GDS.Wave5.Is_MACD_Divergenced)
                    {         BarUse._Time        = ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.GDS.Wave3.Z._Time;
                              BarUse._Price       = ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.GDS.Wave3.Z._Price;
                              BarUse2._Time       = ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.GDS.Wave5.Z._Time;
                              BarUse2._Price      = ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.GDS.Wave5.Z._Price;
                              Dev_Object_Pack.Lines.Trend.Draw_GDS_Lines(MODE_CREATE, IsKey, "TL.MACD_Divergenced_3_5", "", BarUse._Time, BarUse._Price + 20 * Point, BarUse2._Time, BarUse2._Price + 20 * Point, clrYellow, 2, false, STYLE_DASH, false); //
                    }//
          }
          //
}
//if(condition)
//                                                 {         //
//                                                 }
//                                                 else
//                                                 {         //
//                                                 }//
//                                                 //
enum Et_AXIOM_Possibility
{         et_AXIOM_Possibility_void
          //
};
enum Et_AXIOM_Effect
{         et_AXIOM_Effect_void
          //
};
enum Et_AXIOM_Event
{         et_AXIOM_Event_void
          //
};
enum Et_AXIOM_Frame
{         et_AXIOM_Frame_void
          //
};
enum Et_AXIOM_Successor_state
{         et_AXIOM_Successor_state_void
          //
};
enum Et_AXIOM_Believes
{         et_AXIOM_Believes_void
          //
};
struct St_AXIOM
{         Et_AXIOM_Possibility       eAXIOM_Possibility;
          Et_AXIOM_Effect            eAXIOM_Effect;
          Et_AXIOM_Event             eAXIOM_Event;
          Et_AXIOM_Frame             eAXIOM_Frame;
          Et_AXIOM_Successor_state   eAXIOM_Successor_state;
          Et_AXIOM_Believes          eAXIOM_Believes;
          //
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

/*
//------------------------------------------------------------------------
switch(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._H1.MACD_Cross_Signal.eMACD_STATE[0])
                              {         case  UP_IN:
                                        {         Print("MACDSolo-_H1-UP_IN");
                                                  switch(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M30.MACD_Cross_Signal.eMACD_STATE[0])
                                                  {         case  UP_IN:
                                                            {         Print("MACDSolo-_M30-UP_IN");
                                                                      switch(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M5.MACD_Cross_Signal.eMACD_STATE[0])
                                                                      {         case  UP_IN:
                                                                                {         Print("MACDSolo-_M5-UP_IN");
                                                                                          switch(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.eMACD_STATE[0])
                                                                                          {         case  UP_IN:
                                                                                                    {         Print("MACDSolo-_Current-UP_IN");      } break;
                                                                                                    case  UP_OUT:
                                                                                                    {         Print("MACDSolo-_Current-UP_OUT");     } break;
                                                                                                    case  DOWN_IN:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_IN");    } break;
                                                                                                    case  DOWN_OUT:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_OUT");   } break;
                                                                                                    default: break;
                                                                                                              //
                                                                                          }; //
                                                                                }      break;
                                                                                case  UP_OUT:
                                                                                {         Print("MACDSolo-_M5-UP_OUT");
                                                                                          switch(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.eMACD_STATE[0])
                                                                                          {         case  UP_IN:
                                                                                                    {         Print("MACDSolo-_Current-UP_IN");      } break;
                                                                                                    case  UP_OUT:
                                                                                                    {         Print("MACDSolo-_Current-UP_OUT");     } break;
                                                                                                    case  DOWN_IN:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_IN");    } break;
                                                                                                    case  DOWN_OUT:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_OUT");   } break;
                                                                                                    default: break;
                                                                                                              //
                                                                                          };//
                                                                                }      break;
                                                                                case  DOWN_IN:
                                                                                {         Print("MACDSolo-_M5-DOWN_IN");
                                                                                          switch(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.eMACD_STATE[0])
                                                                                          {         case  UP_IN:
                                                                                                    {         Print("MACDSolo-_Current-UP_IN");      } break;
                                                                                                    case  UP_OUT:
                                                                                                    {         Print("MACDSolo-_Current-UP_OUT");     } break;
                                                                                                    case  DOWN_IN:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_IN");    } break;
                                                                                                    case  DOWN_OUT:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_OUT");   } break;
                                                                                                    default: break;
                                                                                                              //
                                                                                          };//
                                                                                }      break;
                                                                                case  DOWN_OUT:
                                                                                {         Print("MACDSolo-_M5-DOWN_OUT");
                                                                                          switch(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.eMACD_STATE[0])
                                                                                          {         case  UP_IN:
                                                                                                    {         Print("MACDSolo-_Current-UP_IN");      } break;
                                                                                                    case  UP_OUT:
                                                                                                    {         Print("MACDSolo-_Current-UP_OUT");     } break;
                                                                                                    case  DOWN_IN:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_IN");    } break;
                                                                                                    case  DOWN_OUT:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_OUT");   } break;
                                                                                                    default: break;
                                                                                                              //
                                                                                          };//
                                                                                }      break;
                                                                                default: break;
                                                                                          //
                                                                      };//
                                                            } break;
                                                            case  UP_OUT:
                                                            {         Print("MACDSolo-_M30-UP_OUT");
                                                                      switch(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M5.MACD_Cross_Signal.eMACD_STATE[0])
                                                                      {         case  UP_IN:
                                                                                {         Print("MACDSolo-_M5-UP_IN");
                                                                                          switch(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.eMACD_STATE[0])
                                                                                          {         case  UP_IN:
                                                                                                    {         Print("MACDSolo-_Current-UP_IN");      } break;
                                                                                                    case  UP_OUT:
                                                                                                    {         Print("MACDSolo-_Current-UP_OUT");     } break;
                                                                                                    case  DOWN_IN:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_IN");    } break;
                                                                                                    case  DOWN_OUT:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_OUT");   } break;
                                                                                                    default: break;
                                                                                                              //
                                                                                          }; //
                                                                                }      break;
                                                                                case  UP_OUT:
                                                                                {         Print("MACDSolo-_M5-UP_OUT");
                                                                                          switch(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.eMACD_STATE[0])
                                                                                          {         case  UP_IN:
                                                                                                    {         Print("MACDSolo-_Current-UP_IN");      } break;
                                                                                                    case  UP_OUT:
                                                                                                    {         Print("MACDSolo-_Current-UP_OUT");     } break;
                                                                                                    case  DOWN_IN:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_IN");    } break;
                                                                                                    case  DOWN_OUT:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_OUT");   } break;
                                                                                                    default: break;
                                                                                                              //
                                                                                          };//
                                                                                }      break;
                                                                                case  DOWN_IN:
                                                                                {         Print("MACDSolo-_M5-DOWN_IN");
                                                                                          switch(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.eMACD_STATE[0])
                                                                                          {         case  UP_IN:
                                                                                                    {         Print("MACDSolo-_Current-UP_IN");      } break;
                                                                                                    case  UP_OUT:
                                                                                                    {         Print("MACDSolo-_Current-UP_OUT");     } break;
                                                                                                    case  DOWN_IN:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_IN");    } break;
                                                                                                    case  DOWN_OUT:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_OUT");   } break;
                                                                                                    default: break;
                                                                                                              //
                                                                                          };//
                                                                                }      break;
                                                                                case  DOWN_OUT:
                                                                                {         Print("MACDSolo-_M5-DOWN_OUT");
                                                                                          switch(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.eMACD_STATE[0])
                                                                                          {         case  UP_IN:
                                                                                                    {         Print("MACDSolo-_Current-UP_IN");      } break;
                                                                                                    case  UP_OUT:
                                                                                                    {         Print("MACDSolo-_Current-UP_OUT");     } break;
                                                                                                    case  DOWN_IN:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_IN");    } break;
                                                                                                    case  DOWN_OUT:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_OUT");   } break;
                                                                                                    default: break;
                                                                                                              //
                                                                                          };//
                                                                                }      break;
                                                                                default: break;
                                                                                          //
                                                                      };//
                                                            } break;
                                                            case  DOWN_IN:
                                                            {         Print("MACDSolo-_M30-DOWN_IN");
                                                                      switch(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M5.MACD_Cross_Signal.eMACD_STATE[0])
                                                                      {         case  UP_IN:
                                                                                {         Print("MACDSolo-_M5-UP_IN");
                                                                                          switch(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.eMACD_STATE[0])
                                                                                          {         case  UP_IN:
                                                                                                    {         Print("MACDSolo-_Current-UP_IN");      } break;
                                                                                                    case  UP_OUT:
                                                                                                    {         Print("MACDSolo-_Current-UP_OUT");     } break;
                                                                                                    case  DOWN_IN:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_IN");    } break;
                                                                                                    case  DOWN_OUT:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_OUT");   } break;
                                                                                                    default: break;
                                                                                                              //
                                                                                          }; //
                                                                                }      break;
                                                                                case  UP_OUT:
                                                                                {         Print("MACDSolo-_M5-UP_OUT");
                                                                                          switch(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.eMACD_STATE[0])
                                                                                          {         case  UP_IN:
                                                                                                    {         Print("MACDSolo-_Current-UP_IN");      } break;
                                                                                                    case  UP_OUT:
                                                                                                    {         Print("MACDSolo-_Current-UP_OUT");     } break;
                                                                                                    case  DOWN_IN:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_IN");    } break;
                                                                                                    case  DOWN_OUT:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_OUT");   } break;
                                                                                                    default: break;
                                                                                                              //
                                                                                          };//
                                                                                }      break;
                                                                                case  DOWN_IN:
                                                                                {         Print("MACDSolo-_M5-DOWN_IN");
                                                                                          switch(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.eMACD_STATE[0])
                                                                                          {         case  UP_IN:
                                                                                                    {         Print("MACDSolo-_Current-UP_IN");      } break;
                                                                                                    case  UP_OUT:
                                                                                                    {         Print("MACDSolo-_Current-UP_OUT");     } break;
                                                                                                    case  DOWN_IN:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_IN");    } break;
                                                                                                    case  DOWN_OUT:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_OUT");   } break;
                                                                                                    default: break;
                                                                                                              //
                                                                                          };//
                                                                                }      break;
                                                                                case  DOWN_OUT:
                                                                                {         Print("MACDSolo-_M5-DOWN_OUT");
                                                                                          switch(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.eMACD_STATE[0])
                                                                                          {         case  UP_IN:
                                                                                                    {         Print("MACDSolo-_Current-UP_IN");      } break;
                                                                                                    case  UP_OUT:
                                                                                                    {         Print("MACDSolo-_Current-UP_OUT");     } break;
                                                                                                    case  DOWN_IN:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_IN");    } break;
                                                                                                    case  DOWN_OUT:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_OUT");   } break;
                                                                                                    default: break;
                                                                                                              //
                                                                                          };//
                                                                                }      break;
                                                                                default: break;
                                                                                          //
                                                                      };//
                                                            } break;
                                                            case  DOWN_OUT:
                                                            {         Print("MACDSolo-_M30-DOWN_OUT");
                                                                      switch(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M5.MACD_Cross_Signal.eMACD_STATE[0])
                                                                      {         case  UP_IN:
                                                                                {         Print("MACDSolo-_M5-UP_IN");
                                                                                          switch(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.eMACD_STATE[0])
                                                                                          {         case  UP_IN:
                                                                                                    {         Print("MACDSolo-_Current-UP_IN");      } break;
                                                                                                    case  UP_OUT:
                                                                                                    {         Print("MACDSolo-_Current-UP_OUT");     } break;
                                                                                                    case  DOWN_IN:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_IN");    } break;
                                                                                                    case  DOWN_OUT:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_OUT");   } break;
                                                                                                    default: break;
                                                                                                              //
                                                                                          }; //
                                                                                }      break;
                                                                                case  UP_OUT:
                                                                                {         Print("MACDSolo-_M5-UP_OUT");
                                                                                          switch(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.eMACD_STATE[0])
                                                                                          {         case  UP_IN:
                                                                                                    {         Print("MACDSolo-_Current-UP_IN");      } break;
                                                                                                    case  UP_OUT:
                                                                                                    {         Print("MACDSolo-_Current-UP_OUT");     } break;
                                                                                                    case  DOWN_IN:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_IN");    } break;
                                                                                                    case  DOWN_OUT:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_OUT");   } break;
                                                                                                    default: break;
                                                                                                              //
                                                                                          };//
                                                                                }      break;
                                                                                case  DOWN_IN:
                                                                                {         Print("MACDSolo-_M5-DOWN_IN");
                                                                                          switch(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.eMACD_STATE[0])
                                                                                          {         case  UP_IN:
                                                                                                    {         Print("MACDSolo-_Current-UP_IN");      } break;
                                                                                                    case  UP_OUT:
                                                                                                    {         Print("MACDSolo-_Current-UP_OUT");     } break;
                                                                                                    case  DOWN_IN:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_IN");    } break;
                                                                                                    case  DOWN_OUT:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_OUT");   } break;
                                                                                                    default: break;
                                                                                                              //
                                                                                          };//
                                                                                }      break;
                                                                                case  DOWN_OUT:
                                                                                {         Print("MACDSolo-_M5-DOWN_OUT");
                                                                                          switch(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.eMACD_STATE[0])
                                                                                          {         case  UP_IN:
                                                                                                    {         Print("MACDSolo-_Current-UP_IN");      } break;
                                                                                                    case  UP_OUT:
                                                                                                    {         Print("MACDSolo-_Current-UP_OUT");     } break;
                                                                                                    case  DOWN_IN:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_IN");    } break;
                                                                                                    case  DOWN_OUT:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_OUT");   } break;
                                                                                                    default: break;
                                                                                                              //
                                                                                          };//
                                                                                }      break;
                                                                                default: break;
                                                                                          //
                                                                      };//
                                                            } break;
                                                            default: break;
                                                                      //
                                                  }; //
                                        } break;
                                        case  UP_OUT:
                                        {         Print("MACDSolo-_H1-UP_OUT");
                                                  switch(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M30.MACD_Cross_Signal.eMACD_STATE[0])
                                                  {         case  UP_IN:
                                                            {         Print("MACDSolo-_M30-UP_IN");
                                                                      switch(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M5.MACD_Cross_Signal.eMACD_STATE[0])
                                                                      {         case  UP_IN:
                                                                                {         Print("MACDSolo-_M5-UP_IN");
                                                                                          switch(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.eMACD_STATE[0])
                                                                                          {         case  UP_IN:
                                                                                                    {         Print("MACDSolo-_Current-UP_IN");      } break;
                                                                                                    case  UP_OUT:
                                                                                                    {         Print("MACDSolo-_Current-UP_OUT");     } break;
                                                                                                    case  DOWN_IN:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_IN");    } break;
                                                                                                    case  DOWN_OUT:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_OUT");   } break;
                                                                                                    default: break;
                                                                                                              //
                                                                                          }; //
                                                                                }      break;
                                                                                case  UP_OUT:
                                                                                {         Print("MACDSolo-_M5-UP_OUT");
                                                                                          switch(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.eMACD_STATE[0])
                                                                                          {         case  UP_IN:
                                                                                                    {         Print("MACDSolo-_Current-UP_IN");      } break;
                                                                                                    case  UP_OUT:
                                                                                                    {         Print("MACDSolo-_Current-UP_OUT");     } break;
                                                                                                    case  DOWN_IN:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_IN");    } break;
                                                                                                    case  DOWN_OUT:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_OUT");   } break;
                                                                                                    default: break;
                                                                                                              //
                                                                                          };//
                                                                                }      break;
                                                                                case  DOWN_IN:
                                                                                {         Print("MACDSolo-_M5-DOWN_IN");
                                                                                          switch(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.eMACD_STATE[0])
                                                                                          {         case  UP_IN:
                                                                                                    {         Print("MACDSolo-_Current-UP_IN");      } break;
                                                                                                    case  UP_OUT:
                                                                                                    {         Print("MACDSolo-_Current-UP_OUT");     } break;
                                                                                                    case  DOWN_IN:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_IN");    } break;
                                                                                                    case  DOWN_OUT:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_OUT");   } break;
                                                                                                    default: break;
                                                                                                              //
                                                                                          };//
                                                                                }      break;
                                                                                case  DOWN_OUT:
                                                                                {         Print("MACDSolo-_M5-DOWN_OUT");
                                                                                          switch(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.eMACD_STATE[0])
                                                                                          {         case  UP_IN:
                                                                                                    {         Print("MACDSolo-_Current-UP_IN");      } break;
                                                                                                    case  UP_OUT:
                                                                                                    {         Print("MACDSolo-_Current-UP_OUT");     } break;
                                                                                                    case  DOWN_IN:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_IN");    } break;
                                                                                                    case  DOWN_OUT:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_OUT");   } break;
                                                                                                    default: break;
                                                                                                              //
                                                                                          };//
                                                                                }      break;
                                                                                default: break;
                                                                                          //
                                                                      };//
                                                            } break;
                                                            case  UP_OUT:
                                                            {         Print("MACDSolo-_M30-UP_OUT");
                                                                      switch(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M5.MACD_Cross_Signal.eMACD_STATE[0])
                                                                      {         case  UP_IN:
                                                                                {         Print("MACDSolo-_M5-UP_IN");
                                                                                          switch(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.eMACD_STATE[0])
                                                                                          {         case  UP_IN:
                                                                                                    {         Print("MACDSolo-_Current-UP_IN");      } break;
                                                                                                    case  UP_OUT:
                                                                                                    {         Print("MACDSolo-_Current-UP_OUT");     } break;
                                                                                                    case  DOWN_IN:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_IN");    } break;
                                                                                                    case  DOWN_OUT:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_OUT");   } break;
                                                                                                    default: break;
                                                                                                              //
                                                                                          }; //
                                                                                }      break;
                                                                                case  UP_OUT:
                                                                                {         Print("MACDSolo-_M5-UP_OUT");
                                                                                          switch(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.eMACD_STATE[0])
                                                                                          {         case  UP_IN:
                                                                                                    {         Print("MACDSolo-_Current-UP_IN");      } break;
                                                                                                    case  UP_OUT:
                                                                                                    {         Print("MACDSolo-_Current-UP_OUT");     } break;
                                                                                                    case  DOWN_IN:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_IN");    } break;
                                                                                                    case  DOWN_OUT:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_OUT");   } break;
                                                                                                    default: break;
                                                                                                              //
                                                                                          };//
                                                                                }      break;
                                                                                case  DOWN_IN:
                                                                                {         Print("MACDSolo-_M5-DOWN_IN");
                                                                                          switch(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.eMACD_STATE[0])
                                                                                          {         case  UP_IN:
                                                                                                    {         Print("MACDSolo-_Current-UP_IN");      } break;
                                                                                                    case  UP_OUT:
                                                                                                    {         Print("MACDSolo-_Current-UP_OUT");     } break;
                                                                                                    case  DOWN_IN:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_IN");    } break;
                                                                                                    case  DOWN_OUT:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_OUT");   } break;
                                                                                                    default: break;
                                                                                                              //
                                                                                          };//
                                                                                }      break;
                                                                                case  DOWN_OUT:
                                                                                {         Print("MACDSolo-_M5-DOWN_OUT");
                                                                                          switch(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.eMACD_STATE[0])
                                                                                          {         case  UP_IN:
                                                                                                    {         Print("MACDSolo-_Current-UP_IN");      } break;
                                                                                                    case  UP_OUT:
                                                                                                    {         Print("MACDSolo-_Current-UP_OUT");     } break;
                                                                                                    case  DOWN_IN:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_IN");    } break;
                                                                                                    case  DOWN_OUT:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_OUT");   } break;
                                                                                                    default: break;
                                                                                                              //
                                                                                          };//
                                                                                }      break;
                                                                                default: break;
                                                                                          //
                                                                      };//
                                                            } break;
                                                            case  DOWN_IN:
                                                            {         Print("MACDSolo-_M30-DOWN_IN");
                                                                      switch(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M5.MACD_Cross_Signal.eMACD_STATE[0])
                                                                      {         case  UP_IN:
                                                                                {         Print("MACDSolo-_M5-UP_IN");
                                                                                          switch(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.eMACD_STATE[0])
                                                                                          {         case  UP_IN:
                                                                                                    {         Print("MACDSolo-_Current-UP_IN");      } break;
                                                                                                    case  UP_OUT:
                                                                                                    {         Print("MACDSolo-_Current-UP_OUT");     } break;
                                                                                                    case  DOWN_IN:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_IN");    } break;
                                                                                                    case  DOWN_OUT:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_OUT");   } break;
                                                                                                    default: break;
                                                                                                              //
                                                                                          }; //
                                                                                }      break;
                                                                                case  UP_OUT:
                                                                                {         Print("MACDSolo-_M5-UP_OUT");
                                                                                          switch(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.eMACD_STATE[0])
                                                                                          {         case  UP_IN:
                                                                                                    {         Print("MACDSolo-_Current-UP_IN");      } break;
                                                                                                    case  UP_OUT:
                                                                                                    {         Print("MACDSolo-_Current-UP_OUT");     } break;
                                                                                                    case  DOWN_IN:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_IN");    } break;
                                                                                                    case  DOWN_OUT:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_OUT");   } break;
                                                                                                    default: break;
                                                                                                              //
                                                                                          };//
                                                                                }      break;
                                                                                case  DOWN_IN:
                                                                                {         Print("MACDSolo-_M5-DOWN_IN");
                                                                                          switch(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.eMACD_STATE[0])
                                                                                          {         case  UP_IN:
                                                                                                    {         Print("MACDSolo-_Current-UP_IN");      } break;
                                                                                                    case  UP_OUT:
                                                                                                    {         Print("MACDSolo-_Current-UP_OUT");     } break;
                                                                                                    case  DOWN_IN:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_IN");    } break;
                                                                                                    case  DOWN_OUT:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_OUT");   } break;
                                                                                                    default: break;
                                                                                                              //
                                                                                          };//
                                                                                }      break;
                                                                                case  DOWN_OUT:
                                                                                {         Print("MACDSolo-_M5-DOWN_OUT");
                                                                                          switch(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.eMACD_STATE[0])
                                                                                          {         case  UP_IN:
                                                                                                    {         Print("MACDSolo-_Current-UP_IN");      } break;
                                                                                                    case  UP_OUT:
                                                                                                    {         Print("MACDSolo-_Current-UP_OUT");     } break;
                                                                                                    case  DOWN_IN:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_IN");    } break;
                                                                                                    case  DOWN_OUT:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_OUT");   } break;
                                                                                                    default: break;
                                                                                                              //
                                                                                          };//
                                                                                }      break;
                                                                                default: break;
                                                                                          //
                                                                      };//
                                                            } break;
                                                            case  DOWN_OUT:
                                                            {         Print("MACDSolo-_M30-DOWN_OUT");
                                                                      switch(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M5.MACD_Cross_Signal.eMACD_STATE[0])
                                                                      {         case  UP_IN:
                                                                                {         Print("MACDSolo-_M5-UP_IN");
                                                                                          switch(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.eMACD_STATE[0])
                                                                                          {         case  UP_IN:
                                                                                                    {         Print("MACDSolo-_Current-UP_IN");      } break;
                                                                                                    case  UP_OUT:
                                                                                                    {         Print("MACDSolo-_Current-UP_OUT");     } break;
                                                                                                    case  DOWN_IN:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_IN");    } break;
                                                                                                    case  DOWN_OUT:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_OUT");   } break;
                                                                                                    default: break;
                                                                                                              //
                                                                                          }; //
                                                                                }      break;
                                                                                case  UP_OUT:
                                                                                {         Print("MACDSolo-_M5-UP_OUT");
                                                                                          switch(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.eMACD_STATE[0])
                                                                                          {         case  UP_IN:
                                                                                                    {         Print("MACDSolo-_Current-UP_IN");      } break;
                                                                                                    case  UP_OUT:
                                                                                                    {         Print("MACDSolo-_Current-UP_OUT");     } break;
                                                                                                    case  DOWN_IN:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_IN");    } break;
                                                                                                    case  DOWN_OUT:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_OUT");   } break;
                                                                                                    default: break;
                                                                                                              //
                                                                                          };//
                                                                                }      break;
                                                                                case  DOWN_IN:
                                                                                {         Print("MACDSolo-_M5-DOWN_IN");
                                                                                          switch(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.eMACD_STATE[0])
                                                                                          {         case  UP_IN:
                                                                                                    {         Print("MACDSolo-_Current-UP_IN");      } break;
                                                                                                    case  UP_OUT:
                                                                                                    {         Print("MACDSolo-_Current-UP_OUT");     } break;
                                                                                                    case  DOWN_IN:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_IN");    } break;
                                                                                                    case  DOWN_OUT:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_OUT");   } break;
                                                                                                    default: break;
                                                                                                              //
                                                                                          };//
                                                                                }      break;
                                                                                case  DOWN_OUT:
                                                                                {         Print("MACDSolo-_M5-DOWN_OUT");
                                                                                          switch(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.eMACD_STATE[0])
                                                                                          {         case  UP_IN:
                                                                                                    {         Print("MACDSolo-_Current-UP_IN");      } break;
                                                                                                    case  UP_OUT:
                                                                                                    {         Print("MACDSolo-_Current-UP_OUT");     } break;
                                                                                                    case  DOWN_IN:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_IN");    } break;
                                                                                                    case  DOWN_OUT:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_OUT");   } break;
                                                                                                    default: break;
                                                                                                              //
                                                                                          };//
                                                                                }      break;
                                                                                default: break;
                                                                                          //
                                                                      };//
                                                            } break;
                                                            default: break;
                                                                      //
                                                  }; //
                                        } break;
                                        case  DOWN_IN:
                                        {         Print("MACDSolo-_H1-DOWN_IN");
                                                  switch(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M30.MACD_Cross_Signal.eMACD_STATE[0])
                                                  {         case  UP_IN:
                                                            {         Print("MACDSolo-_M30-UP_IN");
                                                                      switch(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M5.MACD_Cross_Signal.eMACD_STATE[0])
                                                                      {         case  UP_IN:
                                                                                {         Print("MACDSolo-_M5-UP_IN");
                                                                                          switch(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.eMACD_STATE[0])
                                                                                          {         case  UP_IN:
                                                                                                    {         Print("MACDSolo-_Current-UP_IN");      } break;
                                                                                                    case  UP_OUT:
                                                                                                    {         Print("MACDSolo-_Current-UP_OUT");     } break;
                                                                                                    case  DOWN_IN:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_IN");    } break;
                                                                                                    case  DOWN_OUT:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_OUT");   } break;
                                                                                                    default: break;
                                                                                                              //
                                                                                          }; //
                                                                                }      break;
                                                                                case  UP_OUT:
                                                                                {         Print("MACDSolo-_M5-UP_OUT");
                                                                                          switch(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.eMACD_STATE[0])
                                                                                          {         case  UP_IN:
                                                                                                    {         Print("MACDSolo-_Current-UP_IN");      } break;
                                                                                                    case  UP_OUT:
                                                                                                    {         Print("MACDSolo-_Current-UP_OUT");     } break;
                                                                                                    case  DOWN_IN:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_IN");    } break;
                                                                                                    case  DOWN_OUT:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_OUT");   } break;
                                                                                                    default: break;
                                                                                                              //
                                                                                          };//
                                                                                }      break;
                                                                                case  DOWN_IN:
                                                                                {         Print("MACDSolo-_M5-DOWN_IN");
                                                                                          switch(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.eMACD_STATE[0])
                                                                                          {         case  UP_IN:
                                                                                                    {         Print("MACDSolo-_Current-UP_IN");      } break;
                                                                                                    case  UP_OUT:
                                                                                                    {         Print("MACDSolo-_Current-UP_OUT");     } break;
                                                                                                    case  DOWN_IN:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_IN");    } break;
                                                                                                    case  DOWN_OUT:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_OUT");   } break;
                                                                                                    default: break;
                                                                                                              //
                                                                                          };//
                                                                                }      break;
                                                                                case  DOWN_OUT:
                                                                                {         Print("MACDSolo-_M5-DOWN_OUT");
                                                                                          switch(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.eMACD_STATE[0])
                                                                                          {         case  UP_IN:
                                                                                                    {         Print("MACDSolo-_Current-UP_IN");      } break;
                                                                                                    case  UP_OUT:
                                                                                                    {         Print("MACDSolo-_Current-UP_OUT");     } break;
                                                                                                    case  DOWN_IN:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_IN");    } break;
                                                                                                    case  DOWN_OUT:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_OUT");   } break;
                                                                                                    default: break;
                                                                                                              //
                                                                                          };//
                                                                                }      break;
                                                                                default: break;
                                                                                          //
                                                                      };//
                                                            } break;
                                                            case  UP_OUT:
                                                            {         Print("MACDSolo-_M30-UP_OUT");
                                                                      switch(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M5.MACD_Cross_Signal.eMACD_STATE[0])
                                                                      {         case  UP_IN:
                                                                                {         Print("MACDSolo-_M5-UP_IN");
                                                                                          switch(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.eMACD_STATE[0])
                                                                                          {         case  UP_IN:
                                                                                                    {         Print("MACDSolo-_Current-UP_IN");      } break;
                                                                                                    case  UP_OUT:
                                                                                                    {         Print("MACDSolo-_Current-UP_OUT");     } break;
                                                                                                    case  DOWN_IN:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_IN");    } break;
                                                                                                    case  DOWN_OUT:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_OUT");   } break;
                                                                                                    default: break;
                                                                                                              //
                                                                                          }; //
                                                                                }      break;
                                                                                case  UP_OUT:
                                                                                {         Print("MACDSolo-_M5-UP_OUT");
                                                                                          switch(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.eMACD_STATE[0])
                                                                                          {         case  UP_IN:
                                                                                                    {         Print("MACDSolo-_Current-UP_IN");      } break;
                                                                                                    case  UP_OUT:
                                                                                                    {         Print("MACDSolo-_Current-UP_OUT");     } break;
                                                                                                    case  DOWN_IN:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_IN");    } break;
                                                                                                    case  DOWN_OUT:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_OUT");   } break;
                                                                                                    default: break;
                                                                                                              //
                                                                                          };//
                                                                                }      break;
                                                                                case  DOWN_IN:
                                                                                {         Print("MACDSolo-_M5-DOWN_IN");
                                                                                          switch(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.eMACD_STATE[0])
                                                                                          {         case  UP_IN:
                                                                                                    {         Print("MACDSolo-_Current-UP_IN");      } break;
                                                                                                    case  UP_OUT:
                                                                                                    {         Print("MACDSolo-_Current-UP_OUT");     } break;
                                                                                                    case  DOWN_IN:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_IN");    } break;
                                                                                                    case  DOWN_OUT:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_OUT");   } break;
                                                                                                    default: break;
                                                                                                              //
                                                                                          };//
                                                                                }      break;
                                                                                case  DOWN_OUT:
                                                                                {         Print("MACDSolo-_M5-DOWN_OUT");
                                                                                          switch(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.eMACD_STATE[0])
                                                                                          {         case  UP_IN:
                                                                                                    {         Print("MACDSolo-_Current-UP_IN");      } break;
                                                                                                    case  UP_OUT:
                                                                                                    {         Print("MACDSolo-_Current-UP_OUT");     } break;
                                                                                                    case  DOWN_IN:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_IN");    } break;
                                                                                                    case  DOWN_OUT:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_OUT");   } break;
                                                                                                    default: break;
                                                                                                              //
                                                                                          };//
                                                                                }      break;
                                                                                default: break;
                                                                                          //
                                                                      };//
                                                            } break;
                                                            case  DOWN_IN:
                                                            {         Print("MACDSolo-_M30-DOWN_IN");
                                                                      switch(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M5.MACD_Cross_Signal.eMACD_STATE[0])
                                                                      {         case  UP_IN:
                                                                                {         Print("MACDSolo-_M5-UP_IN");
                                                                                          switch(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.eMACD_STATE[0])
                                                                                          {         case  UP_IN:
                                                                                                    {         Print("MACDSolo-_Current-UP_IN");      } break;
                                                                                                    case  UP_OUT:
                                                                                                    {         Print("MACDSolo-_Current-UP_OUT");     } break;
                                                                                                    case  DOWN_IN:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_IN");    } break;
                                                                                                    case  DOWN_OUT:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_OUT");   } break;
                                                                                                    default: break;
                                                                                                              //
                                                                                          }; //
                                                                                }      break;
                                                                                case  UP_OUT:
                                                                                {         Print("MACDSolo-_M5-UP_OUT");
                                                                                          switch(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.eMACD_STATE[0])
                                                                                          {         case  UP_IN:
                                                                                                    {         Print("MACDSolo-_Current-UP_IN");      } break;
                                                                                                    case  UP_OUT:
                                                                                                    {         Print("MACDSolo-_Current-UP_OUT");     } break;
                                                                                                    case  DOWN_IN:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_IN");    } break;
                                                                                                    case  DOWN_OUT:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_OUT");   } break;
                                                                                                    default: break;
                                                                                                              //
                                                                                          };//
                                                                                }      break;
                                                                                case  DOWN_IN:
                                                                                {         Print("MACDSolo-_M5-DOWN_IN");
                                                                                          switch(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.eMACD_STATE[0])
                                                                                          {         case  UP_IN:
                                                                                                    {         Print("MACDSolo-_Current-UP_IN");      } break;
                                                                                                    case  UP_OUT:
                                                                                                    {         Print("MACDSolo-_Current-UP_OUT");     } break;
                                                                                                    case  DOWN_IN:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_IN");    } break;
                                                                                                    case  DOWN_OUT:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_OUT");   } break;
                                                                                                    default: break;
                                                                                                              //
                                                                                          };//
                                                                                }      break;
                                                                                case  DOWN_OUT:
                                                                                {         Print("MACDSolo-_M5-DOWN_OUT");
                                                                                          switch(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.eMACD_STATE[0])
                                                                                          {         case  UP_IN:
                                                                                                    {         Print("MACDSolo-_Current-UP_IN");      } break;
                                                                                                    case  UP_OUT:
                                                                                                    {         Print("MACDSolo-_Current-UP_OUT");     } break;
                                                                                                    case  DOWN_IN:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_IN");    } break;
                                                                                                    case  DOWN_OUT:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_OUT");   } break;
                                                                                                    default: break;
                                                                                                              //
                                                                                          };//
                                                                                }      break;
                                                                                default: break;
                                                                                          //
                                                                      };//
                                                            } break;
                                                            case  DOWN_OUT:
                                                            {         Print("MACDSolo-_M30-DOWN_OUT");
                                                                      switch(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M5.MACD_Cross_Signal.eMACD_STATE[0])
                                                                      {         case  UP_IN:
                                                                                {         Print("MACDSolo-_M5-UP_IN");
                                                                                          switch(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.eMACD_STATE[0])
                                                                                          {         case  UP_IN:
                                                                                                    {         Print("MACDSolo-_Current-UP_IN");      } break;
                                                                                                    case  UP_OUT:
                                                                                                    {         Print("MACDSolo-_Current-UP_OUT");     } break;
                                                                                                    case  DOWN_IN:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_IN");    } break;
                                                                                                    case  DOWN_OUT:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_OUT");   } break;
                                                                                                    default: break;
                                                                                                              //
                                                                                          }; //
                                                                                }      break;
                                                                                case  UP_OUT:
                                                                                {         Print("MACDSolo-_M5-UP_OUT");
                                                                                          switch(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.eMACD_STATE[0])
                                                                                          {         case  UP_IN:
                                                                                                    {         Print("MACDSolo-_Current-UP_IN");      } break;
                                                                                                    case  UP_OUT:
                                                                                                    {         Print("MACDSolo-_Current-UP_OUT");     } break;
                                                                                                    case  DOWN_IN:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_IN");    } break;
                                                                                                    case  DOWN_OUT:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_OUT");   } break;
                                                                                                    default: break;
                                                                                                              //
                                                                                          };//
                                                                                }      break;
                                                                                case  DOWN_IN:
                                                                                {         Print("MACDSolo-_M5-DOWN_IN");
                                                                                          switch(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.eMACD_STATE[0])
                                                                                          {         case  UP_IN:
                                                                                                    {         Print("MACDSolo-_Current-UP_IN");      } break;
                                                                                                    case  UP_OUT:
                                                                                                    {         Print("MACDSolo-_Current-UP_OUT");     } break;
                                                                                                    case  DOWN_IN:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_IN");    } break;
                                                                                                    case  DOWN_OUT:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_OUT");   } break;
                                                                                                    default: break;
                                                                                                              //
                                                                                          };//
                                                                                }      break;
                                                                                case  DOWN_OUT:
                                                                                {         Print("MACDSolo-_M5-DOWN_OUT");
                                                                                          switch(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.eMACD_STATE[0])
                                                                                          {         case  UP_IN:
                                                                                                    {         Print("MACDSolo-_Current-UP_IN");      } break;
                                                                                                    case  UP_OUT:
                                                                                                    {         Print("MACDSolo-_Current-UP_OUT");     } break;
                                                                                                    case  DOWN_IN:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_IN");    } break;
                                                                                                    case  DOWN_OUT:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_OUT");   } break;
                                                                                                    default: break;
                                                                                                              //
                                                                                          };//
                                                                                }      break;
                                                                                default: break;
                                                                                          //
                                                                      };//
                                                            } break;
                                                            default: break;
                                                                      //
                                                  }; //
                                        } break;
                                        case  DOWN_OUT:
                                        {         Print("MACDSolo-_H1-DOWN_OUT");
                                                  switch(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M30.MACD_Cross_Signal.eMACD_STATE[0])
                                                  {         case  UP_IN:
                                                            {         Print("MACDSolo-_M30-UP_IN");
                                                                      switch(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M5.MACD_Cross_Signal.eMACD_STATE[0])
                                                                      {         case  UP_IN:
                                                                                {         Print("MACDSolo-_M5-UP_IN");
                                                                                          switch(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.eMACD_STATE[0])
                                                                                          {         case  UP_IN:
                                                                                                    {         Print("MACDSolo-_Current-UP_IN");      } break;
                                                                                                    case  UP_OUT:
                                                                                                    {         Print("MACDSolo-_Current-UP_OUT");     } break;
                                                                                                    case  DOWN_IN:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_IN");    } break;
                                                                                                    case  DOWN_OUT:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_OUT");   } break;
                                                                                                    default: break;
                                                                                                              //
                                                                                          }; //
                                                                                }      break;
                                                                                case  UP_OUT:
                                                                                {         Print("MACDSolo-_M5-UP_OUT");
                                                                                          switch(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.eMACD_STATE[0])
                                                                                          {         case  UP_IN:
                                                                                                    {         Print("MACDSolo-_Current-UP_IN");      } break;
                                                                                                    case  UP_OUT:
                                                                                                    {         Print("MACDSolo-_Current-UP_OUT");     } break;
                                                                                                    case  DOWN_IN:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_IN");    } break;
                                                                                                    case  DOWN_OUT:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_OUT");   } break;
                                                                                                    default: break;
                                                                                                              //
                                                                                          };//
                                                                                }      break;
                                                                                case  DOWN_IN:
                                                                                {         Print("MACDSolo-_M5-DOWN_IN");
                                                                                          switch(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.eMACD_STATE[0])
                                                                                          {         case  UP_IN:
                                                                                                    {         Print("MACDSolo-_Current-UP_IN");      } break;
                                                                                                    case  UP_OUT:
                                                                                                    {         Print("MACDSolo-_Current-UP_OUT");     } break;
                                                                                                    case  DOWN_IN:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_IN");    } break;
                                                                                                    case  DOWN_OUT:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_OUT");   } break;
                                                                                                    default: break;
                                                                                                              //
                                                                                          };//
                                                                                }      break;
                                                                                case  DOWN_OUT:
                                                                                {         Print("MACDSolo-_M5-DOWN_OUT");
                                                                                          switch(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.eMACD_STATE[0])
                                                                                          {         case  UP_IN:
                                                                                                    {         Print("MACDSolo-_Current-UP_IN");      } break;
                                                                                                    case  UP_OUT:
                                                                                                    {         Print("MACDSolo-_Current-UP_OUT");     } break;
                                                                                                    case  DOWN_IN:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_IN");    } break;
                                                                                                    case  DOWN_OUT:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_OUT");   } break;
                                                                                                    default: break;
                                                                                                              //
                                                                                          };//
                                                                                }      break;
                                                                                default: break;
                                                                                          //
                                                                      };//
                                                            } break;
                                                            case  UP_OUT:
                                                            {         Print("MACDSolo-_M30-UP_OUT");
                                                                      switch(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M5.MACD_Cross_Signal.eMACD_STATE[0])
                                                                      {         case  UP_IN:
                                                                                {         Print("MACDSolo-_M5-UP_IN");
                                                                                          switch(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.eMACD_STATE[0])
                                                                                          {         case  UP_IN:
                                                                                                    {         Print("MACDSolo-_Current-UP_IN");      } break;
                                                                                                    case  UP_OUT:
                                                                                                    {         Print("MACDSolo-_Current-UP_OUT");     } break;
                                                                                                    case  DOWN_IN:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_IN");    } break;
                                                                                                    case  DOWN_OUT:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_OUT");   } break;
                                                                                                    default: break;
                                                                                                              //
                                                                                          }; //
                                                                                }      break;
                                                                                case  UP_OUT:
                                                                                {         Print("MACDSolo-_M5-UP_OUT");
                                                                                          switch(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.eMACD_STATE[0])
                                                                                          {         case  UP_IN:
                                                                                                    {         Print("MACDSolo-_Current-UP_IN");      } break;
                                                                                                    case  UP_OUT:
                                                                                                    {         Print("MACDSolo-_Current-UP_OUT");     } break;
                                                                                                    case  DOWN_IN:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_IN");    } break;
                                                                                                    case  DOWN_OUT:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_OUT");   } break;
                                                                                                    default: break;
                                                                                                              //
                                                                                          };//
                                                                                }      break;
                                                                                case  DOWN_IN:
                                                                                {         Print("MACDSolo-_M5-DOWN_IN");
                                                                                          switch(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.eMACD_STATE[0])
                                                                                          {         case  UP_IN:
                                                                                                    {         Print("MACDSolo-_Current-UP_IN");      } break;
                                                                                                    case  UP_OUT:
                                                                                                    {         Print("MACDSolo-_Current-UP_OUT");     } break;
                                                                                                    case  DOWN_IN:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_IN");    } break;
                                                                                                    case  DOWN_OUT:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_OUT");   } break;
                                                                                                    default: break;
                                                                                                              //
                                                                                          };//
                                                                                }      break;
                                                                                case  DOWN_OUT:
                                                                                {         Print("MACDSolo-_M5-DOWN_OUT");
                                                                                          switch(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.eMACD_STATE[0])
                                                                                          {         case  UP_IN:
                                                                                                    {         Print("MACDSolo-_Current-UP_IN");      } break;
                                                                                                    case  UP_OUT:
                                                                                                    {         Print("MACDSolo-_Current-UP_OUT");     } break;
                                                                                                    case  DOWN_IN:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_IN");    } break;
                                                                                                    case  DOWN_OUT:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_OUT");   } break;
                                                                                                    default: break;
                                                                                                              //
                                                                                          };//
                                                                                }      break;
                                                                                default: break;
                                                                                          //
                                                                      };//
                                                            } break;
                                                            case  DOWN_IN:
                                                            {         Print("MACDSolo-_M30-DOWN_IN");
                                                                      switch(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M5.MACD_Cross_Signal.eMACD_STATE[0])
                                                                      {         case  UP_IN:
                                                                                {         Print("MACDSolo-_M5-UP_IN");
                                                                                          switch(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.eMACD_STATE[0])
                                                                                          {         case  UP_IN:
                                                                                                    {         Print("MACDSolo-_Current-UP_IN");      } break;
                                                                                                    case  UP_OUT:
                                                                                                    {         Print("MACDSolo-_Current-UP_OUT");     } break;
                                                                                                    case  DOWN_IN:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_IN");    } break;
                                                                                                    case  DOWN_OUT:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_OUT");   } break;
                                                                                                    default: break;
                                                                                                              //
                                                                                          }; //
                                                                                }      break;
                                                                                case  UP_OUT:
                                                                                {         Print("MACDSolo-_M5-UP_OUT");
                                                                                          switch(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.eMACD_STATE[0])
                                                                                          {         case  UP_IN:
                                                                                                    {         Print("MACDSolo-_Current-UP_IN");      } break;
                                                                                                    case  UP_OUT:
                                                                                                    {         Print("MACDSolo-_Current-UP_OUT");     } break;
                                                                                                    case  DOWN_IN:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_IN");    } break;
                                                                                                    case  DOWN_OUT:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_OUT");   } break;
                                                                                                    default: break;
                                                                                                              //
                                                                                          };//
                                                                                }      break;
                                                                                case  DOWN_IN:
                                                                                {         Print("MACDSolo-_M5-DOWN_IN");
                                                                                          switch(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.eMACD_STATE[0])
                                                                                          {         case  UP_IN:
                                                                                                    {         Print("MACDSolo-_Current-UP_IN");      } break;
                                                                                                    case  UP_OUT:
                                                                                                    {         Print("MACDSolo-_Current-UP_OUT");     } break;
                                                                                                    case  DOWN_IN:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_IN");    } break;
                                                                                                    case  DOWN_OUT:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_OUT");   } break;
                                                                                                    default: break;
                                                                                                              //
                                                                                          };//
                                                                                }      break;
                                                                                case  DOWN_OUT:
                                                                                {         Print("MACDSolo-_M5-DOWN_OUT");
                                                                                          switch(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.eMACD_STATE[0])
                                                                                          {         case  UP_IN:
                                                                                                    {         Print("MACDSolo-_Current-UP_IN");      } break;
                                                                                                    case  UP_OUT:
                                                                                                    {         Print("MACDSolo-_Current-UP_OUT");     } break;
                                                                                                    case  DOWN_IN:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_IN");    } break;
                                                                                                    case  DOWN_OUT:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_OUT");   } break;
                                                                                                    default: break;
                                                                                                              //
                                                                                          };//
                                                                                }      break;
                                                                                default: break;
                                                                                          //
                                                                      };//
                                                            } break;
                                                            case  DOWN_OUT:
                                                            {         Print("MACDSolo-_M30-DOWN_OUT");
                                                                      switch(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M5.MACD_Cross_Signal.eMACD_STATE[0])
                                                                      {         case  UP_IN:
                                                                                {         Print("MACDSolo-_M5-UP_IN");
                                                                                          switch(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.eMACD_STATE[0])
                                                                                          {         case  UP_IN:
                                                                                                    {         Print("MACDSolo-_Current-UP_IN");      } break;
                                                                                                    case  UP_OUT:
                                                                                                    {         Print("MACDSolo-_Current-UP_OUT");     } break;
                                                                                                    case  DOWN_IN:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_IN");    } break;
                                                                                                    case  DOWN_OUT:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_OUT");   } break;
                                                                                                    default: break;
                                                                                                              //
                                                                                          }; //
                                                                                }      break;
                                                                                case  UP_OUT:
                                                                                {         Print("MACDSolo-_M5-UP_OUT");
                                                                                          switch(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.eMACD_STATE[0])
                                                                                          {         case  UP_IN:
                                                                                                    {         Print("MACDSolo-_Current-UP_IN");      } break;
                                                                                                    case  UP_OUT:
                                                                                                    {         Print("MACDSolo-_Current-UP_OUT");     } break;
                                                                                                    case  DOWN_IN:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_IN");    } break;
                                                                                                    case  DOWN_OUT:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_OUT");   } break;
                                                                                                    default: break;
                                                                                                              //
                                                                                          };//
                                                                                }      break;
                                                                                case  DOWN_IN:
                                                                                {         Print("MACDSolo-_M5-DOWN_IN");
                                                                                          switch(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.eMACD_STATE[0])
                                                                                          {         case  UP_IN:
                                                                                                    {         Print("MACDSolo-_Current-UP_IN");      } break;
                                                                                                    case  UP_OUT:
                                                                                                    {         Print("MACDSolo-_Current-UP_OUT");     } break;
                                                                                                    case  DOWN_IN:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_IN");    } break;
                                                                                                    case  DOWN_OUT:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_OUT");   } break;
                                                                                                    default: break;
                                                                                                              //
                                                                                          };//
                                                                                }      break;
                                                                                case  DOWN_OUT:
                                                                                {         Print("MACDSolo-_M5-DOWN_OUT");
                                                                                          switch(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.eMACD_STATE[0])
                                                                                          {         case  UP_IN:
                                                                                                    {         Print("MACDSolo-_Current-UP_IN");      } break;
                                                                                                    case  UP_OUT:
                                                                                                    {         Print("MACDSolo-_Current-UP_OUT");     } break;
                                                                                                    case  DOWN_IN:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_IN");    } break;
                                                                                                    case  DOWN_OUT:
                                                                                                    {         Print("MACDSolo-_Current-DOWN_OUT");   } break;
                                                                                                    default: break;
                                                                                                              //
                                                                                          };//
                                                                                }      break;
                                                                                default: break;
                                                                                          //
                                                                      };//
                                                            } break;
                                                            default: break;
                                                                      //
                                                  }; //
                                        } break;
                                        default: break;
                                                  //
                              }; //
//------------------------------------------------------------------------
*/
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
