//+------------------------------------------------------------------+
//|                                                     C_Candels_Box.mqh |
//|                                                    A pourya 2021 |
//|                                                @prymhdvgmail.com |
//+------------------------------------------------------------------+
#property copyright "A pourya 2021"
#property link      "@prymhdvgmail.com"
#property version   "1.00"
#property strict
//#include <0srcCapitan\QuartsExperts\ErrorController.mqh>
//#include <0srcCapitan\QuartsExperts\InformController.mqh>
//#include <0srcCapitan\QuartsExperts\ChartController_ToolsController.mqh>
//#include <0srcCapitan\QuartsExperts\ChartController.mqh>;
//#include <0srcCapitan\QuartsExperts\C_TOOLS.mqh>;
//+------------------------------------------------------------------+
//|             Class SoundController     BEGIN                      |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class C_Candels_Box//: public C_FLOWPANEL //ComplexToolsController///errorring
{
private:
public:///data members
          double                Candel_High_Price;
          double                Candel_Low_Price;
          double                Candel_Close_Price;
          double                Candel_Open_Price;
          datetime              Candel_Time;
          ENUM_TIMEFRAMES       Candel_TIMEFRAMES;

          Cg_TextsLabel         LBL_1;
          Cg_TextsButton        BTN_1;
          Cg_TextsRectLabel     RLBL_CandelTools;
          C_ShapesRectangle     TRNGL_CandelTools;
          C_ShapesRectangle     RAngl_Candel;
          //---------------------------------------------------------
          string                CounterTextBoxCount;
          uint                  CounterValueBoxCount;
          //---------------------------------------------------------
          //ENUM_POINTER_TYPE
          ///static bool           -C_STATICSUN-::KeyPERIOD_CURRENT;
          bool            Is_PERIOD_M1;
          bool            Is_PERIOD_M5;
          bool            Is_PERIOD_M15;
          bool            Is_PERIOD_M30;
          bool            Is_PERIOD_H1;
          bool            Is_PERIOD_H4;
          bool            Is_PERIOD_D1;
          bool            Is_PERIOD_W1;
          bool            Is_PERIOD_MN1;
          //===============
          long            CandelBoxFillValClass; ///bool
          ///////////////////////////////////////////
          int                   UseXHigh,  UseYHigh;
          int                   UseXLow,   UseYLow;
          int                   UseXClose, UseYClose;
          int                   UseXOpen,  UseYOpen;

          int LenghtOFbar;     ///= (Period() * 60); ///.....to time value////next bar time cordinate
public:

          C_Candels_Box *CandelBoxN;
          void                  C_Candels_Box();
          void                  ~C_Candels_Box();
          //-------------------------------------------------------------
          Sgo_ButtonColor       CandelBoxBTNColorA, CandelBoxBTNColorB;
//=================================================================================
          bool                  __Call( bool WhichMode, bool IsKey, Sg_Position2D & Position2D);

          void                  OBJECT_CLICK();
//=================================================================================
          ///when ontimer creating every time re create obj and reflesh...in screen.
          void                  __Create( bool Is_Create, ENUM_TIMEFRAMES f, uint BoxCount = 0, const bool FillCOM = false, const int WidthCOM = 1); //
          bool                  CandelGetValue(ENUM_TIMEFRAMES f, int Useshift = 0 );
          bool                  CandelBoxCreating(string & Description[], datetime & XCordinate, double & YCordinate, datetime & X2Cordinate, double & Y2Cordinate, bool Is_Create = false, string nameCOM = "", color ShapeColor = clrYellow, const bool FillCOM = false, const int WidthCOM = 1, uint BoxCount = 0);
          bool                  Set_Candel(bool Is_Create, ENUM_TIMEFRAMES f,  int BoxCount = 0, const bool FillCOM = false, const int WidthCOM = 1); ////staticeee    neeed all root members static...
//=================================================================================
//#define Counterarrays Bars//1000///
          //const int C_Candels_Box::CounterarrayC = 0;
//#define Counterarray CounterarrayC//1000///
#define CounterArray 1000///
          //static string C_Candels_Box::DescriptionBox[CounterArray];
          string                DescriptionBox[CounterArray];///DescriptionBox[index] =Description[index] = UseRectangleName;//>>>>>>>>>>.retwin assaining
          int                   BoxCountVal;
          bool                  PadFlow__SubCandelBoxObjectGetSet_(long &FillVal, bool new_fill = false, bool KeySet_ = false, bool KeyGet = false, string GetMode = "fill");
          string                TextGetX(int GetLastLine, datetime   XCordinate, double   YCordinate, datetime   X2Cordinat, double   Y2Cordinate);
          void                  test();
          //
}; //CandelBox;
//Candels_Box.Runing(StaticKeysController::KeyPERIOD_CURRENT, StaticKeysController::KeyPERIOD_M1, StaticKeysController::KeyPERIOD_M5,
//                           StaticKeysController::Is_PERIOD_M15, StaticKeysController::Is_PERIOD_H1, StaticKeysController::Is_PERIOD_H4,
//                           StaticKeysController::Is_PERIOD_D1, StaticKeysController::Is_PERIOD_W1, StaticKeysController::Is_PERIOD_MN1);
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
C_Candels_Box::C_Candels_Box()
{         RunCallFunction++; ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_Candels_Box Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          CounterTextBoxCount = "";
          CounterValueBoxCount = 5;///default
          ArrayResize(DescriptionBox, CounterArray); //ArrayResize(DescriptionBox,CounterArray+1);for noT zero element
          C_Candels_Box::DescriptionBox[CounterArray - 1] = "0"; //
          ///==================
          CandelBoxBTNColorA.Set_( clrBeige, C'144,176,239', clrBlack, clrGold, clrRed, clrRed);
          CandelBoxBTNColorB.Set_( clrDarkCyan, clrDarkCyan, clrWhite, clrLavender, clrLavender, clrDarkCyan);
          //================================================================
          //===================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "C_UTILITIES  Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          //===================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_Candels_Box Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
C_Candels_Box::~C_Candels_Box()
{         if(Capitan_DeinitErrorCatching)________________________________________________________Xerorr.SuperviserX(_LastError, "-C_Candels_Box Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
}
//+------------------------------------------------------------------+
bool   C_Candels_Box::CandelGetValue(ENUM_TIMEFRAMES f, int UseShift = 0 )
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_Candels_Box Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          //Alert(CandelTIMEFRAMESX, "<<CandelTIMEFRAMESX--line:", __LINE__);
          //////////////////////////////////////////////////////////////////////////////////////=CandelTIMEFRAMESX///debuging/////ct_Inform.UseShift;..not correcting
          Candel_TIMEFRAMES       =  f;
          Candel_High_Price       = iHigh (StSymbol.Current, f, UseShift); //Alert(__LINE__, " CandelHighPrice:",  CandelHighPrice );
          Candel_Low_Price        = iLow  (StSymbol.Current, f, UseShift); //Alert(__LINE__, " CandelLowPrice:",   CandelLowPrice );
          Candel_Close_Price      = iClose(StSymbol.Current, f, UseShift); //Alert(__LINE__, " CandelClosePrice:", CandelClosePrice );
          Candel_Open_Price       = iOpen (StSymbol.Current, f, UseShift); //Alert(__LINE__, " CandelOpenPrice:",  CandelOpenPrice );
          Candel_Time             = iTime (StSymbol.Current, f, UseShift);        //Sleep(100); Alert("Line:", __LINE__, "-- CandelTime:", CandelTime, "--  CandelTIMEFRAMES:", CandelTIMEFRAMES);
          //Alert(CandelTime);
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_Candels_Box Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          //////////////////////////////////////////////////////////////////////////////////////
          bool TimePriceToXYHigh    = ChartTimePriceToXY(ChartData_ChartInfo.ID, ChartData_ChartInfo.SubWindow, Time[0] - Candel_TIMEFRAMES * 60, Candel_High_Price, UseXHigh, UseYHigh);
          bool TimePriceToXYLow     = ChartTimePriceToXY(ChartData_ChartInfo.ID, ChartData_ChartInfo.SubWindow, Time[0] - Candel_TIMEFRAMES * 60, Candel_Low_Price, UseXLow, UseYLow);  //Bid[] is not arry define
          bool TimePriceToXYClose   = ChartTimePriceToXY(ChartData_ChartInfo.ID, ChartData_ChartInfo.SubWindow, Time[0] - Candel_TIMEFRAMES * 60, Candel_Close_Price, UseXClose, UseYClose);
          bool TimePriceToXYOpen    = ChartTimePriceToXY(ChartData_ChartInfo.ID, ChartData_ChartInfo.SubWindow, Time[0] - Candel_TIMEFRAMES * 60, Candel_Open_Price, UseXOpen, UseYOpen);
          //////////////////////////////////////////////////////////////////////////////////////
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_Candels_Box Error",  __LINE__, __FUNCTION__, 2000); //|passed errorto next func and iner func rectlabel
          //=========================================================|
          return true;
//
}
//+------------------------------------------------------------------+
bool   C_Candels_Box::CandelBoxCreating(  string & Description[], datetime & XCordinate, double & YCordinate, datetime & X2Cordinate, double & Y2Cordinate, bool Is_Create = false, string nameCOM = "", color ShapeColor = clrYellow,   bool FillCOM = false, const int WidthCOM = 1, uint BoxCount = 0)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_Candels_Box Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          int XCordinateUseRectLabel = UseXHigh; //Alert(UseXHigh, __LINE__);
          int YCordinateUseRectLabel = UseYLow;
          int XSize = 20;////formuling candel amount of periods
          int YSize = 30;
          if (PERIOD_M1  == Period()) XSize += 2;
          if (PERIOD_M5  == Period()) XSize += 4;
          if (PERIOD_M15 == Period()) XSize += 8;
          if (PERIOD_M30 == Period()) XSize += 16;
          if (PERIOD_H1  == Period()) XSize += 32;
          if (PERIOD_H4  == Period()) XSize += 64;
          if (PERIOD_W1  == Period()) XSize += 128;
          if (PERIOD_MN1 == Period()) XSize += 256;////////PERIOD_W1  == PERIOD_CURRENT
          ////
          ENUM_BASE_CORNER      Corner                                  = CORNER_RIGHT_LOWER;
          ENUM_ANCHOR_POINT     Anchor                                  = ANCHOR_UPPER;
          bool                                          Background      = false;
          const                 ENUM_BORDER_TYPE        border          = BORDER_SUNKEN;
          color                                         backColor       = clrYellow; /// C'36, 52, 69';
          color                                         descColor       = clrYellow;
          const                 double                  Angle           = 0;
          const                 ENUM_LINE_STYLE         style           = STYLE_SOLID;
          const                 int                     Width           = WidthCOM;
          const                 int                     FontSize        = 7;
          const                 string                  Font            = "Arial";
          //===============================================================
          string nameBase               = "CandelBox_";
          string UseRectLabelName       = nameBase + "RectLabel_" +  nameCOM;
          //---
          string UseRectangleName       = nameBase + "RectAngle_" +  nameCOM;
          int    sizeDescription        = ArrayResize(Description, BoxCount + 1); /// BoxCount + 1
          //---
          if(ArraySize(DescriptionBox) < sizeDescription)ArrayResize(DescriptionBox, BoxCount + 1);
          //Description[BoxCount] = UseRectLabelName;
          static uint index = 0;//sign mismatcch>>>int//uint
          if(CounterValueBoxCount > index + BoxCount)   index = 0;                               ////Control index by Box amount//////sign mismatcch????>>controled over30///accepted Posetive gone...
          if(CounterValueBoxCount < index )             index = CounterValueBoxCount;           ////Control index by Box amount//////sign mismatcch????>>controled over30///accepted Posetive gone...
          //---
          DescriptionBox[index] = Description[index] = UseRectangleName; //>>>>>>>>>>.retwin assaining//C_Candels_Box::CandelBoxCreating
          //===============================================================
          FillCOM               = CandelBoxFillValClass;///Fill const breake
          LenghtOFbar           = Candel_TIMEFRAMES * 60;/// (Period() * 60);
          const bool Fill       = FillCOM;
          //---
          XCordinate            = Candel_Time;///Time[0] - CandelTIMEFRAMES * 60;
          YCordinate            = Candel_High_Price;
          X2Cordinate           = XCordinate + LenghtOFbar; ///XCordinate + 100;////
          Y2Cordinate           = Candel_Low_Price; ///YCordinate + 100;
          // Alert(XCordinate);
          // Alert(X2Cordinate);
          //===============================================================
          ///rectlabele not use ful on screennn crating...
          ///---nonGeneric RectLabelX---///
          if(false)
          {         RLBL_CandelTools.GDS.Set_Action_2(MODE_CREATE, Is_Create);
                    RLBL_CandelTools.GDS.Set_Desc_1(UseRectLabelName);
                    RLBL_CandelTools.GDS.Set_Tip_3(STYLE_SOLID, 1, BORDER_FLAT);
                    RLBL_CandelTools.GDS.Set_Color_2(descColor, backColor);
                    RLBL_CandelTools.GDS.Set_Location_5(XCordinateUseRectLabel, YCordinateUseRectLabel, XSize, YSize, Corner);
                    RLBL_CandelTools.GDS.Set_Chart_6();
                    RLBL_CandelTools.GDS.Set_Common_6(false, 10, false, false, false, RLDEF_tooltip + UseRectLabelName);
                    RLBL_CandelTools.Action(RLBL_CandelTools);//
                    //--- RLBL_CandelTools.Create(true, false, UseRectLabelName, Description[index], XCordinateUseRectLabel, YCordinateUseRectLabel, XSize, YSize, Corner, Anchor, Background, border, backColor, descColor, Angle, style, Width, FontSize, Font);
          }//
          /////////////////////////////////////////////////////////
          bool returnResult = false;
          if(Capitan_KeyDoCandelBox && Is_Create)  //
          {         ////--- nonGeneric RAngl_X ---///
                    {         RAngl_Candel.GDS.Set_Action_2(MODE_CREATE, Is_Create);
                              RAngl_Candel.GDS.Set_Desc_1(UseRectangleName);
                              RAngl_Candel.GDS.Set_Cordinate_4( XCordinate, YCordinate, X2Cordinate, Y2Cordinate);
                              RAngl_Candel.GDS.Set_Style_Width_Fill_Color(STYLE_SOLID, 2, false, ShapeColor);
                              RAngl_Candel.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "");
                              RAngl_Candel.GDS.Set_Chart_6();
                              RAngl_Candel.Action(RAngl_Candel);//
                              //---  RAngl_Candel.Create(UseRectangleName, Description[index], XCordinate, YCordinate, X2Cordinate, Y2Cordinate, Fill, Background, ShapeColor, style, Width);
                    }
                    returnResult = true;
                    //
          } //
          else {returnResult = RAngl_Candel.GAC.Delete();} ////<<<its Delete Object...
          index++; if(index > BoxCount)index = 0;//>>>>>>>>>>.Contril Index Values at end
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_Candels_Box Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return returnResult;
//
}
//+------------------------------------------------------------------+
bool   C_Candels_Box::Set_Candel( bool Is_Create, ENUM_TIMEFRAMES f,  int BoxCount = 0, const bool FillCOM = false, const int WidthCOM = 1)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_Candels_Box Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          datetime      XCordinate      = 0;
          double        YCordinate      = 0;
          datetime      X2Cordinate     = 0;
          double        Y2Cordinate     = 0;
          //=========================================================|
          Is_PERIOD_M1  =  Is_PERIOD_M5  = Is_PERIOD_M15 = Is_PERIOD_M30 = Is_PERIOD_H1  = Is_PERIOD_H4  = Is_PERIOD_D1  = Is_PERIOD_W1  = Is_PERIOD_MN1 = false;
          //=========================================================|
          string UsePeriodName = "";
          switch(f)
          {         case PERIOD_M1:     { UsePeriodName = "M1 #";    Is_PERIOD_M1        = true;} break;
                    case PERIOD_M5:     { UsePeriodName = "M5 #";    Is_PERIOD_M5        = true;} break;
                    case PERIOD_M15:    { UsePeriodName = "M15 #";   Is_PERIOD_M15       = true;} break;
                    case PERIOD_M30:    { UsePeriodName = "M30 #";   Is_PERIOD_M30       = true;} break;
                    case PERIOD_H1:     { UsePeriodName = "H1 #";    Is_PERIOD_H1        = true;} break;
                    case PERIOD_H4:     { UsePeriodName = "H4 #";    Is_PERIOD_H4        = true;} break;
                    case PERIOD_D1:     { UsePeriodName = "D1 #";    Is_PERIOD_D1        = true;} break;
                    case PERIOD_W1:     { UsePeriodName = "W1 #";    Is_PERIOD_W1        = true;} break;
                    case PERIOD_MN1:    { UsePeriodName = "MN1 #";   Is_PERIOD_MN1       = true;} break;
                              //if(CandelTIMEFRAMESX == PERIOD_CURRENT) UsePeriodName = "PERIOD_CURRENT";
                              //
          }
          //=======================================================================
          static string Description[] ;//For save name value every caling....>>>>Bingoo
          ArrayResize(Description, BoxCount + 1); ///BoxCount + 1///of>>>i-1
          ///>>>>>>>>..Bingo swiching in parameter...pass if contrils
          if(Is_Create)//Rectangle-CandelBox-PERIOD_MN1 #0
          {         for(int i = 0; i < BoxCount; i++)
                    {         //UsePeriodName +="#";
                              //UsePeriodName += IntegerToString(i);
                              //UsePeriodName = UseName + IntegerToString(i);
                              if( CandelGetValue(f, i))//Useshift//Get Values
                              {         if(Is_Create = CandelBoxCreating(  Description, XCordinate, YCordinate, X2Cordinate, Y2Cordinate, Is_Create, UsePeriodName + IntegerToString(i), Utilities.RandomColor(), FillCOM, WidthCOM, BoxCountVal = BoxCount)) //
                                                  int h = 0;
                                        //>>>TextGetX(__LINE__, XCordinate, YCordinate, X2Cordinate, Y2Cordinate); //
                                        // Alert("CandelSet_Value", XCordinate);
                                        // Alert("CandelSet_Value",X2Cordinate); //
                                        // Alert("UsePeriodName: ", UsePeriodName + IntegerToString(i), "---", Is_Create, ">>Is_Create---", PeriodCom, "<<PeriodCom---line:", __LINE__); //
                                        //>>Alert(">>Is_Create---", Is_Create, "---UsePeriodName: ", Description[i], "---",  PeriodCom, "<<PeriodCom---line:", __LINE__); //
                              }
                              //
                    }
                    ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_Candels_Box Error",  __LINE__, __FUNCTION__); //|
                    //=========================================================|UsePeriodName + IntegerToString(i)
                    return Is_Create; //
          }//
          else
          {         //
                    if(IsTesterDebug) {Print("__DEBUG__TESTER__", __FUNCTION__, " ", __LINE__);}
                    //
                    for(int i = 0; i <= BoxCount; i++)
                    {         //UsePeriodName +="#";//CandelBox-RectLabel-
                              //UsePeriodName += IntegerToString(i);
                              //UsePeriodName = UseName + IntegerToString(i);UseName + IntegerToString(i)
                              Is_Create = C_STATICSUN::DeleteAnaliseAllObjectName(0, 0, 1, Description[i], __LINE__); // //
                              //Alert("UsePeriodName: ", UsePeriodName + IntegerToString(i), "---", Is_Create, ">>Is_Create/Delete---", PeriodCom, "<<PeriodCom---line:", __LINE__); //
                              ///>>Alert(">>Is_Create/Delete---", Is_Create, "---UsePeriodName: ", Description[i], "---", PeriodCom, "<<PeriodCom---line:", __LINE__); //
                    }//
                    ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_Candels_Box Error",  __LINE__, __FUNCTION__); //|
                    //=========================================================|
                    return Is_Create; //
          } //
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_Candels_Box Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return Is_Create; //
          //
