//+------------------------------------------------------------------+
//|                                       C_COMPLEXTOOLS.mqh |
//|                                                    A pourya 2021 |
//|                                                @prymhdvgmail.com |
//+------------------------------------------------------------------+
#property copyright "A pourya 2021"
#property link      "@prymhdvgmail.com"
#property version   "1.00"
#property strict
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\.CoverOG.mqh>
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int MoveXChart  = -(int)(ChartData_ChartFrame.WidthPixel * 0.1);//going thrwo #define... in next lines...
//+------------------------------------------------------------------+
//|             Class C_COMPLEXTOOLS     BEGIN               |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class C_COMPLEXTOOLS//: public C_TOOLS  //class CCircle : public CShape  //C_TOOLS has drived claas that chane fathers obj addreess.. must be defused,,,
{
//===================================================
private:
          static uint    ObjAllNumDef;//
          static uint    ObjAllNum;
          string         ObjName;
          uint           ObjNum;
          datetime       ObjCreateTime;
//==================================================
public:
          void           C_COMPLEXTOOLS();
          void           ~C_COMPLEXTOOLS();
          bool           Update();//
          bool           UPDATED;
          //================================================================
          bool           KeyRunning;// = false;//
          //================================================================
          void           OnChartEvents(string FuncCom, const int id, const long & lparam, const double & dparam, const string & sparam, int LineCOM = 0, string FuncCome = "None");//
          void           MOUSE_MOVE(string FuncCom, const int id, const long & lparam, const double & dparam, const string & sparam, int LineCOM = 0, string FuncCome = "None");//
          void           OBJECT_CLICK(string FuncCom, const string & sparam);
          void           CLICK(string FuncCom, const int id, const long & lparam, const double & dparam, const string & sparam, int LineCOM = 0, string FuncCome = "None");
          //================================================================
          color          BackColor;
          color          BorderColor;
          color          DescColor;
          color          BackColorPress   ;// = clrGold;
          color          BorderColorPress ;// = clrRed;
          color          DescColorPress   ;// = clrRed; //
          //================================================================
          color          DescColorPressB;// = clrWhite;
          color          BackColorPressB;// = clrDarkCyan;
          color          BorderColorPressB;// = clrDarkCyan;
          color          DescColorB;// = clrDarkCyan;
          color          BackColorB;// = clrLavender;
          color          BorderColorB;// = clrLavender;
          //================================================================
          //================================================================


          //================================================================
          void           RSI(bool KeyCom = false);
          //-----------------------------------------------------------------------------------------------------------
          void           Expert_RECT(int WhichMode, bool IsKey);
          //----

          void           BottumX(int WhichMode, bool IsKey, int Type = 0, string NameCom = "",  int MoveX = 0, int MoveY = 0, color clrBodyMargine = clrFireBrick, color clrBodyCyrcle = clrRed, color clrBodyLogo = clrWhite, int FontSizer = 0);
          bool           BottumXAllMove(int WhichMode, bool IsKey, string NameCom, bool Is_Vertical, bool Is_CreateMini, int MoveX, int MoveY);
          //----
          void           LongPanel(int WhichMode, bool IsKey, color ColorBG = clrNONE, string NameCom =  "None", int MoveX = 30, int MoveY = 180 - 2,  color clrBG = clrBlueViolet, int Angel = 0, int xCom = 0, int yCom = 0, int FontSize = 0); //
          void           Get_TextPanel(int WhichMode, bool IsKey, color ColorBG = clrNONE, string NameCom =  "None", int MoveX = 30, int MoveY = 180 - 2, color clrBG = clrBlueViolet, int Angel = 0, int xCom = 0, int yCom = 0, int FontSize = 0); //
          void           Set_TextPanel(int WhichMode, bool IsKey, int YSide = 0, color ColorBG = clrNONE, string NameCom =  "None", string DescCom =  "None", int MoveX = 30, int MoveY = 180 - 2, color clrBG = clrBlueViolet, int Angel = 0, int xCom = 0, int yCom = 0, int FontSize = 0, int MoveYDesc = 0, string FontType = "Arial Bold", int FontSizeDesc = 0);
          void           Set_BottumPanel(int WhichMode, bool IsKey, int YSide = 0, color ColorBG = clrNONE, string NameCom =  "None", string DescCom =  "None", int MoveX = 30, int MoveY = 180 - 2, color clrBG = clrBlueViolet, color ColorCycle = clrBlue, int Angel = 0, int xCom = 0, int yCom = 0, int FontSize = 0, string FontType = "Arial Bold", int FontSizeDesc = 0, int MoveXDesc = 0, int MoveYBG3 = 0);
          //----------
//bool Is_Create = false, bool Is_Move = false, bool IsKey = false,
          bool           Menu_ButtonXX(int WhichMode, bool IsKey, string nameCOM = "", int MoveX = 0, int MoveY = 0, int XS = 0, int YS = 0, int FontSize = 0, color ColorBody = clrWhite,  color ColorBodyMargine = clrNavy, color ColorBodyText = clrNavy, color ColorBodyCyrcle = clrRed, int TextDESPosX = 0);
          bool           Menu_ButtonX(int WhichMode, bool IsKey, string nameCOM = "", int MoveX = 0, int MoveY = 0, int XS = 0, int YS = 0, int FontSize = 0, color ColorBody = clrWhite,  color ColorBodyMargine = clrNavy, color ColorBodyText = clrNavy, color ColorBodyCyrcle = clrRed);
          bool           Menu_Button(int WhichMode, bool IsKey, string DescCom = "Main",
                                     color ColorBody = clrWhite,  color ColorBodyMargine = clrFireBrick, color ColorBodyText = clrFireBrick, color ColorBodyCyrcle = clrRed, color ColorLogo = clrWhite,
                                     int WhereX = 0, int WhereY = 0, ENUM_BASE_CORNER Corner = CORNER_LEFT_UPPER,
                                     int XS = 88, int YS = 25,
                                     int RLBL_MenuPadsBoxX = 0, int RLBL_MenuPadsBoxY = 0,
                                     int LBL_MenuPadsLeftX = 0, int LBL_MenuPadsLeftY = 0,
                                     int LBL_MenuPadsRightX = 0, int LBL_MenuPadsRightY = 0,
                                     int LBL_MenuPadsLeft1X = 0, int LBL_MenuPadsLeft1Y = 0,
                                     int LBL_MenuPadsMainX = 0, int LBL_MenuPadsMainY = 0,
                                     int LBL_MenuPadsMainTextX = 0, int LBL_MenuPadsMainTextY = 0,
                                     int FontSize = 0, int LogoFontSize = 0, string FontType = "Arial Bold", ENUM_ANCHOR_POINT AnchorText = ANCHOR_CENTER,
                                     ENUM_ANCHOR_POINT Anchor = ANCHOR_CENTER, int independSizeX = 0, int independSizeY = 0);//
          //======================================// C_TOOLS C_COMPLEXTOOLS::TOOLS2,///not work/////dfused for using Class Name just// by static func
          C_Lines                Line_01;
          C_Fibos                FibolevelsX;
          //======================================//
          Cg_TextsLabel           LBL_MenuPadsLeft, LBL_MenuPadsLeft2, LBL_MenuPadsLeftO1, LBL_MenuPadsLeftO2, LBL_MenuPadsRight, LBL_MenuPadsRight2, LBL_MenuPadsLogo, LBL_MenuPadsMainText;
          Cg_TextsRectLabel       RLBL_MenuPadsBox, RLBL_MenuPadsBox2;
          //====================================
          void                   ValuSetTriangel();
          void                   LBL_ping_reflesh();
          //===============================================

};
uint   C_COMPLEXTOOLS::ObjAllNum = 0;
uint   C_COMPLEXTOOLS::ObjAllNumDef = 0;

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
C_COMPLEXTOOLS::C_COMPLEXTOOLS()
{         //
          if(IsTesterDebug) {Print("__DEBUG__TESTER__", __FUNCTION__, " ", __LINE__);}
          //
          RunCallFunction++; ObjName = "(Default#" + (string)++ObjAllNumDef + ")";//
          //Alert(C_TOOLSPublic());///succecc///'testX' - unexpected token, probably type is missing? //C_TOOLS has drived claas that chane fathers obj addreess.. must be defused,,,
          ///==================
          BackColor   = clrBeige ;//clrWhite;//clrBeige//= C'36, 52, 69'
          BorderColor = C'144,176,239';//clrGray;
          DescColor   = clrBlack;//C'59,41,40';//clrBlack;//= clrYellow,
          BackColorPress    = clrGold;
          BorderColorPress  = clrRed;
          DescColorPress    = clrRed; //
          ///==================
          DescColorPressB = clrWhite;
          BackColorPressB = clrDarkCyan;
          BorderColorPressB = clrDarkCyan;
          DescColorB = clrDarkCyan;
          BackColorB = clrLavender;
          BorderColorB = clrLavender;
          //===================
          ////CandelBox Class
          //FillValClass      = 0;.
          ////CandelBox Class
          Expert_RECT(MODE_CREATE, true);
          //===================
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
C_COMPLEXTOOLS::~C_COMPLEXTOOLS()
{         if(Capitan_DeinitErrorCatching)________________________________________________________Xerorr.SuperviserX(_LastError, "-C_COMPLEXTOOLS Error",  __LINE__, __FUNCTION__); //|
          ObjNum--; ObjAllNum--;
          if(Capitan_DeinitErrorCatching)________________________________________________________Xerorr.SuperviserX(_LastError, "-C_COMPLEXTOOLS Error",  __LINE__, __FUNCTION__); //|
}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |mode,IsKey
//+------------------------------------------------------------------+
bool C_COMPLEXTOOLS::Menu_Button(int WhichMode, bool IsKey, string DescCom = "Main",
                                 color  ColorBody               = clrWhite,  color ColorBodyMargine = clrFireBrick, color ColorBodyText = clrFireBrick, color ColorBodyCyrcle = clrRed, color ColorLogo = clrWhite,
                                 int    WhereX                  = 0,    int WhereY                      = 0, ENUM_BASE_CORNER Corner    = CORNER_LEFT_UPPER,
                                 int    XS                   = 88,   int YS                       = 25,
                                 int    RLBL_MenuPadsBoxX       = 0,    int RLBL_MenuPadsBoxY           = 0,
                                 int    LBL_MenuPadsLeftX       = 0,    int LBL_MenuPadsLeftY           = 0,
                                 int    LBL_MenuPadsRightX      = 0,    int LBL_MenuPadsRightY          = 0,
                                 int    LBL_MenuPadsLeft1X      = 0,    int LBL_MenuPadsLeft1Y          = 0,
                                 int    LBL_MenuPadsMainX       = 0,    int LBL_MenuPadsMainY           = 0,
                                 int    LBL_MenuPadsMainTextX   = 0,    int LBL_MenuPadsMainTextY       = 0,
                                 int    FontSize                = 0,
                                 int    LogoFontSize            = 0,
                                 string FontType                = "Arial Bold",
                                 ENUM_ANCHOR_POINT AnchorText   = ANCHOR_CENTER,
                                 ENUM_ANCHOR_POINT Anchor       = ANCHOR_CENTER, int independSizeX      = 0, int independSizeY = 0)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_COMPLEXTOOLS Error",  __LINE__, __FUNCTION__ ); //|
//=========================================================|
          bool          ResultOut       = false;
          static string DescSaved;//
          string        TrueDesc        = "true"; string FalseDesc = "false";
          string        test            = "0";
          string        DescNaming      = DescCom;
          int           AdjustLong      = -25; //
          //===================================================
          if(WhichMode == MODE_CREATE || WhichMode == MODE_MOVE )
          {         ///---Menu_ButtonBG
                    {         RectLabelX.GDS.Set_Action_2(WhichMode, IsKey);
                              RectLabelX.GDS.Set_Desc_1("RLBL_Menu_ButtonBG-" + DescNaming);
                              RectLabelX.GDS.Set_Tip_3(STYLE_SOLID, 1, BORDER_FLAT );
                              RectLabelX.GDS.Set_Color_2(ColorBodyMargine, clrNONE);
                              RectLabelX.GDS.Set_Location_5(RLBL_MenuPadsBoxX  + WhereX + (int)(AdjustLong / 7.9) - (int)(independSizeX * 0.03), RLBL_MenuPadsBoxY + WhereY,  (int)(independSizeX * 1.06) + XS - 4 + (int)(AdjustLong / 1.1), YS + independSizeY, Corner);
                              RectLabelX.GDS.Set_Chart_6();
                              RectLabelX.GDS.Set_Common_6(false, 10, false, false, false, "RLBL_Menu_ButtonBG-" + DescNaming);
                              RectLabelX.Action(RectLabelX); //
                              //0// RLBL_.Create(IsKey, IsKey, "RLBL_MenuPadsBox-"    + DescNaming, "Border",
                              //0//RLBL_MenuPadsBoxX  + WhereX + (int)(AdjustLong / 7.9) - (int)(independSizeX * 0.03), RLBL_MenuPadsBoxY + WhereY,
                              //0// (int)(independSizeX * 1.06) + XS - 4 + (int)(AdjustLong / 1.1), YS + independSizeY,
                              //0// Corner, Anchor, false, BORDER_FLAT, ColorBodyMargine, clrNONE, 0, STYLE_SOLID, 1, 8, "Arial" );
                    }
                    ///---Menu_ButtonBG2
                    {         RectLabelX.GDS.Set_Action_2(WhichMode, IsKey);
                              RectLabelX.GDS.Set_Desc_1("RLBL_Menu_ButtonBG2-" + DescNaming);
                              RectLabelX.GDS.Set_Tip_3(STYLE_SOLID, 1, BORDER_FLAT );
                              RectLabelX.GDS.Set_Color_2(ColorBody, clrNONE);
                              RectLabelX.GDS.Set_Location_5(RLBL_MenuPadsBoxX  + WhereX + (int)(AdjustLong / 7.9), RLBL_MenuPadsBoxY + WhereY + 2,  independSizeX + XS - 4 + (int)(AdjustLong / 1.1), YS - 4 + independSizeY, Corner);
                              RectLabelX.GDS.Set_Chart_6();
                              RectLabelX.GDS.Set_Common_6(false, 10, false, false, false, "RLBL_Menu_ButtonBG2-" + DescNaming);
                              RectLabelX.Action(RectLabelX); //
                              //0// RLBL_.Create(IsKey, IsKey, "RLBL_MenuPadsBox2-"   + DescNaming, "Border",
                              //0// RLBL_MenuPadsBoxX  + WhereX + (int)(AdjustLong / 7.9), RLBL_MenuPadsBoxY + WhereY + 2,
                              //0// independSizeX + XS - 4 + (int)(AdjustLong / 1.1), YS - 4 + independSizeY,
                              //0// Corner, Anchor, false, BORDER_FLAT, ColorBody, clrNONE, 0, STYLE_SOLID, 1, 8, "Arial" );
                    }//
                    ///---LBL_MenuPadsRight
                    {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                              LabelX.GDS.Set_Desc_4("LBL_MenuPadsRight-" + DescNaming, "»", "Wingdings 2", 24);
                              LabelX.GDS.Set_Color_1(ColorBodyMargine);
                              LabelX.GDS.Set_Location_5(LBL_MenuPadsRightX + WhereX - 3 + AdjustLong + independSizeX + (int)(independSizeX * 0.03), LBL_MenuPadsRightY + WhereY + independSizeY, 0, Corner, Anchor);
                              LabelX.GDS.Set_Common_6(false, 50, false, false, false, "LBL_MenuPadsRight-" + DescNaming);
                              LabelX.GDS.Set_Chart_6();
                              LabelX.Action(LabelX); // #351Line ProjectManager_Architecture_Architecture OOP MultiAssaining And Multi-SoloFunctional  MultiPrametric
                              //0// LBL_.Create(IsKey, IsKey, "LBL_MenuPadsRight-" + DescNaming, "»",
                              //0// LBL_MenuPadsRightX + WhereX - 3 + AdjustLong + independSizeX + (int)(independSizeX * 0.03),
                              //0// LBL_MenuPadsRightY + WhereY + independSizeY, Corner, Anchor, false, ColorBodyMargine, 0, 24, "Wingdings 2");   //
                    }
                    ///---LBL_MenuPadsRight2
                    {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                              LabelX.GDS.Set_Desc_4("LBL_MenuPadsRight2-" + DescNaming, "»", "Wingdings 2", 18);
                              LabelX.GDS.Set_Color_1(ColorBody);
                              LabelX.GDS.Set_Location_5(LBL_MenuPadsRightX + WhereX - 6 + AdjustLong + independSizeX + (int)(independSizeX * 0.03), LBL_MenuPadsRightY + WhereY - 1 + independSizeY, 0, Corner, Anchor);
                              LabelX.GDS.Set_Common_6(false, 50, false, false, false, "LBL_MenuPadsRight2-" + DescNaming);
                              LabelX.GDS.Set_Chart_6();
                              LabelX.Action(LabelX);//
                              //0// LBL_.Create(IsKey, IsKey, "LBL_MenuPadsRight2-"   + DescNaming, "»",//0//
                              //0// LBL_MenuPadsRightX + WhereX - 6 + AdjustLong + independSizeX + (int)(independSizeX * 0.03),
                              //0// LBL_MenuPadsRightY + WhereY - 1 + independSizeY, Corner, Anchor, false, ColorBody, 0, 18, "Wingdings 2");   //
                    }//
                    ///---LBL_MenuPadsLeft
                    {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                              LabelX.GDS.Set_Desc_4("LBL_MenuPadsLeft-" + DescNaming, "º", "Wingdings 2", 24);
                              LabelX.GDS.Set_Color_1(ColorBodyMargine);
                              LabelX.GDS.Set_Location_5(LBL_MenuPadsLeftX  + WhereX - 2 - (int)(independSizeX * 0.04), LBL_MenuPadsLeftY + WhereY, 0, Corner, Anchor);
                              LabelX.GDS.Set_Common_6(false, 50, false, false, false, "LBL_MenuPadsLeft-" + DescNaming);
                              LabelX.GDS.Set_Chart_6();
                              LabelX.Action(LabelX);//
                              //0// LBL_.Create(IsKey, IsKey, "LBL_MenuPadsLeft-"     + DescNaming, "º",
                              //0//      LBL_MenuPadsLeftX  + WhereX - 2 - (int)(independSizeX * 0.04),
                              //0//LBL_MenuPadsLeftY + WhereY, Corner, Anchor, false, ColorBodyMargine, 0, 24, "Wingdings 2");
                    }//
                    ///---LBL_MenuPadsLeft2
                    {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                              LabelX.GDS.Set_Desc_4("LBL_MenuPadsLeft2-" + DescNaming, "º", "Wingdings 2", 18);
                              LabelX.GDS.Set_Color_1(ColorBody);
                              LabelX.GDS.Set_Location_5(LBL_MenuPadsLeftX  + WhereX - (int)(independSizeX * 0.04), LBL_MenuPadsLeftY + WhereY - 1, 0, Corner, Anchor);
                              LabelX.GDS.Set_Common_6(false, 50, false, false, false, "LBL_MenuPadsLeft2-" + DescNaming);
                              LabelX.GDS.Set_Chart_6();
                              LabelX.Action(LabelX);//
                              //0// LBL_.Create(IsKey, IsKey, "LBL_MenuPadsLeft2-"    + DescNaming, "º",
                              //0// LBL_MenuPadsLeftX  + WhereX - (int)(independSizeX * 0.04), LBL_MenuPadsLeftY + WhereY - 1,
                              //0// Corner, Anchor, false, ColorBody, 0, 18, "Wingdings 2");
                    }//
                    ///---LBL_MenuPadsLeftO1
                    {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                              LabelX.GDS.Set_Desc_4("LBL_MenuPadsLeftO1-" + DescNaming, "n", "Webdings", 13 + LogoFontSize);
                              LabelX.GDS.Set_Color_1(ColorBodyMargine);
                              LabelX.GDS.Set_Location_5(LBL_MenuPadsLeft1X + WhereX, LBL_MenuPadsLeft1Y + WhereY + 1, 0, Corner, Anchor);
                              LabelX.GDS.Set_Common_6(false, 50, false, false, false, "LBL_MenuPadsLeftO1-" + DescNaming);
                              LabelX.GDS.Set_Chart_6();
                              LabelX.Action(LabelX);//
                              //0// LBL_.Create(IsKey, IsKey, "LBL_MenuPadsLeftO1-"   + DescNaming, "n",
                              //0// LBL_MenuPadsLeft1X + WhereX, LBL_MenuPadsLeft1Y + WhereY + 1, Corner, Anchor, false, ColorBodyMargine, 0, 13 + LogoFontSize, "Webdings");   //
                    }//
                    ///---LBL_MenuPadsLeftO2
                    {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                              LabelX.GDS.Set_Desc_4("LBL_MenuPadsLeftO2-" + DescNaming, "n", "Webdings", 10 + LogoFontSize);
                              LabelX.GDS.Set_Color_1(ColorBodyCyrcle);
                              LabelX.GDS.Set_Location_5(LBL_MenuPadsLeft1X + WhereX, LBL_MenuPadsLeft1Y + WhereY + 0, 0, Corner, Anchor);
                              LabelX.GDS.Set_Common_6(false, 50, false, false, false, "LBL_MenuPadsLeftO2-" + DescNaming);
                              LabelX.GDS.Set_Chart_6();
                              LabelX.Action(LabelX);//
                              //0//LBL_.Create(IsKey, IsKey, "LBL_MenuPadsLeftO2-"   + DescNaming, "n", LBL_MenuPadsLeft1X + WhereX, LBL_MenuPadsLeft1Y + WhereY + 0,
                              //0//Corner, Anchor, false, ColorBodyCyrcle, 0, 10 + LogoFontSize, "Webdings");   //
                    }//
                    ///---LBL_MenuPadsLogo
                    {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                              LabelX.GDS.Set_Desc_4("LBL_MenuPadsLogo-" + DescNaming, "~", "Webdings", 10 + LogoFontSize);
                              LabelX.GDS.Set_Color_1(ColorLogo);
                              LabelX.GDS.Set_Location_5(LBL_MenuPadsMainX  + WhereX, LBL_MenuPadsMainY + WhereY, 0, Corner, Anchor);
                              LabelX.GDS.Set_Common_6(false, 50, false, false, false, "LBL_MenuPadsLogo-" + DescNaming);
                              LabelX.GDS.Set_Chart_6();
                              LabelX.Action(LabelX);//
                              //0//LBL_.Create(IsKey, IsKey, "LBL_MenuPadsLogo-"     + DescNaming, "~",      LBL_MenuPadsMainX  + WhereX, LBL_MenuPadsMainY + WhereY,
                              //0//Corner, Anchor, false, ColorLogo, 0, 10 + LogoFontSize, "Webdings");   //
                    }//
                    ///---LBL_MenuPadsMainText
                    {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                              LabelX.GDS.Set_Desc_4("LBL_MenuPadsMainText-" + DescNaming, DescCom, FontType, 10 + FontSize);
                              LabelX.GDS.Set_Color_1(ColorBodyText);
                              LabelX.GDS.Set_Location_5( LBL_MenuPadsMainTextX + WhereX + (int)(AdjustLong / 1.9) + (independSizeX / 2), LBL_MenuPadsMainTextY + WhereY + (independSizeY / 2), 0, Corner, AnchorText);
                              LabelX.GDS.Set_Common_6(false, 50, false, false, false, "LBL_MenuPadsMainText-" + DescNaming);
                              LabelX.GDS.Set_Chart_6();
                              LabelX.Action(LabelX);//
                              //0// LBL_.Create(IsKey, IsKey, "LBL_MenuPadsMainText-" + DescNaming, DescCom,
                              //0// LBL_MenuPadsMainTextX + WhereX + (int)(AdjustLong / 1.9) + (independSizeX / 2), LBL_MenuPadsMainTextY + WhereY + (independSizeY / 2),
                              //0// Corner, AnchorText, false, ColorBodyText, 0, 10 + FontSize, FontType);   //it is the text
                    }//
                    DescSaved = DescCom;
                    return ResultOut = true; //
          }
          //===================================================karkaj Opration..Complited...EbRAhim Erkal..JanIsI,,,---trumpet...
          else if (WhichMode == MODE_MODIFY)           //if(ObjectFind(0, "LBL_MenuPadsLeftO2-" + DescNaming) >= 0 && IsKey )
          {         //===============================================================================================
                    if(true) //--enteral key colors  //---work correct..
                    {         //======================================================================================================================================================
                              //if(IsKey) {ColorBodyCyrcle = (ColorBodyCyrcle != clrOrange ) ? RightMenuPad_Color.CclrBodyCyrclePress   : RightMenuPad_Color.CclrBodyCyrcleActive;}
                              //else      {ColorBodyCyrcle = (ColorBodyCyrcle != clrGreen  ) ? RightMenuPad_Color.CclrBodyCyrcleUnPress : RightMenuPad_Color.CclrBodyCyrcleUnPress;} //
                              //==========================================================================================================================================================
                              //---controll
                              if(IsKey)
                              {         if(ColorBodyCyrcle != clrOrange) {ColorBodyCyrcle = RightMenuPad_Color.CclrBodyCyrclePress;}
                                        else {ColorBodyCyrcle = RightMenuPad_Color.CclrBodyCyrcleActive;} //
                              }
                              else
                              {         if(ColorBodyCyrcle != clrGreen) {ColorBodyCyrcle = RightMenuPad_Color.CclrBodyCyrcleUnPress;}
                                        else {ColorBodyCyrcle = RightMenuPad_Color.CclrBodyCyrcleActive;} //
                              }
                              //===============================================================================================//no need logo change..  false &&
                              //===============================================================================================// big back change to green..
                              //---register
                              if(ObjectFind(0, "LBL_MenuPadsLogo-" + DescNaming) >= 0)          {ObjectSetInteger(0, "LBL_MenuPadsLogo-"   + DescNaming, OBJPROP_COLOR, ColorBodyText);}
                              // if(ObjectFind(0, "LBL_MenuPadsLeftO2-" + DescNaming) >= 0)     {ObjectSetInteger(0, "LBL_MenuPadsLeftO2-" + DescNaming, OBJPROP_COLOR, ColorBodyCyrcle);}//
                              if(ObjectFind(0, "LBL_MenuPadsLeftO2-" + DescNaming) >= 0)        {ObjectSetInteger(0, "LBL_MenuPadsLeftO2-" + DescNaming, OBJPROP_COLOR, ColorBodyCyrcle);}//
                    }
                    //===============================================================================================//
                    //Alert(__FUNCTION__,"ColorBodyCyrcle: ",ColorBodyCyrcle);
                    //===============================================================================================//
                    return true;
                    //===============================================================================================
          }//
          else if (WhichMode == MODE_COLOR)
          {         //
                    if(IsKey)
                    {         //if(ObjectFind(0, "LBL_MenuPadsLogo-" + DescNaming) >= 0)    {ObjectSetInteger(0, "LBL_MenuPadsLogo-"   + DescNaming, OBJPROP_COLOR, ColorBodyText);}
                              if(ObjectFind(0, "LBL_MenuPadsLeftO2-" + DescNaming) >= 0)  {ObjectSetInteger(0, "LBL_MenuPadsLeftO2-" + DescNaming, OBJPROP_COLOR, ColorBodyCyrcle);}//
                              //======================================================================================================================================================
                    }
                    //
                    ChartRedraw(); //
          }
          //======================================================================================================================================================
          if(false)// string opration
          {         DescSaved = DescCom;
                    test = "0"; StringInit(test, 0, 0 );//
                    if(StringFind(DescCom, "false") != -1)StringReplace(DescCom, "false", " "); ///StringReserve()....StringReplace(Desc,TrueDesc=="true"||FalseDesc== "false",""
                    if(StringFind(DescCom, "true")  != -1)StringReplace(DescCom, "true",  " "); //nneddd too space  black for not erroriing
                    DescNaming = DescCom;//
                    return ResultOut;//
          }
          //======================================================================================================================================================
//
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_COMPLEXTOOLS Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          return false;//
}
//+------------------------------------------------------------------+
//|                                                                  | mode,IsKey,
//+------------------------------------------------------------------+
bool C_COMPLEXTOOLS::Menu_ButtonX(int WhichMode, bool IsKey, string nameCOM = "", int MoveX = 0, int MoveY = 0, int XS = 0, int YS = 0, int FontSize = 0,
                                  color ColorBody = clrWhite,  color ColorBodyMargine = clrNavy, color ColorBodyText = clrNavy, color ColorBodyCyrcle = clrRed)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_COMPLEXTOOLS Error",  __LINE__, __FUNCTION__); //|
          string FontType = "Arial Bold";
          ENUM_ANCHOR_POINT AnchorText = ANCHOR_CENTER;// long ALIGN = ALIGN_CENTER;  just for edite   ANCHOR_RIGHT  ANCHOR_CENTER
          ENUM_ANCHOR_POINT Anchor = ANCHOR_CENTER ; // ANCHOR_LEFT_UPPER
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_COMPLEXTOOLS Error",  __LINE__, __FUNCTION__); //|
          return Menu_Button(WhichMode, IsKey, nameCOM, ColorBody, ColorBodyMargine, ColorBodyText, ColorBodyCyrcle, clrWhite, -185, 50, CORNER_LEFT_UPPER, 88, 25,
                             MoveX + (int)(197.6), MoveY + (int)(4)    + 100,
                             MoveX + (int)(195),   MoveY + (int)(18.4) + 100,
                             MoveX + (int)(286),   MoveY + (int)(18.4) + 100,
                             MoveX + (int)(202.8), MoveY + (int)(16)   + 100,
                             MoveX + (int)(202.8), MoveY + (int)(16)   + 100,
                             MoveX + (int)(247),   MoveY + (int)(16)   + 100,
                             FontSize, 0, FontType, AnchorText, Anchor, XS, YS);  //
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_COMPLEXTOOLS Error",  __LINE__, __FUNCTION__); //|
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_COMPLEXTOOLS::Menu_ButtonXX(int WhichMode, bool IsKey, string nameCOM = "", int MoveX = 0, int MoveY = 0, int XS = 0, int YS = 0, int FontSize = 0,
                                   color ColorBody = clrWhite,  color ColorBodyMargine = clrNavy, color ColorBodyText = clrNavy, color ColorBodyCyrcle = clrRed, int TextDESPosX = 0)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_COMPLEXTOOLS Error",  __LINE__, __FUNCTION__); //|
          string FontType = "Arial Bold";
          ENUM_ANCHOR_POINT AnchorText = ANCHOR_LEFT;// long ALIGN = ALIGN_CENTER;  just for edite   ANCHOR_RIGHT  ANCHOR_CENTER
          ENUM_ANCHOR_POINT Anchor = ANCHOR_CENTER ; // ANCHOR_LEFT_UPPER ANCHOR_CENTER
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_COMPLEXTOOLS Error",  __LINE__, __FUNCTION__); //|
          return Menu_Button(WhichMode, IsKey, nameCOM, ColorBody, ColorBodyMargine, ColorBodyText, ColorBodyCyrcle, clrWhite, -185, 50, CORNER_LEFT_UPPER, 88, 25,
                             MoveX + (int)(197.6), MoveY + (int)(4)    + 100,
                             MoveX + (int)(195),   MoveY + (int)(18.4) + 100,
                             MoveX + (int)(286),   MoveY + (int)(18.4) + 100,
                             MoveX + (int)(202.8), MoveY + (int)(16)   + 100,
                             MoveX + (int)(202.8), MoveY + (int)(16)   + 100,
                             MoveX + (int)(200) + TextDESPosX,  MoveY + (int)(16)   + 100,
                             FontSize, 0, FontType, AnchorText, Anchor, XS, YS);  //
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_COMPLEXTOOLS Error",  __LINE__, __FUNCTION__); //|
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_COMPLEXTOOLS::Expert_RECT(int WhichMode, bool IsKey)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_COMPLEXTOOLS Error",  __LINE__, __FUNCTION__); //|
//========================================================247*+levelerX++*0.05
          {         RectLabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    RectLabelX.GDS.Set_Desc_1("RLBLBorderExpert");
                    RectLabelX.GDS.Set_Tip_3(STYLE_SOLID, 1, BORDER_FLAT);
                    RectLabelX.GDS.Set_Color_2(clrDarkOrchid, clrNONE);
                    RectLabelX.GDS.Set_Location_5(110, (int)(1.6), 120, PANEL_INDENT_TOP + 3, CORNER_RIGHT_UPPER);
                    RectLabelX.GDS.Set_Chart_6();
                    RectLabelX.GDS.Set_Common_6(true, 10, false, false, false, "RLBLBorderExpert");
                    RectLabelX.Action(RectLabelX); //
                    //0//RLBL_Border.Create(Is_Create, Is_Move, "RLBLBorderExpert",  "Border", 100, (int)(1.6), 100, PANEL_INDENT_TOP + 3,
                    //0//CORNER_RIGHT_UPPER, ANCHOR_UPPER, True, BORDER_FLAT, clrDodgerBlue, clrNONE, 0, STYLE_SOLID, 1, 8, "Arial" );
          }
          {         RectLabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    RectLabelX.GDS.Set_Desc_1("RLBLBorderExpert-ONOFF");
                    RectLabelX.GDS.Set_Tip_3(STYLE_SOLID, 1, BORDER_FLAT);
                    RectLabelX.GDS.Set_Color_2(clrCrimson, clrNONE);
                    RectLabelX.GDS.Set_Location_5(110 + 20, 1, 20, PANEL_INDENT_TOP + 3, CORNER_RIGHT_UPPER);
                    RectLabelX.GDS.Set_Chart_6();
                    RectLabelX.GDS.Set_Common_6(true, 10, false, false, false, "RLBLBorderExpert-ONOFF");
                    RectLabelX.Action(RectLabelX); //
                    //0//RLBL_Border.Create(Is_Create, Is_Move, "RLBLBorderExpert",  "Border", 100, (int)(1.6), 100, PANEL_INDENT_TOP + 3,
                    //0//CORNER_RIGHT_UPPER, ANCHOR_UPPER, True, BORDER_FLAT, clrDodgerBlue, clrNONE, 0, STYLE_SOLID, 1, 8, "Arial" );
          }
          {         RectLabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    RectLabelX.GDS.Set_Desc_1("RLBLBorderExpert-ONOFF-Alert-sParam");
                    RectLabelX.GDS.Set_Tip_3(STYLE_SOLID, 1, BORDER_FLAT);
                    RectLabelX.GDS.Set_Color_2(clrLightSlateGray, clrNONE);
                    RectLabelX.GDS.Set_Location_5(110 + 41, 1, 20, PANEL_INDENT_TOP + 3, CORNER_RIGHT_UPPER);
                    RectLabelX.GDS.Set_Chart_6();
                    RectLabelX.GDS.Set_Common_6(true, 10, false, false, false, "RLBLBorderExpert-ONOFF-Alert-sParam");
                    RectLabelX.Action(RectLabelX); //
                    //0//RLBL_Border.Create(Is_Create, Is_Move, "RLBLBorderExpert",  "Border", 100, (int)(1.6), 100, PANEL_INDENT_TOP + 3,
                    //0//CORNER_RIGHT_UPPER, ANCHOR_UPPER, True, BORDER_FLAT, clrDodgerBlue, clrNONE, 0, STYLE_SOLID, 1, 8, "Arial" );
          }
          {         RectLabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    RectLabelX.GDS.Set_Desc_1("RLBLBorderExpert-ONOFF-NN-Signal");
                    RectLabelX.GDS.Set_Tip_3(STYLE_SOLID, 1, BORDER_FLAT);
                    RectLabelX.GDS.Set_Color_2(clrDarkSlateBlue, clrNONE);
                    RectLabelX.GDS.Set_Location_5(110 + 62, 1, 20, PANEL_INDENT_TOP + 3, CORNER_RIGHT_UPPER);
                    RectLabelX.GDS.Set_Chart_6();
                    RectLabelX.GDS.Set_Common_6(true, 10, false, false, false, "RLBLBorderExpert-ONOFF-NN-Signal");
                    RectLabelX.Action(RectLabelX); //
                    //0//RLBL_Border.Create(Is_Create, Is_Move, "RLBLBorderExpert",  "Border", 100, (int)(1.6), 100, PANEL_INDENT_TOP + 3,
                    //0//CORNER_RIGHT_UPPER, ANCHOR_UPPER, True, BORDER_FLAT, clrDodgerBlue, clrNONE, 0, STYLE_SOLID, 1, 8, "Arial" );
          }
          {         RectLabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    RectLabelX.GDS.Set_Desc_1("RLBLBorderExpert-ONOFF-Tree-Signal");
                    RectLabelX.GDS.Set_Tip_3(STYLE_SOLID, 1, BORDER_FLAT);
                    RectLabelX.GDS.Set_Color_2(clrDarkSlateBlue, clrNONE);
                    RectLabelX.GDS.Set_Location_5(110 + 83, 1, 20, PANEL_INDENT_TOP + 3, CORNER_RIGHT_UPPER);
                    RectLabelX.GDS.Set_Chart_6();
                    RectLabelX.GDS.Set_Common_6(true, 10, false, false, false, "RLBLBorderExpert-ONOFF-Tree-Signal");
                    RectLabelX.Action(RectLabelX); //
                    //0//RLBL_Border.Create(Is_Create, Is_Move, "RLBLBorderExpert",  "Border", 100, (int)(1.6), 100, PANEL_INDENT_TOP + 3,
                    //0//CORNER_RIGHT_UPPER, ANCHOR_UPPER, True, BORDER_FLAT, clrDodgerBlue, clrNONE, 0, STYLE_SOLID, 1, 8, "Arial" );
          }
          {         RectLabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    RectLabelX.GDS.Set_Desc_1("RLBLBorderExpert-ONOFF-Array-Signal");
                    RectLabelX.GDS.Set_Tip_3(STYLE_SOLID, 1, BORDER_FLAT);
                    RectLabelX.GDS.Set_Color_2(clrDarkSlateBlue, clrNONE);
                    RectLabelX.GDS.Set_Location_5(110 + 104, 1, 20, PANEL_INDENT_TOP + 3, CORNER_RIGHT_UPPER);
                    RectLabelX.GDS.Set_Chart_6();
                    RectLabelX.GDS.Set_Common_6(true, 10, false, false, false, "RLBLBorderExpert-ONOFF-Array-Signal");
                    RectLabelX.Action(RectLabelX); //
                    //0//RLBL_Border.Create(Is_Create, Is_Move, "RLBLBorderExpert",  "Border", 100, (int)(1.6), 100, PANEL_INDENT_TOP + 3,
                    //0//CORNER_RIGHT_UPPER, ANCHOR_UPPER, True, BORDER_FLAT, clrDodgerBlue, clrNONE, 0, STYLE_SOLID, 1, 8, "Arial" );
          }
          {         RectLabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    RectLabelX.GDS.Set_Desc_1("RLBLBorderExpert-ONOFF-Trade-Config");
                    RectLabelX.GDS.Set_Tip_3(STYLE_SOLID, 1, BORDER_FLAT);
                    RectLabelX.GDS.Set_Color_2(clrMediumSeaGreen, clrNONE);
                    RectLabelX.GDS.Set_Location_5(110 + 125, 1, 20, PANEL_INDENT_TOP + 3, CORNER_RIGHT_UPPER);
                    RectLabelX.GDS.Set_Chart_6();
                    RectLabelX.GDS.Set_Common_6(true, 10, false, false, false, "RLBLBorderExpert-ONOFF-Trade-Config");
                    RectLabelX.Action(RectLabelX); //
                    //0//RLBL_Border.Create(Is_Create, Is_Move, "RLBLBorderExpert",  "Border", 100, (int)(1.6), 100, PANEL_INDENT_TOP + 3,
                    //0//CORNER_RIGHT_UPPER, ANCHOR_UPPER, True, BORDER_FLAT, clrDodgerBlue, clrNONE, 0, STYLE_SOLID, 1, 8, "Arial" );
          }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_COMPLEXTOOLS Error",  __LINE__, __FUNCTION__); //|
}///color

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_COMPLEXTOOLS::ValuSetTriangel()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-ChartController Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          datetime CD = Time[0];
          if(ObjectFind(0, "UseTriangle") >= 0)
          {         ObjectSet( "UseTriangle", OBJPROP_TIME3, CD);
                    ObjectSetDouble(0, "UseTriangle", OBJPROP_PRICE3, Close[0]); }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-ChartController Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_COMPLEXTOOLS::OnChartEvents(string FuncCom, const int id, const long & lparam, const double & dparam, const string & sparam, int LineCOM = 0, string FuncCome = "None")
{         //
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-ChartController Error",  __LINE__, __FUNCTION__); //|
          string Clicked = sparam;
          switch(id)
          {         case CHARTEVENT_OBJECT_CLICK:
                    {} break; //
                    case CHARTEVENT_MOUSE_MOVE:
                    {         //
                    } break; ////
                    case CHARTEVENT_CLICK:
                    {         //
                    } break; ////
                    case CHARTEVENT_CHART_CHANGE:
                    {         ///IS_EventIdCrosshair = false;
                              //Keyboard.ScanPreesKeys(CHARTEVENT_CHART_CHANGE);///must GetKeyState_VK_LBUTTON ==false
                    } break; ////
                    case CHARTEVENT_OBJECT_DRAG:
                    {         ///Keyboard.ScanPreesKeys(CHARTEVENT_OBJECT_DRAG);///must GetKeyState_VK_LBUTTON ==false
                    } break; ////
                    case CHARTEVENT_CUSTOM:
                    {         //if(EventIdCrosshair != 9000)EventIdCrosshair--;
                    }
//
          }//
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-ChartController Error",  __LINE__, __FUNCTION__); //|
}//
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_COMPLEXTOOLS::MOUSE_MOVE(string FuncCom, const int id, const long & lparam, const double & dparam, const string & sparam, int LineCOM = 0, string FuncCome = "None")
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-ChartController Error",  __LINE__, __FUNCTION__); //|
          if(KeyCHARTEVENT_MOUSE_MOVE) //---
          {         ////
          }//
}//
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void  C_COMPLEXTOOLS::CLICK(string FuncCom, const int id, const long & lparam, const double & dparam, const string & sparam, int LineCOM = 0, string FuncCome = "None")
{         //--- Prepare variables
          int      x     = (int)lparam;
          int      y     = (int)dparam;
          datetime dt    = 0;
          double   price = 0;
          int      window = 0;
//--- Convert the X and Y coordinates in terms of date/time
          if(ChartXYToTimePrice(0, x, y, window, dt, price))
          {         //PrintFormat("Window=%d X=%d  Y=%d  =>  Time=%s  Price=%G", window, x, y, TimeToString(dt), price);
                    //--- Perform reverse conversion: (X,Y) => (Time,Price)
                    if(ChartTimePriceToXY(0, window, dt, price, x, y))
                    {         //PrintFormat("Time=%s  Price=%G  =>  X=%d  Y=%d", TimeToString(dt), price, x, y);
                    }
                    else
                    {         // Print("ChartTimePriceToXY return error code: ", GetLastError());
                    }
                    //--- delete lines
                    C_STATICSUN::DeleteAnaliseAllObjectName(0, 0, 1, "V Line", __LINE__, FuncCome + __FUNCTION__);
                    C_STATICSUN::DeleteAnaliseAllObjectName(0, 0, 1, "H Line", __LINE__, FuncCome + __FUNCTION__);
                    //--- create horizontal and vertical lines of the crosshair
                    if(ObjectFind(0, "H Line") < 0)ObjectCreate(0, "H Line", OBJ_HLINE, window, dt, price);
                    if(ObjectFind(0, "V Line") < 0)ObjectCreate(0, "V Line", OBJ_VLINE, window, dt, price);
                    ChartRedraw(0); //
          }
          else
                    Print("ChartXYToTimePrice return error code: ", GetLastError());
          Print("+--------------------------------------------------------------+"); //
} //
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_COMPLEXTOOLS::OBJECT_CLICK(string FuncCom, const string & sparam)
{         color ColorOne                = clrOrange ;
          color ColorTwo                = clrFireBrick;
          color ColorTwo2               = clrFireBrick;
          color ColorLogo               = clrBlue;
          color ColorBody               = clrWhite;
          color ColorBodyMargine        = clrNavy;
          color ColorBodyText           = clrNavy;
          color ColorBodyCyrcle         = clrRed;
          //int   GoldVIPXindepend = + (200);
//====================================================================
} //
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_COMPLEXTOOLS::Update()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "C_TRADEPANEL",  __LINE__, __FUNCTION__); //|
          UPDATED               = false;
          ValuSetTriangel();
