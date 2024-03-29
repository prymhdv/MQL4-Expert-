//+------------------------------------------------------------------+
//||   ||||||||||                         FiboExpansion.mqh         ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\BasicChartObj\_COBF_.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\BasicChartObj\__COBFA__.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\.Items\Texts\oTexts.mqh>;

#define Expansion_DEF_tooltip "Expansion"
struct HistoryGap_Data
{         string          HistoryGap_Desc;//  = "HistoryGap!-Must Update HistoryDatabase: "+ _Symbol +"-"+Utilities.TimeFrameToString(PeriodTF);//
          bool            Is_HistoryGap;// = false;//

};

struct HistoryGap_periods

{         HistoryGap_Data _CURRENT;
          HistoryGap_Data _MN1;
          HistoryGap_Data _W1;
          HistoryGap_Data _D1;
          HistoryGap_Data _H4;
          HistoryGap_Data _H1;
          HistoryGap_Data _M30;
          HistoryGap_Data _M15;
          HistoryGap_Data _M5;
          HistoryGap_Data _M1;
          void HistoryGap_periods() { Set();}
          void Set()
          {         _CURRENT.HistoryGap_Desc    = "HistoryGap!-Must Update HistoryDatabase: " + _Symbol; // + "-"+ Utilities.TimeFrameToString(PeriodTF);//
                    _CURRENT.Is_HistoryGap      = false;//
                    //
                    _MN1.HistoryGap_Desc        = "HistoryGap!-Must Update HistoryDatabase: " + _Symbol; // + "-"+ Utilities.TimeFrameToString(PeriodTF);//
                    _MN1.Is_HistoryGap          = false;//
                    //
                    _W1.HistoryGap_Desc         = "HistoryGap!-Must Update HistoryDatabase: " + _Symbol; // + "-"+ Utilities.TimeFrameToString(PeriodTF);//
                    _W1.Is_HistoryGap           = false;//
                    //
                    _D1.HistoryGap_Desc         = "HistoryGap!-Must Update HistoryDatabase: " + _Symbol; // + "-"+ Utilities.TimeFrameToString(PeriodTF);//
                    _D1.Is_HistoryGap           = false;//
                    //
                    _H4.HistoryGap_Desc         = "HistoryGap!-Must Update HistoryDatabase: " + _Symbol; // + "-"+ Utilities.TimeFrameToString(PeriodTF);//
                    _H4.Is_HistoryGap           = false;//
                    //
                    _H1.HistoryGap_Desc         = "HistoryGap!-Must Update HistoryDatabase: " + _Symbol; // + "-"+ Utilities.TimeFrameToString(PeriodTF);//
                    _H1.Is_HistoryGap           = false;//
                    //
                    _M30.HistoryGap_Desc        = "HistoryGap!-Must Update HistoryDatabase: " + _Symbol; // + "-"+ Utilities.TimeFrameToString(PeriodTF);//
                    _M30.Is_HistoryGap          = false;//
                    //
                    _M15.HistoryGap_Desc        = "HistoryGap!-Must Update HistoryDatabase: " + _Symbol; // + "-"+ Utilities.TimeFrameToString(PeriodTF);//
                    _M15.Is_HistoryGap          = false;//
                    //
                    _M5.HistoryGap_Desc         = "HistoryGap!-Must Update HistoryDatabase: " + _Symbol; // + "-"+ Utilities.TimeFrameToString(PeriodTF);//
                    _M5.Is_HistoryGap           = false;//
                    //
                    _M1.HistoryGap_Desc         = "HistoryGap!-Must Update HistoryDatabase: " + _Symbol; // + "-"+ Utilities.TimeFrameToString(PeriodTF);//
                    _M1.Is_HistoryGap           = false;//
          }



}; HistoryGap_periods _HistoryGap;
struct Sgtd_FiboExpansion_data_Signal
{         //---
          double        tp1, tp2, tp3,     sl,     startPrice,     endPrice1,      endPrice2,      endPrice3;

//---
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
struct Sgtd_FiboExpansion_data
{         double        _Price;           // = Price1;
          datetime      _Time;            // = Time1;
          //
};

struct Sgtd_FiboExpansion_data_Periods_Attribes
{         bool          Is_Bulish;         // = Time1 > Time2;
          bool          Is_Gradient_Negative;

          Sgtd_FiboExpansion_data C1;
          Sgtd_FiboExpansion_data C2;
          Sgtd_FiboExpansion_data C3;


          Sgtd_FiboExpansion_data CC1;
          Sgtd_FiboExpansion_data CC2;
          Sgtd_FiboExpansion_data CC3;

          Sgtd_FiboExpansion_data_Signal       _Signal;


};

struct Sgtd_FiboExpansion_data_Periods
{         Sgtd_FiboExpansion_data_Periods_Attribes _CURRENT;
          Sgtd_FiboExpansion_data_Periods_Attribes _MN1;
          Sgtd_FiboExpansion_data_Periods_Attribes _W1;
          Sgtd_FiboExpansion_data_Periods_Attribes _H4;
          Sgtd_FiboExpansion_data_Periods_Attribes _H1;
          Sgtd_FiboExpansion_data_Periods_Attribes _D1;
          Sgtd_FiboExpansion_data_Periods_Attribes _M30;
          Sgtd_FiboExpansion_data_Periods_Attribes _M15;
          Sgtd_FiboExpansion_data_Periods_Attribes _M5;
          Sgtd_FiboExpansion_data_Periods_Attribes _M1;
          //
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

struct Sgtd_FIBO_EXPANSION_Calc
{         int           CalcMode;
          double        Price1;
          datetime      Time1;

          double        Price2;
          datetime      Time2;

          double        Price3;
          datetime      Time3;

          double        PriceMean;
          datetime      TimeMean;

          ENUM_TIMEFRAMES PeriodTF; //= PERIOD_CURRENT

};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
struct Sgtdf_FIBO_EXPANSION_Data
{         int         __Calc__FindBar_Index                            ;//= -1;   //0; _Data.__Calc_Third_Bar_Highest;
          int         __Calc_MeanBar                            ;//= -1;   /////(HighestBar + LowestBar) / 2;

          int         __Calc__Frist_HighestBar_Index             ;//= -1;   ///= iHighest(StSymbol.Current, ChartData_ChartInfo.Timeframe = PERIOD_CURRENT,  MODE_HIGH, BarCount = 200, BarStart);
          int         __Calc__Frist_LowestBar_Index              ;//= -1;   ///= iLowest(StSymbol.Current, ChartData_ChartInfo.Timeframe = PERIOD_CURRENT, MODE_LOW, BarCount , BarStart);
          //
          int         __Calc__Frist_Bar_Index;
          int         __Calc__Secound_Bar_Index             ;//= -1;   ///= iHighest(StSymbol.Current, ChartData_ChartInfo.Timeframe = PERIOD_CURRENT,  MODE_HIGH, BarCount = 200, BarStart);


          //
          int         __Calc_Third_Bar_Lowest                   ;//= -1;   ///= iLowest(StSymbol.Current, ChartData_ChartInfo.Timeframe = PERIOD_CURRENT, MODE_LOW, BarCount = LowestBar, BarStart);
          int         __Calc_Third_Bar_Highest                  ;//= -1;   ///= iHighest(StSymbol.Current, ChartData_ChartInfo.Timeframe = PERIOD_CURRENT,  MODE_HIGH, BarCount = HighestBar, BarStart);
          int         __Calc_Forth_Bar                          ;//= -1;   ///= iBarShift(NULL, PERIOD_CURRENT, Time[0]); ///Close[0];///

          datetime    __Calc__Time0_Value                  ;//= -1;   ///iTime(StSymbol.Current, Calc.PeriodTF, 0);
          datetime    __Calc_PeriodTMCom_Time5                  ;//= -1;   ///iTime(StSymbol.Current, Calc.PeriodTF, 5);

          double      __Calc__High0                  ;//= -1;   ///iHigh(StSymbol.Current, Calc.PeriodTF, 0);
          double      __Calc__Frist_High_HighestBar        ;//= -1;   ///iHigh(StSymbol.Current, Calc.PeriodTF, HighestBar);
          double      __Calc__High_Find_Bar          ;//= -1;   ///iHigh(StSymbol.Current, Calc.PeriodTF, _Data.__Calc__FindBar_Index);    ///Price3 =  High[_Data.__Calc__FindBar_Index]

          double      __Calc__Low0                   ;//= -1;   ///iLow(StSymbol.Current, Calc.PeriodTF, 0);
          double      __Calc__Frist_Low_Lowest_Bar         ;//= -1;   ///iLow(StSymbol.Current, Calc.PeriodTF, LowestBar);
          double      __Calc__Low_Find_Bar           ;//= -1;   ///iLow(StSymbol.Current, Calc.PeriodTF, _Data.__Calc__FindBar_Index);    ///Price3 =  Low[_Data.__Calc__FindBar_Index]

          double      __Calc__Secound_Low_Lowest_Bar;
          double      __Calc__Secound_High_HighestBar;


          double      __Calc_PeriodTMCom_Close_Mean             ;//= -1;   ///iClose[(HighestBar + LowestBar) / 2]

          double      __Calc_PeriodTMCom_Close0                 ;//= -1;   ///iClose(StSymbol.Current, Calc.PeriodTF, 0);
          double      __Calc_PeriodTMCom_Close_Find_Bar0        ;//= -1;   ///iClose(StSymbol.Current, Calc.PeriodTF, _Data.__Calc__FindBar_Index);Close[_Data.__Calc__FindBar_Index]

          double      __Calc_PeriodTMCom_Open0                  ;//= -1;   ///iOpen(StSymbol.Current, Calc.PeriodTF, 0);

          int         __Calc_Highest_Bar_New_DownWard           ;//= -1;   //=iHighest(StSymbol.Current, ChartData_ChartInfo.Timeframe = PERIOD_CURRENT,  MODE_HIGH, BarCount = LowestBar, BarStart = _Data.__Calc_Forth_Bar);
          int         __Calc_Lowest_Bar_New_DownWard            ;//= -1; //=iLowest(StSymbol.Current, ChartData_ChartInfo.Timeframe = PERIOD_CURRENT, MODE_LOW, BarCount = LowestBar, BarStart = _Data.__Calc_Forth_Bar);
          int         __Calc_Highest_Bar_New_UpWard             ;//= -1;   //=iHighest(StSymbol.Current, ChartData_ChartInfo.Timeframe = PERIOD_CURRENT,  MODE_HIGH, BarCount = HighestBar, BarStart = _Data.__Calc_Forth_Bar);
          int         __Calc_Lowest_Bar_New_UpWard              ;//= -1;   //=iLowest(StSymbol.Current, ChartData_ChartInfo.Timeframe = PERIOD_CURRENT, MODE_LOW, BarCount = HighestBar, BarStart = _Data.__Calc_Forth_Bar);

