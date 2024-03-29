//+------------------------------------------------------------------+
//||   ||||||||||                 C_OMODIFY_Pad.mqh                 ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(ControlersCall)\MCV_Data_Model.mqh>
//+------------------------------------------------------------------+
//|             Class C_ModifyPad     BEGIN                          |
//+------------------------------------------------------------------+
class C_OMODIFY_Pad
{
public:
          //-------------------------------------------------------------------------------------
          bool                  Update();
          bool                  UPDATED;
          bool                  SubController_PadModify(int Type, bool  Is_Create = false, bool Is_CreateMini = false, bool Is_MoveTracking = false, int MoveX = 0, int MoveY = 0, int SizeX = 0, int SizeY = 0, int FontSize = 0);
          bool                  Is_PadModify, Is_PadModifyActive;
          C_MasterPanel         PadModify;
          bool                  ON_MasterPanel( bool Is_Create, bool Is_Move, int MoveX, int MoveY, int SizeX, int SizeY, int FontSize);

          void                  OBJECT_CLICK();
          //-------------------------------------------------------------------------------------
};
//+------------------------------------------------------------------+
//|             Class MyRoboTrader     BEGIN                         |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_OMODIFY_Pad::Update()
{         UPDATED = false;
//===============================================================
          //bool           IsPadPress_TrailSL;
          //bool           IsPadPress_TrailTP;
          //bool           IsPadPress_TrailEX;
          //bool           IsPadPress_TrailOP;
          {         ct_Drive.TDD.ct_Modify.OrderModifying.Is_Orders            = RightMenu.SubController.OrderModifying.Is_Orders;
                    //OrderModifying.Is_OrdersPuted;
                    ct_Drive.TDD.ct_Modify.OrderModifying.Is_Markets           = RightMenu.SubController.OrderModifying.Is_Markets;
                    ct_Drive.TDD.ct_Modify.OrderModifying.Is_MarketsBuy        = RightMenu.SubController.OrderModifying.Is_MarketsBuy;               ct_Drive.TDD.ct_Modify.OrderModifying.Is_MarketsSell           = RightMenu.SubController.OrderModifying.Is_MarketsSell;
                    //ct_ModifyOrderModifying.Is_MarketsBuyPuted,    OrderModifying.Is_MarketsSellPuted;
                    ct_Drive.TDD.ct_Modify.OrderModifying.Is_Pendings          = RightMenu.SubController.OrderModifying.Is_Pendings;
                    ct_Drive.TDD.ct_Modify.OrderModifying.Is_PendingsBuyLimit  = RightMenu.SubController.OrderModifying.Is_PendingsBuyLimit;         ct_Drive.TDD.ct_Modify.OrderModifying.Is_PendingsBuyStop       = RightMenu.SubController.OrderModifying.Is_PendingsBuyStop;
                    //ct_ModifyOrderModifying.Is_PendingsBuyLimitPuted,     OrderModifying.Is_PendingsBuyStopPuted;
                    ct_Drive.TDD.ct_Modify.OrderModifying.Is_PendingsSellLimit = RightMenu.SubController.OrderModifying.Is_PendingsSellLimit;        ct_Drive.TDD.ct_Modify.OrderModifying.Is_PendingsSellStop      = RightMenu.SubController.OrderModifying.Is_PendingsSellStop;
                    //ct_ModifyOrderModifying.Is_PendingsSellLimitPuted,    OrderModifying.Is_PendingsSellStopPuted;
          }
          //=============================================================================================================
          UPDATED = true;
          if(!this.UPDATED)   {Alert("ct_ModifyUPDATED: ", this.UPDATED);}
          return UPDATED;//
}
//+------------------------------------------------------------------+
//|                                                                  |PPSLTPOPEX
//+------------------------------------------------------------------+
bool C_OMODIFY_Pad::SubController_PadModify(int Type, bool  IsKey = false, bool Is_CreateMini = false, bool Is_MoveTracking = false, int MoveX = 0, int MoveY = 0, int SizeX = 0, int SizeY = 0, int FontSize = 0)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_CHART Error",  __LINE__, __FUNCTION__); //|
//=====================================================================================================
          bool Is_Vertical = false; MoveX = 300;   MoveY = 200;
          //------------------------------------------------------------------
          Manage_KeysActions_Data<C_OMODIFY_Pad> KeysActions_Data;
          KeysActions_Data.ObjGetClassMember  = this;
          KeysActions_Data.NameCom            = "PadModify";
          KeysActions_Data.Type               = Type;
          KeysActions_Data.IsKey              = IsKey;            // = false;
          KeysActions_Data.Is_CreateMini      = Is_CreateMini;        // = false;
          KeysActions_Data.Is_Move            = Is_MoveTracking;      // = false;
          KeysActions_Data.MoveX              = MoveX;                // = 0;
          KeysActions_Data.MoveY              = MoveY;                // = 0;
          KeysActions_Data.SizeX              = 0;                    // = 0;
          KeysActions_Data.SizeY              = 0;                    // = 0;
          KeysActions_Data.FontSize           = 0;                    // = 0;//8
          KeysActions_Data.clrBody            = clrWhite;             // = clrWhite;
          KeysActions_Data.clrBodyMargine     = clrFireBrick;         // = clrFireBrick;
          KeysActions_Data.clrBodyText        = clrFireBrick;         // = clrFireBrick;
          KeysActions_Data.clrBodyCyrcle      = clrRed;               // = clrRed;
          KeysActions_Data.Is_PanelActive    = false;                // = false;
          KeysActions_Data.Is_Vertical        = false;                // = false; //
          //------------------------------------------------------------------
          return PadModify.Manage_KeysActions(KeysActions_Data); //  off for correction
