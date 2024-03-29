//+------------------------------------------------------------------+
//||   ||||||||||                 Cp_SubStatus.mqh                  ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(ControlersCall)\MCV_Data_Model.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(ControlersCall)\MCV_Method_View.mqh>
//---
//---
//---
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Views)\CoverOGCP\Panel_Forms_Chart\Cp_Status_TopMiddle.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Views)\CoverOGCP\Panel_Forms_Chart\Cp_Status_PadMini.mqh>
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class Cp_SubStatus
{
public:   //------------------------------------------------------------------------------------
          //--Keys
          // IsPadPress_Mini         IsPadPressed       GoldVIP.IsPadPress
          //------------------------------------------------------------------------------------IsPadPress_Mini  IsPadPressed GoldVIP.IsPadPress

          //------------------------------------------------------------------------------------
          //---Functions
          void                  _Call(int WhichMode, bool IsKey, color clrBody = clrWhite, color clrBodyMargine = clrNavy, color clrBodyText = clrNavy, color clrBodyCyrcle = clrRed);
          void                  _Show(int WhichMode, bool IsKey, color clrBody = clrWhite, color clrBodyMargine = clrNavy, color clrBodyText = clrNavy, color clrBodyCyrcle = clrRed);
          //------------------------------------------------------------------------------------
          Cp_StatusSubTopMiddle TopMiddle;
          Cp_StatusSubPadMini   PadMini;
          //------------------------------------------------------------------------------------
          void                  SubStatus_KeysStatus();

          //------------------------------------------------------------------------------------
          void                  _OBJECT_CLICK();
          //------------------------------------------------------------------------------------
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Cp_SubStatus::_Call(int WhichMode, bool IsKey, color clrBody = clrWhite, color clrBodyMargine = clrNavy, color clrBodyText = clrNavy, color clrBodyCyrcle = clrRed)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_RightMenuPad Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          _Show( WhichMode, IsKey, clrBody, clrBodyMargine, clrBodyText, clrBodyCyrcle);
          //-----------------------------------------------------------------------------------------oxlularin ishidir... kllari uste tutmak...
          //----gone uper call difusing
          //if(false &&IsKey)
          //{         RightMenu.SubSide_MarketKeys_Loger._Call(MODE_CREATE, false);
          //          RightMenu.SubEMA._Call(MODE_CREATE, false); //
          //          RightMenu.SubController._Show(MODE_CREATE, false); //
          //          bank_Pad.MM_Panel(MODE_CREATE, false); //
          //}
          //-----------------------------------------------------------------------------------------
          RightMenu.IsPadPress_Status = IsKey & (WhichMode == MODE_CREATE) ; //
          bool IsAnyPressed = PadMini.IsPadPress_Mini || TopMiddle.IsPadPressed || GoldVIP.Panel.IsPadPress ;
          //===========================================================================================================================================================
          {         //---coloring button
                    if(RightMenu.IsPadPress_Status)
                    {         Complex.Menu_Button(MODE_MODIFY, RightMenu.IsPadPress_Status, "Status", RightMenuPad_Color.CclrBody, RightMenuPad_Color.CclrBodyMargine, clrWhite, RightMenuPad_Color.CclrBodyCyrclePress);}
                    else  {Complex.Menu_Button(MODE_MODIFY, RightMenu.IsPadPress_Status, "Status", RightMenuPad_Color.CclrBody, RightMenuPad_Color.CclrBodyMargine, clrWhite, RightMenuPad_Color.CclrBodyCyrcleUnPress);}//
                    if (IsAnyPressed)///---at the end of knowing...
                    {         Complex.Menu_Button(MODE_MODIFY, RightMenu.IsPadPress_Status, "Status", clrBody, RightMenuPad_Color.CclrBodyMargine, clrWhite, RightMenuPad_Color.CclrBodyCyrcleActive);}//
          }
          //===========================================================================================================================================================
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Cp_SubStatus::SubStatus_KeysStatus()
{         //================================================================================================================================================
          //
          // Alert("IsPadPress_Mini: ", IsPadPress_Mini); // _MasterPanel
          if( PadMini.IsPadActive_Mini )
          {         Complex.Menu_Button(MODE_MODIFY, PadMini.IsPadPress_Mini, "PadMini", RightMenuPad_Color.CclrBody, RightMenuPad_Color.CclrBodyMargine, clrWhite, RightMenuPad_Color.CclrBodyCyrcleActive);}
          else
          {         Complex.Menu_Button(MODE_MODIFY, PadMini.IsPadPress_Mini, "PadMini", RightMenuPad_Color.CclrBody, RightMenuPad_Color.CclrBodyMargine, clrWhite, RightMenuPad_Color.CclrBodyCyrclePress);}
//================================================================================================================================================
          Complex.Menu_Button(MODE_MODIFY, GoldVIP.Panel.IsPadPress,   "GoldVip",  RightMenuPad_Color.CclrBody, RightMenuPad_Color.CclrBodyMargine, clrWhite, RightMenuPad_Color.CclrBodyCyrclePress);
          Complex.Menu_Button(MODE_MODIFY, TopMiddle.IsPadPressed, "TopMiddle", RightMenuPad_Color.CclrBody, RightMenuPad_Color.CclrBodyMargine, clrWhite, RightMenuPad_Color.CclrBodyCyrclePress);
//================================================================================================================================================
          if(PadMini.IsPadPress_Mini || TopMiddle.IsPadPressed || GoldVIP.Panel.IsPadPress || PadMini.IsPadActive_Mini  )
          {         Complex.Menu_Button(MODE_MODIFY, RightMenu.IsPadPress_Status ^ !RightMenu.IsPadPress_Status, "Status", RightMenuPad_Color.CclrBody, RightMenuPad_Color.CclrBodyMargine, clrWhite, RightMenuPad_Color.CclrBodyCyrcleActive);}
          else if(!PadMini.IsPadPress_Mini && !TopMiddle.IsPadPressed && !GoldVIP.Panel.IsPadPress && !PadMini.IsPadActive_Mini)
          {         Complex.Menu_Button(MODE_MODIFY, RightMenu.IsPadPress_Status, "Status", RightMenuPad_Color.CclrBody, RightMenuPad_Color.CclrBodyMargine, clrWhite, RightMenuPad_Color.CclrBodyCyrcleUnPress); }//Alert("RightMenu.IsPadPress_Status");
//================================================================================================================================================
}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+RLBL_MenuPadsBox2-TopMiddle
void Cp_SubStatus::_OBJECT_CLICK()
{         //------------------------------------------------------
          string Clicked = Event.sparam;
          //------------------------------------------------------
          {         bool Is_Sparam = false;  int Typer = 0;//
                    if(Clicked == "LBL_MenuPadsMainText-GoldVip"   || Clicked == "RLBL_MenuPadsBox2-GoldVip"   || Clicked == "LBL_MenuPadsRight2-GoldVip"       || Clicked == "RLBL_Menu_ButtonBG2-GoldVip")     {Is_Sparam = true; Typer = 99;}
                    if(Clicked == "LBL_MenuPadsMainText-TopMiddle" || Clicked == "RLBL_MenuPadsBox2-TopMiddle" || Clicked == "LBL_MenuPadsRight2-TopMiddle"     || Clicked == "RLBL_Menu_ButtonBG2-TopMiddle")    {Is_Sparam = true; Typer = 00;}
                    if(Clicked == "LBL_MenuPadsMainText-PadMini"   || Clicked == "RLBL_MenuPadsBox2-PadMini"   || Clicked == "LBL_MenuPadsRight2-PadMini"       || Clicked == "RLBL_Menu_ButtonBG2-PadMini")      {Is_Sparam = true; Typer = 01;}
                    if(Is_Sparam)
                    {         bool TPX = false; string TPX_DESC = "";
                              switch(Typer)
                              {         case 99: {TPX = GoldVIP.Panel.IsPadPress;             TPX_DESC = "GoldVip";} break; //
                                        //case 00: {TPX = TopMiddle.IsPadPressed;         TPX_DESC = "TopMiddle";} break; //
                                        //case 01: {TPX = PadMini.IsPadPress_Mini;        TPX_DESC = "PadMini";} break; // _MasterPanel
                              };//
                              {                   TPX = TPX ? false : true;//Alert(__FUNCSIG__, TPX); //
                                        //==========================================================================================================================
                                        //---off cheacked last time off right menu by SubStatus _ KeysStatus
                                        //Complex.Menu_Button(MODE_MODIFY, TPX, TPX_DESC, RightMenuPad_Color.CclrBody, RightMenuPad_Color.CclrBodyMargine, clrWhite, RightMenuPad_Color.CclrBodyCyrclePress);
                                        //==========================================================================================================================
                                        if( TPX_DESC == "GoldVip")
                                        {         //---
                                                  //---
                                                  //---
                                                  Std_GoldVip_Panel_data_Frame CGoldVip;
                                                  CGoldVip.WhichMode           = MODE_CREATE;
                                                  CGoldVip.IsKey               = TPX;
                                                  CGoldVip.Is_Reset_Desc       = true;
                                                  CGoldVip.Is_Created          = GoldVIP.Panel.Is_CCreated = false;
                                                  CGoldVip.IsCallMiniMode      = GoldVIP.Panel.IsPadPress_Mini   = false;
                                                  CGoldVip.PeriodTMCom         = PERIOD_CURRENT;
                                                  CGoldVip.MoveX               =  300;
                                                  CGoldVip.MoveY               = -170;
                                                  CGoldVip.SizeX               = 120;
                                                  CGoldVip.SizeY               = 0;
                                                  CGoldVip.SizeExtendX         = 0;
                                                  CGoldVip.SizeExtendY         = 0;
                                                  GoldVIP._Call__Panel(CGoldVip);//
                                                  //---
                                                  //---
                                                  //---
                                        } //
                                        if( TPX_DESC == "TopMiddle")                            {TopMiddle._Call(MODE_CREATE, TPX, 0, 0);} //
                                        if( TPX_DESC == "PadMini")                              {PadMini._Call(MODE_CREATE, TPX, TPX, 10, 50, 0, 0, -3);  /*Alert("if( TPX_DESC == ""PadMini"") " "TPX_DESC == PadMini __ TPX: ", TPX);*/}  //
                                        //---
                                        //---
                              }         //---
                              switch(Typer)
                              {         case 99: { GoldVIP.Panel.IsPadPress           = TPX;} break; //
                                        case 00: { TopMiddle.IsPadPressed       = TPX;} break; //
                                        case 01: { PadMini.IsPadPress_Mini      = TPX;} break; //
                              };//
                    } //
          }//
//OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO//"PadMiniMini-ExitLogo""
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//"PadMiniMini-ExitLeftO1"  "PadMiniMove-ExitLeftO1"  "PadMiniExit-ExitLeftO1"
//OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO//
          if(false)
          {         if(Clicked == "PadMiniMini_Mini_LeftO1" || Clicked == "PadMiniMini_Mini_Logo")      {PadMini._Call(-1, false, true);}
                    if(Clicked == "PadMiniExit_Exit_LeftO1" || Clicked == "PadMiniExit_Exit_Logo" )     {PadMini._Call(0,  false, false);}
                    if(Clicked == "PadMiniMove_Move_LeftO1" || Clicked == "PadMiniMove_Move_Logo" )     {PadMini._Call(-2, false, false, true);}
                    if(Clicked == "PadMiniRePos_RePos_LeftO1" || Clicked == "PadMiniRePos_RePos_Logo" ) {PadMini._Call(2,  false, false, false, 0, 0);} //
          }
          Debuging.Catch(__DATE__, __DATETIME__, __LINE__, __FILE__, __PATH__, __FUNCTION__, __FUNCSIG__, __MQLBUILD__, __MQL4BUILD__);//, Debuging.FUNCSIG_com,
          //==============================================================================================================
          {         ct_Drive.TDD.ct_Ticket._Modifier.MinProfitStep   = 1;
                    ct_Drive.TDD.ct_Ticket._Modifier.TrailStopStep = 1;
                    if(Clicked == OBJPREFIX + "LBL_MinProfitUP")
                              if(ObjectFind(0, OBJPREFIX + "EDT_MinProfit") >= 0)ObjectSetString(0, OBJPREFIX + "EDT_MinProfit", OBJPROP_TEXT, 0, IntegerToString(ct_Drive.TDD.ct_Ticket._Modifier.MinProfitInp += ct_Drive.TDD.ct_Ticket._Modifier.MinProfitStep)); //Set_Object
                    //=========================================================================== IncLotSize
                    if((Clicked == OBJPREFIX + "LBL_MinProfitDN") && (ct_Drive.TDD.ct_Ticket._Modifier.MinProfitInp == 0))
                              if(ObjectFind(0, OBJPREFIX + "EDT_MinProfit") >= 0)ObjectSetString(0, OBJPREFIX + "EDT_MinProfit", OBJPROP_TEXT, 0, IntegerToString(ct_Drive.TDD.ct_Ticket._Modifier.MinProfitInp -= ct_Drive.TDD.ct_Ticket._Modifier.MinProfitStep)); //Set_Object
                    //=================================================================
                    if(Clicked == OBJPREFIX + "EDT_MinProfit")////important toset
                              if(ObjectFind(0, OBJPREFIX + "EDT_MinProfit") >= 0)
                                        ct_Drive.TDD.ct_Ticket._Modifier.MinProfitInp = (int)ObjectGetString(0, OBJPREFIX + "EDT_MinProfit", OBJPROP_TEXT); //Set_Object
                    //=========================================================================== DecLotSize
                    if(Clicked == OBJPREFIX + "LBL_TrailingUP")
                              if(ObjectFind(0, OBJPREFIX + "EDT_Trailing") >= 0)ObjectSetString(0, OBJPREFIX + "EDT_Trailing", OBJPROP_TEXT, 0, IntegerToString(ct_Drive.TDD.ct_Ticket._Modifier.TrailStopInp += ct_Drive.TDD.ct_Ticket._Modifier.TrailStopStep)); //Set_Object
                    //=========================================================================== IncLotSize
                    if((Clicked == OBJPREFIX + "LBL_TrailingDN") && (ct_Drive.TDD.ct_Ticket._Modifier.TrailStopInp == 0))
                              if(ObjectFind(0, OBJPREFIX + "EDT_Trailing") >= 0)ObjectSetString(0, OBJPREFIX + "EDT_Trailing", OBJPROP_TEXT, 0, IntegerToString(ct_Drive.TDD.ct_Ticket._Modifier.TrailStopInp -= ct_Drive.TDD.ct_Ticket._Modifier.TrailStopStep)); //Set_Object
                    //=================================================================
                    if(Clicked == OBJPREFIX + "EDT_Trailing")////important toset
                              if(ObjectFind(0, OBJPREFIX + "EDT_Trailing") >= 0)
                                        ct_Drive.TDD.ct_Ticket._Modifier.TrailStopInp = (int)ObjectGetString(0, OBJPREFIX + "EDT_Trailing", OBJPROP_TEXT); //Set_Object
                    ________________________________________________________Xerorr.SuperviserX(_LastError, "C_TRADEPANEL",  __LINE__, __FUNCTION__); //|
                    //=========================================================|
          }//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Cp_SubStatus::_Show(int WhichMode, bool IsKey, color clrBody = clrWhite, color clrBodyMargine = clrNavy, color clrBodyText = clrNavy, color clrBodyCyrcle = clrRed)
{         int stepaX  = 75;
          int stepaY  = 25;
          int SizeX = 0;
          int movestep = SizeX + (int)(SizeX * 1.6) + (SizeX * 7)  ;
          int MoveY = -50;
          int MoveX = 80;
          int FontSize = -3;//
//movestep += movestep * stepa * 1
//if(0)
//{         Complex.Menu_ButtonX(IsKey, "C" + "1", SizeX, 0, movestep * 1, 0);
//          Complex.Menu_ButtonX(IsKey, "C" + "2", SizeX, 0, movestep * 2, 0);
//          Complex.Menu_ButtonX(IsKey, "C" + "3", SizeX, 0, movestep * 3, 0);
//          Complex.Menu_ButtonX(IsKey, "C" + "4", SizeX, 0, movestep * 4, 0);
//          Complex.Menu_ButtonX(IsKey, "C" + "5", SizeX, 0, movestep * 5, 0); }
          if(0)//Horizontal
          {         Complex.Menu_ButtonX(WhichMode, IsKey, "GoldVip",    stepaX * 1, MoveY,                SizeX * 0, 0,  FontSize, clrBody, clrBodyMargine, clrBodyText, clrBodyCyrcle);
                    Complex.Menu_ButtonX(WhichMode, IsKey, "TopMiddle",  stepaX * 2, MoveY,                SizeX * 1, 0,  FontSize);
                    Complex.Menu_ButtonX(WhichMode, IsKey, "PadMini",    stepaX * 3, MoveY,                SizeX * 1, 0,  FontSize); } //
          if(1)//vertical
          {         Complex.Menu_ButtonX(WhichMode, IsKey, "GoldVip",    MoveX, MoveY + 50 + stepaY * -1,  SizeX * 0, 0,  FontSize, clrBody, clrBodyMargine, clrBodyText, clrBodyCyrcle);
                    Complex.Menu_ButtonX(WhichMode, IsKey, "TopMiddle",  MoveX, MoveY + 50 + stepaY * -2,  SizeX * 1, 0,  FontSize);
                    Complex.Menu_ButtonX(WhichMode, IsKey, "PadMini",    MoveX, MoveY + 50 + stepaY * -3,  SizeX * 1, 0,  FontSize); //
          } //
}//
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
//void Cp_SubStatus::ButtonMove()
//{
//          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
//                    LabelX.GDS.Set_Desc_4("StatusSubTopMiddleMoveLeftO1-X", "n", "Webdings", 13);
//                    LabelX.GDS.Set_Color_1(clrBodyMargine);
//                    LabelX.GDS.Set_Location_5((int)(258) + MoveX0 + Curr_MoveX, Curr_MoveY + MoveY0 + (int)(12), 0, CORNER_LEFT_UPPER, ANCHOR_RIGHT);
//                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "TopMiddleMoveLeftO1");
//                    LabelX.GDS.Set_Chart_6();
//                    LabelX.Action(LabelX);//
//                    //0// LBL_.Create(Is_Create, Is_Move, "StatusSubTopMiddleMoveLeftO1-X", "n",
//                    //0//  MoveX0 + Curr_MoveX +  (int)(258), (int)(12) + Curr_MoveY + MoveY0,
//                    //0// CORNER_LEFT_UPPER, ANCHOR_RIGHT, false, clrBodyMargine, 0, 13, "Webdings"); //
//          }//===================================================================================================================================================================
//          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey); Sleep(500);
//                    LabelX.GDS.Set_Desc_4("StatusSubTopMiddleMoveLeftO2-X", "n", "Webdings", 10);
//                    LabelX.GDS.Set_Color_1(clrBodyCyrcle);
//                    LabelX.GDS.Set_Location_5((int)(256) + MoveX0 + Curr_MoveX, Curr_MoveY + MoveY0 + (int)(11), 0, CORNER_LEFT_UPPER, ANCHOR_RIGHT);
//                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "TopMiddleMoveLeftO2");
//                    LabelX.GDS.Set_Chart_6();
//                    LabelX.Action(LabelX);//
//                    //0// LBL_.Create(Is_Create, Is_Move, "StatusSubTopMiddleMoveLeftO2-X", "n",
//                    //0//  MoveX0 + Curr_MoveX +  (int)(256), (int)(11) + Curr_MoveY + MoveY0,
//                    //0//  CORNER_LEFT_UPPER, ANCHOR_RIGHT, false, clrBodyCyrcle, 0, 10, "Webdings"); //
//          }//===================================================================================================================================================================
//          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
//                    LabelX.GDS.Set_Desc_4("StatusSubTopMiddleMove-X", "n", "Webdings", 7);
//                    LabelX.GDS.Set_Color_1(clrWhite);
//                    LabelX.GDS.Set_Location_5((int)(254) + MoveX0 + Curr_MoveX, Curr_MoveY + MoveY0 + (int)(10), 0, CORNER_LEFT_UPPER, ANCHOR_RIGHT);
//                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "TopMiddleMove");
//                    LabelX.GDS.Set_Chart_6();
//                    LabelX.Action(LabelX);//
//                    //0// LBL_.Create(Is_Create, Is_Move, "StatusSubTopMiddleMove-X", "n",
//                    //0// MoveX0 + Curr_MoveX +  (int)(254), (int)(10) + Curr_MoveY + MoveY0,
//                    //0// CORNER_LEFT_UPPER, ANCHOR_RIGHT, false, clrWhite, 0, 7, "Webdings");
//          }//===================================================================================================================================================================
//}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
//void  Cp_SubStatus::ButtonClear()
//{
//          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
//                    LabelX.GDS.Set_Desc_4("StatusSubTopMiddleClearLeftO1-X", "n", "Webdings", 13);
//                    LabelX.GDS.Set_Color_1(clrBodyMargine);
//                    LabelX.GDS.Set_Location_5((int)(276) + MoveX0 + Curr_MoveX, Curr_MoveY + MoveY0 + 12, 0, CORNER_LEFT_UPPER, ANCHOR_RIGHT);
//                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "TopMiddleClearLeftO1");
//                    LabelX.GDS.Set_Chart_6();
//                    LabelX.Action(LabelX);//
//                    //0// LBL_.Create(Is_Create, Is_Move, "StatusSubTopMiddleClearLeftO1-X", "n",
//                    //0// MoveX0 + Curr_MoveX +  (int)(276), (int)(12) + Curr_MoveY + MoveY0,
//                    //0// CORNER_LEFT_UPPER, ANCHOR_RIGHT, false, clrBodyMargine, 0, 13, "Webdings"); //
//          }
//          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
//                    LabelX.GDS.Set_Desc_4("StatusSubTopMiddleClearLeftO2-X", "n", "Webdings", 10);
//                    LabelX.GDS.Set_Color_1(clrBodyCyrcle);
//                    LabelX.GDS.Set_Location_5((int)(256) + MoveX0 + Curr_MoveX, Curr_MoveY + MoveY0 + (int)(11), 0, CORNER_LEFT_UPPER, ANCHOR_RIGHT);
//                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "TopMiddleClearLeftO2");
//                    LabelX.GDS.Set_Chart_6();
//                    LabelX.Action(LabelX);//
//                    //0// LBL_.Create(Is_Create, Is_Move, "StatusSubTopMiddleClearLeftO2-X", "n",
//                    //0// MoveX0 + Curr_MoveX +  (int)(274), (int)(11) + Curr_MoveY + MoveY0,
//                    //0//  CORNER_LEFT_UPPER, ANCHOR_RIGHT, false, clrBodyCyrcle, 0, 10, "Webdings"); //
//          }
//          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
//                    LabelX.GDS.Set_Desc_4("StatusSubTopMiddleClear-X", "n", "Webdings", 11);
//                    LabelX.GDS.Set_Color_1(clrWhite);
//                    LabelX.GDS.Set_Location_5((int)(275.5) + MoveX0 + Curr_MoveX, Curr_MoveY + MoveY0 + 11 + 5, 0, CORNER_LEFT_UPPER, ANCHOR_RIGHT);
//                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "TopMiddleClear");
//                    LabelX.GDS.Set_Chart_6();
//                    LabelX.Action(LabelX);//
//                    //0// LBL_.Create(Is_Create, Is_Move, "StatusSubTopMiddleClear-X", "q",
//                    //0// MoveX0 + Curr_MoveX +  (int)(275.5), (int)(11) + Curr_MoveY + MoveY0,
//                    //0// CORNER_LEFT_UPPER, ANCHOR_RIGHT, false, clrWhite, 0, 11, "Webdings");
//          }//
//}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
//void Cp_SubStatus::ButtonExit()
//{
//          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
//                    LabelX.GDS.Set_Desc_4("StatusSubTopMiddleExitLeftO1-X", "n", "Webdings", 13);
//                    LabelX.GDS.Set_Color_1(clrBodyMargine);
//                    LabelX.GDS.Set_Location_5((int)(276) + MoveX0 + Curr_MoveX, Curr_MoveY + MoveY0 + (int)(12), 0, CORNER_LEFT_UPPER, ANCHOR_RIGHT);
//                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "TopMiddleExitLeftO");
//                    LabelX.GDS.Set_Chart_6();
//                    LabelX.Action(LabelX);//
//                    //0// LBL_.Create(Is_Create, Is_Move, "StatusSubTopMiddleExitLeftO1-X", "n",
//                    //0// MoveX0 + Curr_MoveX +  (int)(294), (int)(12) + Curr_MoveY + MoveY0,
//                    //0// CORNER_LEFT_UPPER, ANCHOR_RIGHT, false, clrBodyMargine, 0, 13, "Webdings"); //
//          }//===================================================================================================================================================================
//          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
//                    LabelX.GDS.Set_Desc_4("StatusSubTopMiddleExitLeftO2-X", "n", "Webdings", 10);
//                    LabelX.GDS.Set_Color_1(clrBodyCyrcle);
//                    LabelX.GDS.Set_Location_5((int)(292) + MoveX0 + Curr_MoveX, Curr_MoveY + MoveY0 + (int)(11), 0, CORNER_LEFT_UPPER, ANCHOR_RIGHT);
//                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "TopMiddleExitLeftO2"); LabelX.GDS.Set_Chart_6();
//                    LabelX.Action(LabelX);//
//                    //0// LBL_.Create(Is_Create, Is_Move, "StatusSubTopMiddleExitLeftO2-X", "n",
//                    //0// MoveX0 + Curr_MoveX +  (int)(292), (int)(11) + Curr_MoveY + MoveY0,
//                    //0// CORNER_LEFT_UPPER, ANCHOR_RIGHT, false, clrBodyCyrcle, 0, 10, "Webdings"); //
//          }//===================================================================================================================================================================
//          {         LabelX.Action(LabelX);//
//                    LabelX.GDS.Set_Desc_4("StatusSubTopMiddleExit-X", "n", "Webdings", 10);
//                    LabelX.GDS.Set_Color_1(clrWhite);
//                    LabelX.GDS.Set_Location_5((int)(292) + MoveX0 + Curr_MoveX, Curr_MoveY + MoveY0 + (int)(11), 0, CORNER_LEFT_UPPER, ANCHOR_RIGHT);
//                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "TopMiddleExit");
//                    LabelX.GDS.Set_Chart_6();
//                    LabelX.GDS.Set_Action_2(WhichMode, IsKey);
//                    //0// LBL_.Create(Is_Create, Is_Move, "StatusSubTopMiddleExit-X", "r",
//                    //0// MoveX0 + Curr_MoveX +  (int)(292), (int)(11) + Curr_MoveY + MoveY0,
//                    //0// CORNER_LEFT_UPPER, ANCHOR_RIGHT, false, clrWhite, 0, 10, "Webdings");
//          }//===================================================================================================================================================================
//}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
//void Cp_SubStatus::ButtonMini()
//{
//          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
//                    LabelX.GDS.Set_Desc_4("StatusSubTopMiddleMiniLeftO1-X", "n", "Webdings", 13);
//                    LabelX.GDS.Set_Color_1(clrBodyMargine);
//                    LabelX.GDS.Set_Location_5((int)(312) + MoveX0 + Curr_MoveX, Curr_MoveY + MoveY0 + (int)(12), 0, CORNER_LEFT_UPPER, ANCHOR_RIGHT);
//                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "TopMiddleMiniLeftO1");
//                    LabelX.GDS.Set_Chart_6();
//                    LabelX.Action(LabelX);//
//                    //0// LBL_.Create(Is_CreateMini, Is_Move, "StatusSubTopMiddleMiniLeftO1-X", "n",
//                    //0// Curr_MoveX +  (int)(312) + 0, (int)(12) + Curr_MoveY - 0,
//                    //0// CORNER_LEFT_UPPER, ANCHOR_RIGHT, false, clrBodyMargine, 0, 13, "Webdings"); //
//          }//===================================================================================================================================================================
//          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
//                    LabelX.GDS.Set_Desc_4("StatusSubTopMiddleMiniLeftO2-X", "n", "Webdings", 10);
//                    LabelX.GDS.Set_Color_1(clrBodyCyrcle);
//                    LabelX.GDS.Set_Location_5((int)(310) + MoveX0 + Curr_MoveX, Curr_MoveY + MoveY0 + (int)(11), 0, CORNER_LEFT_UPPER, ANCHOR_RIGHT);
//                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "TopMiddleMiniLeftO2");
//                    LabelX.GDS.Set_Chart_6();
//                    LabelX.Action(LabelX);//
//                    //0// LBL_.Create(Is_CreateMini, Is_Move, "StatusSubTopMiddleMiniLeftO2-X", "n",
//                    //0// Curr_MoveX +  (int)(310) + 0, (int)(11) + Curr_MoveY - 0,
//                    //0// CORNER_LEFT_UPPER, ANCHOR_RIGHT, false, clrBodyCyrcle, 0, 10, "Webdings"); //
//          }//===================================================================================================================================================================
//          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
//                    LabelX.GDS.Set_Desc_4("StatusSubTopMiddleMini-X", "0", "Webdings", 10);
//                    LabelX.GDS.Set_Color_1(clrWhite);
//                    LabelX.GDS.Set_Location_5((int)(310) + MoveX0 + Curr_MoveX, Curr_MoveY + MoveY0 + (int)(11), 0, CORNER_LEFT_UPPER, ANCHOR_RIGHT);
//                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "TopMiddleMini");
//                    LabelX.GDS.Set_Chart_6();
//                    LabelX.Action(LabelX);//
//                    //0// LBL_.Create(Is_CreateMini, Is_Move, "StatusSubTopMiddleMini-X", "0",
//                    //0// Curr_MoveX +  (int)(310) + 0, (int)(11) + Curr_MoveY - 0,
//                    //0//CORNER_LEFT_UPPER, ANCHOR_RIGHT, false, clrWhite, 0, 10, "Webdings"); ///
//          }//===================================================================================================================================================================
//}
//+------------------------------------------------------------------+
//||   ||||||||||                 Cp_SubStatus.mqh                  ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
