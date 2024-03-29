//+------------------------------------------------------------------+
//||   ||||||||||                 Cp_SubEMA.mqh                     ||
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
class Cp_StatusSubTopMiddle
{         //---
          //---
          //---
public:
          //---TopMiddle
          bool                  _Call(int WhichMode, bool IsKey, int MoveX, int MoveY, int LineCOM = 0, string FuncCome = "None");
          bool                  _Show(int WhichMode, bool IsKey, int Curr_MoveX, int Curr_MoveY );
          void                  ButtonMove();
          void                  ButtonClear();
          void                  ButtonExit();
          void                  ButtonMini();
          void                  _OBJECT_CLICK();
          void                  Update(); //OnTimer
          //------------------------------------------------------------------------------------
          bool                  IsMoving;
          bool                  IsPressMini;
          bool                  TopMiddle_is_exite;
          //---
          int                   LastMoveX;// = MoveXCom;
          int                   LastMoveY;// = MoveXCom;
          //--Keys
          bool                  IsPadPressed;
          //---
          C_MasterPanel       SubTopMiddle;
          //---
          //---
          //---
};
//+------------------------------------------------------------------+
//|                                                                  |RightMenu.SubStatus.TopMiddle._Call(MODE_MOVE, true, (int)(Event.lparam - 250), (int)(Event.dparam - 15));
//+------------------------------------------------------------------+
bool Cp_StatusSubTopMiddle::_Call(int WhichMode, bool IsKey, int MoveX, int MoveY, int LineCOM = 0, string FuncCome = "None" )
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_RightMenuPad Error",  __LINE__, __FUNCTION__); //|
          //=========================================================| bool Is_Create = true, bool  Is_CreateMini = false, bool Is_Move  = false,
          //---controll keys update
          //---
          //---
          IsPadPressed = ((WhichMode == MODE_CREATE) | (WhichMode == MODE_MINI))& IsKey ;//(Is_Create | Is_CreateMini) &
          //===========================================================================================================
          if(WhichMode == MODE_CREATE && IsKey && TopMiddle_is_exite)   {IsPressMini = true;  TopMiddle_is_exite = false;}
          else                                                          {IsPressMini = false; TopMiddle_is_exite = true;}
          //===========================================================================================================
          if(WhichMode == MODE_MINI && IsKey)   {IsPressMini = true;}
          else                                  {IsPressMini = false;}
          //===========================================================================================================IsMoving = false;
          {         //
                    //static int Curr_MoveX;
                    //static int Curr_MoveY;
                    if(WhichMode == MODE_CREATE) //&& Is_CreateMini
                    {         //
                              if(IsKey)
                              {         //Alert("LastMoveX: ", LastMoveX, "----Curr_MoveX: ", Curr_MoveX); ///]
                                        return _Show(WhichMode, IsKey,   LastMoveX = MoveX,   LastMoveY = MoveY );
                                        //
                              }
                              else {         return _Show(WhichMode, IsKey,   LastMoveX = MoveX,   LastMoveY = MoveY  ); } //
                    } //
                    else if(WhichMode == MODE_MINI) { return _Show(WhichMode, IsKey, LastMoveX, LastMoveY ); }
                    else if(WhichMode == MODE_MOVE) { return _Show(WhichMode, IsKey, MoveX, MoveY  );}//
          }//
          int SelectedMODE = 0;
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_RightMenuPad Error",  __LINE__, __FUNCTION__); //|
          return false;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Cp_StatusSubTopMiddle::_Show(int WhichMode, bool IsKey, int Curr_MoveX, int Curr_MoveY )
{         //---
          //---
          //---
          if(WhichMode == MODE_MINI && IsPressMini)     {WhichMode = MODE_CREATE; IsKey = false;}
          if(WhichMode == MODE_MINI && !IsPressMini)    {WhichMode = MODE_CREATE; IsKey = true;}
          //---
          Curr_MoveX = Curr_MoveX + 0;
          Curr_MoveY = Curr_MoveY + 0;
          int SizeY_Indepent = 10;
          int Y_indpend = 10;
          //--
          int SizeX = 30, SizeY = 13;//if(false)
          {
                    {         RectLabelX.GDS.Set_Action_2(WhichMode, IsKey);
                              RectLabelX.GDS.Set_Desc_1("PanelBorderTopMiddleX");
                              RectLabelX.GDS.Set_Tip_3(STYLE_SOLID, 1, BORDER_FLAT );
                              RectLabelX.GDS.Set_Color_2(clrGold, clrBlack);
                              RectLabelX.GDS.Set_Location_5(297 + Curr_MoveX, Curr_MoveY + 1 - 2, SizeX = 451, SizeY = PANEL_INDENT_TOP + 11 + SizeY_Indepent, CORNER_LEFT_UPPER);
                              RectLabelX.GDS.Set_Chart_6();
                              RectLabelX.GDS.Set_Common_6(false, 10, false, false, false, RLDEF_tooltip + "PanelBorderTopMiddleX");
                              RectLabelX.Action(RectLabelX);//
                              //0// RLBL_TopMiddle.Create(Is_Create, Is_Move, "PanelBorderTopMiddleX",  "RightBorderBS",
                              //0// Curr_MoveX + (int)(297.18), (int)(1.44) + Curr_MoveY - 2, SizeX = 451, SizeY = PANEL_INDENT_TOP + 9 + 2,
                              //0// CORNER_LEFT_UPPER, ANCHOR_UPPER, True, BORDER_FLAT, clrGold, clrBlack,              0, STYLE_SOLID, 1, 8, "Arial" );
                    }//===================================================================================================================================================================
                    {         RectLabelX.GDS.Set_Action_2(WhichMode, IsKey);
                              RectLabelX.GDS.Set_Desc_1("PanelBorderTopMiddleX2");
                              RectLabelX.GDS.Set_Tip_3(STYLE_SOLID, 1, BORDER_FLAT );
                              RectLabelX.GDS.Set_Color_2(clrDarkRed, clrBlack);
                              RectLabelX.GDS.Set_Location_5((int)(299) + Curr_MoveX, Curr_MoveY + 1, SizeX = 445 + 2, SizeY = PANEL_INDENT_TOP + 7 + SizeY_Indepent, CORNER_LEFT_UPPER);
                              RectLabelX.GDS.Set_Chart_6();
                              RectLabelX.GDS.Set_Common_6(false, 10, false, false, false, RLDEF_tooltip + "PanelBorderTopMiddleX2");
                              RectLabelX.Action(RectLabelX);//
                              //0// RLBL_TopMiddle.Create(Is_Create, Is_Move, "PanelBorderTopMiddleX2",  "RightBorderBS",
                              //0// Curr_MoveX +  (int)(299), (int)(1.6) + Curr_MoveY, SizeX = 445 + 2, SizeY = PANEL_INDENT_TOP + 7,
                              //0// CORNER_LEFT_UPPER, ANCHOR_UPPER, True, BORDER_FLAT, clrDarkRed, clrBlack,           0, STYLE_SOLID, 1, 8, "Arial" );
                    }//===================================================================================================================================================================
          }//
          //===========================================================================================================
          {
                    {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                              LabelX.GDS.Set_Desc_4("ATR", "ATR ->>", "Arial bold", 7);
                              LabelX.GDS.Set_Color_1(clrWhite);
                              LabelX.GDS.Set_Location_5(325 + Curr_MoveX, Curr_MoveY + 7, 0, CORNER_LEFT_UPPER, ANCHOR_LEFT);
                              LabelX.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "ATR");
                              LabelX.GDS.Set_Chart_6();
                              LabelX.Action(LabelX);//
                              //0// LBL_ATR.Create(Is_Create, Is_Move, "LBL_ATR", "ATR ->>",
                              //0// Curr_MoveX + (int)(325), (int)(9.6) + Curr_MoveY, CORNER_LEFT_UPPER, ANCHOR_LEFT, false,  clrWhite, 0, 7, "Arial bold");
                    }//===================================================================================================================================================================
                    {         RectLabelX.GDS.Set_Action_2(WhichMode, IsKey);
                              RectLabelX.GDS.Set_Desc_1("GabATR");
                              RectLabelX.GDS.Set_Tip_3(STYLE_SOLID, 1, BORDER_FLAT);
                              RectLabelX.GDS.Set_Color_2(clrYellow, clrBlack);
                              RectLabelX.GDS.Set_Location_5( 325 + Curr_MoveX, Curr_MoveY + 14 + Y_indpend, SizeX = 42, SizeY = 7, CORNER_LEFT_UPPER);
                              RectLabelX.GDS.Set_Chart_6();
                              RectLabelX.GDS.Set_Common_6(false, 10, false, false, false, RLDEF_tooltip + "GabATR");
                              RectLabelX.Action(RectLabelX);//
                              //0// RLBL_GabATR.Create(Is_Create, Is_Move, "RLBL_GabATR", "",
                              //0// Curr_MoveX + (int)(325), (int)(14.4) + Curr_MoveY, SizeX = 42, SizeY = 7,
                              //0// CORNER_LEFT_UPPER, ANCHOR_UPPER, True, BORDER_FLAT, clrYellow, clrBlack, 0, STYLE_SOLID, 1, 8, "Arial" );
                    }//===================================================================================================================================================================
                    for(int i = 1; i <= 4; i++)
                    {
                              {         RectLabelX.GDS.Set_Action_2(WhichMode, IsKey);
                                        RectLabelX.GDS.Set_Desc_1("GabATR" + IntegerToString(i));
                                        RectLabelX.GDS.Set_Tip_3(STYLE_SOLID, 1, BORDER_FLAT );
                                        RectLabelX.GDS.Set_Color_2(clrRed, clrBlack);
                                        RectLabelX.GDS.Set_Location_5( (int)(327.6) + (i * 2) + Curr_MoveX, Curr_MoveY + 16+ Y_indpend, SizeX = 10, SizeY = 3, CORNER_LEFT_UPPER);
                                        RectLabelX.GDS.Set_Chart_6();
                                        RectLabelX.GDS.Set_Common_6(false, 10, false, false, false, RLDEF_tooltip + "GabATR" + IntegerToString(i));
                                        RectLabelX.Action(RectLabelX);//
                                        //0// RLBL_TopMiddle.Create(Is_Create, Is_Move, "RLBL_ATR" + IntegerToString(i), "",
                                        //0// Curr_MoveX + (int)(327.6) + (i * 2), (int)(16) + Curr_MoveY, SizeX = 10, SizeY = 3,
                                        //0// CORNER_LEFT_UPPER, ANCHOR_UPPER, True, BORDER_FLAT, clrRed, clrBlack,              0, STYLE_SOLID, 1, 8, "Arial" );
                              }//===================================================================================================================================================================
                    }//
          }
          //---
          ///OBV off -50
          {
                    {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                              LabelX.GDS.Set_Desc_4("OBV", "OBV ->>", "Arial bold", 7);
                              LabelX.GDS.Set_Color_1(clrWhite);
                              LabelX.GDS.Set_Location_5( 377 + Curr_MoveX, Curr_MoveY + 7, 0, CORNER_LEFT_UPPER, ANCHOR_LEFT);
                              LabelX.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "OBV");
                              LabelX.GDS.Set_Chart_6();
                              LabelX.Action(LabelX);//
                              //0// LBL_OBV.Create(Is_Create, Is_Move, "LBL_OBV", "OBV ->>",
                              //0// Curr_MoveX + (int)(377), (int)(9.6) + Curr_MoveY, CORNER_LEFT_UPPER, ANCHOR_LEFT, false,  clrWhite, 0, 7, "Arial bold");
                    }
                    //===================================================================================================================================================================
                    {         RectLabelX.GDS.Set_Action_2(WhichMode, IsKey);
                              RectLabelX.GDS.Set_Desc_1("GabOBV");
                              RectLabelX.GDS.Set_Tip_3(STYLE_SOLID, 1, BORDER_FLAT );
                              RectLabelX.GDS.Set_Color_2(clrYellow, clrBlack);
                              RectLabelX.GDS.Set_Location_5( 377 + Curr_MoveX, Curr_MoveY + 14+ Y_indpend, SizeX = 42, SizeY = 7, CORNER_LEFT_UPPER);
                              RectLabelX.GDS.Set_Chart_6();
                              RectLabelX.GDS.Set_Common_6(false, 10, false, false, false, RLDEF_tooltip + "GabOBV");
                              RectLabelX.Action(RectLabelX);//
                              //0// RLBL_GabOBV.Create(Is_Create, Is_Move, "RLBL_GabOBV", "",
                              //0// Curr_MoveX + (int)(377), (int)(14.4) + Curr_MoveY, SizeX = 42, SizeY = 7,
                              //0// CORNER_LEFT_UPPER, ANCHOR_UPPER, True, BORDER_FLAT, clrYellow, clrBlack, 0, STYLE_SOLID, 1, 8, "Arial" );
                    }//===================================================================================================================================================================
                    {         RectLabelX.GDS.Set_Action_2(WhichMode, IsKey);
                              RectLabelX.GDS.Set_Desc_1("OBV");
                              RectLabelX.GDS.Set_Tip_3(STYLE_SOLID, 1, BORDER_FLAT );
                              RectLabelX.GDS.Set_Color_2(clrRed, clrBlack);
                              RectLabelX.GDS.Set_Location_5(380 + Curr_MoveX, 16 + Curr_MoveY+ Y_indpend, SizeX = 10, SizeY = 3, CORNER_LEFT_UPPER);
                              RectLabelX.GDS.Set_Chart_6();
                              RectLabelX.GDS.Set_Common_6(false, 10, false, false, false, RLDEF_tooltip + "OBV");
                              RectLabelX.Action(RectLabelX);//
                              //0// RLBL_OBV.Create(Is_Create, Is_Move, "RLBL_OBV", "",
                              //0// Curr_MoveX + (int)(379.6), (int)(16) + Curr_MoveY, SizeX = 10, SizeY = 3,
                              //0// CORNER_LEFT_UPPER, ANCHOR_UPPER, True, BORDER_FLAT, clrRed, clrBlack, 0, STYLE_SOLID, 1, 8, "Arial" );
                    }//===================================================================================================================================================================
          }//
          {         ///////////
                    {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                              LabelX.GDS.Set_Desc_4("RSI", "RSI ->>", "Arial bold", 7);
                              LabelX.GDS.Set_Color_1(clrWhite);
                              LabelX.GDS.Set_Location_5( 475 + Curr_MoveX, Curr_MoveY + 7, 0, CORNER_LEFT_UPPER, ANCHOR_LEFT);
                              LabelX.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "RSI");
                              LabelX.GDS.Set_Chart_6();
                              LabelX.Action(LabelX);//
                              //0// LBL_RSI.Create(Is_Create, Is_Move, "LBL_RSI", "RSI ->>",
                              //0// Curr_MoveX + (int)(475) , (int)(9.6) + Curr_MoveY, CORNER_LEFT_UPPER, ANCHOR_LEFT, false,  clrWhite, 0, 7, "Arial bold");
                    }
                    //===================================================================================================================================================================
                    {         RectLabelX.GDS.Set_Action_2(WhichMode, IsKey);
                              RectLabelX.GDS.Set_Desc_1("GabRSI");
                              RectLabelX.GDS.Set_Tip_3(STYLE_SOLID, 1, BORDER_FLAT );
                              RectLabelX.GDS.Set_Color_2(clrYellow, clrBlack);
                              RectLabelX.GDS.Set_Location_5( 475 + Curr_MoveX, Curr_MoveY + 14+ Y_indpend, SizeX = 42, SizeY = 7, CORNER_LEFT_UPPER);
                              RectLabelX.GDS.Set_Chart_6();
                              RectLabelX.GDS.Set_Common_6(false, 10, false, false, false, RLDEF_tooltip + "GabRSI");
                              RectLabelX.Action(RectLabelX);//
                              //0// RLBL_GabRSI.Create(Is_Create, Is_Move, "RLBL_GabRSI", "",
                              //0// Curr_MoveX + (int)(475) , (int)(14.4) + Curr_MoveY, SizeX = 42, SizeY = 7,
                              //0// CORNER_LEFT_UPPER, ANCHOR_UPPER, True, BORDER_FLAT, clrYellow, clrBlack,           0, STYLE_SOLID, 1, 8, "Arial" );
                    }//===================================================================================================================================================================
                    {         RectLabelX.GDS.Set_Action_2(WhichMode, IsKey);
                              RectLabelX.GDS.Set_Desc_1("RSI");
                              RectLabelX.GDS.Set_Tip_3(STYLE_SOLID, 1, BORDER_FLAT );
                              RectLabelX.GDS.Set_Color_2(clrRed, clrBlack);
                              RectLabelX.GDS.Set_Location_5( 477 + Curr_MoveX, Curr_MoveY + 14, SizeX = 10, SizeY = 3, CORNER_LEFT_UPPER);
                              RectLabelX.GDS.Set_Chart_6();
                              RectLabelX.GDS.Set_Common_6(false, 10, false, false, false, RLDEF_tooltip + "OBV");
                              RectLabelX.Action(RectLabelX);//
                              //0// RLBL_RSI.Create(Is_Create, Is_Move, "RLBL_RSI", "",
                              //0// Curr_MoveX + (int)(477.6) , (int)(16) + Curr_MoveY, SizeX = 10, SizeY = 3,
                              //0// CORNER_LEFT_UPPER, ANCHOR_UPPER, True, BORDER_FLAT, clrRed, clrBlack,              0, STYLE_SOLID, 1, 8, "Arial" );
                    }//===================================================================================================================================================================
          }//
          //===========================================================================================================
          //===========================================================================================================
          {
                    {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                              LabelX.GDS.Set_Desc_4("WRp", "WR% ->>", "Arial bold", 7);
                              LabelX.GDS.Set_Color_1(clrWhite);
                              LabelX.GDS.Set_Location_5( 540 + Curr_MoveX, Curr_MoveY + 7, 0, CORNER_LEFT_UPPER, ANCHOR_LEFT);
                              LabelX.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "WRp");
                              LabelX.GDS.Set_Chart_6();
                              LabelX.Action(LabelX);//
                              //0// LBL_WRp.Create(Is_Create, Is_Move, "LBL_WRp", "WR% ->>",
                              //0// Curr_MoveX + (int)(540) , (int)(9.6) + Curr_MoveY, CORNER_LEFT_UPPER, ANCHOR_LEFT, false,  clrWhite, 0, 7, "Arial bold");
                    }//===================================================================================================================================================================
                    {         RectLabelX.GDS.Set_Action_2(WhichMode, IsKey);
                              RectLabelX.GDS.Set_Desc_1("GabWRp");
                              RectLabelX.GDS.Set_Tip_3(STYLE_SOLID, 1, BORDER_FLAT );
                              RectLabelX.GDS.Set_Color_2(clrYellow, clrBlack);
                              RectLabelX.GDS.Set_Location_5( 540 + Curr_MoveX, Curr_MoveY + 14+ Y_indpend, SizeX = 42, SizeY = 7, CORNER_LEFT_UPPER);
                              RectLabelX.GDS.Set_Chart_6();
                              RectLabelX.GDS.Set_Common_6(false, 10, false, false, false, RLDEF_tooltip + "GabWRp");
                              RectLabelX.Action(RectLabelX);//
                              //0// RLBL_GabWRp.Create(Is_Create, Is_Move, "RLBL_GabWRp", "",
                              //0// Curr_MoveX + (int)(540), (int)(14.4) + Curr_MoveY, SizeX = 42, SizeY = 7,
                              //0//  CORNER_LEFT_UPPER, ANCHOR_UPPER, True, BORDER_FLAT, clrYellow, clrBlack,           0, STYLE_SOLID, 1, 8, "Arial" );
                    }//===================================================================================================================================================================
                    {         RectLabelX.GDS.Set_Action_2(WhichMode, IsKey); //// Yipoin==78887777777544444485855555544454t,
                              RectLabelX.GDS.Set_Desc_1("WRp");
                              RectLabelX.GDS.Set_Tip_3(STYLE_SOLID, 1, BORDER_FLAT );
                              RectLabelX.GDS.Set_Color_2(clrRed, clrBlack);
                              RectLabelX.GDS.Set_Location_5( (int)(542.6) + Curr_MoveX, Curr_MoveY + (int)(16), SizeX = 10, SizeY = 3, CORNER_LEFT_UPPER);
                              RectLabelX.GDS.Set_Chart_6();
                              RectLabelX.GDS.Set_Common_6(false, 10, false, false, false, RLDEF_tooltip + "WRp");
                              RectLabelX.Action(RectLabelX);//
                              //0// RLBL_WRp.Create(Is_Create, Is_Move, "RLBL_WRp", "",
                              //0// Curr_MoveX + (int)(542.6), (int)(16) + Curr_MoveY, SizeX = 10, SizeY = 3,
                              //0// CORNER_LEFT_UPPER, ANCHOR_UPPER, True, BORDER_FLAT, clrRed, clrBlack,              0, STYLE_SOLID, 1, 8, "Arial" ); //
                    }//===================================================================================================================================================================
          } /////////////////////
          //===========================================================================================================//signall girl has more tuuk
          {
                    {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                              LabelX.GDS.Set_Desc_4("MACDmain", "MACDmain ->>", "Arial bold", 7);
                              LabelX.GDS.Set_Color_1(clrWhite);
                              LabelX.GDS.Set_Location_5((int)(605) + Curr_MoveX, Curr_MoveY + 7, 0, CORNER_LEFT_UPPER, ANCHOR_LEFT);
                              LabelX.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "MACDmain");
                              LabelX.GDS.Set_Chart_6();
                              LabelX.Action(LabelX);//
                              //0// LBL_MACDmain.Create(Is_Create, Is_Move, "LBL_MACDmain", "MACDmain ->>",
                              //0// Curr_MoveX + (int)(605), (int)(9.6) + Curr_MoveY, CORNER_LEFT_UPPER, ANCHOR_LEFT, false,  clrWhite, 0, 7, "Arial bold");
                    }//===================================================================================================================================================================
                    {         RectLabelX.GDS.Set_Action_2(WhichMode, IsKey);
                              RectLabelX.GDS.Set_Desc_1("GabMACDmain");
                              RectLabelX.GDS.Set_Tip_3(STYLE_SOLID, 1, BORDER_FLAT );
                              RectLabelX.GDS.Set_Color_2(clrYellow, clrBlack);
                              RectLabelX.GDS.Set_Location_5((int)(605) + Curr_MoveX, Curr_MoveY + 14+ Y_indpend, SizeX = 42, SizeY = 7, CORNER_LEFT_UPPER);
                              RectLabelX.GDS.Set_Chart_6();
                              RectLabelX.GDS.Set_Common_6(false, 10, false, false, false, RLDEF_tooltip + "GabMACDmain");
                              RectLabelX.Action(RectLabelX);//
                              //0// RLBL_GabMACDmain.Create(Is_Create, Is_Move, "RLBL_GabMACDmain", "",
                              //0//  Curr_MoveX + (int)(605), (int)(14.4) + Curr_MoveY, SizeX = 42, SizeY = 7,
                              //0// CORNER_LEFT_UPPER, ANCHOR_UPPER, True, BORDER_FLAT, clrYellow, clrBlack, 0, STYLE_SOLID, 1, 8, "Arial" );
                    }//===================================================================================================================================================================
                    {         RectLabelX.GDS.Set_Action_2(WhichMode, IsKey);
                              RectLabelX.GDS.Set_Desc_1("MACDmain");
                              RectLabelX.GDS.Set_Tip_3(STYLE_SOLID, 1, BORDER_FLAT );
                              RectLabelX.GDS.Set_Color_2(clrRed, clrBlack);
                              RectLabelX.GDS.Set_Location_5( 607 + Curr_MoveX, Curr_MoveY + 16, SizeX = 10, SizeY = 3, CORNER_LEFT_UPPER);
                              RectLabelX.GDS.Set_Chart_6();
                              RectLabelX.GDS.Set_Common_6(false, 10, false, false, false, RLDEF_tooltip + "MACDmain");
                              RectLabelX.Action(RectLabelX);//
                              //0// RLBL_MACDmain.Create(Is_Create, Is_Move, "RLBL_MACDmain", "",
                              //0// Curr_MoveX + (int)(607.6), (int)(16) + Curr_MoveY, SizeX = 10, SizeY = 3,
                              //0// CORNER_LEFT_UPPER, ANCHOR_UPPER, True, BORDER_FLAT, clrRed, clrBlack, 0, STYLE_SOLID, 1, 8, "Arial" ); //
                    }//===================================================================================================================================================================
          } ////////////
          //===========================================================================================================
          {
                    {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                              LabelX.GDS.Set_Desc_4("MACDSignal", "MACDSignal ->>", "Arial bold", 7);
                              LabelX.GDS.Set_Color_1(clrWhite);
                              LabelX.GDS.Set_Location_5(670 + Curr_MoveX, Curr_MoveY + 7, 0, CORNER_LEFT_UPPER, ANCHOR_LEFT);
                              LabelX.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "MACDSignal");
                              LabelX.GDS.Set_Chart_6();
                              LabelX.Action(LabelX);//
                              //0// LBL_MACDSignal.Create(Is_Create, Is_Move, "LBL_MACDSignal", "MACDSignal ->>",
                              //0//  Curr_MoveX + (int)(670), (int)(9.6) + Curr_MoveY, CORNER_LEFT_UPPER, ANCHOR_LEFT, false,  clrWhite, 0, 7, "Arial bold");
                    }//===================================================================================================================================================================
                    {         RectLabelX.GDS.Set_Action_2(WhichMode, IsKey);
                              RectLabelX.GDS.Set_Desc_1("GabMACDSignal");
                              RectLabelX.GDS.Set_Tip_3(STYLE_SOLID, 1, BORDER_FLAT );
                              RectLabelX.GDS.Set_Color_2(clrYellow, clrBlack);
                              RectLabelX.GDS.Set_Location_5( 670 + Curr_MoveX, Curr_MoveY + 14+ Y_indpend, SizeX = 42, SizeY = 7, CORNER_LEFT_UPPER);
                              RectLabelX.GDS.Set_Chart_6();
                              RectLabelX.GDS.Set_Common_6(false, 10, false, false, false, RLDEF_tooltip + "GabMACDSignal");
                              RectLabelX.Action(RectLabelX);//
                              //0// RLBL_GabMACDSignal.Create(Is_Create, Is_Move, "RLBL_GabMACDSignal", "",
                              //0// Curr_MoveX + (int)(670), (int)(14.4) + Curr_MoveY, SizeX = 42, SizeY = 7,
                              //0// CORNER_LEFT_UPPER, ANCHOR_UPPER, True, BORDER_FLAT, clrYellow, clrBlack,           0, STYLE_SOLID, 1, 8, "Arial" );
                    }//===================================================================================================================================================================
                    {         RectLabelX.GDS.Set_Action_2(WhichMode, IsKey);
                              RectLabelX.GDS.Set_Desc_1("MACDSignal");
                              RectLabelX.GDS.Set_Tip_3(STYLE_SOLID, 1, BORDER_FLAT );
                              RectLabelX.GDS.Set_Color_2(clrRed, clrBlack);
                              RectLabelX.GDS.Set_Location_5( 672 + Curr_MoveX, Curr_MoveY + 16, SizeX = 10, SizeY = 3, CORNER_LEFT_UPPER);
                              RectLabelX.GDS.Set_Chart_6();
                              RectLabelX.GDS.Set_Common_6(false, 10, false, false, false, RLDEF_tooltip + "MACDSignal");
                              RectLabelX.Action(RectLabelX);//
                              //0// RLBL_MACDSignal.Create(Is_Create, Is_Move, "RLBL_MACDSignal", "",
                              //0// Curr_MoveX + (int)(672.6), (int)(16) + Curr_MoveY, SizeX = 10, SizeY = 3,
                              //0// CORNER_LEFT_UPPER, ANCHOR_UPPER, True, BORDER_FLAT, clrRed, clrBlack, 0, STYLE_SOLID, 1, 8, "Arial" ); //
                    }//===================================================================================================================================================================
          } //
          //===========================================================================================================
          {         //
                    color clrBodyCyrcle = clrDarkRed;  color clrBodyMargine = clrYellow;
                    //-----------------------------------------------
                    //+------------------------------------------------------------------+
                    //|                                                                  |
                    //+------------------------------------------------------------------+
                    //ButtonMove();
                    {
                              {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                                        LabelX.GDS.Set_Desc_4("StatusSubTopMiddleMoveLeftO1-X", "n", "Webdings", 13);
                                        LabelX.GDS.Set_Color_1(clrBodyMargine);
                                        LabelX.GDS.Set_Location_5(258 + Curr_MoveX, Curr_MoveY  + 12, 0, CORNER_LEFT_UPPER, ANCHOR_RIGHT);
                                        LabelX.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "TopMiddleMoveLeftO1");
                                        LabelX.GDS.Set_Chart_6();
                                        LabelX.Action(LabelX);//
                                        //Alert("WhichMode:",WhichMode,"  IsKey:",IsKey,"  Curr_MoveX:",Curr_MoveX,"     LabelX.XDISTANCE:",LabelX.GDS.XDISTANCE_L_02);
                                        //0// LBL_.Create(Is_Create, Is_Move, "StatusSubTopMiddleMoveLeftO1-X", "n",
                                        //0//  MoveX0 + Curr_MoveX +  (int)(258), (int)(12) + Curr_MoveY + MoveY0,
                                        //0// CORNER_LEFT_UPPER, ANCHOR_RIGHT, false, clrBodyMargine, 0, 13, "Webdings"); //
                              }//===================================================================================================================================================================
                              {         LabelX.GDS.Set_Action_2(WhichMode, IsKey); //Sleep(500);
                                        LabelX.GDS.Set_Desc_4("StatusSubTopMiddleMoveLeftO2-X", "n", "Webdings", 10);
                                        LabelX.GDS.Set_Color_1(clrBodyCyrcle);
                                        LabelX.GDS.Set_Location_5(256 + Curr_MoveX, Curr_MoveY  + 11, 0, CORNER_LEFT_UPPER, ANCHOR_RIGHT);
                                        LabelX.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "TopMiddleMoveLeftO2");
                                        LabelX.GDS.Set_Chart_6();
                                        LabelX.Action(LabelX);//
                                        //0// LBL_.Create(Is_Create, Is_Move, "StatusSubTopMiddleMoveLeftO2-X", "n",
                                        //0//  MoveX0 + Curr_MoveX +  (int)(256), (int)(11) + Curr_MoveY + MoveY0,
                                        //0//  CORNER_LEFT_UPPER, ANCHOR_RIGHT, false, clrBodyCyrcle, 0, 10, "Webdings"); //
                              }//===================================================================================================================================================================
                              {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                                        LabelX.GDS.Set_Desc_4("StatusSubTopMiddleMove-X", "n", "Webdings", 7);
                                        LabelX.GDS.Set_Color_1(clrWhite);
                                        LabelX.GDS.Set_Location_5(254 + Curr_MoveX, Curr_MoveY  + 10, 0, CORNER_LEFT_UPPER, ANCHOR_RIGHT);
                                        LabelX.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "TopMiddleMove");
                                        LabelX.GDS.Set_Chart_6();
                                        LabelX.Action(LabelX);//
                                        //0// LBL_.Create(Is_Create, Is_Move, "StatusSubTopMiddleMove-X", "n",
                                        //0// MoveX0 + Curr_MoveX +  (int)(254), (int)(10) + Curr_MoveY + MoveY0,
                                        //0// CORNER_LEFT_UPPER, ANCHOR_RIGHT, false, clrWhite, 0, 7, "Webdings");
                              }//===================================================================================================================================================================
                    }
                    //+------------------------------------------------------------------+
                    //|                                                                  |
                    //+------------------------------------------------------------------+
                    //ButtonClear();
                    {
                              {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                                        LabelX.GDS.Set_Desc_4("StatusSubTopMiddleClearLeftO1-X", "n", "Webdings", 13);
                                        LabelX.GDS.Set_Color_1(clrBodyMargine);
                                        LabelX.GDS.Set_Location_5((int)(276) + Curr_MoveX, Curr_MoveY  + 12, 0, CORNER_LEFT_UPPER, ANCHOR_RIGHT);
                                        LabelX.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "TopMiddleClearLeftO1");
                                        LabelX.GDS.Set_Chart_6();
                                        LabelX.Action(LabelX);//
                                        //0// LBL_.Create(Is_Create, Is_Move, "StatusSubTopMiddleClearLeftO1-X", "n",
                                        //0// MoveX0 + Curr_MoveX +  (int)(276), (int)(12) + Curr_MoveY + MoveY0,
                                        //0// CORNER_LEFT_UPPER, ANCHOR_RIGHT, false, clrBodyMargine, 0, 13, "Webdings"); //
                              }
                              {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                                        LabelX.GDS.Set_Desc_4("StatusSubTopMiddleClearLeftO2-X", "n", "Webdings", 10);
                                        LabelX.GDS.Set_Color_1(clrBodyCyrcle);
                                        LabelX.GDS.Set_Location_5((int)(274) + Curr_MoveX, Curr_MoveY  + 11, 0, CORNER_LEFT_UPPER, ANCHOR_RIGHT);
                                        LabelX.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "TopMiddleClearLeftO2");
                                        LabelX.GDS.Set_Chart_6();
                                        LabelX.Action(LabelX);//
                                        //0// LBL_.Create(Is_Create, Is_Move, "StatusSubTopMiddleClearLeftO2-X", "n",
                                        //0// MoveX0 + Curr_MoveX +  (int)(274), (int)(11) + Curr_MoveY + MoveY0,
                                        //0//  CORNER_LEFT_UPPER, ANCHOR_RIGHT, false, clrBodyCyrcle, 0, 10, "Webdings"); //
                              }
                              {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                                        LabelX.GDS.Set_Desc_4("StatusSubTopMiddleClear-X", "q", "Webdings", 11);
                                        LabelX.GDS.Set_Color_1(clrWhite);
                                        LabelX.GDS.Set_Location_5((int)(275.5) + Curr_MoveX, Curr_MoveY  + 11, 0, CORNER_LEFT_UPPER, ANCHOR_RIGHT);
                                        LabelX.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "TopMiddleClear");
                                        LabelX.GDS.Set_Chart_6();
                                        LabelX.Action(LabelX);//
                                        //0// LBL_.Create(Is_Create, Is_Move, "StatusSubTopMiddleClear-X", "q",
                                        //0// MoveX0 + Curr_MoveX +  (int)(275.5), (int)(11) + Curr_MoveY + MoveY0,
                                        //0// CORNER_LEFT_UPPER, ANCHOR_RIGHT, false, clrWhite, 0, 11, "Webdings");
                              }//
                    }
                    //+------------------------------------------------------------------+
                    //|                                                                  |
                    //+------------------------------------------------------------------+
                    //ButtonExit();
                    {
                              {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                                        LabelX.GDS.Set_Desc_4("StatusSubTopMiddleExitLeftO1-X", "n", "Webdings", 13);
                                        LabelX.GDS.Set_Color_1(clrBodyMargine);
                                        LabelX.GDS.Set_Location_5( 294  + Curr_MoveX, Curr_MoveY  + 12, 0, CORNER_LEFT_UPPER, ANCHOR_RIGHT);
                                        LabelX.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "TopMiddleExitLeftO");
                                        LabelX.GDS.Set_Chart_6();
                                        LabelX.Action(LabelX);//
                                        //Alert("StatusSubTopMiddleExitLeftO1-X", "       WhichMode: ", WhichMode, "       IsKey:", IsKey, "   X: ", 294  + MoveX0 + Curr_MoveX,          "   Y:",  Curr_MoveY + MoveY0 + 12      );
                                        //0// LBL_.Create(Is_Create, Is_Move, "StatusSubTopMiddleExitLeftO1-X", "n",
                                        //0// MoveX0 + Curr_MoveX +  (int)(294), (int)(12) + Curr_MoveY + MoveY0,
                                        //0// CORNER_LEFT_UPPER, ANCHOR_RIGHT, false, clrBodyMargine, 0, 13, "Webdings"); //
                              }//===================================================================================================================================================================
                              {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                                        LabelX.GDS.Set_Desc_4("StatusSubTopMiddleExitLeftO2-X", "n", "Webdings", 10);
                                        LabelX.GDS.Set_Color_1(clrBodyCyrcle);
                                        LabelX.GDS.Set_Location_5((int)(292) + Curr_MoveX, Curr_MoveY  + 11, 0, CORNER_LEFT_UPPER, ANCHOR_RIGHT);
                                        LabelX.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "TopMiddleExitLeftO2"); LabelX.GDS.Set_Chart_6();
                                        LabelX.Action(LabelX);//
                                        //0// LBL_.Create(Is_Create, Is_Move, "StatusSubTopMiddleExitLeftO2-X", "n",
                                        //0// MoveX0 + Curr_MoveX +  (int)(292), (int)(11) + Curr_MoveY + MoveY0,
                                        //0// CORNER_LEFT_UPPER, ANCHOR_RIGHT, false, clrBodyCyrcle, 0, 10, "Webdings"); //
                              }//===================================================================================================================================================================
                              {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                                        LabelX.GDS.Set_Desc_4("StatusSubTopMiddleExit-X", "r", "Webdings", 10);
                                        LabelX.GDS.Set_Color_1(clrWhite);
                                        LabelX.GDS.Set_Location_5((int)(292) + Curr_MoveX, Curr_MoveY  + 11, 0, CORNER_LEFT_UPPER, ANCHOR_RIGHT);
                                        LabelX.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "TopMiddleExit");
                                        LabelX.GDS.Set_Chart_6();
                                        LabelX.Action(LabelX);//
                                        //0// LBL_.Create(Is_Create, Is_Move, "StatusSubTopMiddleExit-X", "r",
                                        //0// MoveX0 + Curr_MoveX +  (int)(292), (int)(11) + Curr_MoveY + MoveY0,
                                        //0// CORNER_LEFT_UPPER, ANCHOR_RIGHT, false, clrWhite, 0, 10, "Webdings");
                              }//===================================================================================================================================================================
                    }
                    //
                    //-----------------------------------------------
                    // Alert(  "if(Is_Create )-before Is_CreateMini>>: ", Is_CreateMini);//
                    if(!IsPressMini && WhichMode != MODE_MOVE) // if(true)//
                    {         LabelX.Delete("StatusSubTopMiddleMiniLeftO1-X"); //
                              LabelX.Delete("StatusSubTopMiddleMiniLeftO2-X"); //
                              LabelX.Delete("StatusSubTopMiddleMini-X"); //
                              //Alert("Is_CreateMini>>: ", Is_CreateMini);//
                              //Is_CreateMini = true;//
                    }//
                    //+------------------------------------------------------------------+
                    //|                                                                  |
                    //+------------------------------------------------------------------+
                    //ButtonMini();
                    if(!IsPressMini)
                    {
                              {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                                        LabelX.GDS.Set_Desc_4("StatusSubTopMiddleMiniLeftO1-X", "n", "Webdings", 13);
                                        LabelX.GDS.Set_Color_1(clrBodyMargine);
                                        LabelX.GDS.Set_Location_5(312 + Curr_MoveX, Curr_MoveY  + 12, 0, CORNER_LEFT_UPPER, ANCHOR_RIGHT);
                                        LabelX.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "TopMiddleMiniLeftO1");
                                        LabelX.GDS.Set_Chart_6();
                                        LabelX.Action(LabelX);//
                                        //0// LBL_.Create(Is_CreateMini, Is_Move, "StatusSubTopMiddleMiniLeftO1-X", "n",
                                        //0// Curr_MoveX +  (int)(312) + 0, (int)(12) + Curr_MoveY - 0,
                                        //0// CORNER_LEFT_UPPER, ANCHOR_RIGHT, false, clrBodyMargine, 0, 13, "Webdings"); //
                              }//===================================================================================================================================================================
                              {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                                        LabelX.GDS.Set_Desc_4("StatusSubTopMiddleMiniLeftO2-X", "n", "Webdings", 10);
                                        LabelX.GDS.Set_Color_1(clrBodyCyrcle);
                                        LabelX.GDS.Set_Location_5(310 + Curr_MoveX, Curr_MoveY  + 11, 0, CORNER_LEFT_UPPER, ANCHOR_RIGHT);
                                        LabelX.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "TopMiddleMiniLeftO2");
                                        LabelX.GDS.Set_Chart_6();
                                        LabelX.Action(LabelX);//
                                        //0// LBL_.Create(Is_CreateMini, Is_Move, "StatusSubTopMiddleMiniLeftO2-X", "n",
                                        //0// Curr_MoveX +  (int)(310) + 0, (int)(11) + Curr_MoveY - 0,
                                        //0// CORNER_LEFT_UPPER, ANCHOR_RIGHT, false, clrBodyCyrcle, 0, 10, "Webdings"); //
                              }//===================================================================================================================================================================
                              {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                                        LabelX.GDS.Set_Desc_4("StatusSubTopMiddleMini-X", "0", "Webdings", 10);
                                        LabelX.GDS.Set_Color_1(clrWhite);
                                        LabelX.GDS.Set_Location_5(310 + Curr_MoveX, Curr_MoveY  + 11, 0, CORNER_LEFT_UPPER, ANCHOR_RIGHT);
                                        LabelX.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "TopMiddleMini");
                                        LabelX.GDS.Set_Chart_6();
                                        LabelX.Action(LabelX);//
                                        //0// LBL_.Create(Is_CreateMini, Is_Move, "StatusSubTopMiddleMini-X", "0",
                                        //0// Curr_MoveX +  (int)(310) + 0, (int)(11) + Curr_MoveY - 0,
                                        //0//CORNER_LEFT_UPPER, ANCHOR_RIGHT, false, clrWhite, 0, 10, "Webdings"); ///
                              }//===================================================================================================================================================================
                    }
                    //+------------------------------------------------------------------+
                    //|                                                                  |
                    //+------------------------------------------------------------------+
                    //
                    //Alert("Is_CreateMini>>: ", Is_CreateMini);//
                    //
                    //Alert("else if(!Is_Create )-before Is_CreateMini>>: ", Is_CreateMini);//
                    return true;//
          }//
}//
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Cp_StatusSubTopMiddle::_OBJECT_CLICK()
{         string Clicked = Event.sparam;
          //OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO//
          //IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
          //OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO//
          if(Clicked == "StatusSubTopMiddleMini-X")
          {         if(IsPressMini)
                    {         //ct_Inform.StatusPadView =
                              ///solution/// when the deleting the frist one is created one for the one is existed....
                              _Call(MODE_MINI, false, 0, 0); //>>>RightMiddel Pannel ///deleting just panel not mini
                              IsPressMini = false;//
                              //---------
                              ObjectSetInteger(0, "StatusSubTopMiddleMiniLeftO2-X", OBJPROP_COLOR, clrDarkRed ); //
                              ///-------------
                    }
                    else
                    {         _Call(MODE_MINI, true, LastMoveX, LastMoveY); ///>>>TopMiddel Pannel//>>>RightMiddel Pannel ///>>>Creating
                              IsPressMini = true; //
                              //---------
                              ObjectSetInteger(0, "StatusSubTopMiddleMiniLeftO2-X", OBJPROP_COLOR, clrYellowGreen); //
                              ///-------------
                    } //
                    //
          }
          //--------------------
          if(Clicked == "StatusSubTopMiddleExit-X")
          {         _Call(MODE_CREATE, false, 0, 0); //>>>RightMiddel Pannel ///deleting all
                    ///
          }
          //--------------------
          if(Clicked == "StatusSubTopMiddleMove-X" || Clicked == "StatusSubTopMiddleMoveLeftO2-X" || Clicked == "StatusSubTopMiddleMoveLeftO1-X")
          {         static bool IsPressedTopMiddleMove = true;
                    if(IsPressedTopMiddleMove)
                    {         IsMoving = true;        IsPressedTopMiddleMove = false;//
                              //--------------
                              ObjectSetInteger(0, "StatusSubTopMiddleMove-X", OBJPROP_COLOR, clrRed);
                              ///-------------
                    }
                    else
                    {         IsMoving = false;       IsPressedTopMiddleMove = true;//
                              //--------------
                              ObjectSetInteger(0, "StatusSubTopMiddleMove-X", OBJPROP_COLOR, clrWhite);
                              ///-------------
                    } //
                    //
          }
          if(Clicked == "StatusSubTopMiddleClear-X" || Clicked == "StatusSubTopMiddleClearLeftO2-X" || Clicked == "StatusSubTopMiddleClearLeftO1-X")
          {         //
                    //
                    //===================
                    _Call(MODE_CREATE, false, 0, 0);
                    //===================
                    //
                    //===================
                    _Call(MODE_CREATE, true, 0, 0); ///>>>TopMiddel Pannel
                    //============
                    //
          } //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Cp_StatusSubTopMiddle::Update()
{         color DNWard = clrRed, UPWard = clrDodgerBlue;
          if(RightMenu.SubStatus.TopMiddle.IsPadPressed)
          {         if(ObjectFind(0, "LabelRSI") >= 0)
                    {         if(!ObjectSetString(0, "LabelRSI", OBJPROP_TEXT, 0, "RSI: " + DoubleToString(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._RSI.RSI_14_0, 2))) //Set_Object
                                        Alert( "ObjectSetString-Line:", __LINE__, " ChartMeterX");
                              if(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._RSI.RSI_14_0 > 50)
                              {         if(!ObjectSetInteger(0, "LabelRSI", OBJPROP_COLOR, UPWard)) //Set_Object
                                                  Alert("ObjectSetInteger-Line:", __LINE__, " ChartMeterX"); } //
                              else
                              {         if(!ObjectSetInteger(0, "LabelRSI", OBJPROP_COLOR, DNWard)) //Set_Object
                                                  Alert("ObjectSetInteger-Line:", __LINE__, " ChartMeterX"); //
                              } //
                    }
                    //=======================================
                    if(ObjectFind(0, "LabelWRp") >= 0)
                    {         if(!ObjectSetString(0, "LabelWRp", OBJPROP_TEXT, 0, "WR%: " + DoubleToString(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR.WpR_14_0, 2))) //Set_Object
                                        Alert("ObjectSetString-Line:", __LINE__, " ChartMeterX");
                              if(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR.WpR_14_0 > 50)
                              {         if(!ObjectSetInteger(0, "LabelWRp", OBJPROP_COLOR, UPWard)) //Set_Object
                                                  Alert("ObjectSetInteger-Line:", __LINE__, " ChartMeterX"); } //
                              else
                              {         if(!ObjectSetInteger(0, "LabelWRp", OBJPROP_COLOR, DNWard)) //Set_Object
                                                  Alert("ObjectSetInteger-Line:", __LINE__, " ChartMeterX"); } //
                              //
                    }
                    //=======================================
                    if(ObjectFind(0, "LabelMACDmain") >= 0)
                    {         //
                              if(!ObjectSetString(0, "LabelMACDmain", OBJPROP_TEXT, 0, "MACDm: " + DoubleToString(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD.MACD_M_14_0, 2))) //Set_Object
                                        Alert("ObjectSetString-Line:", __LINE__, " ChartMeterX");
                              if(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD.MACD_M_14_0 > 0)
                              {         if(!ObjectSetInteger(0, "LabelMACDmain", OBJPROP_COLOR, UPWard)) //Set_Object
                                                  Alert("ObjectSetInteger-Line:", __LINE__, " ChartMeterX"); } //
                              else
                              {         if(!ObjectSetInteger(0, "LabelMACDmain", OBJPROP_COLOR, DNWard)) //Set_Object
                                                  Alert("ObjectSetInteger-Line:", __LINE__, " ChartMeterX"); } //
                              //
                    }
                    //=======================================
                    if(ObjectFind(0, "LabelMACDSignal") >= 0)
                    {         if(!ObjectSetString(0, "LabelMACDSignal", OBJPROP_TEXT, 0, "MACDs : " + DoubleToString(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD.MACD_S_14_0, 2))) //Set_Object
                                        Alert("ObjectSetString-Line:", __LINE__, " ChartMeterX");
                              if(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD.MACD_S_14_0 > 0)
                              {         if(!ObjectSetInteger(0, "LabelMACDSignal", OBJPROP_COLOR, UPWard)) //Set_Object
                                                  Alert("ObjectSetInteger-Line:", __LINE__, " ChartMeterX"); } //
                              else
                              {         if(!ObjectSetInteger(0, "LabelMACDSignal", OBJPROP_COLOR, DNWard)) //Set_Object
                                                  Alert("ObjectSetInteger-Line:", __LINE__, " ChartMeterX"); } //
                              //
                    }
                    //=======================================
                    if(ObjectFind(0, "LabelOBV") >= 0)
                    {         ///
                              if(!ObjectSetString(0, "LabelOBV", OBJPROP_TEXT, 0, "OBV: " + DoubleToString(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._OBVClose.OBVClose_0, 2)))Alert("-Line:", __LINE__, " ChartMeterX");
                              if(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._OBVClose.OBVClose_0 > ct_Drive.TDD.ct_Conductor.DC_data.Indicators._OBVClose.OBVClose_1)
                              {         if(!ObjectSetInteger(0, "LabelOBV", OBJPROP_COLOR, UPWard)) Alert("ObjectSetInteger-Line:", __LINE__, " ChartMeterX"); } //
                              else
                              {         if(!ObjectSetInteger(0, "LabelOBV", OBJPROP_COLOR, DNWard)) Alert("ObjectSetInteger-Line:", __LINE__, " ChartMeterX"); }
                              //
                    }
                    //=======================================
                    if(ObjectFind(0, "LabelATR") >= 0)
                    {         if(!ObjectSetString(0, "LabelATR", OBJPROP_TEXT, 0, "ATR: " + DoubleToString(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._ATR.ATR_14_0, 2))) Alert("ObjectSetString-Line:", __LINE__, " ChartMeterX"); //
                              //
                              gRLBL.MQL.Delete("RectLabelATR0");
                              //
                              static bool RunKey = true;
                              RunKey = RunKey ? false : true;
                              if(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._ATR.ATR_14_0 >= 0.5 )
                              {         //
                                        ///---- Generic gRLBL---/// gRectLabelX.GDS
                                        {         gRLBL.GDS.Set_Action_2(MODE_CREATE, RunKey);
                                                  gRLBL.GDS.Set_Desc_1("RectLabelATR2");
                                                  gRLBL.GDS.Set_Tip_3(STYLE_SOLID, 1, BORDER_FLAT);
                                                  gRLBL.GDS.Set_Color_2(clrRed, clrBlack);
                                                  gRLBL.GDS.Set_Location_5((int)(327.6), 15, 10, 3, CORNER_LEFT_UPPER);
                                                  gRLBL.GDS.Set_Chart_6();
                                                  gRLBL.GDS.Set_Common_6(false, 10, false, false, false, RLDEF_tooltip + "RectLabelATR2");
                                                  gRLBL.Action(gRLBL);//
                                                  //0// RLBL_.Create(RunKey, false, "RectLabelATR2", "RightBorderBS", (int)(327.6) , 15 , 10, 3,
                                                  //0// CORNER_LEFT_UPPER, ANCHOR_UPPER, True, BORDER_FLAT, clrRed, clrBlack, 0, STYLE_SOLID, 1, 8, "Arial" );
                                        }//
                                        //
                              }
                              else if(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._ATR.ATR_14_0 >= 0.3 )
                              {         //
                                        ///---- Generic gRLBL---/// gRectLabelX.GDS
                                        {         gRLBL.GDS.Set_Action_2(MODE_CREATE, RunKey);
                                                  gRLBL.GDS.Set_Desc_1("RectLabelATR1");
                                                  gRLBL.GDS.Set_Tip_3(STYLE_SOLID, 1, BORDER_FLAT);
                                                  gRLBL.GDS.Set_Color_2(clrRed, clrBlack);
                                                  gRLBL.GDS.Set_Location_5((int)(327.6), 15, 5, 3, CORNER_LEFT_UPPER);
                                                  gRLBL.GDS.Set_Chart_6();
                                                  gRLBL.GDS.Set_Common_6(false, 10, false, false, false, RLDEF_tooltip + "RectLabelATR1");
                                                  gRLBL.Action(gRLBL);//
                                                  //0// RLBL_.Create(RunKey, false, "RectLabelATR1", "RightBorderBS", (int)(327.6) , 15 , 5, 3,
                                                  //0// CORNER_LEFT_UPPER, ANCHOR_UPPER, True, BORDER_FLAT, clrRed, clrBlack, 0, STYLE_SOLID, 1, 8, "Arial" );
                                        }//
                                        //
                              }
                              if(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._ATR.ATR_14_0 >= 1.0 )
                              {         //
                                        ///---- Generic gRLBL---/// gRectLabelX.GDS
                                        {         gRLBL.GDS.Set_Action_2(MODE_CREATE, RunKey);
                                                  gRLBL.GDS.Set_Desc_1("RectLabelATR3");
                                                  gRLBL.GDS.Set_Tip_3(STYLE_SOLID, 1, BORDER_FLAT);
                                                  gRLBL.GDS.Set_Color_2(clrRed, clrBlack);
                                                  gRLBL.GDS.Set_Location_5((int)(327.6) + 12, 15, 10, 3, CORNER_LEFT_UPPER);
                                                  gRLBL.GDS.Set_Chart_6();
                                                  gRLBL.GDS.Set_Common_6(false, 10, false, false, false, RLDEF_tooltip + "RectLabelATR3");
                                                  gRLBL.Action(gRLBL);//
                                                  //0// RLBL_.Create(RunKey, false, "RectLabelATR3", "RightBorderBS", (int)(327.6) + 12, 15 , 10, 3,
                                                  //0// CORNER_LEFT_UPPER, ANCHOR_UPPER, True, BORDER_FLAT, clrRed, clrBlack, 0, STYLE_SOLID, 1, 8, "Arial" );
                                        }//
                                        //
                              }
                              if(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._ATR.ATR_14_0 >= 1.5 )
                              {         //
                                        ///---- Generic gRLBL---/// gRectLabelX.GDS
                                        {         gRLBL.GDS.Set_Action_2(MODE_CREATE, RunKey);
                                                  gRLBL.GDS.Set_Desc_1("RectLabelATR4");
                                                  gRLBL.GDS.Set_Tip_3(STYLE_SOLID, 1, BORDER_FLAT);
                                                  gRLBL.GDS.Set_Color_2(clrRed, clrBlack);
                                                  gRLBL.GDS.Set_Location_5((int)(327.6) + 24, 15, 10, 3, CORNER_LEFT_UPPER);
                                                  gRLBL.GDS.Set_Chart_6();
                                                  gRLBL.GDS.Set_Common_6(false, 10, false, false, false, RLDEF_tooltip + "RectLabelATR4");
                                                  gRLBL.Action(gRLBL);//
                                                  //0// RLBL_.Create(RunKey, false, "RectLabelATR4", "RightBorderBS", (int)(327.6) + 24, 15 , 10, 3,
                                                  //0// CORNER_LEFT_UPPER, ANCHOR_UPPER, True, BORDER_FLAT, clrRed, clrBlack, 0, STYLE_SOLID, 1, 8, "Arial" );
                                        }//
                                        //
                              }
                              if(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._ATR.ATR_14_0 > 1.5)   if(ObjectFind(0, "LabelATR") >= 0)if(!ObjectSetInteger(0, "LabelATR", OBJPROP_COLOR, clrDodgerBlue)) Alert( "-Line:", __LINE__, " ChartMeterX"); //
                              if(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._ATR.ATR_14_0 < 1.5)   if(ObjectFind(0, "LabelATR") >= 0)if(!ObjectSetInteger(0, "LabelATR", OBJPROP_COLOR, clrYellow)) Alert( "-Line:", __LINE__, " ChartMeterX"); //
                              //
                    }//
          }//
}//
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
