//+------------------------------------------------------------------+
//|                        Cg_DevTextsButton.mqh                     |
//+------------------------------------------------------------------+
//||   ||||||||||             Cg_DevTextsButton.mqh                 ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class Cg_DevTextsButton : public Cg_TextsButton
{         //--------------------------------------------------------------------------------------------------------------------------------------------
public:
          Cg_TextsLabel LBL_CycleBotton;
          //--------------------------------------------------------------------------------------------------------------------------------------------
          //---NotGeneric class defined yet ---/// ChartObj<Sg_BUTTON, CChartObjectButton, Cg_TextsButton> gLBL_CycleBotton; //---'ChartObj' - unexpected token, probably type is missing? oTextsButton.mqh    426       11
          void          LBL_MoveCycle(int WhichMode = MODE_CREATE, bool IsKey = false, string NameCom = "--",  int SaveMoveXCom = 0, int SaveMoveYCom = 0, int MoveX = 0, int MoveY = 0, color ColorBody = clrYellow, color ColorBodyMargine = clrWhite, color ColorBodyText = clrWhite, color ColorBodyCyrcle = clrRed, string Desc = "v", int FontSizeDesc = 0);
          //--------------------------------------------------------------------------------------------------------------------------------------------
          void          BTNCycle(int WhichMode = MODE_CREATE, bool IsKey = false, string NameCom = "", string NameDescCom = "", int MoveX = 0, int MoveY = 0,
                                 const ENUM_BASE_CORNER Corner = CORNER_LEFT_UPPER,  ENUM_ANCHOR_POINT Anchor = ANCHOR_RIGHT, bool Background = false,
                                 color  ColorBodyMargine = clrDarkSlateGray, color  ColorBodyCyrcle = clrRed,color  ColorLogo = clrRed, const double Angle = 0,
                                 int FontSizeAdjust = 0, int FontSize = 0,   string Font = "Arial" , int Offset_X = 0, int Offset_Y = 0);
          //--------------------------------------------------------------------------------------------------------------------------------------------
          void          BTN__Cycle__Long(int WhichMode, bool IsKey, string NameCom = "", string NameDescCom = "", int MoveX = 0, int MoveY = 0,
                                         const ENUM_BASE_CORNER Corner = CORNER_LEFT_UPPER,  ENUM_ANCHOR_POINT Anchor = ANCHOR_RIGHT, bool Background = false,
                                         color  ColorBodyMargine = clrDarkSlateGray, color  ColorBodyCyrcle = clrRed, const double Angle = 0,   int FontSizeAdjust = 0, int FontSize = 0,   string Font = "Arial", int FontX = 0, int FontY = 0  );
          //--------------------------------------------------------------------------------------------------------------------------------------------
};

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Cg_DevTextsButton::LBL_MoveCycle(int WhichMode = MODE_CREATE, bool IsKey = false, string NameCom = "--",  int SaveMoveXCom = 0, int SaveMoveYCom = 0, int MoveX = 0, int MoveY = 0, color ColorBody = clrYellow, color ColorBodyMargine = clrWhite, color ColorBodyText = clrWhite, color ColorBodyCyrcle = clrRed, string Desc = "v", int FontSizeDesc = 0)
{         //
          //--- LBL_CycleBotton MoveLeftO1---//
          {         LBL_CycleBotton.GDS.Set_Action_2(WhichMode, IsKey);
                    LBL_CycleBotton.GDS.Set_Desc_4("MoveLeftO1" + NameCom, "n", "Webdings", 13 - 2);
                    LBL_CycleBotton.GDS.Set_Color_1(ColorBodyMargine);
                    LBL_CycleBotton.GDS.Set_Location_5( MoveX + SaveMoveXCom + (int)(108) + (-34), (-12) + (int)(102) + MoveY +  SaveMoveYCom, 0, CORNER_LEFT_UPPER, ANCHOR_RIGHT);
                    LBL_CycleBotton.GDS.Set_Common_6(false, 10, false, false, false, LabelDEF_tooltip + "MoveLeftO1" + NameCom);
                    LBL_CycleBotton.GDS.Set_Chart_6();
                    LBL_CycleBotton.Action(LBL_CycleBotton); // LBL_CycleBotton.sLabel, LBL_CycleBotton.oLabel
                    //0// LBL_CycleBotton.Action(WhichMode, IsKey, "MoveLeftO1" + NameCom, "n",
                    //0// MoveX + SaveMoveXCom + (int)(108) + (-34), (-12) + (int)(102) + MoveY +  SaveMoveYCom,
                    //0// CORNER_LEFT_UPPER, ANCHOR_RIGHT, false, ColorBodyMargine, 0, 13 - 2, "Webdings"); //
          }
          //--- LBL_CycleBotton MoveLeftO2---//
          {         LBL_CycleBotton.GDS.Set_Action_2(WhichMode, IsKey);
                    LBL_CycleBotton.GDS.Set_Desc_4("MoveLeftO2" + NameCom, "n", "Webdings", 10 - 2);
                    LBL_CycleBotton.GDS.Set_Color_1(ColorBodyCyrcle);
                    LBL_CycleBotton.GDS.Set_Location_5( MoveX + SaveMoveXCom + (int)(106) + (-34), (-12) + (int)(101) + MoveY +  SaveMoveYCom, 0, CORNER_LEFT_UPPER, ANCHOR_RIGHT);
                    LBL_CycleBotton.GDS.Set_Common_6(false, 10, false, false, false, LabelDEF_tooltip + "MoveLeftO2"  + NameCom);
                    LBL_CycleBotton.GDS.Set_Chart_6();
                    LBL_CycleBotton.Action(LBL_CycleBotton); ///--- pass to parent func
                    //0//
                    //0// LBL_CycleBotton.Action(WhichMode, IsKey, "MoveLeftO2" + NameCom, "n",
                    //0// MoveX + SaveMoveXCom + (int)(106) + (-34), (-12) + (int)(101) + MoveY +  SaveMoveYCom,
                    //0// CORNER_LEFT_UPPER, ANCHOR_RIGHT, false, ColorBodyCyrcle, 0, 10 - 2, "Webdings"); //
          }
          //--- LBL_CycleBotton MoveLogo---//
          {         LBL_CycleBotton.GDS.Set_Action_2(WhichMode, IsKey);
                    LBL_CycleBotton.GDS.Set_Desc_4("MoveLogo" + NameCom, Desc, "Wingdings", 7 + 2 + FontSizeDesc);
                    LBL_CycleBotton.GDS.Set_Color_1(ColorBodyText);
                    LBL_CycleBotton.GDS.Set_Location_5( MoveX + SaveMoveXCom + (int)(106) + (-34), (-12) + (int)(103) + MoveY +  SaveMoveYCom,  0, CORNER_LEFT_UPPER, ANCHOR_RIGHT);
                    LBL_CycleBotton.GDS.Set_Common_6(false, 10, false, false, false, LabelDEF_tooltip + Desc  + NameCom);
                    LBL_CycleBotton.GDS.Set_Chart_6();
                    LBL_CycleBotton.Action(LBL_CycleBotton); //
                    //0//
                    //0// LBL_CycleBotton.Action(WhichMode, IsKey, "MoveLogo"   + NameCom, Desc,
                    //0// MoveX + SaveMoveXCom + (int)(106) + (-34), (-12) + (int)(103) + MoveY +  SaveMoveYCom,
                    //0// CORNER_LEFT_UPPER, ANCHOR_RIGHT, false, ColorBodyText, 0, 7 + 2 + FontSizeDesc, "Wingdings"); //
          }
//
//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Cg_DevTextsButton::BTNCycle(int WhichMode = MODE_CREATE, bool IsKey = false,
                                 string NameCom = "", string NameDescCom = "",
                                 int MoveX = 0, int MoveY = 0,
                                 const ENUM_BASE_CORNER Corner = CORNER_LEFT_UPPER,  ENUM_ANCHOR_POINT Anchor = ANCHOR_RIGHT, bool Background = false,
                                 color  ColorBodyMargine = clrDarkSlateGray, color  ColorBodyCyrcle = clrRed,color  ColorLogo = clrRed,
                                 const double Angle = 0, int FontSizeAdjust = 0, int FontSize = 0, string Font = "Arial", int Offset_X = 0, int Offset_Y = 0)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-ChartController Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          //{         Sg_LABEL sLBL_CycleBotton;
          //          //
          //          bool res = false; res = sLBL_CycleBotton.Set_Desc_4("LeftO1-" + NameCom, "n", "Webdings", FontSizeAdjust + 13);
          //          res = sLBL_CycleBotton.Set_Location_5(100 + MoveX, MoveY + 100, Angle, Corner, Anchor);
          //          res = sLBL_CycleBotton.Set_Color_1(ColorBodyMargine);
          //          res = sLBL_CycleBotton.Set_Common_6(Background, 10, false, false, false, NameCom); res = sLBL_CycleBotton.Set_Chart_6();
          //          LBL_CycleBotton.Action(WhichMode, IsKey, sLBL_CycleBotton); //
          //}//
          ///--- LabelX.LeftO1-"
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4("LeftO1-" + NameCom, "n", "Webdings", FontSizeAdjust + 13);
                    LabelX.GDS.Set_Color_1(ColorBodyMargine);
                    LabelX.GDS.Set_Location_5(100 + MoveX, MoveY + 100, Angle, Corner, Anchor);
                    LabelX.GDS.Set_Common_6(Background, 50, false, false, false, LabelDEF_tooltip + "LeftO1-" + NameCom);
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
                    //0// //LBL_CycleBotton.Action(); //mode, IsKey, "LeftO1-" + NameCom, "n", MoveX + 100, MoveY + 100,
                    //0//Corner, Anchor, Background, ColorBodyMargine, Angle, FontSizeAdjust + 13, "Webdings"
          } //
          ///--- LabelX.LeftO2-"
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4("LeftO2-" + NameCom, "n", "Webdings", FontSizeAdjust + 10);
                    LabelX.GDS.Set_Color_1(ColorBodyCyrcle);
                    LabelX.GDS.Set_Location_5(98 + MoveX, MoveY + 100, Angle, Corner, Anchor);
                    LabelX.GDS.Set_Common_6(Background, 50, false, false, false, LabelDEF_tooltip + "LeftO2-" + NameCom);
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX);//
                    //0// LBL_CycleBotton.Action(); //mode, IsKey,  "LeftO2-" + NameCom, "n", MoveX + 98, MoveY + 99,
                    //0// Corner, Anchor, Background, ColorBodyCyrcle, Angle, FontSizeAdjust + 10, "Webdings"
          } //
          ///--- LabelX.Logo-"
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4("Logo-" + NameCom, NameDescCom, Font, FontSize + 7);
                    LabelX.GDS.Set_Color_1(ColorLogo);
                    LabelX.GDS.Set_Location_5(98 + MoveX + Offset_X, 100 + MoveY + Offset_Y, Angle, Corner, Anchor); /// + (int)(1.22 * MoveX) 108
                    LabelX.GDS.Set_Common_6(Background, 50, false, false, false, LabelDEF_tooltip + "Logo-" + NameCom);
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
                    //0// LBL_CycleBotton.Action();//mode, IsKey,  "Logo-"   + NameCom,  NameDescCom, (int)(MoveX * 1.22) + 96, (int)(MoveY * 1.03) + 98,
                    //0// Corner, Anchor, Background, clrWhite, Angle,  FontSize + 7, Font
          } //
          //
          //
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-ChartController Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Cg_DevTextsButton::BTN__Cycle__Long(int WhichMode, bool IsKey, string NameCom = "", string NameDescCom = "", int MoveX = 0, int MoveY = 0,
                    const ENUM_BASE_CORNER Corner = CORNER_LEFT_UPPER,  ENUM_ANCHOR_POINT Anchor = ANCHOR_RIGHT, bool Background = false,
                    color  ColorBodyMargine = clrDarkSlateGray, color  ColorBodyCyrcle = clrRed, const double Angle = 0, int FontSizeAdjust = 0, int FontSize = 0, string Font = "Arial", int FontX = 0, int FontY = 0 )
{         //
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-ChartController Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          //
          ///---LabelX.LeftO0-
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4("LeftO0-" + NameCom, "n", "Webdings", FontSizeAdjust + 13);
                    LabelX.GDS.Set_Color_1(ColorBodyMargine);
                    LabelX.GDS.Set_Location_5(95  + MoveX, MoveY + 100, Angle, Corner, Anchor);
                    LabelX.GDS.Set_Common_6(Background, 50, false, false, false, LabelDEF_tooltip + "LeftO0-" + NameCom);
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
                    //0// LBL_CycleBotton.Action(); //MODE, IsKey,  "LeftO0-" + NameCom, "n",
                    //0// 95  + MoveX, MoveY + 100, Corner, Anchor, Background, ColorBodyMargine, Angle, FontSizeAdjust + 13, "Webdings"
          }//
          ///---LabelX.LeftO1-
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4("LeftO1-" + NameCom, "n", "Webdings", FontSizeAdjust + 13);
                    LabelX.GDS.Set_Color_1(ColorBodyMargine);
                    LabelX.GDS.Set_Location_5(100 + MoveX, MoveY + 100, Angle, Corner, Anchor);
                    LabelX.GDS.Set_Common_6(Background, 50, false, false, false, LabelDEF_tooltip + "LeftO1-" + NameCom);
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
                    //0// LBL_CycleBotton.Action(WhichMode, IsKey,  "LeftO1-" + NameCom, "n",
                    //0// 100 + MoveX, MoveY + 100, Corner, Anchor, Background, ColorBodyMargine, Angle, FontSizeAdjust + 13, "Webdings");     //
          }//
          //
          ///---LabelX.LeftO2-
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4("LeftO2-"      + NameCom, "n",         "Webdings", FontSizeAdjust + 10);
                    LabelX.GDS.Set_Color_1(ColorBodyCyrcle);
                    LabelX.GDS.Set_Location_5(98  + MoveX, MoveY + 99,  Angle, Corner, Anchor);
                    LabelX.GDS.Set_Common_6(Background, 50, false, false, false, LabelDEF_tooltip + "LeftO2-" + NameCom);
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
                    //0// LBL_CycleBotton.Action(WhichMode, IsKey,  "LeftO2-" + NameCom, "n",
                    //0// 98  + MoveX, MoveY + 99,  Corner, Anchor, Background, ColorBodyCyrcle,  Angle, FontSizeAdjust + 10, "Webdings");      //
          }//
          ///---LabelX.LeftO3-
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4("LeftO3-"      + NameCom, "n",         "Webdings", FontSizeAdjust + 13);
                    LabelX.GDS.Set_Color_1(ColorBodyMargine);
                    LabelX.GDS.Set_Location_5(90  + MoveX, MoveY + 100, Angle, Corner, Anchor);
                    LabelX.GDS.Set_Common_6(Background, 50, false, false, false, LabelDEF_tooltip + "LeftO3-" + NameCom);
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
                    //0// LBL_CycleBotton.Action(WhichMode, IsKey,  "LeftO3-" + NameCom, "n",
                    //0// 90  + MoveX, MoveY + 100, Corner, Anchor, Background, ColorBodyMargine, Angle, FontSizeAdjust + 13, "Webdings"); //
          }//
          ///---LabelX.LeftO4-
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4("LeftO4-"      + NameCom, "n", "Webdings", FontSizeAdjust + 10);
                    LabelX.GDS.Set_Color_1(ColorBodyCyrcle);
                    LabelX.GDS.Set_Location_5(88  + MoveX, MoveY + 99,  Angle, Corner, Anchor);
                    LabelX.GDS.Set_Common_6(Background, 50, false, false, false, LabelDEF_tooltip + "LeftO4-" + NameCom);
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
                    //0// LBL_CycleBotton.Action(WhichMode, IsKey,  "LeftO4-" + NameCom, "n",
                    //0// 88  + MoveX, MoveY + 99,  Corner, Anchor, Background, ColorBodyCyrcle,  Angle, FontSizeAdjust + 10, "Webdings"); //
          }//
          ///---LabelX.LeftO5-
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4("LeftO5-"      + NameCom, "n",         "Webdings", FontSizeAdjust + 10);
                    LabelX.GDS.Set_Color_1(ColorBodyCyrcle);
                    LabelX.GDS.Set_Location_5(93  + MoveX, MoveY + 99,  Angle, Corner, Anchor);
                    LabelX.GDS.Set_Common_6(Background, 50, false, false, false, LabelDEF_tooltip + "LeftO5-" + NameCom);
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
                    //0// LBL_CycleBotton.Action(WhichMode, IsKey,  "LeftO5-" + NameCom, "n",
                    //0// 93  + MoveX, MoveY + 99,  Corner, Anchor, Background, ColorBodyCyrcle,  Angle, FontSizeAdjust + 10, "Webdings");  //
          }//
          //+------------------------------------------------------------------+
          //|                                                                  |
          //+------------------------------------------------------------------+
          ///---LabelX.Logo-
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4("Logo-"        + NameCom, NameDescCom, Font, FontSize + 7);
                    LabelX.GDS.Set_Color_1(clrWhite);
                    LabelX.GDS.Set_Location_5(83  + MoveX + FontX, MoveY + 98 + FontY,  Angle, Corner, ANCHOR_CENTER);
                    LabelX.GDS.Set_Common_6(Background, 50, false, false, false, LabelDEF_tooltip + "Logo-" + NameCom);
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //  ///---Parent must got child obj... if not this?
                    //0// LBL_CycleBotton.Action(WhichMode, IsKey,  "Logo-"   + NameCom,
                    //0// NameDescCom, 83  + MoveX, MoveY + 98,  Corner, ANCHOR_CENTER, Background, clrWhite,  Angle, FontSize + 7, Font );
          }//
          //
          //
          ////
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-ChartController Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
}

//+------------------------------------------------------------------+
//|                        Cg_DevTextsButton.mqh                     |
//+------------------------------------------------------------------+
//||   ||||||||||             Cg_DevTextsButton.mqh                 ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
