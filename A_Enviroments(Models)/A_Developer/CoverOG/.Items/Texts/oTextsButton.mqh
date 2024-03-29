//+------------------------------------------------------------------+
//|                                                       C_TextButton.mqh |
//|                                                    A pourya 2021 |
//|                                                @prymhdvgmail.com |
//+------------------------------------------------------------------+
#property copyright "A pourya 2021"
#property link      "@prymhdvgmail.com"
#property version   "1.00"
#property strict
////================================================================================================================================================
//--------------------------------------------------
#define ButtonDEF_NAME          "ButtonDEF_NAME"
#define ButtonDEF_TEXT          "ButtonDEF_TEXT"
#define ButtonDEF_FONT          "Trebuchet MS"
#define ButtonDEF_FONTSIZE      7
//--------------------------------------------------
#define ButtonDEF_XDISTANCE      200
#define ButtonDEF_YDISTANCE      200
#define ButtonDEF_XSIZE          60
#define ButtonDEF_YSIZE          20
#define ButtonDEF_CORNER         CORNER_LEFT_UPPER
//--------------------------------------------------
#define ButtonDEF_state         false
#define ButtonDEF_tooltip       "tooltip_Button"
//--------------------------------------------------
#define ButtonDEF_COLOR         clrGreen
#define ButtonDEF_BGCOLOR       clrGray
#define ButtonDEF_BORDER_COLOR  clrWhite
//-------------------------------------------------
/////---Progressing non-Generic
///--
///-
////--- BTN_X ---//
//{
// ButtonX.GDS.Set_Action_2(WhichMode, IsKey /*int WhichMode = MODE_CREATE, bool IsKey = false*/);
// ButtonX.GDS.Set_Desc_4(ButtonDEF_NAME,ButtonDEF_TEXT ,ButtonDEF_FONT,ButtonDEF_FONTSIZE);
// ButtonX.GDS.Set_Self_1(ButtonDEF_state);
// ButtonX.GDS.Set_Location_5(ButtonDEF_XDISTANCE, ButtonDEF_YDISTANCE, ButtonDEF_XSIZE, ButtonDEF_YSIZE, ButtonDEF_CORNER);
// ButtonX.GDS.Set_Color_3(ButtonDEF_COLOR, ButtonDEF_BGCOLOR, ButtonDEF_BORDER_COLOR);
// ButtonX.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip +"");
// ButtonX.GDS.Set_Chart_6();
// ButtonX.Action(ButtonX);//
//}
///---Progressing Generic
///--
///-
///[onPad] line 213 ///
////---Generic gBTN_RESET---//
//{
//          gBTN_RESET.GDS.Set_Action_2(WhichMode, IsKey /*int WhichMode = MODE_CREATE, bool IsKey = false*/);
//          gBTN_RESET.GDS.Set_Desc_4("gBTN_RESET", "ó" , "Wingdings", 10);
//          gBTN_RESET.GDS.Set_Self_1(ButtonDEF_state);
//          gBTN_RESET.GDS.Set_Location_5((int)(283.4), (int)(176), PANEL_BUTTON2_WIDTH / 2 - 10,   PANEL_BUTTON2_HEIGHT + 3 - 5, CORNER_RIGHT_LOWER);
//          gBTN_RESET.GDS.Set_Color_3(clrViolet, clrViolet, clrWhite);
//          gBTN_RESET.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "TradePanel.BTN_CommentPannel");
//          gBTN_RESET.GDS.Set_Chart_6(/*long timeframe_41 = 0, string symbol_42 = "", datetime createtime_43 = 0, ENUM_OBJECT typr_44 = 0, long chart_45 = 0, int subwindow_46 = 0*/);
//          gBTN_RESET.Action(gBTN_RESET);//
//          //0// BTN_RESET.Create(Is_Create, Is_Move, __FUNCSIG__, "BTN_RESET", "ó",
//          //0// (int)(283.4), (int)(176), PANEL_BUTTON2_WIDTH / 2 - 10,   PANEL_BUTTON2_HEIGHT + 3 - 5, CORNER_RIGHT_LOWER, ANCHOR_CENTER,
//          //0// false, clrViolet, clrViolet, clrWhite, 0, 10, "Wingdings");
//          //
//}
///---Progressing
///--
///-
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\.Items\Texts\Sg_BUTTON.mqh>;
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(MQL4)\Include\ChartObjects\ChartObjectsTxtControls.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(MQL4)\Include\Controls\Button.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\BasicChartObj\__COBFA__.mqh>
// C_Objects             OBJ;
class Cg_TextsButton_Demo: public __COBFA__<Sg_BUTTON> //drive from edite and dont have self create function we use not opp
{         /*
                  //Hi from pourya.. its happen when un declared for class constructors
                  Hi Karguvel,
                  An access violation occurs when the code attempts to read or write to memory that has not been allocated,
                   or to which it does not have access. This usually occurs because a pointer has a bad value.
                   Not all reads or writes through bad pointers lead to access violations, so an access violation usually indicates that
                   several reads or writes have occurred through bad pointers, and that memory might be corrupted. Thus, access violations almost always indicate serious programming errors.

                  I agree with Igor and Scott that you should debug your code to find where the access violation happens.
                  The article helps you indicate this problem: How Can I Debug an Access Violation?
                  Anyway, would you mind letting us know the result of reinstalling the VS2008? Does it resolve the problem?
                  Cheers.
                  ************************************************************************************************************************
                  solution:   add Create func to C_TextButton base class derived from edite,,,its work... and not violeted...

                  ************************************************************************************************************************
                  */


private:
          //--- ItSelf Identites
          string                m_name;               // unique name C_TextButton object name
          int                   m_index;              // unique name C_TextButton index value
          long                  m_chart_id;           // identifier of chart the object belongs to
          int                   m_window;             // number of subwindow (0 - main window)
          int                   m_num_points;         // number of anchor points of object
//====================================================================
private:   void                  Cg_TextsButton_Demo() {};//oButton = oButton ;
          void                  ~Cg_TextsButton_Demo() {};
          void                  Cg_TextsButton_Demo(string Name) {ObjName =  "#" + (string)++ObjAllNum + " " + Name ;}
          static uint           ObjAllNum;
          static uint           ObjAllNumDef;
          string                ObjName;//name num comfe from ObjAllNum
          uint                  ObjNum;//just run once created obj
          datetime              ObjCreateTime;
          //static int          OBJCount;// = 0;>>may come error//resolved//by set value out class block::
          //CChartObjectButton *oButton2; ///---Active >> oButton2 = new Cg_TextsButton();
          ///its use Parent create method of (Button)/(Edite)   //error//invalid pointer access in 'Button.mqh' (593,38)

