//+------------------------------------------------------------------+
//||   ||||||||||     Stc_CandlePattern__Harmonic_Shape_ABCD.mqh    ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
#define REGRESSION_DEF_tooltip       "tooltip_Regression"

//+------------------------------------------------------------------+
//|             Class SoundController     BEGIN                      |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\BasicChartObj\_COBF_.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\BasicChartObj\__COBFA__.mqh>
//---'
/*
  //---[---Channels.Regression---]
          {         Object_Pack.Channels.Regression.GDS.Set_Action_2(MODE_CREATE, true);
                    Object_Pack.Channels.Regression.GDS.Set_Desc_1("Channels.Regression");
                    Object_Pack.Channels.Regression.GDS.Set_Color_1(clrGreen);
                    Object_Pack.Channels.Regression.GDS.Set_Model_3(STYLE_SOLID, 3, false);
                    Object_Pack.Channels.Regression.GDS.Set_RayRight_1(false);
                    Object_Pack.Channels.Regression.GDS.Calc_Locations(PERIOD_CURRENT, 200, 0);
                    //---
                    Object_Pack.Channels.Regression.GDS.Set_Common_6(false, 100, false, false, true, REGRESSION_DEF_tooltip + "Channels.Regression");
                    Object_Pack.Channels.Regression.GDS.Set_Chart_6();
                    Object_Pack.Channels.Regression.Action(Object_Pack.Channels.Regression);//
          }//
*/
struct S_REGRESSION: public _COBF_
{         //============================================================================================================
          void                  S_REGRESSION() {TYPE_O_00 = OBJ_REGRESSION;}; // {Point2XY(0, 0, 0, 0);}; //S_HLINE.PointTime.TIME1==0  S_HLINE.PointTime.PRICE1==0  S_HLINE.PointTime.TIME2==0   S_HLINE.PointTime.PRICE2==0
          S_point                Point2XY;                                                 //S_HLINE.PointTime.TIME1==0  S_HLINE.PointTime.PRICE1==0
          ////----------------------------------
          //color                 COLOR;                        //Color                           color
          //ENUM_LINE_STYLE       STYLE;                        //Style                           ENUM_LINE_STYLE
          //int                   WIDTH;                        //Line thickness                  int
          //---bool                  RAY_RIGHT_11;                    //Ray goes to the right           bool     /----  __COBF__   defined for support too calll others
          ////----------------------------------
          bool                  Is_Bulish;
          bool                  Set_RayRight_1(bool rayRight) {   RAY_RIGHT_11 = rayRight; return true;}
          //////----------------------------------
          bool                  Calc_Locations(ENUM_TIMEFRAMES f, int AddBar, int StartBar )
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
                              }
                              else
                              {         Time1                     = iTime(        StSymbol.Current, f, HighestBar); // Time[50];
                                        Time2                     = iTime(        StSymbol.Current, f, LowestBar  ); // Time[50];
                                        Price1                    = iHigh(        StSymbol.Current, f, HighestBar); //
                                        Price2                    = iLow(         StSymbol.Current, f, LowestBar); //
                              }
                              //---.................................................................................................
                              if(Is_Bulish)
                              {         int LowestBar3            = iLowest(      StSymbol.Current, f, MODE_LOW, HighestBar, 0);
                                        Price3                    = iLow(         StSymbol.Current, f, LowestBar3); //
                                        Time3                     = iTime(        StSymbol.Current, f, LowestBar3); // Time[50];
                              }
                              else
                              {         int HighestBar3           = iHighest(     StSymbol.Current, f, MODE_HIGH, LowestBar, 0);
                                        Price3                    = iHigh(        StSymbol.Current, f, HighestBar3); //
                                        Time3                     = iTime(        StSymbol.Current, f, HighestBar3); // Time[50];
                              }//
                    }
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

          bool                  SetLocation(datetime Time1, double Price1, datetime Time2, double Price2, datetime Time3, double Price3)
          {         if(IsCreated)return false;
                    TIME1       = Time1;                //0       datetime        Datetime value to set/get first coordinate time part
                    PRICE1      = Price1;               //1       double          Double value to set/get first coordinate price part
                    TIME2       = Time2;                //2       datetime        Datetime value to set/get second coordinate time part
                    PRICE2      = Price2;               //3       double          Double value to set/get second coordinate price part
                    //--- OBJ_TRIANGLE && OBJ_TRIANGLE && OBJ_ELLIPSE
                    TIME3       = Time3;
                    PRICE3      = Price3;
                    return true; };
          //---
          bool                  Set_Chart_6(long timeframe_41 = 0, string symbol_42 = "", datetime createtime_43 = 0, ENUM_OBJECT typr_44 = 0, long chart_45 = 0, int subwindow_46 = 0)
          {         if(IsCreated)return false;
                    TIMEFRAMES_O_00               /*= FRAME.TIMEFRAMES*/      = Period();
                    SYMBOL_O_00                   /*= FRAME.SYMBOL*/          = Symbol();
                    CREATETIME_O_00               /*= FRAME.CREATETIME*/      = TimeLocal();
                    TYPE_O_00                     /*= FRAME.TYPE*/            = OBJ_REGRESSION;
                    CHART_O_00                    /*= FRAME.CHART*/           = ChartData_ChartInfo.ID;
                    SUBWINDOW_O_00                /*= FRAME.SUBWINDOW*/       = ChartData_ChartInfo.SubWindow;
                    //
                    return IS_Set_Chart_6_55 = true; //
          };
          /*
          const long            chart_ID=0,        // chart's ID
          const string          name="Channel",    // channel name
          const int             sub_window=0,      // subwindow index
          //---
          datetime              time1=0,           // first point time
          double                price1=0,          // first point price
          datetime              time2=0,           // second point time
          double                price2=0,          // second point price
          datetime              time3=0,           // third point time
          double                price3=0,          // third point price
          //---
          const color           clr=clrRed,        // channel color
          const ENUM_LINE_STYLE style=STYLE_SOLID, // style of channel lines
          const int             width=1,           // width of channel lines
          const bool            fill=false,        // filling the channel with color
          //---
          const bool            back=false,        // in the background
          const bool            selection=true,    // highlight to move
          const bool            ray_right=false,   // channel's continuation to the right
          const bool            hidden=true,       // hidden in the object list
          const long            z_order=0)         // priority for mouse click
          */
          //============================================================================================================
          //OBJECT.Color(COLOR);                      //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_COLOR, COLOR);
          //OBJECT.Style(STYLE);                      //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_STYLE, STYLE);
          //OBJECT.Width(WIDTH);                      //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_WIDTH, WIDTH);//
          //OBJECT.RayRight(RAY_RIGHT);               //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_RAY_RIGHT, RAY_RIGHT);//
          ////----------------------------------
          //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_BACK, BACK);
          //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_SELECTABLE, SELECTABLE);
          //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_SELECTED, SELECTED);
          //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_HIDDEN, HIDDEN);
          //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_ZORDER, ZORDER);
          //ObjectSetString(ChartData_ChartInfo.ID,  OBJ.CName, OBJPROP_TOOLTIP, TOOLTIP);//
          //============================================================================================================
};
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(MQL4)\Include\ChartObjects\ChartObjectsChannels.mqh>