//==========================================================================
          string NameUseText            = "LBL_MenuPadsMainText-" + ct_Inform.TodayWeekMonthDesc(); ////LBL_MenuPadsMainText- Sep 17 FRIDAY
          string NameUseLeftO2          = "LBL_MenuPadsLeftO2-" + ct_Inform.TodayWeekMonthDesc(); ////LBL_MenuPadsMainText- Sep 17 FRIDAY
          color ColorDayBodyText        = clrAqua;//
//if(ColorDayBodyText == ObjectGetInteger(0, NameUse, OBJPROP_COLOR))return;//
//===========================================================================
// Alert(">LBL_MenuPadsMainText-" + ct_Inform.TodayWeekMonthDesc() + "<",NameUse); //ok
//===========================================================================
//============================================================================
          if(ObjectFind(0, NameUseText) >= 0)
          {         //=============================
                    if(ct_Drive.TDD.ct_Market_Symbol.Is_Running)
                    {         ColorDayBodyText = clrGreen; ObjectSetInteger(0, NameUseText, OBJPROP_COLOR, ColorDayBodyText);
                              ColorDayBodyText = clrGreen; ObjectSetInteger(0, NameUseLeftO2, OBJPROP_COLOR, ColorDayBodyText); //
                    }
                    else
                    {         ColorDayBodyText = clrOrange; ObjectSetInteger(0, NameUseText, OBJPROP_COLOR, ColorDayBodyText);//
                              ColorDayBodyText = clrOrange; ObjectSetInteger(0, NameUseLeftO2, OBJPROP_COLOR, ColorDayBodyText);////
                    }
                    //=============================
                    if((ct_Inform.TodayDesc() == " SUNDAY ") || (ct_Inform.TodayDesc() == " SATURDAY "))
                    {         ColorDayBodyText = clrRed; ObjectSetInteger(0, NameUseText, OBJPROP_COLOR, ColorDayBodyText);
                              ColorDayBodyText = clrRed; ObjectSetInteger(0, NameUseLeftO2, OBJPROP_COLOR, ColorDayBodyText);//
                    } //
          }//
          switch (0)
          {         case 8:     //if(UseCChart.EventMouseMove(true))Alert("mouse move ", __LINE__);
                    case 10:    //Messager();
                    case 11:    // WindowHandler(PERIOD_CURRENT);
                    case 121:   //ChartClick(ChartID(), NULL, NULL, NULL, NULL);
                    case 13:
                    case 223:   Line_01.HorizonlineX.HorizonlineX();;
                    default:    ________________________________________________________Xerorr.SuperviserX(_LastError, "-ChartRun default work",  __LINE__, __FUNCTION__); //
          }
          //==========================================================
          // SYS Timer Cheackup Start C_WINUSER32 App Enviroments<<<<|
          //==========================================================
          //
          UPDATED = true;
          //
          //==========================================================
          // SYS Timer Cheackup End C_WINUSER32 App Enviroments<<<<<<|
          //==========================================================
          if(!this.UPDATED)          {Alert("Complex.UPDATED: ", this.UPDATED);}
          ________________________________________________________Xerorr.SuperviserX(_LastError, "C_TRADEPANEL",  __LINE__, __FUNCTION__); //|
          return UPDATED;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_COMPLEXTOOLS::RSI(bool KeyCom = false)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_CHART Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          if(KeyCom)
          {
//--- input parameters
                    int         InpRSIPeriod ; // RSI Period
//--- buffers
                    double      ExtRSIBuffer[];
                    double      ExtPosBuffer[];
                    double      ExtNegBuffer[];
                    string short_name;
                    //=============================================
                    //--- input parameters
                    InpRSIPeriod = 14; // RSI Period
//--- buffers
//  ExtRSIBuffer ;
//  ExtPosBuffer ;
//  ExtNegBuffer ;
                    //=============================================
//--- 2 additional buffers are used for calculations.
//IndicatorBuffers(3);
//SetIndexBuffer(0, ExtRSIBuffer);
//SetIndexBuffer(1, ExtPosBuffer);
//SetIndexBuffer(2, ExtNegBuffer);
//--- set levels
//IndicatorSetInteger(INDICATOR_LEVELS, 2);
//IndicatorSetDouble(INDICATOR_LEVELVALUE, 0, 30);
//IndicatorSetDouble(INDICATOR_LEVELVALUE, 1, 70);
//--- set maximum and minimum for subwindow
//IndicatorSetDouble(INDICATOR_MINIMUM, 0);
//IndicatorSetDouble(INDICATOR_MAXIMUM, 100);
//--- indicator line
//SetIndexStyle(0, DRAW_LINE);
//SetIndexBuffer(0, ExtRSIBuffer);
//=========================================================
                    {         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_CHART Error",  __LINE__, __FUNCTION__); //|
//=========================================================|indicatorC()           //1.4\\\custom indicator block
//--- 2 additional buffers are used for calculations.
                              IndicatorBuffers(3);
                              SetIndexBuffer(0, ExtRSIBuffer);
                              SetIndexBuffer(1, ExtPosBuffer);
                              SetIndexBuffer(2, ExtNegBuffer);
//--- set levels
                              IndicatorSetInteger(INDICATOR_LEVELS, 2);
                              IndicatorSetDouble(INDICATOR_LEVELVALUE, 0, 30);
                              IndicatorSetDouble(INDICATOR_LEVELVALUE, 1, 70);
//--- set maximum and minimum for subwindow
                              IndicatorSetDouble(INDICATOR_MINIMUM, 0);
                              IndicatorSetDouble(INDICATOR_MAXIMUM, 100);
//--- indicator line
                              SetIndexStyle(0, DRAW_LINE);
                              SetIndexBuffer(0, ExtRSIBuffer);
//--- name for DataWindow and indicator subwindow label
                              short_name = "RSI(" + string(InpRSIPeriod) + ")";
                              IndicatorShortName(short_name);
                              SetIndexLabel(0, short_name);
//--- check for input
                              if(InpRSIPeriod < 2)
                              {         Print("Incorrect value for input variable InpRSIPeriod = ", InpRSIPeriod);
                                        //return(INIT_FAILED);
                              }
//---
                              SetIndexDrawBegin(0, InpRSIPeriod);
//--- initialization done
//return(INIT_SUCCEEDED);
                              ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_CHART Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
                              //return;//
                    }
//=========================================================
//--- name for DataWindow and indicator subwindow label
                    short_name = "RSI(" + string(InpRSIPeriod) + ")";
//IndicatorShortName(short_name);
//SetIndexLabel(0, short_name);
//--- check for input
                    if(InpRSIPeriod < 2)
                    {         Print("Incorrect value for input variable InpRSIPeriod = ", InpRSIPeriod); }
//---
//SetIndexDrawBegin(0, InpRSIPeriod);
//--- initialization done
//Alert("(3663)-"+InpRSIPeriod);
                    ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_CHART Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          }//
          return;//
}
//+------------------------------------------------------------------+
//|                                                                  |  Is_Create, Is_Move,
//+------------------------------------------------------------------+
void C_COMPLEXTOOLS::LongPanel(int WhichMode, bool IsKey, color ColorBG = clrNONE, string NameCom =  "None", int MoveX = 30, int MoveY = 180 - 2,
                               color clrBG = clrBlueViolet, int Angel = 0, int xCom = 0, int yCom = 0, int FontSize = 0)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_CHART Error",  __LINE__, NameCom + __FUNCTION__); //|
          int xlenght = 11;  int ylenght = 11; int Xi = 0; int Yi = 0;
          if(ColorBG == clrNONE)
          {         if(Angel == 0)
                    {         for(int i = 0; i < xlenght + xCom; i++)
                              {
                                        {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                                                  LabelX.GDS.Set_Desc_4( NameCom + string(i), "n", "Webdings", FontSize + 18);
                                                  LabelX.GDS.Set_Color_1(clrBG);
                                                  LabelX.GDS.Set_Location_5((int)(MoveX + (i * 5)), (int)(MoveY), Angel, CORNER_LEFT_UPPER, ANCHOR_CENTER);
                                                  LabelX.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + NameCom + string(i));
                                                  LabelX.GDS.Set_Chart_6();
                                                  LabelX.Action(LabelX); //
                                                  //0//LBL_.Create(Is_Create, Is_Move, NameCom + string(i), "n", (int)(MoveX + (i * 5)), (int)(MoveY),
                                                  //0//CORNER_LEFT_UPPER, ANCHOR_CENTER, false, clrBG, Angel, FontSize + 18, "Webdings"); //
                                        } //
                              }
                              //
                    } //
                    else
                    {         for(int i = 0; i < ylenght + yCom; i++)
                              {
                                        {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                                                  LabelX.GDS.Set_Desc_4( NameCom + string(i), "n", "Webdings", FontSize + 18);
                                                  LabelX.GDS.Set_Color_1(clrBG);
                                                  LabelX.GDS.Set_Location_5( (int)(MoveX), (int)(MoveY) + (i * 5), Angel, CORNER_LEFT_UPPER, ANCHOR_CENTER);
                                                  LabelX.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + NameCom + string(i));
                                                  LabelX.GDS.Set_Chart_6();
                                                  LabelX.Action(LabelX); //
                                                  //0//LBL_.Create(Is_Create, Is_Move, NameCom + string(i), "n", (int)(MoveX), (int)(MoveY) + (i * 5),
                                                  //0//CORNER_LEFT_UPPER, ANCHOR_CENTER, false, clrBG, Angel, FontSize + 18, "Webdings");//
                                        } //
                              }
                              //
                    }//
          } //
          else
          {         //
                    for(int i = 0; i < xlenght + xCom; i++) ObjectSetInteger(0, NameCom + string(i), OBJPROP_COLOR, ColorBG); //
                    ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_CHART Error",  __LINE__, NameCom + __FUNCTION__); //|
          }//
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_CHART Error",  __LINE__, NameCom + __FUNCTION__); //|
          return;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_COMPLEXTOOLS::Get_TextPanel(int WhichMode, bool IsKey, color ColorBG = clrNONE, string NameCom =  "None", int MoveX = 30, int MoveY = 180 - 2, color clrBG = clrBlueViolet,
                                   int Angel = 0,  int xCom = 0, int yCom = 0, int FontSize = 0)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_CHART Error",  __LINE__, __FUNCTION__); //|
          {         LongPanel(WhichMode, IsKey, ColorBG, NameCom + "BG",  MoveX, MoveY + 25 + 17, clrBG, Angel, -2 + xCom, yCom, -6 + FontSize); //
                    {         EditX.GDS.Set_Action_2(WhichMode, IsKey);
                              EditX.GDS.Set_Desc_4(NameCom, NameCom, "Arial Bold",  7 + FontSize);
                              EditX.GDS.Set_Self_2(alignDEF, readonlyDEF);
                              EditX.GDS.Set_Location_5((int)( MoveX - 5 + (FontSize + xCom) * 1.5), (int)(MoveY + 25 + 10), int(50 + ((FontSize + xCom) * 2.5)), 15, CORNER_LEFT_UPPER);     EditX.GDS.Set_Color_3(clrBG, clrBG, clrWhite);
                              EditX.GDS.Set_Common_6(false, 60, false, false, false, NameCom );
                              EditX.GDS.Set_Chart_6();
                              EditX.Action(EditX); //
                              //0//EDT_.Create(Is_Create, Is_Move, NameCom + "Edite", NameCom,
                              //0//(int)( MoveX - 5 + (FontSize + xCom) * 1.5), (int)(MoveY + 25 + 10), int(50 + ((FontSize + xCom) * 2.5)), 15,
                              //0// CORNER_LEFT_UPPER, ANCHOR_CENTER, false, clrBG, clrBG, clrWhite, 1, 1, Angel, ALIGN_CENTER, 7 + FontSize, "Arial Bold"); //
                    }
                    (xCom > 0) ? xCom += 11 : xCom = 11 - xCom; //
                    Set_BottumPanel(WhichMode, IsKey, 0, clrNONE, NameCom + "Ok", "a", (int)( (MoveX * 1) - 5 + xCom * 5 ), (int)(MoveY + 0), clrWhite, clrBG, Angel,  - 8, yCom, -1, "Webdings", 10, +4, -2); //
                    //int xCom = 0, int yCom = 0,    int FontSize = 0, string FontType = "Arial Bold",
          }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_CHART Error",  __LINE__, __FUNCTION__); //|
