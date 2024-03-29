//+------------------------------------------------------------------+
//|                                                         Edit.mqh |
//|                                                    A pourya 2021 |
//|                                                @prymhdvgmail.com |
//+------------------------------------------------------------------+
#property copyright "A pourya 2021"
#property link      "@prymhdvgmail.com"
#property version   "1.00"
#property strict
////================================================================================================================================================
#define readonlyDEF false
#define alignDEF    ALIGN_CENTER
#define EditDEF_tooltip "tooltip_EditDEF"
//--------------------------------------------
//{
//EditX.GDS.Set_Action_2(WhichMode, IsKey);
//EditX.GDS.Set_Desc_4("BTN_ButtonY", "Time: " , "Trebuchet MS", 7);
//EditX.GDS.SetSelf2(alignDEF,readonlyDEF);
//EditX.GDS.Set_Location_5(0 + MoveX, MoveY + 137, 60, 15, CORNER_LEFT_UPPER);
//EditX.GDS.Set_Color_3(clr_5,bgclr_6,border_color_7);
//EditX.GDS.Set_Common_6(false, 60, false, false, false, EditDEF_tooltip+"");
//EditX.GDS.Set_Chart_6();
//EditX.Action(EditX);//
//}
///[onPad] line 213 ///
////---Generic gEditX---//
//{
//          gEditX.GDS.Set_Action_2(WhichMode, IsKey);
//          gEditX.GDS.Set_Desc_4("gEditX", "gEditX: " , "Trebuchet MS", 7);
//          gEditX.GDS.SetSelf2(alignDEF,readonlyDEF);
//          gEditX.GDS.Set_Location_5(0 + MoveX, MoveY + 137, 60, 15, CORNER_LEFT_UPPER);
//          gEditX.GDS.Set_Color_3(clr_5,bgclr_6,border_color_7);
//          gEditX.GDS.Set_Common_6(false, 60, false, false, false, EditDEF_tooltip+"");
//          gEditX.GDS.Set_Chart_6();
//          gEditX.Action(gEditX);//
//          //0// BTN_RESET.Create(Is_Create, Is_Move, __FUNCSIG__, "BTN_RESET", "ó",
//          //0// (int)(283.4), (int)(176), PANEL_BUTTON2_WIDTH / 2 - 10,   PANEL_BUTTON2_HEIGHT + 3 - 5, CORNER_RIGHT_LOWER, ANCHOR_CENTER,
//          //0// false, clrViolet, clrViolet, clrWhite, 0, 10, "Wingdings");
//}
///---Progressing
///--
///-

//================================================================================================================================================
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\.Items\Texts\Sg_EDIT.mqh>;
//+------------------------------------------------------------------+
//|             Class SoundController     BEGIN                      |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(MQL4)\Include\Controls\Edit.mqh>;
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(MQL4)\Include\Controls\SpinEdit.mqh>;
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(MQL4)\Include\ChartObjects\ChartObjectsTxtControls.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\BasicChartObj\__COBFA__.mqh>
//  C_Objects             OBJ;
class Cg_TextsEdit_Demo: public __COBFA__<S_EDIT>
{         CEdit                 TextCEdit;
          CSpinEdit             TextSpinEdit;

};
class Cg_TextsEdit: public __COBFA__<S_EDIT>
{         //===================================================================
private:
          string                m_name;
          int                   m_index;
          //===================================================================
public:
          void                  Cg_TextsEdit() {};
          void                  ~Cg_TextsEdit() {};
          //===================================================================
          CChartObjectEdit      GAC;   ///---API  Invoke---///
          S_EDIT                GDS;   ///---Mine Invoke---///

