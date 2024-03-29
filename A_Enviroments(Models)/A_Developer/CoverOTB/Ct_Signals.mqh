//+------------------------------------------------------------------+
//||   ||||||||||       St_CondicatorData_Indicators_MA.mqh         ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOA\St_CD_TradeLogic.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOA\St_CD_Extern_Signals.mqh>
//----------------------------------------------------
/*
The Breakeven Win Rate is calculated through the Risk to Reward Ratio, which measures how much your potential reward is, for every unit risk you take.
The Risk is the distance from the entry price to the stop loss and represents the risk you are willing to take on this trade, or in other words, the amount you are comfortable with losing. It can be expressed in pips (if you trade forex) or cents (if you trade shares or cryptocurrencies). The Reward is the distance from the entry price to the profit target. It is the potential profit that you expect from the position.
A 1:2 RR Ratio means that for every one currency unit risked, you expect to win two units. The same ratio can be expressed in different way.
2:4, 10:20, 120:240 – all of these are one and the same ratio.
Another way to use the calculator is to fill in the stop-loss and take-profit amounts. Just input them directly. For example, if your position holds $100 risk and $250 potential profit, the calculator will compute the Breakeven Win Rate, using these two amounts.
*/
//---------------------------------------------
struct SD_Decition_Tree_SignalEstimateOut
{

          E_OFFER_Type   Enum_Offer_Type;
          string         Desc_Offer_NameNode;
          string         Desc_Offer_InfoNode;
          string         Desc_Offer_InfoNode2;
          string         Desc_Offer_SuperNameNode;//
};
struct SD_Decition_Array_SignalEstimateOut
{         //----Signal_Estimate_Curr
          E_Signals_Type        Enum;  //---Decition_All_SignalEstimateOut.Enum_Out_Sence-------vtrade!!

          string                Desc_Offer;
          E_OFFER_Type          Enum_BlockOffer;
          string                Desc_SAW;
          int                   Enum__LINE__;
          string                Enum__Desc__;
          int                   Enum__Power__;      //---optimising price conditional points
          int                   Enum__Power__Point; //---optimising Price all point

          string                Desc_ProfitedAll;
          float                 Val_ProfitedAll;

          string                Desc_ProfitedElement;

          string                Desc_ProfitAllBlocksNow;

};
struct SD_Decition_All_SignalEstimateOut
{         //----Signal_Exit_Curr
          string                Desc_Exit_Curr_Out;
          bool                  Is_Exit_Sell;
          bool                  Is_Exit_Buy;
          //----Signal_Enter_Curr
          E_Signals_Type        Enum;///____________OUTED SIGNAL___________
          string                Desc;//

};
struct St_Signals_Indicators
{         E_Signals_Type        Expansion; };
struct St_Signals_ChartAnalises
{         Sg_Point_             Point_Resstance, Point_Suport; //--ElliotWave_3_Current_Middle_Point_Resstance
          Sg_Point_             Point_Resstance_W5_Bar0, Point_Suport__W5_Bar0; };
struct St_Signals_Flags
{         St_FLAGs              Information_FLAGs;//---state
          string                Enum_Signal_Desc1, Enum_Signal_Desc0,  Enum_Signal_Desc,  Enum_Signal_DescFinals; };
//+------------------------------------------------------------------+
//|                                                                  |ct_Drive.TDD.ct_Conductor.TI_Curr
//+------------------------------------------------------------------+
struct  St_TI_Curr //---DNA_Genetic//---Optimum Decition Class
{         /*
                for handeling signals and cmd type
          */
          St_TI_Curr()  {  ScalpAmount_All_Trader = 2; ScalpAmount_MACD_Trader = 2; ScalpAmount_TreeSence_Trader = 2; ScalpAmount_ArraySence_Trader = 2;}
          ~St_TI_Curr() { }
          void  Update()
          {         if(Is_Active_All_TraderScalpAmount)
                    {         ScalpAmount_MACD_Trader = ScalpAmount_TreeSence_Trader = ScalpAmount_ArraySence_Trader = ScalpAmount_All_Trader; //
                    }//
                    else if(!IsReset) //defaults
                    {         ScalpAmount_All_Trader            = 2;
                              ScalpAmount_MACD_Trader           = 2;
                              ScalpAmount_TreeSence_Trader      = 2;
                              ScalpAmount_ArraySence_Trader     = 2; //
                    } //
          }
          bool                  IsReset;
          //----------------------------------------
          bool                  Is_Active_All_TraderScalpAmount;
          double                ScalpAmount_All_Trader;
          //----------------------------------------
          bool                  Is_Active_ArraySence_Trader;
          bool                  Is_Pressed_ArraySence_Trader;
          double                ScalpAmount_ArraySence_Trader;
          //----------------------------------------
          bool                  Is_Active_TreeSence_Trader;
          bool                  Is_Pressed_TreeSence_Trader;
          double                ScalpAmount_TreeSence_Trader;
          //----------------------------------------
          bool                  Is_Active_MACD_Trader;
          bool                  Is_Pressed_MACD_Trader;
          uchar                 Active_MACD_Traer_Mode_Buy1_Sell2_Void3;
          double                ScalpAmount_MACD_Trader;
          //----------------------------------------
          bool                  Is_Active_MACDSolo_Trader;
          bool                  Is_Pressed_MACDSolo_Trader;
          uchar                 Active_MACDSolo_Traer_Mode_Buy1_Sell2_Void3;
          //----------------------------------------
          bool                  Is_Active_NNSence_Trader;
          bool                  Is_Pressed_NNSence_Trader;
          uchar                 Active_NNSence_Traer_Mode_Buy1_Sell2_Void3;
          //----------------------------------------
          bool                  Is_Active_FE_Trader;
          bool                  Is_Pressed_FE_Trader;
          uchar                 Active_FE_Traer_Mode_Buy1_Sell2_Void3;
          //----------------------------------------

          //
          string                MethodTechTradeComment, MethodTechTradeCommentSell, MethodTechTradeCommentBuy;
          //
          int                   CMD; //--- enum is off
          bool                  Is_Good_To_Buy;//  = false;
          bool                  Is_Good_To_Sell;// = false
          string                Trade_Status_Word; //---"[IsMC][+B][LT][UW][CBM-ULL]"
          //----------------------------------------------------------------
          double                Efficiently_Percent;  //-- posetive buy  -- negative sell 0-100
          double                Efficiently_Percent_Sell;
          double                Efficiently_Percent_Buy;
          //----------------------------------------------------------------
          bool Is_Buy_Bulish_Expanding;
          bool Is_Buy_Bulish_Nearing;
          bool Is_Sell_Bulish_Expanding;
          bool Is_Sell_Bearish_Expanding;
          //----------------------------------------------------------------
          St_Signals_Indicators         Signals_Indicators;
          St_Signals_ChartAnalises      Signals_ChartAnalises;
          St_Signals_Flags              Signals_Flags;
          //--------------------------------------------------------------------------------------------------
          SD_Decition_Array_SignalEstimateOut   Decition_Array_SignalEstimateOut;
          SD_Decition_Tree_SignalEstimateOut    Decition_Tree_SignalEstimateOut;
          SD_Decition_All_SignalEstimateOut     Decition_All_SignalEstimateOut;
          //---------------------------------------------------------------------------------------------------
          //---------------------------------------------------------------------------------------------------
          int                   Switch_Signal;
          string                Desc_Prencip;
          //---------------------------------------------------------------------------------------------------
          string                WinRate_Desc; //
          double                WinRate; //
          double                Power;
          //--------------------------------------
          string                Comment_Desc;
          bool                  Is_DoComment;
          //-------------------------------------- improvment system
          double                ScoreAll;  ///0.0 - 1.0 range
          double                ScoreSell, ScoreBuy;
          //--------------------------------------
          double                Money_Profited;  //--- ct_Drive.TDD.ct_Conductor.TI_Curr.Money_Profited
          double                Money_Lossed;     //--- ct_Drive.TDD.ct_Conductor.TI_Curr.Money_Lossed
          bool                  IsBasic_Profited_Vs_Lossed;
          //--------------------------------------
          //--------------------------------------

};
////+------------------------------------------------------------------+
////|     Module ~~ Trade MARKET Information ~~ Positions Manager      |0 errors, 1 warnings, 367~383~402 msec elapsed            1         2
////+------------------------------------------------------------------+
class Ct_Signals
{
public:
          Ct_Signals(void) {};
          ~Ct_Signals(void) {};
          bool Is_Extern_TradeLogic_data;
          bool Is_Extern_Signals_data;
          //-------------------------
          St_CondicatorData_Trade_Logic         TradeLogic;
          St_CondicatorData_Extern_Signals      Extern_Signals;