          double      __Calc__High_Highest_Bar_New_DownWard ;//= -1; //iHigh(StSymbol.Current, Calc.PeriodTF, _Data.__Calc_Highest_Bar_New_DownWard);////= High[_Data.__Calc_Highest_Bar_New_DownWard]
          double      __Calc__Low_Lowest_Bar_New_DownWard   ;//= -1; //iLow(StSymbol.Current, Calc.PeriodTF, _Data.__Calc_Lowest_Bar_New-DownWard);///Low[_Data.__Calc_Lowest_Bar_New-DownWard];
};
//+------------------------------------------------------------------+
//|             Class SoundController     BEGIN                      |
//+------------------------------------------------------------------+
struct S_FIBO_EXPANSION: public _COBF_
{         //============================================================================================================
          void                  S_FIBO_EXPANSION() {TYPE_O_00 = OBJ_EXPANSION;}; // {Point3XYZ(0, 0, 0, 0, 0, 0);}; //S_HLINE.PointTime.TIME1==0  S_HLINE.PointTime.PRICE1==0  S_HLINE.PointTime.TIME2==0   S_HLINE.PointTime.PRICE2==0
          S_point               Point3XYZ;                                                 //S_HLINE.PointTime.TIME1==0  S_HLINE.PointTime.PRICE1==0
          S_Level               Levels;
          int                   PRICE2_Shift;
          ////----------------------------------
          //color                 COLOR;                        //Color                           color
          //ENUM_LINE_STYLE       STYLE;                        //Style                           ENUM_LINE_STYLE
          //int                   WIDTH;                        //Line thickness                  int
          ////----------------------------------
          //bool                  RAY_RIGHT;                    //Ray goes to the right     bool
          bool                  Is_Level_Full;
          int                   levels;            // number of level lines
          double                values[];        // values of level lines
          double                Price[];
          color                 colors[];       // color of level lines
          ENUM_LINE_STYLE       styles[];        // style of level lines
          int                   widths[];         // width of level lines
          void S_FIBO_RETRACEMENT()
          {         levels = 10;
                    ArrayResize(values, levels, 0);
                    ArrayResize(colors, levels, 0);
                    ArrayResize(styles, levels, 0);
                    ArrayResize(widths, levels, 0);//
                    ArrayResize(Price,  levels, 0); //
          }
          //===
          Sgtd_FiboExpansion_data_Periods _Periods;
          bool                                 Is_Bulish;
          color                                clrr, clrr_level;
          double                               Range_All, Range_2_3, Percent_Retrece_3;
          string                               Percent_Retrece_3_Desc;
          //---


          //
          bool                  Set_RayRight_1(bool rayRight)      {   RAY_RIGHT_11        = rayRight;     return true;}
          bool                  SetLevelsCount(int l)           {   levels              = l;            return true;}
          bool                  SetLevelsFull(bool l)           {   Is_Level_Full       = l;            return true;}
          //////----------------------------------
          bool  Calc_Locations(ENUM_TIMEFRAMES f, int AddBar, int StartBar )
          {         if(IsCreated)return false;
                    datetime    Time1   = 0;
                    double      Price1  = 0;
                    datetime    Time2   = 0;
                    double      Price2  = 0;
                    datetime    Time3   = 0;
                    double      Price3  = 0;
                    Is_Bulish = false;
                    //---
                    {         int LowestBar             = iLowest(      StSymbol.Current, f, MODE_LOW, AddBar, StartBar);
                              int HighestBar            = iHighest(     StSymbol.Current, f, MODE_HIGH, AddBar, StartBar);
                              //---
                              //--
                              Is_Bulish = LowestBar > HighestBar;
                              // if (Time2 > Time3) Time2  = iTime(        StSymbol.Current, f, StartBar + 10 ); // MathAbs(HighestBar - LowestBar)
                              //---
                              if(Is_Bulish)
                              {         Time1                     = iTime(        StSymbol.Current, f, LowestBar); // Time[50];
                                        Time2                     = iTime(        StSymbol.Current, f, HighestBar  ); // Time[50];
                                        Price1                    = iLow(         StSymbol.Current, f, LowestBar); //
                                        Price2                    = iHigh(        StSymbol.Current, f, HighestBar); //
                                        PRICE2_Shift              = HighestBar;
                                        Range_All = Price2 - Price1; //
                              }
                              else
                              {         Time1                     = iTime(        StSymbol.Current, f, HighestBar); // Time[50];
                                        Time2                     = iTime(        StSymbol.Current, f, LowestBar  ); // Time[50];
                                        Price1                    = iHigh(        StSymbol.Current, f, HighestBar); //
                                        Price2                    = iLow(         StSymbol.Current, f, LowestBar); //
                                        PRICE2_Shift              = LowestBar;
                                        Range_All = Price1 - Price2; //
                              }
                              //---.................................................................................................
                              if(Is_Bulish)
                              {         int LowestBar3            = iLowest(      StSymbol.Current, f, MODE_LOW, HighestBar, 0);
                                        Price3                    = iLow(         StSymbol.Current, f, LowestBar3); //
                                        Time3                     = iTime(        StSymbol.Current, f, LowestBar3); // Time[50];
                                        Range_2_3                 = Price2 - Price3; //
                              }
                              else
                              {         int HighestBar3           = iHighest(     StSymbol.Current, f, MODE_HIGH, LowestBar, 0);
                                        Price3                    = iHigh(        StSymbol.Current, f, HighestBar3); //
                                        Time3                     = iTime(        StSymbol.Current, f, HighestBar3); // Time[50];
                                        Range_2_3                 = Price3 - Price2; //
                              } //
                              if(Range_All > 0) {Percent_Retrece_3 = Range_2_3 / Range_All; Percent_Retrece_3 = NormalizeDouble(Percent_Retrece_3 * 100, 1);  Percent_Retrece_3_Desc = DoubleToStr(Percent_Retrece_3, 1);       Percent_Retrece_3_Desc =  Percent_Retrece_3_Desc + "%"; } //
                    }
                    //*******************************************************************************************************************
                    //--cheack is confirmed..
                    if(Is_Bulish)
                    {         if(Price3 < Price1)
                              {         //--   Alert(__FUNCTION__ + " ----Not confirmed Fibo exp----"); //
                              }
                              ///
                    }
                    else
                    {         if(Price3 > Price1)
                              {         Cg_TextsDescription Description;
                                        {         Description.GDS.IsCreated = false;
                                                  Description.GDS.Set_Action_2(MODE_CREATE, true);//---DescX
                                                  Description.GDS.Set_Desc_4( "Not confirmed Fibo exp", "Not confirmed Fibo exp", "Arial", 10);//--"TEXTs.Description " +
                                                  Description.GDS.Set_Color_1(clrYellow);
                                                  Description.GDS.Set_Location_4(Time2, Price2 - 3, 0, ANCHOR_LEFT);
                                                  Description.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-"  + "Not confirmed Fibo exp");
                                                  Description.GDS.Set_Chart_6();
                                                  Description.GDS.Set_ToDelete_1(false);
                                                  Description.Action(Description); //
                                        }//
                                        //--Alert(__FUNCTION__ + " ----Not confirmed Fibo exp----"); //
                              }//
                    }//
                    clrr = Is_Bulish ? clrGreen : clrRed;
                    //---
                    TIME1       = Time1;                //0       datetime        Datetime value to set/get first coordinate time part
                    PRICE1      = Price1;               //1       double          Double value to set/get first coordinate price part
                    TIME2       = Time2;                //2       datetime        Datetime value to set/get second coordinate time part
                    PRICE2      = Price2;               //3       double          Double value to set/get second coordinate price part
                    //--- OBJ_TRIANGLE && OBJ_TRIANGLE && OBJ_ELLIPSE
                    TIME3       = Time3;
                    PRICE3      = Price3;
                    //---
                    return true; //
          }