          ///---ProxyGlobal
          CButton                cButton;        //Class_ // --- class CLabel : public CWndObj                     // --- Control chart
          CButton                MQL_cAPI;

          ///---ProxyGlobal  non-generic access by every class member ///--- generic access by generic member or drived genericMember of parent
          ////---API---// its use (Button)/(Edite)/(Label)/(Text)/(ChartObject)/(Object List) Just Call Constructor of CChartObjectButton
          //Object_Label    // --- class CChartObjectLabel : public CChartObjectText // --- Object  chart API  Function GetLive Data FromChart

          ///---ProxyGlobal
          //Struct_    // --- struct Sg_LABEL : public STRUCT_OBJECT  //---Mine---//  // --- Struct  chart Mine Function
          ///---ProxyGlobal
          __COBFA__<Sg_BUTTON>               Frame;          //--Proxy--//     // --- class C_ObjectFrame //SOLID Base //--Proxy--//    // --- Proxy   chart Mine Function Parent
          //------------------

protected:
          bool Attach(long chart_id, const string name, const int window, const int points) //--- methods of filling the object
          {         if(ObjectFind(chart_id, name) < 0)return(false);//--- check
                    if(chart_id == 0)chart_id = ChartID();//--- attach
                    m_chart_id  = chart_id;
                    m_window    = window;
                    m_name      = name;
                    m_num_points = points;
                    return(true);//--- successful
          }
          bool CreateMain(long chart_id, const string name, const int window, const int X, const int Y, const int sizeX, const int sizeY)
          {         if(!ObjectCreate(chart_id, name, (ENUM_OBJECT)Type(), window, 0, 0, 0))return(false);
                    if(!Attach(chart_id, name, window, 1))return(false);
                    //if(!X_Distance(X) || !Y_Distance(Y))return(false); seted?
                    //if(!X_Size(sizeX) || !Y_Size(sizeY))return(false); seted?
                    //Selectable(false);
                    //Hidden(true);
                    return(true);////--- successful
          }
          /*  its use (Button)/(Edite)/(Label)/(Text)/(ChartObject)/(Object List)   */
          virtual int           Type(void) const { return(OBJ_BUTTON); } //--- method of identifying the object