          St_TI_Curr                            DATAS;
          St_TIC_Condition                      TICC;
          //----------
          bool UPDATED;
          void Update()
          {         UPDATED = false;
                    DATAS.Update();
                    //---[Collect in TradeLogic]-------------------------------------------------------------------------------------------------------------------------------------
                    Is_Extern_TradeLogic_data   =  TradeLogic.Update();       //***--Passage-One of Conditon Determine   extern based Each Concept data   Collected Condition
                    //
                    //---[Define Last Act to Trade]----------------------------------------------------------------------------------------------------------------------------------Print("Detect_NewBar._M1.CBT__QuartMinute.Is_NewBar:", Detect_NewBar._M1.CBT__QuartMinute.Is_NewBar);
                    if(Detect_NewBar._M1.CBT__Seccound.Is_NewBar && Timer.IsUpdateCount)
                    {         TICC.Final_TREE_SELL_Condition_Signal =  false;
                              TICC.Final_TREE_BUY_Condition_Signal  =  false;
                              Is_Extern_Signals_data                =  Extern_Signals.Update(); //
                    }
                    //***--Passage-Two of Conditon Determine   extern based Trade Logic data    Extract Signal Trade
                    //---[Define Last Act to TradeSignal Out]------------------------------------------------------------------------------------------------------------------------
                    Optimum_DECISION_ES( __LINE__, Extern_Signals.Data.FLAGs, "[Final Decition]", 0, E_Points_Power_ON); //---FLAGS GOAL VOID//---FLAGS GOAL SEL//---FLAGS GOAL BUY
                    //---------------------------------------------------------------------------------------------------------------------------------------------------------------
                    UPDATED = Is_Extern_TradeLogic_data && Is_Extern_Signals_data;
                    UPDATED = true; //
                    //---force to update signals and trees by secound
          } //

          //===============================================================
          void Optimum_DECISION_ES( int line, St_FLAGs &FLAGsensor, string desc, int power,  E_Points_Power Points_Power, bool Is_CHK_PWR = true);  //---state or flags E_Signals_Type etype,

          bool Method_Five_X(int type, string DescType);
          void methods_Axium();

          void GetWinRate()
          {         DATAS.WinRate = DATAS.Power / 1; //--33 is maximum
                    DATAS.WinRate = NormalizeDouble(DATAS.WinRate, 3); //
          } //

          //-------------------------------------------------
          bool                  TERMINAL_TEST(St_FLAGs &FLAGs) { return false;}
          int                   MAX_VALUE( St_FLAGs &FLAGs) {int v = 10;  if(TERMINAL_TEST(FLAGs))return UTILITIY(FLAGs); /* v = MAX(v, MIN_VALUE(FLAGs)); return v;*/ return 0;}
          int                   MIN_VALUE( St_FLAGs &FLAGs) {int v = -10; if(TERMINAL_TEST(FLAGs))return UTILITIY(FLAGs); /* v = MIN(v, MAX_VALUE(FLAGs)); return v;*/ return 0;}
          int                   UTILITIY(St_FLAGs &FLAGs) {return 10;}
          //--------------------------------------
          bool Set_Fast_IMA_Buy()
          {         return(//ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_._8_._iMa_[0]._Value > ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_._20_._iMa_[0]._Value//--slow
                                    //&&
                                    ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_._3_._iMa_[0]._Value > ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_._8_._iMa_[0]._Value//---fast
                          );//
          }
          bool Set_Fast_IMA_Sell()
          {         return(//ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_._8_._iMa_[0]._Value < ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_._80_._iMa_[0]._Value//--slow
                                    //&&
                                    ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_._3_._iMa_[0]._Value < ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_._8_._iMa_[0]._Value   //---fast
                          ); //
          }