//=====================================================================================================
//=====================================================================================================
          if(false)
          {         //=====================================================================================================
                    PadModify.Check_KeysStatus("PadModify", Type, Is_Vertical, IsKey, Is_CreateMini, Is_MoveTracking, Is_PadModifyActive, MoveX, MoveY, SizeX, SizeY, FontSize);
                    //=====================================================================================================
                    {         //
                    }
                    //
          }//
          //----------------
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_CHART Error",  __LINE__, __FUNCTION__); //|
          return IsKey;//
}
//+------------------------------------------------------------------+
//|                                                                  |MasterPanelCreate
//+------------------------------------------------------------------+
bool C_OMODIFY_Pad::ON_MasterPanel( bool Is_Create, bool Is_Move, int MoveX, int MoveY, int SizeX, int SizeY, int FontSize)// FIs_Create,  Mode_Move, MoveX, MoveY, SizeX, SizeY, FontSize = -3)
{
//
//
          int Angel = 0; int xCom = 5; int yCom = 0; // int FontSize = 0;
          {         //===================================================================================================================================================================
                    //===================================================================================================================================================================
                    {         Complex.Set_TextPanel( Is_Create, Is_Move, +1, clrNONE,    "TrailPP: ", "TrailPP:xxx",   9 + MoveX, MoveY +  -25, clrMidnightBlue, Angel, xCom, yCom, FontSize); //
                              Complex.Get_TextPanel( Is_Create, Is_Move,     clrNONE,    "Set_ TrailPP..",              9 + MoveX, MoveY +  -13, clrMediumBlue,   Angel, xCom, yCom, FontSize); //
                              //----------------
                              Complex.Set_TextPanel( Is_Create, Is_Move, 1,  clrNONE,    "TrailTP: ", "TrailTP:xxx",   9 + MoveX, MoveY +  3,   clrDarkGreen,    Angel, xCom, yCom, FontSize); //
                              Complex.Get_TextPanel( Is_Create, Is_Move,     clrNONE,    "Set_ TrailTP..",              9 + MoveX, MoveY +  15,  clrLimeGreen,    Angel, xCom, yCom, FontSize); //
                              //-----------------
                              Complex.Set_TextPanel( Is_Create, Is_Move, -1, clrNONE,    "TrailSL: ", "TrailSL:xxx",   9 + MoveX, MoveY +  43,  clrDarkRed,      Angel, xCom, yCom, FontSize); //
                              Complex.Get_TextPanel( Is_Create, Is_Move,     clrNONE,    "Set_ TrailSL..",              9 + MoveX, MoveY +  31,  clrRed,          Angel, xCom, yCom, FontSize); //
                              //----------------
                              Complex.Set_TextPanel( Is_Create, Is_Move, +1, clrNONE,    "TrailOP: ", "TrailOP:xxx",   9 + MoveX, MoveY +  59,  clrDarkOrange,   Angel, xCom, yCom, FontSize); //
                              Complex.Get_TextPanel( Is_Create, Is_Move,     clrNONE,    "Set_ TrailOP..",              9 + MoveX, MoveY +  71,  clrOrange,       Angel, xCom, yCom, FontSize); //
                              //----------------
                              Complex.Set_TextPanel( Is_Create, Is_Move, -1, clrNONE,    "TrailEX: ", "TrailEX:xxx",   9 + MoveX, MoveY +  99,  clrIndigo,       Angel, xCom, yCom, FontSize); //
                              Complex.Get_TextPanel( Is_Create, Is_Move,     clrNONE,    "Set_ TrailEX..",              9 + MoveX, MoveY +  87,  clrDarkViolet,   Angel, xCom, yCom, FontSize); //
                              //----------------
                              Complex.Set_TextPanel( Is_Create, Is_Move, -1, clrNONE,    "Trail Panel", "Trail Panel", 0 + MoveX, MoveY + -25,  clrIndigo,       Angel + 90, xCom, yCom + 16, FontSize, 0, "Arial Bold", 3); // int MoveYDesc = 0, string FontType = "Arial Bold", int FontSizeDesc = 0
                    }//
                    return true;//
          }
          return false;//
//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_OMODIFY_Pad::OBJECT_CLICK()
{         //
          PadModify._OBJECT_CLICK(this);
          //
}
//+------------------------------------------------------------------+
//||   ||||||||||                 C_OMODIFY_Pad.mqh                 ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
