//+------------------------------------------------------------------+
//||   ||||||||||              Cg_DevChartWindow.mqh                ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\B_MQLLib\.B_MQLLib.mqh>
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |Print("       Passd StackOverflow", __FUNCSIG__, __LINE__);
//+------------------------------------------------------------------+

#property copyright "A pourya 2021"
#property link      "@prymhdvgmail.com"
#property version   "1.00"
#property strict
//-------------------------------------------------------------//
//            Chart Operator                                   //
//            # A Propertise                                   //
//            # B Theme                                        //
//                                                             //
//                                                             //
//-------------------------------------------------------------//
struct CustomSet
{         long          p_INTERNAL_EVENT;       //= chart_id;//
          ushort        p_ON_MOUSE_FOCUS_SET;   //= 2000;//
} SetCustom; //
//================================================
bool KeyCHARTEVENT_CLICK                = True;
bool KeyCHARTEVENT_KEYDOWN              = True;
bool KeyCHARTEVENT_OBJECT_CREATE        = True;
bool KeyCHARTEVENT_OBJECT_CLICK         = True;
bool KeyCHARTEVENT_OBJECT_CHANGE        = True;
bool KeyCHARTEVENT_OBJECT_DELETE        = True;
bool KeyCHARTEVENT_OBJECT_DRAG          = True;
bool KeyCHARTEVENT_OBJECT_ENDEDIT       = True;
bool KeyCHARTEVENT_CHART_CHANGE         = True;
bool KeyCHARTEVENT_CUSTOM               = True;
bool KeyCHARTEVENT_CUSTOM_LAST          = True;
bool KeyCHARTEVENT_MOUSE_MOVE           = True;
bool KeyCHARTEVENT_MOUSE_WHEEL          = True;
//+------------------------------------------------------------------+
//|             Class Cg_DevChartWindow::BEGIN                       |2721 line class  Cg_DevChartWindow start
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\B_MQL\.B_MQL.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(MQL4)\Include\Charts\Chart.mqh>
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
struct Sc_Chart_Colors
{         color COLOR_BACKGROUND      ;//=  clrBlack; //clrBlack; 9,42,214 C'128,128,128'    // Gray  C'9,42,214'
          color COLOR_FOREGROUND      ;//=  clrSnow;
          color COLOR_GRID            ;//=  clrLavender;
          color COLOR_VOLUME          ;//=  clrSnow;
          color COLOR_CHART_UP        ;//=  clrDarkTurquoise;
          color COLOR_CHART_DOWN      ;//=  clrTomato;
          color COLOR_CHART_LINE      ;//=  clrYellowGreen;
          color COLOR_CANDLE_BULL     ;//=  clrDarkTurquoise;
          color COLOR_CANDLE_BEAR     ;//=  clrTomato;
          color COLOR_BID             ;//=  clrBlue;
          color COLOR_ASK             ;//=  clrRed;
          color COLOR_LAST            ;//=  clrYellow;
          color COLOR_STOP_LEVEL      ;//=  clrDeepPink; //
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class Cg_DevChartWindow
{         //---
public:   CChart                MQLLib;      //--- CChart : public CObject
          Sg_MqlChartWindow     _Mql_;         //--_Mql_.Data    //--- Sg_MqlChartWindow::Sg_MqlChartWindowData
public://Constructors
          void                  Cg_DevChartWindow();
          void                  Cg_DevChartWindow (const uint  number, const string  name = "OnChartWork");
          void                  ~Cg_DevChartWindow() {if(Capitan_DeinitErrorCatching)________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); }

          bool                  Is_ChartChanged() {  return(ChartPeriod(ChartData_ChartInfo.ID) != FristChart); } // bool ChartChanged = (ChartPeriod(0) != FristChart);ChartChanged()
          Sc_Chart_Colors        Chart_Colors_A, Chart_Colors_B, Chart_Colors_C;
          //=======================================================================================
protected://must access by self func to changeing//
//=======================================================================================
public:

          bool                   Update();//
          bool                   UPDATED;
          void                   Test();
          //TimePriceToXY                  = ChartTimePriceToXY(ChartData_ChartInfo.ID, ChartData_ChartInfo.SubWindow, ChartData_ChartInfo.TimeLast = Time[0], ChartData_ChartInfo.PriceClose20 = Close[0], UseX, UseY); //Bid[] is not arry define
          //====================================================================
          bool                   TimePrice_To_XY_Array(datetime time, double price, int& x[], int& y[] );//---????
          bool                   TimePrice_To_XY(datetime time, double price, int& x, int& y, string FuncCom = "" );
          //---
          double                 ChartPriceMin(const long chart_ID = 0, const int sub_window = 0);
          double                 ChartPriceMax(const long chart_ID = 0, const int sub_window = 0);

          //---
          bool                   ChartCommentGet(string &result, const long chart_ID = 0);
          bool                   ChartCommentSet(const string str, const long chart_ID = 0);
          //=======================================================================================
public://Events;
          void                   BroadcastEvent(long lparam, double dparam, string sparam);
          //---
          bool                   Get_ChartEvent_MouseMove(bool &result, const long chart_ID = 0);
          bool                   Set_ChartEvent_MouseMove(const bool value, const long chart_ID = 0);
          bool                   ChartEventObjectCreateGet(bool &result, const long chart_ID = 0);
          bool                   ChartEventObjectCreateSet(const bool value, const long chart_ID = 0);
          bool                   ChartEventObjectDeleteGet(bool &result, const long chart_ID = 0);
          bool                   ChartEventObjectDeleteSet(const bool value, const long chart_ID = 0);
public://Tier;
          void                   sub_takesnapshot();
          void                   sub_makescreenshot ( string par_sx = "" );
          string                 sub_maketimestring ( int par_number, int par_digits );
public:
          bool                   KeyShowVloume;
          long                   Hline_number;
          string                 UseNameX;
          //=======================================
          uint                   numberX;
          string                 nameX;
          //=======================================================================================
          //////////////////////////////////////////////////////////////////////////////////////////////////////
          bool                   ChartBringToTop(const long chart_ID = 0);
          bool                   Get_Chart_Mouse_Scroll(bool &result, const long chart_ID = 0);
          bool                   Set_Chart_Mouse_Scroll(const bool value, const long chart_ID = 0);
          void                   OBJ_cleaner();
          //====================================================================
          int                    ChartVisibleBars(const long chart_ID = 0) ;
          //---
          int                    ChartWindowsTotal(const long chart_ID = 0);
          bool                   ChartWindowsIsVisible(bool &result, const long chart_ID = 0, const int sub_window = 0);
          int                    ChartWindowsHandle(const long chart_ID = 0);
          int                    ChartWindowsYDistance(const long chart_ID = 0, const int sub_window = 0);
          //---
          int                    ChartFirstVisibleBar(const long chart_ID = 0);
          int                    ChartWidthInBars(const long chart_ID = 0);
          //---
          int                    ChartWidthInPixels(const long chart_ID = 0);
          int                    ChartHeightInPixelsGet(const long chart_ID = 0, const int sub_window = 0);
          bool                   ChartHeightInPixelsSet(const int value, const long chart_ID = 0, const int sub_window = 0);
          //---
          color                  ChartBackColorGet(const long chart_ID = 0);
          bool                   ChartBackColorSet(const color clr, const long chart_ID = 0);
          color                  ChartForeColorGet(const long chart_ID = 0);
          bool                   ChartForeColorSet(const color clr, const long chart_ID = 0);
          color                  ChartGridColorGet(const long chart_ID = 0);
          bool                   ChartGridColorSet(const color clr, const long chart_ID = 0);
          color                  ChartVolumeColorGet(const long chart_ID = 0);
          bool                   ChartVolumeColorSet(const color clr, const long chart_ID = 0);
          color                  ChartUpColorGet(const long chart_ID = 0);
          bool                   ChartUpColorSet(const color clr, const long chart_ID = 0);
          color                  ChartDownColorGet(const long chart_ID = 0);
          bool                   ChartDownColorSet(const color clr, const long chart_ID = 0);
          color                  ChartLineColorGet(const long chart_ID = 0);
          bool                   ChartLineColorSet(const color clr, const long chart_ID = 0);
          color                  ChartBullColorGet(const long chart_ID = 0);
          bool                   ChartBullColorSet(const color clr, const long chart_ID = 0);
          color                  ChartBearColorGet(const long chart_ID = 0);
          bool                   ChartBearColorSet(const color clr, const long chart_ID = 0);
          color                  ChartBidColorGet(const long chart_ID = 0);
          bool                   ChartBidColorSet(const color clr, const long chart_ID = 0);
          color                  ChartAskColorGet(const long chart_ID = 0);
          bool                   ChartAskColorSet(const color clr, const long chart_ID = 0);
          color                  ChartLastColorGet(const long chart_ID = 0);
          bool                   ChartLastColorSet(const color clr, const long chart_ID = 0);
          //---
          color                  ChartStopLevelColorGet(const long chart_ID = 0);
          bool                   ChartStopLevelColorSet(const color clr, const long chart_ID = 0);
          bool                   ChartShowTradeLevelsGet(bool &result, const long chart_ID = 0);
          bool                   ChartShowTradeLevelsSet(const bool value, const long chart_ID = 0);

          bool                   ChartDragTradeLevelsGet(bool &result, const long chart_ID = 0);
          bool                   ChartDragTradeLevelsSet(const bool value, const long chart_ID = 0);
          //---
          bool                   ChartShowDateScaleGet(bool &result, const long chart_ID = 0);
          bool                   ChartShowDateScaleSet(const bool value, const long chart_ID = 0);
          bool                   ChartShowPriceScaleGet(bool &result, const long chart_ID = 0);
          bool                   ChartShowPriceScaleSet(const bool value, const long chart_ID = 0);
          //---
          double                 ChartShiftSizeGet(const long chart_ID = 0);
          bool                   ChartShiftSizeSet(const double value, const long chart_ID = 0);
          //---
          bool                   CheckChartOffline(const long chart_ID = 0);
          //---
          double                 ChartFixedPositionGet(const long chart_ID = 0);
          bool                   ChartFixedPositionSet(const double value, const long chart_ID = 0);
          double                 ChartFixedMaxGet(const long chart_ID = 0);
          bool                   ChartFixedMaxSet(const double value, const long chart_ID = 0);
          double                 ChartFixedMinGet(const long chart_ID = 0);
          bool                   ChartFixedMinSet(const double value, const long chart_ID = 0);
          //---
          double                 ChartPointsPerBarGet(const long chart_ID = 0);
          bool                   ChartPointsPerBarSet(const double value, const long chart_ID = 0);


          //====================================================================
          void                   ChartClick(long chart_id, ushort  custom_event_id, long lparam, double dparam, string  sparam );//
          void                   CheckAutoTrading();
          //---
          int                    Set_Theme(long SaveChartID = 0, long ChartOpenID = 0, int Keylight = 0, string  argfilename = NULL, bool resultA = false ); //apply teamplate
          bool                   Set_ChartCandels_BullBear_RandomColor(int KeyC = 0, bool result = false);
          //---
          void                   WindowScreenShoter();
          void                   ShowVloume(bool ShowVloume_Key);
          void                   FrameSetting(long SaveChartID = 0, long ChartOpenID = 0, Zoom_Level Chart_Property_Value = Two);
          void                   WindowHandler(ENUM_TIMEFRAMES argtimeframe);             //1.5.0 Windws Functions SYMBOL_PEROID_INDICATOR