//CoolFormulator //>>>(int)( MoveX - 5 + (FontSize + xCom) * 1.5)
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_COMPLEXTOOLS::Set_TextPanel(int WhichMode, bool IsKey, int YSide = 0, color ColorBG = clrNONE, string NameCom =  "None", string DescCom =  "None",
                                   int MoveX = 30, int MoveY = 180 - 2, color clrBG = clrBlueViolet,
                                   int Angel = 0, int xCom = 0, int yCom = 0, int FontSize = 0, int MoveYDesc = 0, string FontType = "Arial Bold", int FontSizeDesc = 0)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_CHART Error",  __LINE__, __FUNCTION__); //|///
          if (clrNONE == ColorBG)
          {         LongPanel(WhichMode, IsKey, ColorBG, NameCom + "BG",  MoveX, MoveY + 25 + 17,  clrBG, Angel, -2 + xCom, yCom, -6 + FontSize); //
                    (xCom > 0) ? xCom += 11 - 2 : xCom = 11 - xCom - 2; //
                    (yCom > 0) ? yCom += 11 - 2 : yCom = 11 - yCom - 2; //
                    if(YSide == 1)MoveYDesc = 5; if(YSide == -1)MoveYDesc = (int)(MoveYDesc + 2 * 4.5); if(YSide == 0)MoveYDesc = 7;
                    if(Angel == 0)
                    {
                              {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                                        LabelX.GDS.Set_Desc_4( NameCom + "Label", DescCom, FontType, 7 + FontSize + FontSizeDesc);
                                        LabelX.GDS.Set_Color_1(clrWhite);
                                        LabelX.GDS.Set_Location_5((int)( MoveX - 5 + ( xCom * 2.5) ), (int)(MoveY + 25 + 10 + MoveYDesc), Angel, CORNER_LEFT_UPPER, ANCHOR_CENTER);
                                        LabelX.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + NameCom + "Label");
                                        LabelX.GDS.Set_Chart_6();
                                        LabelX.Action(LabelX); //
                                        //0//LBL_.Create(Is_Create, Is_Move, NameCom + "Label", DescCom, (int)( MoveX - 5 + ( xCom * 2.5) ), (int)(MoveY + 25 + 10 + MoveYDesc),
                                        //0//CORNER_LEFT_UPPER, ANCHOR_CENTER, false, clrWhite, Angel, 7 + FontSize + FontSizeDesc, FontType); //
                              }//
                    }//
                    else
                    {
                              {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                                        LabelX.GDS.Set_Desc_4( NameCom + "Label", DescCom, FontType, 7 + FontSize + FontSizeDesc);
                                        LabelX.GDS.Set_Color_1(clrWhite);
                                        LabelX.GDS.Set_Location_5( (int)( MoveX - (5 * 0) + ( yCom * 2.5 * 0) ), (int)(MoveY + 25 + 10 + MoveYDesc + (yCom * 2.5)), Angel, CORNER_LEFT_UPPER, ANCHOR_CENTER);
                                        LabelX.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + NameCom + "Label");
                                        LabelX.GDS.Set_Chart_6();
                                        LabelX.Action(LabelX); //
                                        //0//LBL_.Create(Is_Create, Is_Move, NameCom + "Label", DescCom,
                                        //0//(int)( MoveX - (5 * 0) + ( yCom * 2.5 * 0) ), (int)(MoveY + 25 + 10 + MoveYDesc + (yCom * 2.5)),
                                        //0//CORNER_LEFT_UPPER, ANCHOR_CENTER, false, clrWhite, Angel, 7 + FontSize + FontSizeDesc, FontType); //
                              }//
                    }
                    //======================================================================================================================================================================
                    //CoolFormulator //>>>(int)( MoveX - 5 + (FontSize + xCom) * 1.5)
                    ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_CHART Error",  __LINE__, __FUNCTION__); //
                    return;//
          }//
          else
          {         LongPanel(WhichMode, IsKey, ColorBG, NameCom + "BG",  MoveX, MoveY + 25 + 17,  clrBG, Angel, -2 + xCom, yCom, -6 + FontSize); //
                    ObjectSetString(0, NameCom + "Label", OBJPROP_TEXT, DescCom); //
                    ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_CHART Error",  __LINE__, __FUNCTION__); //|
                    return;//
          }//