          void                  SetupSignal() {/*GDS.Setup();*/}
          //===================================================================
          bool                  GAC_CreateCall(long ChartID_, string Name_, int SubWindow_) {return GAC.Create(ChartID_, Name_, SubWindow_, 0, 0, 0, 0);}
          bool                  Create(int                  mode            = MODE_CREATE,
                                       bool                 IsKey          = false,
                                       string               oEditName       = "GAC",
                                       string               Description     = "Enter UserName:",
                                       int                  XCordinate      = 600,
                                       int                  YCordinate      = 14,
                                       int                  XSize           = 100,
                                       int                  YSize           = 14,
                                       ENUM_BASE_CORNER     Corner          = CORNER_RIGHT_LOWER,
                                       ENUM_ANCHOR_POINT    Anchor          = ANCHOR_UPPER,
                                       bool                 Background      = false,
                                       color                BackColor       = C'36, 52, 69',
                                       color                BorderColor     = clrGray,
                                       color                DescColorIN     = clrYellow,
                                       ENUM_LINE_STYLE      Style           = 1,
                                       int                  Width           = 1,
                                       double               Angle           = 0,
                                       ENUM_ALIGN_MODE      TextAlign       = ALIGN_CENTER,
                                       int                  FontSize        = 7,
                                       string               Font            = "Arial");
          //===================================================================
          bool SetAttribe();
          bool                  Move2(const long   chart_ID = 0, // chart's ID
                                      const string name = "Edit", // object name
                                      const int    x = 0,       // X coordinate
                                      const int    y = 0);       // Y coordinate
          //===================================================================
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Cg_TextsEdit::Create(int                  mode            = MODE_CREATE,
                          bool                 IsKey          = false,
                          string               oEditName       = "GAC",
                          string               Description     = "Enter UserName:",
                          int                  XCordinate      = 600,
                          int                  YCordinate      = 14,
                          int                  XSize           = 100,
                          int                  YSize           = 14,
                          ENUM_BASE_CORNER     Corner          = CORNER_RIGHT_LOWER,
                          ENUM_ANCHOR_POINT    Anchor          = ANCHOR_UPPER,
                          bool                 Background      = false,
                          color                BackColor       = C'36, 52, 69',
                          color                BorderColor     = clrGray,
                          color                DescColor     = clrYellow,
                          ENUM_LINE_STYLE      Style           = 1,
                          int                  Width           = 1,
                          double               Angle           = 0,
                          ENUM_ALIGN_MODE      TextAlign       = ALIGN_CENTER,
                          int                  FontSize        = 7,
                          string               Font            = "Arial")// GAC
{         //
          //return Create(MODE_CREATE, true);
          if(mode == MODE_CREATE && !IsKey && ObjectFind(ChartData_ChartInfo.ID, oEditName) >= 0)  { return ObjectDelete(ChartData_ChartInfo.ID, oEditName);}
          if(mode == MODE_CREATE &&  IsKey && ObjectFind(ChartData_ChartInfo.ID, oEditName) >= 0 ) { ObjectSetInteger(0, oEditName, OBJPROP_XDISTANCE, XCordinate); return ObjectSetInteger(0, oEditName, OBJPROP_YDISTANCE, YCordinate);  } ////Label_.X_Distance(XCordinate);//Label_.Y_Distance(YCordinate); //
          if(mode == MODE_CREATE &&  IsKey && ObjectFind(ChartData_ChartInfo.ID, oEditName) < 0)   { return GAC.Create(ChartData_ChartInfo.ID, oEditName, ChartData_ChartInfo.SubWindow, XCordinate, YCordinate, XSize, YSize);}
          return false;//
}

//+------------------------------------------------------------------+
//| Move Edit object                                                 |
//+------------------------------------------------------------------+
bool Cg_TextsEdit::Move2(const long   chart_ID = 0, // chart's ID
                         const string name = "Edit", // object name
                         const int    x = 0,       // X coordinate
                         const int    y = 0)       // Y coordinate
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TextEdit Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          if(Capitan_ResetLastErrorX)//-- reset the error value
                    ResetLastError();//--
          if(ObjectFind(chart_ID, name) >= 0)
          {         if(!ObjectSetInteger(chart_ID, name, OBJPROP_XDISTANCE, x))
                    {         Print(__FUNCTION__,
                                    ": failed to move X coordinate of the object! Error code = ", _LastError);
                              return(false);//
                    }
                    if(!ObjectSetInteger(chart_ID, name, OBJPROP_YDISTANCE, y))
                    {         Print(__FUNCTION__,
                                    ": failed to move Y coordinate of the object! Error code = ", _LastError);
                              return(false); //
                    }//
          }//--
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TextEdit Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return(true); //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Cg_TextsEdit::SetAttribe()
{         if(ObjectFind(ChartData_ChartInfo.ID, GDS.NAME_A_01) >= 0)
          {         //
                    //
                    GAC.Description(GDS.TEXT_B_01);                //ObjectSetString( 0, GDS.NAME_A_01, OBJPROP_TEXT,             Description);
                    GAC.Font(GDS.FONT_B_02);                       //ObjectSetString( 0, GDS.NAME_A_01, OBJPROP_FONT,             Font);
                    GAC.FontSize(GDS.FONTSIZE_B_03);               //ObjectSetInteger(0, GDS.NAME_A_01, OBJPROP_FONTSIZE,         FontSize);
                    //
                    GAC.Color(GDS.COLOR_C_00);                     //ObjectSetInteger(0, GDS.NAME_A_01, OBJPROP_COLOR,            DescColorIN);
                    GAC.BackColor(GDS.COLOR_BackGround_C_01);               //ObjectSetInteger(0, GDS.NAME_A_01, OBJPROP_BGCOLOR,          BackColorIN);
                    GAC.BorderColor(GDS.COLOR_Border_C_02);        //ObjectSetInteger(0, GDS.NAME_A_01, OBJPROP_BORDER_COLOR,     BorderColorIN);
                    //
                    GAC.X_Distance(GDS.XDISTANCE_L_02);            //ObjectSetInteger(0, GDS.NAME_A_01, OBJPROP_XDISTANCE,        XCordinate);
                    GAC.Y_Distance(GDS.YDISTANCE_L_03);            //ObjectSetInteger(0, GDS.NAME_A_01, OBJPROP_YDISTANCE,        YCordinate);
                    GAC.X_Size(GDS.XSIZE_L_04);                   //ObjectSetInteger(0, GDS.NAME_A_01, OBJPROP_XSIZE,            XSize);
                    GAC.Y_Size(GDS.YSIZE_L_05);                   //ObjectSetInteger(0, GDS.NAME_A_01, OBJPROP_YSIZE,            YSize);
                    GAC.Corner(GDS.CORNER_L_06);                  //ObjectSetInteger(0, GDS.NAME_A_01, OBJPROP_CORNER,           Corner);
                    //
                    GAC.TextAlign(GDS.ALIGN_13);                //ObjectSetInteger(0, GDS.NAME_A_01, OBJPROP_ALIGN,            ALIGN_13);
                    GAC.ReadOnly(GDS.READONLY_14);              //ObjectSetInteger(0, GDS.NAME_A_01, OBJPROP_READONLY,            READONLY_14);
                    //
                    GAC.Background(GDS.BACK_G_00);                //ObjectSetInteger(0, GDS.NAME_A_01, OBJPROP_BACK,             Background);        //CORNER_RIGHT_UPPER
                    GAC.Z_Order(GDS.ZORDER_G_00);                 //ObjectSetInteger(0, GDS.NAME_A_01, OBJPROP_ZORDER,           11);//UseLabel.GAC(false);
                    GAC.Hidden(GDS.HIDDEN_G_00);                  //ObjectSetInteger(0, GDS.NAME_A_01, OBJPROP_HIDDEN,           true);
                    GAC.Selected(GDS.SELECTED_G_00);              //ObjectSetInteger(0, GDS.NAME_A_01, OBJPROP_SELECTED,         false);
                    GAC.Selectable(GDS.SELECTABLE_G_00);          //ObjectSetInteger(0, GDS.NAME_A_01, OBJPROP_SELECTABLE,       false);
                    GAC.Tooltip(GDS.TOOLTIP_G_00);                //ObjectSetString(0,  GDS.NAME_A_01, OBJPROP_TOOLTIP,          sRectLabel.TOOLTIP_G_00);
                    //==================================================================
          } //
          return true;//
}
//+------------------------------------------------------------------+
//|             Class SoundController     BEGIN                      |
//+------------------------------------------------------------------+