          //====================================================================

//======================================================================
//====================================================================
};// Charter;//>>>>its make class static
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
Cg_DevChartWindow::Cg_DevChartWindow(const uint  number, const string  name = "OnChartWork")   //  weh refrence in call no need set value... in calll default param no need type
{         RunCallFunction++; ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
          numberX = number;
          nameX = name;
          //not worked //only pointer work ok....//.UseButtonXCreate("KeyD ", "ComD ", 360, 330, 160, 120, CORNER_RIGHT_UPPER );
          //0 = new OnChart();//
          // = new OnChart();
          //KeyChartTOOLS = new OnChart();
          //CommentPannel = new OnChart();
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
          return;//
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
Cg_DevChartWindow::Cg_DevChartWindow()///init class OnChartOBJ  Expert initialization function
{         if(IsTesting())
          {         ChartSetInteger(ChartData_ChartInfo.ID, CHART_SHOW_GRID,  ChartData_ChartInfo.SubWindow, false);
                    return; //
          } //
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
          Update();
          //Print("       Passd StackOverflow", __FUNCSIG__);
          ///==================
          //DescColorPressB = clrWhite;
          //BackColorPressB = clrDarkCyan;
          //BorderColorPressB = clrDarkCyan;
          //DescColorB = clrDarkCyan;
          //BackColorB = clrLavender;
          //BorderColorB = clrLavender;
          //===================
          ///////////////////////////////////
          //TOOLSController::TOOLSControllerX(new TOOLSController());
          ////============================
          //Alert("(3223)-"+"OBJ1 Runing","-Line:",__LINE__);
          //--- input setting
          int Keylight1 = EXTKeylight;
          KeyShowVloume = true;
          Hline_number         = ChartID();
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //
          if(iTime(NULL, PERIOD_D1, 0) == 0)///???>>>gone get history updating
          {         ChartData_ChartInfo.DayStart = NULL; ResetLastError(); ////?>>>???>>>gone get history updating ingonerd
                    if(Capitan_ResetLastErrorX)ResetLastError(); //
          }
          else//2021.04.08 12:14:50.725      HistoryCenter: synchronize 'ct_XAUUSD.F1'
          {         ChartData_ChartInfo.DayStart = iTime(NULL, PERIOD_D1, 0); ResetLastError();} ////?>>>???>>>gone get history updating ingonerd}
          //
          ///
          ///----------------------------------------------------------------------------------------
          ///
          //
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //
          if(TimeCurrent() == 0)
          {         ChartData_ChartInfo.DayStart = NULL;
                    if(Capitan_ResetLastErrorX) ResetLastError();//
          }
          else//2021.04.08 12:14:50.725      HistoryCenter: synchronize 'ct_XAUUSD.F1'
          {         ChartData_ChartInfo.Last_Time = TimeCurrent();}
          //==============================================================
          ////////KeyIndiators
          //===========================================================
          //Alert(ChartFunc.XOnDropped());
          _Mql_.FunctionData.ChartXOnDropped_int = MQLLib.XOnDropped();  _Mql_.FunctionData.ChartYOnDropped_int = MQLLib.YOnDropped(); //--where to keep valuew?
          //Alert(ChartFunc.WidthInPixels(), __LINE__);UseCChart.WidthInPixels(), UseCChart.WidthInPixels()
          ///==========================================================
          Set_Theme(0, 0);
          FrameSetting(0, 0, Min); //>>>>scrooll problemm
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
          return;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Cg_DevChartWindow::Update()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
          UPDATED = false;
          _Mql_.Update();
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
          ChartData_ChartInfo.IsTrackingMouse = ChartGetInteger(0, CHART_EVENT_MOUSE_MOVE); //
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
          ChartData_ChartFrame.PixelGet();//
          ChartData_ChartInfo.Timeframe         = (ENUM_TIMEFRAMES)_Mql_.FunctionData.Period_int;  //PERIOD_CURRENT
          ChartData_ChartInfo.SubWindow         = 0;
          if(iBars(NULL, 0) > 0)        ChartData_ChartInfo.TimeLast     = Time[0];
          if(iBars(NULL, 0) > 0)        ChartData_ChartInfo.PriceClose20 = Close[20];
          //==========================================================
          // SYS Timer Cheackup Start C_WINUSER32 App Enviroments<<<<|
          //==========================================================
          //
          UPDATED = true;
          //
          //==========================================================
          // SYS Timer Cheackup End C_WINUSER32 App Enviroments<<<<<<|
          //==========================================================
          if(!this.UPDATED)            {Alert("Dev_Chart_Window.UPDATED: ", this.UPDATED);}
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
          return UPDATED;//
}
//+----------------------------------------------------------------------+
//| Send command to the terminal to display the chart above all others.  |
//+----------------------------------------------------------------------+
bool Cg_DevChartWindow::ChartBringToTop(const long chart_ID = 0)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//--- reset the error value
          ResetLastError();
//--- show the chart on top of all others
          if(!ChartSetInteger(chart_ID, CHART_BRING_TO_TOP, 0, true))
          {         //--- display the error message in Experts journal
                    Print(__FUNCTION__ + ", Error Code = ", GetLastError());
                    ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
                    return(false); //
          }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//=========================================================
          return(true); //
}

//+--------------------------------------------------------------------------+
//| The function defines if scrolling the chart using left mouse button is   |
//| enabled.                                                                 |
//+--------------------------------------------------------------------------+
bool Cg_DevChartWindow::Get_Chart_Mouse_Scroll(bool &result, const long chart_ID = 0)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//--- prepare the variable to get the property value
          long value;
//--- reset the error value
          ResetLastError();
//--- receive the property value
          if(!ChartGetInteger(chart_ID, CHART_MOUSE_SCROLL, 0, value))
          {         //--- display the error message in Experts journal
                    Print(__FUNCTION__ + ", Error Code = ", GetLastError());
                    ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
                    return(false); }
//--- store the value of the chart property in memory
          result = value;
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//--- successful execution
          return(true); }
//+--------------------------------------------------------------------+
//| The function enables/disables scrolling the chart using left mouse |
//| button.                                                            |
//+--------------------------------------------------------------------+
bool Cg_DevChartWindow::Set_Chart_Mouse_Scroll(const bool value, const long chart_ID = 0)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//-- reset the error value
          if(Capitan_ResetLastErrorX)
                    ResetLastError();
//--
          if(!ChartSetInteger(chart_ID, CHART_MOUSE_SCROLL, 0, value))
          {         Print(__FUNCTION__,
                          ", Error Code = ", _LastError);
                    return(false); }
//--
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
          return(true);//
}

//+------------------------------------------------------------------+
//| Check if messages concerning move events and mouse clicks        |
//| are sent to all mql4 applications on the chart.                  |
//+------------------------------------------------------------------+
bool  Cg_DevChartWindow::Get_ChartEvent_MouseMove(bool &result, const long chart_ID = 0)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//--- prepare the variable to get the property value
          long value;
//--- reset the error value
          ResetLastError();
//ChartGetInteger(chart_ID, CHART_EVENT_MOUSE_MOVE, 0, value);
//--- receive the property value
          if(!ChartGetInteger(chart_ID, CHART_EVENT_MOUSE_MOVE, 0, value))
          {         //--- display the error message in Experts journal
                    Print(__FUNCTION__ + ", Error Code = ", GetLastError());
                    ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
                    return(false); }
//--- store the value of the chart property in memory
          result = value;
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//--- successful execution
          return(true); }
//+------------------------------------------------------------------------------+
//| The function enables/disables the mode of sending messages concerning move   |
//| events and mouse clicks to mql4 applications on the                          |
//| chart.                                                                       |
//+------------------------------------------------------------------------------+
bool  Cg_DevChartWindow::Set_ChartEvent_MouseMove(const bool value, const long chart_ID = 0)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //
//--- reset the error value
          ResetLastError();
//--- set property value
          if(!ChartSetInteger(chart_ID, CHART_EVENT_MOUSE_MOVE, 0, value))
          {         //--- display the error message in Experts journal
                    Print(__FUNCTION__ + ", Error Code = ", GetLastError());
                    return(false); }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //
//--- successful execution
          return(true); //
}

//+---------------------------------------------------------------------+
//| Check if messages concerning the event of a graphic object creation |
//| are sent to all mql4 applications on the chart.                     |
//+---------------------------------------------------------------------+
bool Cg_DevChartWindow::ChartEventObjectCreateGet(bool &result, const long chart_ID = 0)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//--- prepare the variable to get the property value
          long value;
//--- reset the error value
          ResetLastError();
//--- receive the property value
          if(!ChartGetInteger(chart_ID, CHART_EVENT_OBJECT_CREATE, 0, value))
          {         //--- display the error message in Experts journal
                    Print(__FUNCTION__ + ", Error Code = ", GetLastError());
                    ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
                    return(false); }
//--- store the value of the chart property in memory
          result = value;
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//--- successful execution
          return(true); }
//+--------------------------------------------------------------------------+
//| The function enables/disables the mode of sending messages concerning    |
//| the event of a graphic object creation to all mql4 applications on the   |
//| chart.                                                                   |
//+--------------------------------------------------------------------------+
bool Cg_DevChartWindow::ChartEventObjectCreateSet(const bool value, const long chart_ID = 0)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//--- reset the error value
          ResetLastError();
//--- set property value
          if(!ChartSetInteger(chart_ID, CHART_EVENT_OBJECT_CREATE, 0, value))
          {         //--- display the error message in Experts journal
                    Print(__FUNCTION__ + ", Error Code = ", GetLastError());
                    ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
                    return(false); }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//--- successful execution
          return(true); }


//+---------------------------------------------------------------------+
//| Check if messages concerning the event of a graphic object deletion |
//| are sent to all mql4 applications on the chart.                     |
//+---------------------------------------------------------------------+
bool  Cg_DevChartWindow::ChartEventObjectDeleteGet(bool &result, const long chart_ID = 0)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//--- prepare the variable to get the property value
          long value;
//--- reset the error value
          ResetLastError();
//--- receive the property value
          if(!ChartGetInteger(chart_ID, CHART_EVENT_OBJECT_DELETE, 0, value))
          {         //--- display the error message in Experts journal
                    Print(__FUNCTION__ + ", Error Code = ", GetLastError());
                    ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
                    return(false); }
//--- store the value of the chart property in memory
          result = value;
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//--- successful execution
          return(true); }
//+--------------------------------------------------------------------------+
//| The function enables/disables the mode of sending messages concerning    |
//| the event of a graphic object deletion to all mql4 applications on the   |
//| chart.                                                                   |
//+--------------------------------------------------------------------------+
bool  Cg_DevChartWindow::ChartEventObjectDeleteSet(const bool value, const long chart_ID = 0)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//--- reset the error value
          ResetLastError();
//--- set property value
          if(!ChartSetInteger(chart_ID, CHART_EVENT_OBJECT_DELETE, 0, value))
          {         //--- display the error message in Experts journal
                    Print(__FUNCTION__ + ", Error Code = ", GetLastError());
                    ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
                    return(false); }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//--- successful execution
          return(true); }



//+------------------------------------------------------------------+
//| The function receives chart background color.                    |
//+------------------------------------------------------------------+
color Cg_DevChartWindow::ChartBackColorGet(const long chart_ID = 0)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//--- prepare the variable to receive the color
          long result = clrNONE;
//--- reset the error value
          ResetLastError();
//--- receive chart background color
          if(!ChartGetInteger(chart_ID, CHART_COLOR_BACKGROUND, 0, result))
          {         //--- display the error message in Experts journal
                    Print(__FUNCTION__ + ", Error Code = ", GetLastError()); }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//--- return the value of the chart property
          return((color)result); }
//+------------------------------------------------------------------+
//| The function sets chart background color.                        |
//+------------------------------------------------------------------+
bool Cg_DevChartWindow::ChartBackColorSet(const color clr, const long chart_ID = 0)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//--- reset the error value
          ResetLastError();
//--- set the chart background color
          if(!ChartSetInteger(chart_ID, CHART_COLOR_BACKGROUND, clr))
          {         //--- display the error message in Experts journal
                    Print(__FUNCTION__ + ", Error Code = ", GetLastError());
                    return(false); }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//--- successful execution
          return(true); }