          //--- Dependency members
};
uint Cg_TextsButton_Demo::ObjAllNum = 0;
uint Cg_TextsButton_Demo::ObjAllNumDef = 0;

class Cg_TextsButton: public __COBFA__<Sg_BUTTON> //drive from edite and dont have self create function we use not opp
{
public:
          CChartObjectButton      GAC;       //--- oLabel ProxyGlobal  non-generic access by every class member ///--- generic access by generic member or drived genericMember of parent
          Sg_BUTTON               GDS;
          void                   SetupSignal() {}
//====================================================================
public:
          void                  Cg_TextsButton() {};//oButton = oButton ;
          void                  ~Cg_TextsButton() {};
          void                  Cg_TextsButton(string Name) { }
//====================================================================string Assign<int,string>(int&,string)         template<typename T1,typename T2>
          template <typename T>
          bool                  gColorButton(T & ObjAlfa, bool Is_DeActive = false, color crlX = clrNONE, color crlY = clrNONE);
          // template <typename T, typename R>
          //bool                  gColorButton(T &ObjAlfa, R &ObjBeta, bool Is_DeActive = false, color crlX = clrNONE, color crlY = clrNONE);
//====================================================================
          color                 CBackColor;
          color                 CBorderColor;
          color                 CDescColor;
          color                 CBackColorPress   ;// = clrGold;
          color                 CBorderColorPress ;// = clrRed;
          color                 CDescColorPress   ;// = clrRed; //
          //================================================================
          color                 CDescColorPressB;// = clrWhite;
          color                 CBackColorPressB;// = clrDarkCyan;
          color                 CBorderColorPressB;// = clrDarkCyan;
          color                 CDescColorB;// = clrDarkCyan;
          color                 CBackColorB;// = clrLavender;
          color                 CBorderColorB;// = clrLavender;
//====================================================================
          bool                  SetAttribe();
          bool                  GAC_CreateCall(long ChartID_, string Name_, int SubWindow_) {return GAC.Create(ChartID_, Name_, SubWindow_, 0, 0, 0, 0);}
          bool                  Create(int                   mode            = MODE_CREATE,
                                       bool                  IsKey          = false,
                                       string                FuncCOM         = "",
                                       string                oButtonName     = "oButtonX",
                                       string                Description     = "oButtonXDescription",
                                       int                   XCordinate      = 10,
                                       int                   YCordinate      = 10,
                                       int                   XSize           = 10,
                                       int                   YSize           = 10,
                                       ENUM_BASE_CORNER      Corner          = CORNER_RIGHT_LOWER,
                                       ENUM_ANCHOR_POINT     Anchor          = ANCHOR_UPPER,
                                       bool                  Background      = false,
                                       color                 BackColor       = C'36, 52, 69',
                                       color                 BorderColor     = clrGray,
                                       color                 DescColor     = clrYellow,
                                       int                   Angle           = 0,
                                       int                   FontSize        = 7,
                                       string                Font            = "Arial"  ); //

