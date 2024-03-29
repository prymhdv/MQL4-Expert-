//+------------------------------------------------------------------+
//||   ||||||||||                 eTradePanel.mqh                   ||Ctp_Drive_Pad_Inputs
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(ControlersCall)\MCV_Data_Model.mqh>
//---#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOTC\.CoverOTC.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Views)\CoverOGCP\.CoverOGCP.mqh>
//---- Model (Dynamic Obj)(memory obj):                                                      (Server)(Server-Client)
//---- The central component of the pattern.
//---- It is the application's dynamic data structure, independent of the user interface.
//---- It directly manages the data, logic and rules of the application.
//----
//---- View (RePresentation):
//---- Any representation of information such as a chart, diagram or table.
//---- Multiple views of the same information are possible, such as a bar chart for management and a tabular view for accountants.
//----
//---- Controller (GetCommand of model or GetCommand of view)
//---- Accepts input and converts it to commands for the model or view.
//----
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class Ctp_Drive_Pad_Inputs
{
public:
          void Ctp_Drive_Pad_Inputs();
          bool Manager();
          bool MANAGED;
          bool Update(int Sl_Fixed_Pip);
          bool Is_Update;
          //========================================================== //default is Privet


};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Ctp_Drive_Pad_Inputs::Ctp_Drive_Pad_Inputs()
{         TRADER_Panel_DATA.Is_AutoTradeDirect              = false;//
//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Ctp_Drive_Pad_Inputs::Update(int Sl_Fixed_Pip)
{         Is_Update = false;
          //-------------------------------
          Manager();                //---#1 on logic Trader Update  {ct_Drive.Update();}
          Size_Pad.Update();
          //-------------------------------
          /**/Modify_Pad.Update();
          /*   */End_Pad.Update();          ///----Trade GUI Elements Commands
          /* */Start_Pad.Update();          ///----Trade GUI Elements Commands
          /*  */bank_Pad.Update();          ///-------------------------------------------
          //-------------------------------
          if(!Modify_Pad.UPDATED)             {Alert(__FUNCTION__ + "  Modify_Pad.UPDATED: ",  Modify_Pad.UPDATED);}
          if(!End_Pad.UPDATED)                {Alert(__FUNCTION__ + "  End_Pad.UPDATED: ",     End_Pad.UPDATED);}
          if(!Start_Pad.UPDATED)              {Alert(__FUNCTION__ + "  Start_Pad.UPDATED: ",   Start_Pad.UPDATED);}
          if(!Size_Pad.UPDATED)               {Alert(__FUNCTION__ + "  Size_Pad.UPDATED: ",    Size_Pad.UPDATED);}
          return Is_Update = true; //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |// Event_RightMenu.CheckButomStatus();
//+------------------------------------------------------------------+
bool Ctp_Drive_Pad_Inputs::Manager()
{         MANAGED = false;
          if(TRADER_Panel_DATA.Is_AutoTradeDirect) //---parent obj must called not self obj
          {         //-----------
                    if(TRADER_Panel_DATA.IsConditionWatch)return MANAGED = true; ; //--- return upper fuction bypassing..   if your want satisfied then return...
                    RightMenu.SubController.IsPadPress_ConditionWatch   = TRADER_Panel_DATA.IsConditionWatch              = true;
                    RightMenu.SubController.IsPadPress_TicketManage     = TRADER_Panel_DATA.IsTicketManage                = true;
                    RightMenu.SubController.IsPadPress_TicketPut        = TRADER_Panel_DATA.IsAuto_OrdersPut              = true;
                    RightMenu.SubController.IsPadPress_TicketModify     = TRADER_Panel_DATA.IsAuto_OrdersModifications    = true;
                    RightMenu.SubController.IsPadPress_TicketEnd        = TRADER_Panel_DATA.IsAuto_EndAll                 = false;
                    TRADER_Panel_DATA.Is_AutoTradeDirectOnline          = TRADER_Panel_DATA.Is_AutoTradeDirect;
                    //Cat.s("/////---RightMenu.SubController.IsPadPress_ConditionWatch--]]]]]:" + (string)RightMenu.SubController.IsPadPress_ConditionWatch); //
                    Event_RightMenu.CheckButomStatus(); //
          }
          else if(TRADER_Panel_DATA.Is_AutoTradeDirectOnline)
          {         if(!TRADER_Panel_DATA.IsConditionWatch)return MANAGED = true; ;
                    RightMenu.SubController.IsPadPress_ConditionWatch   = TRADER_Panel_DATA.IsConditionWatch              = false;
                    RightMenu.SubController.IsPadPress_TicketManage     = TRADER_Panel_DATA.IsTicketManage                = false;
                    RightMenu.SubController.IsPadPress_TicketPut        = TRADER_Panel_DATA.IsAuto_OrdersPut              = false;
                    RightMenu.SubController.IsPadPress_TicketModify     = TRADER_Panel_DATA.IsAuto_OrdersModifications    = false;
                    RightMenu.SubController.IsPadPress_TicketEnd        = TRADER_Panel_DATA.IsAuto_EndAll                 = false;//
                    TRADER_Panel_DATA.Is_AutoTradeDirectOnline          = false; //
                    //Cat.s("/////---RightMenu.SubController.IsPadPress_ConditionWatch--]]]]]:" + (string)RightMenu.SubController.IsPadPress_ConditionWatch); //
                    Event_RightMenu.CheckButomStatus();//
          }
          //---
          return MANAGED = true; //
}
//+------------------------------------------------------------------+