          bool  SetLocation(datetime Time1, double Price1, datetime Time2, double Price2, datetime Time3, double Price3)
          {         if(IsCreated)return false;
                    TIME1       = Time1;                //0       datetime        Datetime value to set/get first coordinate time part
                    PRICE1      = Price1;               //1       double          Double value to set/get first coordinate price part
                    TIME2       = Time2;                //2       datetime        Datetime value to set/get second coordinate time part
                    PRICE2      = Price2;               //3       double          Double value to set/get second coordinate price part
                    //--- OBJ_TRIANGLE && OBJ_TRIANGLE && OBJ_ELLIPSE
                    TIME3       = Time3;
                    PRICE3      = Price3;
                    Is_Bulish = (PRICE2 > PRICE1) ? true : false;
                    return true; //
          };
          //---
          //---
          bool  CalcLevels()
          {         //---
                    //--- successful execution
                    {         if(Is_Level_Full)
                              {         levels = 29; int idx = 0;
                                        ArrayResize(values, levels, 0 );
                                        ArrayResize(colors, levels, 0 );
                                        ArrayResize(styles, levels, 0 );
                                        ArrayResize(widths, levels, 0 ); //
                                        ArrayResize(Price, levels, 0 ); //
                                        values[idx]       =       0.0;    // 1    idx=0;
                                        values[++idx]     =       0.236;  // 2     sl ! Is_Bulish  //1
                                        values[++idx]     =       0.382;  // 3
                                        values[++idx]     =       0.618;  // 4     tp1  Is_Bulish  //3
                                        values[++idx]     =       0.782;  // 5
                                        values[++idx]     =       1.0;    // 6     tp2  Is_Bulish  //5
                                        values[++idx]     =       1.236;  // 7
                                        values[++idx]     =       1.382;  // 8
                                        values[++idx]     =       1.618;  // 9     tp3  Is_Bulish  //8
                                        values[++idx]     =       2.236;  // 10
                                        values[++idx]     =       2.382;  // 11
                                        values[++idx]     =       2.618;  // 12
                                        values[++idx]     =       3.236;  // 13
                                        values[++idx]     =       3.382;  // 14
                                        values[++idx]     =       3.618;  //---15 ok
                                        //--
                                        values[++idx]     =       -0.236;  // 16   sl Is_Bulish    //15
                                        values[++idx]     =       -0.382;  // 17
                                        values[++idx]     =       -0.618;  // 18   tp1  !Is_Bulish //17
                                        values[++idx]     =       -0.782;  // 19
                                        values[++idx]     =       -1.0;    // 20   tp2  !Is_Bulish //19
                                        values[++idx]     =       -1.236;  // 21
                                        values[++idx]     =       -1.382;  // 22
                                        values[++idx]     =       -1.618;  // 23   tp3  !Is_Bulish //22
                                        values[++idx]     =       -2.236;  // 24
                                        values[++idx]     =       -2.382;  // 25
                                        values[++idx]     =       -2.618;  // 26
                                        values[++idx]     =       -3.236;  // 27
                                        values[++idx]     =       -3.382;  // 28
                                        values[++idx]     =       -3.618; // --29 ok
                              } //
                              else
                              {         levels = 15;
                                        ArrayResize(values, levels, 0 );
                                        ArrayResize(colors, levels, 0 );
                                        ArrayResize(styles, levels, 0 );
                                        ArrayResize(widths, levels, 0 ); //
                                        ArrayResize(Price, levels, 0 ); //
                                        values[0] =          0.0;          // idx=0;
                                        values[1] =          0.382;
                                        values[2] =          0.618;
                                        values[3] =          0.782;
                                        values[4] =          1.0;
                                        values[5] =          1.618;
                                        values[6] =          2.618;
                                        values[7] =          3.618;
                                        //--
                                        values[8] =         -0.382;
                                        values[9] =         -0.618;
                                        values[10] =        -0.782;
                                        values[11] =        -1.0;
                                        values[12] =        -1.618;
                                        values[13] =        -2.618;
                                        values[14] =        -3.618; //
                              }
                              //--- set the number of levels
                              ObjectSetInteger(ChartData_ChartInfo.ID, NAME_A_01, OBJPROP_LEVELS, levels);
                              //--- set the properties of levels in the loop
                              for(int idx = 0; idx < levels; idx++)
                              {         string Desc = DoubleToString(100 * values[idx], 2) + "  %$";
                                        colors[idx] = clrr_level;     // color of level lines
                                        styles[idx] = STYLE_DASH;      // style of level lines
                                        widths[idx] = 1;       // width of level lines
                                        ObjectSetDouble (ChartData_ChartInfo.ID, NAME_A_01, OBJPROP_LEVELVALUE, idx, values[idx]);  //--- level value
                                        ObjectSetInteger(ChartData_ChartInfo.ID, NAME_A_01, OBJPROP_LEVELCOLOR, idx, colors[idx]); //--- level color
                                        ObjectSetInteger(ChartData_ChartInfo.ID, NAME_A_01, OBJPROP_LEVELSTYLE, idx, styles[idx]); //--- level style
                                        ObjectSetInteger(ChartData_ChartInfo.ID, NAME_A_01, OBJPROP_LEVELWIDTH, idx, widths[idx]); //--- level width
                                        ObjectSetString (ChartData_ChartInfo.ID, NAME_A_01, OBJPROP_LEVELTEXT,  idx, Desc); //   //--- level description
                                        double diff = values[idx] * MathAbs(PRICE2 - PRICE1);
                                        Price[idx] = NormalizeDouble(PRICE3 + diff, 2); //
                                        ///
                              }
                              //---
                              return true;//
                    }//
          }
          bool                  SetLevels() {return true;}
          bool                  Set_Chart_6(long timeframe_41 = 0, string symbol_42 = "", datetime createtime_43 = 0, ENUM_OBJECT typr_44 = 0, long chart_45 = 0, int subwindow_46 = 0)
          {         if(IsCreated)return false;
                    TIMEFRAMES_O_00               /*= FRAME.TIMEFRAMES*/      = Period();
                    SYMBOL_O_00                   /*= FRAME.SYMBOL*/          = Symbol();
                    CREATETIME_O_00               /*= FRAME.CREATETIME*/      = TimeLocal();
                    TYPE_O_00                     /*= FRAME.TYPE*/            = OBJ_EXPANSION;
                    CHART_O_00                    /*= FRAME.CHART*/           = ChartData_ChartInfo.ID;
                    SUBWINDOW_O_00                /*= FRAME.SUBWINDOW*/       = ChartData_ChartInfo.SubWindow;
                    //
                    return IS_Set_Chart_6_55 = true; //
          };
          bool  Setup()
          {
                    {         //any type
                              ObjectSetInteger(ChartData_ChartInfo.ID, NAME_A_01, OBJPROP_BACK,         BACK_G_00);
                              ObjectSetInteger(ChartData_ChartInfo.ID, NAME_A_01, OBJPROP_SELECTABLE,   SELECTABLE_G_00);
                              ObjectSetInteger(ChartData_ChartInfo.ID, NAME_A_01, OBJPROP_SELECTED,     SELECTED_G_00);
                              //---off---ObjectSetInteger(ChartData_ChartInfo.ID, NAME_A_01, OBJPROP_HIDDEN,       HIDDEN_G_00);
                              ObjectSetInteger(ChartData_ChartInfo.ID, NAME_A_01, OBJPROP_ZORDER,       ZORDER_G_00);
                              ObjectSetString( ChartData_ChartInfo.ID, NAME_A_01, OBJPROP_TOOLTIP,      TOOLTIP_G_00);//
                    }
                    {         //any type
                              //---off---  go.GAC.Background(go.GDS.BACK_G_00);          //ObjectSetInteger(ChartData_ChartInfo.ID, NAME, OBJPROP_BACK, BACK);
                              //---off---  go.GAC.Selectable(go.GDS.SELECTABLE_G_00);    //ObjectSetInteger(ChartData_ChartInfo.ID, NAME, OBJPROP_SELECTABLE, SELECTABLE);
                              //---off---  go.GAC.Selected(go.GDS.SELECTED_G_00);        //ObjectSetInteger(ChartData_ChartInfo.ID, NAME, OBJPROP_SELECTED, SELECTED);
                              //---off---  go.GAC.Hidden(go.GDS.HIDDEN_G_00);            //ObjectSetInteger(ChartData_ChartInfo.ID, NAME, OBJPROP_HIDDEN, HIDDEN);
                              //---off---  go.GAC.Z_Order(go.GDS.ZORDER_G_00);           //ObjectSetInteger(ChartData_ChartInfo.ID, NAME, OBJPROP_ZORDER, ZORDER);
                              //---off---  go.GAC.Tooltip(go.GDS.TOOLTIP_G_00);          //ObjectSetString(ChartData_ChartInfo.ID,  NAME, OBJPROP_TOOLTIP, TOOLTIP);//
                    }//
                    //---
                    {         //any type
                              ObjectSetInteger  (ChartData_ChartInfo.ID,  NAME_A_01, OBJPROP_COLOR,     COLOR_C_00);
                              ObjectSetInteger  (ChartData_ChartInfo.ID,  NAME_A_01, OBJPROP_STYLE,     STYLE_9);
                              ObjectSetInteger  (ChartData_ChartInfo.ID,  NAME_A_01, OBJPROP_WIDTH,     WIDTH_10);//
                              ObjectSetInteger  (ChartData_ChartInfo.ID,  NAME_A_01, OBJPROP_RAY_RIGHT, RAY_RIGHT_11);//
                    }
                    {         ObjectSetInteger  (ChartData_ChartInfo.ID, NAME_A_01, OBJPROP_TIME1,      TIME1);
                              ObjectSetDouble   (ChartData_ChartInfo.ID, NAME_A_01, OBJPROP_PRICE1,     PRICE1);
                              ObjectSetInteger  (ChartData_ChartInfo.ID, NAME_A_01, OBJPROP_TIME2,      TIME2);
                              ObjectSetDouble   (ChartData_ChartInfo.ID, NAME_A_01, OBJPROP_PRICE2,     PRICE2); //
                    }
                    CalcLevels();//
                    return true;//
          }
          //============================================================================================================
          //OBJECT.Color(COLOR);            //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_COLOR, COLOR);
          //OBJECT.Style(STYLE);            //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_STYLE, STYLE);
          //OBJECT.Width(Width);            //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_WIDTH, WIDTH);//
          ////----------------------------------
          //OBJECT.RayRight(RAY_RIGHT);/*ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_RAY_RIGHT, RAY_RIGHT);*/
          ////----------------------------------
          //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_BACK, BACK);
          //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_SELECTABLE, SELECTABLE);
          //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_SELECTED, SELECTED);
          //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_HIDDEN, HIDDEN);
          //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_ZORDER, ZORDER);
          //ObjectSetString(ChartData_ChartInfo.ID,  OBJ.CName, OBJPROP_TOOLTIP, TOOLTIP);//
          //============================================================================================================
};
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(MQL4)\Include\ChartObjects\ChartObjectsFibo.mqh>
class C_FibosExpansion: public __COBFA__<S_FIBO_EXPANSION>
{
//===================================================================
private:
          string                                m_name;
          int                                   m_index;
public:
          void                                  C_FibosExpansion() {};
          void                                  ~C_FibosExpansion() {if(Capitan_DeinitErrorCatching)________________________________________________________Xerorr.SuperviserX(_LastError, "-C_FibosExpansion Error",  __LINE__, __FUNCTION__); }

          CChartObjectFiboExpansion             GAC;   ///---CChartObjectFibo
          S_FIBO_EXPANSION                      GDS;

          Sgtd_FiboExpansion_data_Periods      _Periods;
          void                                  SetupSignal();




          bool                                  Is_Bulish;//       = Time2 > Time2;        !   = Time2 < Time2;
          Sgtdf_FIBO_EXPANSION_Data             _Data;

          bool       CALC_Cordinate(Sgtd_FIBO_EXPANSION_Calc &Calc);
          bool       Create(int                WhichMode       = MODE_CREATE,
                            bool               IsKey           = false,
                            string             Name            = "FiboExpansion",
                            ENUM_TIMEFRAMES    PeriodTF     = PERIOD_CURRENT,
                            int                CalcMode        = 3,
                            bool               Background      = false,
                            bool               Fill            = false,
                            ENUM_LINE_STYLE    style           = STYLE_DASH,
                            int                Width           = 1,
                            color              DescColorIN     =  C'36, 52, 69',
                            color              DescColorNeg    = clrRed,
                            double             Angle           = 0,
                            int                FontSize        = 7,
                            string             Font            = "Arial");