//+------------------------------------------------------------------+
//| The function receives the color of axes, scale and OHLC line.    |
//+------------------------------------------------------------------+
color Cg_DevChartWindow::ChartForeColorGet(const long chart_ID = 0)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//--- prepare the variable to receive the color
          long result = clrNONE;
//--- reset the error value
          ResetLastError();
//--- receive the color of axes, scale and OHLC line
          if(!ChartGetInteger(chart_ID, CHART_COLOR_FOREGROUND, 0, result))
          {         //--- display the error message in Experts journal
                    Print(__FUNCTION__ + ", Error Code = ", GetLastError()); }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//--- return the value of the chart property
          return((color)result); //
}
//+------------------------------------------------------------------+
//| The function sets the color of axes, scale and OHLC line.        |
//+------------------------------------------------------------------+
bool Cg_DevChartWindow::ChartForeColorSet(const color clr, const long chart_ID = 0)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//--- reset the error value
          ResetLastError();
//--- set the color of axes, scale and OHLC line
          if(!ChartSetInteger(chart_ID, CHART_COLOR_FOREGROUND, clr))
          {         //--- display the error message in Experts journal
                    Print(__FUNCTION__ + ", Error Code = ", GetLastError());
                    return(false); }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//--- successful execution
          return(true); //
}

//+------------------------------------------------------------------+
//| The function receives chart grid color.                          |
//+------------------------------------------------------------------+
color Cg_DevChartWindow::ChartGridColorGet(const long chart_ID = 0)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//--- prepare the variable to receive the color
          long result = clrNONE;
//--- reset the error value
          ResetLastError();
//--- receive chart grid color
          if(!ChartGetInteger(chart_ID, CHART_COLOR_GRID, 0, result))
          {         //--- display the error message in Experts journal
                    Print(__FUNCTION__ + ", Error Code = ", GetLastError()); }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//--- return the value of the chart property
          return((color)result); //
}
//+------------------------------------------------------------------+
//| The function sets chart grid color.                              |
//+------------------------------------------------------------------+
bool Cg_DevChartWindow::ChartGridColorSet(const color clr, const long chart_ID = 0)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//--- reset the error value
          ResetLastError();
//--- set chart grid color
          if(!ChartSetInteger(chart_ID, CHART_COLOR_GRID, clr))
          {         //--- display the error message in Experts journal
                    Print(__FUNCTION__ + ", Error Code = ", GetLastError());
                    return(false); }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//--- successful execution
          return(true); //
}

//+------------------------------------------------------------------+
//| The function receives color of volumes and market entry          |
//| levels.                                                          |
//+------------------------------------------------------------------+
color Cg_DevChartWindow::ChartVolumeColorGet(const long chart_ID = 0)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//--- prepare the variable to receive the color
          long result = clrNONE;
//--- reset the error value
          ResetLastError();
//--- receive color of volumes and market entry levels
          if(!ChartGetInteger(chart_ID, CHART_COLOR_VOLUME, 0, result))
          {         //--- display the error message in Experts journal
                    Print(__FUNCTION__ + ", Error Code = ", GetLastError()); }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//--- return the value of the chart property
          return((color)result); //
}
//+------------------------------------------------------------------+
//| The function sets the color of volumes and market entry          |
//| levels.                                                          |
//+------------------------------------------------------------------+
bool Cg_DevChartWindow::ChartVolumeColorSet(const color clr, const long chart_ID = 0)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//--- reset the error value
          ResetLastError();
//--- set color of volumes and market entry levels
          if(!ChartSetInteger(chart_ID, CHART_COLOR_VOLUME, clr))
          {         //--- display the error message in Experts journal
                    Print(__FUNCTION__ + ", Error Code = ", GetLastError());
                    return(false); }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//--- successful execution
          return(true); //
}

//+------------------------------------------------------------------+
//| The function receives color of up bar, its shadow and            |
//| border of a bullish candlestick's body.                          |
//+------------------------------------------------------------------+
color Cg_DevChartWindow::ChartUpColorGet(const long chart_ID = 0)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//--- prepare the variable to receive the color
          long result = clrNONE;
//--- reset the error value
          ResetLastError();
//--- receive the color of up bar, its shadow and border of bullish candlestick's body
          if(!ChartGetInteger(chart_ID, CHART_COLOR_CHART_UP, 0, result))
          {         //--- display the error message in Experts journal
                    Print(__FUNCTION__ + ", Error Code = ", GetLastError()); }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//--- return the value of the chart property
          return((color)result);//
}
//+------------------------------------------------------------------+
//| The function sets color of up bar, its shadow and                |
//| border of a bullish candlestick's body.                          |
//+------------------------------------------------------------------+
bool Cg_DevChartWindow::ChartUpColorSet(const color clr, const long chart_ID = 0)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//--- reset the error value
          ResetLastError();
//--- set the color of up bar, its shadow and border of body of a bullish candlestick
          if(!ChartSetInteger(chart_ID, CHART_COLOR_CHART_UP, clr))
          {         //--- display the error message in Experts journal
                    Print(__FUNCTION__ + ", Error Code = ", GetLastError());
                    return(false); }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//--- successful execution
          return(true);//
}

//+------------------------------------------------------------------+
//| The function receives color of up bar, its shadow and            |
//| border of a bearish candlestick's body.                          |
//+------------------------------------------------------------------+
color Cg_DevChartWindow::ChartDownColorGet(const long chart_ID = 0)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//--- prepare the variable to receive the color
          long result = clrNONE;
//--- reset the error value
          ResetLastError();
//--- receive the color of down bar, its shadow and border of bearish candlestick's body
          if(!ChartGetInteger(chart_ID, CHART_COLOR_CHART_DOWN, 0, result))
          {         //--- display the error message in Experts journal
                    Print(__FUNCTION__ + ", Error Code = ", GetLastError()); }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//--- return the value of the chart property
          return((color)result); //
}
//+------------------------------------------------------------------+
//| The function sets color of down bar, its shadow and              |
//| border of a bearish candlestick's body.                          |
//+------------------------------------------------------------------+
bool Cg_DevChartWindow::ChartDownColorSet(const color clr, const long chart_ID = 0)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//--- reset the error value
          ResetLastError();
//--- set the color of down bar, its shadow and border of bearish candlestick's body
          if(!ChartSetInteger(chart_ID, CHART_COLOR_CHART_DOWN, clr))
          {         //--- display the error message in Experts journal
                    Print(__FUNCTION__ + ", Error Code = ", GetLastError());
                    return(false); }
//--- successful execution
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
          return(true); //
}

//+------------------------------------------------------------------------+
//| The function receives color of the chart line and Doji candlesticks.   |
//+------------------------------------------------------------------------+
color Cg_DevChartWindow::ChartLineColorGet(const long chart_ID = 0)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//--- prepare the variable to receive the color
          long result = clrNONE;
//--- reset the error value
          ResetLastError();
//--- receive color of the chart line and Doji candlesticks
          if(!ChartGetInteger(chart_ID, CHART_COLOR_CHART_LINE, 0, result))
          {         //--- display the error message in Experts journal
                    Print(__FUNCTION__ + ", Error Code = ", GetLastError()); }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//--- return the value of the chart property
          return((color)result); //
}
//+------------------------------------------------------------------+
//| The function sets the color of the chart line and Doji           |
//| candlesticks.                                                    |
//+------------------------------------------------------------------+
bool Cg_DevChartWindow::ChartLineColorSet(const color clr, const long chart_ID = 0)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//--- reset the error value
          ResetLastError();
//--- set color of the chart line and Doji candlesticks
          if(!ChartSetInteger(chart_ID, CHART_COLOR_CHART_LINE, clr))
          {         //--- display the error message in Experts journal
                    Print(__FUNCTION__ + ", Error Code = ", GetLastError());
                    return(false); }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//--- successful execution
          return(true);//
}

//+------------------------------------------------------------------+
//| The function receives color of bullish candlestick's body.       |
//+------------------------------------------------------------------+
color Cg_DevChartWindow::ChartBullColorGet(const long chart_ID = 0)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//--- prepare the variable to receive the color
          long result = clrNONE;
//--- reset the error value
          ResetLastError();
//--- receive the color of bullish candlestick's body
          if(!ChartGetInteger(chart_ID, CHART_COLOR_CANDLE_BULL, 0, result))
          {         //--- display the error message in Experts journal
                    Print(__FUNCTION__ + ", Error Code = ", GetLastError()); }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//--- return the value of the chart property
          return((color)result);//
}
//+------------------------------------------------------------------+
//| The function sets color of bullish candlestick's body.           |
//+------------------------------------------------------------------+
bool Cg_DevChartWindow::ChartBullColorSet(const color clr, const long chart_ID = 0)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//--- reset the error value
          ResetLastError();
//--- set the color of bullish candlestick's body
          if(!ChartSetInteger(chart_ID, CHART_COLOR_CANDLE_BULL, clr))
          {         //--- display the error message in Experts journal
                    Print(__FUNCTION__ + ", Error Code = ", GetLastError());
                    return(false); }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//--- successful execution
          return(true); //
}

//+------------------------------------------------------------------+
//| The function receives color of bearish candlestick's body.       |
//+------------------------------------------------------------------+
color Cg_DevChartWindow::ChartBearColorGet(const long chart_ID = 0)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//--- prepare the variable to receive the color
          long result = clrNONE;
//--- reset the error value
          ResetLastError();
//--- receive the color of bearish candlestick's body
          if(!ChartGetInteger(chart_ID, CHART_COLOR_CANDLE_BEAR, 0, result))
          {         //--- display the error message in Experts journal
                    Print(__FUNCTION__ + ", Error Code = ", GetLastError()); }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//--- return the value of the chart property
          return((color)result);//
}
//+------------------------------------------------------------------+
//| The function sets color of bearish candlestick's body.           |
//+------------------------------------------------------------------+
bool Cg_DevChartWindow::ChartBearColorSet(const color clr, const long chart_ID = 0)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//--- reset the error value
          ResetLastError();
//--- set the color of bearish candlestick's body
          if(!ChartSetInteger(chart_ID, CHART_COLOR_CANDLE_BEAR, clr))
          {         //--- display the error message in Experts journal
                    Print(__FUNCTION__ + ", Error Code = ", GetLastError());
                    return(false); }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//--- successful execution
          return(true);//
}

//+------------------------------------------------------------------+
//| The function receives the color of Bid line.                     |
//+------------------------------------------------------------------+
color Cg_DevChartWindow::ChartBidColorGet(const long chart_ID = 0)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//--- prepare the variable to receive the color
          long result = clrNONE;
//--- reset the error value
          ResetLastError();
//--- receive the color of Bid price line
          if(!ChartGetInteger(chart_ID, CHART_COLOR_BID, 0, result))
          {         //--- display the error message in Experts journal
                    Print(__FUNCTION__ + ", Error Code = ", GetLastError()); }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//--- return the value of the chart property
          return((color)result);//
}
//+------------------------------------------------------------------+
//| The function sets the color of Bid line.                         |
//+------------------------------------------------------------------+
bool Cg_DevChartWindow::ChartBidColorSet(const color clr, const long chart_ID = 0)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//--- reset the error value
          ResetLastError();
//--- set the color of Bid price line
          if(!ChartSetInteger(chart_ID, CHART_COLOR_BID, clr))
          {         //--- display the error message in Experts journal
                    Print(__FUNCTION__ + ", Error Code = ", GetLastError());
                    return(false); }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//--- successful execution
          return(true);//
}

//+------------------------------------------------------------------+
//| The function receives the color of Ask line.                     |
//+------------------------------------------------------------------+
color Cg_DevChartWindow::ChartAskColorGet(const long chart_ID = 0)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//--- prepare the variable to receive the color
          long result = clrNONE;
//--- reset the error value
          ResetLastError();
