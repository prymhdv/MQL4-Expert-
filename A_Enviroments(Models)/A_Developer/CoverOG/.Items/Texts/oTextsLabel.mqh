//+------------------------------------------------------------------+
//|                            Cg_Textsdata.mqh                     |
//+------------------------------------------------------------------+
//||   ||||||||||               Cg_Textsdata.mqh                   ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\BasicChartObj\_COBF_.mqh>
////================================================================================================================================================
//--------------------------------------------------
#define LabelDEF_NAME          "LabelDEF_NAME"
#define LabelDEF_TEXT          "LabelDEF_TEXT"
#define LabelDEF_FONT          "Trebuchet MS"
#define LabelDEF_FONTSIZE      7
//--------------------------------------------------
#define LabelDEF_XDISTANCE      200
#define LabelDEF_YDISTANCE      200
#define LabelDEF_ANGLE          0
#define LabelDEF_CORNER         CORNER_LEFT_UPPER
#define LabelDEF_ANCHOR_POINT   ANCHOR_CENTER
//--------------------------------------------------
#define LabelDEF_COLOR    clrRed
//--------------------------------------------------
#define LabelDEF_tooltip "tooltip_"
//--------------------------------------------------
///---Progressing non-Generic
///--
///-
////--- nonGeneric LBL_X ---///
//{
// LabelX.GDS.Set_Action_2(WhichMode, IsKey);
// LabelX.GDS.Set_Desc_4(LabelDEF_NAME,LabelDEF_TEXT,LabelDEF_FONT,LabelDEF_FONTSIZE);
// LabelX.GDS.Set_Color_1(LabelDEF_COLOR);
// LabelX.GDS.Set_Location_5(LabelDEF_XDISTANCE,LabelDEF_YDISTANCE, LabelDEF_ANGLE, LabelDEF_CORNER, LabelDEF_ANCHOR_POINT);
// LabelX.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip+"");
// LabelX.GDS.Set_Chart_6();
// LabelX.Action(LabelX);//
//0// FlowPad.LBL_C2.Create(Is_Create,  Is_Move, "FlowPad.LBL_C2", "l",
//0// (int)(429) +  independX + FixPadFlowX,      (int)(203.2) - 1 + FixPadFlowY + independY,
//0// CORNER_LEFT_UPPER, ANCHOR_CENTER, false, clrDodgerBlue, 0, 18, "Webdings");
//}
///---Progressing Generic
///--
///-
////--- Generic gFlowPad.LBL_Pad_AutoCharter_PointMove ---// gLabelX.GDS
//{
//          gFlowPad.LBL_Pad_AutoCharter_PointMove.GDS.Set_Action_2(WhichMode, IsKey);
//          gFlowPad.LBL_Pad_AutoCharter_PointMove.GDS.Set_Desc_4("gFlowPad.LBL_Pad_AutoCharter_PointMove", "n", "Webdings", 14);
//          gFlowPad.LBL_Pad_AutoCharter_PointMove.GDS.Set_Color_1(clrWhite);
//          gFlowPad.LBL_Pad_AutoCharter_PointMove.GDS.Set_Location_5(XCordinate - 40 + FixPadChartToolsX, YCordinate + YSize  + 100 + FixPadChartToolsY, 0, Corner, Anchor);
//          gFlowPad.LBL_Pad_AutoCharter_PointMove.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "gFlowPad.LBL_Pad_AutoCharter_PointMove");
//          gFlowPad.LBL_Pad_AutoCharter_PointMove.GDS.Set_Chart_6();
//          gFlowPad.LBL_Pad_AutoCharter_PointMove.Action(gFlowPad.LBL_Pad_AutoCharter_PointMove);//
//          //0// FlowPad.LBL_Pad_AutoCharter_PointMove.Create(Is_Create,  Is_Move, "FlowPad.LBL_Pad_AutoCharter_PointMove", "n",
//          //0// XCordinate - 40 + FixPadChartToolsX, YCordinate + YSize  + 100 + FixPadChartToolsY, Corner, Anchor, Backgrand, clrWhite, 0, 14, "Webdings");
//}
///---Progressing
///--
///-
////================================================================================================================================================
//+------------------------------------------------------------------+
//|             Class SoundController     BEGIN                      |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\.Items\Texts\Sg_LABEL.mqh>;
//+------------------------------------------------------------------+
//|             Class SoundController     BEGIN                      |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(MQL4)\Include\ChartObjects\ChartObjectsTxtControls.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(MQL4)\Include\Controls\Label.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\BasicChartObj\__COBFA__.mqh>
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
//C_Objects             OBJ;
class Cg_TextsLabel_Demo: public __COBFA__<Sg_LABEL>
{
//===================================================================
private:        CChartObjectLabel     CLabelprivate;
protected:      CChartObjectLabel     CLabelprotected;
public:         CChartObjectLabel     CLabelpublic;//
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class Cg_TextsLabel: public __COBFA__<Sg_LABEL>
{         string                m_name;
          int                   m_index;
          //template<typename T> bool     C_ObjectFrame::Action(T &sOBJ);   //--Drive from Parent
public:

          void                  Cg_TextsLabel() {};
          void                  ~Cg_TextsLabel() {if(Capitan_DeinitErrorCatching)________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TextLabel Error",  __LINE__, __FUNCTION__); }
          Sg_LABEL              GDS;
          CChartObjectLabel     GAC;
          //void                Set_upSignal(){}
          //===================================================================
          bool                  GAC_CreateCall(long ChartID_, string Name_, int SubWindow_) {return GAC.Create(ChartID_, Name_, SubWindow_, 0, 0);}
          bool                  Create(int WhichMode, bool IsKey, string name) {return false;}
          //--- Solid Act
          bool                  ActionSelf(int                 mode            = MODE_CREATE,
                                           bool                IsKey          = false,
                                           string              Name            = "Name",
                                           string              Description     = "CLabelDescription",
                                           int                 XCordinate      = 10,
                                           int                 YCordinate      = 10,
                                           ENUM_BASE_CORNER    Corner          = CORNER_RIGHT_LOWER,
                                           ENUM_ANCHOR_POINT   Anchor          = ANCHOR_UPPER,
                                           color               DescColorIN     = clrYellow,
                                           double              Angle           = 0,
                                           int                 FontSize        = 7,
                                           string              Font            = "Arial",
                                           bool                Background      = false,
                                           long                zorder          = 10,
                                           int                 LineCOM         = 0,
                                           string              FuncCome        = "None"); // Label


//===================================================================
          bool                  MoveAdd(const string Name = "UseButtonX", const int XCordinate = 10, const int YCordinate = 10);
          void                  CLabelColor(const string Name = "Name", color Color = clrRed);  // Label
          void                  Set_Label(int WhichMode = MODE_CREATE, bool IsKey = false);
//===================================================================
          //template<typename GraphicalObject>
          //bool                                  Action(GraphicalObject &GO);
          //template<typename GraphicalObject>
          //bool                                  Mode_OBJ(GraphicalObject &GO);
//===================================================================
          void          Create_Solo(  bool IsDelete,
                                      const long              chart_ID = 0,             // chart's ID
                                      const string            name = "Label",           // label name
                                      const int               sub_window = 0,           // subwindow index
                                      const int               x = 0,                    // X coordinate
                                      const int               y = 0,                    // Y coordinate
                                      const ENUM_BASE_CORNER  corner = CORNER_LEFT_UPPER, // chart corner for anchoring
                                      const string            text = "Label",           // text
                                      const string            font = "Arial",           // font
                                      const int               font_size = 10,           // font size
                                      const color             clr = clrRed,             // color
                                      const double            angle = 0.0,              // text slope
                                      const ENUM_ANCHOR_POINT anchor = ANCHOR_LEFT_UPPER, // anchor type
                                      const bool              back = false,             // in the background
                                      const bool              selection = false,        // highlight to move
                                      const bool              hidden = true,            // hidden in the object list
                                      const long              z_order = 0);//
          //
          void          Create_Solo_Update(string name = "Label", string desc = "desc");
          void         GreateGDS(int wk,
                                 bool b,
                                 bool IsDelete,
                                 const long              chart_ID = 0,             // chart's ID
                                 const string            name = "Label",           // label name
                                 const int               sub_window = 0,           // subwindow index
                                 const int               x = 0,                    // X coordinate
                                 const int               y = 0,                    // Y coordinate
                                 const ENUM_BASE_CORNER  corner = CORNER_LEFT_UPPER, // chart corner for anchoring
                                 const string            text = "Label",           // text
                                 const string            font = "Arial",           // font
                                 const int               font_size = 10,           // font size
                                 const color             clr = clrRed,             // color
                                 const double            angle = 0.0,              // text slope
                                 const ENUM_ANCHOR_POINT anchor = ANCHOR_LEFT_UPPER  // anchor type
                                )
          {         ////--- nonGeneric LBL_X ---///
                    {         LabelX.GDS.Set_Action_2(wk, b);
                              LabelX.GDS.Set_Desc_4(name, text, font, font_size);
                              LabelX.GDS.Set_Color_1(clr);
                              LabelX.GDS.Set_Location_5(x, y, angle, corner, anchor);
                              LabelX.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "");
                              LabelX.GDS.Set_Chart_6();
                              LabelX.Action(LabelX);//
                    }//
          }


};
//+------------------------------------------------------------------+
//|                                                                  |//--- Solid Act
//+------------------------------------------------------------------+
bool Cg_TextsLabel::ActionSelf(int                 mode            = MODE_CREATE,
                               bool                IsKey          = false,
                               string              Name            = "Name",
                               string              Description     = "CLabelDescription",
                               int                 X               = 10,
                               int                 Y               = 10,
                               ENUM_BASE_CORNER    Corner          = CORNER_RIGHT_LOWER,
                               ENUM_ANCHOR_POINT   Anchor          = ANCHOR_UPPER,
                               color               ColorDesc       = clrYellow,
                               double              Angle           = 0,
                               int                 FontSize        = 7,
                               string              Font            = "Arial",
                               bool                Background      = false,
                               long                zorder          = 10,
                               int                 LineCOM         = 0,
                               string              FuncCome        = "None") // Label
{
//===============================================================================================================================================
          bool result = false;
          //string            name        = "CLabel" + text;
          int               sub_window  = 0;
          bool              selection   = false;
          bool              selected    = false;
          bool              hidden      = true;
          long              z_order     = 0;
          string            tooltip     = "\n";
          bool              tester      = true;
//===================================================================__LINE__295 as drived no need
          //--- Structure sObject     //--- Proxy Object    //---Coming Fields
          GDS.NAME_A_01         = /*Frame.*/NAME          = Name;
          GDS.TEXT_B_01         = /*Frame.*/TEXT          = Description;
          GDS.FONT_B_02         = /*Frame.*/FONT          = Font;
          GDS.FONTSIZE_B_03     = /*Frame.*/FONTSIZE      = FontSize;
//===================================================================
          GDS.COLOR_C_00        = /*Frame.*/COLOR         = ColorDesc;
//===================================================================
          GDS.XDISTANCE_L_02    = /*Frame.*/XDISTANCE     = X;
          GDS.YDISTANCE_L_03    = /*Frame.*/YDISTANCE     = Y;
          GDS.ANGLE_8           = /*Frame.*/ANGLE         = Angle;
          GDS.CORNER_L_06       = /*Frame.*/CORNER        = Corner;
          GDS.ANCHOR_POINT_9    = /*Frame.*/ANCHOR_POINT  = Anchor;
//===================================================================
          GDS.BACK_G_00         = /*Frame.*/BACK          = Background;
          GDS.ZORDER_G_00       = /*Frame.*/ZORDER        = zorder;
          GDS.HIDDEN_G_00       = /*Frame.*/HIDDEN        = hidden;
          GDS.SELECTED_G_00     = /*Frame.*/SELECTED      = selected;
          GDS.SELECTABLE_G_00   = /*Frame.*/SELECTABLE    = selection;
          GDS.TOOLTIP_G_00      = /*Frame.*/TOOLTIP       = tooltip;
//===================================================================
          GDS.TIMEFRAMES_O_00   = /*Frame.*/TIMEFRAMES    = Period();
          GDS.CHART_O_00        = /*Frame.*/CHART        = ChartData_ChartInfo.ID;
          GDS.TYPE_O_00         = /*Frame.*/TYPE         = OBJ_LABEL;
          GDS.SUBWINDOW_O_00    = /*Frame.*/SUBWINDOW    = sub_window;
          GDS.SYMBOL_O_00       = /*Frame.*/SYMBOL        = Symbol();
          GDS.CREATETIME_O_00   = /*Frame.*/CREATETIME    = TimeLocal();
//===============================================================================================================================================
          if(mode == MODE_MOVE && IsKey && ObjectFind(ChartData_ChartInfo.ID, Name) >= 0 )   { ObjectSetInteger(0, Name, OBJPROP_XDISTANCE, X); return ObjectSetInteger(0, Name, OBJPROP_YDISTANCE, Y);} //GAC.X_Distance(XCordinate);//GAC.Y_Distance(YCordinate); //
//===============================================================================================================================================
          //cLabel.Create()
          //cLabel.OnMouseEvent(10, 0, MOUSE_EMPTY);
          //
          //enum ENUM_MOUSE_FLAGS//--- mouse flags
          //{         MOUSE_INVALID_FLAGS          = -1,                             // no buttons state
          //          MOUSE_EMPTY                  = 0,                              // buttons are not pressed
          //          MOUSE_LEFT                   = 1,                              // left button pressed
          //          MOUSE_RIGHT                  = 2                               // right button pressed
          //};
          bool IsObj            = false;
          bool IsSet_            = true;
          //---  C_Proxy Proxy         = new C_Proxy();
          //---MODE_DELETE
          if(mode == MODE_CREATE && !IsKey && ObjectFind(ChartData_ChartInfo.ID, Name) >= 0 ) {return ObjectDelete(ChartData_ChartInfo.ID, Name);}
          //---MODE_CREATE
          if(mode == MODE_CREATE && IsKey && ObjectFind(ChartData_ChartInfo.ID, Name) < 0 )   {result = GAC.Create(ChartData_ChartInfo.ID, Name, ChartData_ChartInfo.SubWindow, 0, 0);} // if(!ObjectCreate(chart_ID, name, OBJ_LABEL, sub_window, 0, 0))
          //---Set_Attribe
          if(mode == MODE_CREATE && IsKey && ObjectFind(ChartData_ChartInfo.ID, Name) >= 0 )  {return /*Frame.*/Attribe_NoObj(IsSet_);} //---Proxy If the object is not found, the function returns a negative number.
          return  false;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Cg_TextsLabel::Create_Solo( bool IsDelete,
                                 const long              chart_ID = 0,             // chart's ID
                                 const string            name = "Label",           // label name
                                 const int               sub_window = 0,           // subwindow index
                                 const int               x = 0,                    // X coordinate
                                 const int               y = 0,                    // Y coordinate
                                 const ENUM_BASE_CORNER  corner = CORNER_LEFT_UPPER, // chart corner for anchoring
                                 const string            text = "Label",           // text
                                 const string            font = "Arial",           // font
                                 const int               font_size = 10,           // font size
                                 const color             clr = clrRed,             // color
                                 const double            angle = 0.0,              // text slope
                                 const ENUM_ANCHOR_POINT anchor = ANCHOR_LEFT_UPPER, // anchor type
                                 const bool              back = false,             // in the background
                                 const bool              selection = false,        // highlight to move
                                 const bool              hidden = true,            // hidden in the object list
                                 const long              z_order = 0)
{         //--- reset the error value
          ResetLastError();
          if(IsDelete) { if(ObjectFind(0, name) >= 0) ObjectDelete(0, name); return;}
          //--- create a text label
          if(ObjectFind(0, name) < 0)
          {         if(!ObjectCreate(chart_ID, name, OBJ_LABEL, sub_window, 0, 0)) { Print(__FUNCTION__, ": failed to create text label! Error code = ", GetLastError()); return; }
                    //--- set label coordinates
                    ObjectSetInteger(chart_ID, name, OBJPROP_XDISTANCE, x);
                    ObjectSetInteger(chart_ID, name, OBJPROP_YDISTANCE, y);
                    //--- set the chart's corner, relative to which point coordinates are defined
                    ObjectSetInteger(chart_ID, name, OBJPROP_CORNER, corner);
                    //--- set the text
                    ObjectSetString(chart_ID, name, OBJPROP_TEXT, text);
                    //--- set text font
                    ObjectSetString(chart_ID, name, OBJPROP_FONT, font);
                    //--- set font size
                    ObjectSetInteger(chart_ID, name, OBJPROP_FONTSIZE, font_size);
                    //--- set the slope angle of the text
                    ObjectSetDouble(chart_ID, name, OBJPROP_ANGLE, angle);
                    //--- set anchor type
                    ObjectSetInteger(chart_ID, name, OBJPROP_ANCHOR, anchor);
                    //--- set color
                    ObjectSetInteger(chart_ID, name, OBJPROP_COLOR, clr);
                    //--- display in the foreground (false) or background (true)
                    ObjectSetInteger(chart_ID, name, OBJPROP_BACK, back);
                    //--- enable (true) or disable (false) the mode of moving the label by mouse
                    ObjectSetInteger(chart_ID, name, OBJPROP_SELECTABLE, selection);
                    ObjectSetInteger(chart_ID, name, OBJPROP_SELECTED, selection);
                    //--- hide (true) or display (false) graphical object name in the object list
                    ObjectSetInteger(chart_ID, name, OBJPROP_HIDDEN, hidden);
                    //--- set the priority for receiving the event of a mouse click in the chart
                    ObjectSetInteger(chart_ID, name, OBJPROP_ZORDER, z_order);
                    //--- successful execution
          }
          return; //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Cg_TextsLabel::Create_Solo_Update(string name = "Label", string desc = "desc")
{         ObjectSetString(0, name, OBJPROP_TEXT, desc);//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Cg_TextsLabel::MoveAdd(const string Name = "UseButtonX", const int XCordinate = 10, const int YCordinate = 10) //
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_Button Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          if(ObjectFind(ChartData_ChartInfo.ID, Name) >= 0)
          {         int XCordinateGet = GAC.X_Distance();
                    int YCordinateGet = GAC.Y_Distance();//
                    //===========================================
                    GAC.X_Distance(XCordinateGet + XCordinate);
                    GAC.Y_Distance(YCordinateGet + YCordinate); //
                    //
          }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_Button Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return true; //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Cg_TextsLabel::CLabelColor(const string Name = "Name", color Color = clrRed) {if(ObjectFind(ChartData_ChartInfo.ID, Name) >= 0) {GAC.Color(Color); } }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Cg_TextsLabel::Set_Label(int WhichMode = MODE_CREATE, bool IsKey = false)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TextLabel Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          int height = (int)ChartGetInteger(0, CHART_HEIGHT_IN_PIXELS, 0);
          int width = (int)ChartGetInteger(0, CHART_WIDTH_IN_PIXELS, 0);
          string arrows[4] = {"LEFT_UPPER", "RIGHT_UPPER", "RIGHT_LOWER", "LEFT_LOWER" };
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
          ActionSelf(WhichMode, IsKey, arrows[0], arrows[0], 50, 50, CORNER_LEFT_UPPER, ANCHOR_LEFT_UPPER);
          ActionSelf(WhichMode, IsKey, arrows[1], arrows[1], 50, 50, CORNER_RIGHT_UPPER, ANCHOR_RIGHT_UPPER);
          ActionSelf(WhichMode, IsKey, arrows[2], arrows[2], 50, 50, CORNER_RIGHT_LOWER, ANCHOR_RIGHT_LOWER);
          ActionSelf(WhichMode, IsKey, arrows[3], arrows[3], 50, 50, CORNER_LEFT_LOWER, ANCHOR_LEFT_LOWER); //
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TextLabel Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|             Class SoundController     BEGIN                      |
//+------------------------------------------------------------------+
//bool Cg_TextsLabel::Action(int WhichMode, bool IsKey, Sg_LABEL &s); //--- Caling From FRAME
//bool Cg_TextsLabel::Action(int WhichMode, bool IsKey, Sg_LABEL &s)
//{         bool result = false; //
//          bool IsObj = true; bool IsSet_ = true; C_Proxy Proxy  = new C_Proxy();
//          //---MODE_MOVE
//          if(mode == MODE_MOVE   &&  IsKey && ObjectFind(ChartData_ChartInfo.ID, s.NAME_A_01) >= 0 ) {ObjectSetInteger(0, s.NAME_A_01, OBJPROP_XDISTANCE, s.XDISTANCE); return ObjectSetInteger(0, s.NAME_A_01, OBJPROP_YDISTANCE, s.YDISTANCE); } //GAC.X_Distance(XCordinate);//GAC.Y_Distance(YCordinate); //
//          //---MODE_DELETE
//          if(mode == MODE_CREATE && !IsKey && ObjectFind(ChartData_ChartInfo.ID, s.NAME_A_01) >= 0 ) {return ObjectDelete(ChartData_ChartInfo.ID, s.NAME_A_01);}
//          //---MODE_CREATE
//          if(mode == MODE_CREATE &&  IsKey && ObjectFind(ChartData_ChartInfo.ID, s.NAME_A_01) < 0  ) {result = GAC.Create(ChartData_ChartInfo.ID, s.NAME_A_01, ChartData_ChartInfo.SubWindow, 0, 0);} // if(!ObjectCreate(chart_ID, name, OBJ_LABEL, sub_window, 0, 0))
//          //---Set_AttribeByName
//          if(mode == MODE_CREATE &&  IsKey && ObjectFind(ChartData_ChartInfo.ID, s.NAME_A_01) >= 0 ) {return Frame.Attribe(IsObj, IsSet_, oLabel) ;} //If the object is not found, the function returns a negative number.
//          //---Set_AttribeByName
//          if(mode == MODE_CREATE &&  IsKey && ObjectFind(ChartData_ChartInfo.ID, s.NAME_A_01) >= 0 ) {return Frame.Attribe(s) ;} //If the object is not found, the function returns a negative number.
//          return true;///
//}
//+------------------------------------------------------------------+
//template<typename GraphicalObject>
//bool Cg_TextsLabel::Action(GraphicalObject &GO)
//{
////
//          if(Mode_OBJ(GO))      {return true;}
//          //---else             { Alert("cant do Action for ObjectCom", __FUNCSIG__, __LINE__); return false;} //
//          //---
//          return false;
//          return false;
////
//}
//template<typename GraphicalObject>
//bool Cg_TextsLabel::Mode_OBJ(GraphicalObject &GO)
//{         //
//          //
//          return false;
//          //
//}
//+------------------------------------------------------------------+
//|                            Cg_Textsdata.mqh                     |
//+------------------------------------------------------------------+
//||   ||||||||||               Cg_Textsdata.mqh                   ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