//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string C_Candels_Box::TextGetX(int GetLastLine, datetime   XCordinate, double   YCordinate, datetime   X2Cordinat, double   Y2Cordinate)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_Candels_Box Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          string TextGet = "";
          string timeText = TimeToString(Candel_Time);
          string timeTextXCordinate = TimeToString(XCordinate);
          string timeTextX2Cordinat = TimeToString(X2Cordinat);
          TextGet = StringFormat("Line: %.0f" + " --CandelTime:%s" + " --CandelTIMEFRAMES:%.0f" + " --XCordinate:%s" + " --YCordinate:%.2f" + " --X2Cordinat:%s" + " --Y2Cordinate:%.2f",
                                 GetLastLine, timeText, Candel_TIMEFRAMES, timeTextXCordinate, YCordinate, timeTextX2Cordinat, Y2Cordinate); //
          Alert(TextGet);
          uint SleepWaite = 0;
          Sleep(SleepWaite);
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_Candels_Box Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return "ok";
          //
}
//+------------------------------------------------------------------+
//|                                                                  |Candels_Box.Runing();
//+------------------------------------------------------------------+
void C_Candels_Box::__Create( bool Is_Create, ENUM_TIMEFRAMES f, uint BoxCount = 0, const bool FillCOM = false, const int WidthCOM = 1)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_Candels_Box Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          bool KeyRun = true;
          BoxCount = CounterValueBoxCount;
          static bool DoneCandel = false; int Try = 0;
          if(KeyRun)
          {         //>>Alert(DoneCandel, "<<DoneCandel-while--line:", __LINE__); Sleep(10);
                    while(!DoneCandel && Try < 1)//BoxCount
                    {         DoneCandel = Set_Candel(Is_Create, f, BoxCount, FillCOM, WidthCOM);
                              Try++;
                              Alert(DoneCandel, "--line:", __LINE__);
                              //Sleep(5000); //
                    } //
                    DoneCandel = false; ///>>>for secound call need rest to fail,, to run again
          } //
          else
          {         DoneCandel = false;//
          }//
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_Candels_Box Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_Candels_Box::test()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_Candels_Box Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|'
          if(0)
          {         static bool DoneCandel = false;
                    Alert(DoneCandel, __LINE__); Sleep(10);
                    do
                    {         DoneCandel = this.Set_Candel(true, PERIOD_CURRENT); ////Candels_Box.DoCandel();
                              Alert(DoneCandel, __LINE__);
                              Sleep(5000); //
                    }
                    while(!DoneCandel); //
                    Alert(DoneCandel, __LINE__); Sleep(10); //
          } //
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_Candels_Box Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
}
//===================================================================
//string C_Candels_Box::DescriptionBox[CounterArray] = "0";
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_Candels_Box::PadFlow__SubCandelBoxObjectGetSet_(long &FillVal, bool new_fill = false, bool KeySet_ = false, bool KeyGet = false, string GetMode = "fill")
{
//
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_Candels_Box Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          if (GetMode == "fill")
          {         for(int i = 0; i <= BoxCountVal; i++)
                    {         //
                              if(KeyGet)
                              {
//
                                        if(ObjectFind(0, DescriptionBox[i]) >= 0)///cause  no name object operation***!!!>>>>>HOT ERROR
                                        {         FillVal = ObjectGetInteger(0, DescriptionBox[i], OBJPROP_FILL);
                                                  //,0,FillValClass);// 0, FillValClass);
                                                  //>>>>>>>>>>>>>.Gone Bool in 4 param mode,,,gone Long in 5 param mode....
                                        }
//
                              }
                              if(KeySet_)
                              {         if(ObjectFind(0, DescriptionBox[i]) >= 0)
                                        {         ObjectSetInteger(0, DescriptionBox[i], OBJPROP_FILL, new_fill);
                                                  CandelBoxFillValClass = new_fill; //
                                        }
                                        //
                              }
                              //
                    }//
          }//
          if(GetMode == "String")
          {
//
                    //FillVal = ObjectGetInteger(0, DescriptionBox[i], OBJPROP_FILL);//,0,FillValClass);// 0, FillValClass);
                    //>>>>>>>>>>>>>.Gone Bool in 4 param mode,,,gone Long in 5 param mode....
                    // ObjectGetString(0, DescriptionBox[i], OBJPROP_FILL); //
                    //Charter.gCandelBox_Pad.BTN_CandelBoxBoxCount.GAC.Name();
                    //Charter.gCandelBox_Pad.BTN_CandelBoxBoxCount.GAC.Description();///>>>gone in prossecce ticker
          }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_Candels_Box Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return true; //
}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_Candels_Box::__Call( bool WhichMode, bool IsKey, Sg_Position2D & Position2D) ///int MoveX = 335, int MoveY = -70,,,because of independ2D plus
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-ComplexToolsController Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
// 335 + 0// -70 + 0//<<<<<<<MOve //<<MoveX--Play withFixPadFlowX
          int MoveX = 335; int MoveY = -70;
          FlowPanel.independ2D_CandlBox.x = FixPadFlowX;//<<MoveX--Play withFixPadFlowX
          FlowPanel.independ2D_CandlBox.y = FixPadFlowY; //<<MoveX--Play withFixPadFlowX
          if(WhichMode == MODE_CREATE && IsKey) { FlowPanel.independ2D.x = 0; FlowPanel.independ2D.y = 0; } ////make  offf even key not presed
          else if(true)
          {         FlowPanel.independ2D.x = gFlow_Pad.LBL_C2.GAC.X_Distance() - 429 ; //430//1199
                    FlowPanel.independ2D.y = gFlow_Pad.LBL_C2.GAC.Y_Distance() - 82 ; //
          }
          //---
          if(WhichMode == MODE_CREATE) {Position2D.x = gFlow_Pad.LBL_C2.GAC.X_Distance() - 429; Position2D.y = gFlow_Pad.LBL_C2.GAC.Y_Distance() - 82; }
          if(WhichMode == MODE_MOVE)   {Position2D.x = gFlow_Pad.LBL_C2.GAC.X_Distance() - 429; Position2D.y = gFlow_Pad.LBL_C2.GAC.Y_Distance() - 82; }
          //*************************************************************************************************
          int SolidX = FixPadFlowX + FlowPanel.independ2D.x + Position2D.x;// Alert("FixPadFlowX? ", FixPadFlowX, "    FlowPanel.independ2D.x? ", FlowPanel.independ2D.x, "    Position2D.x? ", Position2D.x);
          int SolidY = FixPadFlowY + FlowPanel.independ2D.y + Position2D.y;
          //----
          //---  if(WhichMode == MODE_CREATE && IsKey) Alert("WhichMode==MODE_CREATE && IsKey     X:" + (string)(SolidX) + "     Y: " + (string)(SolidY) );
          //---
          {         //--- BTN_X gCandelBox_Pad.BTN_CandelBoxFill ---//
                    {         gCandelBox_Pad.BTN_CandelBoxFill.GDS.Set_Action_2(WhichMode, IsKey /*int WhichMode = MODE_CREATE, bool IsKey = false*/);
                              gCandelBox_Pad.BTN_CandelBoxFill.GDS.Set_Desc_4("gCandelBox_Pad.BTN_CandelBoxFill", "q", "Wingdings", 10);
                              gCandelBox_Pad.BTN_CandelBoxFill.GDS.Set_Self_1(ButtonDEF_state);
                              gCandelBox_Pad.BTN_CandelBoxFill.GDS.Set_Location_5((int)(390) + SolidX, (int)(100 + 42.8) + SolidY, BUTTONX_WIDTH / 4 + 7, BUTTONX_HEIGHT, CORNER_LEFT_UPPER);
                              gCandelBox_Pad.BTN_CandelBoxFill.GDS.Set_Color_3(clrLavender, clrLavender, clrDarkCyan);
                              gCandelBox_Pad.BTN_CandelBoxFill.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "gCandelBox_Pad.BTN_CandelBoxFill");
                              gCandelBox_Pad.BTN_CandelBoxFill.GDS.Set_Chart_6();
                              gCandelBox_Pad.BTN_CandelBoxFill.Action(gCandelBox_Pad.BTN_CandelBoxFill);//
                              //--- gCandelBox_Pad.BTN_CandelBoxFill.Create(Is_Create, Is_Move, __FUNCSIG__, "gCandelBox_Pad.BTN_CandelBoxFill", "q",
                              //--- (int)(390) + FixPadFlowX + FlowPanel.independ2D.x + MoveX2, MoveY2 +      (int)(100 + 42.8) + FixPadFlowY + FlowPanel.independ2D.y, BUTTONX_WIDTH / 4 + 7, BUTTONX_HEIGHT,
                              //--- CORNER_LEFT_UPPER, ANCHOR_CENTER, false, clrLavender, clrLavender, clrDarkCyan, 0, 10, "Wingdings");
                    }
                    //--- BTN_X gCandelBox_Pad.BTN_CandelBoxFillResetCount ---//
                    {         gCandelBox_Pad.BTN_CandelBoxFillResetCount.GDS.Set_Action_2(WhichMode, IsKey /*int WhichMode = MODE_CREATE, bool IsKey = false*/);
                              gCandelBox_Pad.BTN_CandelBoxFillResetCount.GDS.Set_Desc_4("gCandelBox_Pad.BTN_CandelBoxFillResetCount", "", "Wingdings", 15);
                              gCandelBox_Pad.BTN_CandelBoxFillResetCount.GDS.Set_Self_1(ButtonDEF_state);
                              gCandelBox_Pad.BTN_CandelBoxFillResetCount.GDS.Set_Location_5((int)(354.9) + SolidX, (int)(100 + 42) + SolidY, BUTTONX_WIDTH / 4 + 6, BUTTONX_HEIGHT, CORNER_LEFT_UPPER);
                              gCandelBox_Pad.BTN_CandelBoxFillResetCount.GDS.Set_Color_3(clrLavender, clrLavender, clrDarkCyan);
                              gCandelBox_Pad.BTN_CandelBoxFillResetCount.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "gCandelBox_Pad.BTN_CandelBoxFillResetCount");
                              gCandelBox_Pad.BTN_CandelBoxFillResetCount.GDS.Set_Chart_6();
                              gCandelBox_Pad.BTN_CandelBoxFillResetCount.Action(gCandelBox_Pad.BTN_CandelBoxFillResetCount);//
                              //--- gCandelBox_Pad.BTN_CandelBoxFillResetCount.Create(Is_Create, Is_Move, __FUNCSIG__, "gCandelBox_Pad.BTN_CandelBoxFillResetCount", "",
                              //--- (int)(354.9) + FixPadFlowX + FlowPanel.independ2D.x + MoveX2, MoveY2 +      (int)(100 + 42) + FixPadFlowY + FlowPanel.independ2D.y, BUTTONX_WIDTH / 4 + 6, BUTTONX_HEIGHT,
                              //--- CORNER_LEFT_UPPER, ANCHOR_CENTER, false, clrLavender, clrLavender, clrDarkCyan, 0, 15, "Wingdings");
                    }
                    ////--- nonGeneric LBL_X gCandelBox_Pad.LBL_CandelBoxCount ---///
                    {         gCandelBox_Pad.LBL_CandelBoxCount.GDS.Set_Action_2(WhichMode, IsKey);
                              gCandelBox_Pad.LBL_CandelBoxCount.GDS.Set_Desc_4("gCandelBox_Pad.LBL_CandelBoxCount", (string)CounterValueBoxCount, "Arial", 7);
                              gCandelBox_Pad.LBL_CandelBoxCount.GDS.Set_Color_1(clrDarkCyan);
                              gCandelBox_Pad.LBL_CandelBoxCount.GDS.Set_Location_5((int)(361.4) + SolidX, (int)(100 + 49.2) + SolidY, 0, CORNER_LEFT_UPPER, ANCHOR_CENTER);
                              gCandelBox_Pad.LBL_CandelBoxCount.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "gCandelBox_Pad.LBL_CandelBoxCount");
                              gCandelBox_Pad.LBL_CandelBoxCount.GDS.Set_Chart_6();
                              gCandelBox_Pad.LBL_CandelBoxCount.Action(gCandelBox_Pad.LBL_CandelBoxCount);//
                              //--- gCandelBox_Pad.LBL_CandelBoxCount.Create( Is_Create, Is_Move, "gCandelBox_Pad.LBL_CandelBoxCount", (string)CounterValueBoxCount,
                              //--- (int)(361.4) + FixPadFlowX + FlowPanel.independ2D.x  + MoveX2, MoveY2 +       (int)(100 + 49.2) + FixPadFlowY + FlowPanel.independ2D.y,
                              //--- CORNER_LEFT_UPPER, ANCHOR_CENTER, false,  clrDarkCyan, 0, 7, "Arial"); //
                    }
                    //--- BTN_X gCandelBox_Pad.BTN_CandelBoxFillResetCount -- - //
                    {         gCandelBox_Pad.BTN_CandelBoxUp.GDS.Set_Action_2(WhichMode, IsKey /*int WhichMode = MODE_CREATE, bool IsKey = false*/);
                              gCandelBox_Pad.BTN_CandelBoxUp.GDS.Set_Desc_4("gCandelBox_Pad.BTN_CandelBoxUp", "5", "Webdings", 10);
                              gCandelBox_Pad.BTN_CandelBoxUp.GDS.Set_Self_1(ButtonDEF_state);
                              gCandelBox_Pad.BTN_CandelBoxUp.GDS.Set_Location_5((int)( 338.52)  + SolidX, (int)(100 + 42)  + SolidY, BUTTONX_WIDTH / 4 + 5, BUTTONX_HEIGHT, CORNER_LEFT_UPPER);
                              gCandelBox_Pad.BTN_CandelBoxUp.GDS.Set_Color_3(clrLavender, clrLavender, clrDarkCyan);
                              gCandelBox_Pad.BTN_CandelBoxUp.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "gCandelBox_Pad.BTN_CandelBoxUp");
                              gCandelBox_Pad.BTN_CandelBoxUp.GDS.Set_Chart_6();
                              gCandelBox_Pad.BTN_CandelBoxUp.Action(gCandelBox_Pad.BTN_CandelBoxUp);//
                              //--- gCandelBox_Pad.BTN_CandelBoxUp.Create(Is_Create, Is_Move, __FUNCSIG__, "gCandelBox_Pad.BTN_CandelBoxUp", "5",
                              //--- (int)( 338.52) + FixPadFlowX + FlowPanel.independ2D.x + MoveX2, MoveY2 +      (int)(100 + 42) + FixPadFlowY + FlowPanel.independ2D.y, BUTTONX_WIDTH / 4 + 5, BUTTONX_HEIGHT,
                              //--- CORNER_LEFT_UPPER, ANCHOR_CENTER, false, clrLavender, clrLavender, clrDarkCyan, 0, 10, "Webdings");
                    }
                    //--- BTN_X gCandelBox_Pad.BTN_CandelBoxDown ---//
                    {         gCandelBox_Pad.BTN_CandelBoxDown.GDS.Set_Action_2(WhichMode, IsKey /*int WhichMode = MODE_CREATE, bool IsKey = false*/);
                              gCandelBox_Pad.BTN_CandelBoxDown.GDS.Set_Desc_4("gCandelBox_Pad.BTN_CandelBoxDown", "6", "Webdings", 10);
                              gCandelBox_Pad.BTN_CandelBoxDown.GDS.Set_Self_1(ButtonDEF_state);
                              gCandelBox_Pad.BTN_CandelBoxDown.GDS.Set_Location_5((int)(371.8) + SolidX, (int)(100 + 42)  + SolidY, BUTTONX_WIDTH / 4 + 4, BUTTONX_HEIGHT, CORNER_LEFT_UPPER);
                              gCandelBox_Pad.BTN_CandelBoxDown.GDS.Set_Color_3(clrLavender, clrLavender, clrDarkCyan);
                              gCandelBox_Pad.BTN_CandelBoxDown.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "gCandelBox_Pad.BTN_CandelBoxDown");
                              gCandelBox_Pad.BTN_CandelBoxDown.GDS.Set_Chart_6();
                              gCandelBox_Pad.BTN_CandelBoxDown.Action(gCandelBox_Pad.BTN_CandelBoxDown);//
                              //--- gCandelBox_Pad.BTN_CandelBoxDown.Create(Is_Create, Is_Move, __FUNCSIG__, "gCandelBox_Pad.BTN_CandelBoxDown", "6",//---
                              //--- (int)(371.8) + FixPadFlowX + FlowPanel.independ2D.x + MoveX2, MoveY2 +      (int)(100 + 42) + FixPadFlowY + FlowPanel.independ2D.y, BUTTONX_WIDTH / 4 + 4, BUTTONX_HEIGHT,
                              //--- CORNER_LEFT_UPPER, ANCHOR_CENTER, false, clrLavender, clrLavender, clrDarkCyan, 0, 10, "Webdings");
                    }
                    //--- BTN_X gCandelBox_Pad.BTN_CandelBoxKeyClear ---//
                    {         gCandelBox_Pad.BTN_CandelBoxKeyClear.GDS.Set_Action_2(WhichMode, IsKey /*int WhichMode = MODE_CREATE, bool IsKey = false*/);
                              gCandelBox_Pad.BTN_CandelBoxKeyClear.GDS.Set_Desc_4("gCandelBox_Pad.BTN_CandelBoxKeyClear", "Clear", "Arial", 7);
                              gCandelBox_Pad.BTN_CandelBoxKeyClear.GDS.Set_Self_1(ButtonDEF_state);
                              gCandelBox_Pad.BTN_CandelBoxKeyClear.GDS.Set_Location_5((int)( 310.7)  + SolidX, (int)(100 + 56.8) + SolidY, BUTTONX_WIDTH / 3 + 12, BUTTONX_HEIGHT, CORNER_LEFT_UPPER);
                              gCandelBox_Pad.BTN_CandelBoxKeyClear.GDS.Set_Color_3(clrLavender, clrLavender, clrDarkCyan);
                              gCandelBox_Pad.BTN_CandelBoxKeyClear.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "gCandelBox_Pad.BTN_CandelBoxKeyClear");
                              gCandelBox_Pad.BTN_CandelBoxKeyClear.GDS.Set_Chart_6();
                              gCandelBox_Pad.BTN_CandelBoxKeyClear.Action(gCandelBox_Pad.BTN_CandelBoxKeyClear);//
                              //--- gCandelBox_Pad.BTN_CandelBoxKeyClear.Create(Is_Create, Is_Move, __FUNCSIG__, "gCandelBox_Pad.BTN_CandelBoxKeyClear", "Clear",
                              //--- (int)( 310.7) + FixPadFlowX + FlowPanel.independ2D.x + MoveX2, MoveY2 +      (int)(100 + 56.8) + FixPadFlowY + FlowPanel.independ2D.y, BUTTONX_WIDTH / 3 + 12, BUTTONX_HEIGHT,
                              //--- CORNER_LEFT_UPPER, ANCHOR_CENTER, false, clrLavender, clrLavender, clrDarkCyan);
                    }
                    //-------------
                    //-------------
                    //-------------
                    //--- BTN_X gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M1 ---//
                    {         gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M1.GDS.Set_Action_2(WhichMode, IsKey /*int WhichMode = MODE_CREATE, bool IsKey = false*/);
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M1.GDS.Set_Desc_4("gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M1", "M1", "Arial", 7);
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M1.GDS.Set_Self_1(ButtonDEF_state);
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M1.GDS.Set_Location_5((int)(286)  + SolidX, (int)(156.8) + SolidY, BUTTONX_WIDTH / 3 + 10, BUTTONX_HEIGHT, CORNER_LEFT_UPPER);
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M1.GDS.Set_Color_3(clrLavender, clrLavender, clrDarkCyan);
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M1.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M1");
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M1.GDS.Set_Chart_6();
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M1.Action(gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M1);//
                              //--- gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M1.Create(Is_Create, Is_Move, __FUNCSIG__, "gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M1", "M1",
                              //--- (int)(286) + FixPadFlowX + FlowPanel.independ2D.x  + MoveX2, MoveY2 +      (int)(156.8) + FixPadFlowY + FlowPanel.independ2D.y, BUTTONX_WIDTH / 3 + 10, BUTTONX_HEIGHT,
                              //--- CORNER_LEFT_UPPER, ANCHOR_CENTER, false, clrLavender, clrLavender, clrDarkCyan);
                    }
                    //--- BTN_X gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M5 ---//
                    {         gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M5.GDS.Set_Action_2(WhichMode, IsKey /*int WhichMode = MODE_CREATE, bool IsKey = false*/);
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M5.GDS.Set_Desc_4("gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M5", "M5", "Arial", 7);
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M5.GDS.Set_Self_1(ButtonDEF_state);
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M5.GDS.Set_Location_5((int)( 262.6)  + SolidX, (int)(156.8)  + SolidY, BUTTONX_WIDTH / 3 + 10, BUTTONX_HEIGHT, CORNER_LEFT_UPPER);
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M5.GDS.Set_Color_3(clrLavender, clrLavender, clrDarkCyan);
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M5.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M5");
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M5.GDS.Set_Chart_6();
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M5.Action(gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M5);//
                              //--- gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M5.Create(Is_Create, Is_Move, __FUNCSIG__, "gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M5", "M5",        //
                              //--- (int)( 262.6) + FixPadFlowX + FlowPanel.independ2D.x  + MoveX2, MoveY2 +      (int)(156.8) + FixPadFlowY + FlowPanel.independ2D.y, BUTTONX_WIDTH / 3 + 10, BUTTONX_HEIGHT,   //
                              //--- CORNER_LEFT_UPPER, ANCHOR_CENTER, false, clrLavender, clrLavender, clrDarkCyan);
                    }
                    //--- BTN_X gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M15 ---//
                    {         gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M15.GDS.Set_Action_2(WhichMode, IsKey /*int WhichMode = MODE_CREATE, bool IsKey = false*/);
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M15.GDS.Set_Desc_4("gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M15", "M15", "Arial", 7);
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M15.GDS.Set_Self_1(ButtonDEF_state);
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M15.GDS.Set_Location_5((int)(238.68)  + SolidX, (int)(156.8) + SolidY, BUTTONX_WIDTH / 3 + 10, BUTTONX_HEIGHT, CORNER_LEFT_UPPER);
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M15.GDS.Set_Color_3(clrLavender, clrLavender, clrDarkCyan);
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M15.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M15");
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M15.GDS.Set_Chart_6();
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M15.Action(gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M15);//
                              //---  gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M15.Create(Is_Create, Is_Move, __FUNCSIG__, "gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M15", "M15",
                              //--- (int)(238.68) + FixPadFlowX + FlowPanel.independ2D.x + MoveX2, MoveY2 +      (int)(156.8) + FixPadFlowY + FlowPanel.independ2D.y, BUTTONX_WIDTH / 3 + 10, BUTTONX_HEIGHT,
                              //--- CORNER_LEFT_UPPER, ANCHOR_CENTER, false, clrLavender, clrLavender, clrDarkCyan);
                    }
                    //--- BTN_X gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M30 ---//
                    {         gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M30.GDS.Set_Action_2(WhichMode, IsKey /*int WhichMode = MODE_CREATE, bool IsKey = false*/);
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M30.GDS.Set_Desc_4("gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M30", "M30", "Arial", 7);
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M30.GDS.Set_Self_1(ButtonDEF_state);
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M30.GDS.Set_Location_5((int)(214.5) + SolidX, (int)(156.8)  + SolidY, BUTTONX_WIDTH / 3 + 10, BUTTONX_HEIGHT, CORNER_LEFT_UPPER);
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M30.GDS.Set_Color_3(clrLavender, clrLavender, clrDarkCyan);
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M30.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M30");
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M30.GDS.Set_Chart_6();
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M30.Action(gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M30);//
                              //--- gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M30.Create(Is_Create, Is_Move, __FUNCSIG__, "gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M30", "M30",
                              //--- (int)(214.5) + FixPadFlowX + FlowPanel.independ2D.x + MoveX2, MoveY2 +      (int)(156.8) + FixPadFlowY + FlowPanel.independ2D.y, BUTTONX_WIDTH / 3 + 10, BUTTONX_HEIGHT,
                              //--- CORNER_LEFT_UPPER, ANCHOR_CENTER, false, clrLavender, clrLavender, clrDarkCyan);
                    }
                    //--- BTN_X gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_H1 ---//
                    {         gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_H1.GDS.Set_Action_2(WhichMode, IsKey /*int WhichMode = MODE_CREATE, bool IsKey = false*/);
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_H1.GDS.Set_Desc_4("gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_H1", "H1", "Arial", 7);
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_H1.GDS.Set_Self_1(ButtonDEF_state);
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_H1.GDS.Set_Location_5((int)( 310.7)  + SolidX, (int)(172)  + SolidY, BUTTONX_WIDTH / 3 + 12, BUTTONX_HEIGHT, CORNER_LEFT_UPPER);
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_H1.GDS.Set_Color_3(clrLavender, clrLavender, clrDarkCyan);
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_H1.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_H1");
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_H1.GDS.Set_Chart_6();
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_H1.Action(gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_H1);//
                              //--- gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_H1.Create(Is_Create, Is_Move, __FUNCSIG__, "gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_H1", "H1",
                              //--- (int)( 310.7) + FixPadFlowX + FlowPanel.independ2D.x + MoveX2, MoveY2 +      (int)(172) + FixPadFlowY + FlowPanel.independ2D.y, BUTTONX_WIDTH / 3 + 12, BUTTONX_HEIGHT,
                              //--- CORNER_LEFT_UPPER, ANCHOR_CENTER, false, clrLavender, clrLavender, clrDarkCyan);
                    }
                    //--- BTN_X gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_H4 ---//
                    {         gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_H4.GDS.Set_Action_2(WhichMode, IsKey /*int WhichMode = MODE_CREATE, bool IsKey = false*/);
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_H4.GDS.Set_Desc_4("gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_H4", "H4", "Arial", 7);
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_H4.GDS.Set_Self_1(ButtonDEF_state);
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_H4.GDS.Set_Location_5((int)(286) + SolidX, (int)(172)  + SolidY, BUTTONX_WIDTH / 3 + 10, BUTTONX_HEIGHT, CORNER_LEFT_UPPER);
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_H4.GDS.Set_Color_3(clrLavender, clrLavender, clrDarkCyan);
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_H4.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_H4");
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_H4.GDS.Set_Chart_6();
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_H4.Action(gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_H4);//
                              //---  gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_H4.Create(Is_Create, Is_Move, __FUNCSIG__, "gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_H4", "H4",
                              //--- (int)(286) + FixPadFlowX + FlowPanel.independ2D.x  + MoveX2, MoveY2 +      (int)(172) + FixPadFlowY + FlowPanel.independ2D.y, BUTTONX_WIDTH / 3 + 10, BUTTONX_HEIGHT,
                              //--- CORNER_LEFT_UPPER, ANCHOR_CENTER, false, clrLavender, clrLavender, clrDarkCyan);
                    }
                    //--- BTN_X gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_D1 ---//
                    {         gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_D1.GDS.Set_Action_2(WhichMode, IsKey /*int WhichMode = MODE_CREATE, bool IsKey = false*/);
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_D1.GDS.Set_Desc_4("gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_D1", "D1", "Arial", 7);
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_D1.GDS.Set_Self_1(ButtonDEF_state);
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_D1.GDS.Set_Location_5((int)( 262.6)  + SolidX, (int)(172)  + SolidY, BUTTONX_WIDTH / 3 + 10, BUTTONX_HEIGHT, CORNER_LEFT_UPPER);
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_D1.GDS.Set_Color_3(clrLavender, clrLavender, clrDarkCyan);
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_D1.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_D1");
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_D1.GDS.Set_Chart_6();
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_D1.Action(gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_D1);//
                              //--- gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_D1.Create(Is_Create, Is_Move, __FUNCSIG__, "gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_D1", "D1",
                              //--- (int)( 262.6) + FixPadFlowX + FlowPanel.independ2D.x  + MoveX2, MoveY2 +      (int)(172) + FixPadFlowY + FlowPanel.independ2D.y, BUTTONX_WIDTH / 3 + 10, BUTTONX_HEIGHT,
                              //--- CORNER_LEFT_UPPER, ANCHOR_CENTER, false, clrLavender, clrLavender, clrDarkCyan);
                    }
                    //--- BTN_X gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_W1 ---//
                    {         gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_W1.GDS.Set_Action_2(WhichMode, IsKey /*int WhichMode = MODE_CREATE, bool IsKey = false*/);
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_W1.GDS.Set_Desc_4("gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_W1", "W1", "Arial", 7);
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_W1.GDS.Set_Self_1(ButtonDEF_state);
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_W1.GDS.Set_Location_5((int)(238.68)  + SolidX, (int)(172) + SolidY, BUTTONX_WIDTH / 3 + 10, BUTTONX_HEIGHT, CORNER_LEFT_UPPER);
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_W1.GDS.Set_Color_3(clrLavender, clrLavender, clrDarkCyan);
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_W1.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_W1");
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_W1.GDS.Set_Chart_6();
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_W1.Action(gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_W1);//
                              //--- gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_W1.Create(Is_Create, Is_Move, __FUNCSIG__, "gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_W1", "W1",
                              //--- (int)(238.68) + FixPadFlowX + FlowPanel.independ2D.x + MoveX2, MoveY2 +      (int)(172) + FixPadFlowY + FlowPanel.independ2D.y, BUTTONX_WIDTH / 3 + 10, BUTTONX_HEIGHT,
                              //--- CORNER_LEFT_UPPER, ANCHOR_CENTER, false, clrLavender, clrLavender, clrDarkCyan);
                    }
                    //--- BTN_X gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_MN1 ---//
                    {         gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_MN1.GDS.Set_Action_2(WhichMode, IsKey /*int WhichMode = MODE_CREATE, bool IsKey = false*/);
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_MN1.GDS.Set_Desc_4("gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_MN1", "MN1", "Arial", 7);
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_MN1.GDS.Set_Self_1(ButtonDEF_state);
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_MN1.GDS.Set_Location_5((int)(214.5)  + SolidX, (int)(172) + SolidY, BUTTONX_WIDTH / 3 + 10, BUTTONX_HEIGHT, CORNER_LEFT_UPPER);
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_MN1.GDS.Set_Color_3(clrLavender, clrLavender, clrDarkCyan);
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_MN1.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_MN1");
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_MN1.GDS.Set_Chart_6();
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_MN1.Action(gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_MN1);//
                              //---  gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_MN1.Create(Is_Create, Is_Move, __FUNCSIG__, "gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_MN1", "MN1",
                              //--- (int)(214.5) + FixPadFlowX + FlowPanel.independ2D.x + MoveX2, MoveY2 +      (int)(172) + FixPadFlowY + FlowPanel.independ2D.y, BUTTONX_WIDTH / 3 + 10, BUTTONX_HEIGHT,
                              //--- CORNER_LEFT_UPPER, ANCHOR_CENTER, false, clrLavender, clrLavender, clrDarkCyan); //
                    }
                    //
          }//
          {         ///=========
                    CandelBoxFillValClass ? gCandelBox_Pad.BTN_CandelBoxFill.GAC.Color(CandelBoxBTNColorB.DescColorPress)         : gCandelBox_Pad.BTN_CandelBoxFill.GAC.Color(CandelBoxBTNColorB.DescColor);
                    CandelBoxFillValClass ? gCandelBox_Pad.BTN_CandelBoxFill.GAC.BackColor(CandelBoxBTNColorB.BackColorPress)     : gCandelBox_Pad.BTN_CandelBoxFill.GAC.BackColor(CandelBoxBTNColorB.BackColor);
                    CandelBoxFillValClass ? gCandelBox_Pad.BTN_CandelBoxFill.GAC.BorderColor(CandelBoxBTNColorB.BorderColorPress) : gCandelBox_Pad.BTN_CandelBoxFill.GAC.BorderColor(CandelBoxBTNColorB.BorderColor);
                    CandelBoxFillValClass ? gCandelBox_Pad.BTN_CandelBoxFill.GAC.State(true)                                      : gCandelBox_Pad.BTN_CandelBoxFill.GAC.State(false);
                    //======
                    ///=========
                    Is_PERIOD_M1 ? gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M1.GAC.Color(CandelBoxBTNColorB.DescColorPress)         : gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M1.GAC.Color(CandelBoxBTNColorB.DescColor);
                    Is_PERIOD_M1 ? gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M1.GAC.BackColor(CandelBoxBTNColorB.BackColorPress)     : gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M1.GAC.BackColor(CandelBoxBTNColorB.BackColor);
                    Is_PERIOD_M1 ? gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M1.GAC.BorderColor(CandelBoxBTNColorB.BorderColorPress) : gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M1.GAC.BorderColor(CandelBoxBTNColorB.BorderColor);
                    Is_PERIOD_M1 ? gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M1.GAC.State(true)                                      : gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M1.GAC.State(false);
                    //======
                    ///=========
                    Is_PERIOD_M5 ? gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M5.GAC.Color(CandelBoxBTNColorB.DescColorPress)         : gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M5.GAC.Color(CandelBoxBTNColorB.DescColor);
                    Is_PERIOD_M5 ? gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M5.GAC.BackColor(CandelBoxBTNColorB.BackColorPress)     : gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M5.GAC.BackColor(CandelBoxBTNColorB.BackColor);
                    Is_PERIOD_M5 ? gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M5.GAC.BorderColor(CandelBoxBTNColorB.BorderColorPress) : gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M5.GAC.BorderColor(CandelBoxBTNColorB.BorderColor);
                    Is_PERIOD_M5 ? gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M5.GAC.State(true)                                      : gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M5.GAC.State(false);
                    //======
                    ///=========
                    Is_PERIOD_M15 ? gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M15.GAC.Color(CandelBoxBTNColorB.DescColorPress)         : gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M15.GAC.Color(CandelBoxBTNColorB.DescColor);
                    Is_PERIOD_M15 ? gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M15.GAC.BackColor(CandelBoxBTNColorB.BackColorPress)     : gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M15.GAC.BackColor(CandelBoxBTNColorB.BackColor);
                    Is_PERIOD_M15 ? gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M15.GAC.BorderColor(CandelBoxBTNColorB.BorderColorPress) : gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M15.GAC.BorderColor(CandelBoxBTNColorB.BorderColor);
                    Is_PERIOD_M15 ? gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M15.GAC.State(true)                                      : gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M15.GAC.State(false);
                    //======
                    ///=========
                    Is_PERIOD_M30 ? gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M30.GAC.Color(CandelBoxBTNColorB.DescColorPress)         : gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M30.GAC.Color(CandelBoxBTNColorB.DescColor);
                    Is_PERIOD_M30 ? gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M30.GAC.BackColor(CandelBoxBTNColorB.BackColorPress)     : gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M30.GAC.BackColor(CandelBoxBTNColorB.BackColor);
                    Is_PERIOD_M30 ? gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M30.GAC.BorderColor(CandelBoxBTNColorB.BorderColorPress) : gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M30.GAC.BorderColor(CandelBoxBTNColorB.BorderColor);
                    Is_PERIOD_M30 ? gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M30.GAC.State(true)                                      : gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M30.GAC.State(false);
                    //======
                    ///=========
                    Is_PERIOD_H1 ? gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_H1.GAC.Color(CandelBoxBTNColorB.DescColorPress)         : gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_H1.GAC.Color(CandelBoxBTNColorB.DescColor);
                    Is_PERIOD_H1 ? gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_H1.GAC.BackColor(CandelBoxBTNColorB.BackColorPress)     : gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_H1.GAC.BackColor(CandelBoxBTNColorB.BackColor);
                    Is_PERIOD_H1 ? gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_H1.GAC.BorderColor(CandelBoxBTNColorB.BorderColorPress) : gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_H1.GAC.BorderColor(CandelBoxBTNColorB.BorderColor);
                    Is_PERIOD_H1 ? gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_H1.GAC.State(true)                                      : gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_H1.GAC.State(false);
                    //======
                    ///=========
                    Is_PERIOD_H4 ? gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_H4.GAC.Color(CandelBoxBTNColorB.DescColorPress)         : gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_H4.GAC.Color(CandelBoxBTNColorB.DescColor);
                    Is_PERIOD_H4 ? gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_H4.GAC.BackColor(CandelBoxBTNColorB.BackColorPress)     : gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_H4.GAC.BackColor(CandelBoxBTNColorB.BackColor);
                    Is_PERIOD_H4 ? gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_H4.GAC.BorderColor(CandelBoxBTNColorB.BorderColorPress) : gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_H4.GAC.BorderColor(CandelBoxBTNColorB.BorderColor);
                    Is_PERIOD_H4 ? gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_H4.GAC.State(true)                                      : gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_H4.GAC.State(false);
                    //======
                    ///=========
                    Is_PERIOD_D1 ? gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_D1.GAC.Color(CandelBoxBTNColorB.DescColorPress)         : gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_D1.GAC.Color(CandelBoxBTNColorB.DescColor);
                    Is_PERIOD_D1 ? gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_D1.GAC.BackColor(CandelBoxBTNColorB.BackColorPress)     : gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_D1.GAC.BackColor(CandelBoxBTNColorB.BackColor);
                    Is_PERIOD_D1 ? gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_D1.GAC.BorderColor(CandelBoxBTNColorB.BorderColorPress) : gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_D1.GAC.BorderColor(CandelBoxBTNColorB.BorderColor);
                    Is_PERIOD_D1 ? gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_D1.GAC.State(true)                                      : gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_D1.GAC.State(false);
                    //======
                    ///=========
                    Is_PERIOD_W1 ? gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_W1.GAC.Color(CandelBoxBTNColorB.DescColorPress)         : gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_W1.GAC.Color(CandelBoxBTNColorB.DescColor);
                    Is_PERIOD_W1 ? gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_W1.GAC.BackColor(CandelBoxBTNColorB.BackColorPress)     : gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_W1.GAC.BackColor(CandelBoxBTNColorB.BackColor);
                    Is_PERIOD_W1 ? gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_W1.GAC.BorderColor(CandelBoxBTNColorB.BorderColorPress) : gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_W1.GAC.BorderColor(CandelBoxBTNColorB.BorderColor);
                    Is_PERIOD_W1 ? gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_W1.GAC.State(true)                                      : gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_W1.GAC.State(false);
                    //======
                    ///=========
                    Is_PERIOD_MN1 ? gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_MN1.GAC.Color(CandelBoxBTNColorB.DescColorPress)         : gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_MN1.GAC.Color(CandelBoxBTNColorB.DescColor);
                    Is_PERIOD_MN1 ? gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_MN1.GAC.BackColor(CandelBoxBTNColorB.BackColorPress)     : gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_MN1.GAC.BackColor(CandelBoxBTNColorB.BackColor);
                    Is_PERIOD_MN1 ? gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_MN1.GAC.BorderColor(CandelBoxBTNColorB.BorderColorPress) : gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_MN1.GAC.BorderColor(CandelBoxBTNColorB.BorderColor);
                    Is_PERIOD_MN1 ? gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_MN1.GAC.State(true)                                      : gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_MN1.GAC.State(false);
                    //======
          }