          int                                   BarCount ;
          int                                   BarStart ;

          bool  Calc_History_Gap(Sgtd_FIBO_EXPANSION_Calc &Calc);
          void  SetFractals();
          bool  RealCalc(Sgtd_FIBO_EXPANSION_Calc &Calc);
          template<typename Client>void  Set_Cordinate(Client & client, Sgtd_FIBO_EXPANSION_Calc &Calc);


          void Set_Gap(HistoryGap_Data & _Data_,  string TFXHistoryGapDesc, bool TFXHistoryGapValue)
          {         _Data_.HistoryGap_Desc  = TFXHistoryGapDesc ;
                    _Data_.Is_HistoryGap    = TFXHistoryGapValue;//
          }

          //---[---Fibos.Expansion---]
          void Draw_GDS(int WhichMode, bool IsKey, string n, int  AddBar, int StartBar, bool Is_Delete, bool back)
          {         GDS.Set_Action_2(WhichMode, IsKey);
                    GDS.Set_Desc_1("Fibos.Expansion" + n);
                    GDS.Set_Model_3(STYLE_DASHDOTDOT, 1, false);
                    GDS.Set_RayRight_1(false);
                    GDS.SetLevelsCount(9);
                    GDS.SetLevelsFull(true);
                    GDS.Calc_Locations(PERIOD_CURRENT, AddBar, StartBar);
                    GDS.clrr       = GDS.Is_Bulish ? clrChartreuse : clrCrimson;
                    GDS.clrr_level = GDS.Is_Bulish ? clrLime : clrOrange;
                    GDS.Set_Color_1(GDS.clrr);
                    //---
                    GDS.Set_Common_6(back, 100, true, false, true, Expansion_DEF_tooltip + "Fibos.Expansion" + n);
                    GDS.Set_Chart_6();
                    GDS.Set_ToDelete_1(Is_Delete);
                    GDS.Set_Signal_1(true);
                    //Alert("----    ----");
                    Action(this);//
                    //--off-- GDS.Setup();
                    //Alert("----    ----");
                    //---
          } //
          //----
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_FibosExpansion::SetupSignal()
{         //Alert("C_FibosExpansion----SetUpSiognal():------OK "  );
          if(GDS.Is_Bulish)     { _Periods._CURRENT._Signal.sl  = NormalizeDouble(GDS.PRICE3 - ObjectGetDouble(ChartData_ChartInfo.ID, GDS.NAME_A_01, OBJPROP_LEVELVALUE, 1 )  * GDS.Range_All, Digits); }//--- level value ; /
          else                  { _Periods._CURRENT._Signal.sl  = NormalizeDouble(GDS.PRICE3 - ObjectGetDouble(ChartData_ChartInfo.ID, GDS.NAME_A_01, OBJPROP_LEVELVALUE, 15 ) * GDS.Range_All, Digits); } //--- level value ; /
          //Alert(_Periods._CURRENT._Signal.sl);
          if(GDS.Is_Bulish)     { _Periods._CURRENT._Signal.tp1 = NormalizeDouble(GDS.PRICE3 - ObjectGetDouble(ChartData_ChartInfo.ID, GDS.NAME_A_01, OBJPROP_LEVELVALUE, 17 ) * GDS.Range_All, Digits); }//--- level value ; /
          else                  { _Periods._CURRENT._Signal.tp1 = NormalizeDouble(GDS.PRICE3 - ObjectGetDouble(ChartData_ChartInfo.ID, GDS.NAME_A_01, OBJPROP_LEVELVALUE, 3 )  * GDS.Range_All, Digits); } //--- level value ; /
          //Alert(_Periods._CURRENT._Signal.tp1);
          if(GDS.Is_Bulish)     { _Periods._CURRENT._Signal.tp2 = NormalizeDouble(GDS.PRICE3 - ObjectGetDouble(ChartData_ChartInfo.ID, GDS.NAME_A_01, OBJPROP_LEVELVALUE, 19 ) * GDS.Range_All, Digits); }//--- level value ; /
          else                  { _Periods._CURRENT._Signal.tp2 = NormalizeDouble(GDS.PRICE3 - ObjectGetDouble(ChartData_ChartInfo.ID, GDS.NAME_A_01, OBJPROP_LEVELVALUE, 5 )  * GDS.Range_All, Digits); } //--- level value ; /
          //Alert(_Periods._CURRENT._Signal.tp2);
          if(GDS.Is_Bulish)     { _Periods._CURRENT._Signal.tp3 = NormalizeDouble(GDS.PRICE3 - ObjectGetDouble(ChartData_ChartInfo.ID, GDS.NAME_A_01, OBJPROP_LEVELVALUE, 22 ) * GDS.Range_All, Digits); }//--- level value ; /
          else                  { _Periods._CURRENT._Signal.tp3 = NormalizeDouble(GDS.PRICE3 - ObjectGetDouble(ChartData_ChartInfo.ID, GDS.NAME_A_01, OBJPROP_LEVELVALUE, 8 )  * GDS.Range_All, Digits); } //--- level value ; /
          //Alert(_Periods._CURRENT._Signal.tp3);
          //
}
//+------------------------------------------------------------------+
//|                                                                  |MODE==MODE_MOVE && IsKey
//+------------------------------------------------------------------+
bool C_FibosExpansion::Create(int                WhichMode       = MODE_CREATE,
                              bool               IsKey           = false,
                              string             Name            = "FiboExpansion",
                              ENUM_TIMEFRAMES    PeriodTF        = PERIOD_CURRENT,
                              int                CalcMode        = 3,
                              bool               Background      = false,
                              bool               Fill            = false,
                              ENUM_LINE_STYLE    style           = STYLE_DASH,
                              int                Width           = 1,
                              color              DescColorIN     =  C'36, 52, 69',
                              color              DescColorNeg    = clrRed,
                              double             Angle           = 0,
                              int                FontSize        = 7,
                              string             Font            = "Arial")
{         bool IsDone = false;
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_Fibo Error",  __LINE__, __FUNCTION__); //|
//==================================================================================================================|
          string Description = Name;
          //---[attribes Calcing Cordinate]
          Sgtd_FIBO_EXPANSION_Calc Calc;
          Calc.CalcMode         = CalcMode;
          Calc.Price1           = 0;
          Calc.Time1            = 0;
          Calc.Price2           = 0;
          Calc.Time2            = 0;
          Calc.Price3           = 0;
          Calc.Time3            = 0;
          Calc.PriceMean        = 0;
          Calc.TimeMean         = 0;
          Calc.PeriodTF         = PeriodTF;
          //
          //
          bool CalcedValues = CALC_Cordinate(Calc);  //return false;//
          IsDone = CalcedValues;
          if(!IsDone)Cat.say("CALC_Cordinate failed : C_FibosExpansion::Create(...)");
          //
          //
          //
          //
          //---[attribes Setting Cordinate]
          switch(PeriodTF)
          {         case  PERIOD_CURRENT:     { Set_Cordinate(_Periods._CURRENT,        Calc); } break; //
                    case  PERIOD_MN1:         { Set_Cordinate(_Periods._MN1,            Calc); } break; //
                    case  PERIOD_W1:          { Set_Cordinate(_Periods._W1,             Calc); } break; //
                    case  PERIOD_D1:          { Set_Cordinate(_Periods._D1,             Calc); } break; //
                    case  PERIOD_H4:          { Set_Cordinate(_Periods._H4,             Calc); } break; //
                    case  PERIOD_H1:          { Set_Cordinate(_Periods._H1,             Calc); } break; //
                    case  PERIOD_M30:         { Set_Cordinate(_Periods._M30,            Calc); } break; //
                    case  PERIOD_M15:         { Set_Cordinate(_Periods._M15,            Calc); } break; //
                    case  PERIOD_M5:          { Set_Cordinate(_Periods._M5,             Calc); } break; //
                    case  PERIOD_M1:          { Set_Cordinate(_Periods._M1,             Calc); } break; //
          }
          //
          //
          //---[attribes Creating  Moving  Deleting ]
          bool b = (ObjectFind(ChartData_ChartInfo.ID, Name) >= 0);
          //
          if(IsTesterDebug) {Print("__DEBUG__TESTER__", __FUNCTION__, " ", __LINE__);}
          //
          {         //
                    //
                    ////---[attribes Moving]
                    //
                    if(IsTesterDebug) {Print("__DEBUG__TESTER__", __FUNCTION__, " ", __LINE__);}
                    //
                    //if(WhichMode == MODE_MOVE && IsKey && ObjectFind(ChartData_ChartInfo.ID, Name) >= 0 )
                    //{         //
                    //          if(IsTesterDebug) {Print("__DEBUG__TESTER__", __FUNCTION__, " ", __LINE__);}
                    //          //
                    //          int CordinateXone = 0; int  CordinateYone = 0;
                    //          int CordinateXtwo = 0; int  CordinateYtwo = 0;
                    //          Dev_Chart_Window.TimePrice_To_XY(Calc.Time1, Calc.Price1, CordinateXone, CordinateYone);
                    //          Dev_Chart_Window.TimePrice_To_XY(Calc.Time2, Calc.Price2, CordinateXtwo, CordinateYtwo);
                    //          //
                    //          if(IsTesterDebug) {Print("__DEBUG__TESTER__", __FUNCTION__, " ", __LINE__);}
                    //          //
                    //          ObjectSetInteger(0, Name, OBJPROP_XDISTANCE, CordinateXone);//Label_.X_Distance(XCordinate);
                    //          ObjectSetInteger(0, Name, OBJPROP_YDISTANCE, CordinateYone);////Label_.Y_Distance(YCordinate); //
                    //          //
                    //          if(IsTesterDebug) {Print("__DEBUG__TESTER__", __FUNCTION__, " ", __LINE__);}
                    //          //
                    //          return true;//
                    //}
                    if(IsTesterDebug) {Print("__DEBUG__TESTER__", __FUNCTION__, " ", __LINE__);}
                    //---[attribes Deleting]
                    if(WhichMode == MODE_CREATE && !IsKey && ObjectFind(ChartData_ChartInfo.ID, Name) >= 0 ) {return ObjectDelete(ChartData_ChartInfo.ID, Name);}
                    //
                    if(IsTesterDebug) {Print("__DEBUG__TESTER__", __FUNCTION__, " ", __LINE__);}
                    //
                    //---[attribes Creating]
                    if(WhichMode == MODE_CREATE &&  IsKey && CalcedValues )
                    {         if(ObjectFind(ChartData_ChartInfo.ID, Name) < 0)
                              {         //
                                        if(IsTesterDebug) {Print("__DEBUG__TESTER__", __FUNCTION__, " ", __LINE__);}
                                        //
                                        bool IsCreated = GAC.Create(ChartData_ChartInfo.ID, Name, ChartData_ChartInfo.SubWindow,
                                                                    Calc.Time1, Calc.Price1,
                                                                    Calc.Time2, Calc.Price2,
                                                                    Calc.Time3, Calc.Price3);
                                        //
                                        if(IsTesterDebug) {Print("__DEBUG__TESTER__", __FUNCTION__, " ", __LINE__);}
                                        //
                                        //---
                                        if(!IsCreated)        { ________________________________________________________Xerorr.SuperviserX(_LastError, "C_Fibo Error",  __LINE__, __FUNCTION__); Cat.say("---!IsCreated---C_FibosExpansion::Create(...)----");}//
                              }
                              //
                              if(IsTesterDebug) {Print("__DEBUG__TESTER__", __FUNCTION__, " ", __LINE__);}
                              //
                              //=========================================================|
                              if(ObjectFind(ChartData_ChartInfo.ID, Name) >= 0)
                              {         //======================
                                        //
                                        if(IsTesterDebug) {Print("__DEBUG__TESTER__", __FUNCTION__, " ", __LINE__);}
                                        //
                                        if(Is_Bulish)GAC.Color(DescColorIN);
                                        else GAC.Color(DescColorNeg);
                                        GAC.Fill(Fill);
                                        GAC.Z_Order(3);
                                        GAC.SetInteger(OBJPROP_STYLE, 1);
                                        GAC.Style(style);
                                        GAC.Width(Width);
                                        GAC.Description(Description);
                                        GAC.Selectable(true);
                                        GAC.Z_Order(1);
                                        GAC.Background(Background); //
                                        GAC.Hidden(true);//---Bug--Notworking
                                        //======================
                                        Dev_Object.FiboService.FiboLeveler(GAC, Name, Width, style, DescColorIN, DescColorNeg, Is_Bulish) ;
                                        //
                                        if(IsTesterDebug) {Print("__DEBUG__TESTER__", __FUNCTION__, " ", __LINE__);}
                                        //
                                        return true;//
                                        //======================
                              }//
                    }//
          }//
          //
          if(IsTesterDebug) {Print("__DEBUG__TESTER__", __FUNCTION__, " ", __LINE__);}
          //
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_Fibo Error",  __LINE__, __FUNCTION__); //|
          return true; //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
template<typename Client>
void C_FibosExpansion::Set_Cordinate(Client & client, Sgtd_FIBO_EXPANSION_Calc &Calc)
{         //
          client.C1._Price        = Calc.Price1;
          client.C1._Time         = Calc.Time1;
          client.C2._Price        = Calc.Price2;
          client.C2._Time         = Calc.Time2;
          client.C3._Price        = Calc.Price3;
          client.C3._Time         = Calc.Time3;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_FibosExpansion::CALC_Cordinate(Sgtd_FIBO_EXPANSION_Calc &Calc)
{         bool IsDone = false;
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_Fibo Error",  __LINE__, __FUNCTION__); //|
          //---Frist(start Wave)-Secound(end Wave)-Third(retrecment Wave)-Forth(runing price)////points cordinate need,,
          //---Need points >>HIGH & LOW & CurrentPrice && High between Current and secound point
          //
          //
          //---off---Calc_History_Gap(Calc);  //[---historyGap---]
          //
          //
          //[---fractals---]//ThirdBarmean= SecondBar - _Data.__Calc_Forth_Bar; ///Need Fractal Bars in Range...
          //---off---SetFractals();
          //
          //
          IsDone = RealCalc(Calc);
          //
          //
          if(!IsDone)Cat.say("CALC_Cordinate failed : C_FibosExpansion::Create(...)");
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_Fibo Error",  __LINE__, __FUNCTION__); //|
          return true;
//=========================================================|
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_FibosExpansion::Calc_History_Gap(Sgtd_FIBO_EXPANSION_Calc &Calc)
{         //[---historyGap---]
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_Fibo Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          //if(TimeCurrent() - 60 <= iTime(NULL, PERIOD_M1, 0))Alert("TimeCurrent() == Time[0]: ", TimeCurrent() == Time[0]); //
          //Alert("TimeCurrent() == Time[0]: >>", TimeCurrent(), "TimeCurrent()==Time[0]" ,Time[0],"-TimeGMT():",TimeGMT(),"-TimeLocal():",TimeLocal()); //
          ///===================Findeout Last Candel from server is existed..>>>>==========
          //#1 Server last Time>>>TimeCurrent()
          //#2 Time[0] of every period //
          //#3 #1 && #2 must near // Server last Time
          //#3 existing selected candel.///?
          //#5 if #3 not currect must update else run calcing points//
          //---------------------------------------------------------------
          datetime ServerlastTime              = TimeCurrent();//
          datetime PERIOD_CURRENT_Time0Candel  = iTime(NULL, PERIOD_CURRENT, 0);//
          datetime PERIOD_MN1_Time0Candel      = iTime(NULL, PERIOD_MN1, 0);//
          datetime PERIOD_W1_Time0Candel       = iTime(NULL, PERIOD_W1, 0);//
          datetime PERIOD_D1_Time0Candel       = iTime(NULL, PERIOD_D1, 0);//
          datetime PERIOD_H4_Time0Candel       = iTime(NULL, PERIOD_H4, 0);//
          datetime PERIOD_H1_Time0Candel       = iTime(NULL, PERIOD_H1, 0);//
          datetime PERIOD_M30_Time0Candel      = iTime(NULL, PERIOD_M30, 0);//
          datetime PERIOD_M15_Time0Candel      = iTime(NULL, PERIOD_M15, 0);//
          datetime PERIOD_M5_Time0Candel       = iTime(NULL, PERIOD_M5, 0);//
          datetime PERIOD_M1_Time0Candel       = iTime(NULL, PERIOD_M1, 0);//
          //-------------------------------------------------------------------------
          bool historyGapPERIOD_CURRENT       = -1 == iBarShift( NULL, PERIOD_CURRENT, TimeCurrent(), true);
          bool historyGapPERIOD_MN1           = -1 == iBarShift( NULL, PERIOD_MN1, TimeCurrent(), true);
          bool historyGapPERIOD_W1            = -1 == iBarShift( NULL, PERIOD_W1, TimeCurrent(), true);
          bool historyGapPERIOD_D1            = -1 == iBarShift( NULL, PERIOD_D1, TimeCurrent(), true);
          bool historyGapPERIOD_H4            = -1 == iBarShift( NULL, PERIOD_H4, TimeCurrent(), true);
          bool historyGapPERIOD_H1            = -1 == iBarShift( NULL, PERIOD_H1, TimeCurrent(), true);
          bool historyGapPERIOD_M30           = -1 == iBarShift( NULL, PERIOD_M30, TimeCurrent(), true);
          bool historyGapPERIOD_M15           = -1 == iBarShift( NULL, PERIOD_M15, TimeCurrent(), true);
          bool historyGapPERIOD_M5            = -1 == iBarShift( NULL, PERIOD_M5, TimeCurrent(), true);
          bool historyGapPERIOD_M1            = -1 == iBarShift( NULL, PERIOD_M1, TimeCurrent(), true);
          //============
          int OffsetCandel                    = BarCount / 10; //10;//BarCount///there 10% of candels Offsett not existed
          int OffsetCandelPERIOD_CURRENT      = PERIOD_CURRENT * 60 * OffsetCandel;
          int OffsetCandelPERIOD_MN1          = PERIOD_MN1 * 60 * OffsetCandel;
          int OffsetCandelPERIOD_W1           = PERIOD_W1 * 60 * OffsetCandel;
          int OffsetCandelPERIOD_D1           = PERIOD_D1 * 60 * OffsetCandel;
          int OffsetCandelPERIOD_H4           = PERIOD_H4 * 60 * OffsetCandel;
          int OffsetCandelPERIOD_H1           = PERIOD_H1 * 60 * OffsetCandel;
          int OffsetCandelPERIOD_M30          = PERIOD_M30 * 60 * OffsetCandel;
          int OffsetCandelPERIOD_M15          = PERIOD_M15 * 60 * OffsetCandel;
          int OffsetCandelPERIOD_M5           = PERIOD_M5 * 60 * OffsetCandel;
          int OffsetCandelPERIOD_M1           = PERIOD_M1 * 60 * OffsetCandel;
          //=============
          bool historyGapOffsetCandelPERIOD_CURRENT = -1 == iBarShift( NULL, PERIOD_CURRENT, TimeCurrent() - OffsetCandelPERIOD_CURRENT, true);
          bool historyGapOffsetCandelPERIOD_MN1     = -1 == iBarShift( NULL, PERIOD_MN1, TimeCurrent() - OffsetCandelPERIOD_MN1, true);
          bool historyGapOffsetCandelPERIOD_W1      = -1 == iBarShift( NULL, PERIOD_W1, TimeCurrent() - OffsetCandelPERIOD_W1, true);
          bool historyGapOffsetCandelPERIOD_D1      = -1 == iBarShift( NULL, PERIOD_D1, TimeCurrent() - OffsetCandelPERIOD_D1, true);
          bool historyGapOffsetCandelPERIOD_H4      = -1 == iBarShift( NULL, PERIOD_H4, TimeCurrent() - OffsetCandelPERIOD_H4, true);
          bool historyGapOffsetCandelPERIOD_H1      = -1 == iBarShift( NULL, PERIOD_H1, TimeCurrent() - OffsetCandelPERIOD_H1, true);
          bool historyGapOffsetCandelPERIOD_M30     = -1 == iBarShift( NULL, PERIOD_M30, TimeCurrent() - OffsetCandelPERIOD_M30, true);
          bool historyGapOffsetCandelPERIOD_M15     = -1 == iBarShift( NULL, PERIOD_M15, TimeCurrent() - OffsetCandelPERIOD_M15, true);
          bool historyGapOffsetCandelPERIOD_M5      = -1 == iBarShift( NULL, PERIOD_M5, TimeCurrent() - OffsetCandelPERIOD_M5, true);
          bool historyGapOffsetCandelPERIOD_M1      = -1 == iBarShift( NULL, PERIOD_M1, TimeCurrent() - OffsetCandelPERIOD_M1, true);
          //================
          //
          bool   TFXHistoryGapValue = false;
          string TFXHistoryGapDesc  = ""; //
          if(Utilities.TimeFrameUpdating() && 0)
          {         if(historyGapPERIOD_CURRENT) Alert("historyGapPERIOD_CURRENT: ",  historyGapPERIOD_CURRENT,       "--//PeriodTF: ", Calc.PeriodTF); //
                    if(historyGapPERIOD_W1)      Alert("historyGapPERIOD_W1: ",       historyGapPERIOD_W1,            "--//PeriodTF: ", Calc.PeriodTF); //
                    if(historyGapPERIOD_D1)      Alert("historyGapPERIOD_W1: ",       historyGapPERIOD_W1,            "--//PeriodTF: ", Calc.PeriodTF); //
                    if(historyGapPERIOD_H4)      Alert("historyGapPERIOD_H4: ",       historyGapPERIOD_H4,            "--//PeriodTF: ", Calc.PeriodTF); //
                    if(historyGapPERIOD_H1)      Alert("historyGapPERIOD_H1: ",       historyGapPERIOD_H1,            "--//PeriodTF: ", Calc.PeriodTF); //
                    if(historyGapPERIOD_M30)     Alert("historyGapPERIOD_M30: ",      historyGapPERIOD_M30,           "--//PeriodTF: ", Calc.PeriodTF); //
                    if(historyGapPERIOD_M15)     Alert("historyGapPERIOD_M15: ",      historyGapPERIOD_M15,           "--//PeriodTF: ", Calc.PeriodTF); //
                    if(historyGapPERIOD_M5)      Alert("historyGapPERIOD_M5: ",       historyGapPERIOD_M5,            "--//PeriodTF: ", Calc.PeriodTF); //
                    if(historyGapPERIOD_M1)      Alert("historyGapPERIOD_M1: ",       historyGapPERIOD_M1,            "--//PeriodTF: ", Calc.PeriodTF); //
          }
          //
          ///===================Findeout Last Candel from server is existed..>>>>==========
          //--------------------------------------------------------------
          datetime LASTBAR_DATE       = (datetime)SeriesInfoInteger(NULL, Calc.PeriodTF, SERIES_LASTBAR_DATE); //
          bool historyGap             = -1 == iBarShift( NULL, Calc.PeriodTF, TimeCurrent(), true);
          bool historyGapOffsetCandel = -1 == iBarShift( NULL, Calc.PeriodTF, TimeCurrent() - Calc.PeriodTF * 60 * OffsetCandel, true);//OffsetCandel defining//
          int trycount = 0;
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_Fibo Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          string PeriodTMComDesc = Utilities.TimeFrameToString(Calc.PeriodTF  );
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_Fibo Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          if (historyGapOffsetCandel || historyGap)
          {         //Alert("historyGap: ", historyGap);//
                    if(IsConnected() && false) {Utilities.TimeFrameUpdating(); Utilities.UpdatesAllTimeFrame();}
                    while(!ct_Series_Base.IsRefreshRate)
                    {         //Alert("RefreshRates-historyGap || historyGapOffsetCandel: ", historyGap, "||", historyGapOffsetCandel, "--///LASTBAR_DATE: ", LASTBAR_DATE, "--//PeriodTF: ", PeriodTMComDesc); //
                              TFXHistoryGapDesc  = "HistoryGap!-Must Update HistoryDatabase: " + _Symbol + "-" + PeriodTMComDesc;//
                              TFXHistoryGapValue = true;//
                              switch(Calc.PeriodTF)
                              {         case  PERIOD_CURRENT: { Set_Gap(_HistoryGap._CURRENT, TFXHistoryGapDesc, TFXHistoryGapValue);   } break; //
                                        case  PERIOD_MN1:     { Set_Gap(_HistoryGap._MN1,     TFXHistoryGapDesc, TFXHistoryGapValue);   } break; // break; ////
                                        case  PERIOD_W1:      { Set_Gap(_HistoryGap._W1,      TFXHistoryGapDesc, TFXHistoryGapValue);   } break; //break; ////
                                        case  PERIOD_D1:      { Set_Gap(_HistoryGap._D1,      TFXHistoryGapDesc, TFXHistoryGapValue);   } break; // break; ////
                                        case  PERIOD_H4:      { Set_Gap(_HistoryGap._H4,      TFXHistoryGapDesc, TFXHistoryGapValue);   } break; // break; ////
                                        case  PERIOD_H1:      { Set_Gap(_HistoryGap._H1,      TFXHistoryGapDesc, TFXHistoryGapValue);   } break; // break; ////
                                        case  PERIOD_M30:     { Set_Gap(_HistoryGap._M30,     TFXHistoryGapDesc, TFXHistoryGapValue);   } break; // break; /////
                                        case  PERIOD_M15:     { Set_Gap(_HistoryGap._M15,     TFXHistoryGapDesc, TFXHistoryGapValue);   } break; // break; ////
                                        case  PERIOD_M5:      { Set_Gap(_HistoryGap._M5,      TFXHistoryGapDesc, TFXHistoryGapValue);   } break; // break; ////
                                        case  PERIOD_M1:      { Set_Gap(_HistoryGap._M1,      TFXHistoryGapDesc, TFXHistoryGapValue);   } break; //break; ////
                              }
                              trycount++;
                              if(trycount > 5) {break; return false;} //<<<exite function///
                              //
                    }; //
          }
          //else
          bool RunCalc = false;
          //(!historyGapPERIOD_CURRENT || !historyGapPERIOD_M1 || !historyGapPERIOD_M5 || !historyGapPERIOD_M15 || !historyGapPERIOD_M30 || !historyGapPERIOD_H1 || !historyGapPERIOD_H4
          // || !historyGapPERIOD_D1 || !historyGapPERIOD_W1 || !historyGapPERIOD_MN1)
          //[--------]
          if(1)
          {         if(0)
                              switch(Calc.PeriodTF)
                              {         case PERIOD_CURRENT: {if(!historyGapPERIOD_CURRENT)   RunCalc = true; else return false; } break;
                                        case PERIOD_MN1:     {if(!historyGapPERIOD_MN1)       RunCalc = true; else return false; } break;
                                        case PERIOD_W1:      {if(!historyGapPERIOD_W1)        RunCalc = true; else return false; } break;
                                        case PERIOD_D1:      {if(!historyGapPERIOD_D1)        RunCalc = true; else return false; } break;
                                        case PERIOD_H4:      {if(!historyGapPERIOD_H4)        RunCalc = true; else return false; } break;
                                        case PERIOD_H1:      {if(!historyGapPERIOD_H1)        RunCalc = true; else return false; } break;
                                        case PERIOD_M30:     {if(!historyGapPERIOD_M30)       RunCalc = true; else return false; } break;
                                        case PERIOD_M15:     {if(!historyGapPERIOD_M15)       RunCalc = true; else return false; } break;
                                        case PERIOD_M5:      {if(!historyGapPERIOD_M5)        RunCalc = true; else return false; } break;
                                        case PERIOD_M1:      {if(!historyGapPERIOD_M1)        RunCalc = true; else return false; } break;//
                              }//
                    if(1)
                              switch(Calc.PeriodTF)
                              {         case PERIOD_CURRENT: {if(!historyGapOffsetCandelPERIOD_CURRENT)       RunCalc = true; else return false; } break;
                                        case PERIOD_MN1:     {if(!historyGapOffsetCandelPERIOD_MN1)           RunCalc = true; else return false; } break;
                                        case PERIOD_W1:      {if(!historyGapOffsetCandelPERIOD_W1)            RunCalc = true; else return false; } break;
                                        case PERIOD_D1:      {if(!historyGapOffsetCandelPERIOD_D1)            RunCalc = true; else return false; } break;
                                        case PERIOD_H4:      {if(!historyGapOffsetCandelPERIOD_H4)            RunCalc = true; else return false; } break;
                                        case PERIOD_H1:      {if(!historyGapOffsetCandelPERIOD_H1)            RunCalc = true; else return false; } break;
                                        case PERIOD_M30:     {if(!historyGapOffsetCandelPERIOD_M30)           RunCalc = true; else return false; } break;
                                        case PERIOD_M15:     {if(!historyGapOffsetCandelPERIOD_M15)           RunCalc = true; else return false; } break;
                                        case PERIOD_M5:      {if(!historyGapOffsetCandelPERIOD_M5)            RunCalc = true; else return false; } break;
                                        case PERIOD_M1:      {if(!historyGapOffsetCandelPERIOD_M1)            RunCalc = true; else return false; } break;//
                              } //
          } //
          //--------------------------------------------------------------------------------------------------------------------------------------
          if(RunCalc)
          {         _Data.__Calc__Frist_HighestBar_Index             = iHighest(StSymbol.Current, Calc.PeriodTF, MODE_HIGH, BarCount, BarStart);
                    _Data.__Calc__Frist_LowestBar_Index              = iLowest(StSymbol.Current, Calc.PeriodTF, MODE_LOW,  BarCount, BarStart);
                    //Alert("PeriodTF: ",Calc.PeriodTF,"--BarCount: ",BarCount,"--BarCount: ",BarCount);//PeriodTF: 240--BarCount: 200--BarCount: 200
                    _Data.__Calc_Third_Bar_Lowest                   = iLowest(StSymbol.Current, Calc.PeriodTF, MODE_LOW,  BarCount = _Data.__Calc__Frist_LowestBar_Index, BarStart);
                    _Data.__Calc_Third_Bar_Highest                  = iHighest(StSymbol.Current, Calc.PeriodTF, MODE_HIGH, BarCount = _Data.__Calc__Frist_HighestBar_Index, BarStart);
                    _Data.__Calc__Time0_Value                  = iTime(StSymbol.Current, Calc.PeriodTF, 0);
                    _Data.__Calc_PeriodTMCom_Time5                  = iTime(StSymbol.Current, Calc.PeriodTF, 5);
                    //-------
                    //string PeriodTMComSymbol = SymbolCome;
                    _Data.__Calc_Forth_Bar                          = iBarShift(NULL, Calc.PeriodTF, _Data.__Calc__Time0_Value); ///_Data.__Calc_Forth_Bar = iBarShift(NULL, Calc.PeriodTF, Time[0]); //Close[0];/////////must defie fore selected periods
                    //-------
                    _Data.__Calc__High0                  = iHigh(StSymbol.Current, Calc.PeriodTF, 0);
                    _Data.__Calc__Frist_High_HighestBar        = iHigh(StSymbol.Current, Calc.PeriodTF, _Data.__Calc__Frist_HighestBar_Index);
                    _Data.__Calc__High_Find_Bar          = iHigh(StSymbol.Current, Calc.PeriodTF,  _Data.__Calc__FindBar_Index);    ///Price3               =  High[_Data.__Calc__FindBar_Index]
                    //--
                    _Data.__Calc__Low0                   = iLow(StSymbol.Current, Calc.PeriodTF, 0);
                    _Data.__Calc__Frist_Low_Lowest_Bar         = iLow(StSymbol.Current, Calc.PeriodTF, _Data.__Calc__Frist_LowestBar_Index);
                    _Data.__Calc__Low_Find_Bar           = iLow(StSymbol.Current, Calc.PeriodTF, _Data.__Calc__FindBar_Index);    ///Price3               =  Low[_Data.__Calc__FindBar_Index]
                    //--
                    _Data.__Calc_PeriodTMCom_Close_Mean             = iClose(StSymbol.Current, Calc.PeriodTF, (_Data.__Calc__Frist_HighestBar_Index + _Data.__Calc__Frist_LowestBar_Index) / 2 ); //   Close[(HighestBar + LowestBar) / 2];//
                    //--
                    _Data.__Calc_PeriodTMCom_Close0                 = iClose(StSymbol.Current, Calc.PeriodTF, 0);
                    _Data.__Calc_PeriodTMCom_Close_Find_Bar0        = iClose(StSymbol.Current, Calc.PeriodTF, _Data.__Calc__FindBar_Index);///_Data.__Calc__FindBar_Index=0;
                    //---
                    _Data.__Calc_PeriodTMCom_Open0                  = iOpen(StSymbol.Current, Calc.PeriodTF, 0);
                    //-
          }//
          //====
          ResetLastError();///no need to checking ...must have fresh data from server or history
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_Fibo Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return true;//
}//
void C_FibosExpansion::SetFractals()
{         if(false) //===============================================================
          {         double        ArrayInRange[]; ArrayResize(ArrayInRange, BarCount, 50);
                    int           WaveBarDepthTryLimit   = 200;///BarCount
                    int           iDown = 0;
                    //#define BarDepthBackValue 10///100/1000///None efect///yet
                    int           BarDepthUpdateFractalsBackCom = 100;//BarDepthBackValue;
                    bool          KeyUpdateLevels = TRUE;
                    bool          OtherArray      = true;
                    //===============================================================
                    int           SizeOfArrayInRange  = ArraySize(ArrayInRange);
                    int           ArrayTotalElements = SizeOfArrayInRange;
                    //===============================================================
                    for (int idx = 0; idx < ArrayTotalElements; idx++) ArrayInRange[idx] = 0;//assign zero vallue to all Elemets///Array200[200];defined///200+1 elenent exist///
                    //===============================================================
                    int           ArrayLastElementIndexAddress = (ArrayTotalElements - 1);//>>>mean start from zero element....>>> Select Last element
                    int           WaveBarDepthTryLimitAdjust = (int)(MathRound(WaveBarDepthTryLimit + 1) / 2.0);//>>>for not floating number or Ord number,,13579
                    //-----------------------------------------------
                    ///---off---for ( iDown = ArrayLastElementIndexAddress ; iDown > 0; iDown--)//Start Fractals Define
                    ///---off---Elliott.UpdateFractalsOneArray(ArrayInRange, WaveBarDepthTryLimitAdjust, iDown, BarDepthUpdateFractalsBackCom, KeyUpdateLevels, OtherArray); ////Search to Assign Fractal Bars of Waves in Depth>>>>
                    ///ArrayInRange[]///fractaled elements///
                    //-----------------------------------------------
          }//
}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_FibosExpansion::RealCalc(Sgtd_FIBO_EXPANSION_Calc &Calc)
{         //
          BarStart                               = 0;                 //reset every call before useing time//
          BarCount                               = 700;
          int DiffHalf                           = BarCount / 2;
          _Data.__Calc__FindBar_Index            = 0;           ///-1;///0;///if -1 errorr///wrong parameter in _Data.__Calc__High_Find_Bar
          _Data.__Calc_MeanBar                   = -1;          ///(HighestBar + LowestBar) / 2;
          //HighestBar = 0;
          //
          //
          //[---Set Data---]
          {         _Data.__Calc__Frist_HighestBar_Index        = iHighest(StSymbol.Current, Calc.PeriodTF, MODE_HIGH, BarCount, BarStart);  //ok
                    _Data.__Calc__Frist_LowestBar_Index         = iLowest (StSymbol.Current, Calc.PeriodTF, MODE_LOW,  BarCount, BarStart);         //ok
                    //
                    //[----Cheak Direction-----]
                    Is_Bulish = _Data.__Calc__Frist_HighestBar_Index < _Data.__Calc__Frist_LowestBar_Index; // realy cool
                    //
                    //
                    _Data.__Calc__Frist_Bar_Index        = Is_Bulish ? _Data.__Calc__Frist_LowestBar_Index : _Data.__Calc__Frist_HighestBar_Index;
                    _Data.__Calc__Secound_Bar_Index      = Is_Bulish ? _Data.__Calc__Frist_HighestBar_Index : _Data.__Calc__Frist_LowestBar_Index;
                    //
                    int diff_frist_half = MathAbs(_Data.__Calc__Frist_Bar_Index / 2 - _Data.__Calc__Frist_Bar_Index);
                    _Data.__Calc__Secound_Bar_Index      = Is_Bulish ? iHighest(StSymbol.Current, Calc.PeriodTF, MODE_HIGH, diff_frist_half, _Data.__Calc__Frist_Bar_Index / 2) : iLowest (StSymbol.Current, Calc.PeriodTF, MODE_LOW,  diff_frist_half, _Data.__Calc__Frist_Bar_Index / 2); ;
                    //
                    _Data.__Calc_Third_Bar_Lowest               = iLowest(StSymbol.Current, Calc.PeriodTF, MODE_LOW,  BarCount = _Data.__Calc__Frist_LowestBar_Index, BarStart);
                    _Data.__Calc_Third_Bar_Highest              = iHighest(StSymbol.Current, Calc.PeriodTF, MODE_HIGH, BarCount = _Data.__Calc__Frist_HighestBar_Index, BarStart);
                    //--------------------------------------------------------------------------------------
                    _Data.__Calc__Time0_Value                   = iTime(StSymbol.Current, Calc.PeriodTF, 0);
                    _Data.__Calc_PeriodTMCom_Time5              = iTime(StSymbol.Current, Calc.PeriodTF, 5);
                    //-------
                    //string PeriodTMComSymbol = SymbolCome;
                    //======================================================================================================
                    _Data.__Calc__High0                         = iHigh(StSymbol.Current, Calc.PeriodTF, 0);
                    _Data.__Calc__Frist_High_HighestBar               = iHigh(StSymbol.Current, Calc.PeriodTF, _Data.__Calc__Frist_HighestBar_Index);
                    _Data.__Calc__High_Find_Bar                 = iHigh(StSymbol.Current, Calc.PeriodTF,  _Data.__Calc__FindBar_Index);  //!!!!!!!!!!!!!!!
                    //--
                    _Data.__Calc__Low0                          = iLow(StSymbol.Current, Calc.PeriodTF, 0);
                    _Data.__Calc__Frist_Low_Lowest_Bar                = iLow(StSymbol.Current, Calc.PeriodTF, _Data.__Calc__Frist_LowestBar_Index);
                    _Data.__Calc__Low_Find_Bar                  = iLow(StSymbol.Current, Calc.PeriodTF, _Data.__Calc__FindBar_Index);  //!!!!!!!!!!!!!!!
                    //
                    _Data.__Calc__Secound_High_HighestBar       = iHigh(StSymbol.Current, Calc.PeriodTF, _Data.__Calc__Secound_Bar_Index);
                    _Data.__Calc__Secound_Low_Lowest_Bar        = iLow(StSymbol.Current, Calc.PeriodTF, _Data.__Calc__Secound_Bar_Index);
                    //
                    //--
                    _Data.__Calc_PeriodTMCom_Close_Mean         = iClose(StSymbol.Current, Calc.PeriodTF, (_Data.__Calc__Frist_HighestBar_Index + _Data.__Calc__Frist_LowestBar_Index) / 2 ); //   Close[(HighestBar + LowestBar) / 2];//
                    //--
                    _Data.__Calc_PeriodTMCom_Close0             = iClose(StSymbol.Current, Calc.PeriodTF, 0);
                    _Data.__Calc_PeriodTMCom_Close_Find_Bar0    = iClose(StSymbol.Current, Calc.PeriodTF, _Data.__Calc__FindBar_Index);///_Data.__Calc__FindBar_Index=0;
                    //---
                    _Data.__Calc_PeriodTMCom_Open0              = iOpen(StSymbol.Current, Calc.PeriodTF, 0);
                    //-
          }//
          //---------------------------
          _Data.__Calc_Forth_Bar                                = iBarShift(NULL, Calc.PeriodTF, _Data.__Calc__Time0_Value); ///_Data.__Calc_Forth_Bar = iBarShift(NULL, Calc.PeriodTF, Time[0]); //Close[0];/////////must defie fore selected periods
          //
          _Data.__Calc_Forth_Bar                                = Is_Bulish ? iLowest (StSymbol.Current, Calc.PeriodTF, MODE_LOW,  BarCount / 2, BarStart) : iHighest(StSymbol.Current, Calc.PeriodTF, MODE_HIGH, BarCount / 2, BarStart);;
          //----------------------------------------------------------------------------------------------------
          //----
          switch (Calc.PeriodTF)
          {         //
                    case PERIOD_CURRENT: {         _Periods._CURRENT.Is_Bulish = Is_Bulish; } break;
                    case PERIOD_MN1:     {         _Periods._MN1.Is_Bulish     = Is_Bulish; } break;
                    case PERIOD_W1:      {         _Periods._W1.Is_Bulish      = Is_Bulish; } break;
                    case PERIOD_D1:      {         _Periods._D1.Is_Bulish      = Is_Bulish; } break;
                    case PERIOD_H4:      {         _Periods._H4.Is_Bulish      = Is_Bulish; } break;
                    case PERIOD_H1:      {         _Periods._H1.Is_Bulish      = Is_Bulish; } break; //
                    case PERIOD_M30:     {         _Periods._M30.Is_Bulish     = Is_Bulish; } break;
                    case PERIOD_M15:     {         _Periods._M15.Is_Bulish     = Is_Bulish; } break; //
                    case PERIOD_M5:      {         _Periods._M5.Is_Bulish      = Is_Bulish; } break; //
                    case PERIOD_M1:      {         _Periods._M1.Is_Bulish      = Is_Bulish; } break; //
          };
//
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_Fibo Error",  __LINE__, __FUNCTION__); //|
//
          {         //
                    //
                    //
                    Calc.Price1   =  !Is_Bulish ?         _Data.__Calc__Frist_High_HighestBar : _Data.__Calc__Frist_Low_Lowest_Bar;  //ok
                    Calc.Time1    =  !Is_Bulish ?        iTime(StSymbol.Current, Calc.PeriodTF, _Data.__Calc__Frist_HighestBar_Index) : iTime(StSymbol.Current, Calc.PeriodTF, _Data.__Calc__Frist_LowestBar_Index); // Time[50]; ok
                    //
                    Calc.Price2   =  !Is_Bulish ?         _Data.__Calc__Secound_Low_Lowest_Bar  : _Data.__Calc__Secound_High_HighestBar; //ok not binary correct need other
                    Calc.Time2    =  !Is_Bulish ?        iTime(StSymbol.Current, Calc.PeriodTF, _Data.__Calc__Secound_Bar_Index)  : iTime(StSymbol.Current, Calc.PeriodTF, _Data.__Calc__Secound_Bar_Index); // Time[50]; ok
          }
          //
          {         //
                    //
                    if(IsTesterDebug) {Print("__DEBUG__TESTER__", __FUNCTION__, " ", __LINE__);}
                    //
                    if(Calc.CalcMode == 3 )//---work---iBarShift(StSymbol.Current, Calc.PeriodTF, Calc.Time3)   iBarShift(StSymbol.Current, Calc.PeriodTF, Calc.Time3)
                    {         _Data.__Calc_Highest_Bar_New_DownWard             = iHighest        (StSymbol.Current, Calc.PeriodTF,  MODE_HIGH, _Data.__Calc__Secound_Bar_Index, 0);
                              _Data.__Calc__High_Highest_Bar_New_DownWard       = iHigh           (StSymbol.Current, Calc.PeriodTF, _Data.__Calc_Highest_Bar_New_DownWard);///High[_Data.__Calc_Highest_Bar_New_DownWard];
                              //
                              _Data.__Calc_Lowest_Bar_New_UpWard                = iLowest         (Symbol(), Calc.PeriodTF,  MODE_LOW, _Data.__Calc__Secound_Bar_Index, 0);// Print("_Data.__Calc__Secound_Bar_Index: ", _Data.__Calc__Secound_Bar_Index, "  _Data.__Calc_Lowest_Bar_New_UpWard:", _Data.__Calc_Lowest_Bar_New_UpWard);
                              _Data.__Calc__Low_Lowest_Bar_New_DownWard         = iLow            (StSymbol.Current, Calc.PeriodTF, _Data.__Calc_Lowest_Bar_New_UpWard);///Low[_Data.__Calc_Lowest_Bar_New_UpWard];
                              //
                              Calc.Time3                         =  !Is_Bulish ? iTime(StSymbol.Current, Calc.PeriodTF, _Data.__Calc_Highest_Bar_New_DownWard) : iTime(StSymbol.Current, Calc.PeriodTF, _Data.__Calc_Lowest_Bar_New_UpWard);
                              Calc.Price3                        =  !Is_Bulish ? iHigh(StSymbol.Current, Calc.PeriodTF, _Data.__Calc_Highest_Bar_New_DownWard) : iLow(StSymbol.Current,  Calc.PeriodTF, _Data.__Calc_Lowest_Bar_New_UpWard );
                              //
                              //
                              if(IsTesterDebug) {Print("__DEBUG__TESTER__", __FUNCTION__, " ", __LINE__);}
                              //
                    } ///
                    else if(Calc.CalcMode == 1 )///---off---
                    {         ////==================================]+Period()*60//---int timeframe, // timeframe ---0 means the current chart timeframe.
                              int       shift_PERIOD_M1_EURUSD        = iBarShift("EURUSD", PERIOD_M1, _Data.__Calc__Time0_Value);//////must defie fore selected periods///shift = iBarShift("EURUSD", PERIOD_M1, Time[0]);
                              int       PeriodTMCom_numberofbars      = iBars(NULL, Calc.PeriodTF); ///PeriodTF/// numberofbars            = iBars(NULL, 0);
                              //---
                              BarCount                                = iBarShift(NULL, Calc.PeriodTF, _Data.__Calc__Time0_Value - Calc.Time2);  ////BarCount         = iBarShift(NULL, 0, Time[0] - Time2);  //Alert("BarCount:_", BarCount, "__line", __LINE__); Alert("Time2:_", Time2, "__line", __LINE__);
                              int       TimeOneBarNum                 = iBarShift(NULL, Calc.PeriodTF,  Calc.Time2);
                              int       TimeTwoBarNum                 = iBarShift(NULL, Calc.PeriodTF,  Calc.Time2);
                              int       TimezaroBarNum                = iBarShift(NULL, Calc.PeriodTF,  _Data.__Calc__Time0_Value);///int       TimezaroBarNum          = iBarShift(NULL, 0,  Time[0]);///must defie fore selected periods
                              //---
                              int       DistanceBarTwoZero           = TimeTwoBarNum - TimezaroBarNum ; //Alert("DistanceBarTwoZero:_", DistanceBarTwoZero, "__line", __LINE__);
                              int       DistanceBarOneZero           = TimeOneBarNum - TimezaroBarNum ; //Alert("DistanceBarOneZero:_", DistanceBarOneZero, "__line", __LINE__);
                              int       meanDistance                 = (DistanceBarOneZero + DistanceBarTwoZero) / 2;
                              int       HighestBarX                  = iHighest(StSymbol.Current, Calc.PeriodTF,  MODE_HIGH, meanDistance, DistanceBarTwoZero);
                              //---
                              if(!Is_Bulish)
                              {         //////must defie fore selected periods
                                        ///
                                        ////==================================
                                        _Data.__Calc__Frist_HighestBar_Index          = iHighest(StSymbol.Current, Calc.PeriodTF,  MODE_HIGH, BarCount, BarStart);
                                        _Data.__Calc__Frist_LowestBar_Index           = iLowest(StSymbol.Current, Calc.PeriodTF, MODE_LOW, BarCount, BarStart);
                                        Calc.PriceMean               = _Data.__Calc_PeriodTMCom_Close_Mean;//Close[(HighestBar + LowestBar) / 2]////must defie fore selected periods
                                        Calc.TimeMean                = _Data.__Calc_PeriodTMCom_Time5; ////TimeMean                 = Time[5];///iTime(StSymbol.Current, Calc.PeriodTF, _Data.__Calc_MeanBar); // Time[50];//////must defie fore selected periods
                                        ////==================================
                                        int BarCountX                           = 0,
                                            BarStartX                           = 0,
                                            shiftX                              = 0 ; // shift
                                        //---
                                        int Pointing                            = meanDistance - DistanceBarTwoZero;
                                        _Data.__Calc_Third_Bar_Highest          = iHighest(StSymbol.Current, Calc.PeriodTF,  MODE_HIGH, BarCountX = Pointing, BarStartX = DistanceBarTwoZero);
                                        _Data.__Calc__FindBar_Index             = _Data.__Calc_Third_Bar_Highest;
                                        _Data.__Calc__High_Find_Bar             = iHigh(StSymbol.Current, Calc.PeriodTF, _Data.__Calc__FindBar_Index);    ///Price3               =  High[_Data.__Calc__FindBar_Index]
                                        //
                                        Calc.Price3              = _Data.__Calc__High_Find_Bar; ////Price3 =  High[_Data.__Calc__FindBar_Index];////must defie fore selected periods
                                        Calc.Time3               = iTime(StSymbol.Current, Calc.PeriodTF, shiftX = TimezaroBarNum); // Time[50];
                                        //Alert(meanDistance, "-Line:", __LINE__); //
                              }//
                              else
                              {         //////must defie fore selected periods
                                        //
                                        //============================_Data.__Calc_PeriodTMCom_Close_Mean
                                        _Data.__Calc__Frist_HighestBar_Index          = iHighest(StSymbol.Current, Calc.PeriodTF,  MODE_HIGH, BarCount, BarStart);
                                        _Data.__Calc__Frist_LowestBar_Index           = iLowest(StSymbol.Current, Calc.PeriodTF, MODE_LOW, BarCount, BarStart);
                                        Calc.PriceMean               = _Data.__Calc_PeriodTMCom_Close_Mean;///PriceMean = Close[(HighestBar + LowestBar) / 2];///must defie fore selected periods
                                        //////must defie fore selected periods
                                        Calc.TimeMean                = _Data.__Calc_PeriodTMCom_Time5; //iTime(StSymbol.Current, ChartData_ChartInfo.Timeframe = PERIOD_CURRENT, _Data.__Calc_MeanBar); // Time[50];
                                        //===============
                                        int BarCountX                           = 0, BarStartX = 0, shiftX = 0 ;         // shift
                                        int Pointing                            = meanDistance - DistanceBarTwoZero;
                                        _Data.__Calc_Third_Bar_Highest          = iHighest(StSymbol.Current, Calc.PeriodTF,  MODE_HIGH, BarCountX = Pointing, BarStartX = DistanceBarTwoZero);
                                        _Data.__Calc_Third_Bar_Lowest           = iLowest(StSymbol.Current, Calc.PeriodTF, MODE_LOW, BarCountX = Pointing, BarStartX = DistanceBarTwoZero);
                                        _Data.__Calc__FindBar_Index             = _Data.__Calc_Third_Bar_Lowest;
                                        _Data.__Calc__Low_Find_Bar              = iLow(StSymbol.Current, Calc.PeriodTF, _Data.__Calc__FindBar_Index);    ///Price3               =  Low[_Data.__Calc__FindBar_Index]
                                        //
                                        Calc.Price3              = _Data.__Calc__Low_Find_Bar; //// Price3                =  Low[_Data.__Calc__FindBar_Index];////must defie fore selected periods
                                        Calc.Time3               = iTime(StSymbol.Current, Calc.PeriodTF, shiftX = TimezaroBarNum); //
                                        //Alert(meanDistance, "-Line:", __LINE__); //
                              } //
                    }
                    //
          } //
          return true;//
}//

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