          //---------------------------------------------------------------
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Ct_Signals::Optimum_DECISION_ES( int line, St_FLAGs &FLAGsensor, string desc, int power,  E_Points_Power Points_Power, bool Is_CHK_PWR = true  )  //---state or flags E_Signals_Type etype,
{         /*
              Search UnInformed       DLS-LDS-IDS-BDS-UCS --not inteligenced
              Search Informed         Best_Frist - A* - Hill Climbing - Bether Hill Climbing - Tabu
              Search SuperInformed    GA - genetic algoritms.
              -----
              Beas of low info
              Variance of Max Information
              Bst is Meaddel one to know,,,
              -----
          */
          //-------------------------------------
          int utility_Value = MAX_VALUE(FLAGsensor);  //-- Alert("utility_Value:", utility_Value, "  the max:", MIN3(33, 5, 3));
          //-------------------------------------
          DATAS.Signals_Flags.Information_FLAGs   = FLAGsensor;
          DATAS.Signals_Flags.Enum_Signal_DescFinals = "";
          //Enum_Signal__Power__ += power;
          DATAS.Decition_Array_SignalEstimateOut.Enum__Desc__   = desc;
          DATAS.Decition_Array_SignalEstimateOut.Enum__LINE__   = line;
          TICC.IsWhoFinal_Condition_Signal.IsSELL = false;
          TICC.IsWhoFinal_Condition_Signal.IsBUY  = false;
          //--Enum_Signal           = etype;
          //---support price  --- ressistance price
          {         //---  Point_Suport.Price
                    //
                    DATAS.Is_Good_To_Buy  = false;
                    DATAS.Is_Good_To_Sell = false;
                    DATAS.Is_Good_To_Buy  = (DATAS.Signals_ChartAnalises.Point_Resstance_W5_Bar0._Price + (DATAS.Signals_ChartAnalises.Point_Resstance_W5_Bar0._Price - DATAS.Signals_ChartAnalises.Point_Suport__W5_Bar0._Price) / 3) < Ask ; ///
                    DATAS.Is_Good_To_Sell = (DATAS.Signals_ChartAnalises.Point_Suport__W5_Bar0._Price   - (DATAS.Signals_ChartAnalises.Point_Resstance_W5_Bar0._Price - DATAS.Signals_ChartAnalises.Point_Suport__W5_Bar0._Price) / 3) > Ask; ////
                    // Alert( " Point_Resstance_W5_Bar0._Price ", Point_Resstance_W5_Bar0._Price);
                    // Alert( " Point_Suport__W5_Bar0._Price ", Point_Suport__W5_Bar0._Price);//
          }
          {         if(FLAGsensor.Indicators_WPR.Complex.flag_2_Is_Complex__WPR_Buy_Support)
                    {         //
                    }
                    else
                    {         //
                    }//
          }//
          //----------------------------------------
          switch(Points_Power)
          {         case E_Points_Power_ON: {} break;//
          }
          //--------------------------------------------------------------------------------------------------------------------------------------------------------------
          if(Points_Power == E_Points_Power_ON )              {     DATAS.Decition_Array_SignalEstimateOut.Enum__Power__Point += power; }
          else if(Points_Power == E_Points_Power_OFF)         {}
          else if(Points_Power == E_Points_Power_VOID)        {     DATAS.Decition_Array_SignalEstimateOut.Enum__Power__      += power;};
          //--------------------------------------------------------------------------------------------------------------------------------------------------------------
          TICC.Final_BUY_Power__Point                 = DATAS.Decition_Array_SignalEstimateOut.Enum__Power__Point > 0;
          TICC.Final_SELL_Power__Point                = DATAS.Decition_Array_SignalEstimateOut.Enum__Power__Point < 0;
          TICC.Final_VOID_Power__Point                = DATAS.Decition_Array_SignalEstimateOut.Enum__Power__Point == 0;
          TICC.Final_BUY_Power                        = DATAS.Decition_Array_SignalEstimateOut.Enum__Power__ > 0;
          TICC.Final_SELL_Power                       = DATAS.Decition_Array_SignalEstimateOut.Enum__Power__ < 0;
          TICC.Final_VOID_Power                       = DATAS.Decition_Array_SignalEstimateOut.Enum__Power__ == 0;
          //--------------------------------------------------------------------------------------------------------------------------------------------------------------
          //FLAGs.CandleBars_Movment.Basic.flag_8_E_Bar_TL_Movment_0_5_10_15 == E_Movment_ULL_ULL;
          //FLAGs.CandleBars_Movment.Basic.flag_8_E_Bar_TL_Movment_0_5_10_15 == E_Movment_ULL_DLL;
          //FLAGs.CandleBars_Movment.Basic.flag_8_E_Bar_TL_Movment_0_5_10_15 == E_Movment_ULL_UU;
          //FLAGs.CandleBars_Movment.Basic.flag_8_E_Bar_TL_Movment_0_5_10_15 == E_Movment_ULL_DU;
          ////
          //FLAGs.CandleBars_Movment.Basic.flag_8_E_Bar_TL_Movment_0_5_10_15 == E_Movment_DLL_ULL;
          //FLAGs.CandleBars_Movment.Basic.flag_8_E_Bar_TL_Movment_0_5_10_15 == E_Movment_DLL_DLL;
          //FLAGs.CandleBars_Movment.Basic.flag_8_E_Bar_TL_Movment_0_5_10_15 == E_Movment_DLL_UU;
          //FLAGs.CandleBars_Movment.Basic.flag_8_E_Bar_TL_Movment_0_5_10_15 == E_Movment_DLL_DU;
          ////
          //FLAGs.CandleBars_Movment.Basic.flag_8_E_Bar_TL_Movment_0_5_10_15 == E_Movment_UU_ULL;
          //FLAGs.CandleBars_Movment.Basic.flag_8_E_Bar_TL_Movment_0_5_10_15 == E_Movment_UU_ULL;
          //FLAGs.CandleBars_Movment.Basic.flag_8_E_Bar_TL_Movment_0_5_10_15 == E_Movment_UU_UU;
          //FLAGs.CandleBars_Movment.Basic.flag_8_E_Bar_TL_Movment_0_5_10_15 == E_Movment_UU_DU;
          ////
          //FLAGs.CandleBars_Movment.Basic.flag_8_E_Bar_TL_Movment_0_5_10_15 == E_Movment_DU_ULL;
          //FLAGs.CandleBars_Movment.Basic.flag_8_E_Bar_TL_Movment_0_5_10_15 == E_Movment_DU_ULL;
          //FLAGs.CandleBars_Movment.Basic.flag_8_E_Bar_TL_Movment_0_5_10_15 == E_Movment_DU_UU;
          //FLAGs.CandleBars_Movment.Basic.flag_8_E_Bar_TL_Movment_0_5_10_15 == E_Movment_DU_DU;
          //
          TICC.Final_BUY_Condition_CandleBars         = FLAGsensor.CandleBars_Movment.Basic.flag_8_E_Bar_TL_Movment_0_5_10_15 == E_Movment_UU_UU; //FLAGs.CandleBars_Movment.Basic.flag_4_E_Bar_TL_Movment == E_Movment_ULL; //--- E_Movment_Void,E_Movment_BUp_U,E_Movment_BDown_U,E_Movment_ULL,E_Movment_DLL,
          TICC.Final_Sell_Condition_CandleBars        = FLAGsensor.CandleBars_Movment.Basic.flag_8_E_Bar_TL_Movment_0_5_10_15 == E_Movment_DU_DU; //FLAGs.CandleBars_Movment.Basic.flag_4_E_Bar_TL_Movment == E_Movment_DLL; //--- Alert("flag_4_E_Bar_TL_Movment: ",EnumToString(FLAGs.CandleBars_Movment.Basic.flag_4_E_Bar_TL_Movment));
          TICC.Final_VOID_Condition_CandleBars        = !TICC.Final_BUY_Condition_CandleBars    && !TICC.Final_Sell_Condition_CandleBars; //
          //--------------------------------------------------------------------------------------------------------------------------------------------------------------
          TICC.Final_BUY_Condition_ChartAnalise       = false; //
          TICC.Final_Sell_Condition_ChartAnalise      = false; //
          TICC.Final_VOID_Condition_ChartAnalise      = !TICC.Final_BUY_Condition_ChartAnalise  && !TICC.Final_Sell_Condition_ChartAnalise; //
          //--------------------------------------------------------------------------------------------------------------------------------------------------------------
          TICC.Final_BUY_Condition_Indicators_MACD    =  FLAGsensor.Indicators_MACD.Basic.flag_2_Is_Basic_CrossDown_Signal_;    //--Alert("CrossUp_Signal: ",FLAGs.Indicators_MACD.Basic.flag_2_Is_Basic_CrossUp_Signal_);
          TICC.Final_Sell_Condition_Indicators_MACD   =  FLAGsensor.Indicators_MACD.Basic.flag_2_Is_Basic_CrossUp_Signal_ ;     //--Alert("CrossDown_Signal_: ",FLAGs.Indicators_MACD.Basic.flag_2_Is_Basic_CrossDown_Signal_);
          TICC.Final_VOID_Condition_Indicators_MACD   = !TICC.Final_BUY_Condition_Indicators_MACD && !TICC.Final_Sell_Condition_Indicators_MACD;
          //----
          TICC.Final_BUY_Condition_Indicators_WPR     =  FLAGsensor.Indicators_WPR.Complex.flag_2_Is_Complex__WPR_Buy_Support;
          TICC.Final_Sell_Condition_Indicators_WPR    =  FLAGsensor.Indicators_WPR.Complex.flag_2_Is_Complex__WPR_Sell_Support;
          TICC.Final_VOID_Condition_Indicators_WPR    = !TICC.Final_BUY_Condition_Indicators_WPR  && !TICC.Final_Sell_Condition_Indicators_WPR;
          //----
          TICC.Final_BUY_Condition_Indicators_iMA     =  FLAGsensor.Indicators_iMA.Complex.flag_2_Is_Complex_EMA_Close_Bulish && !FLAGsensor.Indicators_iMA.Basic.flag_2_Is_Basic_5_Above_3 && FLAGsensor.Indicators_iMA.Super.flag_2_IsSuper_ON_Buy__OFF_Sell_500_300;
          TICC.Final_Sell_Condition_Indicators_iMA    = !FLAGsensor.Indicators_iMA.Complex.flag_2_Is_Complex_EMA_Close_Bulish &&  FLAGsensor.Indicators_iMA.Basic.flag_2_Is_Basic_5_Above_3 && !FLAGsensor.Indicators_iMA.Super.flag_2_IsSuper_ON_Buy__OFF_Sell_500_300;
          TICC.Final_VOID_Condition_Indicators_iMA    = !TICC.Final_BUY_Condition_Indicators_iMA  && !TICC.Final_Sell_Condition_Indicators_iMA;
          //---------------------------------------------
          TICC.Final_BUY_Condition_Indicators         =  TICC.Final_BUY_Condition_Indicators_WPR  || TICC.Final_BUY_Condition_Indicators_iMA  || TICC.Final_BUY_Condition_Indicators_MACD;
          TICC.Final_Sell_Condition_Indicators        =  TICC.Final_Sell_Condition_Indicators_WPR || TICC.Final_Sell_Condition_Indicators_iMA || TICC.Final_Sell_Condition_Indicators_MACD;
          TICC.Final_VOID_Condition_Indicators        = !TICC.Final_BUY_Condition_Indicators      && !TICC.Final_Sell_Condition_Indicators;
          //-------------------------------------------------------------------------------------------------------------------------------------------------------------- throw all
          //TICC.IsWhoFinal_Condition_Signal.IsBUY                    = TICC.Final_BUY_Power  && TICC.Final_BUY_Power__Point  && (TICC.Final_BUY_Condition_Indicators  || TICC.Final_BUY_Condition_ChartAnalise  || TICC.Final_BUY_Condition_CandleBars) ;;
          //TICC.IsWhoFinal_Condition_Signal.IsSELL                   = TICC.Final_SELL_Power && TICC.Final_SELL_Power__Point && (TICC.Final_Sell_Condition_Indicators || TICC.Final_Sell_Condition_ChartAnalise || TICC.Final_Sell_Condition_CandleBars) ;;
          //TICC.IsWhoFinal_Condition_Signal.IsVOID                   = TICC.Final_VOID_Power || TICC.Final_VOID_Power__Point || TICC.Final_VOID_Condition_Indicators || TICC.Final_VOID_Condition_ChartAnalise || TICC.Final_VOID_Condition_CandleBars ;   //---EVEN ANY TRUE
          //+------------------------------------------------------------------------------------------------------------------------------------+
          methods_Axium();
          //----[only ima by  E_Market_Bulish_Expanding //---googd performance model//---+8$  //---throw two factor macro and micro]--------------
          if(true)//--[on testing] [estedlal][Trending Down or Up]
          {         //================================================================================
                    /*resets*/
                    //================================================================================
                    static bool TurnSwitch = false;
                    TurnSwitch = TurnSwitch ? false : true;
                    if(TurnSwitch)
                    {         //--Axium buy
                              TICC.IsWhoFinal_Condition_Signal.IsBUY                    =  Method_Five_X(1, "BUY") ; //------------------------------------------------important
                              //Print("Buy Cheaking: ", TICC.IsWhoFinal_Condition_Signal.IsBUY, "    ", __FUNCSIG__); //
                    }
                    else
                    {         //--Axium sell
                              TICC.IsWhoFinal_Condition_Signal.IsSELL                   =  Method_Five_X(2, "SELL") ; //------------------------------------------------
                              //Print("Sell Cheaking: ", TICC.IsWhoFinal_Condition_Signal.IsSELL, "    ", __FUNCSIG__); //
                    }
                    /************************/
                    /*out puter final signal*/
                    /************************/
                    if(TICC.IsWhoFinal_Condition_Signal.IsBUY)               { DATAS.MethodTechTradeComment = DATAS.MethodTechTradeCommentBuy ; ct_Drive.TDD.ct_Signals.DATAS.Decition_All_SignalEstimateOut.Enum = ES_BUY;}
                    else if(TICC.IsWhoFinal_Condition_Signal.IsSELL)         { DATAS.MethodTechTradeComment = DATAS.MethodTechTradeCommentSell; ct_Drive.TDD.ct_Signals.DATAS.Decition_All_SignalEstimateOut.Enum = ES_SELL;}
                    else
                    {         DATAS.MethodTechTradeComment = ""; /*resets*/
                              DATAS.MethodTechTradeCommentBuy   = "_5XB_";
                              DATAS.MethodTechTradeCommentSell  = "_5XS_"; //
                              ct_Drive.TDD.ct_Signals.DATAS.Decition_All_SignalEstimateOut.Enum = ES_VOID;//
                    }
                    //]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]
          }
          /*----------------------------------------------*/
          //--- [ Extracting Place ]
          //--desition over Point of elements in channel    //--desition over Point of elements in channel by ested condition and flag wpr
          /*----------------------------------------------*/
          //--------------------------------------------------------------------------------------------------------------------------------------------------------------
          return; //
};

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Ct_Signals::Method_Five_X(int type, string DescType)
{         //***************************************************************************************************
          //***************************************************************************************************
          //---!!! static bool Turn[2] = {true, false }; /// 0 for buy ///1 for sell
          //reset
          /*just one call run then o problem in reset all*/
          DATAS.Decition_All_SignalEstimateOut.Desc = DescType + " Not Detected";
          DATAS.Decition_All_SignalEstimateOut.Enum = ES_VOID;
          DATAS.Is_Buy_Bulish_Expanding     = false; //
          DATAS.MethodTechTradeCommentBuy   = "";
          DATAS.Is_Sell_Bearish_Expanding   = false; //
          DATAS.MethodTechTradeCommentSell  = "";
          //***************************************************************************************************
          if(!ct_Drive.TDD.ct_Ticket._Active.Is_Ticket())
          {         DATAS.Is_Active_TreeSence_Trader                                              = false; //
                    DATAS.Is_Active_MACD_Trader                                                   = false; //
                    DATAS.Is_Active_MACDSolo_Trader                                               = false; //
                    ct_Drive.TDD.ct_Signals.Extern_Signals.MTSA.IsActive_MapTradeSence_Offer      = false; //
                    DATAS.Is_Active_NNSence_Trader                                                = false; //
                    DATAS.Is_Active_FE_Trader                                                     = false; //
          }
          //***************************************************************************************************
          //--Alert(EnumToString(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.MACD_Cross_Signal[0]));
          {         //buy //-------------------------------- -EnumToString(ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_._500_.State_To_Pick_500p));   (a && b) || ( false ) && (a && b)
                    if(type == 1)//buy
                    {         //---!!! if(Turn[0]) {Turn[0] = false; return false;}
                              //--EVERY VARIABLE MUST RESET IN OWN SECTOR ..OTHER CALL NOT CHANGE STATE
                              DATAS.Is_Buy_Bulish_Expanding = false; //
                              DATAS.MethodTechTradeCommentBuy = "";
                              //***************************************************************************************************
                              /*last step 'TreeSence' when for Scalping*/
                              if(!DATAS.Is_Buy_Bulish_Expanding && TICC.Final_TREE_BUY_Condition_Signal && DATAS.Is_Pressed_TreeSence_Trader && !DATAS.Is_Active_TreeSence_Trader && ct_Drive.TDD.ct_Signals.Extern_Signals.IsAllowTree)
                              {         DATAS.Decition_All_SignalEstimateOut.Desc       = DescType + " ";
                                        DATAS.Is_Buy_Bulish_Expanding                   = true;  //----active buying system
                                        DATAS.MethodTechTradeCommentBuy                += "(0Tree-B)"; //
                                        DATAS.Is_Active_TreeSence_Trader                = true; //
                                        //Print("last step when for Scalpin is done for buy",__FUNCTION__);//
                                        StringAdder(" (0Tree-B) ", DATAS.Decition_All_SignalEstimateOut.Desc); //
                                        return DATAS.Is_Buy_Bulish_Expanding;//
                              } //
                              //***************************************************************************************************
                              /*last step 'MACDComplex' when for Scalping*/
                              if(!DATAS.Is_Buy_Bulish_Expanding && TICC.Final_MACD_Trade_Condition_Signal.IsStartBuy   && DATAS.Is_Pressed_MACD_Trader && !DATAS.Is_Active_MACD_Trader )
                              {         DATAS.Decition_All_SignalEstimateOut.Desc       = DescType + " ";
                                        DATAS.MethodTechTradeCommentBuy                 = "";
                                        DATAS.Is_Buy_Bulish_Expanding                   = true;  //----active buying system
                                        DATAS.MethodTechTradeCommentBuy                += "(1MACD-B)" +  TICC.Final_MACD_Trade_Condition_Signal.Desc;; //
                                        StringAdder(" (1MACD-B) ", DATAS.Decition_All_SignalEstimateOut.Desc); //
                                        DATAS.Is_Active_MACD_Trader = true; //
                                        DATAS.Active_MACD_Traer_Mode_Buy1_Sell2_Void3 = 1;
                                        return DATAS.Is_Buy_Bulish_Expanding;//
                              } //
                              /*last step 'MACDSolo' when for Scalping*/
                              if(!DATAS.Is_Buy_Bulish_Expanding && TICC.Final_MACDSolo_Trade_Condition_Signal.IsStartBuy && DATAS.Is_Pressed_MACDSolo_Trader && !DATAS.Is_Active_MACDSolo_Trader )
                              {         DATAS.Decition_All_SignalEstimateOut.Desc       = DescType + " ";
                                        DATAS.MethodTechTradeCommentBuy                 = "";
                                        DATAS.Is_Buy_Bulish_Expanding                   = true;  //----active buying system
                                        DATAS.MethodTechTradeCommentBuy                += "(1MACDs-B)" +  TICC.Final_MACDSolo_Trade_Condition_Signal.Desc;; //
                                        StringAdder(" (1MACDs-B) ", DATAS.Decition_All_SignalEstimateOut.Desc); //
                                        DATAS.Is_Active_MACDSolo_Trader = true; //
                                        DATAS.Active_MACDSolo_Traer_Mode_Buy1_Sell2_Void3 = 1;
                                        return DATAS.Is_Buy_Bulish_Expanding;//
                              } //
                              //***************************************************************************************************
                              /*last step 'ArraySence' when for Scalping */
                              if(!DATAS.Is_Buy_Bulish_Expanding && ct_Drive.TDD.ct_Signals.Extern_Signals.MTSA.IsActive_MapTradeSence_Offer && DATAS.Is_Pressed_ArraySence_Trader &&  DATAS.Decition_Array_SignalEstimateOut.Enum_BlockOffer == E_OFFER_BUY)
                              {         DATAS.Decition_All_SignalEstimateOut.Desc = DescType + " ";
                                        DATAS.MethodTechTradeCommentBuy           = "";
                                        DATAS.Is_Buy_Bulish_Expanding = true;  //----active buying system
                                        DATAS.MethodTechTradeCommentBuy += "(2Array-B)"; //
                                        DATAS.Is_Active_ArraySence_Trader        = true; //
                                        //Print("last step when for Scalpin is done for buy",__FUNCTION__);//
                                        StringAdder(" (2Array-B) ", DATAS.Decition_All_SignalEstimateOut.Desc); //
                                        return DATAS.Is_Buy_Bulish_Expanding;//
                              } //
                              //***************************************************************************************************
                              /*last step 'NNSence' when for Scalping */
                              if(!DATAS.Is_Buy_Bulish_Expanding &&  TICC.Final_NNSence_Trade_Condition_Signal.IsStartBuy  && DATAS.Is_Pressed_NNSence_Trader && !DATAS.Is_Active_NNSence_Trader )
                              {         DATAS.Decition_All_SignalEstimateOut.Desc = DescType + " ";
                                        DATAS.MethodTechTradeCommentBuy           = "";
                                        DATAS.MethodTechTradeCommentBuy          += "(NNSence-B)"; //
                                        DATAS.Is_Buy_Bulish_Expanding             = true;  //----active buying system
                                        DATAS.Is_Active_NNSence_Trader            = true; //
                                        DATAS.Active_NNSence_Traer_Mode_Buy1_Sell2_Void3 = 1;
                                        //Print("last step when for Scalpin is done for buy",__FUNCTION__);//
                                        StringAdder(" (NNSence-B) ", DATAS.Decition_All_SignalEstimateOut.Desc); //
                                        return DATAS.Is_Buy_Bulish_Expanding;//
                              } //
                              //***************************************************************************************************
                              /*last step 'FE' when for Scalping */
                              if(!DATAS.Is_Buy_Bulish_Expanding &&  TICC.Final_FE_Trade_Condition_Signal.IsStartBuy  && DATAS.Is_Pressed_FE_Trader && !DATAS.Is_Active_FE_Trader )
                              {         DATAS.Decition_All_SignalEstimateOut.Desc = DescType + " ";
                                        DATAS.MethodTechTradeCommentBuy           = "";
                                        DATAS.MethodTechTradeCommentBuy          += "(FE-B)"; //
                                        DATAS.Is_Buy_Bulish_Expanding             = true;  //----active buying system
                                        DATAS.Is_Active_FE_Trader            = true; //
                                        DATAS.Active_FE_Traer_Mode_Buy1_Sell2_Void3 = 1;
                                        //Print("last step when for Scalpin is done for buy",__FUNCTION__);//
                                        StringAdder(" (FE-B) ", DATAS.Decition_All_SignalEstimateOut.Desc); //
                                        return DATAS.Is_Buy_Bulish_Expanding;//
                              } //
                              //***************************************************************************************************
                              /* 'complex 1' when if is not confirmed then other cal else not others cheack , then need '^' condition*/
                              {         if(!ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.DATAS[1].Is_Signal_Grater_Main__Selling) //--as cascade buying
                                        {         //
                                                  //
                                                  DATAS.Decition_All_SignalEstimateOut.Desc = DescType + " ";
                                                  DATAS.MethodTechTradeCommentBuy           = "";
                                                  StringAdder(" 3.1B A", DATAS.Decition_All_SignalEstimateOut.Desc);
                                                  //***************************************************************************************************
                                                  //***************************************************************************************************
                                                  if(ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_._500_.State_To_Pick_500p == E_INCing_befor_Pick
                                                                      && ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR_Peroid._Current.IsBasic_Slow_Grater_m20   // market place over buy
                                                                      && DATAS.Signals_Flags.Information_FLAGs.ChartAnalise_Channel.Basic.flag_3_Place_Thirden == E_Place_Thirden_Lower //---estimaing uper lower
                                                    )
                                                  {         DATAS.Is_Buy_Bulish_Expanding = true; //
                                                            DATAS.MethodTechTradeCommentBuy += "(3.1B"; //
                                                            StringAdder(" 3.1B B", DATAS.Decition_All_SignalEstimateOut.Desc);//
                                                            return DATAS.Is_Buy_Bulish_Expanding;//
                                                  }
                                                  //***************************************************************************************************(Negetive effect)
                                                  //***************************************************************************************************
                                                  else if(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.E_MACD_Cross_Signal[0] == Et_MACD_Cross_Signal_Down_Buying
                                                                      && ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR_Peroid._Current.IsBasic_Fast_Lower_m80 //--decide to by must in low
                                                                      && DATAS.Signals_Flags.Information_FLAGs.ChartAnalise_Channel.Basic.flag_3_Place_Thirden == E_Place_Thirden_Lower //---estimaing uper lower
                                                                      && !ct_Drive.TDD.ct_Conductor.DC_data.Trigers.IsExpanding_20_                                  //-- dec press off forward
                                                         )
                                                  {         DATAS.Is_Buy_Bulish_Expanding = true; //
                                                            DATAS.MethodTechTradeCommentBuy  = "";
                                                            DATAS.MethodTechTradeCommentBuy += "(3.2B"; //
                                                            StringAdder(" 3.2B C", DATAS.Decition_All_SignalEstimateOut.Desc); //
                                                            return DATAS.Is_Buy_Bulish_Expanding;//
                                                  }
                                                  //***************************************************************************************************
                                                  //***************************************************************************************************
                                        }   ///---wpr 200 grater -20
                                        //***************************************************************************************************
                                        //***************************************************************************************************
                                        // AXIOM Possibility:             PreCondition          ==> Poss(action,sitiuaton);  //--Poss(Go(x,y),s=sell) => At(agent,y,Result(Go(x,y),s)).
                                        // AXIOM Effect:                  Poss(a,s)             ==> Controled movment in channel.
                                        // AXIOM Event:                   what happen           ==> WHEN macd not buying
                                        // AXIOM Frame:                   where surfing         ==> WPR SELBUY
                                        // AXIOM Successor_state :        where achived         ==> BUY FORWARD
                                        // AXIOM Believes:                logical state         ==> SUPPORT BUY
                                        else if(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR_Peroid._Current.IsBasic_Slow_Grater_m20) //---buying slow
                                        {         ///---wpr 14 lower -80
                                                  DATAS.Decition_All_SignalEstimateOut.Desc = DescType + " ";
                                                  DATAS.MethodTechTradeCommentBuy           = "";
                                                  StringAdder("4B A", DATAS.Decition_All_SignalEstimateOut.Desc); //
                                                  //***************************************************************************************************
                                                  if(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR_Peroid._Current.IsBasic_Fast_Lower_m80) //---selling fast
                                                  {         StringAdder("4B B", DATAS.Decition_All_SignalEstimateOut.Desc); //
                                                            if(ct_Drive.TDD.ct_Conductor.DC_data.Trigers.IsBuyTriger_20_Grater_20_M) //--fast movment buy support
                                                            {         if(Low[0] < ct_Drive.TDD.ct_Conductor.DC_data.Trigers._20_M[0] && TICC.Final_TREE_BUY_Condition_Signal)
                                                                      {         DATAS.Is_Buy_Bulish_Expanding = true; // //---enter buy
                                                                                DATAS.MethodTechTradeCommentBuy += "(4B D"; //
                                                                                StringAdder(" 4B D", DATAS.Decition_All_SignalEstimateOut.Desc); //
                                                                                return DATAS.Is_Buy_Bulish_Expanding;//
                                                                      }//
                                                            }//
                                                  } //
                                        }
                                        //***************************************************************************************************
                                        //***************************************************************************************************
                                        //---when macd not selling and wpr not buying
                                        else if(false && ct_Drive.TDD.ct_Conductor.DC_data.Trigers.Is_INC_Close_Grater_20_)
                                        {         DATAS.Decition_All_SignalEstimateOut.Desc = DescType + " ";
                                                  DATAS.MethodTechTradeCommentBuy           = "";
                                                  StringAdder(" 5B A", DATAS.Decition_All_SignalEstimateOut.Desc); //
                                                  // bool       IsSellTriger_500;
                                                  // bool       IsBuyTriger_500;
                                                  // bool       Is_INC_Close_Grater_500_ ;
                                                  // bool       Is_DEC_Close_Lower_500_ ;
                                                  //
                                                  //***************************************************************************************************
                                                  if(ct_Drive.TDD.ct_Conductor.DC_data.Trigers.IsBuyTriger_20_Grater_20_M)
                                                  {         //
                                                            StringAdder(" 5B B", DATAS.Decition_All_SignalEstimateOut.Desc); //
                                                            //if(Low[0] < ct_Drive.TDD.ct_Conductor.DC_data.Trigers._20_M[0]) //---MAKE WRONG BUY
                                                            //{         Is_Buy_Bulish_Expanding = true; // //---enter buy
                                                            //          MethodTechTradeCommentBuy += "(3)buy"; //
                                                            //          StringAdder("IsBuyTriger_20_Grater_20_M", Decition_All_SignalEstimateOut.Desc_Optimum_Curr_Out); //
                                                            //}//
                                                            if(Low[0] < ct_Drive.TDD.ct_Conductor.DC_data.Trigers._20_[0]) //--- STABLISH
                                                            {         DATAS.Is_Buy_Bulish_Expanding = true; // //---enter buy
                                                                      DATAS.MethodTechTradeCommentBuy += "(5B C"; //
                                                                      StringAdder(" 5B C", DATAS.Decition_All_SignalEstimateOut.Desc); //
                                                                      return DATAS.Is_Buy_Bulish_Expanding;//
                                                            }//
                                                  }
                                                  //bool       IsSellTriger_20_Lower_20_M;
                                                  //bool       IsBuyTriger_20_Grater_20_M;
                                                  //bool       Is_INC_Close_Grater_20_ ;
                                                  //bool       Is_DEC_Close_Lower_20_ ;
                                                  //
                                        }
                                        //***************************************************************************************************
                                        //***************************************************************************************************
                                        //---when macd not selling && wpr not buying && Trigers buy
                                        //---catch some seven dollar.
                                        else if(ct_Drive.TDD.ct_Conductor.DC_data.Trigers.IsBuyTriger_20_Grater_20_M &&
                                                            ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR_Peroid._Current.IsBasic_Fast_Above_Slow &&
                                                            !ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.DATAS[1].Is_Signal_Grater_Main__Selling)
                                        {         DATAS.Decition_All_SignalEstimateOut.Desc = DescType + " ";
                                                  DATAS.MethodTechTradeCommentBuy           = "";
                                                  StringAdder(" 6B ", DATAS.Decition_All_SignalEstimateOut.Desc); //
                                                  if(Close[1] < ct_Drive.TDD.ct_Conductor.DC_data.Trigers._20_M[0])
                                                  {         DATAS.Is_Buy_Bulish_Expanding = true; // //---enter buy
                                                            DATAS.MethodTechTradeCommentBuy += "(6B"; //
                                                            StringAdder(" 6B ", DATAS.Decition_All_SignalEstimateOut.Desc); //
                                                            return DATAS.Is_Buy_Bulish_Expanding;//
                                                  }//
                                        }
                                        //***************************************************************************************************
                                        //***************************************************************************************************
                                        /*none of them*/
                                        else
                                        {         DATAS.Is_Buy_Bulish_Expanding             = false; // may sell bether when wpr200 lower -80
                                                  DATAS.MethodTechTradeCommentBuy           = "";
                                                  DATAS.Decition_All_SignalEstimateOut.Desc = DescType + " " + "Not Detected";
                                                  //--MethodTechTradeCommentBuy  = ""; //
                                                  return DATAS.Is_Buy_Bulish_Expanding;//
                                        }//
                              }
                              //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                              // 'complex 2' catch some seven dollar. dont care up--care up when not true answer
                              if(false)//wrong tradeed
                                        if(!DATAS.Is_Buy_Bulish_Expanding &&
                                                            ct_Drive.TDD.ct_Conductor.DC_data.Trigers.IsBuyTriger_20_Grater_20_M &&
                                                            ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR_Peroid._Current.IsBasic_Fast_Above_Slow &&
                                                            !ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.DATAS[1].Is_Signal_Grater_Main__Selling)
                                        {         DATAS.Decition_All_SignalEstimateOut.Desc = DescType + " ";
                                                  DATAS.MethodTechTradeCommentBuy           = "";
                                                  StringAdder(" 7B A ", DATAS.Decition_All_SignalEstimateOut.Desc); //
                                                  if(Close[1] < ct_Drive.TDD.ct_Conductor.DC_data.Trigers._20_M[0])
                                                  {         DATAS.Is_Buy_Bulish_Expanding = true; // //---enter buy
                                                            DATAS.MethodTechTradeCommentBuy += "(7B B"; //
                                                            StringAdder(" 7B B ", DATAS.Decition_All_SignalEstimateOut.Desc); //
                                                            return DATAS.Is_Buy_Bulish_Expanding;//
                                                  }//
                                        }
                              //***************************************************************************************************
                              //=========================================================
                              //---!!! Turn[0] = true;
                              return DATAS.Is_Buy_Bulish_Expanding;//
                    }
                    //=====================================================================================================================================================
                    //buy //-------------------------------- -
                    if(type == 3) {         return DATAS.Is_Buy_Bulish_Nearing            = false;}
                    //=====================================================================================================================================================
                    //sell //-------------------------------- -
                    if(type == 2 )//sell
                    {         //---!!! if(Turn[1]) {Turn[1] = false; return false;}
                              //--EVERY VARIABLE MUST RESET IN OWN SECTOR ..OTHER CALL NOT CHANGE STATE
                              DATAS.Is_Sell_Bearish_Expanding       = false; //
                              DATAS.MethodTechTradeCommentSell      = "";
                              //***************************************************************************************************
                              /*last step 'TreeSence' when for Scalpin*/
                              if(!DATAS.Is_Sell_Bearish_Expanding && TICC.Final_TREE_SELL_Condition_Signal && DATAS.Is_Pressed_TreeSence_Trader && !DATAS.Is_Active_TreeSence_Trader && ct_Drive.TDD.ct_Signals.Extern_Signals.IsAllowTree) //OFFER(BUY)
                              {         DATAS.Decition_All_SignalEstimateOut.Desc       = DescType + " ";
                                        DATAS.MethodTechTradeCommentSell                = "";
                                        DATAS.Is_Sell_Bearish_Expanding                 = true;
                                        DATAS.MethodTechTradeCommentSell               += "(0Tree-S)"; ////----active selling trade system (0)Sell
                                        DATAS.Is_Active_TreeSence_Trader                = true; //
                                        //Print("last step when for Scalpin is done for sell",__FUNCTION__);//
                                        StringAdder(" (0Tree-S) ", DATAS.Decition_All_SignalEstimateOut.Desc); //
                                        return DATAS.Is_Sell_Bearish_Expanding;//
                              } //
                              //***************************************************************************************************
                              /*last step 'MACD' when for Scalpin*/
                              if(!DATAS.Is_Sell_Bearish_Expanding && TICC.Final_MACD_Trade_Condition_Signal.IsStartSell && DATAS.Is_Pressed_MACD_Trader && !DATAS.Is_Active_MACD_Trader )//OFFER(BUY)
                              {         DATAS.Decition_All_SignalEstimateOut.Desc       = DescType + " ";
                                        DATAS.MethodTechTradeCommentSell                = "";
                                        DATAS.Is_Sell_Bearish_Expanding                 = true;
                                        DATAS.MethodTechTradeCommentSell               += "(1MACD-S)" +  TICC.Final_MACD_Trade_Condition_Signal.Desc; ////----active selling trade system (0)Sell
                                        StringAdder(" (1MACD-S) ", DATAS.Decition_All_SignalEstimateOut.Desc); //
                                        DATAS.Is_Active_MACD_Trader = true; //
                                        DATAS.Active_MACD_Traer_Mode_Buy1_Sell2_Void3 = 2;
                                        //Print("TICC.Final_MACD_Trade_Condition_Signal.IsStartSell: ", TICC.Final_MACD_Trade_Condition_Signal.IsStartSell); //
                                        return DATAS.Is_Sell_Bearish_Expanding;//
                              } //
                              /*last step 'MACDSolo' when for Scalpin*/
                              //Print("!DATAS.Is_Sell_Bearish_Expanding: ", !DATAS.Is_Sell_Bearish_Expanding,  " TICC.Final_MACDSolo_Trade_Condition_Signal.IsStartSell:", TICC.Final_MACDSolo_Trade_Condition_Signal.IsStartSell, " DATAS.Is_Pressed_MACDSolo_Trader:", DATAS.Is_Pressed_MACDSolo_Trader, " !DATAS.Is_Active_MACDSolo_Trader:", !DATAS.Is_Active_MACDSolo_Trader); //
                              if(!DATAS.Is_Sell_Bearish_Expanding && TICC.Final_MACDSolo_Trade_Condition_Signal.IsStartSell && DATAS.Is_Pressed_MACDSolo_Trader && !DATAS.Is_Active_MACDSolo_Trader )//OFFER(BUY)
                              {         DATAS.Decition_All_SignalEstimateOut.Desc       = DescType + " ";
                                        DATAS.MethodTechTradeCommentSell                = "";
                                        DATAS.Is_Sell_Bearish_Expanding                 = true;
                                        DATAS.MethodTechTradeCommentSell               += "(1MACDs-S)" +  TICC.Final_MACDSolo_Trade_Condition_Signal.Desc; ////----active selling trade system (0)Sell
                                        StringAdder(" (1MACDs-S) ", DATAS.Decition_All_SignalEstimateOut.Desc); //
                                        DATAS.Is_Active_MACDSolo_Trader = true; //
                                        DATAS.Active_MACDSolo_Traer_Mode_Buy1_Sell2_Void3 = 2;
                                        return DATAS.Is_Sell_Bearish_Expanding;//
                              } //
                              //***************************************************************************************************
                              /*last step 'ArraySence' when for Scalpin*/
                              if(!DATAS.Is_Sell_Bearish_Expanding && ct_Drive.TDD.ct_Signals.Extern_Signals.MTSA.IsActive_MapTradeSence_Offer && DATAS.Is_Pressed_ArraySence_Trader && DATAS.Decition_Array_SignalEstimateOut.Enum_BlockOffer == E_OFFER_SELL)//OFFER(BUY)
                              {         DATAS.Decition_All_SignalEstimateOut.Desc       = DescType + " ";
                                        DATAS.MethodTechTradeCommentSell                = "";
                                        DATAS.Is_Sell_Bearish_Expanding                 = true;
                                        DATAS.MethodTechTradeCommentSell               += "(2Array-S)"; ////----active selling trade system (0)Sell
                                        DATAS.Is_Active_ArraySence_Trader               = true; //
                                        //Print("last step when for Scalpin is done for sell",__FUNCTION__);//
                                        StringAdder(" (2Array-S) ", DATAS.Decition_All_SignalEstimateOut.Desc); //
                                        return DATAS.Is_Sell_Bearish_Expanding;//
                              } //
                              //***************************************************************************************************
                              /*last step 'NNSence' when for Scalping */
                              if(!DATAS.Is_Sell_Bearish_Expanding &&  TICC.Final_NNSence_Trade_Condition_Signal.IsStartSell  && DATAS.Is_Pressed_NNSence_Trader && !DATAS.Is_Active_NNSence_Trader )
                              {         DATAS.Decition_All_SignalEstimateOut.Desc = DescType + " ";
                                        DATAS.MethodTechTradeCommentSell          = "";
                                        DATAS.MethodTechTradeCommentSell          += "(NNSence-S)"; //
                                        DATAS.Is_Sell_Bearish_Expanding           = true;  //----active buying system
                                        DATAS.Is_Active_NNSence_Trader            = true; //
                                        DATAS.Active_NNSence_Traer_Mode_Buy1_Sell2_Void3 = 2;
                                        //Print("last step when for Scalpin is done for buy",__FUNCTION__);//
                                        StringAdder(" (NNSence-S) ", DATAS.Decition_All_SignalEstimateOut.Desc); //
                                        return DATAS.Is_Sell_Bearish_Expanding;//
                              } //
                              /*last step 'FE Trader' when for Scalping */
                              if(!DATAS.Is_Sell_Bearish_Expanding &&  TICC.Final_FE_Trade_Condition_Signal.IsStartSell  && DATAS.Is_Pressed_FE_Trader && !DATAS.Is_Active_FE_Trader )
                              {         DATAS.Decition_All_SignalEstimateOut.Desc = DescType + " ";
                                        DATAS.MethodTechTradeCommentSell          = "";
                                        DATAS.MethodTechTradeCommentSell          += "(FE-S)"; //
                                        DATAS.Is_Sell_Bearish_Expanding           = true;  //----active buying system
                                        DATAS.Is_Active_FE_Trader            = true; //
                                        DATAS.Active_FE_Traer_Mode_Buy1_Sell2_Void3 = 2;
                                        //Print("last step when for Scalpin is done for buy",__FUNCTION__);//
                                        StringAdder(" (FE-S) ", DATAS.Decition_All_SignalEstimateOut.Desc); //
                                        return DATAS.Is_Sell_Bearish_Expanding;//
                              } //
                              //***************************************************************************************************
                              //***************************************************************************************************
                              /* 'complex 1' when if is not confirmed then other cal else not others cheack , then need '^' condition*/
                              //---- dive 2 side selling buying >>>> ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.Is_Signal_Grater_Main__Selling[1]
                              {         if(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.DATAS[1].Is_Signal_Grater_Main__Selling)
                                        {         DATAS.Decition_All_SignalEstimateOut.Desc = DescType + " ";
                                                  DATAS.MethodTechTradeCommentSell          = "";
                                                  StringAdder(" 3.1S A ", DATAS.Decition_All_SignalEstimateOut.Desc); //
                                                  //***************************************************************************************************
                                                  //***************************************************************************************************
                                                  if( ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_._500_.State_To_Pick_500n == E_INCing_befor_Pick
                                                                      && ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR_Peroid._Current.IsBasic_Slow_Lower_m80   // market place over sell
                                                                      && DATAS.Signals_Flags.Information_FLAGs.ChartAnalise_Channel.Basic.flag_3_Place_Thirden == E_Place_Thirden_Upper //---estimaing uper lower
                                                    )
                                                  {         DATAS.Is_Sell_Bearish_Expanding         = true; //
                                                            DATAS.MethodTechTradeCommentSell += "(3.1S"; //
                                                            StringAdder(" 3.1S B ", DATAS.Decition_All_SignalEstimateOut.Desc); //
                                                            return DATAS.Is_Sell_Bearish_Expanding;//
                                                  }
                                                  //***************************************************************************************************
                                                  //***************************************************************************************************
                                                  else if(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.E_MACD_Cross_Signal[0] == Et_MACD_Cross_Signal_Down_Buying
                                                                      && ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR_Peroid._Current.IsBasic_Fast_Grater_m20 //--decide to by must in high
                                                                      && DATAS.Signals_Flags.Information_FLAGs.ChartAnalise_Channel.Basic.flag_3_Place_Thirden == E_Place_Thirden_Upper //---estimaing uper lower
                                                                      && !ct_Drive.TDD.ct_Conductor.DC_data.Trigers.IsExpanding_20_                                  //-- dec press off forward
                                                         )
                                                  {         DATAS.Is_Sell_Bearish_Expanding         = true; //
                                                            DATAS.MethodTechTradeCommentSell += "(3.2S"; /////----profitd
                                                            StringAdder(" 3.1S C ", DATAS.Decition_All_SignalEstimateOut.Desc); //
                                                            return DATAS.Is_Sell_Bearish_Expanding;//
                                                  }
                                                  //***************************************************************************************************
                                                  //***************************************************************************************************
                                        }
                                        ///---wpr 200 lower -80
                                        //***************************************************************************************************
                                        //***************************************************************************************************
                                        else if(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR_Peroid._Current.IsBasic_Slow_Lower_m80)
                                        {         ///---wpr 14 grater -20
                                                  DATAS.Decition_All_SignalEstimateOut.Desc = DescType + " ";
                                                  DATAS.MethodTechTradeCommentSell          = "";
                                                  StringAdder(" 4S A ", DATAS.Decition_All_SignalEstimateOut.Desc); //
                                                  //***************************************************************************************************
                                                  if(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR_Peroid._Current.IsBasic_Fast_Grater_m20)
                                                  {         StringAdder(" 4S B ", DATAS.Decition_All_SignalEstimateOut.Desc); //
                                                            if(ct_Drive.TDD.ct_Conductor.DC_data.Trigers.IsSellTriger_20_Lower_20_M)//--fast movment sell support
                                                            {         StringAdder(" 4S C ", DATAS.Decition_All_SignalEstimateOut.Desc); //
                                                                      if(High[0] > ct_Drive.TDD.ct_Conductor.DC_data.Trigers._20_M[0] && TICC.Final_TREE_SELL_Condition_Signal)
                                                                      {         DATAS.Is_Sell_Bearish_Expanding         = true; // //---enter sell
                                                                                DATAS.MethodTechTradeCommentSell += "(4S D"; //
                                                                                StringAdder(" 4S D ", DATAS.Decition_All_SignalEstimateOut.Desc); //
                                                                                return DATAS.Is_Sell_Bearish_Expanding;//
                                                                      } //
                                                            }   //
                                                  }//
                                        }//
                                        //***************************************************************************************************
                                        //***************************************************************************************************
                                        else if(false && ct_Drive.TDD.ct_Conductor.DC_data.Trigers.Is_DEC_Close_Lower_20_)
                                        {         //
                                                  DATAS.Decition_All_SignalEstimateOut.Desc = DescType + " ";
                                                  DATAS.MethodTechTradeCommentSell          = "";
                                                  //***************************************************************************************************
                                                  // bool       IsSellTriger_500;
                                                  // bool       IsBuyTriger_500;
                                                  // bool       Is_INC_Close_Grater_500_ ;
                                                  // bool       Is_DEC_Close_Lower_500_ ;
                                                  //
                                                  StringAdder(" 5S A ", DATAS.Decition_All_SignalEstimateOut.Desc); //
                                                  //***************************************************************************************************
                                                  if(ct_Drive.TDD.ct_Conductor.DC_data.Trigers.IsSellTriger_20_Lower_20_M )
                                                  {         //
                                                            StringAdder(" 5S B ", DATAS.Decition_All_SignalEstimateOut.Desc); //
                                                            //if(High[0] > ct_Drive.TDD.ct_Conductor.DC_data.Trigers._20_M[0])//---MAKE WRONG SELL
                                                            //{         Is_Sell_Bulish_Expanding = true; // //---enter buy
                                                            //          MethodTechTradeCommentSell += "(3)Sell"; //
                                                            //          StringAdder(" 3S A ", Decition_All_SignalEstimateOut.Desc); //
                                                            //}//
                                                            if(High[0] > ct_Drive.TDD.ct_Conductor.DC_data.Trigers._20_[0] )//---STABLISH
                                                            {         DATAS.Is_Sell_Bearish_Expanding = true; // //---enter buy
                                                                      DATAS.MethodTechTradeCommentSell += "(5S C"; //
                                                                      StringAdder(" 5S C ", DATAS.Decition_All_SignalEstimateOut.Desc); //
                                                                      return DATAS.Is_Sell_Bearish_Expanding;//
                                                            }//
                                                  }
                                                  //bool       IsSellTriger_20_Lower_20_M;
                                                  //bool       IsBuyTriger_20_Grater_20_M;
                                                  //bool       Is_INC_Close_Grater_20_ ;
                                                  //bool       Is_DEC_Close_Lower_20_ ;
                                                  //
                                        }
                                        //***************************************************************************************************
                                        //***************************************************************************************************
                                        //---catch som seven dollar.
                                        else if(ct_Drive.TDD.ct_Conductor.DC_data.Trigers.IsSellTriger_20_Lower_20_M &&
                                                            !ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR_Peroid._Current.IsBasic_Fast_Above_Slow &&
                                                            ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.DATAS[1].Is_Signal_Grater_Main__Selling)
                                        {         DATAS.Decition_All_SignalEstimateOut.Desc = DescType + " ";
                                                  DATAS.MethodTechTradeCommentSell          = "";
                                                  StringAdder(" 6S A ", DATAS.Decition_All_SignalEstimateOut.Desc); //
                                                  if(Close[1] > ct_Drive.TDD.ct_Conductor.DC_data.Trigers._20_M[0])
                                                  {         DATAS.MethodTechTradeCommentSell += "(6S"; //
                                                            DATAS.Is_Sell_Bearish_Expanding = true; // //---enter buy
                                                            StringAdder(" 6S B ", DATAS.Decition_All_SignalEstimateOut.Desc); //
                                                            return DATAS.Is_Sell_Bearish_Expanding;//
                                                  }//
                                        }
                                        //***************************************************************************************************
                                        //***************************************************************************************************
                                        /*none of them*/ //end decition
                                        else
                                        {         DATAS.Is_Sell_Bearish_Expanding           = false; // may buy bether if wpr200 grater -20
                                                  DATAS.MethodTechTradeCommentSell          = "";
                                                  DATAS.Decition_All_SignalEstimateOut.Desc = DescType + " " + "Not Detected";
                                                  //--MethodTechTradeCommentSell  = ""; //
                                                  return DATAS.Is_Sell_Bearish_Expanding;//
                                        }//
                              }
                              //==================================================================================================+
                              // 'complex 2' ---catch som seven dollar. dont care up -- care up when not true answer
                              if(false)//wrong tradeed
                                        if(!DATAS.Is_Sell_Bearish_Expanding &&
                                                            ct_Drive.TDD.ct_Conductor.DC_data.Trigers.IsSellTriger_20_Lower_20_M &&
                                                            !ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR_Peroid._Current.IsBasic_Fast_Above_Slow &&
                                                            ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.DATAS[1].Is_Signal_Grater_Main__Selling)
                                        {         DATAS.Decition_All_SignalEstimateOut.Desc = DescType + " ";
                                                  DATAS.MethodTechTradeCommentSell          = "";
                                                  StringAdder(" 7S A ", DATAS.Decition_All_SignalEstimateOut.Desc); //
                                                  if(Close[1] > ct_Drive.TDD.ct_Conductor.DC_data.Trigers._20_M[0])
                                                  {         DATAS.MethodTechTradeCommentSell  +=  "(7S B"; //
                                                            DATAS.Is_Sell_Bearish_Expanding = true; // //---enter buy
                                                            StringAdder(" 7S B ", DATAS.Decition_All_SignalEstimateOut.Desc); //
                                                            return DATAS.Is_Sell_Bearish_Expanding;//
                                                  }//
                                        }
                              //***************************************************************************************************
                              //=====================================================================================================================================================
                              //---!!! Turn[1] = true;
                              return DATAS.Is_Sell_Bearish_Expanding;//
                    } //
                    //=====================================================================================================================================================
                    if(type == 4) {         return DATAS.Is_Sell_Bulish_Expanding = false;} //
                    //=====================================================================================================================================================
          }//
          return false;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Ct_Signals::methods_Axium()
{         //--FETCH Signal Method
          {         //
                    //--Best Signal To buy...
                    //--Best Signal To Sell...
                    //
                    //#1 Cross UP  Cross Down.
                    //---method type 0 [-46] [+20]
                    {         //buy
                              //---------------------------------[condition fallow trend]
                              // ! ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_.IsBasic_50_Above_5__Bearish    //--macro micro trend Bulish
                              // && !ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_.IsBasic_30_Above_3__Bearish  //--macro micro trend Bulish
                              // //
                              // &&  !ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_.IsBasic_30_Above_20_Bearish //--macro1 macro2 trend Bearish
                              // //
                              // && !ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_.IsBasic_8_Above_5_Bearish    //--micro trend Bulish
                              // && !ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_.IsBasic_5_Above_3_Bearish    //--micro trend Bulish
                              //--------------------------------------------------------------
                              //sell
                              //---------------------------------[condition fallow trend]
                              // ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_.IsBasic_50_Above_5__Bearish      //--macro micro trend Bearish
                              // && ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_.IsBasic_30_Above_3__Bearish   //--macro micro trend Bearish
                              // //
                              // && ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_.IsBasic_30_Above_20_Bearish  //--macro1 macro2 trend Bulish
                              // //
                              // && ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_.IsBasic_8_Above_5_Bearish    //--micro trend Bearish
                              // && ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_.IsBasic_5_Above_3_Bearish    //--micro trend Bearish
                    }
                    //---method type 1 ---conclution not good false
                    {         // buy  Force || ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_._8_._iMa_[0]._Value > ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_._20_._iMa_[0]._Value
                              // sell Force || ct_Drive.TDD.ct_Conductor.DC_data.Indicatorwjs.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_._8_._iMa_[0]._Value < ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_._80_._iMa_[0]._Value
                    }
                    //---method type 2
                    {         //buy
                              //---(ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_._8_._iMa_[0]._Value > ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_._20_._iMa_[0]._Value  //--slow
                              //--- &&
                              //--- ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_._3_._iMa_[0]._Value > ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_._8_._iMa_[0]._Value   //---fast
                              //---)
                              //sell
                              //---(ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_._8_._iMa_[0]._Value < ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_._80_._iMa_[0]._Value  //--slow
                              //--- &&
                              //--- ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_._3_._iMa_[0]._Value > ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_._8_._iMa_[0]._Value   //---fast
                              //---)
                    }
                    //---method type 3 just cross happen
                    {         //buy
                              //---(ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_._8_._iMa_[0]._Value > ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_._20_._iMa_[0]._Value  //--slow
                              //--- &&
                              //--- ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_._3_._iMa_[0]._Value > ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_._8_._iMa_[0]._Value   //---fast
                              //--- &&
                              //--- ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_._3_._iMa_[0]._Value > ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_._8_._iMa_[0]._Value   //---fast cross
                              //---)
                              //sell
                              //---(ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_._8_._iMa_[0]._Value < ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_._80_._iMa_[0]._Value  //--slow
                              //--- &&
                              //--- ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_._3_._iMa_[0]._Value < ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_._8_._iMa_[0]._Value  //---fast
                              //--- &&
                              //--- ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_._3_._iMa_[1]._Value > ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_._8_._iMa_[1]._Value  //---fast cross
                              //---)
                    }
                    //---method type 4
                    {         //buy
                              //---(ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_._8_._iMa_[0]._Value > ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_._20_._iMa_[0]._Value  //--slow
                              //--- &&
                              //--- ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_._3_._iMa_[0]._Value > ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_._8_._iMa_[0]._Value   //---fast
                              //--- &&
                              //--- ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_._8_._iMa_[0]._Value > Low[0]  //---vs Bid
                              //---)
                              //sell
                              //---(ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_._8_._iMa_[0]._Value < ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_._80_._iMa_[0]._Value  //--slow
                              //--- &&
                              //--- ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_._3_._iMa_[0]._Value > ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_._8_._iMa_[0]._Value   //---fast
                              //--- &&
                              //--- ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_._8_._iMa_[0]._Value < High[0]  //---vs Ask
                              //---)
                    }
                    //---method type 5
                    {         //buy
                              //---------------------------------
                              //  ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_.IsBasic_E_MD_ima_5_v_3_E_Market_Bulish_Expanding()  &&
                              //  ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_.IsBasic_E_MD_ima_500_v_300_E_Market_Bulish_Expanding() &&
                              //  TICC.Final_BUY_Condition_Indicators_MACD
                              //---------------------------------[condition fallow trend]
                              //    !ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_.IsBasic_50_Above_5__Bearish    //--macro micro trend Bulish
                              //&&  !ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_.IsBasic_30_Above_3__Bearish  //--macro micro trend Bulish
                              ////
                              //&&  !ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_.IsBasic_30_Above_20_Bearish //--macro1 macro2 trend Bearish
                              ////
                              //    !ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_.IsBasic_8_Above_5_Bearish_Above_3    //--micro trend Bulish
                              //&&  !ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_.IsBasic_80_Above_50_Bearish_Above_30
                              // ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_.E_Market_Direction_ima_20_v_5_ == E_Market_Bulish_Expanding
                              //---------------------------------[condition Trade trend Extermum]
                              //&& ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR_Peroid._Current.IsBasic_400_v_400_Bulish50
                              //&& ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR_Peroid._Current.IsBasic_400_v_200_Bulish
                              //&& !ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR_Peroid._Current.IsBasic_400_v_14_Bulish   //---kown corrrection and folowing trends
                              //---------------------------------
                              //&& FLAGs.ChartAnalise_Channel.Basic.flag_3_Place_Thirden == E_Place_Thirden_Lower //---estimaing uper lower
                              //---------------------------------
                              //----------------------------------------------------------------------------------------------------------------
                              //sell
                              //---------------------------------
                              //  ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_.IsBasic_E_MD_ima_5_v_3_E_Market_Bearish_Expanding() &&
                              //  ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_.IsBasic_E_MD_ima_500_v_300_E_Market_Bearish_Expanding() &&
                              //  TICC.Final_Sell_Condition_Indicators_MACD
                              //---------------------------------[condition fallow trend]
                              //    ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_.IsBasic_50_Above_5__Bearish      //--macro micro trend Bearish
                              //&&  ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_.IsBasic_30_Above_3__Bearish   //--macro micro trend Bearish
                              ////
                              //&&  ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_.IsBasic_30_Above_20_Bearish  //--macro1 macro2 trend Bulish
                              //
                              //    ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_.IsBasic_8_Above_5_Bearish_Above_3    //--micro trend Bearish
                              //&&  ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_.IsBasic_80_Above_50_Bearish_Above_30
                              //    ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_.E_Market_Direction_ima_20_v_5_ == E_Market_Bearish_Expanding
                              //---------------------------------[condition Trade trend Extermum]
                              //&& !ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR_Peroid._Current.IsBasic_400_v_400_Bulish50
                              //&& !ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR_Peroid._Current.IsBasic_400_v_200_Bulish
                              //&& ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR_Peroid._Current.IsBasic_400_v_14_Bulish   //---kown corrrection and folowing trends
                              //---------------------------------
                              //&& FLAGs.ChartAnalise_Channel.Basic.flag_3_Place_Thirden == E_Place_Thirden_Upper //---estimaing uper lower
                              //---------------------------------
                    }
                    //
                    //
          }
          //
}//

//+------------------------------------------------------------------+