//--- receive the color of Ask price line
          if(!ChartGetInteger(chart_ID, CHART_COLOR_ASK, 0, result))
          {         //--- display the error message in Experts journal
                    Print(__FUNCTION__ + ", Error Code = ", GetLastError()); }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//--- return the value of the chart property
          return((color)result);//
}
//+------------------------------------------------------------------+
//| The function sets the color of Ask line.                         |
//+------------------------------------------------------------------+
bool Cg_DevChartWindow::ChartAskColorSet(const color clr, const long chart_ID = 0)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//--- reset the error value
          ResetLastError();
//--- set the color of Ask price line
          if(!ChartSetInteger(chart_ID, CHART_COLOR_ASK, clr))
          {         //--- display the error message in Experts journal
                    Print(__FUNCTION__ + ", Error Code = ", GetLastError());
                    return(false); }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//--- successful execution
          return(true);//
}

//+----------------------------------------------------------------------+
//| The function receives color of the last performed deal's price line. |
//+----------------------------------------------------------------------+
color Cg_DevChartWindow::ChartLastColorGet(const long chart_ID = 0)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//--- prepare the variable to receive the color
          long result = clrNONE;
//--- reset the error value
          ResetLastError();
//--- receive color of the last performed deal's price line (Last)
          if(!ChartGetInteger(chart_ID, CHART_COLOR_LAST, 0, result))
          {         //--- display the error message in Experts journal
                    Print(__FUNCTION__ + ", Error Code = ", GetLastError()); }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//--- return the value of the chart property
          return((color)result); //
}
//+------------------------------------------------------------------+
//| The function sets color of the last performed deal's price       |
//| line.                                                            |
//+------------------------------------------------------------------+
bool Cg_DevChartWindow::ChartLastColorSet(const color clr, const long chart_ID = 0)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//--- reset the error value
          ResetLastError();
//--- set color of the last performed deal's price line (Last)
          if(!ChartSetInteger(chart_ID, CHART_COLOR_LAST, clr))
          {         //--- display the error message in Experts journal
                    Print(__FUNCTION__ + ", Error Code = ", GetLastError());
                    return(false); }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//--- successful execution
          return(true); //
}

//+--------------------------------------------------------------------+
//| The function receives colors of Stop Loss and Take Profit levels.  |
//+--------------------------------------------------------------------+
color Cg_DevChartWindow::ChartStopLevelColorGet(const long chart_ID = 0)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//--- prepare the variable to receive the color
          long result = clrNONE;
//--- reset the error value
          ResetLastError();
//--- receive the color of stop order levels (Stop Loss and Take Profit)
          if(!ChartGetInteger(chart_ID, CHART_COLOR_STOP_LEVEL, 0, result))
          {         //--- display the error message in Experts journal
                    Print(__FUNCTION__ + ", Error Code = ", GetLastError()); }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//--- return the value of the chart property
          return((color)result); //
}
//+------------------------------------------------------------------+
//| The function sets Stop Loss and Take Profit level colors.        |
//+------------------------------------------------------------------+
bool Cg_DevChartWindow::ChartStopLevelColorSet(const color clr, const long chart_ID = 0)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//--- reset the error value
          ResetLastError();
//--- set the color of stop order levels (Stop Loss and Take Profit)
          if(!ChartSetInteger(chart_ID, CHART_COLOR_STOP_LEVEL, clr))
          {         //--- display the error message in Experts journal
                    Print(__FUNCTION__ + ", Error Code = ", GetLastError());
                    return(false); }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//--- successful execution
          return(true);//
}

//+---------------------------------------------------------------------+
//| The function defines if trading levels are displayed on the chart.  |
//+---------------------------------------------------------------------+
bool Cg_DevChartWindow::ChartShowTradeLevelsGet(bool &result, const long chart_ID = 0)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//--- prepare the variable to get the property value
          long value;
//--- reset the error value
          ResetLastError();
//--- receive the property value
          if(!ChartGetInteger(chart_ID, CHART_SHOW_TRADE_LEVELS, 0, value))
          {         //--- display the error message in Experts journal
                    Print(__FUNCTION__ + ", Error Code = ", GetLastError());
                    return(false); }
//--- store the value of the chart property in memory
          result = value;
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//--- successful execution
          return(true); //
}
//+------------------------------------------------------------------+
//| The function enables/disables trading levels display mode.       |
//+------------------------------------------------------------------+
bool Cg_DevChartWindow::ChartShowTradeLevelsSet(const bool value, const long chart_ID = 0)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//--- reset the error value
          ResetLastError();
//--- set property value
          if(!ChartSetInteger(chart_ID, CHART_SHOW_TRADE_LEVELS, 0, value))
          {         //--- display the error message in Experts journal
                    Print(__FUNCTION__ + ", Error Code = ", GetLastError());
                    return(false); }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//--- successful execution
          return(true); //
}

//+---------------------------------------------------------------------------+
//| The function defines if dragging trading levels on a chart using mouse    |
//| is allowed.                                                               |
//+---------------------------------------------------------------------------+
bool Cg_DevChartWindow::ChartDragTradeLevelsGet(bool &result, const long chart_ID = 0)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//--- prepare the variable to get the property value
          long value;
//--- reset the error value
          ResetLastError();
//--- receive the property value
          if(!ChartGetInteger(chart_ID, CHART_DRAG_TRADE_LEVELS, 0, value))
          {         //--- display the error message in Experts journal
                    Print(__FUNCTION__ + ", Error Code = ", GetLastError());
                    return(false); }
//--- store the value of the chart property in memory
          result = value;
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//--- successful execution
          return(true); //
}
//+------------------------------------------------------------------+
//| The function enables/disables the mode of dragging trade levels  |
//| on the chart using mouse.                                        |
//+------------------------------------------------------------------+
bool Cg_DevChartWindow::ChartDragTradeLevelsSet(const bool value, const long chart_ID = 0)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//--- reset the error value
          ResetLastError();
//--- set property value
          if(!ChartSetInteger(chart_ID, CHART_DRAG_TRADE_LEVELS, 0, value))
          {         //--- display the error message in Experts journal
                    Print(__FUNCTION__ + ", Error Code = ", GetLastError());
                    return(false); }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//--- successful execution
          return(true);//
}

//+--------------------------------------------------------------------+
//| The function defines if the time scale is displayed on the chart.  |
//+--------------------------------------------------------------------+
bool Cg_DevChartWindow::ChartShowDateScaleGet(bool &result, const long chart_ID = 0)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//--- prepare the variable to get the property value
          long value;
//--- reset the error value
          ResetLastError();
//--- receive the property value
          if(!ChartGetInteger(chart_ID, CHART_SHOW_DATE_SCALE, 0, value))
          {         //--- display the error message in Experts journal
                    Print(__FUNCTION__ + ", Error Code = ", GetLastError());
                    return(false); }
//--- store the value of the chart property in memory
          result = value;
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//--- successful execution
          return(true); //
}
//+-----------------------------------------------------------------------------+
//| The function enables/disables the mode of displaying the time scale on a    |
//| chart.                                                                      |
//+-----------------------------------------------------------------------------+
bool Cg_DevChartWindow::ChartShowDateScaleSet(const bool value, const long chart_ID = 0)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//--- reset the error value
          ResetLastError();
//--- set property value
          if(!ChartSetInteger(chart_ID, CHART_SHOW_DATE_SCALE, 0, value))
          {         //--- display the error message in Experts journal
                    Print(__FUNCTION__ + ", Error Code = ", GetLastError());
                    return(false); }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//--- successful execution
          return(true); //
}

//+--------------------------------------------------------------------+
//| The function defines if the price scale is displayed on the chart. |
//+--------------------------------------------------------------------+
bool Cg_DevChartWindow::ChartShowPriceScaleGet(bool &result, const long chart_ID = 0)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//--- prepare the variable to get the property value
          long value;
//--- reset the error value
          ResetLastError();
//--- receive the property value
          if(!ChartGetInteger(chart_ID, CHART_SHOW_PRICE_SCALE, 0, value))
          {         //--- display the error message in Experts journal
                    Print(__FUNCTION__ + ", Error Code = ", GetLastError());
                    return(false); }
//--- store the value of the chart property in memory
          result = value;
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//--- successful execution
          return(true); //
}
//+----------------------------------------------------------------------------+
//| The function enables/disables the mode of displaying the price scale on a  |
//| chart.                                                                     |
//+----------------------------------------------------------------------------+
bool Cg_DevChartWindow::ChartShowPriceScaleSet(const bool value, const long chart_ID = 0)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//--- reset the error value
          ResetLastError();
//--- set property value
          if(!ChartSetInteger(chart_ID, CHART_SHOW_PRICE_SCALE, 0, value))
          {         //--- display the error message in Experts journal
                    Print(__FUNCTION__ + ", Error Code = ", GetLastError());
                    return(false); }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//--- successful execution
          return(true); //
}

//+---------------------------------------------------------------------------+
//| The function receives shift size of the zero bar from the right border    |
//| of the chart in percentage values (from 10% up to 50%).                   |
//+---------------------------------------------------------------------------+
double Cg_DevChartWindow::ChartShiftSizeGet(const long chart_ID = 0)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//--- prepare the variable to get the result
          double result = EMPTY_VALUE;
//--- reset the error value
          ResetLastError();
//--- receive the property value
          if(!ChartGetDouble(chart_ID, CHART_SHIFT_SIZE, 0, result))
          {         //--- display the error message in Experts journal
                    Print(__FUNCTION__ + ", Error Code = ", GetLastError()); }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//--- return the value of the chart property
          return(result); //
}
//+--------------------------------------------------------------------------------------+
//| The function sets the shift size of the zero bar from the right                      |
//| border of the chart in percentage values (from 10% up to 50%). To enable the shift   |
//| mode, CHART_SHIFT property value should be set to                                    |
//| true.                                                                                |
//+--------------------------------------------------------------------------------------+
bool Cg_DevChartWindow::ChartShiftSizeSet(const double value, const long chart_ID = 0)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//--- reset the error value
          ResetLastError();
//--- set property value
          if(!ChartSetDouble(chart_ID, CHART_SHIFT_SIZE, value))
          {         //--- display the error message in Experts journal
                    Print(__FUNCTION__ + ", Error Code = ", GetLastError());
                    return(false); }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//--- successful execution
          return(true); //
}
//+------------------------------------------------------------------+
//| The function checks offline mode of the chart                    |
//+------------------------------------------------------------------+
bool Cg_DevChartWindow::CheckChartOffline(const long chart_ID = 0)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
          bool offline = ChartGetInteger(chart_ID, CHART_IS_OFFLINE);
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
          return(offline);//
}
//+--------------------------------------------------------------------------+
//| The function receives the location of the chart fixed position from the  |
//| left border in percentage value.                                         |
//+--------------------------------------------------------------------------+
double Cg_DevChartWindow::ChartFixedPositionGet(const long chart_ID = 0)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//--- prepare the variable to get the result
          double result = EMPTY_VALUE;
//--- reset the error value
          ResetLastError();
//--- receive the property value
          if(!ChartGetDouble(chart_ID, CHART_FIXED_POSITION, 0, result))
          {         //--- display the error message in Experts journal
                    Print(__FUNCTION__ + ", Error Code = ", GetLastError()); }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//--- return the value of the chart property
          return(result); //
}
//+---------------------------------------------------------------------+
//| The function sets the location of the chart fixed position from the |
//| left border in percentage value. To view the location of the        |
//| chart fixed position, the value of                                  |
//| CHART_AUTOSCROLL property should be set to false.                   |
//+---------------------------------------------------------------------+
bool Cg_DevChartWindow::ChartFixedPositionSet(const double value, const long chart_ID = 0)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//--- reset the error value
          ResetLastError();
