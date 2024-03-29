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
class Cp_SubController
{
public:
          //---------------------------------------------------------------------------------------
          bool                  IsPadPress_ConditionWatch;    //  IsPadPress_ConditionWatch IsPadPress_TicketManage IsPadPress_TicketPut IsPadPress_TicketModify IsPadPress_TicketEnd;
          bool                  IsPadPress_TicketManage;
          bool                  IsPadPress_TicketPut;
          bool                  IsPadPress_TicketModify;
          bool                  IsPadPress_TicketEnd;
          //---------------------------------------------------------------------------------------
          bool                  IsPadPress_TrailSL;         //        IsPadPress_TrailSL          IsPadPress_TrailTP          IsPadPress_TrailEX          IsPadPress_TrailOP
          bool                  IsPadPress_TrailTP;
          bool                  IsPadPress_TrailEX;
          bool                  IsPadPress_TrailOP;

          _ORDER_               OrderPutting;
          _ORDER_               OrderModifying;
          _ORDER_               OrderEnding;
          //---------------------------------------------------------------------------------------
          void                  SubController_OBJECT_CLICK();
          void                  _Call(int WhichMode, bool IsKey, color clrBody = clrWhite, color clrBodyMargine = clrNavy, color clrBodyText = clrNavy, color clrBodyCyrcle = clrRed);
          void                  _Show(int WhichMode, bool IsKey, color clrBody = clrWhite, color clrBodyMargine = clrNavy, color clrBodyText = clrNavy, color clrBodyCyrcle = clrRed);
          //---------------------------------------------------------------------------------------
          void                  SubController_SubTicketPut(int WhichMode, bool IsKey, color clrBody = clrWhite, color clrBodyMargine = clrNavy, color clrBodyText = clrNavy, color clrBodyCyrcle = clrRed);
          void                  SubController_SubTicketModify(int WhichMode, bool IsKey, color clrBody = clrWhite, color clrBodyMargine = clrNavy, color clrBodyText = clrNavy, color clrBodyCyrcle = clrRed);
          void                  SubController_SubTicketEnd(int WhichMode, bool IsKey, color clrBody = clrWhite, color clrBodyMargine = clrNavy, color clrBodyText = clrNavy, color clrBodyCyrcle = clrRed);
          //---
          void                  SubController_KeysStatus();
          void                  IsActiveControllerSubElements() {};