//---
//---
struct C_ChannelsRegression_Data
{         bool                  Is_Create;
          bool                  Is_Move;
          string                Regression_Name;// =  "Regression";
          string                Description;    // = "RegressionDescription";
          int                   XCordinate;     // = 10;
          int                   YCordinate;     // = 10;
          int                   XSize;          // = 10;
          int                   YSize;          // = 10;
          ENUM_BASE_CORNER      Corner;         // = CORNER_RIGHT_LOWER;
          bool                  Fill;           // = false;
          bool                  RayRight;       // = false;
          bool                  RayLeft;        // = false, long Style = 1;
          int                   Width;          // = 1;
          ENUM_LINE_STYLE       Style;
          color                 DescColorIN;    // = clrYellow;
          double                Angle;          // = 0;
//---
};



//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class C_ChannelsRegression: public __COBFA__<S_REGRESSION> 
{
//===================================================================
private:
//===================================================================
public:
          void                          C_ChannelsRegression() {};
          void                          ~C_ChannelsRegression() {};
          //===================================================================
          CChartObjectRegression_MQL4        GAC;
          S_REGRESSION                  GDS;
         
          void                          SetupSignal() {}
          //===================================================================
          bool                          Create(C_ChannelsRegression_Data &m);// Regression


          void  Draw_GDS(int WhichMode , bool IsKey ,string n, int AddBar, int StartBar, bool Is_Delete)
          {         //---[---Channels.Regression---]
                    {         GDS.Set_Action_2(WhichMode, IsKey);
                              GDS.Set_Desc_1("Channels.Regression" + n);
                              GDS.Set_Color_1(clrGreen);
                              GDS.Set_Model_3(STYLE_SOLID, 3, false);
                              GDS.Set_RayRight_1(false);
                              GDS.Calc_Locations(PERIOD_CURRENT, AddBar, StartBar);
                              //---
                              GDS.Set_Common_6(false, 100, true, false, true, REGRESSION_DEF_tooltip + "Channels.Regression" + n);
                              GDS.Set_Chart_6();
                              GDS.Set_ToDelete_1(Is_Delete);
                              GDS.Set_Signal_1(true);
                              Action(this);//
                              //
                    }//
          }
          //===================================================================

          //===================================================================
          void SetCHANNEL();

};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_ChannelsRegression::Create(C_ChannelsRegression_Data &m)// Regression
{         //---
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_Channel Error",  __LINE__, __FUNCTION__); //|
          int                           AddBar = 0;
          int                           StartBar = 0;
          int HighestBar                = iHighest(StSymbol.Current, ChartData_ChartInfo.Timeframe = PERIOD_CURRENT,   MODE_HIGH, AddBar = 200, StartBar);
          int LowestBar                 = iLowest(StSymbol.Current, ChartData_ChartInfo.Timeframe = PERIOD_CURRENT,  MODE_LOW, AddBar = 200, StartBar);
          //---
          datetime TimeCordinateOne     = iTime(StSymbol.Current, ChartData_ChartInfo.Timeframe = PERIOD_CURRENT, HighestBar  ); // Time[50];
          datetime TimeCordinateTwo     = iTime(StSymbol.Current, ChartData_ChartInfo.Timeframe = PERIOD_CURRENT, LowestBar); // Time[50];
          //--
          if (TimeCordinateOne > TimeCordinateTwo)
                    TimeCordinateOne = iTime(StSymbol.Current, ChartData_ChartInfo.Timeframe = PERIOD_CURRENT, 10 ); // MathAbs(HighestBar - LowestBar)
          //---
          double PriceCordinateOne = High[HighestBar];
          double PriceCordinateTwo = Low[LowestBar];
          //---
          if(ObjectFind(ChartData_ChartInfo.ID, m.Regression_Name) >= 0 && m.Is_Move )
          {         ObjectSetInteger(0, m.Regression_Name, OBJPROP_XDISTANCE, m.XCordinate);//Label_.X_Distance(XCordinate);
                    ObjectSetInteger(0, m.Regression_Name, OBJPROP_YDISTANCE, m.YCordinate);////Label_.Y_Distance(YCordinate); //
                    return true;//
          }
          //---
          if(ObjectFind(ChartData_ChartInfo.ID, m.Regression_Name) >= 0 && !m.Is_Create) {return ObjectDelete(ChartData_ChartInfo.ID, m.Regression_Name);}
          if(ObjectFind(ChartData_ChartInfo.ID, m.Regression_Name)  < 0 )
                    if(!GAC.Create(ChartData_ChartInfo.ID, m.Regression_Name, ChartData_ChartInfo.SubWindow, TimeCordinateOne, TimeCordinateTwo ))________________________________________________________Xerorr.SuperviserX(_LastError, "-C_Channel Error",  __LINE__, __FUNCTION__); //|
          //---
///two time get regresion chaneel the 4 param lined
          if(ObjectFind(ChartData_ChartInfo.ID, m.Regression_Name)   >= 0  )
          {         GAC.Description(m.Description  ); // UseLabel.Angle(Angle + 5);
                    GAC.Color(m.DescColorIN);
                    GAC.Fill(m.Fill);
                    GAC.RayRight(m.RayRight);
                    GAC.RayLeft(m.RayLeft);
                    GAC.Width(m.Width);
                    GAC.SetInteger(OBJPROP_STYLE, m.Style);   // StdDev_.Style(2)
                    GAC.Selectable(false);
                    GAC.Z_Order(1);//
          }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_Channel Error",  __LINE__, __FUNCTION__); //|
          return false;//
//=========================================================|
}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_ChannelsRegression::SetCHANNEL()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TOOLS Error",  __LINE__, __FUNCTION__); //|
          //---
          int         argargshift             = 0;           // argshift
          int         Barstart                = 0;
          int         BarCount                = 200;       ///count = WHOLE_ARRAY
          int         argtimeframe            = PERIOD_CURRENT;
          int         barNumberHigh           = iHighest(Symbol(), argtimeframe, MODE_HIGH, BarCount, Barstart) ;
          int         barNumberLow            = iLowest(Symbol(), argtimeframe, MODE_LOW, BarCount, Barstart);
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TOOLS Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          double      price1                  = Low[barNumberLow]; ///iHigh(NULL, PERIOD_MN1, 0);  iHighest(NULL,0,MODE_HIGH,WHOLE_ARRAY,0)
          double      price2                  = High[barNumberHigh]; ///////////iHigh(NULL, PERIOD_MN1, 0);   //iLowest(NULL,0,MODE_LOW,WHOLE_ARRAY,0);
          double    argPrice1                 = Low[200] ;
          double    argPrice2                 = Close[0] ;
          double    argPrice3                 = Low[barNumberLow]; //iLow(NULL, PERIOD_W1, argargshift);//High[barNumberHigh]; //Bid;
          datetime  argTime1                  = Time[200]; /////////iTime(NULL, PERIOD_W1, argargshift);
          datetime  argTime2                  = Time[0];
          if(Dev_Checkup_Terminal._Mql_.CONNECTED)
          {         //
                    barNumberHigh           = iHighest(Symbol(), argtimeframe, MODE_HIGH, BarCount, Barstart) ;
                    barNumberLow            = iLowest(Symbol(), argtimeframe, MODE_LOW, BarCount, Barstart);
                    //
                    argPrice1                 = iLow(NULL, PERIOD_W1, argargshift);
                    argPrice2                 = iClose(NULL, PERIOD_M1, argargshift); //
                    //
                    argTime2                  = iTime(NULL, PERIOD_M1, argargshift);//
          }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
          datetime  argTime3                  = Time[200]; //iTime(NULL, PERIOD_W1, argargshift);/// Time[0];
          ChartData_ChartInfo.SubWindow             = 0;
          string    name                      = "CHANNEL";
          ENUM_OBJECT object_type             = OBJ_CHANNEL;
          if(ObjectFind(ChartData_ChartInfo.ID, name) < 0)
                    if(!ObjectCreate(ChartData_ChartInfo.ID, name, OBJ_CHANNEL, ChartData_ChartInfo.SubWindow, argTime1, price1, argTime2, argPrice2, argTime3, argPrice3 + 5   ))Alert("Not Object Create" + (string)__LINE__);
//============================//============================
          if(ObjectFind(ChartData_ChartInfo.ID, name) >= 0)
          {         ObjectSet(name, OBJPROP_COLOR, clrYellow) ;
                    ObjectSet(name, OBJPROP_WIDTH, 1);
                    ObjectSet(name, OBJPROP_RAY, true) ; //
          }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TOOLS Error",  __LINE__, __FUNCTION__); //|
          return;//
}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|             Class SoundController     BEGIN                      |
//+------------------------------------------------------------------+