//--- set property value
          if(!ChartSetDouble(chart_ID, CHART_FIXED_POSITION, value))
          {         //--- display the error message in Experts journal
                    Print(__FUNCTION__ + ", Error Code = ", GetLastError());
                    return(false); }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//--- successful execution
          return(true);//
}
//+------------------------------------------------------------------+
//| The function receives the value of chart's fixed maximum.        |
//+------------------------------------------------------------------+
double Cg_DevChartWindow:: ChartFixedMaxGet(const long chart_ID = 0)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//--- prepare the variable to get the result
          double result = EMPTY_VALUE;
//--- reset the error value
          ResetLastError();
//--- receive the property value
          if(!ChartGetDouble(chart_ID, CHART_FIXED_MAX, 0, result))
          {         //--- display the error message in Experts journal
                    Print(__FUNCTION__ + ", Error Code = ", GetLastError()); }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//--- return the value of the chart property
          return(result); //
}
//+------------------------------------------------------------------+
//| The function sets the value of chart's fixed maximum.            |
//| To change the value of the property,                             |
//| CHART_SCALEFIX property value should be preliminarily set to     |
//| true.                                                            |
//+------------------------------------------------------------------+
bool Cg_DevChartWindow::ChartFixedMaxSet(const double value, const long chart_ID = 0)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//--- reset the error value
          ResetLastError();
//--- set property value
          if(!ChartSetDouble(chart_ID, CHART_FIXED_MAX, value))
          {         //--- display the error message in Experts journal
                    Print(__FUNCTION__ + ", Error Code = ", GetLastError());
                    return(false); }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//--- successful execution
          return(true); //
}

//+------------------------------------------------------------------+
//| The function receives the value of chart's fixed minimum.        |
//+------------------------------------------------------------------+
double Cg_DevChartWindow::ChartFixedMinGet(const long chart_ID = 0)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//--- prepare the variable to get the result
          double result = EMPTY_VALUE;
//--- reset the error value
          ResetLastError();
//--- receive the property value
          if(!ChartGetDouble(chart_ID, CHART_FIXED_MIN, 0, result))
          {         //--- display the error message in Experts journal
                    Print(__FUNCTION__ + ", Error Code = ", GetLastError()); }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//--- return the value of the chart property
          return(result); //
}
//+------------------------------------------------------------------+
//| The function sets the value of chart's fixed minimum.            |
//| To change the value of the property,                             |
//| CHART_SCALEFIX property value should be preliminarily set to     |
//| true.                                                            |
//+------------------------------------------------------------------+
bool Cg_DevChartWindow::ChartFixedMinSet(const double value, const long chart_ID = 0)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//--- reset the error value
          ResetLastError();
//--- set property value
          if(!ChartSetDouble(chart_ID, CHART_FIXED_MIN, value))
          {         //--- display the error message in Experts journal
                    Print(__FUNCTION__ + ", Error Code = ", GetLastError());
                    return(false); }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//--- successful execution
          return(true);//
}
//+---------------------------------------------------------------------------+
//| The function receives the value of the chart scale in points per bar.     |
//+---------------------------------------------------------------------------+
double Cg_DevChartWindow::ChartPointsPerBarGet(const long chart_ID = 0)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//--- prepare the variable to get the result
          double result = EMPTY_VALUE;
//--- reset the error value
          ResetLastError();
//--- receive the property value
          if(!ChartGetDouble(chart_ID, CHART_POINTS_PER_BAR, 0, result))
          {         //--- display the error message in Experts journal
                    Print(__FUNCTION__ + ", Error Code = ", GetLastError()); }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//--- return the value of the chart property
          return(result); //
}
//+----------------------------------------------------------------------+
//| The function sets the value of the chart scale in points per bar.    |
//| To view the result of this property's value change,                  |
//| the value of                                                         |
//| CHART_SCALE_PT_PER_BAR property should be preliminarily set to true. |
//+----------------------------------------------------------------------+
bool Cg_DevChartWindow::ChartPointsPerBarSet(const double value, const long chart_ID = 0)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//--- reset the error value
          ResetLastError();
//--- set property value
          if(!ChartSetDouble(chart_ID, CHART_POINTS_PER_BAR, value))
          {         //--- display the error message in Experts journal
                    Print(__FUNCTION__ + ", Error Code = ", GetLastError());
                    return(false); }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//--- successful execution
          return(true);//
}
//+---------------------------------------------------------------------------------+
//| The function receives the value of the chart minimum in the main window or a    |
//| subwindow.                                                                      |
//+---------------------------------------------------------------------------------+
double Cg_DevChartWindow::ChartPriceMin(const long chart_ID = 0, const int sub_window = 0)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//--- prepare the variable to get the result
          double result = EMPTY_VALUE;
//--- reset the error value
          ResetLastError();
//--- receive the property value
          if(!ChartGetDouble(chart_ID, CHART_PRICE_MIN, sub_window, result))
          {         //--- display the error message in Experts journal
                    Print(__FUNCTION__ + ", Error Code = ", GetLastError()); }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//--- return the value of the chart property
          return(result); //
}
//+--------------------------------------------------------------------------------+
//| The function receives the value of the chart maximum in the main window or a   |
//| subwindow.                                                                     |
//+--------------------------------------------------------------------------------+
double Cg_DevChartWindow::ChartPriceMax(const long chart_ID = 0, const int sub_window = 0)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//--- prepare the variable to get the result
          double result = EMPTY_VALUE;
//--- reset the error value
          ResetLastError();
//--- receive the property value
          if(!ChartGetDouble(chart_ID, CHART_PRICE_MAX, sub_window, result))
          {         //--- display the error message in Experts journal
                    Print(__FUNCTION__ + ", Error Code = ", GetLastError()); }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//--- return the value of the chart property
          return(result);//
}


//+----------------------------------------------------------------------+
//| The function receives comment in the upper left corner of the chart. |
//+----------------------------------------------------------------------+
bool Cg_DevChartWindow::ChartCommentGet(string &result, const long chart_ID = 0)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//--- reset the error value
          ResetLastError();
//--- receive the property value
          if(!ChartGetString(chart_ID, CHART_COMMENT, result))
          {         //--- display the error message in Experts journal
                    Print(__FUNCTION__ + ", Error Code = ", GetLastError());
                    return(false); }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//--- successful execution
          return(true);//
}
//+------------------------------------------------------------------+
//| The function sets comment in the upper left corner of the        |
//| chart.                                                           |
//+------------------------------------------------------------------+
bool Cg_DevChartWindow::ChartCommentSet(const string str, const long chart_ID = 0)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//--- reset the error value
          ResetLastError();
//--- set property value
          if(!ChartSetString(chart_ID, CHART_COMMENT, str))
          {         //--- display the error message in Experts journal
                    Print(__FUNCTION__ + ", Error Code = ", GetLastError());
                    return(false); }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//--- successful execution
          return(true); //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Cg_DevChartWindow::OBJ_cleaner()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//Alert("(3270)-"+"OBJ_cleaner");//
//Print("Expert removed: ", WindowExpertName());
//GlobalVariablesDeleteAll(WindowExpertName());
//GlobalVariableCheck();
//Checks the existence of a global variable with the specified name
//GlobalVariableTime();
//Returns time of the last accessing the global variable
//GlobalVariableDel();
//Deletes a global variable
//GlobalVariableGet();
//Returns the value of a global variable
//GlobalVariableName();
//Returns the name of a global variable by its ordinal number in the list of global variables
//GlobalVariableSet();
//Sets the new value to a global variable
//GlobalVariablesFlush();
//Forcibly saves contents of all global variables to a disk
//GlobalVariableTemp();
//Sets the new value to a global variable, that exists only in the current session of the terminal
//GlobalVariableSetOnCondition();
//Sets the new value of the existing global variable by condition
//GlobalVariablesDeleteAll();
//Deletes global variables with the specified prefix in their names
//GlobalVariablesTotal();
////
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
          return;//
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Cg_DevChartWindow::ChartClick(long chart_id, ushort  custom_event_id, long lparam, double dparam, string  sparam )
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
          long          m_id                    = NULL;
          long          INTERNAL_EVENTCom       = SetCustom.p_INTERNAL_EVENT     = chart_id; //
          ushort        ON_MOUSE_FOCUS_SETCom   = SetCustom.p_ON_MOUSE_FOCUS_SET = 2000;//
          bool          MOUSE_FOCUS_SET = EventChartCustom(chart_id = INTERNAL_EVENT, custom_event_id = ON_MOUSE_FOCUS_SET, lparam = m_id, dparam = 0.0, sparam = UseNameX = "Xgreen");
          bool          OBJECT_CREATE = EventChartCustom(chart_id = INTERNAL_EVENT, custom_event_id = CHARTEVENT_OBJECT_CREATE, lparam = m_id, dparam = 0.0, sparam = UseNameX = "Xgreen");
          //===============================================
          if(OBJECT_CREATE)
          {         //Alert((string)EventChartCustomsOBJECT_CREATE + "++" + (string)_LastError); //
          };