//LBL
//bool Is_Create = false,
//const string Label_Name = "Label_Name", const string Description = "Label_Description", const int XCordinate = 10,
//const int YCordinate = 10, const ENUM_BASE_CORNER Corner = CORNER_RIGHT_LOWER, ENUM_ANCHOR_POINT Anchor = ANCHOR_UPPER, bool Background = false,
//color  DescColorIN = clrYellow, const double Angle = 0,
//const int FontSize = 7, const string Font = "Arial", long ZORDER = 10, int LineCOM = 0, string FuncCome = "None"
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_CHART Error",  __LINE__, __FUNCTION__); //|
}
//+------------------------------------------------------------------+
//|                                                                  |mode, IsKey
//+------------------------------------------------------------------+
void C_COMPLEXTOOLS::Set_BottumPanel(int WhichMode, bool IsKey, int YSide = 0, color ColorBG = clrNONE, string NameCom =  "None", string DescCom =  "None",
                                     int MoveX = 30, int MoveY = 180 - 2, color clrBG = clrBlueViolet, color ColorCycle = clrBlue,
                                     int Angel = 0, int xCom = 0, int yCom = 0, int FontSize = 0, string FontType = "Arial Bold", int FontSizeDesc = 0, int MoveXDesc = 0, int MoveYBG3 = 0)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_CHART Error",  __LINE__, __FUNCTION__); //|
          //-------------------------------------------------------------------------------------------------------------------------------------------------------------------
          {         int MoveYDesc = 10;
                    if(YSide == 1)MoveYDesc = 5; if(YSide == -1)MoveYDesc = 10; if(YSide == 0)MoveYDesc = 7;
                    //-------------------------------------------------------------------------------------------------------------------------------------------------------------------
                    LongPanel(WhichMode, IsKey, ColorBG, NameCom + "BG2", MoveX - 0, MoveY + 25 + 17 + 0,             ColorCycle,     Angel, -2 + xCom, yCom, -3 + FontSize); //
                    LongPanel(WhichMode, IsKey, ColorBG, NameCom + "BG",  MoveX,     MoveY + 25 + 17,                 clrBG,          Angel, -2 + xCom, yCom, -6 + FontSize); //
                    LongPanel(WhichMode, IsKey, ColorBG, NameCom + "BG3", MoveX,     MoveY + 25 + 17 + 1 + MoveYBG3,  ColorCycle,     Angel, -2 + xCom, yCom, -9 + FontSize); //
                    //-------------------------------------------------------------------------------------------------------------------------------------------------------------------
                    {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                              LabelX.GDS.Set_Desc_4( NameCom + "Label", DescCom, FontType, 7 + FontSize + FontSizeDesc);
                              LabelX.GDS.Set_Color_1(clrWhite);
                              LabelX.GDS.Set_Location_5( (int)( MoveX - 5 + (FontSize + xCom ) * 1.5) + 25 - (int)(FontSizeDesc * 0.9) + MoveXDesc, (int)(MoveY + 25 + 10 + MoveYDesc), Angel, CORNER_LEFT_UPPER, ANCHOR_CENTER);
                              LabelX.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + NameCom + "Label");
                              LabelX.GDS.Set_Chart_6();
                              LabelX.Action(LabelX); //
                              //0// LBL_.Create(WhichMode, IsKey, NameCom + "Label", DescCom,
                              //0// (int)( MoveX - 5 + (FontSize + xCom ) * 1.5) + 25 - (int)(FontSizeDesc * 0.9) + MoveXDesc, (int)(MoveY + 25 + 10 + MoveYDesc),
                              //0// CORNER_LEFT_UPPER, ANCHOR_CENTER, false, clrWhite, Angel, 7 + FontSize + FontSizeDesc, FontType); //
                    }//
                    //-------------------------------------------------------------------------------------------------------------------------------------------------------------------
          }
          //-------------------------------------------------------------------------------------------------------------------------------------------------------------------
