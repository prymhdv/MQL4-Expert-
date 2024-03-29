//+------------------------------------------------------------------+
//||   ||||||||||                 eRightMenu.mqh                    ||
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
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class Ce_RightMenu: public Sg_OnChartEvent_base
{
public:   //---
          Sg_OnChartEvent       EventsData;     ////---Events.Main(this); Event_TradePanel.Main(Event_TradePanel); //---who work with Objparam methods..
          //---
          void                  OnChartEvents();//Sg_OnChartEvent &event //--Used solo Data
          void                  Event_OBJECT_CLICK();    //{};
          void                  Event_KeyDown()         {return;};;
          void                  Event_MOUSE_MOVE();      // {return;};
          //--Events
          //  void                  OBJECT_CLICK(string FuncCom, const string & sparam);
          //  void                  MOUSE_MOVE(string FuncCom, const int id, const long & lparam, const double & dparam, const string & sparam, int LineCOM = 0, string FuncCome = "None");

          //---
          //--- Owner events
          void                  Event_RightMenu_OBJECT_CLICK();
          bool                  ON_MasterPanel(int WhichMode, bool IsKey, int MoveX, int MoveY, int SizeX, int SizeY, int FontSize);// FIs_Create,  is__Move, MoveX, MoveY, SizeX, SizeY, FontSize = -3)
          void                  CheckButomStatus();
          //---

}; //Ce_RightMenu RightMenu_Event;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Ce_RightMenu::ON_MasterPanel(int WhichMode, bool IsKey, int MoveX, int MoveY, int SizeX, int SizeY, int FontSize)// FIs_Create,  is__Move, MoveX, MoveY, SizeX, SizeY, FontSize = -3)
{         /*Alert("======================================");*/
          return false;
          return false;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void  Ce_RightMenu::CheckButomStatus()
{         RightMenu.SubEMA.IsActiveEMASubElements(); //---ok its workafter 6 month
          RightMenu.SubController.IsActiveControllerSubElements(); //---ok its workafter 6 month
          RightMenu.SubController.SubController_KeysStatus();
          RightMenu.SubStatus.SubStatus_KeysStatus();//
}//
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Ce_RightMenu::Event_OBJECT_CLICK()
{         //-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
          Event_RightMenu_OBJECT_CLICK(); //----menu owner
          if(1)//--sub menu Events
          {         RightMenu.SubStatus._OBJECT_CLICK();
                    RightMenu.SubStatus.PadMini.MasterPanel._OBJECT_CLICK(this);
                    RightMenu.SubStatus.TopMiddle._OBJECT_CLICK();
                    RightMenu.SubEMA.SubEMA_OBJECT_CLICK();
                    RightMenu.SubController.SubController_OBJECT_CLICK(); //
          }
//---
//---
//---
          CheckButomStatus();
//---
//---
//---
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
////==================================================================================================================================================
//RightMenu.SubEMA.IsAnyPressed = RightMenu.SubEMA.Key.IsPadPress_20Band || RightMenu.SubEMA.Key.IsPadPress_5Micro || RightMenu.SubEMA.Key.IsPadPress_20EMA ||  RightMenu.SubEMA.Key.IsPadPress_30EMA || RightMenu.SubEMA.Key.IsPadPress_200EMA ||  RightMenu.SubEMA.Key.IsPadPress_500EMA;
////Alert("RightMenu.SubEMA.IsAnyPressed: ", RightMenu.SubEMA.IsAnyPressed);
//if (RightMenu.SubEMA.IsAnyPressed)///---at the end of knowing...
//{         Complex.Menu_Button(MODE_MODIFY, RightMenu.IsPadPress_EMA, "EMA", RightMenuPad_Color.CclrBody, RightMenuPad_Color.CclrBodyMargine, clrWhite, RightMenuPad_Color.CclrBodyCyrcleActive);}//
//else {         Complex.Menu_Button(MODE_MODIFY, RightMenu.IsPadPress_EMA, "EMA", RightMenuPad_Color.CclrBody, RightMenuPad_Color.CclrBodyMargine, clrWhite, RightMenuPad_Color.CclrBodyCyrclePress);}//
////=====================================
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Ce_RightMenu::Event_RightMenu_OBJECT_CLICK()
{         //--------------------------------
//--------------------------------
          string Clicked = Event.sparam; bool TPX = false; string TPX_DESC = "null";
//===============================================================================================================================================================================
          if(Clicked == "Logo-AutoTradeDirect")
          {         TRADER_Panel_DATA.Is_AutoTradeDirect = TRADER_Panel_DATA.Is_AutoTradeDirect ? false : true; //
                    if(TRADER_Panel_DATA.Is_AutoTradeDirect) {  ObjectSetInteger(0, "Logo-AutoTradeDirect", OBJPROP_COLOR, clrNavy);} //
                    else                                     {  ObjectSetInteger(0, "Logo-AutoTradeDirect", OBJPROP_COLOR, clrWhite);} //
                    //return;
                    ///
          }
          if(Clicked == "Logo-Auto-Wave")
          {         //
                    ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Pad_Is_Waves = ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Pad_Is_Waves ? false : true; //
                    //
                    if(ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Pad_Is_Waves)  {  ObjectSetInteger(0, "Logo-Auto-Wave", OBJPROP_COLOR, clrNavy);} //
                    else                                                             {  ObjectSetInteger(0, "Logo-Auto-Wave", OBJPROP_COLOR, clrRed);} //
                    //---
                    ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Pad_Is_Waves ? ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Draw_ChannelsZigZag_Current_Key(MODE_CREATE, false) :  ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Draw_ChannelsZigZag_Current_Key(MODE_CREATE, true);
                    //---off--- ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Pad_Is_Waves ?  ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Key_Update_Waves = update  :  ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Key_Update_Waves = exit ;
                    //
          }
          if(Clicked == "Logo-Auto-All")
          {         //
                    ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Pad_Is_All =  ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Pad_Is_All ? false : true; //--- ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Pad_Is_All = !ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Pad_Is_All
                    //
                    if(ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Pad_Is_All)       {  ObjectSetInteger(0, "Logo-Auto-All", OBJPROP_COLOR, clrNavy);} //
                    else                                                                {  ObjectSetInteger(0, "Logo-Auto-All", OBJPROP_COLOR, clrRed);} //
                    //
                    ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Pad_Is_All ? ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.__Call__ChartAnalise(E_Exit) :  ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.__Call__ChartAnalise(E_Create);
                    //---off--- ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Pad_Is_All ? ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Key_Update_All = E_Update  :  ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Key_Update_All = E_Exit ;
                    //
          }
          if(Event.sparam == "Logo-Active_Status")
          {         //IsBasic_Active_Status = IsBasic_Active_Status ? false : true; //switching
                    RightMenu.IsBasic_Active_Status = !RightMenu.IsBasic_Active_Status;
                    if(RightMenu.IsBasic_Active_Status )        {RightMenu.Desc_Status(true, false);  }
                    else                                        {RightMenu.Desc_Status(false, false);  };
                    //
                    //---Alert("---IsBasic_Active_Status---: ",IsBasic_Active_Status);//
          }
          if(Event.sparam == "Logo-Active_ReportSignal")
          {         RightMenu.IsBasic_Showed_Active_PeportSignal = !RightMenu.IsBasic_Showed_Active_PeportSignal;
                    RightMenu.IsBasic_Showed_Active_PeportSignal ? RightMenu.SHOW_Report_Signal(MODE_CREATE, true, 0, 0, 210) : RightMenu.SHOW_Report_Signal(MODE_CREATE, false, 0, 0, 0);;
                    //
          }
//===============================================================================================================================================================================
          {         bool Is_Sparam = false;  int Typer = 0;//
                    if(Clicked == "LBL_MenuPadsMainText-Main"       || Clicked == "RBL_MenuPadsBox2-Main"       || Clicked == "LBL_MenuPadsRight2-Main"         || Clicked == "RLBL_Menu_ButtonBG2-Main" || Clicked == OBJPREFIX + "RLBLBorderExpert") {Is_Sparam = true; Typer = 99;}
                    if(Clicked == "LBL_MenuPadsMainText-Side"       || Clicked == "RBL_MenuPadsBox2-Side"       || Clicked == "LBL_MenuPadsRight2-Side"         || Clicked == "RLBL_Menu_ButtonBG2-Side")               {Is_Sparam = true; Typer = 00;}
                    if(Clicked == "LBL_MenuPadsMainText-Status"     || Clicked == "RBL_MenuPadsBox2-Status"     || Clicked == "LBL_MenuPadsRight2-Status"       || Clicked == "RLBL_Menu_ButtonBG2-Status")             {Is_Sparam = true; Typer = 01;}
                    if(Clicked == "LBL_MenuPadsMainText-EMA"        || Clicked == "RBL_MenuPadsBox2-EMA"        || Clicked == "LBL_MenuPadsRight2-EMA"          || Clicked == "RLBL_Menu_ButtonBG2-EMA")                {Is_Sparam = true; Typer = 02;} //LBL_MenuPadsMainText-Close Buys
                    if(Clicked == "LBL_MenuPadsMainText-Controller" || Clicked == "RBL_MenuPadsBox2-Controller" || Clicked == "LBL_MenuPadsRight2-Controller"   || Clicked == "RLBL_Menu_ButtonBG2-Controller")         {Is_Sparam = true; Typer = 10;}
                    if(Clicked == "LBL_MenuPadsMainText-Calculator" || Clicked == "RBL_MenuPadsBox2-Calculator" || Clicked == "LBL_MenuPadsRight2-Calculator"   || Clicked == "RLBL_Menu_ButtonBG2-Calculator")         {Is_Sparam = true; Typer = 11;}
                    //===============================================================================================================================================================================
                    if("Logo-Active_Peport" == Clicked)         { static bool IsSwitch = true;  RightMenu.Is_Show_Report = IsSwitch = IsSwitch ? false : true;;   RightMenu._Show_Report(MODE_CREATE, IsSwitch, 0, 10);   }
                    if("Logo-Active_Harmonic" == Clicked)       { static bool IsSwitch = false;  IsSwitch = IsSwitch ? false : true;;                              RightMenu._Show_ReportPatern(MODE_CREATE, IsSwitch, 0, 10); }
                    if("Logo-Active_ChannelZigzag" == Clicked)  { static bool IsSwitch = false;  IsSwitch = IsSwitch ? false : true;;                              RightMenu._Show_ReportFrameChannelZigzag(MODE_CREATE, IsSwitch, 0, 10); }
                    if("Logo-Active_MACDs" == Clicked)          { static bool IsSwitch = false;  IsSwitch = IsSwitch ? false : true;;                              RightMenu._Show_ReportFrameMACDs(MODE_CREATE, IsSwitch, 0, 10); }
                    if("Logo-Active_MapSence" == Clicked)
                    {         static bool IsSwitch = false;                             IsSwitch = IsSwitch ? false : true;   ct_Drive.TDD.ct_Signals.Extern_Signals.MTSA.IsPad_Offer = IsSwitch;
                              IsSwitch ? ObjectSetString(0, "Logo-Active_MapSence", OBJPROP_TEXT, "Ð") : ObjectSetString(0, "Logo-Active_MapSence", OBJPROP_TEXT, "Ï");//
                    }
                    //===============================================================================================================================================================================
                    if(Is_Sparam)
                    {         //===============================================================================================================================================================================
                              switch(Typer)
                              {         case 99: {TPX = RightMenu.IsPadPress_Main;        TPX_DESC = "Main";} break; //
                                        //   case 00: {TPX = RightMenu.IsPadPress_Side;        TPX_DESC = "Side";} break; //
                                        case 01: {TPX = RightMenu.IsPadPress_Status;      TPX_DESC = "Status";} break; //
                                        case 02: {TPX = RightMenu.IsPadPress_EMA;         TPX_DESC = "EMA";} break; //
                                        case 10: {TPX = RightMenu.IsPadPress_Controller;  TPX_DESC = "Controller";} break; //
                                        case 11: {TPX = RightMenu.IsPadPress_Calculator;  TPX_DESC = "Calculator";} break; //
                              };//
                              //===============================================================================================================================================================================
                              {         //--DEFUSING OTHER MENUE PADS..
                                        TPX = TPX ? false : true;//Alert(__FUNCSIG__, TPX); //
                                        Complex.Menu_Button(MODE_MODIFY, TPX, TPX_DESC, RightMenuPad_Color.CclrBody, RightMenuPad_Color.CclrBodyMargine, clrWhite, RightMenuPad_Color.CclrBodyCyrclePress);
                                        //======================================================================================================================
                                        if(TPX_DESC == "Main") {         TradePanel.GetTradePanel(MODE_CREATE, TPX);} //
                                        //
                                        if(TPX_DESC == "Side")
                                        {         RightMenu.SubSide_MarketKeys_Loger._Call(MODE_CREATE, TPX, +130, +30, 260, 160, 100);
                                                  {         RightMenu.SubStatus._Call(MODE_CREATE, false);
                                                            //RightMenu.SubSide_MarketKeys_Loger._Call(MODE_CREATE, false);
                                                            RightMenu.SubEMA._Call(MODE_CREATE, false);
                                                            RightMenu.SubController._Call(MODE_CREATE, false);//
                                                            bank_Pad.MM_Panel_Call(MODE_CREATE, false); //
                                                  } //
                                        }
                                        //
                                        if(TPX_DESC == "Status")
                                        {         RightMenu.SubStatus._Call(MODE_CREATE, TPX, RightMenuPad_Color.CclrBody, RightMenuPad_Color.CclrBodyMargine, RightMenuPad_Color.CclrBodyText, RightMenuPad_Color.CclrBodyCyrcleUnPress);
                                                  {         //RightMenu.SubStatus._Call(MODE_CREATE, false);
                                                            RightMenu.SubSide_MarketKeys_Loger._Call(MODE_CREATE, false);
                                                            RightMenu.SubEMA._Call(MODE_CREATE, false);
                                                            RightMenu.SubController._Call(MODE_CREATE, false);//
                                                            bank_Pad.MM_Panel_Call(MODE_CREATE, false); //
                                                  }
                                                  //
                                        } //
                                        //
                                        if(TPX_DESC == "EMA")
                                        {         RightMenu.SubEMA._Call(MODE_CREATE, TPX, RightMenuPad_Color.CclrBody, RightMenuPad_Color.CclrBodyMargine, RightMenuPad_Color.CclrBodyText, RightMenuPad_Color.CclrBodyCyrcleUnPress);
                                                  {         RightMenu.SubStatus._Call(MODE_CREATE, false);
                                                            RightMenu.SubSide_MarketKeys_Loger._Call(MODE_CREATE, false);
                                                            //RightMenu.SubEMA._Call(MODE_CREATE, false);
                                                            RightMenu.SubController._Call(MODE_CREATE, false);
                                                            bank_Pad.MM_Panel_Call(MODE_CREATE, false); //
                                                            //
                                                  } //
                                                  //
                                        } //clrBodyCyrcleUnPress
                                        //
                                        if(TPX_DESC == "Controller")
                                        {         RightMenu.SubController._Call(MODE_CREATE, TPX,  RightMenuPad_Color.CclrBody, RightMenuPad_Color.CclrBodyMargine, RightMenuPad_Color.CclrBodyText, RightMenuPad_Color.CclrBodyCyrcleUnPress);
                                                  {         RightMenu.SubStatus._Call(MODE_CREATE, false);
                                                            RightMenu.SubSide_MarketKeys_Loger._Call(MODE_CREATE, false);
                                                            RightMenu.SubEMA._Call(MODE_CREATE, false);
                                                            //RightMenu.SubController._Call(MODE_CREATE, false);
                                                            bank_Pad.MM_Panel_Call(MODE_CREATE, false); //
                                                            //
                                                  } //
                                                  //
                                        } //
                                        ///
                                        if(TPX && TPX_DESC == "Calculator")             { ExtDialog.OnInitX(false);} /////need to adjusting/////
                                        else if(!TPX && TPX_DESC == "Calculator")       { ExtDialog.OnInitX(false);} /////need to adjusting/////
                                        //
                              }         //
                              //===============================================================================================================================================================================
                              switch(Typer)
                              {         case 99: { RightMenu.IsPadPress_Main              = TPX;} break; //
                                        case 00: { RightMenu.IsPadPress_Side              = TPX;} break; //
                                        case 01: { RightMenu.IsPadPress_Status            = TPX;} break; //
                                        case 02: { RightMenu.IsPadPress_EMA               = TPX;} break; //
                                        case 10: { RightMenu.IsPadPress_Controller        = TPX;} break; //
                                        case 11: { RightMenu.IsPadPress_Calculator        = TPX;} break; //
                              };//
                              //===============================================================================================================================================================================
                    } //
          }
//===============================================================================================================================================================================
//Alert("Return of menu is: ", TPX_DESC ); //
}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Ce_RightMenu::Event_MOUSE_MOVE()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-ChartController Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          if(KeyCHARTEVENT_MOUSE_MOVE) //---
          {         //---
                    //---
                    //---
                    if(RightMenu.SubStatus.TopMiddle.IsMoving) {RightMenu.SubStatus.TopMiddle._Call(MODE_MOVE, true, (int)(Event.lparam - 250), (int)(Event.dparam - 15));} ///
                    //---
                    //---
                    //---
                    //SubStatus_PadMini(-2, false, false, false, (int)(Event.lparam - 30), (int)(Event.dparam - 0)); //
                    // Alert("KeyCHARTEVENT_MOUSE_MOVE:", KeyCHARTEVENT_MOUSE_MOVE, "---Event.lparam", Event.lparam);
                    GoldVIP.Event_MOUSE_MOVE();
                    //---
                    //---
                    //---
                    Manage_KeysActions_Data<Cp_StatusSubPadMini>  KeysActions_Data;
                    //---
                    //---
                    //---
                    KeysActions_Data.ObjGetClassMember  = RightMenu.SubStatus.PadMini;///----------typename(RightMenu.SubStatus.PadMini);
                    KeysActions_Data.NameCom            = RightMenu.SubStatus.PadMini.MasterPanel.Data.CObj_Name;
                    //---
                    KeysActions_Data.Type               = -2;
                    KeysActions_Data.IsKey              = false;            // = false;
                    KeysActions_Data.Is_CreateMini      = false;        // = false;
                    KeysActions_Data.Is_Move            = false;      // = false;
                    KeysActions_Data.MoveX              = (int)(Event.lparam - 30);                // = 0;
                    KeysActions_Data.MoveY              = (int)(Event.dparam - 0);                // = 0;
                    KeysActions_Data.SizeX              = 0;                    // = 0;
                    KeysActions_Data.SizeY              = 0;                    // = 0;
                    KeysActions_Data.FontSize           = 0;                   // = 0;//8
                    KeysActions_Data.clrBody            = clrWhite;             // = clrWhite;
                    KeysActions_Data.clrBodyMargine     = clrFireBrick;         // = clrFireBrick;
                    KeysActions_Data.clrBodyText        = clrFireBrick;         // = clrFireBrick;
                    KeysActions_Data.clrBodyCyrcle      = clrRed;               // = clrRed;
                    KeysActions_Data.Is_PanelActive     = false;                // = false;
                    KeysActions_Data.Is_Vertical        = false;                // = false; //
                    //------------------------------------------------------------------
                    //---
                    RightMenu.SubStatus.PadMini.MasterPanel.Manage_KeysActions(KeysActions_Data); //---off for correction
                    //
          } //
}//
//+------------------------------------------------------------------+
//||   ||||||||||                 eRightMenu.mqh                    ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