//
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
          return;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int Cg_DevChartWindow::Set_Theme(long SaveChartID = 0, long ChartOpenID = 0, int Keylight = 0, string  argfilename = NULL, bool resultA = false ) //apply teamplate
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
//WindowScreenShoter();
          if(SaveChartID != ChartOpenID)ChartData_ChartInfo.ID = ChartOpenID;
          if(false)
          {         bool  KeyTemplateNext = ChartApplyTemplate(ChartData_ChartInfo.ID, argfilename = "Style fantazi _One.tpl");
                    if(!KeyTemplateNext) ________________________________________________________Xerorr.SuperviserX(_LastError, "ChartApplyTemplate Error",  __LINE__, __FUNCTION__); //|
                    //bool  KeyTemplateNext = ChartApplyTemplate(ChartData_ChartInfo.ID, argfilename = "Style fantazi _One.tpl");
                    //if(!KeyTemplateNext)a1.ERRORX("ChartApplyTemplate", NULL, NULL, _LastError, NULL);
                    //////ChartApplyTemplate(0, "12-36-89 zigzager.tpl");
          }
          if(false)
          {         ChartData_ChartInfo.Timeframe =  ChartPeriod(ChartData_ChartInfo.ID);
                    long result = clrNONE;
                    if(!ChartGetInteger(ChartData_ChartInfo.ID, CHART_COLOR_BACKGROUND, 0, result))
                    {         color argCHART_COLOR_BACKGROUND = (color)result;
                              Print(argCHART_COLOR_BACKGROUND);//
                    } //
          }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //
          Chart_Colors_A.COLOR_BACKGROUND      =  C'9,52,85'; //clrBlack; 9,42,214 C'128,128,128'    // Gray  C'9,42,214'  //9,52,85
          Chart_Colors_A.COLOR_FOREGROUND      =  clrSnow;
          Chart_Colors_A.COLOR_GRID            =  clrLavender;
          Chart_Colors_A.COLOR_VOLUME          =  clrSnow;
          Chart_Colors_A.COLOR_CHART_UP        =  clrDarkTurquoise;
          Chart_Colors_A.COLOR_CHART_DOWN      =  clrTomato;
          Chart_Colors_A.COLOR_CHART_LINE      =  clrYellowGreen;
          Chart_Colors_A.COLOR_CANDLE_BULL     =  clrDarkTurquoise;
          Chart_Colors_A.COLOR_CANDLE_BEAR     =  clrTomato;
          Chart_Colors_A.COLOR_BID             =  clrBlue;
          Chart_Colors_A.COLOR_ASK             =  clrRed;
          Chart_Colors_A.COLOR_LAST            =  clrYellow;
          Chart_Colors_A.COLOR_STOP_LEVEL      =  clrDeepPink;
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //
          Chart_Colors_B.COLOR_BACKGROUND      =  clrWhite;
          Chart_Colors_B.COLOR_FOREGROUND      =  clrBlack;
          Chart_Colors_B.COLOR_GRID            =  clrBrown;
          Chart_Colors_B.COLOR_VOLUME          =  clrRoyalBlue;
          Chart_Colors_B.COLOR_CHART_UP        =  clrDarkTurquoise;
          Chart_Colors_B.COLOR_CHART_DOWN      =  clrTomato;
          Chart_Colors_B.COLOR_CHART_LINE      =  clrYellowGreen;
          Chart_Colors_B.COLOR_CANDLE_BULL     =  clrDarkTurquoise;
          Chart_Colors_B.COLOR_CANDLE_BEAR     =  clrTomato;
          Chart_Colors_B.COLOR_BID             =  clrBlue;
          Chart_Colors_B.COLOR_ASK             =  clrRed;
          Chart_Colors_B.COLOR_LAST            =  clrYellow;
          Chart_Colors_B.COLOR_STOP_LEVEL      =  clrDeepPink;
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //
          Chart_Colors_C.COLOR_BACKGROUND      =  clrWheat;
          Chart_Colors_C.COLOR_FOREGROUND      =  clrWheat;
          Chart_Colors_C.COLOR_GRID            =  clrBrown;
          Chart_Colors_C.COLOR_VOLUME          =  clrGreen;
          Chart_Colors_C.COLOR_CHART_UP        =  clrWhite;
          Chart_Colors_C.COLOR_CHART_DOWN      =  clrRed;
          Chart_Colors_C.COLOR_CANDLE_BULL     =  clrWheat;
          Chart_Colors_C.COLOR_CANDLE_BEAR     =  clrRed;
          Chart_Colors_C.COLOR_CHART_LINE      =  clrFireBrick;
          Chart_Colors_C.COLOR_BID             =  clrBlue;
          Chart_Colors_C.COLOR_ASK             =  clrRed;
          Chart_Colors_C.COLOR_LAST            =  clrYellow;
          Chart_Colors_C.COLOR_STOP_LEVEL      =  clrDeepPink;
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //
          if(true) {   Chart_Colors_C.COLOR_BACKGROUND = Utilities.RandomColor();}
          switch (Keylight)
          {         case 0:
                    {         bool argCHART_COLOR_BACKGROUND       = ChartSetInteger(ChartData_ChartInfo.ID, CHART_COLOR_BACKGROUND,  Chart_Colors_A.COLOR_BACKGROUND);
                              bool argCHART_COLOR_FOREGROUND       = ChartSetInteger(ChartData_ChartInfo.ID, CHART_COLOR_FOREGROUND,  Chart_Colors_A.COLOR_FOREGROUND);
                              bool argCHART_COLOR_GRID             = ChartSetInteger(ChartData_ChartInfo.ID, CHART_COLOR_GRID,        Chart_Colors_A.COLOR_GRID);
                              bool argCHART_COLOR_VOLUME           = ChartSetInteger(ChartData_ChartInfo.ID, CHART_COLOR_VOLUME,      Chart_Colors_A.COLOR_VOLUME);
                              bool argCHART_COLOR_CHART_UP         = ChartSetInteger(ChartData_ChartInfo.ID, CHART_COLOR_CHART_UP,    Chart_Colors_A.COLOR_CHART_UP);
                              bool argCHART_COLOR_CHART_DOWN       = ChartSetInteger(ChartData_ChartInfo.ID, CHART_COLOR_CHART_DOWN,  Chart_Colors_A.COLOR_CHART_DOWN);
                              bool argCHART_COLOR_CHART_LINE       = ChartSetInteger(ChartData_ChartInfo.ID, CHART_COLOR_CHART_LINE,  Chart_Colors_A.COLOR_CHART_LINE);
                              bool argCHART_COLOR_CANDLE_BULL      = ChartSetInteger(ChartData_ChartInfo.ID, CHART_COLOR_CANDLE_BULL, Chart_Colors_A.COLOR_CANDLE_BULL);
                              bool argCHART_COLOR_CANDLE_BEAR      = ChartSetInteger(ChartData_ChartInfo.ID, CHART_COLOR_CANDLE_BEAR, Chart_Colors_A.COLOR_CANDLE_BEAR);
                              bool argCHART_COLOR_BID              = ChartSetInteger(ChartData_ChartInfo.ID, CHART_COLOR_BID,         Chart_Colors_A.COLOR_BID);
                              bool argCHART_COLOR_ASK              = ChartSetInteger(ChartData_ChartInfo.ID, CHART_COLOR_ASK,         Chart_Colors_A.COLOR_ASK);
                              //bool argCHART_COLOR_LAST             = ChartSetInteger(ChartData_ChartInfo.ID, CHART_COLOR_LAST,        Chart_Colors_A.COLOR_LAST);
                              bool aegCHART_COLOR_STOP_LEVEL       = ChartSetInteger(ChartData_ChartInfo.ID, CHART_COLOR_STOP_LEVEL,  Chart_Colors_A.COLOR_STOP_LEVEL); //
                              ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //
                    }
                    return Keylight; break;
                    case 1:
                    {         bool argCHART_COLOR_BACKGROUND       = ChartSetInteger(ChartData_ChartInfo.ID, CHART_COLOR_BACKGROUND,  Chart_Colors_B.COLOR_BACKGROUND);
                              bool argCHART_COLOR_FOREGROUND       = ChartSetInteger(ChartData_ChartInfo.ID, CHART_COLOR_FOREGROUND,  Chart_Colors_B.COLOR_FOREGROUND);
                              bool argCHART_COLOR_GRID             = ChartSetInteger(ChartData_ChartInfo.ID, CHART_COLOR_GRID,        Chart_Colors_B.COLOR_GRID);
                              bool argCHART_COLOR_VOLUME           = ChartSetInteger(ChartData_ChartInfo.ID, CHART_COLOR_VOLUME,      Chart_Colors_B.COLOR_VOLUME);
                              bool argCHART_COLOR_CHART_UP         = ChartSetInteger(ChartData_ChartInfo.ID, CHART_COLOR_CHART_UP,    Chart_Colors_B.COLOR_CHART_UP);
                              bool argCHART_COLOR_CHART_DOWN       = ChartSetInteger(ChartData_ChartInfo.ID, CHART_COLOR_CHART_DOWN,  Chart_Colors_B.COLOR_CHART_DOWN);
                              bool argCHART_COLOR_CHART_LINE       = ChartSetInteger(ChartData_ChartInfo.ID, CHART_COLOR_CHART_LINE,  Chart_Colors_B.COLOR_CHART_LINE);
                              bool argCHART_COLOR_CANDLE_BULL      = ChartSetInteger(ChartData_ChartInfo.ID, CHART_COLOR_CANDLE_BULL, Chart_Colors_B.COLOR_CANDLE_BULL);
                              bool argCHART_COLOR_CANDLE_BEAR      = ChartSetInteger(ChartData_ChartInfo.ID, CHART_COLOR_CANDLE_BEAR, Chart_Colors_B.COLOR_CANDLE_BEAR);
                              bool argCHART_COLOR_BID              = ChartSetInteger(ChartData_ChartInfo.ID, CHART_COLOR_BID,         Chart_Colors_B.COLOR_BID);
                              bool argCHART_COLOR_ASK              = ChartSetInteger(ChartData_ChartInfo.ID, CHART_COLOR_ASK,         Chart_Colors_B.COLOR_ASK);
                              // bool argCHART_COLOR_LAST             = ChartSetInteger(ChartData_ChartInfo.ID, CHART_COLOR_LAST,        Chart_Colors_B.COLOR_LAST);
                              bool aegCHART_COLOR_STOP_LEVEL       = ChartSetInteger(ChartData_ChartInfo.ID, CHART_COLOR_STOP_LEVEL,  Chart_Colors_B.COLOR_STOP_LEVEL); //}
                              ///
                              ;
                              ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //
                    }
                    return Keylight; break; //
                    case 2:
                    {         bool argCHART_COLOR_BACKGROUND       = ChartSetInteger(ChartData_ChartInfo.ID, CHART_COLOR_BACKGROUND,  Chart_Colors_C.COLOR_BACKGROUND);
                              bool argCHART_COLOR_FOREGROUND       = ChartSetInteger(ChartData_ChartInfo.ID, CHART_COLOR_FOREGROUND,  Chart_Colors_C.COLOR_FOREGROUND);
                              bool argCHART_COLOR_GRID             = ChartSetInteger(ChartData_ChartInfo.ID, CHART_COLOR_GRID,        Chart_Colors_C.COLOR_GRID);
                              bool argCHART_COLOR_VOLUME           = ChartSetInteger(ChartData_ChartInfo.ID, CHART_COLOR_VOLUME,      Chart_Colors_C.COLOR_VOLUME);
                              bool argCHART_COLOR_CHART_UP         = ChartSetInteger(ChartData_ChartInfo.ID, CHART_COLOR_CHART_UP,    Chart_Colors_C.COLOR_CHART_UP);
                              bool argCHART_COLOR_CHART_DOWN       = ChartSetInteger(ChartData_ChartInfo.ID, CHART_COLOR_CHART_DOWN,  Chart_Colors_C.COLOR_CHART_DOWN);
                              bool argCHART_COLOR_CHART_LINE       = ChartSetInteger(ChartData_ChartInfo.ID, CHART_COLOR_CHART_LINE,  Chart_Colors_C.COLOR_CHART_LINE);
                              bool argCHART_COLOR_CANDLE_BULL      = ChartSetInteger(ChartData_ChartInfo.ID, CHART_COLOR_CANDLE_BULL, Chart_Colors_C.COLOR_CANDLE_BULL);
                              bool argCHART_COLOR_CANDLE_BEAR      = ChartSetInteger(ChartData_ChartInfo.ID, CHART_COLOR_CANDLE_BEAR, Chart_Colors_C.COLOR_CANDLE_BEAR);
                              bool argCHART_COLOR_BID              = ChartSetInteger(ChartData_ChartInfo.ID, CHART_COLOR_BID,         Chart_Colors_C.COLOR_BID);
                              bool argCHART_COLOR_ASK              = ChartSetInteger(ChartData_ChartInfo.ID, CHART_COLOR_ASK,         Chart_Colors_C.COLOR_ASK);
                              // bool argCHART_COLOR_LAST             = ChartSetInteger(ChartData_ChartInfo.ID, CHART_COLOR_LAST,        Chart_Colors_B.COLOR_LAST);
                              bool aegCHART_COLOR_STOP_LEVEL       = ChartSetInteger(ChartData_ChartInfo.ID, CHART_COLOR_STOP_LEVEL,  Chart_Colors_C.COLOR_STOP_LEVEL); //}
                              ///
                              ;
                              ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //
                    }
                    ChartData_ChartInfo.ID = SaveChartID;///recover chart id after effected
                    return Keylight; break; //
          }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
          return resultA;//
}
//+------------------------------------------------------------------+
//|           //-- SetBull/BearColors                                |
//+------------------------------------------------------------------+
bool Cg_DevChartWindow::Set_ChartCandels_BullBear_RandomColor(int KeyC = 0, bool result = false)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
          color clrBullish = clrDarkTurquoise;
          color clrBearish = clrTomato;
          if(KeyC == 111)
          {         //-- SetChart
                    ChartSetInteger(0, CHART_COLOR_CANDLE_BULL, clrDarkTurquoise);
                    ChartSetInteger(0, CHART_COLOR_CHART_UP, clrDarkTurquoise);
                    ChartSetInteger(0, CHART_COLOR_CANDLE_BEAR, clrTomato);
                    ChartSetInteger(0, CHART_COLOR_CHART_DOWN, clrTomato);
                    ChartSetInteger(0, CHART_COLOR_CHART_LINE, clrYellowGreen); //
                    result = true;//
          }
          if(KeyC == 99)
          {         //-- SetChart
                    ChartSetInteger(0, CHART_COLOR_CANDLE_BULL, clrDarkTurquoise);
                    ChartSetInteger(0, CHART_COLOR_CHART_UP, clrDarkTurquoise);
                    ChartSetInteger(0, CHART_COLOR_CANDLE_BEAR, clrTomato);
                    ChartSetInteger(0, CHART_COLOR_CHART_DOWN, clrTomato);
                    ChartSetInteger(0, CHART_COLOR_CHART_LINE, clrYellowGreen); //
                    result = true;//
          }
          if(KeyC == 3)
          {         uchar alfa = 0x55; // 0x55 means 55/255=21.6 % of transparency
                    color ColorF = Utilities.RandomColor();
                    clrBullish   =   (color)ColorToARGB(ColorF, alfa ^= alfa); ///(uchar)MathRand()
                    clrBearish   %=  (color)ColorToARGB(ColorF, alfa ^= alfa);
                    //if(clrBullish == C'0x00,0x00,0x00' ) {clrBullish   = ColorF >> 4;}
                    //if(clrBullish == C'0x00,0x00,0x00' ) { clrBearish   = ColorF >> 1;}
                    Alert(ColorF, ",ColorF,,", __LINE__); Alert(clrBullish, ",,clrBullish,", __LINE__); Alert(clrBearish, ",clrBearish,,", __LINE__);
                    //-- SetChart
                    ChartSetInteger(0, CHART_COLOR_CANDLE_BULL, clrBullish);
                    ChartSetInteger(0, CHART_COLOR_CHART_UP, clrBullish);
                    ChartSetInteger(0, CHART_COLOR_CANDLE_BEAR, clrBearish);
                    ChartSetInteger(0, CHART_COLOR_CHART_DOWN, clrBearish);
                    ChartSetInteger(0, CHART_COLOR_CHART_LINE, Utilities.RandomColor()); //
                    result = true;//
          }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
          return result; //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Cg_DevChartWindow::WindowScreenShoter()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
          string argfilename;
          int argsize_x = 1024;
          int argsize_y = 786;
          int argstart_bar = -1;
          int argchart_scale = -1;
          int argchart_mode = -1;
          WindowScreenShot(argfilename, argsize_x, argsize_y, argstart_bar = -1, argchart_scale = -1, argchart_mode = -1);