//
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-ComplexToolsController Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          return true;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_Candels_Box::OBJECT_CLICK()
{         //----------------------------------------------------------
          int           BoxCount = (int)CounterValueBoxCount;//5;
          const bool    FillCOM = true;
          const int     WidthCOM = 1;
          //----------------------------------------------------------
          string Clicked = Event.sparam;
          //OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO//
          //IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//gCandelBox_Pad.BTN_CandelBox
          //OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO//
          if(gCandelBox_Pad.BTN_CandelBox.GAC.Name() == Clicked)
          {         if ( !gCandelBox_Pad.BTN_CandelBox.GAC.State() ) //
                    {         gCandelBox_Pad.BTN_CandelBox.GAC.Color(CandelBoxBTNColorB.DescColorPress );
                              gCandelBox_Pad.BTN_CandelBox.GAC.BackColor(CandelBoxBTNColorB.BackColorPress  );
                              gCandelBox_Pad.BTN_CandelBox.GAC.BorderColor(CandelBoxBTNColorB.BorderColorPress );
                              //Tools.UseCChart.ShiftSize(50)  //
                              __Call(MODE_CREATE, false, Sg_Position2D_Def);
                              ///=========
                              //---------------------------------------------------------------------------
                              Sleep(10); //
                    } //
                    else
                    {         gCandelBox_Pad.BTN_CandelBox.GAC.Color(CandelBoxBTNColorB.DescColor );
                              gCandelBox_Pad.BTN_CandelBox.GAC.BackColor(CandelBoxBTNColorB.BackColor  );
                              gCandelBox_Pad.BTN_CandelBox.GAC.BorderColor(CandelBoxBTNColorB.BorderColor );
                              //Sleep(10);
                              __Call(MODE_CREATE, true, Sg_Position2D_Def);
                              //---------------------------------------------------------------------------
                              //Tools.UseCChart.Shift(false); //
                    }//
          }
          //OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO//
          //IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
          //OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO//
          if ( gCandelBox_Pad.BTN_CandelBoxFill.GAC.Name() == Clicked)
          {         //
                    bool Get = true; bool Set_ = true;  long FillValClass = 0;
                    if (  gCandelBox_Pad.BTN_CandelBoxFill.GAC.State() ) //
                    {         //KeyPERIOD_M1 = false;
                              //Candels_Box.PadFlow__SubCandelBoxObjectGet(FillValClass, true, 0, 1);
                              CandelBoxFillValClass = true;
                              PadFlow__SubCandelBoxObjectGetSet_(FillValClass, true, Set_, !Get);
                              gCandelBox_Pad.BTN_CandelBoxFill.GAC.Color(CandelBoxBTNColorB.DescColorPress);
                              gCandelBox_Pad.BTN_CandelBoxFill.GAC.BackColor(CandelBoxBTNColorB.BackColorPress);
                              gCandelBox_Pad.BTN_CandelBoxFill.GAC.BorderColor(CandelBoxBTNColorB.BorderColorPress);
                              //FillValClass = FillValClass;;//Gone 0////with out gone 0 next if 1
                              //>>Alert( FillValClass, "-- FillValClass--== false");
                              //
                              //
                    }
                    else
                    {         CandelBoxFillValClass = false;
                              PadFlow__SubCandelBoxObjectGetSet_(FillValClass, false, Set_, !Get);
                              gCandelBox_Pad.BTN_CandelBoxFill.GAC.Color(CandelBoxBTNColorB.DescColor);
                              gCandelBox_Pad.BTN_CandelBoxFill.GAC.BackColor(CandelBoxBTNColorB.BackColor);
                              gCandelBox_Pad.BTN_CandelBoxFill.GAC.BorderColor(CandelBoxBTNColorB.BorderColor);
                              //FillValClass = FillValClass;//Gone 0
                              //>>Alert( FillValClass, "-- FillValClass-- == true");
                              //
                    }//
                    //---------------------------------------------------------------------------
                    //Sleep(10); gCandelBox_Pad.BTN_CandelBoxFill.GAC.State(false); // gCandelBox_Pad.BTN_CandelBoxFill.GAC.State()
          } //
          //OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO//
          //IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
          //OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO//
          if ( gCandelBox_Pad.BTN_CandelBoxKeyClear.GAC.State()   && gCandelBox_Pad.BTN_CandelBoxKeyClear.GAC.Name() == Clicked ) //
          {         bool Create = true;
                    //gCandelBox_Pad.BTN_CandelBoxKeyClear.GAC.Color(CandelBoxBTNColorB.DescColorPress );
                    //gCandelBox_Pad.BTN_CandelBoxKeyClear.GAC.BackColor(CandelBoxBTNColorB.BackColorPress  );
                    //gCandelBox_Pad.BTN_CandelBoxKeyClear.GAC.BorderColor(CandelBoxBTNColorB.BorderColorPress );
                    //---------------------------------------------------------------------------
                    //
                    if(Is_PERIOD_M1)    __Create( !Create, PERIOD_M1, BoxCount, FillCOM, WidthCOM);
                    if(Is_PERIOD_M15)   __Create( !Create, PERIOD_M5, BoxCount, FillCOM, WidthCOM);
                    if(Is_PERIOD_M15)   __Create( !Create, PERIOD_M15, BoxCount, FillCOM, WidthCOM);
                    if(Is_PERIOD_M30)   __Create( !Create, PERIOD_M30, BoxCount, FillCOM, WidthCOM);
                    if(Is_PERIOD_H1)    __Create( !Create, PERIOD_H1, BoxCount, FillCOM, WidthCOM);
                    if(Is_PERIOD_H4)    __Create( !Create, PERIOD_H4, BoxCount, FillCOM, WidthCOM);
                    if(Is_PERIOD_D1)    __Create( !Create, PERIOD_D1, BoxCount, FillCOM, WidthCOM);
                    if(Is_PERIOD_W1)    __Create( !Create, PERIOD_W1, BoxCount, FillCOM, WidthCOM);
                    if(Is_PERIOD_MN1)   __Create( !Create, PERIOD_MN1, BoxCount, FillCOM, WidthCOM);
                    //----
                    //=========================================================|
                    Is_PERIOD_M1  =  Is_PERIOD_M5  = Is_PERIOD_M15 = Is_PERIOD_M30 = Is_PERIOD_H1  = Is_PERIOD_H4  = Is_PERIOD_D1  = Is_PERIOD_W1  = Is_PERIOD_MN1 = false;
                    //=========================================================|
                    Sleep(10); gCandelBox_Pad.BTN_CandelBoxKeyClear.GAC.State(false); //
                    if(1)          //
                    {         gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M1.GAC.Color(CandelBoxBTNColorB.DescColor );
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M1.GAC.BackColor(CandelBoxBTNColorB.BackColor  );
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M1.GAC.BorderColor(CandelBoxBTNColorB.BorderColor );
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M1.GAC.State(false);
                              ///>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>.
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M5.GAC.Color(CandelBoxBTNColorB.DescColor );
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M5.GAC.BackColor(CandelBoxBTNColorB.BackColor  );
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M5.GAC.BorderColor(CandelBoxBTNColorB.BorderColor );
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M5.GAC.State(false);
                              ///>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>.
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M15.GAC.Color(CandelBoxBTNColorB.DescColor );
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M15.GAC.BackColor(CandelBoxBTNColorB.BackColor  );
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M15.GAC.BorderColor(CandelBoxBTNColorB.BorderColor );
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M15.GAC.State(false);
                              ///>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>.
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M30.GAC.Color(CandelBoxBTNColorB.DescColor );
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M30.GAC.BackColor(CandelBoxBTNColorB.BackColor  );
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M30.GAC.BorderColor(CandelBoxBTNColorB.BorderColor );
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M30.GAC.State(false);
                              ///>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>.
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_H1.GAC.Color(CandelBoxBTNColorB.DescColor );
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_H1.GAC.BackColor(CandelBoxBTNColorB.BackColor  );
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_H1.GAC.BorderColor(CandelBoxBTNColorB.BorderColor );
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_H1.GAC.State(false);
                              ///>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>.
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_H4.GAC.Color(CandelBoxBTNColorB.DescColor );
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_H4.GAC.BackColor(CandelBoxBTNColorB.BackColor  );
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_H4.GAC.BorderColor(CandelBoxBTNColorB.BorderColor );
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_H4.GAC.State(false);
                              ///>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>.
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_D1.GAC.Color(CandelBoxBTNColorB.DescColor );
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_D1.GAC.BackColor(CandelBoxBTNColorB.BackColor  );
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_D1.GAC.BorderColor(CandelBoxBTNColorB.BorderColor );
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_D1.GAC.State(false);
                              ///>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>.
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_W1.GAC.Color(CandelBoxBTNColorB.DescColor );
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_W1.GAC.BackColor(CandelBoxBTNColorB.BackColor  );
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_W1.GAC.BorderColor(CandelBoxBTNColorB.BorderColor );
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_W1.GAC.State(false);
                              ///>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>.
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_MN1.GAC.Color(CandelBoxBTNColorB.DescColor );
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_MN1.GAC.BackColor(CandelBoxBTNColorB.BackColor  );
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_MN1.GAC.BorderColor(CandelBoxBTNColorB.BorderColor );
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_MN1.GAC.State(false);
                              ///>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>.
                    }//
          } //
          //OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO//
          //IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
          //OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO//
          if(gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M1.GAC.Name() == Clicked  )
          {         if ( gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M1.GAC.State() ) //
                    {         gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M1.GAC.Color(CandelBoxBTNColorB.DescColorPress );
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M1.GAC.BackColor(CandelBoxBTNColorB.BackColorPress  );
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M1.GAC.BorderColor(CandelBoxBTNColorB.BorderColorPress );
                              //---------------------------------------------------------------------------
                              __Create(true, PERIOD_M1, BoxCount, FillCOM, WidthCOM); //
                    } //
                    else
                    {         gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M1.GAC.Color(CandelBoxBTNColorB.DescColor );
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M1.GAC.BackColor(CandelBoxBTNColorB.BackColor  );
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M1.GAC.BorderColor(CandelBoxBTNColorB.BorderColor );
                              //---------------------------------------------------------------------------
                              __Create(false, PERIOD_M1, BoxCount, FillCOM, WidthCOM); //
                    } //
          } ///
          //OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO//
          //IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
          //OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO//
          if( gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M5.GAC.Name() == Clicked  )
          {         if ( gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M5.GAC.State() ) //
                    {         gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M5.GAC.Color(CandelBoxBTNColorB.DescColorPress );
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M5.GAC.BackColor(CandelBoxBTNColorB.BackColorPress  );
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M5.GAC.BorderColor(CandelBoxBTNColorB.BorderColorPress );
                              //---------------------------------------------------------------------------
                              __Create(true, PERIOD_M5, BoxCount, FillCOM, WidthCOM);//
                    } //
                    else
                    {         gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M5.GAC.Color(CandelBoxBTNColorB.DescColor );
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M5.GAC.BackColor(CandelBoxBTNColorB.BackColor  );
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M5.GAC.BorderColor(CandelBoxBTNColorB.BorderColor );
                              //Sleep(10);
                              //---------------------------------------------------------------------------
                              __Create(false, PERIOD_M5, BoxCount, FillCOM, WidthCOM); //
                    } //
          }
          //OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO//
          //IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
          //OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO//
          if(gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M15.GAC.Name() == Clicked)
          {         if ( gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M15.GAC.State() ) //
                    {         gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M15.GAC.Color(CandelBoxBTNColorB.DescColorPress );
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M15.GAC.BackColor(CandelBoxBTNColorB.BackColorPress  );
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M15.GAC.BorderColor(CandelBoxBTNColorB.BorderColorPress );
                              //---------------------------------------------------------------------------
                              __Create(true, PERIOD_M15, BoxCount, FillCOM, WidthCOM);//
                    } //
                    else
                    {         gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M15.GAC.Color(CandelBoxBTNColorB.DescColor );
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M15.GAC.BackColor(CandelBoxBTNColorB.BackColor  );
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M15.GAC.BorderColor(CandelBoxBTNColorB.BorderColor );
                              //Sleep(10);
                              //---------------------------------------------------------------------------
                              __Create(false, PERIOD_M15, BoxCount, FillCOM, WidthCOM);//
                    }//
          }
          //OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO//
          //IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
          //OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO//
          if( gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M30.GAC.Name() == Clicked)
          {         if ( gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M30.GAC.State() ) //
                    {         gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M30.GAC.Color(CandelBoxBTNColorB.DescColorPress );
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M30.GAC.BackColor(CandelBoxBTNColorB.BackColorPress  );
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M30.GAC.BorderColor(CandelBoxBTNColorB.BorderColorPress );
                              //---------------------------------------------------------------------------
                              __Create(true, PERIOD_M30, BoxCount, FillCOM, WidthCOM); } //
                    else
                    {         gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M30.GAC.Color(CandelBoxBTNColorB.DescColor );
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M30.GAC.BackColor(CandelBoxBTNColorB.BackColor  );
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_M30.GAC.BorderColor(CandelBoxBTNColorB.BorderColor );
                              //Sleep(10);
                              //---------------------------------------------------------------------------
                              __Create(false, PERIOD_M30, BoxCount, FillCOM, WidthCOM); } //
          }
          //OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO//
          //IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
          //OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO//
          if(gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_H1.GAC.Name() == Clicked)
          {         if ( gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_H1.GAC.State()   && gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_H1.GAC.Name() == Clicked ) //
                    {         gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_H1.GAC.Color(CandelBoxBTNColorB.DescColorPress );
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_H1.GAC.BackColor(CandelBoxBTNColorB.BackColorPress  );
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_H1.GAC.BorderColor(CandelBoxBTNColorB.BorderColorPress );
                              //---------------------------------------------------------------------------
                              __Create(true, PERIOD_H1, BoxCount, FillCOM, WidthCOM); //
                    } //
                    else
                    {         gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_H1.GAC.Color(CandelBoxBTNColorB.DescColor );
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_H1.GAC.BackColor(CandelBoxBTNColorB.BackColor  );
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_H1.GAC.BorderColor(CandelBoxBTNColorB.BorderColor );
                              //Sleep(10);
                              //---------------------------------------------------------------------------
                              __Create(false, PERIOD_H1, BoxCount, FillCOM, WidthCOM);//
                    } //
          }
          //OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO//
          //IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
          //OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO//
          if(gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_H4.GAC.Name() == Clicked)
          {         if ( gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_H4.GAC.State() ) //
                    {         gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_H4.GAC.Color(CandelBoxBTNColorB.DescColorPress );
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_H4.GAC.BackColor(CandelBoxBTNColorB.BackColorPress  );
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_H4.GAC.BorderColor(CandelBoxBTNColorB.BorderColorPress );
                              //---------------------------------------------------------------------------
                              __Create(true, PERIOD_H4, BoxCount, FillCOM, WidthCOM); } //
                    else
                    {         gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_H4.GAC.Color(CandelBoxBTNColorB.DescColor );
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_H4.GAC.BackColor(CandelBoxBTNColorB.BackColor  );
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_H4.GAC.BorderColor(CandelBoxBTNColorB.BorderColor );
                              //Sleep(10);
                              //---------------------------------------------------------------------------
                              __Create(false, PERIOD_H4, BoxCount, FillCOM, WidthCOM);
                              //
                    }
                    //
          }
          //OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO//
          //IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
          //OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO//
          if(gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_D1.GAC.Name() == Clicked)
          {         if ( gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_D1.GAC.State() ) //
                    {         gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_D1.GAC.Color(CandelBoxBTNColorB.DescColorPress );
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_D1.GAC.BackColor(CandelBoxBTNColorB.BackColorPress  );
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_D1.GAC.BorderColor(CandelBoxBTNColorB.BorderColorPress );
                              //---------------------------------------------------------------------------
                              __Create(true, PERIOD_D1, BoxCount, FillCOM, WidthCOM);//
                    } //
                    else
                    {         gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_D1.GAC.Color(CandelBoxBTNColorB.DescColor );
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_D1.GAC.BackColor(CandelBoxBTNColorB.BackColor  );
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_D1.GAC.BorderColor(CandelBoxBTNColorB.BorderColor );
                              //Sleep(10);
                              //---------------------------------------------------------------------------
                              __Create(false, PERIOD_D1, BoxCount, FillCOM, WidthCOM);//
                    }//
          }
          //OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO//
          //IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
          //OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO//
          if(gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_W1.GAC.Name() == Clicked)
          {         if ( gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_W1.GAC.State() ) //
                    {         gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_W1.GAC.Color(CandelBoxBTNColorB.DescColorPress );
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_W1.GAC.BackColor(CandelBoxBTNColorB.BackColorPress  );
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_W1.GAC.BorderColor(CandelBoxBTNColorB.BorderColorPress );
                              //---------------------------------------------------------------------------
                              __Create(true, PERIOD_W1, BoxCount, FillCOM, WidthCOM); } //
                    else if(!gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_W1.GAC.State() )
                    {         gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_W1.GAC.Color(CandelBoxBTNColorB.DescColor );
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_W1.GAC.BackColor(CandelBoxBTNColorB.BackColor  );
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_W1.GAC.BorderColor(CandelBoxBTNColorB.BorderColor );
                              //Sleep(10);
                              //---------------------------------------------------------------------------
                              __Create(false, PERIOD_W1, BoxCount, FillCOM, WidthCOM);//
                    }//
          }
          //OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO//
          //IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
          //OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO//
          if(gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_MN1.GAC.Name() == Clicked)
          {         if ( gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_MN1.GAC.State() ) //
                    {         gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_MN1.GAC.Color(CandelBoxBTNColorB.DescColorPress );
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_MN1.GAC.BackColor(CandelBoxBTNColorB.BackColorPress  );
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_MN1.GAC.BorderColor(CandelBoxBTNColorB.BorderColorPress );
                              //---------------------------------------------------------------------------
                              __Create(true, PERIOD_MN1, BoxCount, FillCOM, WidthCOM);//
                    } //
                    else
                    {         gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_MN1.GAC.Color(CandelBoxBTNColorB.DescColor );
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_MN1.GAC.BackColor(CandelBoxBTNColorB.BackColor  );
                              gCandelBox_Pad.BTN_CandelBoxKeyPERIOD_MN1.GAC.BorderColor(CandelBoxBTNColorB.BorderColor );
                              //Sleep(10);
                              //---------------------------------------------------------------------------
                              __Create( false, PERIOD_MN1, BoxCount,  FillCOM, WidthCOM); //
                    }//
          }
          //OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO//
          //IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
          //OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO//
          if ( gCandelBox_Pad.BTN_CandelBoxUp.GAC.State()   && gCandelBox_Pad.BTN_CandelBoxUp.GAC.Name() == Clicked ) //
          {         //      gCandelBox_Pad.BTN_CandelBoxUp.GAC.Color(CandelBoxBTNColorB.DescColorPress );
                    //          gCandelBox_Pad.BTN_CandelBoxUp.GAC.BackColor(CandelBoxBTNColorB.BackColorPress  );
                    //          gCandelBox_Pad.BTN_CandelBoxUp.GAC.BorderColor(CandelBoxBTNColorB.BorderColorPress ); //Sleep(1000);; //
                    //          gCandelBox_Pad.BTN_CandelBoxUp.GAC.Color(CandelBoxBTNColorB.DescColor );
                    //          gCandelBox_Pad.BTN_CandelBoxUp.GAC.BackColor(CandelBoxBTNColorB.BackColor  );
                    //          gCandelBox_Pad.BTN_CandelBoxUp.GAC.BorderColor(CandelBoxBTNColorB.BorderColor ); //
                    //
                    //---------------------------------------------------------------------------
                    //CounterTextBoxCount++;
                    //CounterValueBoxCount++;
                    ;
                    //if(CounterValueBoxCount > 30 &&  (ArraySize(Candels_Box.DescriptionBox) + 1) > 31)CounterValueBoxCount = 1; ///CounterValueBoxCount < 0//>>expression is always false///ist uint type
                    //if(CounterValueBoxCount == 0 && (ArraySize(Candels_Box.DescriptionBox) + 1) == 1)CounterValueBoxCount = 1;
                    if(CounterValueBoxCount > 29 )CounterValueBoxCount = 0;
                    if(CounterValueBoxCount < 30)
                              gCandelBox_Pad.LBL_CandelBoxCount.GAC.Description((string)++CounterValueBoxCount);//
                    // Sleep(10); // gCandelBox_Pad.BTN_CandelBoxUp.GAC.State(false);//
          } //
          if ( !gCandelBox_Pad.BTN_CandelBoxUp.GAC.State()   && gCandelBox_Pad.BTN_CandelBoxUp.GAC.Name() == Clicked ) //
          {         //gCandelBox_Pad.BTN_CandelBoxUp.GAC.Color(CandelBoxBTNColorB.DescColor );
                    //       gCandelBox_Pad.BTN_CandelBoxUp.GAC.BackColor(CandelBoxBTNColorB.BackColor  );
                    //       gCandelBox_Pad.BTN_CandelBoxUp.GAC.BorderColor(CandelBoxBTNColorB.BorderColor ); //Sleep(1000);; //
                    //       gCandelBox_Pad.BTN_CandelBoxUp.GAC.Color(CandelBoxBTNColorB.DescColorPress );
                    //       gCandelBox_Pad.BTN_CandelBoxUp.GAC.BackColor(CandelBoxBTNColorB.BackColorPress  );
                    //       gCandelBox_Pad.BTN_CandelBoxUp.GAC.BorderColor(CandelBoxBTNColorB.BorderColorPress );
                    ///////////
                    if(CounterValueBoxCount > 29 )CounterValueBoxCount = 0;
                    if(CounterValueBoxCount < 30)
                              gCandelBox_Pad.LBL_CandelBoxCount.GAC.Description((string)++CounterValueBoxCount);//
          }
          //OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO//
          //IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
          //OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO//
          if(gCandelBox_Pad.BTN_CandelBoxDown.GAC.State()  && gCandelBox_Pad.BTN_CandelBoxDown.GAC.Name() == Clicked  )
          {         //gCandelBox_Pad.BTN_CandelBoxDown.GAC.Color(CandelBoxBTNColorB.DescColorPress );
                    //        gCandelBox_Pad.BTN_CandelBoxDown.GAC.BackColor(CandelBoxBTNColorB.BackColorPress  );
                    //        gCandelBox_Pad.BTN_CandelBoxDown.GAC.BorderColor(CandelBoxBTNColorB.BorderColorPress ); //Sleep(1000);; //
                    //        gCandelBox_Pad.BTN_CandelBoxDown.GAC.Color(CandelBoxBTNColorB.DescColor );
                    //        gCandelBox_Pad.BTN_CandelBoxDown.GAC.BackColor(CandelBoxBTNColorB.BackColor  );
                    //        gCandelBox_Pad.BTN_CandelBoxDown.GAC.BorderColor(CandelBoxBTNColorB.BorderColor ); //
                    ////////////
                    //Sleep(10);
                    //if(CounterValueBoxCount > 30 &&  (ArraySize(Candels_Box.DescriptionBox) + 1) > 31)CounterValueBoxCount = 1;
                    //if(CounterValueBoxCount == 0 && (ArraySize(Candels_Box.DescriptionBox) + 1) == 1)CounterValueBoxCount = 1;
                    //---------------------------------------------------------------------------
                    //&& (ArraySize(Candels_Box.DescriptionBox) + 1) > 2)
                    if(CounterValueBoxCount > 29 )CounterValueBoxCount = 1;
                    if(CounterValueBoxCount == 1 )CounterValueBoxCount = 31;
                    if( CounterValueBoxCount >= 0 || CounterValueBoxCount < 30)
                              gCandelBox_Pad.LBL_CandelBoxCount.GAC.Description((string)--CounterValueBoxCount);//
                    /// gCandelBox_Pad.BTN_CandelBoxDown.GAC.State(false); //
          }
          if(!gCandelBox_Pad.BTN_CandelBoxDown.GAC.State()  && gCandelBox_Pad.BTN_CandelBoxDown.GAC.Name() == Clicked  )
          {         //gCandelBox_Pad.BTN_CandelBoxDown.GAC.Color(CandelBoxBTNColorB.DescColor );
                    //        gCandelBox_Pad.BTN_CandelBoxDown.GAC.BackColor(CandelBoxBTNColorB.BackColor  );
                    //        gCandelBox_Pad.BTN_CandelBoxDown.GAC.BorderColor(CandelBoxBTNColorB.BorderColor ); //Sleep(1000);; //
                    //        gCandelBox_Pad.BTN_CandelBoxDown.GAC.Color(CandelBoxBTNColorB.DescColorPress );
                    //        gCandelBox_Pad.BTN_CandelBoxDown.GAC.BackColor(CandelBoxBTNColorB.BackColorPress  );
                    //        gCandelBox_Pad.BTN_CandelBoxDown.GAC.BorderColor(CandelBoxBTNColorB.BorderColorPress );
                    ///////////
                    if(CounterValueBoxCount > 29 )CounterValueBoxCount = 1;
                    if(CounterValueBoxCount == 1 )CounterValueBoxCount = 30;
                    if( CounterValueBoxCount == 0 || CounterValueBoxCount < 31)//&& (ArraySize(Candels_Box.DescriptionBox) + 1) > 2)
                              gCandelBox_Pad.LBL_CandelBoxCount.GAC.Description((string)--CounterValueBoxCount);//
                    //
          }
          //OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO//
          //IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
          //OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO//
          if(gCandelBox_Pad.BTN_CandelBoxFillResetCount.GAC.State()  && gCandelBox_Pad.BTN_CandelBoxFillResetCount.GAC.Name() == Clicked  )
          {         //gCandelBox_Pad.BTN_CandelBoxDown.GAC.Color(CandelBoxBTNColorB.DescColorPress );
                    //        gCandelBox_Pad.BTN_CandelBoxDown.GAC.BackColor(CandelBoxBTNColorB.BackColorPress  );
                    //        gCandelBox_Pad.BTN_CandelBoxDown.GAC.BorderColor(CandelBoxBTNColorB.BorderColorPress ); //Sleep(1000);; //
                    //        gCandelBox_Pad.BTN_CandelBoxDown.GAC.Color(CandelBoxBTNColorB.DescColor );
                    //        gCandelBox_Pad.BTN_CandelBoxDown.GAC.BackColor(CandelBoxBTNColorB.BackColor  );
                    //        gCandelBox_Pad.BTN_CandelBoxDown.GAC.BorderColor(CandelBoxBTNColorB.BorderColor ); //
                    ////////////
                    gCandelBox_Pad.BTN_CandelBoxFillResetCount.GAC.State(false); CounterValueBoxCount = 5;
                    gCandelBox_Pad.LBL_CandelBoxCount.GAC.Description((string)CounterValueBoxCount);// CounterValueBoxCount = 5;
                    //---------------------------------------------------------------------------
          }//
          //OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO//
          //IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
          //OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO//
}
//+------------------------------------------------------------------+
//|             Class SoundController     BEGIN                      |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