          bool          MoveAssign(const string oButtonName = "oButtonX",
                                   const int XCordinate = 10, const int YCordinate = 10,
                                   const ENUM_BASE_CORNER Corner = CORNER_LEFT_UPPER, const ENUM_ANCHOR_POINT Anchor = ANCHOR_CENTER); //

          bool          MoveAdd(const string oButtonName = "oButtonX", const int XCordinate = 10, const int YCordinate = 10); //

          bool          ReSize(  const long   chart_ID = 0,  // chart's ID
                                 const string name = "Button", // button name
                                 const int    width = 50,    // button width
                                 const int    height = 18);   // button height

          bool          ReCorner(  const long             chart_ID = 0,             // chart's ID
                                   const string           name = "Button",          // button name
                                   const ENUM_BASE_CORNER corner = CORNER_LEFT_UPPER); // chart corner for anchoring

          bool          ReText(  const long   chart_ID = 0,      // chart's ID-'ChartID' - constant expected
                                 const string name = "Button",   // button name
                                 const string text = "TextChange");    // text

          static bool   Move2(   const long   chart_ID = 0,  // chart's ID
                                 const string name = "Button", // button name
                                 const int    x = 0,         // X coordinate
                                 const int    y = 0);         // Y coordinate

};

//+------------------------------------------------------------------+
//| Move the button                                                  |
//+------------------------------------------------------------------+
bool Cg_TextsButton::Move2(const long   chart_ID = 0,  // chart's ID
                           const string name = "Button", // button name
                           const int    x = 0,         // X coordinate
                           const int    y = 0)         // Y coordinate
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TextButton Error",  __LINE__, __FUNCTION__); //|
//--- reset the error value
          if(Capitan_ResetLastErrorX)
                    ResetLastError();
          //=========================================================|
          if(ObjectFind(chart_ID, name) >= 0)
          {         if(!ObjectSetInteger(chart_ID, name, OBJPROP_XDISTANCE, x))//--- move the button
                    {         Print(__FUNCTION__, ": failed to move X coordinate of the button! Error code = ", _LastError);
                              ________________________________________________________Xerorr.SuperviserX(_LastError, "-move X coordinate of the button! Error",  __LINE__, __FUNCTION__);
                              return(false); }
                    if(!ObjectSetInteger(chart_ID, name, OBJPROP_YDISTANCE, y))
                    {         Print(__FUNCTION__, ": failed to move Y coordinate of the button! Error code = ", _LastError);
                              ________________________________________________________Xerorr.SuperviserX(_LastError, "-move Y coordinate of the button! Error",  __LINE__, __FUNCTION__);
                              return(false); }//
          }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TextButton Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return(true); ////--- successful execution
}