// CHART_BAR (0 is a sequence of bars), CHART_CANDLE (1 is a sequence of candlesticks), CHART_LINE (2 is a close prices line).
          WindowPriceMax();
          WindowPriceMin(); //
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
          return;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Cg_DevChartWindow::ShowVloume(bool ShowVloume_Key)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
          ChartData_ChartInfo.SubWindow                 = 0;
          long         handel         = ChartID() ;
          handel         = 0;
          long         value;
          long         result         = WRONG_VALUE;
          if(!ChartGetInteger(ChartID(), CHART_SHOW_VOLUMES, 0, result))
                    if(ShowVloume_Key)////ChartGetInteger(0, CHART_SHOW_VOLUMES,0,value2
                    {         long volume_mode = CHART_VOLUME_TICK;
                              Print("`````````Showed volume.");
                              bool SHOW_VOLUMES = ChartSetInteger(ChartID(), CHART_SHOW_VOLUMES,  ChartData_ChartInfo.SubWindow, value = volume_mode); ////apply on chart
                    }
                    else
                    {         long volume_mode = CHART_VOLUME_HIDE;
                              Print("`````````Hidden volume.");
                              bool SHOW_VOLUMES = ChartSetInteger(ChartID(), CHART_SHOW_VOLUMES,  ChartData_ChartInfo.SubWindow, value = volume_mode); //
                    } //
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
          return;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Cg_DevChartWindow::FrameSetting(long SaveChartID = 0, long ChartOpenID = 0, Zoom_Level ZoomLevel = Two)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
          if(SaveChartID != ChartOpenID)ChartData_ChartInfo.ID = ChartOpenID;
          ChartData_ChartInfo.SubWindow = 0;
          //showVloume(KeyShowVloume);
          long handle = ChartID() ; // 0 mean currect chart ,handle = 0;
          //handle = ChartOpen("ct_XAUUSD.F", PERIOD_M5 ); //PERIOD_H12 - "EURUSD" \\\chart id
          bool Key = handle != 0;
          //enum Zoom_Level {None = 0, One = 1, Two = 2, Three = 3, Four = 4, Max = 5 };
          ZoomLevel = EXTKeyZoom;
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
          ENUM_CHART_PROPERTY_INTEGER Chart_Property = CHART_SCALE;
          //////////////////
          //ChartFunc.ShowGrid(1);
          ///this.ChartShowGridSet(1, ChartID());//>>>Not Worked by construcors
          bool IsFOREGROUND                             = ChartSetInteger(ChartData_ChartInfo.ID, CHART_FOREGROUND,  ChartData_ChartInfo.SubWindow, false);
          //------------------------------------------------------------------------------------------------------
          bool SHOW_GRID                                = ChartSetInteger(ChartData_ChartInfo.ID, CHART_SHOW_GRID,  ChartData_ChartInfo.SubWindow, false);
          //------------------------------------------------------------------------------------------------------
          bool LINEChart                                = ChartSetInteger(ChartData_ChartInfo.ID, CHART_MODE, CHART_LINE);
          LINEChart                                     = ChartGetInteger(ChartData_ChartInfo.ID, CHART_MODE);
          //------------------------------------------------------------------------------------------------------
          
          //------------------------------------------------------------------------------------------------------
          bool CANDLESChart                             = ChartSetInteger(ChartData_ChartInfo.ID, CHART_MODE, CHART_CANDLES);
          CANDLESChart                                  = ChartGetInteger(ChartData_ChartInfo.ID, CHART_MODE);
          bool BarChart                                 = ChartSetInteger(ChartData_ChartInfo.ID, CHART_MODE, CHART_LINE);
          ENUM_CHART_MODE MODE = CHART_BARS; long MODE2;   ChartGetInteger(ChartData_ChartInfo.ID, CHART_MODE, 0, MODE2);
          //------------------------------------------------------------------------------------------------------
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
          //bool CONTEXT_MENU                             = ChartGetInteger(ChartData_ChartInfo.ID, CHART_CONTEXT_MENU);
          //CONTEXT_MENU                                  = ChartSetInteger(ChartData_ChartInfo.ID, CHART_CONTEXT_MENU, 1);
          //------------------------------------------------------------------------------------------------------
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
          //bool CROSSHAIR_TOOL                             = ChartGetInteger(ChartData_ChartInfo.ID, CHART_CROSSHAIR_TOOL);
          //CROSSHAIR_TOOL                                  = ChartSetInteger(ChartData_ChartInfo.ID, CHART_CONTEXT_MENU, 1);
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
          //------------------------------------------------------------------------------------------------------
          bool AUTOSCROLL                               = ChartGetInteger(ChartData_ChartInfo.ID, CHART_AUTOSCROLL);
          AUTOSCROLL                                    = ChartSetInteger(ChartData_ChartInfo.ID, CHART_AUTOSCROLL, false);
          //------------------------------------------------------------------------------------------------------//Do before set shift
          ///The size of the zero bar indent from the right border in percents double  (from 10 to 50 percents)
          int SHIFT_SIZE_Bars = 40;
          bool SHIFT_SIZE                               = ChartSetDouble(ChartData_ChartInfo.ID, CHART_SHIFT_SIZE, SHIFT_SIZE_Bars); //
          SHIFT_SIZE                                    = ChartGetDouble(ChartData_ChartInfo.ID, CHART_SHIFT_SIZE); //
          //------------------------------------------------------------------------------------------------------
          bool SHIFT                                    = ChartGetInteger(ChartData_ChartInfo.ID, CHART_SHIFT);
          SHIFT                                         = ChartSetInteger(ChartData_ChartInfo.ID, CHART_SHIFT, true);
          //------------------------------------------------------------------------------------------------------//DooBefore Zooming//Scaling,,and atoscroll off//in ato scrool On mode Unusefull//gone last Bar just
          //Chart fixed position is marked by a small gray triangle on the horizontal time axis.when off
          ///The bar on a fixed position remains in the same place when zooming in and out.
          bool FIXED_POSITION                           = ChartSetDouble(ChartData_ChartInfo.ID, CHART_FIXED_POSITION, 100); //For zooming Place if Auto Scroll off
          //------------------------------------------------------------------------------------------------------
          bool SCALE                                    = ChartSetInteger(ChartData_ChartInfo.ID, CHART_SCALE, ChartData_ChartInfo.SubWindow = 0, ZoomLevel); //int  from 0 to 5//>>>zoomed but not to end
          //------------------------------------------------------------------------------------------------------
          bool SCALEFIX_PT_PER_BAR                      = ChartSetInteger(ChartData_ChartInfo.ID, CHART_SCALE_PT_PER_BAR, 0, true);
          bool SCALEFIX_11                              = ChartSetInteger(ChartData_ChartInfo.ID, CHART_SCALEFIX_11, false);//1to1
          bool SCALEFIX                                 = ChartSetInteger(ChartData_ChartInfo.ID, CHART_SCALEFIX, 0, true);
          long SCALEFIX_Value                           = ChartGetInteger(ChartData_ChartInfo.ID, CHART_SCALEFIX);
          double priceMin = ChartGetDouble(0, CHART_PRICE_MIN, 0);
          double priceMax = ChartGetDouble(0, CHART_PRICE_MAX, 0);
          //------------------------------------------------------------------------------------------------------
          //------------------------------------------------------------------------------------------------------
          ///>>>errorr ////bool SCALE_PT_PER_BAR                         = ChartSetInteger(ChartData_ChartInfo.ID, CHART_SCALE_PT_PER_BAR, 1);//Scale to be specified in points per bar   bool///ERR_CHART_PROP_INVALID
          //------------------------------------------------------------------------------------------------------------------------------------
          bool SHOW_BID_LINE                            = ChartSetInteger(ChartData_ChartInfo.ID, CHART_SHOW_BID_LINE, ChartData_ChartInfo.SubWindow, true);
          bool SHOW_ASK_LINE                            = ChartSetInteger(ChartData_ChartInfo.ID, CHART_SHOW_ASK_LINE, ChartData_ChartInfo.SubWindow, true);
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
          //bool SHOW_LAST_LINE                           = ChartSetInteger(ChartData_ChartInfo.ID, CHART_SHOW_LAST_LINE, ChartData_ChartInfo.SubWindow = 0, true);///Display Last values as a horizontal line in a chart///bool
          //ChartSetInteger(ChartData_ChartInfo.ID, CHART_SHOW_LAST_LINE, 0, true);
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
          bool SHOW_SHOW_OHLC                           = ChartSetInteger(ChartData_ChartInfo.ID, CHART_SHOW_OHLC,              ChartData_ChartInfo.SubWindow, true);
          bool SHOW_SHOW_TRADE_LEVELS                   = ChartSetInteger(ChartData_ChartInfo.ID, CHART_SHOW_TRADE_LEVELS,      ChartData_ChartInfo.SubWindow, true);
          bool SHOW_SHOW_DATE_SCALE                     = ChartSetInteger(ChartData_ChartInfo.ID, CHART_SHOW_DATE_SCALE,        ChartData_ChartInfo.SubWindow, true);
          bool SHOW_SHOW_PRICE_SCALE                    = ChartSetInteger(ChartData_ChartInfo.ID, CHART_SHOW_PRICE_SCALE,       ChartData_ChartInfo.SubWindow, true);
          //=====================================================================================================================================
          //if(ChartGetInteger(ChartID(), CHART_AUTOSCROLL, 0) == 0)
          //{         bool AUTOSCROLL             = ChartSetInteger(ChartID(), CHART_AUTOSCROLL, true);  Sleep(10);}
          //if(ChartGetInteger(ChartID(), CHART_SHIFT, 0) == 0)
          //{         bool SHIFT                  = ChartSetInteger(ChartID(), CHART_SHIFT, true);   Sleep(10); }
          //----------------------------------------------------------------------------------------------------------------------
          //ChartFunc.IndicatorAdd(1, 2);
          //ChartFunc.AutoScroll() ? ChartFunc.AutoScroll(1) : ChartFunc.AutoScroll(1);
          //ChartFunc.Shift() ?  ChartFunc.Shift(1) : ChartFunc.Shift(1);
          //ChartFunc.Navigate(CHART_BEGIN, 150);
          //ChartFunc.ScreenShot()
          //----------------------------------------------------------------------------------------------------------------------
          ////
          if(0)
          {         // bool CURRENT_POS            = ChartNavigate(ChartID(), CHART_CURRENT_POS, 1); ///-0 ecual-4800 begining
                    // bool END_POS                = ChartNavigate(ChartID(), CHART_END, +0);///after choosen -50 until zero
                    // bool BEGIN_POS_             = ChartNavigate(ChartID(), CHART_BEGIN, 0);//5000 after dl candels  ///-4800 begining
                    //for(int o = 1; o > 0; o--)
                    {         //bool CURRENT_POS          = ChartNavigate(ChartID(), CHART_CURRENT_POS, o);Sleep(500); ///gone forward
                    }
                    //bool END_POS               = ChartNavigate(ChartID(), CHART_END, 0);  //gone forwarder than choosen not backward -50bar
                    // for(int o = 10000; o < 10050; o++)
                    {         //bool BEGIN_POS             = ChartNavigate(ChartID(), CHART_BEGIN, o); Sleep(500);   //--Start Point Time
                    }//
          }
          //////////////////////
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
          ChartData_ChartInfo.ID = SaveChartID;///recover chart id after effected
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
          return;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Cg_DevChartWindow::WindowHandler(ENUM_TIMEFRAMES argtimeframe)             //1.5.0 Windws Functions SYMBOL_PEROID_INDICATOR
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
          Print("windowns Total Indicator: ", WindowsTotal(),  "\n ChartNumber: ",  ChartID());
          int  win_handle ;
          switch (argtimeframe)
          {         case 0:     {   win_handle   = WindowHandle(Symbol(), PERIOD_CURRENT);} break;
                    case 1:     {   win_handle   = WindowHandle(Symbol(), PERIOD_M1);} break;
                    case 5:     {   win_handle   = WindowHandle(Symbol(), PERIOD_M5);} break;
                    case 15:    {   win_handle   = WindowHandle(Symbol(), PERIOD_M15);} break;
                    case 30:    {   win_handle   = WindowHandle(Symbol(), PERIOD_M30);} break;
                    case 60:    {   win_handle   = WindowHandle(Symbol(), PERIOD_H1);} break;
                    case 240:   {   win_handle   = WindowHandle(Symbol(), PERIOD_H4);} break;
                    case 1440:  {   win_handle   = WindowHandle(Symbol(), PERIOD_D1);} break;
                    case 10080: {   win_handle   = WindowHandle(Symbol(), PERIOD_W1);} break;
                    case 43200: {   win_handle   = WindowHandle(Symbol(), PERIOD_MN1);} break;
                              //
          }
          string argChartPeriod = EnumToString(ChartPeriod(0));//[in]  Chart ID. 0 means the current chart.
          Print(" EA Name: -Peiod: ", argChartPeriod); ///WindowExpertName()
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
          return;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Cg_DevChartWindow::TimePrice_To_XY_Array(datetime time, double price, int& x[], int& y[] )
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TOOLS Error",  __LINE__, __FUNCTION__); //|
          ArrayResize(x, Bars, 0); ArrayResize(y, Bars, 0);
