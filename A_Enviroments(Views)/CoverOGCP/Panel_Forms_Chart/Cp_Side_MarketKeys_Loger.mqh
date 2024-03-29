//+------------------------------------------------------------------+
//||   ||||||||||                 Cp_Side_MarketKeys_Loger.mqh.mqh  ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(ControlersCall)\MCV_Data_Model.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(ControlersCall)\MCV_Method_View.mqh>
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class Cp_SubSide_MarketKeys_Loger
{
public:
          Cp_SubEMAKey         Key;
          //--------------------------------------------------------------------
          void                  _Call(int WhichMode, bool IsKey, int MoveX = 0, int MoveY = 0, int XPos = 260, int YPos = 160, int SizeX = 0, int SizeY = 0);
          void                  _Show(int WhichMode, bool IsKey, int MoveX = 0, int MoveY = 0, int XPos = 260, int YPos = 160, int SizeX = 0, int SizeY = 0);
          void                  Update();
          void                  SubEMA_OBJECT_CLICK();
          void                  SubEMA_KeysStatus();
          //--------------------------------------------------------------------
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Cp_SubSide_MarketKeys_Loger::_Call(int WhichMode, bool IsKey, int MoveX = 0, int MoveY = 0, int XPos = 260, int YPos = 160, int SizeX = 0, int SizeY = 0)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_RightMenuPad Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          _Show(WhichMode, IsKey, MoveX, MoveY, XPos, YPos, SizeX, SizeY);
          //----if(WhichMode == MODE_CREATE && !IsKey)return; //--crashing...
          //----gone uper call difusing
          //if(true && IsKey)
          //{         RightMenu.SubStatus._Call/*           */(MODE_CREATE, false);
          //          RightMenu.SubEMA._Call/*      */(MODE_CREATE, false); //
          //          RightMenu.SubController._Show/*   */(MODE_CREATE, false); //
          //          bank_Pad.MM_Panel/*                 */(MODE_CREATE, false); //
          //}
          //===========================================================================================================================================================
          RightMenu.IsPadPress_Side = IsKey & (WhichMode == MODE_CREATE) ; //
          //-----------------------------------------------------------------
          {         //---coloring button
                    if(RightMenu.IsPadPress_Side)
                    {         Complex.Menu_Button(MODE_MODIFY, RightMenu.IsPadPress_Side, "Side", RightMenuPad_Color.CclrBody, RightMenuPad_Color.CclrBodyMargine, clrWhite, RightMenuPad_Color.CclrBodyCyrclePress);}
                    else  {Complex.Menu_Button(MODE_MODIFY, RightMenu.IsPadPress_Side, "Side", RightMenuPad_Color.CclrBody, RightMenuPad_Color.CclrBodyMargine, clrWhite, RightMenuPad_Color.CclrBodyCyrcleUnPress);}//
          }
          //===========================================================================================================================================================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_RightMenuPad Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Cp_SubSide_MarketKeys_Loger::_Show(int WhichMode, bool IsKey, int MoveX = 0, int MoveY = 0, int XPos = 260, int YPos = 160, int SizeX = 0, int SizeY = 0)
{         int RectSizeY = (int)MathAbs(YPos * 0.16 - YPos * 0.086) * 13 + 40;
          int RectSizeX = (int)MathAbs(XPos * 0.00 - XPos * 0.55) * 2 + 40;
          int XposAdjust = RectSizeX / 3;
          ///--- PanelBorderSide_MarketKeys
          {         RectLabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    RectLabelX.GDS.Set_Desc_1("PanelBorderSide_MarketKeys");
                    RectLabelX.GDS.Set_Tip_3(STYLE_SOLID, 1, BORDER_FLAT );
                    RectLabelX.GDS.Set_Color_2(clrNavy, clrDarkSalmon);
                    RectLabelX.GDS.Set_Location_5((int)(XPos * 0.00) + MoveX, (int)(YPos * 0.08) + MoveY, SizeX = RectSizeX + 00, SizeY = RectSizeY + 00, CORNER_LEFT_UPPER);
                    RectLabelX.GDS.Set_Chart_6();
                    RectLabelX.GDS.Set_Common_6(false, 10, false, false, false, RLDEF_tooltip + "PanelBorderSide_MarketKeys");
                    RectLabelX.Action(RectLabelX); //
                    //0//RLBL_MarketKeys_Loger.Create(Is_Create,  Is_Move, "PanelBorderSide_MarketKeys" + "RectLabel",  "RightBorderBS",
                    //0//(int)(XPos * 0.00) + MoveX, (int)(YPos * 0.08) + MoveY, SizeX = RectSizeX, SizeY = RectSizeY,
                    //0//CORNER_LEFT_UPPER, ANCHOR_UPPER, false, BORDER_FLAT, clrNavy, clrDarkSalmon, 0, STYLE_SOLID, 1, 8, "Arial" );
          }//
          ///--- PanelBorderSide_MarketKeys
          {         RectLabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    RectLabelX.GDS.Set_Desc_1("PanelBorderSide_MarketKeys2");
                    RectLabelX.GDS.Set_Tip_3(STYLE_SOLID, 1, BORDER_FLAT );
                    RectLabelX.GDS.Set_Color_2(clrBlue, clrNONE);
                    RectLabelX.GDS.Set_Location_5((int)(XPos * 0.00) + MoveX + 2, (int)(YPos * 0.08) + MoveY + 2, SizeX = RectSizeX - 4, SizeY = 18, CORNER_LEFT_UPPER);
                    RectLabelX.GDS.Set_Chart_6();
                    RectLabelX.GDS.Set_Common_6(false, 10, false, false, false, RLDEF_tooltip + "PanelBorderSide_MarketKeys2");
                    RectLabelX.Action(RectLabelX); //
                    //0//RLBL_MarketKeys_Loger.Create(Is_Create,  Is_Move, "PanelBorderSide_MarketKeys2" + "RectLabel",  "RightBorderBS",
                    //0//(int)(XPos * 0.00) + MoveX + 2, (int)(YPos * 0.08) + MoveY + 2, SizeX = RectSizeX - 4, SizeY = 18, CORNER_LEFT_UPPER,
                    //0//ANCHOR_UPPER, false, BORDER_FLAT, clrBlue, clrNONE, 0, STYLE_SOLID, 1, 8, "Arial" );
          }//
          ///--- PanelBorderSide_MarketKeys  --- Header
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4("LogerMarketKeys", "***LogerMarketRunKeys***", "Arial", 7); //Black
                    LabelX.GDS.Set_Color_1(clrWhite);
                    LabelX.GDS.Set_Location_5((int)(XPos * 0.02) + MoveX + XposAdjust, (int)(YPos * 0.14) + MoveY, 0, CORNER_LEFT_UPPER, ANCHOR_LEFT);
                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "LabelLogerMarketKeys");
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
                    //0//LBL_MarketKeys_Loger.Create(Is_Create,  Is_Move, "LabelLogerMarketKeys", "***LogerMarketRunKeys***",
                    //0// (int)(XPos * 0.02) + MoveX, (int)(YPos * 0.14) + MoveY,   CORNER_LEFT_UPPER, ANCHOR_LEFT, false,  clrWhite, 0, 7, "Arial Black");
          }//
          ///--- PanelBorderSide_MarketKeys
          {         RectLabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    RectLabelX.GDS.Set_Desc_1("PanelBorderSide_MarketKeys_BuyBox");
                    RectLabelX.GDS.Set_Tip_3(STYLE_SOLID, 1, BORDER_FLAT );
                    RectLabelX.GDS.Set_Color_2(clrDarkBlue, clrNONE);
                    RectLabelX.GDS.Set_Location_5((int)(XPos * 0.00) + MoveX + 2, (int)(YPos * 0.17) + MoveY + 2, SizeX = RectSizeX - 4, SizeY = 59, CORNER_LEFT_UPPER);
                    RectLabelX.GDS.Set_Chart_6();
                    RectLabelX.GDS.Set_Common_6(false, 10, false, false, false, RLDEF_tooltip + "PanelBorderSide_MarketKeys_BuyBox");
                    RectLabelX.Action(RectLabelX); //
                    //0// RLBL_MarketKeys_Loger.Create(Is_Create,  Is_Move, "PanelBorderSide_MarketKeys_BuyBox" + "RectLabel",  "RightBorderBS",
                    //0// (int)(XPos * 0.00) + MoveX + 2, (int)(YPos * 0.17) + MoveY + 2, SizeX = RectSizeX - 4, SizeY = 59,
                    //0// CORNER_LEFT_UPPER, ANCHOR_UPPER, false, BORDER_FLAT, clrDarkBlue, clrNONE, 0, STYLE_SOLID, 1, 8, "Arial" );
          }
          ///--- PanelBorderSide_MarketKeys
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4("LogerBuyMarketKeys", "BuyMarket ->>" + "BM->> : " +  std_Labels._Desc_BuyMarket, "Arial", 7);
                    LabelX.GDS.Set_Color_1(clrWhite);
                    LabelX.GDS.Set_Location_5((int)(XPos * 0.05) + MoveX + XposAdjust, (int)(YPos * 0.26) + MoveY, 0, CORNER_LEFT_UPPER, ANCHOR_LEFT);
                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "LogerBuyMarketKeys");
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
                    //0// LBL_MarketKeys_Loger.Create(Is_Create,  Is_Move, "LabelLogerBuyMarketKeys", "BuyMarket ->>" + "BM->> : " +  std_Labels.BuyMarket,
                    //0// (int)(XPos * 0.05) + MoveX, (int)(YPos * 0.26) + MoveY,   CORNER_LEFT_UPPER, ANCHOR_LEFT, false,  clrWhite, 0, 7, "Arial");
          }
          ///--- PanelBorderSide_MarketKeys
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4("LogerBuyStopKeys", "BuyStop    ->>" + "BS->> : " +  std_Labels._Desc_BuyStop, "Arial", 7);
                    LabelX.GDS.Set_Color_1(clrWhite);
                    LabelX.GDS.Set_Location_5((int)(XPos * 0.05) + MoveX + XposAdjust, (int)(YPos * 0.36) + MoveY, 0, CORNER_LEFT_UPPER, ANCHOR_LEFT);
                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "LogerBuyStopKeys");
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
                    //0//LBL_MarketKeys_Loger.Create(Is_Create,  Is_Move, "LabelLogerBuyStopKeys", "BuyStop    ->>" + "BS->> : " +  std_Labels.BuyStop,
                    //0// (int)(XPos * 0.05) + MoveX, (int)(YPos * 0.36) + MoveY,   CORNER_LEFT_UPPER, ANCHOR_LEFT, false,  clrWhite, 0, 7, "Arial");
          }
          ///--- PanelBorderSide_MarketKeys
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4("LogerBuyLimitKeys", "BuyLimit    ->>" + "BL->> : " +  std_Labels._Desc_BuyLimit, "Arial", 7);
                    LabelX.GDS.Set_Color_1(clrWhite);
                    LabelX.GDS.Set_Location_5((int)(XPos * 0.05) + MoveX + XposAdjust, (int)(YPos * 0.46) + MoveY, 0, CORNER_LEFT_UPPER, ANCHOR_LEFT);
                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "LogerBuyLimitKeys"); LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX);//
                    //0// LBL_MarketKeys_Loger.Create(Is_Create,  Is_Move, "LabelLogerBuyLimitKeys", "BuyLimit    ->>" + "BL->> : " +  std_Labels.BuyLimit,
                    //0// (int)(XPos * 0.05) + MoveX, (int)(YPos * 0.46) + MoveY,   CORNER_LEFT_UPPER, ANCHOR_LEFT, false,  clrWhite, 0, 7, "Arial");
          }
          ///--- PanelBorderSide_MarketKeys
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4("Loger---", "--------------------------------", "Arial", 7);
                    LabelX.GDS.Set_Color_1(clrWhite);
                    LabelX.GDS.Set_Location_5( (int)(XPos * 0.05) + MoveX + XposAdjust, (int)(YPos * 0.56) + MoveY, 0, CORNER_LEFT_UPPER, ANCHOR_LEFT);
                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "Loger---");
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX);//
                    //0//LBL_MarketKeys_Loger.Create(Is_Create,  Is_Move, "std_Labels---", "--------------------------------",
                    //0// (int)(XPos * 0.05) + MoveX, (int)(YPos * 0.56) + MoveY,   CORNER_LEFT_UPPER, ANCHOR_LEFT, false,  clrWhite, 0, 7, "Arial");
          }
          ///--- PanelBorderSide_MarketKeys
          {         RectLabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    RectLabelX.GDS.Set_Desc_1("PanelBorderSide_MarketKeys_SellBox");
                    RectLabelX.GDS.Set_Tip_3(STYLE_SOLID, 1, BORDER_FLAT );
                    RectLabelX.GDS.Set_Color_2(clrRed, clrNONE);
                    RectLabelX.GDS.Set_Location_5( (int)(XPos * 0.00) + MoveX + 2, (int)(YPos * 0.58) + MoveY + 2, SizeX = RectSizeX - 4, SizeY = 59, CORNER_LEFT_UPPER);
                    RectLabelX.GDS.Set_Chart_6();
                    RectLabelX.GDS.Set_Common_6(false, 10, false, false, false, RLDEF_tooltip + "PanelBorderSide_MarketKeys_SellBox");
                    RectLabelX.Action(RectLabelX); //
                    //0//RLBL_MarketKeys_Loger.Create(Is_Create,  Is_Move, "PanelBorderSide_MarketKeys_SellBox" + "RectLabel",  "RightBorderBS",
                    //0//(int)(XPos * 0.00) + MoveX + 2, (int)(YPos * 0.58) + MoveY + 2, SizeX = RectSizeX - 4, SizeY = 59, CORNER_LEFT_UPPER,
                    //0// ANCHOR_UPPER, false, BORDER_FLAT, clrRed, clrNONE, 0, STYLE_SOLID, 1, 8, "Arial" );
          }
          ///--- PanelBorderSide_MarketKeys
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4("LogerSellMarketKeys", "SellMarket  ->>" + "SM->> : " + std_Labels._Desc_SellMarket, "Arial", 7);
                    LabelX.GDS.Set_Color_1(clrWhite);
                    LabelX.GDS.Set_Location_5((int)(XPos * 0.05) + MoveX + XposAdjust, (int)(YPos * 0.66) + MoveY, 0, CORNER_LEFT_UPPER, ANCHOR_LEFT);
                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "LogerSellMarketKeys"); LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX);//
                    //0//LBL_MarketKeys_Loger.Create(Is_Create,  Is_Move, "LabelLogerSellMarketKeys", "SellMarket  ->>" + "SM->> : " + std_Labels.SellMarket,
                    //0//(int)(XPos * 0.05) + MoveX, (int)(YPos * 0.66) + MoveY,   CORNER_LEFT_UPPER, ANCHOR_LEFT, false,  clrWhite, 0, 7, "Arial");
          }
          ///--- PanelBorderSide_MarketKeys
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4("LogerSellStopKeys",  "SellStop     ->>" + "SS->> : " +  std_Labels._Desc_SellStop, "Arial", 7);
                    LabelX.GDS.Set_Color_1(clrWhite);
                    LabelX.GDS.Set_Location_5((int)(XPos * 0.05) + MoveX + XposAdjust, (int)(YPos * 0.76) + MoveY, 0, CORNER_LEFT_UPPER, ANCHOR_LEFT);
                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "LogerSellStopKeys");
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX);//
                    //0//LBL_MarketKeys_Loger.Create(Is_Create,  Is_Move, "LabelLogerSellMarketKeys", "SellMarket  ->>" + "SM->> : " + std_Labels.SellMarket,
                    //0//(int)(XPos * 0.05) + MoveX, (int)(YPos * 0.66) + MoveY,   CORNER_LEFT_UPPER, ANCHOR_LEFT, false,  clrWhite, 0, 7, "Arial");
          }
          ///--- PanelBorderSide_MarketKeys
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4("LogerSellLimitKeys", "SellLimit     ->>" + "SL->> : " +  std_Labels._Desc_SellLimit, "Arial", 7);
                    LabelX.GDS.Set_Color_1(clrWhite);
                    LabelX.GDS.Set_Location_5((int)(XPos * 0.05) + MoveX + XposAdjust, (int)(YPos * 0.86) + MoveY, 0, CORNER_LEFT_UPPER, ANCHOR_LEFT);
                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "LogerSellLimitKeys");
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX);//
                    //0//LBL_MarketKeys_Loger.Create(Is_Create,  Is_Move, "LabelLogerSellLimitKeys", "SellLimit     ->>" + "SL->> : " +  std_Labels.SellLimit,
                    //0//(int)(XPos * 0.05) + MoveX, (int)(YPos * 0.86) + MoveY,   CORNER_LEFT_UPPER, ANCHOR_LEFT, false,  clrWhite, 0, 7, "Arial");
          }//
          //=========================
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Cp_SubSide_MarketKeys_Loger::Update()
{         if(RightMenu.IsPadPress_Side)
          {         if(ObjectFind(0, "LabelLogerBuyMarketKeys") >= 0)
                              if(!ObjectSetString(0, "LabelLogerBuyMarketKeys", OBJPROP_TEXT, 0, "BM->> : " +  std_Labels._Desc_BuyMarket )) //Set_Object
                                        Alert("-Line:", __LINE__, " ChartMeterX");
                    //==================
                    if(ObjectFind(0, "LabelLogerBuyStopKeys") >= 0)
                              if(!ObjectSetString(0, "LabelLogerBuyStopKeys", OBJPROP_TEXT, 0, "BS->> : " +  std_Labels._Desc_BuyStop)) //Set_Object
                                        Alert("-Line:", __LINE__, " ChartMeterX");
                    //==================
                    if(ObjectFind(0, "LabelLogerBuyLimitKeys") >= 0)
                              if(!ObjectSetString(0, "LabelLogerBuyLimitKeys", OBJPROP_TEXT, 0, "BL->> : " +  std_Labels._Desc_BuyLimit)) //Set_Object
                                        Alert("-Line:", __LINE__, " ChartMeterX");
                    //==================
                    //==================
                    if(ObjectFind(0, "LabelLogerSellMarketKeys") >= 0)
                              if(!ObjectSetString(0, "LabelLogerSellMarketKeys", OBJPROP_TEXT, 0, "SM->> : " + std_Labels._Desc_SellMarket)) //Set_Object
                                        Alert("-Line:", __LINE__, " ChartMeterX");
                    //==================
                    if(ObjectFind(0, "LabelLogerSellStopKeys") >= 0)
                              if(!ObjectSetString(0, "LabelLogerSellStopKeys", OBJPROP_TEXT, 0, "SS->> : " +  std_Labels._Desc_SellStop)) //Set_Object
                                        Alert("-Line:", __LINE__, " ChartMeterX");
                    //==================
                    if(ObjectFind(0, "LabelLogerSellLimitKeys") >= 0)
                              if(!ObjectSetString(0, "LabelLogerSellLimitKeys", OBJPROP_TEXT, 0, "SL->> : " +  std_Labels._Desc_SellLimit)) //Set_Object
                                        Alert("-Line:", __LINE__, " ChartMeterX");
                    //=========================================
          }//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