//+------------------------------------------------------------------+
//| Change button size                                               |
//+------------------------------------------------------------------+
bool Cg_TextsButton::ReSize(const long   chart_ID = 0,  // chart's ID
                            const string name = "Button", // button name
                            const int    width = 50,    // button width
                            const int    height = 18)   // button height
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TextButton Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          if(ObjectFind(chart_ID, name) >= 0)
          {         if(!ObjectSetInteger(chart_ID, name, OBJPROP_XSIZE, width))//--- change the button size
                    {         ________________________________________________________Xerorr.SuperviserX(_LastError, "change the button width! Error",  __LINE__, __FUNCTION__); return(false); }
                    if(!ObjectSetInteger(chart_ID, name, OBJPROP_YSIZE, height))
                    {         ________________________________________________________Xerorr.SuperviserX(_LastError, "change the button height! Errorchange the button width! Error",  __LINE__, __FUNCTION__); return(false); } //
          }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TextButton Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return(true); ////--- successful execution
}
//+------------------------------------------------------------------+
//| Change corner of the chart for binding the button                |
//+------------------------------------------------------------------+
bool Cg_TextsButton::ReCorner(const long             chart_ID = 0,             // chart's ID
                              const string           name = "Button",          // button name
                              const ENUM_BASE_CORNER corner = CORNER_LEFT_UPPER) // chart corner for anchoring
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TextButton Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          if(ObjectFind(chart_ID, name) >= 0)
                    if(!ObjectSetInteger(chart_ID, name, OBJPROP_CORNER, corner))//--- change anchor corner
                    {         ________________________________________________________Xerorr.SuperviserX(_LastError, "change the anchor corner! Error",  __LINE__, __FUNCTION__); return(false); }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TextButton Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return(true); ////--- successful execution
}
//+------------------------------------------------------------------+
//| Change button text                                               |
//+------------------------------------------------------------------+
bool Cg_TextsButton::ReText(const long   chart_ID = 0,      // chart's ID-'ChartID' - constant expected
                            const string name = "Button",   // button name
                            const string text = "TextChange")     // text
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TextButton Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          if(ObjectFind(chart_ID, name) >= 0)
                    if(!ObjectSetString(chart_ID, name, OBJPROP_TEXT, text))//--- change object text
                    {         ________________________________________________________Xerorr.SuperviserX(_LastError, "change the text! Error",  __LINE__, __FUNCTION__);     return(false); }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TextButton Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return(true); ////--- successful execution
}
//+------------------------------------------------------------------+
//| Delete the button                                                |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |  MODE, IsKey,
//+------------------------------------------------------------------+
bool Cg_TextsButton::Create(int                   mode            = MODE_CREATE,
                            bool                  IsKey          = false,
                            string                FuncCOM         = "",
                            string                oButtonName     = "oButtonX",
                            string                Description     = "oButtonXDescription",
                            int                   XCordinate      = 10,
                            int                   YCordinate      = 10,
                            int                   XSize           = 10,
                            int                   YSize           = 10,
                            ENUM_BASE_CORNER      Corner          = CORNER_RIGHT_LOWER,
                            ENUM_ANCHOR_POINT     Anchor          = ANCHOR_UPPER,
                            bool                  Background      = false,
                            color                 BackColor       = C'36, 52, 69',
                            color                 BorderColor     = clrGray,
                            color                 DescColor     = clrYellow,
                            int                   Angle           = 0,
                            int                   FontSize        = 7,
                            string                Font            = "Arial" ) //
{         //if(false)________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TextButton Error",  __LINE__, "<" + (string)ObjAllNum + ":" + (string)this.ObjNum + ">-" + "<" + (string)oButtonName + ">" + FuncCOM + __FUNCTION__); //|
          //=========================================================|
          if(mode == MODE_MOVE   &&  IsKey && ObjectFind(ChartData_ChartInfo.ID, oButtonName) >= 0 ) { ObjectSetInteger(0, oButtonName, OBJPROP_XDISTANCE, XCordinate); return ObjectSetInteger(0, oButtonName, OBJPROP_YDISTANCE, YCordinate);} ////Label_.Y_Distance(YCordinate); ////Label_.X_Distance(XCordinate);
          if(mode == MODE_CREATE && !IsKey && ObjectFind(ChartData_ChartInfo.ID, oButtonName) >= 0 ) { return ObjectDelete(ChartData_ChartInfo.ID, oButtonName);}
          if(mode == MODE_CREATE &&  IsKey &&  ObjectFind(ChartData_ChartInfo.ID, oButtonName) < 0)
          {         //=================================================================================================
                    return GAC.Create(ChartData_ChartInfo.ID, oButtonName, ChartData_ChartInfo.SubWindow, 0, 0, 0, 0 ) ? SetAttribe() : false; //
                    //Done = CreateMain(ChartData_ChartInfo.ID, oButtonName, ChartData_ChartInfo.SubWindow, 0, 0, 0, 0 ); //
                    //Done = ObjectCreate(ChartData_ChartInfo.ID, oButtonName, OBJ_BUTTON, ChartData_ChartInfo.SubWindow, 0, 0, 0, 0);
                    Create(MODE_CREATE, true);
                    //=================================================================================================
          }
          return(false); //
}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Cg_TextsButton::MoveAssign(const string oButtonName = "oButtonX",
                                const int XCordinate = 10, const int YCordinate = 10,
                                const ENUM_BASE_CORNER Corner = CORNER_LEFT_UPPER, const ENUM_ANCHOR_POINT Anchor = ANCHOR_CENTER) //
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TextButton Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          if(ObjectFind(ChartData_ChartInfo.ID, oButtonName) >= 0)
          {         GAC.Corner(Corner);
                    GAC.Anchor(Anchor);
                    GAC.X_Distance(XCordinate);
                    GAC.Y_Distance(YCordinate); }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TextButton Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return true; //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Cg_TextsButton::MoveAdd(const string oButtonName = "oButtonX", const int XCordinate = 10, const int YCordinate = 10) //
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TextButton Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          if(ObjectFind(ChartData_ChartInfo.ID, oButtonName) >= 0)
          {         int XCordinateGet = GAC.X_Distance();
                    int YCordinateGet = GAC.Y_Distance();//
                    //===========================================
                    GAC.X_Distance(XCordinateGet + XCordinate);
                    GAC.Y_Distance(YCordinateGet + YCordinate); //
                    //
          }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TextButton Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return true; //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
