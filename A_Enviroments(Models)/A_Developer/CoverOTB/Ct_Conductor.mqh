//+------------------------------------------------------------------+
//||   ||||||||||            tDevConductor.mqh                      ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Bases\.BaseWall.mqh> //---Check Dependency--(ErrorsManager)
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOT\.CoverOT.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\B_MQL\CoverOT\tMqlConductor.mqh>

#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOAC\Stc_Bar_Info.mqh>
//
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOA\St_CDI.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOA\St_CD_ChartAnalise.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOA\St_CD_ChartPivots.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOA\St_CondicatorData_Trigers.mqh>
//
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOGC\.CoverOGC.mqh>
//
/*
                // #1 Update Extern data of Indicators - CandleBars - ChartAnalise

                // #2 Update TradeLogic

                // #3 Update Extern Signal

*/


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
struct Ct_DevCondicator_data
{         void       Ct_DevCondicator_data()   { ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); };
          void      ~Ct_DevCondicator_data()   { ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); };
//---Price Action Patern
          Stc_Bar_Info                          CandleBars;  //---act by update zone
          St_CDI                                Indicators;
          St_CondicatorData_ChartAnalise        ChartAnalise; //ChartAnalise
          St_CondicatorData_Pivot_Periods       Pivot_Periods;
          St_CondicatorData_Trigers             Trigers;


          //---
          int                                   Avrage_Percent_Deal;   //[--- + is Buy ---] [--- - is Sell ---]
          bool                                  Is_Market_Correction_Sell; //---  ct_Drive.TDD.ct_Conductor.DC_data.Is_Market_Correction_Sell
          //---
          //Indicators_Face_divergence_MACD__waves
          Sg_Point_                              Wave1_A, Wave1_Z, Wave2_Z, Wave3_Z, Wave4_Z, Wave5_Z;;
          bool       Is_MACD_Divergenced_0_2;// = false;
          bool       Is_MACD_Divergenced_1_3;// = false;
          bool       Is_MACD_Divergenced_2_4;// = false;
          bool       Is_MACD_Divergenced_3_5;// = false;
          //---

          //

};

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
struct Ct_Conductor
{
public:
          void                                  Ct_Conductor();
          void                                  ~Ct_Conductor() {return;};
          //---------------------------------------------------------------
          Ct_DevCondicator_data                 DC_data;

