//+------------------------------------------------------------------+
//||   ||||||||||                 C_BANK_Pad.mqh                    ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(ControlersCall)\MCV_Data_Model.mqh>
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class C_BANK_Pad : public Ct_Bank
{
public:
          //bool           UPDATED;
          bool           Update();
          void           MM_Panel_Type(int WhichMode, bool IsKey, ENUM_MMType MMType_);
          bool           MM_Panel_PPSLTP(int WhichMode, bool IsKey, int MoveX = 0, int MoveY = 10 );
          bool           MM_Panel_Call(int WhichMode, bool IsKey, bool IsClick = false, bool FIs_Create = false, int MoveX = 0, int MoveY = 10 );
          //----------------------------------------------------------
          //St_BANK_Pad_data data; need globall
          //----------------------------------------------------------
          bool          KeyLotsTypeEdite;//
          bool          GetInps();//
          bool          Set__MMPannel_Labels();//
          //----------------------------------------------------------
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_BANK_Pad::Update()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_BANK Error",  __LINE__, __FUNCTION__);//
          //Alert("+====================================================+" + __FUNCTION__); //
          UPDATED = false;
          //-----------------------------------------------------
          Set__MMPannel_Labels();
          //-----------------------------------------------------
          return true;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void  C_BANK_Pad:: MM_Panel_Type(int WhichMode, bool IsKey, ENUM_MMType MMType_)
{         int MoveY = 20 + 25 + 10;
          int MoveX = 130;
          int Angel = 0;
          int xCom = 0;
          int yCom = 0;
          int FontSize = 0;
          bool Is_Move = false;
          //---------------------------------
          // reset every change
          if(!IsKey)
          {         ct_Drive.TDD.ct_Bank.BANK_Pad_DATA.Set_Lots_Ok = false;
                    ct_Drive.TDD.ct_Bank.BANK_Pad_DATA.Set_RiskAmount_Ok = false;
                    ct_Drive.TDD.ct_Bank.BANK_Pad_DATA.Set_EquityAmount_Ok = false;
                    ct_Drive.TDD.ct_Bank.BANK_Pad_DATA.Set_RiskPercent_Ok = false; //
          }
          //
          if(MMType_ == MM_Manual)
          {         ct_Drive.TDD.st_Size.IsDynamicPutLots = true;  ct_Drive.TDD.st_Size.IsManualPutLots = true; MMTypeX = MM_Manual;
                    Complex.Set_TextPanel( WhichMode, IsKey, 0, clrDodgerBlue,  "MMType: ", "Manual MM",  35 + MoveX, MoveY + 100 + 92, clrDarkGreen,  Angel, xCom + 5, yCom, 1, 8); //
                    Complex.Get_TextPanel( WhichMode, IsKey, clrNONE,           "Set Lots..",          - 10 + MoveX, MoveY + 180 + 2,  clrDodgerBlue, Angel, xCom + 5, yCom, 0);          //
                    Complex.Get_TextPanel( WhichMode, IsKey, clrNONE,           "Set Risk$..",         - 10 + MoveX, MoveY + 180 + 20, clrDodgerBlue, Angel, xCom + 5, yCom, 0);          //
                    //----------------
                    Complex.Get_TextPanel( WhichMode, false, clrNONE,          "Set Equity$..",        - 10 + MoveX, MoveY + 180 + 2,  clrMaroon,     Angel, xCom + 5, yCom, 0); //
                    Complex.Get_TextPanel( WhichMode, false, clrNONE,          "Set Risk%..",          - 10 + MoveX, MoveY + 180 + 20, clrMaroon,     Angel, xCom + 5, yCom, 0); //
                    //----------------
          }//
          if(MMType_ == MM_Auto)
          {         ct_Drive.TDD.st_Size.IsDynamicPutLots = true;   ct_Drive.TDD.st_Size.IsManualPutLots = false; MMTypeX = MM_Auto;
                    //----------------
                    Complex.Set_TextPanel( WhichMode, IsKey, 0, clrMaroon,      "MMType: ", "Auto MM",    35 + MoveX, MoveY + 100 + 92, clrDarkGreen,  Angel, xCom + 5, yCom, 1, 8); //
                    Complex.Get_TextPanel( WhichMode, IsKey, clrNONE,           "Set Equity$..",       - 10 + MoveX, MoveY + 180 + 2,  clrMaroon,     Angel, xCom + 5, yCom, 0); //
                    Complex.Get_TextPanel( WhichMode, IsKey, clrNONE,           "Set Risk%..",         - 10 + MoveX, MoveY + 180 + 20, clrMaroon,     Angel, xCom + 5, yCom, 0); //
                    //----------------
          } //
          if(MMType_ == MM_Fixed)
          {         ct_Drive.TDD.st_Size.IsDynamicPutLots = false;  ct_Drive.TDD.st_Size.IsManualPutLots = false; MMTypeX = MM_Fixed;
                    //----------------
                    Complex.Set_TextPanel( WhichMode, IsKey, 0, clrDarkGreen,  "MMType: ", "Fixed MM",    35    + MoveX, MoveY + 100 + 92, clrDarkGreen,  Angel, xCom + 5, yCom, 1, 8); //
                    Complex.Get_TextPanel( WhichMode, false, clrNONE,          "Set Lots..",           - 1     + MoveX, MoveY + 2,        clrDodgerBlue, Angel, xCom + 5, yCom, 0);
                    Complex.Get_TextPanel( WhichMode, false, clrNONE,          "Set Risk$..",          - 10    + MoveX, MoveY + 180 + 20, clrDodgerBlue, Angel, xCom + 5, yCom, 0); //
                    //----------------
          }//
          return;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_BANK_Pad::MM_Panel_PPSLTP(int WhichMode, bool IsKey, int MoveX = 0, int MoveY = 10)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_CHART Error",  __LINE__, __FUNCTION__);
          //reset
          if(!IsKey)
          {         ct_Drive.TDD.ct_Bank.BANK_Pad_DATA.Set_PP_Ok = false;
                    ct_Drive.TDD.ct_Bank.BANK_Pad_DATA.Set_TP_Ok = false;
                    ct_Drive.TDD.ct_Bank.BANK_Pad_DATA.Set_SL_Ok = false;
                    ct_Drive.TDD.ct_Bank.BANK_Pad_DATA.Set_TS_Ok = false;
                    ct_Drive.TDD.ct_Bank.BANK_Pad_DATA.Set_MP_Ok = false;//
          }
          //--------------------------------------
          //-- Object_Pack_1.Texts.RectLabel.Draw_GDS(WhichMode, IsKey, "backGrandManagerMony", 110, 160, 190, 120, CORNER_LEFT_UPPER, clrSlateGray , clrSlateGray, STYLE_SOLID, 0, BORDER_FLAT, false);
          int Angel = 0; int xCom = 5; int yCom = 0; int FontSize = 0; bool Is_Move = false;
          Complex.Set_TextPanel( WhichMode, IsKey, +1, clrNONE, "PP: ", "PP:xxx",  40 - 1 + 80 + MoveX, MoveY +  180 - 88, clrMidnightBlue, Angel, xCom, yCom, FontSize); //
          Complex.Get_TextPanel( WhichMode, IsKey,     clrNONE, "Set PP..",        40 - 1 + 80 + MoveX, MoveY +  180 - 76, clrMediumBlue,   Angel, xCom, yCom, FontSize); //
          //-----------------
          Complex.Set_TextPanel( WhichMode, IsKey, -1, clrNONE, "SL: ", "SL:xxx",  40 - 1 + 80 + MoveX, MoveY +  180 - 20, clrDarkRed,      Angel, xCom, yCom, FontSize); //
          Complex.Get_TextPanel( WhichMode, IsKey,     clrNONE, "Set SL..",        40 - 1 + 80 + MoveX, MoveY +  180 - 32, clrRed,          Angel, xCom, yCom, FontSize); //
          //----------------
          Complex.Set_TextPanel( WhichMode, IsKey, 1,  clrNONE, "TP: ", "TP:xxx",  40 - 1 + 80 + MoveX, MoveY +  180 - 60, clrDarkGreen,    Angel, xCom, yCom, FontSize); //
          Complex.Get_TextPanel( WhichMode, IsKey,     clrNONE, "Set TP..",        40 - 1 + 80 + MoveX, MoveY +  180 - 48, clrLimeGreen,    Angel, xCom, yCom, FontSize); //
          //--------------------------------------
          //----------------
          Complex.Set_TextPanel( WhichMode, IsKey, 1,  clrNONE, "TS: ", "TS:xxx",  135 - 1 + 80 + MoveX, MoveY +  180 - 60, clrNavy,    Angel, xCom, yCom, FontSize); //
          Complex.Get_TextPanel( WhichMode, IsKey,     clrNONE, "Set TS..",        135 - 1 + 80 + MoveX, MoveY +  180 - 48, clrBlue,    Angel, xCom, yCom, FontSize); //
          //----------------
          Complex.Set_TextPanel( WhichMode, IsKey, -1,  clrNONE, "MP: ", "MP:xxx",  135 - 1 + 80 + MoveX, MoveY +  180 - 20, clrDimGray,    Angel, xCom, yCom, FontSize); //
          Complex.Get_TextPanel( WhichMode, IsKey,     clrNONE, "Set MP..",        135 - 1 + 80 + MoveX, MoveY +  180 - 32, clrSilver,    Angel, xCom, yCom, FontSize); //
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_CHART Error",  __LINE__, __FUNCTION__); //|
          return IsKey;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_BANK_Pad::MM_Panel_Call(int WhichMode, bool IsKey, bool IsClick = false, bool FIs_Create = false, int MoveX = 0, int MoveY = 10 )
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_CHART Error",  __LINE__, __FUNCTION__); //
          //----------------------------------------------------------------------
          //static bool IsCreate = false;//
          //{         IsCreate = IsCreate ? false : true;
          //          if(IsClick) { IsCreate = FIs_Create; }
          //          Is_MoneyManagerPad = Is_MoneyManagerPad ? false : true; //
          //}
          //---------------------------------------------------------------------
          int Angel = 0;        int xCom = 0;   int yCom = 0;   int FontSize = 0;
          int MoveY_Save = MoveY;
          //----------------------------------------------------------------------
          //if(IsCreate)
          //if(IsCreate == (true | false))
          //----------------------------------------------------------------------
          bool IsReShowRightMenu = false;
          bool AnyPressed =  RightMenu.IsPadPress_Main || RightMenu.IsPadPress_Side || RightMenu.IsPadPress_Status ||   RightMenu.IsPadPress_EMA || RightMenu.IsPadPress_Controller || RightMenu.IsPadPress_Calculator;
          if(AnyPressed)IsReShowRightMenu = true;
          //----------------------------------------------------------------------
          {         MoveX = 0;  MoveY = 35 + MoveY_Save; //
                    //----------------------------------------------------------------------
                    if(IsKey) RightMenu._Show(WhichMode, false); //
                    Complex.LongPanel(WhichMode, IsKey, clrNONE,  "SLXBG", 30 - 16 + MoveX, MoveY + 180 - 2 + 5,  clrNavy, Angel, xCom + 16, yCom, FontSize + 10); //
                    if(IsKey) RightMenu._Show(WhichMode, true, 0, 10); //
                    //----------------------------------------------------------------------
                    MM_Panel_PPSLTP(WhichMode, IsKey, MoveX, MoveY);
                    //----------------------------------------------------------------------
                    //---errorr---Complex.Set_BottumPanel(WhichMode, IsKey, 0, clrNONE, "MoneyManagerPad", "a", 30 - 12,  180 - 0, clrWhite, clrBlue, Angel, xCom - 8, yCom, FontSize, "Webdings", 9); //
                    IsKey ? ObjectSetInteger(0, "MoneyManagerPadLabel", OBJPROP_COLOR, clrLime) : ObjectSetInteger(0, "MoneyManagerPadLabel", OBJPROP_COLOR, clrWhite);//
                    //----------------------------------------------------------------------
          }
          //--------------------------------------
          // int        YSide           = 0,
          // color      ColorBG         = clrNONE,
          // bool       KeyCreate       = false,
          // string     NameCom         =  "None",
          // string     DescCom         =  "None",
          // int        MoveX           = 30,
          // int        MoveY           = 180 - 2,
          // color      ColorPutLots    = clrBlueViolet,
          // int        Angel           = 0,
          // int        xCom            = 0,
          // int        yCom            = 0,
          // int        FontSize        = 0,
          // int        MoveYDesc       = 0,
          // string     FontType        = "Arial Bold",
          // int        FontSizeDesc    = 0
          //--------------------------------------
          {         MoveX = 0;  MoveY = 35 + 1 + MoveY_Save;
                    Complex.Set_TextPanel( WhichMode, IsKey, 0, clrNONE, "MMType: ",  "Fixed MM",       35 +       MoveX, MoveY + 100 + 92, clrDarkGreen,   Angel, xCom + 5, yCom, 1, 8); //
                    Complex.Set_TextPanel( WhichMode, IsKey, 0, clrNONE, "PutLots: ", "PutLots:[xxx]",  35 +       MoveX, MoveY + 100 + 75, clrDarkMagenta, Angel, xCom + 5, yCom, 0, 7); //
                    Complex.Set_TextPanel( WhichMode, IsKey, 0, clrNONE, "Risk$: ",   "PutRisk$:[xxx]", 35 + 84 +  MoveX, MoveY + 100 + 75, clrCrimson,     Angel, xCom + 5, yCom, 0, 7); //
                    Complex.Set_TextPanel( WhichMode, IsKey, 0, clrNONE, "Risk%: ",   "Risk%:[xxx]",    35 +       MoveX, MoveY + 100 + 59, clrDarkOrange,  Angel, xCom + 5, yCom, 0, 7); //
                    Complex.Set_TextPanel( WhichMode, IsKey, 0, clrNONE, "Equity$: ", "Equity$:[xxx]",  35 +       MoveX, MoveY + 100 + 43, clrBlueViolet,  Angel, xCom + 5, yCom, 0, 7); //
          }
          //--------------------------------------
          MM_Panel_Type(WhichMode, IsKey, MMTypeX);
          ct_Drive.TDD.ct_Bank.BANK_Pad_DATA.IsMM_Panel = IsKey;
          //--------------------------------------
          Complex.Set_BottumPanel(WhichMode, IsKey, -1, clrNONE, "MoneyManagerPad-reset", "q", 30 - 15,  All_RightMenu_Pad_Y + 180 + 25, clrWhite, clrForestGreen, Angel, xCom - 8, yCom, 0 + 3, "Webdings", 3, -10); //
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_CHART Error",  __LINE__, __FUNCTION__); //|
          return IsKey;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_BANK_Pad::GetInps()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_CHART Error",  __LINE__, __FUNCTION__); //|
//------------------------------
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_CHART Error",  __LINE__, __FUNCTION__); //|
          return true;//
}
//+------------------------------------------------------------------+
//|                                                                  |SL: Label
//+------------------------------------------------------------------+
bool C_BANK_Pad::Set__MMPannel_Labels()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADEPANEL Error",  __LINE__, __FUNCTION__); //|//Set_ Calced values to bank Labels.
          //--when find label update text
          if(ObjectFind(0, "PP: Label") >= 0)           { ObjectSetString(0, "PP: Label",      OBJPROP_TEXT, "PP:[" + IntegerToString(ct_Drive.TDD.ct_Pending.Curr_Pip) + "]");  }
          if(ObjectFind(0, "TP: Label") >= 0)           { ObjectSetString(0, "TP: Label",      OBJPROP_TEXT, "TP:[" + IntegerToString(ct_Drive.TDD.ct_TakeProfit.Curr_Pip) + "]");  }
          // Alert("ct_Drive.TDD.ct_StopLoss.Curr_Pip ", IntegerToString(ct_Drive.TDD.ct_StopLoss.Curr_Pip));
          if(ObjectFind(0, "SL: Label") >= 0)           { ObjectSetString(0, "SL: Label",      OBJPROP_TEXT, "SL:[" + IntegerToString(ct_Drive.TDD.ct_StopLoss.Curr_Pip) + "]");  }
          //
          if(ObjectFind(0, "TS: Label") >= 0)           { ObjectSetString(0, "TS: Label",      OBJPROP_TEXT, "TS:[" + IntegerToString(ct_Drive.TDD.ct_Modify.Trails.TrailSL.Stops.Curr_Pip) + "]");  }
          if(ObjectFind(0, "MP: Label") >= 0)           { ObjectSetString(0, "MP: Label",      OBJPROP_TEXT, "MP:[" + IntegerToString(ct_Drive.TDD.ct_Modify.Trails.TrailSL.ProfitMin.Curr_Pip) + "]");  }
          //
          if(ObjectFind(0, "PutLots: Label") >= 0)      { ObjectSetString(0, "PutLots: Label", OBJPROP_TEXT, "Lots:[" + DoubleToString(ct_Drive.TDD.st_Size.Curr_Lots, 2) + "]");}//Alert("PutLots: ",ct_Drive.TDD.st_Size.Curr_Lots); //--secound call
          if(ObjectFind(0, "Equity$: Label") >= 0)      { ObjectSetString(0, "Equity$: Label", OBJPROP_TEXT, "$:[" + Utilities.ValueSeprate(ct_Drive.TDD.ct_Account.Account_Data.EquityAmount, 2) + "]"); } //%
          if(ObjectFind(0, "Risk%: Label") >= 0)        { ObjectSetString(0, "Risk%: Label",   OBJPROP_TEXT, "R%:[" + DoubleToString(ct_Drive.TDD.ct_RiskReward.RiskCashPercent,  Utilities.CountDigits(ct_Drive.TDD.ct_RiskReward.RiskCashPercent)) + "]");} ////%
          //Alert("_Risk$Label__", ct_Drive.TDD.ct_RiskReward.RiskedCashAmount);
          //--------------------------------
          double RiskAmounts = -1;
          (ct_Drive.TDD.ct_RiskReward.RiskedCashAmount == 0) ? RiskAmounts = ct_Drive.TDD.st_Size.Curr_Lots * Close[0] : RiskAmounts = ct_Drive.TDD.ct_RiskReward.RiskedCashAmount ; //
          if(ct_Drive.TDD.ct_Bank.BANK_Pad_DATA.Set_Lots_Ok)
          {         (ct_Drive.TDD.ct_RiskReward.RiskedCashAmount == 0) ? RiskAmounts = ct_Drive.TDD.st_Size.Curr_Lots * Close[0] : RiskAmounts = ct_Drive.TDD.ct_RiskReward.RiskedCashAmount ; //
          }
          if(ObjectFind(0, "Risk$: Label") >= 0)
          {         if(RiskAmounts > 0) {         ObjectSetString(0, "Risk$: Label",   OBJPROP_TEXT, "R$:[" + Utilities.ValueSeprate(RiskAmounts, 2) + "]"); } ////%
                    else if(RiskAmounts <= 0) {   ObjectSetString(0, "Risk$: Label",   OBJPROP_TEXT, "R$:[" + Utilities.ValueSeprate(ct_Drive.TDD.ct_RiskReward.RiskedCashAmount, 2) + "]"); }; ////% mean not
          }
          //--------------------------------
          if(ObjectFind(0, "MoneyManagerPadBG") >= 0 )
          {         //if(KeyLotsTypeEdite)ObjectSetString(0, "LotsTypeEdite", OBJPROP_TEXT, "");//
                    bool KeySet_ = ObjectGetInteger(0, "MoneyManagerPadLabel", OBJPROP_COLOR) == clrLime;
                    if(KeySet_) { Is_MoneyManagerPad = true;}//
                    else { Is_MoneyManagerPad = false;} //
          } //
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADEPANEL Error",  __LINE__, __FUNCTION__); //|
          return true;//
}
//+------------------------------------------------------------------+
//|             Class C_BANK::     BEGIN                             |
//+------------------------------------------------------------------+