template <typename T>
bool Cg_TextsButton::gColorButton(T & ObjAlfa, bool Is_DeActive = false, color crlX = clrNONE, color crlY = clrNONE)
{         color         DescColorPressV = clrWhite;
          color         BackColorPressV = clrDarkCyan;
          color         BorderColorPressV = clrDarkGray;
          color         DescColorV = clrWhite;
          color         BackColorV = clrCadetBlue;
          color         BorderColorV = clrDarkGray;//
          if(crlX != clrNONE || crlY != clrNONE)
          {         DescColorPressV     = crlY;
                    BackColorPressV     = crlX;
                    BorderColorPressV   = crlX;
                    DescColorV          = crlX;
                    BackColorV          = crlY;
                    BorderColorV        = crlY;//
          }
//====================================================================
          if(Is_DeActive)
          {         ObjAlfa.GAC.State(false);
                    ObjAlfa.GAC.Color(DescColorV);
                    ObjAlfa.GAC.BackColor(BackColorV);
                    ObjAlfa.GAC.BorderColor(BorderColorV ); ///
                    return true;//
          }
//====================================================================
          if( ObjAlfa.GAC.State())
          {         ObjAlfa.GAC.Color(DescColorPressV);
                    ObjAlfa.GAC.BackColor(BackColorPressV);
                    ObjAlfa.GAC.BorderColor(BorderColorPressV ); ///
          } //even zeroo mean default
          else
          {         ObjAlfa.GAC.Color(DescColorV  );
                    ObjAlfa.GAC.BackColor(BackColorV );
                    ObjAlfa.GAC.BorderColor(BorderColorV ); ///
          }//
//====================================================================
          return true;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Cg_TextsButton::SetAttribe()
{         if(ObjectFind(ChartData_ChartInfo.ID, GDS.NAME_A_01) >= 0)
          {         //
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
                    GAC.State(GDS.STATE_13);                    //ObjectSetInteger(0, GDS.NAME_A_01, OBJPROP_STATE,            false);
                    //
                    GAC.Description(GDS.TEXT_B_01);                //ObjectSetString( 0, GDS.NAME_A_01, OBJPROP_TEXT,             Description);
                    GAC.Font(GDS.FONT_B_02);                       //ObjectSetString( 0, GDS.NAME_A_01, OBJPROP_FONT,             Font);
                    GAC.FontSize(GDS.FONTSIZE_B_03);               //ObjectSetInteger(0, GDS.NAME_A_01, OBJPROP_FONTSIZE,                 FontSize);
                    //
                    GAC.Background(GDS.BACK_G_00);                //ObjectSetInteger(0, GDS.NAME_A_01, OBJPROP_BACK,             Background);        //CORNER_RIGHT_UPPER
                    GAC.Z_Order(GDS.ZORDER_G_00);                 //ObjectSetInteger(0, GDS.NAME_A_01, OBJPROP_ZORDER,           11);//UseLabel.oButton(false);
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

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