          //---------------------------------------------------------------------------------------
          void                  TrialPanel(int WhichMode, bool IsKey);
          //---------------------------------------------------------------------------------------
          void                  Set_Controller();
          void                  Set_Close();
          void                  Set_Put();
          void                  Set_Trail();
          //---------------------------------------------------------------------------------------
//

};

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Cp_SubController::SubController_KeysStatus()
{
//================================================================================================================================================
//if(IsPadPress_ConditionWatch||IsPadPress_TicketManage||IsPadPress_TicketPut||IsPadPress_TicketModify||IsPadPress_TicketEnd)AutoTradeDirect=false;//not logic to set again..
//================================================================================================================================================
          Complex.Menu_Button(MODE_MODIFY, IsPadPress_ConditionWatch,           "ConditionWatch",        RightMenuPad_Color.CclrBody, RightMenuPad_Color.CclrBodyMargine, clrWhite, RightMenuPad_Color.CclrBodyCyrclePress);
          Complex.Menu_Button(MODE_MODIFY, IsPadPress_TicketManage,             "Ticket Manage",         RightMenuPad_Color.CclrBody, RightMenuPad_Color.CclrBodyMargine, clrWhite, RightMenuPad_Color.CclrBodyCyrclePress);
//===========================================================================================================================================================
          Complex.Menu_Button(MODE_MODIFY, IsPadPress_TicketPut,                "Ticket Put",            RightMenuPad_Color.CclrBody, RightMenuPad_Color.CclrBodyMargine, clrWhite, RightMenuPad_Color.CclrBodyCyrclePress); //
          Complex.Menu_Button(MODE_MODIFY, OrderPutting.Is_Orders,               "Put All",               RightMenuPad_Color.CclrBody, RightMenuPad_Color.CclrBodyMargine, clrWhite, RightMenuPad_Color.CclrBodyCyrclePress); //;
          Complex.Menu_Button(MODE_MODIFY, OrderPutting.Is_Markets,              "Put Markets",           RightMenuPad_Color.CclrBody, RightMenuPad_Color.CclrBodyMargine, clrWhite, RightMenuPad_Color.CclrBodyCyrclePress); //;
          Complex.Menu_Button(MODE_MODIFY, OrderPutting.Is_MarketsSell,          "Put Sells",             RightMenuPad_Color.CclrBody, RightMenuPad_Color.CclrBodyMargine, clrWhite, RightMenuPad_Color.CclrBodyCyrclePress); //;
          Complex.Menu_Button(MODE_MODIFY, OrderPutting.Is_MarketsBuy,            "Put Buys",             RightMenuPad_Color.CclrBody, RightMenuPad_Color.CclrBodyMargine, clrWhite, RightMenuPad_Color.CclrBodyCyrclePress); //;
          Complex.Menu_Button(MODE_MODIFY, OrderPutting.Is_Pendings,             "Put Pendings",          RightMenuPad_Color.CclrBody, RightMenuPad_Color.CclrBodyMargine, clrWhite, RightMenuPad_Color.CclrBodyCyrclePress); //;
          Complex.Menu_Button(MODE_MODIFY, OrderPutting.Is_PendingsSellLimit,    "Put SellLimits",        RightMenuPad_Color.CclrBody, RightMenuPad_Color.CclrBodyMargine, clrWhite, RightMenuPad_Color.CclrBodyCyrclePress); //;
          Complex.Menu_Button(MODE_MODIFY, OrderPutting.Is_PendingsSellStop,     "Put SellStops",         RightMenuPad_Color.CclrBody, RightMenuPad_Color.CclrBodyMargine, clrWhite, RightMenuPad_Color.CclrBodyCyrclePress); //;
          Complex.Menu_Button(MODE_MODIFY, OrderPutting.Is_PendingsBuyLimit,     "Put BuyLimits",         RightMenuPad_Color.CclrBody, RightMenuPad_Color.CclrBodyMargine, clrWhite, RightMenuPad_Color.CclrBodyCyrclePress); //;
          Complex.Menu_Button(MODE_MODIFY, OrderPutting.Is_PendingsBuyStop,      "Put BuyStops",          RightMenuPad_Color.CclrBody, RightMenuPad_Color.CclrBodyMargine, clrWhite, RightMenuPad_Color.CclrBodyCyrclePress); //;
//===========================================================================================================================================================
          Complex.Menu_Button(MODE_MODIFY, IsPadPress_TicketModify,             "Ticket Modify",         RightMenuPad_Color.CclrBody, RightMenuPad_Color.CclrBodyMargine, clrWhite, RightMenuPad_Color.CclrBodyCyrclePress);
          Complex.Menu_Button(MODE_MODIFY, IsPadPress_TrailSL,                  "Trail SL",              RightMenuPad_Color.CclrBody, RightMenuPad_Color.CclrBodyMargine, clrWhite, RightMenuPad_Color.CclrBodyCyrclePress); //;
          Complex.Menu_Button(MODE_MODIFY, IsPadPress_TrailTP,                  "Trail TP",              RightMenuPad_Color.CclrBody, RightMenuPad_Color.CclrBodyMargine, clrWhite, RightMenuPad_Color.CclrBodyCyrclePress); //;
          Complex.Menu_Button(MODE_MODIFY, IsPadPress_TrailEX,                  "Trail EX",              RightMenuPad_Color.CclrBody, RightMenuPad_Color.CclrBodyMargine, clrWhite, RightMenuPad_Color.CclrBodyCyrclePress); //;
          Complex.Menu_Button(MODE_MODIFY, IsPadPress_TrailOP,                  "Trail OP",              RightMenuPad_Color.CclrBody, RightMenuPad_Color.CclrBodyMargine, clrWhite, RightMenuPad_Color.CclrBodyCyrclePress); //;
//===========================================================================================================================================================
          Complex.Menu_Button(MODE_MODIFY, IsPadPress_TicketEnd,               "Ticket End",            RightMenuPad_Color.CclrBody, RightMenuPad_Color.CclrBodyMargine, clrWhite, RightMenuPad_Color.CclrBodyCyrclePress);
          Complex.Menu_Button(MODE_MODIFY, OrderEnding.Is_Orders,               "Close All",             RightMenuPad_Color.CclrBody, RightMenuPad_Color.CclrBodyMargine, clrWhite, RightMenuPad_Color.CclrBodyCyrclePress); //;
          Complex.Menu_Button(MODE_MODIFY, OrderEnding.Is_Markets,              "Close Markets",         RightMenuPad_Color.CclrBody, RightMenuPad_Color.CclrBodyMargine, clrWhite, RightMenuPad_Color.CclrBodyCyrclePress); //;
          Complex.Menu_Button(MODE_MODIFY, OrderEnding.Is_OrdersSell,           "Close Sells",           RightMenuPad_Color.CclrBody, RightMenuPad_Color.CclrBodyMargine, clrWhite, RightMenuPad_Color.CclrBodyCyrclePress); //;
          Complex.Menu_Button(MODE_MODIFY, OrderEnding.Is_OrdersBuy,            "Close Buys",            RightMenuPad_Color.CclrBody, RightMenuPad_Color.CclrBodyMargine, clrWhite, RightMenuPad_Color.CclrBodyCyrclePress); //;
          Complex.Menu_Button(MODE_MODIFY, OrderEnding.Is_Pendings,             "Delete Pendings",       RightMenuPad_Color.CclrBody, RightMenuPad_Color.CclrBodyMargine, clrWhite, RightMenuPad_Color.CclrBodyCyrclePress); //;
          Complex.Menu_Button(MODE_MODIFY, OrderEnding.Is_PendingsSellLimit,    "Delete SellLimits",     RightMenuPad_Color.CclrBody, RightMenuPad_Color.CclrBodyMargine, clrWhite, RightMenuPad_Color.CclrBodyCyrclePress); //;
          Complex.Menu_Button(MODE_MODIFY, OrderEnding.Is_PendingsSellStop,     "Delete SellStops",      RightMenuPad_Color.CclrBody, RightMenuPad_Color.CclrBodyMargine, clrWhite, RightMenuPad_Color.CclrBodyCyrclePress); //;
          Complex.Menu_Button(MODE_MODIFY, OrderEnding.Is_PendingsBuyLimit,     "Delete BuyLimits",      RightMenuPad_Color.CclrBody, RightMenuPad_Color.CclrBodyMargine, clrWhite, RightMenuPad_Color.CclrBodyCyrclePress); //;
          Complex.Menu_Button(MODE_MODIFY, OrderEnding.Is_PendingsBuyStop,      "Delete BuyStops",       RightMenuPad_Color.CclrBody, RightMenuPad_Color.CclrBodyMargine, clrWhite, RightMenuPad_Color.CclrBodyCyrclePress); //;
          if(TRADER_Panel_DATA.Is_Close_SubTicketEnd)
          {         Complex.Menu_Button(MODE_MODIFY, IsPadPress_TicketEnd               = false,               "Ticket End",            RightMenuPad_Color.CclrBody, RightMenuPad_Color.CclrBodyMargine, clrWhite, RightMenuPad_Color.CclrBodyCyrclePress);
                    Complex.Menu_Button(MODE_MODIFY, OrderEnding.Is_Orders               = false,               "Close All",             RightMenuPad_Color.CclrBody, RightMenuPad_Color.CclrBodyMargine, clrWhite, RightMenuPad_Color.CclrBodyCyrclePress); //;
                    Complex.Menu_Button(MODE_MODIFY, OrderEnding.Is_Markets              = false,              "Close Markets",         RightMenuPad_Color.CclrBody, RightMenuPad_Color.CclrBodyMargine, clrWhite, RightMenuPad_Color.CclrBodyCyrclePress); //;
                    Complex.Menu_Button(MODE_MODIFY, OrderEnding.Is_OrdersSell           = false,           "Close Sells",           RightMenuPad_Color.CclrBody, RightMenuPad_Color.CclrBodyMargine, clrWhite, RightMenuPad_Color.CclrBodyCyrclePress); //;
                    Complex.Menu_Button(MODE_MODIFY, OrderEnding.Is_OrdersBuy            = false,            "Close Buys",            RightMenuPad_Color.CclrBody, RightMenuPad_Color.CclrBodyMargine, clrWhite, RightMenuPad_Color.CclrBodyCyrclePress); //;
                    Complex.Menu_Button(MODE_MODIFY, OrderEnding.Is_Pendings             = false,             "Delete Pendings",       RightMenuPad_Color.CclrBody, RightMenuPad_Color.CclrBodyMargine, clrWhite, RightMenuPad_Color.CclrBodyCyrclePress); //;
                    Complex.Menu_Button(MODE_MODIFY, OrderEnding.Is_PendingsSellLimit    = false,    "Delete SellLimits",     RightMenuPad_Color.CclrBody, RightMenuPad_Color.CclrBodyMargine, clrWhite, RightMenuPad_Color.CclrBodyCyrclePress); //;
                    Complex.Menu_Button(MODE_MODIFY, OrderEnding.Is_PendingsSellStop     = false,     "Delete SellStops",      RightMenuPad_Color.CclrBody, RightMenuPad_Color.CclrBodyMargine, clrWhite, RightMenuPad_Color.CclrBodyCyrclePress); //;
                    Complex.Menu_Button(MODE_MODIFY, OrderEnding.Is_PendingsBuyLimit     = false,     "Delete BuyLimits",      RightMenuPad_Color.CclrBody, RightMenuPad_Color.CclrBodyMargine, clrWhite, RightMenuPad_Color.CclrBodyCyrclePress); //;
                    Complex.Menu_Button(MODE_MODIFY, OrderEnding.Is_PendingsBuyStop      = false,      "Delete BuyStops",       RightMenuPad_Color.CclrBody, RightMenuPad_Color.CclrBodyMargine, clrWhite, RightMenuPad_Color.CclrBodyCyrclePress); //;
          }
//=====================================================================================================================================
          if(IsPadPress_ConditionWatch || IsPadPress_TicketManage || IsPadPress_TicketPut || IsPadPress_TicketModify || IsPadPress_TicketEnd) //
                    Complex.Menu_Button(MODE_MODIFY, RightMenu.IsPadPress_Controller, "Controller", RightMenuPad_Color.CclrBody, RightMenuPad_Color.CclrBodyMargine, clrWhite, RightMenuPad_Color.CclrBodyCyrcleActive);
          else      Complex.Menu_Button(MODE_MODIFY, RightMenu.IsPadPress_Controller, "Controller", RightMenuPad_Color.CclrBody, RightMenuPad_Color.CclrBodyMargine, clrWhite, RightMenuPad_Color.CclrBodyCyrcleUnPress);
//=====================================================================================================================================
          //+------------------------------------------------------------------+
          //|                                                                  |
          //+------------------------------------------------------------------+
          if(OrderPutting.Is_Orders || OrderPutting.Is_Markets || OrderPutting.Is_MarketsSell || OrderPutting.Is_OrdersBuy || OrderPutting.Is_Pendings || OrderPutting.Is_PendingsSellLimit || OrderPutting.Is_PendingsSellStop || OrderPutting.Is_PendingsBuyLimit || OrderPutting.Is_PendingsBuyStop) //
          {         Complex.Menu_Button(MODE_MODIFY, IsPadPress_TicketPut ^ !IsPadPress_TicketPut, "Ticket Put", RightMenuPad_Color.CclrBody, RightMenuPad_Color.CclrBodyMargine, clrWhite, RightMenuPad_Color.CclrBodyCyrcleActive);}  //
          else      Complex.Menu_Button(MODE_MODIFY, IsPadPress_TicketPut, "Ticket Put", RightMenuPad_Color.CclrBody, RightMenuPad_Color.CclrBodyMargine, clrWhite, RightMenuPad_Color.CclrBodyCyrcleUnPress); //
//=====================================================================================================================================
          if(IsPadPress_TrailSL || IsPadPress_TrailTP || IsPadPress_TrailEX || IsPadPress_TrailOP ) //
          {         Complex.Menu_Button(MODE_MODIFY, IsPadPress_TicketModify ^ !IsPadPress_TicketModify, "Ticket Modify", RightMenuPad_Color.CclrBody, RightMenuPad_Color.CclrBodyMargine, clrWhite, RightMenuPad_Color.CclrBodyCyrcleActive);} //
          else      Complex.Menu_Button(MODE_MODIFY, IsPadPress_TicketModify, "Ticket Modify", RightMenuPad_Color.CclrBody, RightMenuPad_Color.CclrBodyMargine, clrWhite, RightMenuPad_Color.CclrBodyCyrcleUnPress); //
//=====================================================================================================================================
          if(OrderEnding.Is_Orders || OrderEnding.Is_Markets || OrderEnding.Is_OrdersSell || OrderEnding.Is_OrdersBuy || OrderEnding.Is_Pendings || OrderEnding.Is_PendingsSellLimit || OrderEnding.Is_PendingsSellStop || OrderEnding.Is_PendingsBuyLimit || OrderEnding.Is_PendingsBuyStop ) //
          {         Complex.Menu_Button(MODE_MODIFY, IsPadPress_TicketEnd ^ !IsPadPress_TicketEnd, "Ticket End", RightMenuPad_Color.CclrBody, RightMenuPad_Color.CclrBodyMargine, clrWhite, RightMenuPad_Color.CclrBodyCyrcleActive);} //
          else      Complex.Menu_Button(MODE_MODIFY, IsPadPress_TicketEnd, "Ticket End", RightMenuPad_Color.CclrBody, RightMenuPad_Color.CclrBodyMargine, clrWhite, RightMenuPad_Color.CclrBodyCyrcleUnPress);
          //+------------------------------------------------------------------+
          //|                                                                  |
          //+------------------------------------------------------------------+
//================================================================================================================================================
          bool Is_AnyControllerActive = IsPadPress_TrailSL || IsPadPress_TrailTP || IsPadPress_TrailEX || IsPadPress_TrailOP ||
                                        OrderPutting.Is_Orders || OrderPutting.Is_Markets || OrderPutting.Is_MarketsSell || OrderPutting.Is_OrdersBuy || OrderPutting.Is_Pendings || OrderPutting.Is_PendingsSellLimit || OrderPutting.Is_PendingsSellStop || OrderPutting.Is_PendingsBuyLimit || OrderPutting.Is_PendingsBuyStop ||
                                        OrderEnding.Is_Orders || OrderEnding.Is_Markets || OrderEnding.Is_OrdersSell || OrderEnding.Is_OrdersBuy || OrderEnding.Is_Pendings || OrderEnding.Is_PendingsSellLimit || OrderEnding.Is_PendingsSellStop || OrderEnding.Is_PendingsBuyLimit || OrderEnding.Is_PendingsBuyStop ||
                                        IsPadPress_ConditionWatch || IsPadPress_TicketManage || IsPadPress_TicketPut || IsPadPress_TicketModify || IsPadPress_TicketEnd;
//================================================================================================================================================
          if(Is_AnyControllerActive)
                    if(RightMenu.IsPadPress_Controller)Complex.Menu_Button(MODE_MODIFY, RightMenu.IsPadPress_Controller, "Controller", RightMenuPad_Color.CclrBody, RightMenuPad_Color.CclrBodyMargine, clrWhite, RightMenuPad_Color.CclrBodyCyrcleActive);
                    else Complex.Menu_Button(MODE_MODIFY, !RightMenu.IsPadPress_Controller, "Controller", RightMenuPad_Color.CclrBody, RightMenuPad_Color.CclrBodyMargine, clrWhite, RightMenuPad_Color.CclrBodyCyrcleActive);
          else      Complex.Menu_Button(MODE_MODIFY, RightMenu.IsPadPress_Controller, "Controller", RightMenuPad_Color.CclrBody, RightMenuPad_Color.CclrBodyMargine, clrWhite, RightMenuPad_Color.CclrBodyCyrcleUnPress);
//=====================================================================================================================================
          return;
//===========================================================================
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
//====================================================================================================================================================
void Cp_SubController::SubController_OBJECT_CLICK()
{         //====================================================================================================================================================
          //---
          string Clicked                = Event.sparam;
          //====================================================================================================================================================
          Set_Controller();
          Set_Close();
          Set_Put();
          Set_Trail();
          //===========================================================================================================================================================================
          Modify_Pad.OBJECT_CLICK();
          //===========================================================================================================================================================================
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Cp_SubController:: Set_Controller()
{         if(RightMenu.IsPadPress_Controller)
          {         //---
                    color clrOne                  = clrOrange ;
                    color clrTwo                  = clrFireBrick;
                    color clrTwo2                 = clrFireBrick;
                    color clrLogo                 = clrBlue;
                    color clrBody                 = clrWhite;
                    color clrBodyMargine          = clrNavy;
                    color clrBodyText             = clrNavy;
                    color clrBodyCyrcleUnPress    = clrRed; //
                    color clrBodyCyrclePress      = clrYellowGreen; //
                    color clrBodyCyrcleActive     = clrOrange;
                    string Clicked                = Event.sparam;
                    //---
                    bool Is_Sparam = false;  int Typer = 0;//
                    if(Clicked == "LBL_MenuPadsMainText-ConditionWatch"  || Clicked == "RLBL_MenuPadsBox2-ConditionWatch"  || Clicked == "LBL_MenuPadsRight2-ConditionWatch"    || Clicked == "RLBL_Menu_ButtonBG2-ConditionWatch" )      {Is_Sparam = true; Typer = 99;}
                    if(Clicked == "LBL_MenuPadsMainText-Ticket Manage"   || Clicked == "RLBL_MenuPadsBox2-Ticket Manage"   || Clicked == "LBL_MenuPadsRight2-Ticket Manage"     || Clicked == "RLBL_Menu_ButtonBG2-Ticket Manage")        {Is_Sparam = true; Typer = 00;}
                    if(Clicked == "LBL_MenuPadsMainText-Ticket Put"      || Clicked == "RLBL_MenuPadsBox2-Ticket Put"      || Clicked == "LBL_MenuPadsRight2-Ticket Put"        || Clicked == "RLBL_Menu_ButtonBG2-Ticket Put")           {Is_Sparam = true; Typer = 01;}
                    if(Clicked == "LBL_MenuPadsMainText-Ticket Modify"   || Clicked == "RLBL_MenuPadsBox2-Ticket Modify"   || Clicked == "LBL_MenuPadsRight2-Ticket Modify"     || Clicked == "RLBL_Menu_ButtonBG2-Ticket Modify")        {Is_Sparam = true; Typer = 02;} //LBL_MenuPadsMainText-Close Buys
                    if(Clicked == "LBL_MenuPadsMainText-Ticket End"      || Clicked == "RLBL_MenuPadsBox2-Ticket End"      || Clicked == "LBL_MenuPadsRight2-Ticket End"        || Clicked == "RLBL_Menu_ButtonBG2-Ticket End" )          {Is_Sparam = true; Typer = 10;}
                    if(Is_Sparam)
                    {         bool TPX = false; string TPX_DESC = "";
                              switch(Typer)
                              {         case 99: {TPX = IsPadPress_ConditionWatch;      TPX_DESC = "ConditionWatch";}   break; //
                                        case 00: {TPX = IsPadPress_TicketManage;        TPX_DESC = "Ticket Manage";}    break; //
                                        case 01: {TPX = IsPadPress_TicketPut;           TPX_DESC = "Ticket Put";}       break; //
                                        case 02: {TPX = IsPadPress_TicketModify;        TPX_DESC = "Ticket Modify";}    break; //
                                        case 10: {TPX = IsPadPress_TicketEnd;           TPX_DESC = "Ticket End";}       break; //
                              }; //
                              {         //====================================================================================================================================================
                                        TPX = TPX ? false : true;//Alert(__FUNCSIG__, TPX); //
                                        //====================================================================================================================================================
                                        if( TPX_DESC == "ConditionWatch")               {TRADER_Panel_DATA.IsConditionWatch = TPX;} //
                                        if( TPX_DESC == "Ticket Manage")                {TRADER_Panel_DATA.IsTicketManage   = TPX;} //
                                        //---
                                        if(TPX && TPX_DESC == "Ticket Put")             {SubController_SubTicketPut(MODE_CREATE, true, RightMenuPad_Color.CclrBody, RightMenuPad_Color.CclrBodyMargine, RightMenuPad_Color.CclrBodyText, RightMenuPad_Color.CclrBodyCyrcleUnPress);} // Alert("RightMenuPad_Color.CclrBodyCyrcleUnPress: ", RightMenuPad_Color.CclrBodyCyrcleUnPress);
                                        else if(!TPX && TPX_DESC == "Ticket Put")       {SubController_SubTicketPut(MODE_CREATE, false);} //
                                        //
                                        //
                                        if(TPX_DESC == "Ticket Modify")                 {SubController_SubTicketModify(MODE_CREATE, TPX, RightMenuPad_Color.CclrBody, RightMenuPad_Color.CclrBodyMargine, RightMenuPad_Color.CclrBodyText, RightMenuPad_Color.CclrBodyCyrcleUnPress);} //
                                        //
                                        //
                                        if( TPX_DESC == "Ticket End")                   {SubController_SubTicketEnd(MODE_CREATE, TPX, RightMenuPad_Color.CclrBody, RightMenuPad_Color.CclrBodyMargine, RightMenuPad_Color.CclrBodyText, RightMenuPad_Color.CclrBodyCyrcleUnPress );} //
                                        //====================================================================================================================================================
                                        //
                              }        //
                              switch(Typer)
                              {         case 99: { IsPadPress_ConditionWatch    = TPX;} break; //
                                        case 00: { IsPadPress_TicketManage      = TPX;} break; //
                                        case 01: { IsPadPress_TicketPut         = TPX;} break; //
                                        case 02: { IsPadPress_TicketModify      = TPX;} break; //
                                        case 10: { IsPadPress_TicketEnd         = TPX;} break; //
                              };//
                              //---Alert("TRADER_Panel_DATA.IsConditionWatch: ", TRADER_Panel_DATA.IsConditionWatch); //
                    } //
          }//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Cp_SubController:: Set_Close()
{         //---
          color clrOne                  = clrOrange ;
          color clrTwo                  = clrFireBrick;
          color clrTwo2                 = clrFireBrick;
          color clrLogo                 = clrBlue;
          color clrBody                 = clrWhite;
          color clrBodyMargine          = clrNavy;
          color clrBodyText             = clrNavy;
          color clrBodyCyrcleUnPress    = clrRed; //
          color clrBodyCyrclePress      = clrYellowGreen; //
          color clrBodyCyrcleActive     = clrOrange;
          string Clicked                = Event.sparam;
          if(Clicked == "Logo-Close_SubTicketEnd" )
          {         TRADER_Panel_DATA.Is_Close_SubTicketEnd = TRADER_Panel_DATA.Is_Close_SubTicketEnd ? false : true; //
                    if(TRADER_Panel_DATA.Is_Close_SubTicketEnd) {  ObjectSetInteger(0, "Logo-Close_SubTicketEnd", OBJPROP_COLOR, clrNavy);} //
                    else                            {  ObjectSetInteger(0, "Logo-Close_SubTicketEnd", OBJPROP_COLOR, clrWhite);} //
                    SubController_SubTicketEnd(MODE_CREATE, TRADER_Panel_DATA.Is_Close_SubTicketEnd); //-- secend call to clrWhite and exite... frist call waite to orders close or delete by termination all orders..then act secend
          }; //
          //---
          if(IsPadPress_TicketEnd)
          {         bool Is_Sparam = false;  int Typer = 0;//LBL_MenuPadsMainText-Close All
                    if(Clicked == "LBL_MenuPadsMainText-Close All"              || Clicked == "LBL_MenuPadsBox2-Close All"               || Clicked == "LBL_MenuPadsRight2-Close All"             || Clicked == "RLBL_Menu_ButtonBG2-Close All"         || Clicked == "RLBL_Menu_ButtonBG2-Close All")          {Is_Sparam = true; Typer = 99;}
                    if(Clicked == "LBL_MenuPadsMainText-Close Markets"          || Clicked == "LBL_MenuPadsBox2-Close Markets"           || Clicked == "LBL_MenuPadsRight2-Close Markets"         || Clicked == "RLBL_Menu_ButtonBG2-Close Markets"     || Clicked == "RLBL_Menu_ButtonBG2-Close Markets")      {Is_Sparam = true; Typer = 00;}
                    if(Clicked == "LBL_MenuPadsMainText-Close Sells"            || Clicked == "LBL_MenuPadsBox2-Close Sells"             || Clicked == "LBL_MenuPadsRight2-Close Sells"           || Clicked == "RLBL_Menu_ButtonBG2-Close Sells"       || Clicked == "RLBL_Menu_ButtonBG2-Close Sells")        {Is_Sparam = true; Typer = 01;}
                    if(Clicked == "LBL_MenuPadsMainText-Close Buys"             || Clicked == "LBL_MenuPadsBox2-Close Buys"              || Clicked == "LBL_MenuPadsRight2-Close Buys"            || Clicked == "RLBL_Menu_ButtonBG2-Close Buys"        || Clicked == "RLBL_Menu_ButtonBG2-Close Buys")         {Is_Sparam = true; Typer = 02;} //LBL_MenuPadsMainText-Close Buys
                    if(Clicked == "LBL_MenuPadsMainText-Delete Pendings"        || Clicked == "LBL_MenuPadsBox2-Delete Pendings"         || Clicked == "LBL_MenuPadsRight2-Delete Pendings"       || Clicked == "RLBL_Menu_ButtonBG2-Delete Pendings"   || Clicked == "RLBL_Menu_ButtonBG2-Delete Pendings")    {Is_Sparam = true; Typer = 10;}
                    if(Clicked == "LBL_MenuPadsMainText-Delete SellLimits"      || Clicked == "LBL_MenuPadsBox2-Delete SellLimits"       || Clicked == "LBL_MenuPadsRight2-Delete SellLimits"     || Clicked == "RLBL_Menu_ButtonBG2-Delete SellLimits" || Clicked == "RLBL_Menu_ButtonBG2-Delete SellLimits")  {Is_Sparam = true; Typer = 11;}
                    if(Clicked == "LBL_MenuPadsMainText-Delete SellStops"       || Clicked == "LBL_MenuPadsBox2-Delete SellStops"        || Clicked == "LBL_MenuPadsRight2-Delete SellStops"      || Clicked == "RLBL_Menu_ButtonBG2-Delete SellStops"  || Clicked == "RLBL_Menu_ButtonBG2-Delete SellStops")   {Is_Sparam = true; Typer = 12;}
                    if(Clicked == "LBL_MenuPadsMainText-Delete BuyLimits"       || Clicked == "LBL_MenuPadsBox2-Delete BuyLimits"        || Clicked == "LBL_MenuPadsRight2-Delete BuyLimits"      || Clicked == "RLBL_Menu_ButtonBG2-Delete BuyLimits"  || Clicked == "RLBL_Menu_ButtonBG2-Delete BuyLimits")   {Is_Sparam = true; Typer = 13;}
                    if(Clicked == "LBL_MenuPadsMainText-Delete BuyStops"        || Clicked == "LBL_MenuPadsBox2-Delete BuyStops"         || Clicked == "LBL_MenuPadsRight2-Delete BuyStops"       || Clicked == "RLBL_Menu_ButtonBG2-Delete BuyStops"   || Clicked == "RLBL_Menu_ButtonBG2-Delete BuyStops")    {Is_Sparam = true; Typer = 14;}
                    if(Is_Sparam)
                    {         bool TPX = false; string TPX_DESC = "";
                              switch(Typer)
                              {         case 99: {TPX = OrderEnding.Is_Orders;                   TPX_DESC = "Close All";} break; //
                                        case 00: {TPX = OrderEnding.Is_Markets;                  TPX_DESC = "Close Markets";} break; //
                                        case 01: {TPX = OrderEnding.Is_OrdersSell;               TPX_DESC = "Close Sells";} break; //
                                        case 02: {TPX = OrderEnding.Is_OrdersBuy;                TPX_DESC = "Close Buys";} break; //
                                        case 10: {TPX = OrderEnding.Is_Pendings;                 TPX_DESC = "Delete Pendings";} break; //
                                        case 11: {TPX = OrderEnding.Is_PendingsSellLimit;        TPX_DESC = "Delete SellLimits";} break; //
                                        case 12: {TPX = OrderEnding.Is_PendingsSellStop;         TPX_DESC = "Delete SellStops";} break; //           //
                                        case 13: {TPX = OrderEnding.Is_PendingsBuyLimit;         TPX_DESC = "Delete BuyLimits";} break; //
                                        case 14: {TPX = OrderEnding.Is_PendingsBuyStop;          TPX_DESC = "Delete BuyStops";} break; //
                              };//
                              {         //
                                        {         //====================================================================================================================================================
                                                  TPX = TPX ? false : true;
                                                  //Alert(__FUNCSIG__, TPX); ////notHave any function just IsKeys Manages
                                                  Complex.Menu_Button(MODE_MODIFY, TPX, TPX_DESC, clrBody, clrBodyMargine, clrWhite, clrBodyCyrclePress);
                                                  //====================================================================================================================================================
                                                  if(TPX_DESC == "Close All")                     {OrderEnding.Is_Orders                   = TRADER_Panel_DATA.IsAuto_EndAll = TPX;} //
                                                  if(TPX_DESC == "Close Markets")                 {OrderEnding.Is_Markets                  = TPX;} //
                                                  if(TPX_DESC == "Close Sells")                   {OrderEnding.Is_OrdersSell               = TPX;} //
                                                  if(TPX_DESC == "Close Buys")                    {OrderEnding.Is_OrdersBuy                = TPX;} //
                                                  if(TPX_DESC == "Delete Pendings")               {OrderEnding.Is_Pendings                 = TPX;} //
                                                  if(TPX_DESC == "Delete SellLimits")             {OrderEnding.Is_PendingsSellLimit        = TPX;} //
                                                  if(TPX_DESC == "Delete SellStops")              {OrderEnding.Is_PendingsSellStop         = TPX;} //
                                                  if(TPX_DESC == "Delete BuyLimits")              {OrderEnding.Is_PendingsBuyLimit         = TPX;} //
                                                  if(TPX_DESC == "Delete BuyStops")               {OrderEnding.Is_PendingsBuyStop          = TPX;} //
                                        }         //
                              } //
                              switch(Typer)
                              {         case 99: { OrderEnding.Is_Orders                = TPX;} break; //
                                        case 00: { OrderEnding.Is_Markets               = TPX;} break; //
                                        case 01: { OrderEnding.Is_OrdersSell            = TPX;} break; //
                                        case 02: { OrderEnding.Is_OrdersBuy             = TPX;} break; //
                                        case 10: { OrderEnding.Is_Pendings              = TPX;} break; //
                                        case 11: { OrderEnding.Is_PendingsSellLimit     = TPX;} break; //
                                        case 12: { OrderEnding.Is_PendingsSellStop      = TPX;} break; //           //
                                        case 13: { OrderEnding.Is_PendingsBuyLimit      = TPX;} break; //
                                        case 14: { OrderEnding.Is_PendingsBuyStop       = TPX;} break; //
                              };//
                    } //
          }//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Cp_SubController:: Set_Put()
{         //---
          color clrOne                  = clrOrange ;
          color clrTwo                  = clrFireBrick;
          color clrTwo2                 = clrFireBrick;
          color clrLogo                 = clrBlue;
          color clrBody                 = clrWhite;
          color clrBodyMargine          = clrNavy;
          color clrBodyText             = clrNavy;
          color clrBodyCyrcleUnPress    = clrRed; //
          color clrBodyCyrclePress      = clrYellowGreen; //
          color clrBodyCyrcleActive     = clrOrange;
          string Clicked                = Event.sparam;
          //---
          if(IsPadPress_TicketPut)
          {         bool Is_Sparam = false;  int Typer = 0;//
                    if(Clicked == "LBL_MenuPadsMainText-Put All"        || Clicked == "LBL_MenuPadsBox2-Put All"        || Clicked == "LBL_MenuPadsRight2-Put All"              || Clicked == "RLBL_Menu_ButtonBG2-Put All")            {Is_Sparam = true; Typer = 99; OrderPutting.Is_Orders            = OrderPutting.Is_Orders                 ? false : true;}
                    if(Clicked == "LBL_MenuPadsMainText-Put Markets"    || Clicked == "LBL_MenuPadsBox2-Put Markets"    || Clicked == "LBL_MenuPadsRight2-Put Markets"          || Clicked == "RLBL_Menu_ButtonBG2-Put Markets")        {Is_Sparam = true; Typer = 00; OrderPutting.Is_Markets           = OrderPutting.Is_Markets                ? false : true;}
                    if(Clicked == "LBL_MenuPadsMainText-Put Sells"      || Clicked == "LBL_MenuPadsBox2-Put Sells"      || Clicked == "LBL_MenuPadsRight2-Put Sells"            || Clicked == "RLBL_Menu_ButtonBG2-Put Sells")          {Is_Sparam = true; Typer = 01; OrderPutting.Is_MarketsSell       = OrderPutting.Is_MarketsSell            ? false : true;}
                    if(Clicked == "LBL_MenuPadsMainText-Put Buys"       || Clicked == "LBL_MenuPadsBox2-Put Buys"       || Clicked == "LBL_MenuPadsRight2-Put Buys"             || Clicked == "RLBL_Menu_ButtonBG2-Put Buys")           {Is_Sparam = true; Typer = 02; OrderPutting.Is_MarketsBuy        = OrderPutting.Is_MarketsBuy             ? false : true;} //LBL_MenuPadsMainText-Close Buys
                    if(Clicked == "LBL_MenuPadsMainText-Put Pendings"   || Clicked == "LBL_MenuPadsBox2-Put Pendings"   || Clicked == "LBL_MenuPadsRight2-Put Pendings"         || Clicked == "RLBL_Menu_ButtonBG2-Put Pendings")       {Is_Sparam = true; Typer = 10; OrderPutting.Is_Pendings          = OrderPutting.Is_Pendings               ? false : true;}
                    if(Clicked == "LBL_MenuPadsMainText-Put SellLimits" || Clicked == "LBL_MenuPadsBox2-Put SellLimits" || Clicked == "LBL_MenuPadsRight2-Put SellLimits"       || Clicked == "RLBL_Menu_ButtonBG2-Put SellLimits")     {Is_Sparam = true; Typer = 11; OrderPutting.Is_PendingsSellLimit = OrderPutting.Is_PendingsSellLimit      ? false : true;}
                    if(Clicked == "LBL_MenuPadsMainText-Put SellStops"  || Clicked == "LBL_MenuPadsBox2-Put SellStops"  || Clicked == "LBL_MenuPadsRight2-Put SellStops"        || Clicked == "RLBL_Menu_ButtonBG2-Put SellStops")      {Is_Sparam = true; Typer = 12; OrderPutting.Is_PendingsSellStop  = OrderPutting.Is_PendingsSellStop       ? false : true;}
                    if(Clicked == "LBL_MenuPadsMainText-Put BuyLimits"  || Clicked == "LBL_MenuPadsBox2-Put BuyLimits"  || Clicked == "LBL_MenuPadsRight2-Put BuyLimits"        || Clicked == "RLBL_Menu_ButtonBG2-Put BuyLimits")      {Is_Sparam = true; Typer = 13; OrderPutting.Is_PendingsBuyLimit  = OrderPutting.Is_PendingsBuyLimit       ? false : true;}
                    if(Clicked == "LBL_MenuPadsMainText-Put BuyStops"   || Clicked == "LBL_MenuPadsBox2-Put BuyStops"   || Clicked == "LBL_MenuPadsRight2-Put BuyStops"         || Clicked == "RLBL_Menu_ButtonBG2-Put BuyStops")       {Is_Sparam = true; Typer = 14; OrderPutting.Is_PendingsBuyStop   = OrderPutting.Is_PendingsBuyStop        ? false : true;}
                    if(false && Is_Sparam )
                    {         bool TPX = false; string TPX_DESC = "";
                              switch(Typer)
                              {         case 99: {TPX = OrderPutting.Is_Orders;                  TPX_DESC = "Put All";} break; //
                                        case 00: {TPX = OrderPutting.Is_Markets;                 TPX_DESC = "Put Markets";} break; //
                                        case 01: {TPX = OrderPutting.Is_MarketsSell;             TPX_DESC = "Put Sells";} break; //
                                        case 02: {TPX = OrderPutting.Is_OrdersBuy;               TPX_DESC = "Put Buys";} break; //
                                        case 10: {TPX = OrderPutting.Is_Pendings;                TPX_DESC = "Put Pendings";} break; //
                                        case 11: {TPX = OrderPutting.Is_PendingsSellLimit;       TPX_DESC = "Put SellLimits";} break; //
                                        case 12: {TPX = OrderPutting.Is_PendingsSellStop;        TPX_DESC = "Put SellStops";} break; //           //
                                        case 13: {TPX = OrderPutting.Is_PendingsBuyLimit;        TPX_DESC = "Put BuyLimits";} break; //
                                        case 14: {TPX = OrderPutting.Is_PendingsBuyStop;         TPX_DESC = "Put BuyStops";} break; //
                              };//
                              {         //
                                        {         //====================================================================================================================================================
                                                  TPX = TPX ? false : true;
                                                  //Alert(__FUNCSIG__, TPX); //
                                                  Complex.Menu_Button(MODE_MODIFY, TPX, TPX_DESC, clrBody, clrBodyMargine, clrWhite, clrBodyCyrclePress);
                                                  //====================================================================================================================================================
                                                  if(TPX_DESC == "Put All")              {OrderPutting.Is_Orders                 = TRADER_Panel_DATA.IsAuto_OrdersPut                 = TPX;} //
                                                  if(TPX_DESC == "Put Markets")
                                                  {         OrderPutting.Is_Markets                = TPX;
                                                            //
                                                            ct_Drive.TDD.ct_Start._OrderPut_OP.PutSymbol         = StSymbol.Current;
                                                            ct_Drive.TDD.ct_Start._OrderPut_OP.PutType           = OP_SELL;
                                                            ct_Drive.TDD.ct_Start._OrderPut_OP.PutLots           = ct_Drive.TDD.st_Size.Curr_Lots;
                                                            ct_Drive.TDD.ct_Start._OrderPut_OP.PutPrice          = ct_Drive.TDD.ct_SetPrices.Price_CalcX.SellMarket.Open;// = Bid;
                                                            ct_Drive.TDD.ct_Start._OrderPut_OP.PutSlippage       = ct_Drive.TDD.ct_Market_Symbol.Slippage;//
                                                            ct_Drive.TDD.ct_Start._OrderPut_OP.PutSL             = ct_Drive.TDD.ct_SetPrices.Price_CalcX.SellMarket.SL;// = Bid + 200 * Point; //
                                                            ct_Drive.TDD.ct_Start._OrderPut_OP.PutTP             = ct_Drive.TDD.ct_SetPrices.Price_CalcX.SellMarket.TP;// = Bid - 200 * Point; //
                                                            ct_Drive.TDD.ct_Start._OrderPut_OP.PutComment        = ct_Drive.TDD.ct_Start._Comments.SellMarket;//
                                                            ct_Drive.TDD.ct_Start._OrderPut_OP.PutMagicNumber    = ct_Drive.TDD.ct_Bank.MagicNumber;//
                                                            ct_Drive.TDD.ct_Start._OrderPut_OP.PutExpiration     = ct_Drive.TDD.ct_SCMETime.Expiration.SellMarket;//
                                                            ct_Drive.TDD.ct_Start._OrderPut_OP.PutArrow          = ct_Drive.TDD.ct_Start._ArrowClr.Sell_Market = clrOrangeRed; //
                                                            //
                                                            OrderPutting.Is_MarketsSellDone =  ct_Drive.TDD.ct_Start.OrderPut( 0); //
                                                  } //
                                                  if(TPX_DESC == "Put Sells")            {OrderPutting.Is_MarketsSell            = TPX; OrderPutting.Is_MarketsSellDone =  ct_Drive.TDD.ct_Start.OrderPut( 0);} //
                                                  if(TPX_DESC == "Put Buys")             {OrderPutting.Is_OrdersBuy              = TPX;} //
                                                  if(TPX_DESC == "Put Pendings")         {OrderPutting.Is_Pendings               = TPX;} //
                                                  if(TPX_DESC == "Put SellLimits")       {OrderPutting.Is_PendingsSellLimit      = TPX;} //
                                                  if(TPX_DESC == "Put SellStops")        {OrderPutting.Is_PendingsSellStop       = TPX;} //
                                                  if(TPX_DESC == "Put BuyLimits")        {OrderPutting.Is_PendingsBuyLimit       = TPX;} //
                                                  if(TPX_DESC == "Put BuyStops")         {OrderPutting.Is_PendingsBuyStop        = TPX;} //
                                        }        //
                              } //
                              switch(Typer)
                              {         case 99: { OrderPutting.Is_Orders                = TPX;} break; //
                                        case 00: { OrderPutting.Is_Markets               = TPX;} break; //
                                        case 01: { OrderPutting.Is_MarketsSell           = TPX;} break; //
                                        case 02: { OrderPutting.Is_OrdersBuy             = TPX;} break; //
                                        case 10: { OrderPutting.Is_Pendings              = TPX;} break; //
                                        case 11: { OrderPutting.Is_PendingsSellLimit     = TPX;} break; //
                                        case 12: { OrderPutting.Is_PendingsSellStop      = TPX;} break; //           //
                                        case 13: { OrderPutting.Is_PendingsBuyLimit      = TPX;} break; //
                                        case 14: { OrderPutting.Is_PendingsBuyStop       = TPX;} break; //
                              };//
                    } //
          }//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Cp_SubController:: Set_Trail()
{         //---
          color clrOne                  = clrOrange ;
          color clrTwo                  = clrFireBrick;
          color clrTwo2                 = clrFireBrick;
          color clrLogo                 = clrBlue;
          color clrBody                 = clrWhite;
          color clrBodyMargine          = clrNavy;
          color clrBodyText             = clrNavy;
          color clrBodyCyrcleUnPress    = clrRed; //
          color clrBodyCyrclePress      = clrYellowGreen; //
          color clrBodyCyrcleActive     = clrOrange;
          string Clicked                = Event.sparam;
          //---
          if(IsPadPress_TicketModify)
          {         bool Is_Sparam = false;  int Typer = 0;//
                    if(Clicked == "LBL_MenuPadsMainText-Trail SL" || Clicked == "LBL_MenuPadsBox2-Trail SL" || Clicked == "LBL_MenuPadsRight2-Trail SL" || Clicked == "RLBL_Menu_ButtonBG2-Trail SL")   {Is_Sparam = true; Typer = 01;}
                    if(Clicked == "LBL_MenuPadsMainText-Trail TP" || Clicked == "LBL_MenuPadsBox2-Trail TP" || Clicked == "LBL_MenuPadsRight2-Trail TP" || Clicked == "RLBL_Menu_ButtonBG2-Trail TP")   {Is_Sparam = true; Typer = 02;}
                    if(Clicked == "LBL_MenuPadsMainText-Trail EX" || Clicked == "LBL_MenuPadsBox2-Trail EX" || Clicked == "LBL_MenuPadsRight2-Trail EX" || Clicked == "RLBL_Menu_ButtonBG2-Trail EX")   {Is_Sparam = true; Typer = 03;}
                    if(Clicked == "LBL_MenuPadsMainText-Trail OP" || Clicked == "LBL_MenuPadsBox2-Trail OP" || Clicked == "LBL_MenuPadsRight2-Trail OP" || Clicked == "RLBL_Menu_ButtonBG2-Trail OP")   {Is_Sparam = true; Typer = 04;} //LBL_MenuPadsMainText-Close Buys
                    if(Is_Sparam)
                    {         bool TPX = false; string TPX_DESC = "";
                              switch(Typer)
                              {         case 01: {TPX = IsPadPress_TrailSL;     TPX_DESC = "Trail SL";} break; //
                                        case 02: {TPX = IsPadPress_TrailTP;     TPX_DESC = "Trail TP";} break; //
                                        case 03: {TPX = IsPadPress_TrailEX;     TPX_DESC = "Trail EX";} break; //
                                        case 04: {TPX = IsPadPress_TrailOP;     TPX_DESC = "Trail OP";} break; //
                              }; //
                              {         //
                                        {         //====================================================================================================================================================
                                                  TPX = TPX ? false : true;
                                                  //Alert(__FUNCSIG__, TPX); //
                                                  Complex.Menu_Button(MODE_MODIFY, TPX, TPX_DESC, clrBody, clrBodyMargine, clrWhite, clrBodyCyrclePress);
                                                  //====================================================================================================================================================
                                                  if(TPX_DESC == "Trail SL")            {IsPadPress_TrailSL = TPX;}  //
                                                  if(TPX_DESC == "Trail TP")            {IsPadPress_TrailTP = TPX;}  //
                                                  if(TPX_DESC == "Trail EX")            {IsPadPress_TrailEX = TPX;}  //
                                                  if(TPX_DESC == "Trail OP")            {IsPadPress_TrailOP = TPX;}  //
                                        }        //
                              } //
                              switch(Typer)
                              {         case 01: { IsPadPress_TrailSL   = TPX;} break; //
                                        case 02: { IsPadPress_TrailTP   = TPX;} break; //
                                        case 03: { IsPadPress_TrailEX   = TPX;} break; //
                                        case 04: { IsPadPress_TrailOP   = TPX;} break; //
                              };//
                    } //
          }//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Cp_SubController::_Call(int WhichMode, bool IsKey, color clrBody = clrWhite, color clrBodyMargine = clrNavy, color clrBodyText = clrNavy, color clrBodyCyrcle = clrRed)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cp_SubController Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          _Show(WhichMode, IsKey, clrBody, clrBodyMargine, clrBodyText, clrBodyCyrcle);
          RightMenu.IsPadPress_Controller  = IsKey & (WhichMode == MODE_CREATE); //;
//----gone uper call difusing
//if(false &&IsKey)
//{         RightMenu.SubSide_MarketKeys_Loger._Call(MODE_CREATE, false);
//          RightMenu.SubStatus._Call(MODE_CREATE, false);
//          RightMenu.SubEMA._Call(MODE_CREATE, false); //
//          bank_Pad.MM_Panel(MODE_CREATE, false); //
//}
          if(!RightMenu.IsPadPress_Controller)//Is_Create
          {         SubController_SubTicketPut(MODE_CREATE, false);
                    SubController_SubTicketModify(MODE_CREATE, false);
                    SubController_SubTicketEnd(MODE_CREATE, false); //
          }
//===========================================================================================================================================================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cp_SubController Error",  __LINE__, __FUNCTION__); //|
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Cp_SubController::SubController_SubTicketPut(int WhichMode, bool IsKey, color clrBody = clrWhite, color clrBodyMargine = clrNavy, color clrBodyText = clrNavy, color clrBodyCyrcle = clrRed)
{
//=========================================================|
          int stepa  = 20;
          int SizeX = 35;
          int MoveX = 50;
          int MoveY = 82 - 62;
          int movestep = SizeX + (int)(SizeX * 1.6) + (int)(SizeX * 1.7);
          int FontSize = -3;//
//movestep += movestep * stepa * 1
          if(0)
          {         Complex.Menu_ButtonX(WhichMode, IsKey, "C" + "1",           movestep * 1, 0,                                  SizeX, 0, FontSize); //x
                    Complex.Menu_ButtonX(WhichMode, IsKey, "C" + "2",           movestep * 2, 0,                                  SizeX, 0, FontSize);
                    Complex.Menu_ButtonX(WhichMode, IsKey, "C" + "3",           movestep * 3, 0,                                  SizeX, 0,  FontSize);
                    Complex.Menu_ButtonX(WhichMode, IsKey, "C" + "4",           movestep * 4, 0,                                  SizeX, 0,  FontSize);
                    Complex.Menu_ButtonX(WhichMode, IsKey, "C" + "5",           movestep * 5, 0,                                  SizeX, 0,  FontSize); }
          if(1)
          {         Complex.Menu_ButtonX(WhichMode, IsKey, "Put All",           movestep + MoveX, stepa * 0 + 0 + MoveY,          SizeX * 1, 0,  FontSize, clrBody, clrBodyMargine, clrBodyText, clrBodyCyrcle); //Alert("clrBodyCyrcle: ", clrBodyCyrcle);
                    Complex.Menu_ButtonX(WhichMode, IsKey, "Put Markets",       movestep + MoveX, stepa * 1 + 2 + MoveY,          SizeX * 1, 0,  FontSize);
                    Complex.Menu_ButtonX(WhichMode, IsKey, "Put Sells",         movestep + MoveX, stepa * 2 + 2 + MoveY,          SizeX * 1, 0,  FontSize);
                    Complex.Menu_ButtonX(WhichMode, IsKey, "Put Buys",          movestep + MoveX, stepa * 3 + 2 + MoveY,          SizeX * 1, 0,  FontSize);
                    //
                    Complex.Menu_ButtonX(WhichMode, IsKey, "Put Pendings",      movestep + MoveX, (int)(stepa * 4.5) + 2 + MoveY, SizeX * 1, 0,  FontSize); //
                    Complex.Menu_ButtonX(WhichMode, IsKey, "Put SellLimits",    movestep + MoveX, (int)(stepa * 5.5) + 2 + MoveY, SizeX * 1, 0,  FontSize); //
                    Complex.Menu_ButtonX(WhichMode, IsKey, "Put SellStops",     movestep + MoveX, (int)(stepa * 6.5) + 2 + MoveY, SizeX * 1, 0,  FontSize); //
                    Complex.Menu_ButtonX(WhichMode, IsKey, "Put BuyLimits",     movestep + MoveX, (int)(stepa * 7.5) + 2 + MoveY, SizeX * 1, 0,  FontSize); //
                    Complex.Menu_ButtonX(WhichMode, IsKey, "Put BuyStops",      movestep + MoveX, (int)(stepa * 8.5) + 2 + MoveY, SizeX * 1, 0,  FontSize); //
                    IsPadPress_TicketPut = IsKey;//
          } //
          if(IsPadPress_TicketPut)
          {         SubController_SubTicketEnd(MODE_CREATE, false);
                    SubController_SubTicketModify(MODE_CREATE, false);
                    if(0)
                    {         //
                              ////--- BTN_X ---//
                              {         ButtonX.GDS.Set_Action_2(WhichMode, IsKey /*int WhichMode = MODE_CREATE, bool IsKey = false*/);
                                        ButtonX.GDS.Set_Desc_4("BTN_OrdersPutMode_Press0", " R:S", ButtonDEF_FONT, ButtonDEF_FONTSIZE);
                                        ButtonX.GDS.Set_Self_1(ButtonDEF_state);
                                        ButtonX.GDS.Set_Location_5(205 + 200, 205, BUTTONX_WIDTH - 5, BUTTONX_HEIGHT, CORNER_LEFT_UPPER);
                                        ButtonX.GDS.Set_Color_3(clrLavender, clrLavender, clrDarkCyan);
                                        ButtonX.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "BTN_OrdersPutMode_Press0");
                                        ButtonX.GDS.Set_Chart_6();
                                        ButtonX.Action(ButtonX);//
                                        //0// RightMenuPad.BTN_OrdersPutMode_Press.Create(Is_Create, Is_Move, __FUNCSIG__, "BTN_OrdersPutMode_Press0", " R:S",
                                        //0// 205 + 200, 205, BUTTONX_WIDTH - 5, BUTTONX_HEIGHT, CORNER_LEFT_UPPER, ANCHOR_CENTER, false, clrLavender, clrLavender, clrDarkCyan);
                              }
                              ////--- BTN_X ---//
                              {         ButtonX.GDS.Set_Action_2(WhichMode, IsKey /*int WhichMode = MODE_CREATE, bool IsKey = false*/);
                                        ButtonX.GDS.Set_Desc_4("BTN_OrdersPutMode_Press1", " Fibo", ButtonDEF_FONT, ButtonDEF_FONTSIZE);
                                        ButtonX.GDS.Set_Self_1(ButtonDEF_state);
                                        ButtonX.GDS.Set_Location_5(205 + 200, 220, BUTTONX_WIDTH - 5, BUTTONX_HEIGHT, CORNER_LEFT_UPPER);
                                        ButtonX.GDS.Set_Color_3(clrLavender, clrLavender, clrDarkCyan);
                                        ButtonX.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "BTN_OrdersPutMode_Press0");
                                        ButtonX.GDS.Set_Chart_6();
                                        ButtonX.Action(ButtonX);//
                                        //0// RightMenuPad.BTN_OrdersPutMode_Press.Create(Is_Create, Is_Move, __FUNCSIG__, "BTN_OrdersPutMode_Press1", " Fibo",
                                        //0// 205 + 200, 220, BUTTONX_WIDTH - 5, BUTTONX_HEIGHT, CORNER_LEFT_UPPER, ANCHOR_CENTER, false, clrLavender, clrLavender, clrDarkCyan);
                              }
                              ////--- BTN_X ---//
                              {         ButtonX.GDS.Set_Action_2(WhichMode, IsKey /*int WhichMode = MODE_CREATE, bool IsKey = false*/);
                                        ButtonX.GDS.Set_Desc_4("BTN_OrdersPutMode_Press2", " Osc", ButtonDEF_FONT, ButtonDEF_FONTSIZE);
                                        ButtonX.GDS.Set_Self_1(ButtonDEF_state);
                                        ButtonX.GDS.Set_Location_5(205 + 200, 235, BUTTONX_WIDTH - 5, BUTTONX_HEIGHT, CORNER_LEFT_UPPER);
                                        ButtonX.GDS.Set_Color_3(clrLavender, clrLavender, clrDarkCyan);
                                        ButtonX.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "BTN_OrdersPutMode_Press0");
                                        ButtonX.GDS.Set_Chart_6();
                                        ButtonX.Action(ButtonX);//
                                        //0// RightMenuPad.BTN_OrdersPutMode_Press.Create(Is_Create, Is_Move, __FUNCSIG__, "BTN_OrdersPutMode_Press2", " Osc",
                                        //0// 205 + 200, 235, BUTTONX_WIDTH - 5, BUTTONX_HEIGHT, CORNER_LEFT_UPPER, ANCHOR_CENTER, false, clrLavender, clrLavender, clrDarkCyan);
                              }
                              //
                    }//
          }
//=====================================================================================================================================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cp_SubController Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Cp_SubController::SubController_SubTicketModify(int WhichMode, bool IsKey, color clrBody = clrWhite, color clrBodyMargine = clrNavy, color clrBodyText = clrNavy, color clrBodyCyrcle = clrRed)
{
//=========================================================|
          int stepa  = 20;
          int SizeX = 10;
          int MoveX = 105;
          int MoveY = 63;
          int movestep = SizeX + (int)(SizeX * 1.6) + (SizeX * 7) + MoveX;
          int FontSize = -3;//
//movestep += movestep * stepa * 1
          if(0)
          {         Complex.Menu_ButtonX(WhichMode, IsKey, "C" + "1",  movestep * 1, 0,                 SizeX, 0,  FontSize); //x
                    Complex.Menu_ButtonX(WhichMode, IsKey, "C" + "2",  movestep * 2, 0,                 SizeX, 0,  FontSize);
                    Complex.Menu_ButtonX(WhichMode, IsKey, "C" + "3",  movestep * 3, 0,                 SizeX, 0, FontSize);
                    Complex.Menu_ButtonX(WhichMode, IsKey, "C" + "4",  movestep * 4, 0,                 SizeX, 0,  FontSize);
                    Complex.Menu_ButtonX(WhichMode, IsKey, "C" + "5",  movestep * 5, 0,                 SizeX, 0,  FontSize); }
          if(1)
          {         Complex.Menu_ButtonX(WhichMode, IsKey, "Trail SL", movestep, stepa * 0 + 0 + MoveY, SizeX * 1, 0, FontSize, clrBody, clrBodyMargine, clrBodyText, clrBodyCyrcle);
                    Complex.Menu_ButtonX(WhichMode, IsKey, "Trail TP", movestep, stepa * 1 + 2 + MoveY, SizeX * 1, 0, FontSize);
                    Complex.Menu_ButtonX(WhichMode, IsKey, "Trail EX", movestep, stepa * 2 + 2 + MoveY, SizeX * 1, 0,  FontSize);
                    Complex.Menu_ButtonX(WhichMode, IsKey, "Trail OP", movestep, stepa * 3 + 2 + MoveY, SizeX * 1, 0,  FontSize); //
                    TrialPanel(WhichMode, IsKey);//
                    Modify_Pad.SubController_PadModify(MODE_CREATE, IsKey, IsKey); //
          } //
          IsPadPress_TicketModify = (IsKey && (WhichMode == MODE_CREATE));//---off--bitwise oprater &
          if(WhichMode == MODE_CREATE && IsKey)
          {         SubController_SubTicketEnd(MODE_CREATE, false);
                    SubController_SubTicketPut(MODE_CREATE, false); //
          }
          if(!IsPadPress_TicketModify) Complex.Menu_Button(MODE_MODIFY, IsPadPress_TicketModify, "Ticket Modify", RightMenuPad_Color.CclrBody, RightMenuPad_Color.CclrBodyMargine, clrWhite, RightMenuPad_Color.CclrBodyCyrcleUnPress); //
//=====================================================================================================================================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cp_SubController Error",  __LINE__, __FUNCTION__); //|
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Cp_SubController::SubController_SubTicketEnd(int WhichMode, bool IsKey, color clrBody = clrWhite, color clrBodyMargine = clrNavy, color clrBodyText = clrNavy, color clrBodyCyrcle = clrRed)
{
//=========================================================|int mode, bool IsKey,
          int stepa  = 20;
          int SizeX = 35;
          int MoveX = 50;
          int MoveY = 82 - 62;
          int movestep = SizeX + (int)(SizeX * 1.6) + (int)(SizeX * 1.7);
          int FontSize = -3;//
//movestep += movestep * stepa * 1
          if(0)
          {         Complex.Menu_ButtonX(WhichMode, IsKey, "C" + "1",  movestep * 1, 0, SizeX, 0, FontSize); //x
                    Complex.Menu_ButtonX(WhichMode, IsKey, "C" + "2",  movestep * 2, 0, SizeX, 0, FontSize);
                    Complex.Menu_ButtonX(WhichMode, IsKey, "C" + "3",  movestep * 3, 0, SizeX, 0, FontSize);
                    Complex.Menu_ButtonX(WhichMode, IsKey, "C" + "4",  movestep * 4, 0, SizeX, 0, FontSize);
                    Complex.Menu_ButtonX(WhichMode, IsKey, "C" + "5",  movestep * 5, 0, SizeX, 0, FontSize); }
          if(1)
          {         Complex.Menu_ButtonX(WhichMode, IsKey, "Close All",          movestep + MoveX, stepa * 0 + 0 + MoveY,         SizeX * 1, 0, FontSize, clrBody, clrBodyMargine, clrBodyText, clrBodyCyrcle);
                    Complex.Menu_ButtonX(WhichMode, IsKey, "Close Markets",      movestep + MoveX, stepa * 1 + 2 + MoveY,         SizeX * 1, 0,  FontSize);
                    Complex.Menu_ButtonX(WhichMode, IsKey, "Close Sells",        movestep + MoveX, stepa * 2 + 2 + MoveY,         SizeX * 1, 0,  FontSize);
                    Complex.Menu_ButtonX(WhichMode, IsKey, "Close Buys",         movestep + MoveX, stepa * 3 + 2 + MoveY,         SizeX * 1, 0,  FontSize);
                    //
                    Complex.Menu_ButtonX(WhichMode, IsKey, "Delete Pendings",    movestep + MoveX, (int)(stepa * 4.5) + 2 + MoveY, SizeX * 1, 0, FontSize); //
                    Complex.Menu_ButtonX(WhichMode, IsKey, "Delete SellLimits",  movestep + MoveX, (int)(stepa * 5.5) + 2 + MoveY, SizeX * 1, 0,  FontSize); //
                    Complex.Menu_ButtonX(WhichMode, IsKey, "Delete SellStops",   movestep + MoveX, (int)(stepa * 6.5) + 2 + MoveY, SizeX * 1, 0, FontSize); //
                    Complex.Menu_ButtonX(WhichMode, IsKey, "Delete BuyLimits",   movestep + MoveX, (int)(stepa * 7.5) + 2 + MoveY, SizeX * 1, 0, FontSize); //
                    Complex.Menu_ButtonX(WhichMode, IsKey, "Delete BuyStops",    movestep + MoveX, (int)(stepa * 8.5) + 2 + MoveY, SizeX * 1, 0,  FontSize); //
                    DevTextsButton.BTNCycle(WhichMode, IsKey, "Close_SubTicketEnd", "r", 130, 65, CORNER_LEFT_UPPER, ANCHOR_RIGHT, false, clrDarkSlateGray, clrRed,clrWhite,  0, 0, 3, "Webdings" ); // v Q
          } //
          IsPadPress_TicketEnd = IsKey;
          if(IsKey)
          {         SubController_SubTicketPut(WhichMode, false);
                    SubController_SubTicketModify(WhichMode, false); //
          }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cp_SubController Error",  __LINE__, __FUNCTION__); //|
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Cp_SubController::TrialPanel(int WhichMode, bool IsKey)
{
//
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_COMPLEXTOOLS Error",  __LINE__, __FUNCTION__); //|
          int MoveX = 250 + 200; int MoveY = 100; int SizeX = 30; int SizeY = 13;
          ENUM_BASE_CORNER CORNER = CORNER_LEFT_UPPER;
//=========================================================|
          {         //Alert(__FUNCSIG__, " -----Is_Create:", Is_Create); //
                    //RLBL_TrailBox.Create(Is_Create, Is_Move, "RLBL_TrailBoxBG", "", (int)(0) + MoveX, MoveY + (int)(0), SizeX = 100, SizeY = 60,                 CORNER, ANCHOR_CENTER, false, BORDER_FLAT, clrGainsboro, clrGainsboro,  0, STYLE_SOLID, 1, 5, "Arial" );
                    {         RectLabelX.GDS.Set_Action_2(WhichMode, IsKey);
                              RectLabelX.GDS.Set_Desc_1("TrailBoxBG");
                              RectLabelX.GDS.Set_Tip_3(STYLE_SOLID, 1, BORDER_FLAT);
                              RectLabelX.GDS.Set_Color_2(clrGainsboro, clrGainsboro);
                              RectLabelX.GDS.Set_Location_5((int)(0) + MoveX, MoveY + (int)(0), SizeX = 100, SizeY = 60, CORNER);
                              RectLabelX.GDS.Set_Chart_6();
                              RectLabelX.GDS.Set_Common_6(false, 10, false, false, false, RLDEF_tooltip + "TrailBoxBG");
                              RectLabelX.Action(RectLabelX);//
                    }//===================================================================================================================================================================
                    //
                    //RLBL_Trailing.Create(Is_Create, Is_Move, "RLBL_TrailingBox1", "", (int)(10) + MoveX, MoveY + (int)(15), SizeX = 80, SizeY = 15,                CORNER, ANCHOR_CENTER, false, BORDER_FLAT, clrYellowGreen, clrGainsboro,  0, STYLE_SOLID, 1, 5, "Arial" );
                    {         RectLabelX.GDS.Set_Action_2(WhichMode, IsKey);
                              RectLabelX.GDS.Set_Desc_1("TrailingBox1");
                              RectLabelX.GDS.Set_Tip_3(STYLE_SOLID, 1, BORDER_FLAT);
                              RectLabelX.GDS.Set_Color_2(clrYellowGreen, clrGainsboro);
                              RectLabelX.GDS.Set_Location_5((int)(10) + MoveX, MoveY + (int)(15), SizeX = 80, SizeY = 15, CORNER);
                              RectLabelX.GDS.Set_Chart_6();
                              RectLabelX.GDS.Set_Common_6(false, 10, false, false, false, RLDEF_tooltip + "TrailingBox1");
                              RectLabelX.Action(RectLabelX);//
                    }//===================================================================================================================================================================
                    //LBL_MinProfitXvalue.Create(Is_Create, Is_Move, "LBL_MinProfitXvalue", "MinProfit", (int)(35) + MoveX, MoveY + (int)(22), CORNER, ANCHOR_CENTER, false, clrBlack, 0, 7, "Trebuchet MS");
                    {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                              LabelX.GDS.Set_Desc_4("MinProfitXvalue", "MinProfit", "Trebuchet MS", 7);
                              LabelX.GDS.Set_Color_1(clrBlack);
                              LabelX.GDS.Set_Location_5( (int)(35) + MoveX, MoveY + (int)(22), 0, CORNER, ANCHOR_CENTER);
                              LabelX.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "LBL_MinProfitXvalue");
                              LabelX.GDS.Set_Chart_6();
                              LabelX.Action(LabelX);//
                    }//===================================================================================================================================================================
                    //EDT_MinProfit.Create(Is_Create, Is_Move, "EDT_MinProfit", DoubleToString(ct_Drive.TDD.ct_Ticket._Modifier.MinProfitInp, 0), (int)(24) + MoveX, MoveY + (int)(1), PANEL_EDIT_WIDTH, PANEL_EDIT_HEIGHT,    CORNER, ANCHOR_CENTER, false, clrWhite, clrBlack,  C'59,41,40', STYLE_SOLID, 1, 0, ALIGN_CENTER, 7, "Tahoma");
                    {         EditX.GDS.Set_Action_2(WhichMode, IsKey);
                              EditX.GDS.Set_Desc_4("MinProfit", DoubleToString(ct_Drive.TDD.ct_Ticket._Modifier.MinProfitInp, 0), "Tahoma", 7);
                              EditX.GDS.Set_Self_2(alignDEF, readonlyDEF);
                              EditX.GDS.Set_Location_5((int)(24) + MoveX, MoveY + (int)(1), PANEL_EDIT_WIDTH, PANEL_EDIT_HEIGHT, CORNER);
                              EditX.GDS.Set_Color_3(clrWhite, clrBlack, C'59,41,40');
                              EditX.GDS.Set_Common_6(false, 60, false, false, false, EditDEF_tooltip + "MinProfit");
                              EditX.GDS.Set_Chart_6();
                              EditX.Action(EditX);//
                    }//================================================================================================================================================
                    //LBL_MinProfitUP.Create(Is_Create, Is_Move, "LBL_MinProfitUP", "5", (int)(85) + MoveX, MoveY + (int)(8), CORNER, ANCHOR_CENTER, false, std_Global.COLOR_SELL, 0, 12, "Webdings");
                    {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                              LabelX.GDS.Set_Desc_4("MinProfitUP", "5", "Webdings", 12);
                              LabelX.GDS.Set_Color_1(std_Global.COLOR_SELL);
                              LabelX.GDS.Set_Location_5( (int)(85) + MoveX, MoveY + (int)(8), 0, CORNER, ANCHOR_CENTER);
                              LabelX.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "LBL_MinProfitUP");
                              LabelX.GDS.Set_Chart_6();
                              LabelX.Action(LabelX);//
                    }//===================================================================================================================================================================
                    //LBL_MinProfitDN.Create(Is_Create, Is_Move, "LBL_MinProfitDN", "6", (int)(18) + MoveX, MoveY + (int)(8), CORNER, ANCHOR_CENTER, false, std_Global.COLOR_BUY, 0, 12, "Webdings");
                    {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                              LabelX.GDS.Set_Desc_4("MinProfitDN", "6", "Webdings", 12);
                              LabelX.GDS.Set_Color_1(std_Global.COLOR_BUY);
                              LabelX.GDS.Set_Location_5((int)(18) + MoveX, MoveY + (int)(8), 0, CORNER, ANCHOR_CENTER);
                              LabelX.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "MinProfitDN");
                              LabelX.GDS.Set_Chart_6();
                              LabelX.Action(LabelX);//
                    }//===================================================================================================================================================================
                    ///
                    //RLBL_TrailingTwo.Create(Is_Create, Is_Move, "RLBL_TrailingBox2", "", (int)(10) + MoveX, MoveY + (int)(30), SizeX = 80, SizeY = 15, CORNER, ANCHOR_CENTER, false, BORDER_FLAT, clrLightSalmon, clrLightSalmon,  0, STYLE_SOLID, 1, 5, "Arial" );
                    {         RectLabelX.GDS.Set_Action_2(WhichMode, IsKey);
                              RectLabelX.GDS.Set_Desc_1("TrailingBox2");
                              RectLabelX.GDS.Set_Tip_3(STYLE_SOLID, 1, BORDER_FLAT);
                              RectLabelX.GDS.Set_Color_2(clrLightSalmon, clrLightSalmon);
                              RectLabelX.GDS.Set_Location_5((int)(10) + MoveX, MoveY + (int)(30), SizeX = 80, SizeY = 15, CORNER);
                              RectLabelX.GDS.Set_Chart_6();
                              RectLabelX.GDS.Set_Common_6(false, 10, false, false, false, RLDEF_tooltip + "TrailingBox2");
                              RectLabelX.Action(RectLabelX);//
                    }//===================================================================================================================================================================
                    //LBL_TrailingStopXvalue.Create(Is_Create, Is_Move, "LBL_TrailingStopXvalue", "TrailingStop", (int)(37) + MoveX, MoveY + (int)(37), CORNER, ANCHOR_CENTER, false, clrBlack, 0, 7, "Trebuchet MS");
                    {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                              LabelX.GDS.Set_Desc_4("TrailingStopXvalue", "TrailingStop", "Trebuchet MS", 7);
                              LabelX.GDS.Set_Color_1(clrBlack);
                              LabelX.GDS.Set_Location_5((int)(37) + MoveX, MoveY + (int)(37), 0, CORNER, ANCHOR_CENTER);
                              LabelX.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "TrailingStopXvalue");
                              LabelX.GDS.Set_Chart_6();
                              LabelX.Action(LabelX);//
                    }//===================================================================================================================================================================
                    //EDT_Trailing.Create(Is_Create, Is_Move, "EDT_Trailing", DoubleToString(ct_Drive.TDD.ct_Ticket._Modifier.TrailStopInp, 0),   (int)(24) + MoveX, MoveY + (int)(46), PANEL_EDIT_WIDTH, PANEL_EDIT_HEIGHT,   CORNER, ANCHOR_CENTER, false, clrWhite, clrBlack,  C'59,41,40', STYLE_SOLID, 1, 0, ALIGN_CENTER, 7, "Tahoma");
                    {         EditX.GDS.Set_Action_2(WhichMode, IsKey);
                              EditX.GDS.Set_Desc_4("Trailing", DoubleToString(ct_Drive.TDD.ct_Ticket._Modifier.TrailStopInp, 0), "Tahoma", 7);
                              EditX.GDS.Set_Self_2(alignDEF, readonlyDEF);
                              EditX.GDS.Set_Location_5((int)(24) + MoveX, MoveY + (int)(46), PANEL_EDIT_WIDTH, PANEL_EDIT_HEIGHT, CORNER);
                              EditX.GDS.Set_Color_3(clrWhite, clrBlack, C'59,41,40');
                              EditX.GDS.Set_Common_6(false, 60, false, false, false, EditDEF_tooltip + "Trailing");
                              EditX.GDS.Set_Chart_6();
                              EditX.Action(EditX);//
                    }//================================================================================================================================================
                    //LBL_TrailingUP.Create(Is_Create, Is_Move, "LBL_TrailingUP", "5", (int)(85) + MoveX, MoveY + (int)(52), CORNER, ANCHOR_CENTER, false, std_Global.COLOR_SELL, 0, 12, "Webdings");
                    {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                              LabelX.GDS.Set_Desc_4("TrailingUP", "5", "Webdings", 12);
                              LabelX.GDS.Set_Color_1(std_Global.COLOR_SELL);
                              LabelX.GDS.Set_Location_5((int)(85) + MoveX, MoveY + (int)(52), 0, CORNER, ANCHOR_CENTER);
                              LabelX.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "TrailingUP");
                              LabelX.GDS.Set_Chart_6();
                              LabelX.Action(LabelX);//
                    }//===================================================================================================================================================================
                    //LBL_TrailingDN.Create(Is_Create, Is_Move, "LBL_TrailingDN", "6", (int)(18) + MoveX, MoveY + (int)(52), CORNER, ANCHOR_CENTER, false, std_Global.COLOR_BUY, 0, 12, "Webdings"); //
                    {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                              LabelX.GDS.Set_Desc_4("TrailingDN", "6", "Webdings", 12);
                              LabelX.GDS.Set_Color_1(std_Global.COLOR_BUY);
                              LabelX.GDS.Set_Location_5((int)(18) + MoveX, MoveY + (int)(52), 0, CORNER, ANCHOR_CENTER);
                              LabelX.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "TrailingDN");
                              LabelX.GDS.Set_Chart_6();
                              LabelX.Action(LabelX);//
                    }//===================================================================================================================================================================
          }
          {         //
          }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_COMPLEXTOOLS Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Cp_SubController::_Show(int WhichMode, bool IsKey, color clrBody = clrWhite, color clrBodyMargine = clrNavy, color clrBodyText = clrNavy, color clrBodyCyrcle = clrRed)
{         int MoveX     = 10; int MoveY = 0;
          int stepa     = 20;
          int SizeX     = 10;
          int movestep  = SizeX + (int)(SizeX * 1.6) + (SizeX * 7);
          int FontSize  = -3;//
          int Angel     = 0;//
//movestep += movestep * stepa * 1
          if(0)
          {         Complex.Menu_ButtonX(WhichMode, IsKey, "C" + "1",            movestep * 1, 0, SizeX, 0,  FontSize); //x
                    Complex.Menu_ButtonX(WhichMode, IsKey, "C" + "2",            movestep * 2, 0, SizeX, 0,  FontSize);
                    Complex.Menu_ButtonX(WhichMode, IsKey, "C" + "3",            movestep * 3, 0, SizeX, 0,  FontSize);
                    Complex.Menu_ButtonX(WhichMode, IsKey, "C" + "4",            movestep * 4, 0, SizeX, 0, FontSize);
                    Complex.Menu_ButtonX(WhichMode, IsKey, "C" + "5",            movestep * 5, 0, SizeX, 0,  FontSize); }
          if(1)
          {         Complex.LongPanel(WhichMode, IsKey, clrNONE, "ControllerInfoCeil",  30 + 90 + MoveX, MoveY + 180 - 2 - 25 + 9,  clrSlateGray, Angel, 3); //
                    Complex.LongPanel(WhichMode, IsKey, clrNONE, "ControllerInfoFloor", 30 + 90 + MoveX, MoveY + 180 - 2 + 80 - 5,   clrSlateGray, Angel, 3);
                    Complex.Menu_ButtonX(WhichMode, IsKey, "ConditionWatch",     movestep + MoveX, MoveY + stepa * 0 + 0, SizeX * 3, 0,  FontSize);
                    Complex.Menu_ButtonX(WhichMode, IsKey, "Ticket Manage",      movestep + MoveX, MoveY + stepa * 1 + 2, SizeX * 3, 0, FontSize);
                    Complex.Menu_ButtonX(WhichMode, IsKey, "Ticket Put",         movestep + MoveX, MoveY + stepa * 2 + 2, SizeX * 3, 0,  FontSize);
                    Complex.Menu_ButtonX(WhichMode, IsKey, "Ticket Modify",      movestep + MoveX, MoveY + stepa * 3 + 2, SizeX * 3, 0, FontSize);
                    Complex.Menu_ButtonX(WhichMode, IsKey, "Ticket End",         movestep + MoveX, MoveY + stepa * 4 + 2, SizeX * 3, 0,  FontSize);  //
          } //
}//
//+------------------------------------------------------------------+
//||   ||||||||||                 Cp_SubEMA.mqh                     ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