//CoolFormulator //>>>(int)( MoveX - 5 + (FontSize + xCom) * 1.5)
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_CHART Error",  __LINE__, __FUNCTION__); //|
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_COMPLEXTOOLS::BottumX(int WhichMode, bool IsKey, int Type = 0, string NameCom = "", int MoveX = 0, int MoveY = 0, color clrBodyMargine = clrFireBrick, color clrBodyCyrcle = clrRed, color clrBodyLogo = clrWhite, int FontSizer = 0)
{         //MoveX = 0;   MoveY = 0;
          int MoveLogo = 0; int MoveXLogo = 0; int MoveYLogo = 0; int FontChange = MathAbs(FontSizer);
          if(FontSizer != 0) {MoveXLogo = FontChange; MoveYLogo = FontChange; MoveLogo = FontChange / 2; }
          {         if(Type == MODE_EXIT)
                    {         //--- LabelX--_Exit_LeftO1---//
                              {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                                        LabelX.GDS.Set_Desc_4(NameCom + "_Exit_LeftO1", "n", "Webdings", 13);
                                        LabelX.GDS.Set_Color_1(clrBodyMargine);
                                        LabelX.GDS.Set_Location_5( 2 + MoveX, MoveY + 1, 0, CORNER_LEFT_UPPER, ANCHOR_RIGHT);
                                        LabelX.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-_Exit_LeftO1");
                                        LabelX.GDS.Set_Chart_6();
                                        LabelX.Action(LabelX); //
                                        //0// LBL_.Create(Is_Create, Is_Move, NameCom + "_Exit_LeftO1", "n",
                                        //0//  2 + MoveX, MoveY + 1, CORNER_LEFT_UPPER, ANCHOR_RIGHT, false, clrBodyMargine, 0, 13, "Webdings"); //
                              }
                              //--- LabelX--_Exit_LeftO2---//
                              {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                                        LabelX.GDS.Set_Desc_4(NameCom + "_Exit_LeftO2", "n", "Webdings", 10);
                                        LabelX.GDS.Set_Color_1(clrBodyCyrcle);
                                        LabelX.GDS.Set_Location_5( 0 + MoveX, MoveY + 0, 0, CORNER_LEFT_UPPER, ANCHOR_RIGHT);
                                        LabelX.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-_Exit_LeftO2");
                                        LabelX.GDS.Set_Chart_6();
                                        LabelX.Action(LabelX); //
                                        //0// LBL_.Create(Is_Create, Is_Move, NameCom + "_Exit_LeftO2", "n",
                                        //0// 0 + MoveX, MoveY + 0, CORNER_LEFT_UPPER, ANCHOR_RIGHT, false, clrBodyCyrcle, 0, 10, "Webdings"); //
                              }
                              //--- LabelX--_Exit_Logo---//
                              {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                                        LabelX.GDS.Set_Desc_4(NameCom + "_Exit_Logo", "r", "Webdings", 10 + FontSizer);
                                        LabelX.GDS.Set_Color_1(clrBodyLogo);
                                        LabelX.GDS.Set_Location_5( -MoveLogo + 2 + MoveX, MoveY + 1 - MoveLogo, 0, CORNER_LEFT_UPPER, ANCHOR_RIGHT);
                                        LabelX.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-_Exit_Logo");
                                        LabelX.GDS.Set_Chart_6();
                                        LabelX.Action(LabelX); //
                                        //0// LBL_.Create(Is_Create, Is_Move, NameCom + "_Exit_Logo", "r",
                                        //0// 0 + MoveX - MoveLogo, MoveY + 0 - MoveLogo, CORNER_LEFT_UPPER, ANCHOR_RIGHT, false, clrBodyLogo, 0, 10 + FontSizer, "Webdings"); //
                              } //
                              return;//
                    } //
                    if(Type == MODE_MOVE)
                    {         //--- LabelX--_Move_LeftO1---//
                              {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                                        LabelX.GDS.Set_Desc_4(NameCom + "_Move_LeftO1", "n", "Webdings", 13);
                                        LabelX.GDS.Set_Color_1(clrBodyMargine);
                                        LabelX.GDS.Set_Location_5( 2 + MoveX, MoveY + 1, 0, CORNER_LEFT_UPPER, ANCHOR_RIGHT);
                                        LabelX.GDS.Set_Common_6(false, 50, false, false, false, NameCom + "tooltip-_Move_LeftO1");
                                        LabelX.GDS.Set_Chart_6();
                                        LabelX.Action(LabelX); //
                                        //0// LBL_.Create(Is_Create, Is_Move, NameCom + "_Move_LeftO1", "n",
                                        //0// 2 + MoveX, MoveY + 1, CORNER_LEFT_UPPER, ANCHOR_RIGHT, false, clrBodyMargine, 0, 13, "Webdings"); //
                              } //
                              //--- LabelX--_Move_LeftO2---//
                              {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                                        LabelX.GDS.Set_Desc_4(NameCom + "_Move_LeftO2", "n", "Webdings", 10);
                                        LabelX.GDS.Set_Color_1(clrBodyCyrcle);
                                        LabelX.GDS.Set_Location_5( 0 + MoveX, MoveY + 0, 0, CORNER_LEFT_UPPER, ANCHOR_RIGHT);
                                        LabelX.GDS.Set_Common_6(false, 50, false, false, false, NameCom + "tooltip-_Move_LeftO2");
                                        LabelX.GDS.Set_Chart_6();
                                        LabelX.Action(LabelX); //
                                        //0// LBL_.Create(Is_Create, Is_Move, NameCom + "_Move_LeftO2", "n",
                                        //0// 0 + MoveX, MoveY + 0, CORNER_LEFT_UPPER, ANCHOR_RIGHT, false, clrBodyCyrcle, 0, 10, "Webdings"); //
                              }
                              //--- LabelX--_Move_Logo---//
                              {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                                        LabelX.GDS.Set_Desc_4(NameCom + "_Move_Logo", "l", "Webdings", 10 + FontSizer);
                                        LabelX.GDS.Set_Color_1(clrBodyLogo);
                                        LabelX.GDS.Set_Location_5( -MoveLogo + 0 + MoveX, MoveY + 0 - MoveLogo, 0, CORNER_LEFT_UPPER, ANCHOR_RIGHT);
                                        LabelX.GDS.Set_Common_6(false, 50, false, false, false, NameCom + "tooltip-_Move_Logo");
                                        LabelX.GDS.Set_Chart_6();
                                        LabelX.Action(LabelX); //
                                        //0// LBL_.Create(Is_Create, Is_Move, NameCom + "_Move_Logo", "l",
                                        //0// 0 + MoveX - MoveLogo, MoveY + 0 - MoveLogo, CORNER_LEFT_UPPER, ANCHOR_RIGHT, false, clrBodyLogo, 0, 10 + FontSizer, "Webdings"); //
                              } //
                              return;//
                    } //
                    if(Type == MODE_MINI)
                    {         //--- LabelX--_Mini_LeftO1---//
                              {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                                        LabelX.GDS.Set_Desc_4(NameCom + "_Mini_LeftO1", "n", "Webdings", 13);
                                        LabelX.GDS.Set_Color_1(clrBodyMargine);
                                        LabelX.GDS.Set_Location_5( 2 + MoveX, MoveY + 1, 0, CORNER_LEFT_UPPER, ANCHOR_RIGHT);
                                        LabelX.GDS.Set_Common_6(false, 50, false, false, false, NameCom + "tooltip-_Mini_LeftO1");
                                        LabelX.GDS.Set_Chart_6();
                                        LabelX.Action(LabelX); //
                                        //0// LBL_.Create(Is_Create, Is_Move, NameCom + "_Mini_LeftO1", "n",
                                        //0// 2 + MoveX, MoveY + 1, CORNER_LEFT_UPPER, ANCHOR_RIGHT, false, clrBodyMargine, 0, 13, "Webdings"); //
                              } //
                              //--- LabelX--_Mini_LeftO2---//
                              {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                                        LabelX.GDS.Set_Desc_4(NameCom + "_Mini_LeftO2", "n", "Webdings", 10);
                                        LabelX.GDS.Set_Color_1(clrBodyCyrcle);
                                        LabelX.GDS.Set_Location_5( 0 + MoveX, MoveY + 0, 0, CORNER_LEFT_UPPER, ANCHOR_RIGHT);
                                        LabelX.GDS.Set_Common_6(false, 50, false, false, false, NameCom + "tooltip-_Mini_LeftO2");
                                        LabelX.GDS.Set_Chart_6();
                                        LabelX.Action(LabelX); //
                                        //0//  LBL_.Create(Is_Create, Is_Move, NameCom + "_Mini_LeftO2", "n",
                                        //0//  0 + MoveX, MoveY + 0, CORNER_LEFT_UPPER, ANCHOR_RIGHT, false, clrBodyCyrcle, 0, 10, "Webdings"); //
                              }
                              //--- LabelX--_Mini_Logo---//
                              {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                                        LabelX.GDS.Set_Desc_4(NameCom + "_Mini_Logo", "0", "Webdings", 10 + FontSizer);
                                        LabelX.GDS.Set_Color_1(clrBodyLogo);
                                        LabelX.GDS.Set_Location_5( -MoveLogo + 0 + MoveX, MoveY + 0 - MoveLogo, 0, CORNER_LEFT_UPPER, ANCHOR_RIGHT);
                                        LabelX.GDS.Set_Common_6(false, 50, false, false, false, NameCom + "tooltip-_Mini_Logo");
                                        LabelX.GDS.Set_Chart_6();
                                        LabelX.Action(LabelX); //
                                        //0//   LBL_.Create(Is_Create, Is_Move, NameCom + "_Mini_Logo", "0",
                                        //0//  0 + MoveX - MoveLogo, MoveY + 0 - MoveLogo, CORNER_LEFT_UPPER, ANCHOR_RIGHT, false, clrBodyLogo, 0, 10 + FontSizer, "Webdings"); //
                              }//
                              return;//
                    } //
                    if(Type == MODE_REPOS)
                    {         //--- LabelX--_RePos_LeftO1---//
                              {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                                        LabelX.GDS.Set_Desc_4(NameCom + "_RePos_LeftO1", "n", "Webdings", 13);
                                        LabelX.GDS.Set_Color_1(clrBodyMargine);
                                        LabelX.GDS.Set_Location_5( 2 + MoveX, MoveY + 1, 0, CORNER_LEFT_UPPER, ANCHOR_RIGHT);
                                        LabelX.GDS.Set_Common_6(false, 50, false, false, false, NameCom + "tooltip-_RePos_LeftO1");
                                        LabelX.GDS.Set_Chart_6();
                                        LabelX.Action(LabelX); //
                                        //0// LBL_.Create(Is_Create, Is_Move, NameCom + "_RePos_LeftO1", "n",
                                        //0// 2 + MoveX, MoveY + 1, CORNER_LEFT_UPPER, ANCHOR_RIGHT, false, clrBodyMargine, 0, 13, "Webdings"); //
                              } //
                              //--- LabelX--_RePos_LeftO2---//
                              {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                                        LabelX.GDS.Set_Desc_4(NameCom + "_RePos_LeftO2", "n", "Webdings", 10);
                                        LabelX.GDS.Set_Color_1(clrBodyCyrcle);
                                        LabelX.GDS.Set_Location_5( 0 + MoveX, MoveY + 0, 0, CORNER_LEFT_UPPER, ANCHOR_RIGHT);
                                        LabelX.GDS.Set_Common_6(false, 50, false, false, false, NameCom + "tooltip-_RePos_LeftO2");
                                        LabelX.GDS.Set_Chart_6();
                                        LabelX.Action(LabelX); //
                                        //0// LBL_.Create(Is_Create, Is_Move, NameCom + "_RePos_LeftO2", "n",
                                        //0/ 0 + MoveX, MoveY + 0, CORNER_LEFT_UPPER, ANCHOR_RIGHT, false, clrBodyCyrcle, 0, 10, "Webdings"); //
                              }
                              //--- LabelX--_RePos_Logo---//
                              {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                                        LabelX.GDS.Set_Desc_4(NameCom + "_RePos_Logo", "n", "Webdings", 10 + FontSizer);
                                        LabelX.GDS.Set_Color_1(clrBodyLogo);
                                        LabelX.GDS.Set_Location_5( -MoveLogo + 0 + MoveX, MoveY + 0 - MoveLogo, 0, CORNER_LEFT_UPPER, ANCHOR_RIGHT);
                                        LabelX.GDS.Set_Common_6(false, 50, false, false, false, NameCom + "tooltip-_RePos_Logo");
                                        LabelX.GDS.Set_Chart_6();
                                        LabelX.Action(LabelX); //
                                        //0// LBL_.Create(Is_Create, Is_Move, NameCom + "_RePos_Logo", "n",
                                        //0// 0 + MoveX - MoveLogo, MoveY + 0 - MoveLogo, CORNER_LEFT_UPPER, ANCHOR_RIGHT, false, clrBodyLogo, 0,  10 + FontSizer, "Webdings"); //
                              } //
                              return;//
                    }//
          }//
          return;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_COMPLEXTOOLS::BottumXAllMove(int WhichMode, bool IsKey, string NameCom, bool Is_Vertical, bool Is_CreateMini, int MoveX, int MoveY)
{         if(!Is_Vertical)
          {         BottumX(WhichMode,  IsKey, MODE_REPOS,  NameCom + "RePos", 72 + MoveX, MoveY + 0,  clrFireBrick, clrRed, clrWhite, -2); //
                    BottumX(WhichMode,  IsKey, MODE_EXIT,   NameCom + "Exit",  54 + MoveX, MoveY + 0, clrFireBrick, clrRed, clrWhite);  //
                    BottumX(WhichMode,  IsKey, MODE_MOVE,   NameCom + "Move",  36 + MoveX, MoveY + 0, clrFireBrick, clrRed, clrWhite); //
                    BottumX(WhichMode,  IsKey, MODE_MINI,   NameCom + "Mini",  18 + MoveX, MoveY + 0, clrFireBrick, clrRed, clrWhite); //
          }
          else
          {         BottumX(WhichMode,  IsKey,  MODE_REPOS, NameCom + "RePos", 0 + MoveX, MoveY + 18, clrFireBrick, clrRed, clrWhite, -2); //
                    BottumX(WhichMode,  IsKey,  MODE_EXIT,  NameCom + "Exit",  0 + MoveX, MoveY + 36, clrFireBrick, clrRed, clrWhite);  //
                    BottumX(WhichMode,  IsKey,  MODE_MOVE,  NameCom + "Move",  0 + MoveX, MoveY + 54, clrFireBrick, clrRed, clrWhite); //
                    BottumX(WhichMode,  IsKey,  MODE_MINI,  NameCom + "Mini",  0 + MoveX, MoveY + 72, clrFireBrick, clrRed, clrWhite); //
          }
          return true;//
}//
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_COMPLEXTOOLS::LBL_ping_reflesh()
{         //--- graphical lable show ping reflesh
//--- LabelX--_RePos_Logo---//
          {         LabelX.GDS.Set_Action_2(MODE_CREATE, true);
                    LabelX.GDS.Set_Desc_4( "PING", "Terminal.fPING_LASTdesc()", "Tahoma", 200);
                    LabelX.GDS.Set_Color_1(Utilities.TransparentColor());
                    LabelX.GDS.Set_Location_5( ChartData_ChartFrame.ChartMiddleX(), ChartData_ChartFrame.ChartMiddleY(), 0, CORNER_LEFT_UPPER, ANCHOR_RIGHT);
                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-PING");
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
                    //0// gLBL_.OBJ.CreateL(0, "PING", 0,
                    //0// Dev_Chart_Window.ChartMiddleX(), Dev_Chart_Window.ChartMiddleY(), CORNER_LEFT_UPPER,
                    //0//  Terminal.fPING_LASTdesc(), "Tahoma", 200, Utilities.TransparentColor(), 0, ANCHOR_CENTER, true, false, true, 0, "\n");
          } //
          Sleep(1000);
          MqlObject.Delete( "PING");//
} //
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|             Class C_COMPLEXTOOLS     BEGIN                       |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