//// ChartTimePriceToXY(
//long           chart_id,     // Chart ID
//int            sub_window,   // The number of the subwindow
//datetime       time,         // Time on the chart
//double         price,        // Price on the chart
//int&           x,            // The X coordinate for the time on the chart
//int&           y             // The Y coordinates for the price on the chart
          static uint counter = 0;///self gone ++
          return ChartTimePriceToXY(0, 0, time, price, x[counter], y[counter]);
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TOOLS Error",  __LINE__, __FUNCTION__); //|
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Cg_DevChartWindow::TimePrice_To_XY( datetime time, double price, int& x, int& y, string FuncCom = "")
{         ________________________________________________________Xerorr.SuperviserX(_LastError, FuncCom + "-C_TOOLS Error",  __LINE__, __FUNCTION__); //|
//Alert("time: ", time, "-- price:", price,"x: ", x, "-- y:", y);
          return ChartTimePriceToXY(0, 0, time, price, x, y );
//Alert("time: ", time, "-- price:", price,"x: ", x, "-- y:", y);
          ________________________________________________________Xerorr.SuperviserX(_LastError, FuncCom + "-C_TOOLS Error",  __LINE__, __FUNCTION__); //|
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//| sends broadcast event to all open charts                         |
//+------------------------------------------------------------------+
void Cg_DevChartWindow::BroadcastEvent(long lparam, double dparam, string sparam)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
          string buttonID = "Button";
          string labelID = "Info";
          int broadcastEventID = 5000;
          int eventID = broadcastEventID - CHARTEVENT_CUSTOM;
          long currChart = ChartFirst();
          int i = 0;
          while(i < CHARTS_MAX)               // We have certainly no more than CHARTS_MAX open charts
          {         EventChartCustom(currChart, (ushort) eventID, lparam, dparam, sparam);
                    currChart = ChartNext(currChart); // We have received a new chart from the previous
                    if(currChart == -1) break;      // Reached the end of the charts list
                    i++;// Do not forget to increase the counter
          } //
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|             Class Cg_DevChartWindow::BEGIN                                 |
//+------------------------------------------------------------------+
//
//
//
///>>>>>cuase of creation item of chater TOOLS...when deleting it gone call TOOLScontroller deiniter....for every item creation...
//Cg_DevChartWindow *Charter  = new Cg_DevChartWindow();///<<<<<,when pointer and pointer deleete in deiniter ..work well..
///>>.when not delete in deiniting all object not clreanig....
//Cg_DevChartWindow  CharterX  = new Cg_DevChartWindow ;//<<<,testing//creating by new cause keep in uniniting
//>>.but by creationg normal object...auto clearing..
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>BIGERROR///
///===============================================================================================
// A multidimensional array is shown as one-dimensional when processed by ArrayFill() function. For example,
//array[2][4] is processed as array[8].
// Therefore, you may specify the initial element's index to be equal to 5 when working with this array.
// Thus, the call of ArrayFill(array, 5, 2, 3.14) for array[2][4] fills array[1][1] and array[1][2] elements with 3.14.
// IntegerToString(j)//KeepName//TypeValue
// string KeepNameTypeIndex[1000][1][1];
// ArrayFill(KeepNameTypeIndex, 0, 0, 0)//'string' type cannot be used in ArrayFill function         Cg_DevChartWindow.mqh 10256     81
//
// KeepNameTypeIndex[j][j][j] =
//{
//        {               { }
//                        { }
//        }
//        {
//                        { }
//                        { }
//        }
//        {
//                        { }
//                        { }
//        }
//};
//
//
//fill arraylist
//if(StringFind (KeepName, OBJ_RECTANGLE_LABEL) > -1);
// KeepName + "OBJ_RECTANGLE_LABEL"; //return(0);
///>>>>>>>>>>>>>>>__LINDE:1413..END Debuging///Reserved ten object to deleted by destructor off TOOLScontroller...
//C:\Users\mito\AppData\Roaming\MetaQuotes\Terminal\63603D13555081059CD774AC70BBC63B\MQL4\Include\0srcCapitan\QuartsExperts\Cg_DevChartWindow.mqh
//+------------------------------------------------------------------+
//| Finds a chart object by name's postfix. Returns object's name.   |
//+------------------------------------------------------------------+

// Main routine for making a screenshoot / printscreen
void Cg_DevChartWindow::sub_takesnapshot()
{         static datetime lastbar;
          static int doshot = -1;
          static int oldphase = 3000000;
          int shotinterval;
          int phase;
          if ( ShotsPerBar > 0 )
                    shotinterval = (int)MathRound ( ( 60 * Period() )  / ShotsPerBar );
          else
                    shotinterval = 60 * Period();
          phase = (int)MathFloor ( ( CurTime() - Time[0] ) / shotinterval );
          if ( Time[0] != lastbar )
          {         lastbar = Time[0];
                    doshot = DelayTicks; }
          else if ( phase > oldphase )
                    sub_makescreenshot ( "i" );
          oldphase = phase;
          if ( doshot == 0 )
                    sub_makescreenshot ( "" );
          if ( doshot >= 0 )
                    doshot -= 1; //
}
// Make a screenshoot / printscreen
void Cg_DevChartWindow::sub_makescreenshot ( string par_sx = "" )
{         static int no = 0;
          no ++;
          string fn = "SnapShot" + Symbol() + (string)Period() + "\\" + (string)Year() + "-" + sub_maketimestring ( Month(), 2 ) + "-" + sub_maketimestring ( Day(), 2 )
                      + " " + sub_maketimestring ( Hour(), 2 ) + "_" + sub_maketimestring ( Minute(), 2 ) + "_" + sub_maketimestring ( Seconds( ), 2 ) + " " + (string)no + par_sx + ".gif";
          if ( !ScreenShot ( fn, 640, 480 ) )
                    Print ( "ScreenShot error: ", ErrorDescription ( GetLastError() ) ); //
}
// add leading zeros that the resulting string has 'digits' length.
string Cg_DevChartWindow::sub_maketimestring ( int par_number, int par_digits )
{         string result;
          result = DoubleToStr ( par_number, 0 );
          while ( StringLen ( result ) < par_digits )
                    result = "0" + result;
          return ( result );//
}
//+------------------------------------------------------------------+
//|             Class Cg_DevChartWindow     BEGIN-END                          |
//+------------------------------------------------------------------+
void Cg_DevChartWindow::Test()
{         if(false)          // work with visible bars.
          {         int bars_count = WindowBarsPerChart();
                    int bar = WindowFirstVisibleBar();
                    for(int i = 0; i < bars_count; i++, bar--)
                    {         // ...
                    }//
          }
          if(false)
          {         double   top                = WindowPriceMax();
                    double   bottom             = WindowPriceMin();
                    datetime left               = Time[WindowFirstVisibleBar()];
                    int      right_bound        = WindowFirstVisibleBar() - WindowBarsPerChart();
                    if(right_bound < 0) right_bound = 0;
                    datetime right              = Time[right_bound] + Period() * 60;
                    ObjectCreate("Padding_rect", OBJ_RECTANGLE, 0, left, top, right, bottom);//----
                    ObjectSet("Padding_rect", OBJPROP_BACK, true);
                    ObjectSet("Padding_rect", OBJPROP_COLOR, Blue); }
          if(false)
          {         double   drop_price = WindowPriceOnDropped();
                    datetime drop_time = WindowTimeOnDropped();
                    if(drop_time > 0)  //---- may be undefined (zero)
                    {         ObjectCreate("Dropped price line", OBJ_HLINE, 0, 0, drop_price);
                              ObjectCreate("Dropped time line", OBJ_VLINE, 0, drop_time, 0); } //
          }
          if(false)
          {         int lasterror = 0;
                    int ExtShotsCounter = 0; int ExtTradesCounter = 0;
                    if(IsTesting() /*&& ExtTradesCounter < TradesTotal()*/)   //---- tester has closed one or more trades
                    {         if(!WindowScreenShot("shots\\tester" + (string)ExtShotsCounter + ".gif", 640, 480)) lasterror = GetLastError(); //---- make WindowScreenShot for further checking
                              else ExtShotsCounter++;
                              /* ExtTradesCounter = TradesTotal();*/ //
                    } //
          }//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