          //---
          bool                                  Is_Condicatored;
          int                                   Count_Condicatored;
          bool                                  IsBasic_Allow;
          //---
          bool                                  Update();
          bool                                  UPDATED;
          Cgs_DevObjectPack                     Object_Pack;
          void                                  AutoBoxing(ENUM_TIMEFRAMES f, int BC);
private:
          //---------------------------------------------------------------
          bool                                  Is_Extern_Indicators_data;
          bool                                  Is_Extern_CandleBars_data;
          bool                                  Is_Extern_ChartAnalise_data;
          bool                                  Is_Extern_Pivot_data;
          bool                                  Is_Extern_Trigers_data;
          //---
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
Ct_Conductor::Ct_Conductor()
{         RunCallFunction++;
          //---//DC_data.Indicators.Update();/*before init*/
          //---//Update();
          ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_Conductor Error",  __LINE__, __FUNCTION__); //|
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Ct_Conductor::Update()/*pannel need condactor data*/
{         if(IsTesting() || IsOffChartShapes) return true; //
          ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
          if(!ct_Drive.TDD.ct_Configs.IsShow_MACD_Shapes&& Initer.IsBasic_Done)
          {         ObjectsDeleteAll(0, "MNMacd");
                    ObjectsDeleteAll(0, "W1Macd");
                    ObjectsDeleteAll(0, "D1Macd");
                    ObjectsDeleteAll(0, "H4Macd");
                    ObjectsDeleteAll(0, "H1Macd");
                    ObjectsDeleteAll(0, "M30Macd");
                    ObjectsDeleteAll(0, "M15Macd");
                    ObjectsDeleteAll(0, "M5Macd");
                    ObjectsDeleteAll(0, "M1Macd");//
          }
          if(!Initer.IsBasic_Done) {return false;}
          if(!Detect_NewBar._M1.CBT__Seccound.Is_NewBar && Initer.IsBasic_Done) {return true;}
          //--------------------------------------
          {         /* Function Header
                               // #1 Extern data of Indicators - CandleBars - ChartAnalise
                               // #2 Update TradeLogic Collect All Data in ItSelf
                               // #3 Extern Signal Whitch one is power full or any is calm or risk is zero
                    */
                    //Alert("Start-Stack error " + __FUNCTION__);
                    UPDATED = false; //--Detect_NewBar._CURRENT.Is_NewBar
                    bool IsPressed_ConditionWatch = TRADER_Panel_DATA.IsConditionWatch;
                    //--- if new bar is come  or press whach
                    //Alert("Is_Updated: ", Is_Updated); //
                    //*****************************************************************************************************
                    //if(!Detect_NewBar._M1.CBT__Seccound.Is_NewBar || !IsBasic_Allow)      ///--Detect_NewBar._CURRENT.Bar_New_Detected_Count > 20 ||   Detect_NewBar._CURRENT.Bar_New_Detected_Count = 0;
                    //{         //Alert("----Detect_NewBar._M1.Bar_New_Detected_Count > 5  ", Detect_NewBar._M1.Bar_New_Detected_Count);
                    //          //---reset
                    //          Count_Condicatored = 0;
                    //          if(IsBasic_Allow)return false;       //
                    //          IsBasic_Allow = true; //
                    //}
                    ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
                    //if(!UPDATED && Count_Condicatored < 1)
                    Is_Extern_Trigers_data      = DC_data.Trigers.Update();
                    Is_Extern_Pivot_data        = DC_data.Pivot_Periods.Update();
                    if(Detect_NewBar._M1.CBT__Seccound.Is_NewBar) { Sessions.Update();} //
                    if(Detect_NewBar._M1.CBT__Seccound.Is_NewBar)//most laged
                    {         CallenderNews.Update(0);
                              CallenderNews2.Update(0);
                              CallenderNews3.Update(1);//
                    }
                    if(!IsTesting())
                    {         if(Detect_NewBar._M1.CBT__2Seccound.Is_NewBar)//most laged
                              {         OrderBookZ.Update();////
                              }//
                    }
                    if(Detect_NewBar._M1.CBT__Seccound.Is_NewBar)//most laged
                    {         Is_Extern_ChartAnalise_data = DC_data.ChartAnalise.Update(); //
                    }
                    if(Detect_NewBar._M1.CBT__HalfMinute.Is_NewBar)//most laged
                    {         Is_Extern_CandleBars_data   = DC_data.CandleBars.Update();   ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
                    }
                    if(Detect_NewBar._M1.CBT__HalfMinute.Is_NewBar)
                    {         ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
                              //---[extern Charter Group values]-------------------------------------------------------------------------------------------------------------------------------------
                              Is_Extern_Indicators_data   = DC_data.Indicators.Update();   ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
                              GoldVIP.Update();
                              //---[cheackup]-------------------------------------------------------------------------------------------------------------------------------------
                              //---[update done]-------------------------------------------------------------------------------------------------------------------------------------
                              UPDATED = true; //
                              //Count_Condicatored += 1;
                              //---Alert( "Count_Condicatored: ", (string)Count_Condicatored    );//--- confirm run one time in cycle
                              ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
                    }
                    //auto boxing
                    //if(Detect_NewBar._M1.CBT__HalfMinute.Is_NewBar)//most laged
                    AutoBoxing(PERIOD_MN1, 100); //
                    AutoBoxing(PERIOD_W1, 100); //
                    AutoBoxing(PERIOD_D1, 100); //
                    AutoBoxing(PERIOD_H4, 100); //
                    AutoBoxing(PERIOD_H1, 100); //
                    AutoBoxing(PERIOD_M30, 100); //
                    AutoBoxing(PERIOD_M15, 100); //
                    AutoBoxing(PERIOD_M5, 100); //
                    AutoBoxing(PERIOD_M1, 100); //
                    if(true)
                    {         //---reset
                              Is_Condicatored = false;
                              //-------------------------------------------------------------
                              //Is_Extern_CandleBars_data   = DC_data.CandleBars.Update();   ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
                              //Is_Extern_ChartAnalise_data = DC_data.ChartAnalise.Update(); ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|  //--stackoverflow  //---can be face of indicators
                              //-------------------------------------------------------------
                              bool Is_Done = Is_Extern_Indicators_data && Is_Extern_CandleBars_data && Is_Extern_ChartAnalise_data ;
                              Is_Condicatored = Is_Done ? true : false;
                              UPDATED = true;
                              //
                    }
                    else { UPDATED = true; } // //---for timer cheackout need to be true
          }
//----------------------------------------------------------------------
          if(UPDATED)    { return UPDATED; }//
          else           {Alert(__FUNCTION__ + " Enviroments Trade App Status Conditions watch, UPDATED: ", UPDATED);}
          return UPDATED = false; //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Ct_Conductor::AutoBoxing(ENUM_TIMEFRAMES f, int BC)
{         //---------------------------------------------------
          bool IsOff = true; //
          if(!ct_Drive.TDD.ct_Configs.IsShow_RRBoxs_Shapes && Initer.IsBasic_Done) IsOff = false; //
          int ExtermumLowest[];         int ExtermumHighest[];
          double ExtermumLowestPrice[];    double ExtermumHighestPrice[];
          ArrayResize(ExtermumLowest, 200);             ArrayResize(ExtermumHighest, 200);
          ArrayResize(ExtermumLowestPrice, 200);        ArrayResize(ExtermumHighestPrice, 200); ArrayInitialize(ExtermumHighestPrice, 0);   ArrayInitialize(ExtermumLowestPrice, 99999);
          for(int i = 1; i < 200; i++)
          {         //
                    for(int k = 1; k < 200; k++)
                    {         if(Low[i + 1] > Low[i] && Low[i - 1] > Low[i] )//&& ExtermumLowest[i - 1] > ExtermumLowest[i]
                              {         ExtermumLowest[i]       = iLowest(Symbol(), f, MODE_LOW, k, i);
                                        ExtermumLowestPrice[i]   = iLow(Symbol(), f,  ExtermumLowest[k] );   ;//
                              }
                              if(High[i + 1] < High[i] && High[i - 1] < High[i] )//&& ExtermumHighest[i - 1] < ExtermumHighest[i]
                              {         ExtermumHighest[i]      = iHighest(Symbol(), f, MODE_HIGH, k, i); //
                                        ExtermumHighestPrice[i]  = iHigh(Symbol(), f, ExtermumHighest[k]); ;//
                              } //
                    }
                    //
          }
          //for(int i = 0; i < ArraySize(ExtermumHighest); i++)
          //{         Object_Pack.Lines.Trend.Draw_GDS_Lines(MODE_CREATE, true, "TL.Zigzag" + i, "TL.Zigzag" + i, Time[ExtermumLowest[i]], ExtermumHighestPrice[i], Time[ExtermumHighest[i]], ExtermumLowestPrice[i], clrWhite, 2, false, STYLE_SOLID, false);
          //          //
          //          //
          //}
          //if(f == PERIOD_M1)Print("ExtermumHighest: ", ExtermumHighest[0], "  ExtermumLowest:", ExtermumLowest[0]); //
          //---------------------------------------------------
          //St_CDI_Custom_ZigZags _ZigZags_(12, 5, 3, f, NULL, 0, 1000, 10, 1 );
          //---------------------------------------------------
          int ShiftLowest   =       iLowest(Symbol(), f, MODE_LOW, 100, 10);    ShiftLowest   = ExtermumLowest[0];  ShiftLowest   = ExtermumLowest[ArrayMinimum(ExtermumLowestPrice, WHOLE_ARRAY)];
          int ShiftHighest  =       iHighest(Symbol(), f, MODE_HIGH, 100, 10);  ShiftHighest  = ExtermumHighest[0]; ShiftHighest  = ExtermumHighest[ArrayMaximum(ExtermumHighestPrice, WHOLE_ARRAY)];
          //
          //ShiftLowest    = _ZigZags_.ZigZags_Point[0]._Price > _ZigZags_.ZigZags_Point[1]._Price ? _ZigZags_.ZigZags_Point[1]._Shift : _ZigZags_.ZigZags_Point[0]._Shift;
          //ShiftHighest   = _ZigZags_.ZigZags_Point[0]._Price > _ZigZags_.ZigZags_Point[1]._Price ? _ZigZags_.ZigZags_Point[0]._Shift : _ZigZags_.ZigZags_Point[1]._Shift;
          //
          double PriceLow   =       iLow(Symbol(), f, ShiftLowest);             //PriceLow      = ArrayMinimum(ExtermumLowest,WHOLE_ARRAY);
          double PriceHigh  =       iHigh(Symbol(), f, ShiftHighest);           //PriceHigh     = ArrayMaximum(ExtermumHighest,WHOLE_ARRAY);
          double Range      =       MathAbs(PriceLow - PriceHigh);
          datetime RangeTime = MathAbs(iTime(Symbol(), f, ShiftLowest) - iTime(Symbol(), f, ShiftHighest));
          RangeTime = PeriodSeconds(f) * 10; //
          //
          bool IsBulish = ShiftLowest > ShiftHighest ? true : false; //
          //
          double  PriceThere3 ;//PriceOne1, PriceTwo2,
          datetime  TimeThere3 ;//TimeOne1, TimeTwo2,
          if(IsBulish)  {PriceThere3 = iLow(Symbol(), f, iLowest(Symbol(), f, MODE_LOW, ShiftHighest, 0));;    TimeThere3 = iTime(Symbol(), f, iLowest(Symbol(), f, MODE_LOW, ShiftHighest, 0));}
          else          {PriceThere3 = iHigh(Symbol(), f, iHighest(Symbol(), f, MODE_HIGH, ShiftLowest, 0));;  TimeThere3 = iTime(Symbol(), f, iHighest(Symbol(), f, MODE_HIGH, ShiftLowest, 0));}
          //----------------------------------------------
          double PriceOneSL, PriceTwoSL;
          datetime TimeOneSL, TimeTwoSL;
          TimeTwoSL = iTime(Symbol(), f, ShiftHighest);
          TimeTwoSL = iTime(Symbol(), f, ShiftLowest);
          if(IsBulish)  {  PriceOneSL = PriceLow;   PriceTwoSL = PriceLow - Range;       TimeOneSL = iTime(Symbol(), f, ShiftLowest);  TimeTwoSL = TimeOneSL + RangeTime;}
          else          {  PriceOneSL = PriceHigh;  PriceTwoSL = PriceHigh + Range;      TimeOneSL = iTime(Symbol(), f, ShiftHighest); TimeTwoSL = TimeOneSL + RangeTime;}
          //
          double PriceOne, PriceTwo;
          datetime TimeOne, TimeTwo;
          TimeTwo = iTime(Symbol(), f, ShiftHighest);
          TimeTwo = iTime(Symbol(), f, ShiftLowest);
          if(IsBulish)  {  PriceOne = PriceLow;   PriceTwo = PriceHigh;     TimeOne = iTime(Symbol(), f, ShiftLowest);  TimeTwo = TimeOne + RangeTime;}
          else          {  PriceOne = PriceHigh;  PriceTwo = PriceLow;      TimeOne = iTime(Symbol(), f, ShiftHighest); TimeTwo = TimeOne + RangeTime;}
          //
          double Price2One, Price2Two;
          datetime Time2One, Time2Two;
          Time2Two = iTime(Symbol(), f, ShiftHighest) + RangeTime;
          Time2Two = iTime(Symbol(), f, ShiftLowest) + RangeTime;
          if(IsBulish)  {  Price2One = PriceHigh;   Price2Two = PriceHigh +  Range;   Time2One = iTime(Symbol(), f, ShiftLowest) + RangeTime;         Time2Two = Time2One + RangeTime;}
          else          {  Price2One = PriceLow;    Price2Two = PriceLow - Range;     Time2One = iTime(Symbol(), f, ShiftHighest) + RangeTime;        Time2Two = Time2One + RangeTime;}
          //
          double Price3One, Price3Two;
          datetime Time3One, Time3Two;
          Time3Two = iTime(Symbol(), f, ShiftHighest) + RangeTime * 2;
          Time3Two = iTime(Symbol(), f, ShiftLowest) + RangeTime * 2;
          if(IsBulish)  {  Price3One = PriceHigh +  Range;   Price3Two = PriceHigh +  Range * 2;   Time3One = iTime(Symbol(), f, ShiftLowest) + RangeTime * 2;         Time3Two = Time3One + RangeTime * 1;}
          else          {  Price3One = PriceLow - Range;    Price3Two = PriceLow - Range * 2;      Time3One = iTime(Symbol(), f, ShiftHighest) + RangeTime * 2;        Time3Two = Time3One + RangeTime * 1;}
          //
          double Price4One, Price4Two;
          datetime Time4One, Time4Two;
          Time4Two = iTime(Symbol(), f, ShiftHighest) + RangeTime * 3;
          Time4Two = iTime(Symbol(), f, ShiftLowest) + RangeTime * 3;
          if(IsBulish)  {  Price4One = PriceHigh +  Range * 2;   Price4Two = PriceHigh +  Range * 3;   Time4One = iTime(Symbol(), f, ShiftLowest) + RangeTime * 3;         Time4Two = Time4One + RangeTime * 1;}
          else          {  Price4One = PriceLow - Range * 2;    Price4Two = PriceLow - Range * 3;     Time4One = iTime(Symbol(), f, ShiftHighest) + RangeTime * 3;        Time4Two = Time4One + RangeTime * 1;}
          //big object not created here
          Object_Pack.Shapes.Rectangle.Draw_GDS(MODE_CREATE, false, "Rect.BoxSL" + EnumToString(f), "Rect.BoxSL" + EnumToString(f), false,  TimeOneSL,  PriceOneSL,  TimeTwoSL,  PriceTwoSL,  clrRed, true);  //
          Object_Pack.Shapes.Rectangle.Draw_GDS(MODE_CREATE, IsOff, "Rect.BoxSL" + EnumToString(f), "Rect.BoxSL" + EnumToString(f), false,  TimeOneSL,  PriceOneSL,  TimeTwoSL,  PriceTwoSL,  clrRed, true);   //
          //
          Object_Pack.Shapes.Rectangle.Draw_GDS(MODE_CREATE, false, "Rect.BoxTp" + EnumToString(f), "Rect.BoxTp" + EnumToString(f), false,  TimeOne,  PriceOne,  TimeTwo,  PriceTwo,  clrYellow, true);   //
          Object_Pack.Shapes.Rectangle.Draw_GDS(MODE_CREATE, IsOff, "Rect.BoxTp" + EnumToString(f), "Rect.BoxTp" + EnumToString(f), false,  TimeOne,  PriceOne,  TimeTwo,  PriceTwo,  clrYellow, true);   //
          //
          Object_Pack.Shapes.Rectangle.Draw_GDS(MODE_CREATE, false, "Rect.BoxTp2" + EnumToString(f), "Rect.BoxTp2" + EnumToString(f), false,  Time2One,  Price2One,  Time2Two,  Price2Two,  clrYellow, true);   //
          Object_Pack.Shapes.Rectangle.Draw_GDS(MODE_CREATE, IsOff, "Rect.BoxTp2" + EnumToString(f), "Rect.BoxTp2" + EnumToString(f), false,  Time2One,  Price2One,  Time2Two,  Price2Two,  clrYellow, true);   //
          Object_Pack.Shapes.Rectangle.Draw_GDS(MODE_CREATE, false, "Rect.BoxTp3" + EnumToString(f), "Rect.BoxTp3" + EnumToString(f), false,  Time3One,  Price3One,  Time3Two,  Price3Two,  clrYellow, true);   //
          Object_Pack.Shapes.Rectangle.Draw_GDS(MODE_CREATE, IsOff, "Rect.BoxTp3" + EnumToString(f), "Rect.BoxTp3" + EnumToString(f), false,  Time3One,  Price3One,  Time3Two,  Price3Two,  clrYellow, true);   //
          Object_Pack.Shapes.Rectangle.Draw_GDS(MODE_CREATE, false, "Rect.BoxTp4" + EnumToString(f), "Rect.BoxTp4" + EnumToString(f), false,  Time4One,  Price4One,  Time4Two,  Price4Two,  clrYellow, true);   //
          Object_Pack.Shapes.Rectangle.Draw_GDS(MODE_CREATE, IsOff, "Rect.BoxTp4" + EnumToString(f), "Rect.BoxTp4" + EnumToString(f), false,  Time4One,  Price4One,  Time4Two,  Price4Two,  clrYellow, true);   //
          //Print(" TimeOne:",TimeOne," PriceOne:",PriceOne," TimeTwo:",TimeTwo," PriceTwo:",PriceTwo);//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//||   ||||||||||            tDevConductor.mqh                      ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
/*
 ( (ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_.IsBasic_E_MD_ima_30_v_8_E_Market_Bulish_Expanding()  )
                                                    //-- ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_LOW_._10_._iMa_[0]
                                                    //ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_.IsBasic_E_MD_ima_500_v_300_E_Market_Bulish_Expanding() &&
                                                    //TICC.Final_BUY_Condition_Indicators_MACD
                                                    //-------------------------------- -[condition follow trend]
                                                    || (
                                                              !ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_.IsBasic_50_Above_5__Bearish  //--macro micro trend Bearish
                                                              &&  !ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_.IsBasic_30_Above_3__Bearish  //--macro micro trend Bearish
                                                              //
                                                              &&  !ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_.IsBasic_30_Above_20_Bearish //--macro1 macro2 trend Bearish
                                                              //
                                                              && !ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_.IsBasic_8_Above_5_Bearish_Above_3    //--micro not trend Bearish
                                                              && !ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_.IsBasic_80_Above_50_Bearish_Above_30
                                                    )                           //--lefting time
                                                  )
                                                  //------------------------------------------------------------------------------------------------------------------------------------------
                                                  //ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_.E_Market_Direction_ima_20_v_5_ == E_Market_Bulish_Expanding
                                                  //---------------------------------[condition Trade trend Extermum]
                                                  //&& ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR_Peroid._Current.IsBasic_400_v_400_Bulish50
                                                  //&& ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR_Peroid._Current.IsBasic_400_v_200_Bulish
                                                  //&& !ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR_Peroid._Current.IsBasic_400_v_14_Bulish   //---kown corrrection and folowing trends
                                                  //-------------------------------- -
                                                  //&& FLAGs.ChartAnalise_Channel.Basic.flag_3_Place_Thirden == E_Place_Thirden_Lower //---estimaing uper lower
                                                  //--------------------------------
                                                  && (  !ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M5.Is_Signal_Previus_Grater_Main_Previus__Selling[0] && ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M5.IsBasic_SignalMain_Bulish_Expanding[0] )
                                                  //--------------------------------
                                                  //======================================
                                                  ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_.IsBasic_E_MD_ima_30_v_8_E_Market_Bulish_Nearing() &&
                                                  //ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_.IsBasic_E_MD_ima_500_v_300_E_Market_Bulish_Expanding() &&
                                                  //TICC.Final_BUY_Condition_Indicators_MACD
                                                  //-------------------------------- -[condition follow trend]
                                                  !ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_.IsBasic_50_Above_5__Bearish    //--macro micro trend Bearish
                                                  &&  !ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_.IsBasic_30_Above_3__Bearish  //--macro micro trend Bearish
                                                  //
                                                  &&  !ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_.IsBasic_30_Above_20_Bearish //--macro1 macro2 trend Bearish
                                                  //
                                                  && !ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_.IsBasic_8_Above_5_Bearish_Above_3    //--micro not trend Bearish
                                                  && !ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_.IsBasic_80_Above_50_Bearish_Above_30
                                                  //ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_.E_Market_Direction_ima_20_v_5_ == E_Market_Bulish_Expanding
                                                  //---------------------------------[condition Trade trend Extermum]
                                                  //&& ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR_Peroid._Current.IsBasic_400_v_400_Bulish50
                                                  //&& ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR_Peroid._Current.IsBasic_400_v_200_Bulish
                                                  //&& !ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR_Peroid._Current.IsBasic_400_v_14_Bulish   //---kown corrrection and folowing trends
                                                  //-------------------------------- -
                                                  //&& FLAGs.ChartAnalise_Channel.Basic.flag_3_Place_Thirden == E_Place_Thirden_Lower //---estimaing uper lower
                                                  //--------------------------------
                                                  && !ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M5.Is_Signal_Previus_Grater_Main_Previus__Selling[0]
                                                  //--------------------------------
                                                  ;
                                                  //===========================================
                                                  ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_.IsBasic_E_MD_ima_30_v_8_E_Market_Bearish_Expanding() &&
                                                  //ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_.IsBasic_E_MD_ima_500_v_300_E_Market_Bearish_Expanding() &&
                                                  //TICC.Final_Sell_Condition_Indicators_MACD
                                                  //-------------------------------- -[condition fallow trend]
                                                  ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_.IsBasic_50_Above_5__Bearish     //--macro micro trend Bearish
                                                  &&  ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_.IsBasic_30_Above_3__Bearish   //--macro micro trend Bearish
                                                  //
                                                  &&  ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_.IsBasic_30_Above_20_Bearish  //--macro1 macro2 trend Bulish
                                                  //
                                                  && ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_.IsBasic_8_Above_5_Bearish_Above_3    //--micro trend Bearish
                                                  && ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_.IsBasic_80_Above_50_Bearish_Above_30 //--macro trend Bearish  //--lefting time
                                                  //ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_.E_Market_Direction_ima_20_v_5_ == E_Market_Bearish_Expanding
                                                  //-------------------------------- -[condition Trade trend Extermum]
                                                  //&& !ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR_Peroid._Current.IsBasic_400_v_400_Bulish50
                                                  //&& !ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR_Peroid._Current.IsBasic_400_v_200_Bulish
                                                  //&& ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR_Peroid._Current.IsBasic_400_v_14_Bulish   //---kown corrrection and folowing trends
                                                  //-------------------------------- -
                                                  //&& FLAGs.ChartAnalise_Channel.Basic.flag_3_Place_Thirden == E_Place_Thirden_Upper //---estimaing uper lower
                                                  //-------------------------------- -
                                                  && ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M5.Is_Signal_Previus_Grater_Main_Previus__Selling[0]
                                                  && ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M5.IsBasic_SignalMain_Bearish_Expanding[0]
                                                  //--------------------------------
                                                  ;//
                                                  //=============================================================
                                                           ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_.IsBasic_E_MD_ima_30_v_8_E_Market_Bearish_Nearing() &&
                                                  //ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_.IsBasic_E_MD_ima_500_v_300_E_Market_Bearish_Expanding() &&
                                                  //TICC.Final_Sell_Condition_Indicators_MACD
                                                  //-------------------------------- -[condition fallow trend]
                                                  ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_.IsBasic_50_Above_5__Bearish     //--macro micro trend Bearish
                                                  &&  ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_.IsBasic_30_Above_3__Bearish   //--macro micro trend Bearish
                                                  //
                                                  &&  ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_.IsBasic_30_Above_20_Bearish  //--macro1 macro2 trend Bulish
                                                  //
                                                  && ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_.IsBasic_8_Above_5_Bearish_Above_3    //--micro trend Bearish
                                                  && ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_.IsBasic_80_Above_50_Bearish_Above_30
                                                  //ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_.E_Market_Direction_ima_20_v_5_ == E_Market_Bearish_Expanding
                                                  //-------------------------------- -[condition Trade trend Extermum]
                                                  //&& !ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR_Peroid._Current.IsBasic_400_v_400_Bulish50
                                                  //&& !ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR_Peroid._Current.IsBasic_400_v_200_Bulish
                                                  //&& ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR_Peroid._Current.IsBasic_400_v_14_Bulish   //---kown corrrection and folowing trends
                                                  //-------------------------------- -
                                                  //&& FLAGs.ChartAnalise_Channel.Basic.flag_3_Place_Thirden == E_Place_Thirden_Upper //---estimaing uper lower
                                                  //-------------------------------- -
                                                  && ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M5.Is_Signal_Previus_Grater_Main_Previus__Selling[0]
                                                  //--------------------------------
                                                  ;//
*/
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
