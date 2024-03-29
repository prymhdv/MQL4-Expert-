//+------------------------------------------------------------------+
//||   ||||||||||                 Ce_eBank.mqh                      ||
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
class Ce_eBank: public Sg_OnChartEvent_base
{
public:   Ce_eBank()            {/*Alert("Ce_eBank::Ce_eBank");*/}
          Sg_OnChartEvent       EventsData;     ////---Events.Main(this); Event_TradePanel.Main(Event_TradePanel); //---who work with Objparam methods..

          void                  OnChartEvents();//Sg_OnChartEvent &event //--Used solo Data
          void                  Event_OBJECT_CLICK();    //{};
          void                  Event_KeyDown()         {return;};
          void                  Event_MOUSE_MOVE()      {return;};
          //--Events
          //  void                  OBJECT_CLICK(string FuncCom, const string & sparam);
          //  void                  MOUSE_MOVE(string FuncCom, const int id, const long & lparam, const double & dparam, const string & sparam, int LineCOM = 0, string FuncCome = "None");
}; //Ce_eBank Bank_Event;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Ce_eBank::Event_OBJECT_CLICK()
{         string Clicked = Event.sparam;
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//Set_ Risk%.
          //switch color and key state
          if(Clicked == OBJPREFIX + "Set PP..OkLabel")           {!ct_Drive.TDD.ct_Bank.BANK_Pad_DATA.Set_PP_Ok           ? Utilities.Set_Color("Set PP..OkLabel",           clrAqua)        &&  UTILITIES_Switch.Bool(ct_Drive.TDD.ct_Bank.BANK_Pad_DATA.Set_PP_Ok)           : UTILITIES_Switch.Bool(ct_Drive.TDD.ct_Bank.BANK_Pad_DATA.Set_PP_Ok)           && Utilities.Set_Color("Set PP..OkLabel",      clrWhite); return;};
          if(Clicked == OBJPREFIX + "Set TP..OkLabel")           {!ct_Drive.TDD.ct_Bank.BANK_Pad_DATA.Set_TP_Ok           ? Utilities.Set_Color("Set TP..OkLabel",           clrDarkBlue)    &&  UTILITIES_Switch.Bool(ct_Drive.TDD.ct_Bank.BANK_Pad_DATA.Set_TP_Ok)           : UTILITIES_Switch.Bool(ct_Drive.TDD.ct_Bank.BANK_Pad_DATA.Set_TP_Ok)           && Utilities.Set_Color("Set TP..OkLabel",      clrWhite); return;};
          if(Clicked == OBJPREFIX + "Set SL..OkLabel")           {!ct_Drive.TDD.ct_Bank.BANK_Pad_DATA.Set_SL_Ok           ? Utilities.Set_Color("Set SL..OkLabel",           clrDarkBlue)    &&  UTILITIES_Switch.Bool(ct_Drive.TDD.ct_Bank.BANK_Pad_DATA.Set_SL_Ok)           : UTILITIES_Switch.Bool(ct_Drive.TDD.ct_Bank.BANK_Pad_DATA.Set_SL_Ok)           && Utilities.Set_Color("Set SL..OkLabel",      clrWhite); return;};
          //
          if(Clicked == OBJPREFIX + "Set TS..OkLabel")           {!ct_Drive.TDD.ct_Bank.BANK_Pad_DATA.Set_TS_Ok           ? Utilities.Set_Color("Set TS..OkLabel",           clrDarkBlue)    &&  UTILITIES_Switch.Bool(ct_Drive.TDD.ct_Bank.BANK_Pad_DATA.Set_TS_Ok)           : UTILITIES_Switch.Bool(ct_Drive.TDD.ct_Bank.BANK_Pad_DATA.Set_TS_Ok)           && Utilities.Set_Color("Set TS..OkLabel",      clrWhite); return;};
          if(Clicked == OBJPREFIX + "Set MP..OkLabel")           {!ct_Drive.TDD.ct_Bank.BANK_Pad_DATA.Set_MP_Ok           ? Utilities.Set_Color("Set MP..OkLabel",           clrDarkBlue)    &&  UTILITIES_Switch.Bool(ct_Drive.TDD.ct_Bank.BANK_Pad_DATA.Set_MP_Ok)           : UTILITIES_Switch.Bool(ct_Drive.TDD.ct_Bank.BANK_Pad_DATA.Set_MP_Ok)           && Utilities.Set_Color("Set MP..OkLabel",      clrWhite); return;};
          //
          if(Clicked == OBJPREFIX + "Set Lots..OkLabel")         {!ct_Drive.TDD.ct_Bank.BANK_Pad_DATA.Set_Lots_Ok         ? Utilities.Set_Color("Set Lots..OkLabel",         clrAqua)        &&  UTILITIES_Switch.Bool(ct_Drive.TDD.ct_Bank.BANK_Pad_DATA.Set_Lots_Ok)         : UTILITIES_Switch.Bool(ct_Drive.TDD.ct_Bank.BANK_Pad_DATA.Set_Lots_Ok)         && Utilities.Set_Color("Set Lots..OkLabel",    clrWhite); return;};
          if(Clicked == OBJPREFIX + "Set Risk$..OkLabel")        {!ct_Drive.TDD.ct_Bank.BANK_Pad_DATA.Set_RiskAmount_Ok   ? Utilities.Set_Color("Set Risk$..OkLabel",        clrAqua)        &&  UTILITIES_Switch.Bool(ct_Drive.TDD.ct_Bank.BANK_Pad_DATA.Set_RiskAmount_Ok)   : UTILITIES_Switch.Bool(ct_Drive.TDD.ct_Bank.BANK_Pad_DATA.Set_RiskAmount_Ok)   && Utilities.Set_Color("Set Risk$..OkLabel",   clrWhite); return;};
          if(Clicked == OBJPREFIX + "Set Equity$..OkLabel")      {!ct_Drive.TDD.ct_Bank.BANK_Pad_DATA.Set_EquityAmount_Ok ? Utilities.Set_Color("Set Equity$..OkLabel",      clrAqua)        &&  UTILITIES_Switch.Bool(ct_Drive.TDD.ct_Bank.BANK_Pad_DATA.Set_EquityAmount_Ok) : UTILITIES_Switch.Bool(ct_Drive.TDD.ct_Bank.BANK_Pad_DATA.Set_EquityAmount_Ok) && Utilities.Set_Color("Set Equity$..OkLabel", clrWhite); return;};
          if(Clicked == OBJPREFIX + "Set Risk%..OkLabel")        {!ct_Drive.TDD.ct_Bank.BANK_Pad_DATA.Set_RiskPercent_Ok  ? Utilities.Set_Color("Set Risk%..OkLabel",        clrAqua)        &&  UTILITIES_Switch.Bool(ct_Drive.TDD.ct_Bank.BANK_Pad_DATA.Set_RiskPercent_Ok)  : UTILITIES_Switch.Bool(ct_Drive.TDD.ct_Bank.BANK_Pad_DATA.Set_RiskPercent_Ok)  && Utilities.Set_Color("Set Risk%..OkLabel",   clrWhite); return;};
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
          if(Clicked == OBJPREFIX + "MoneyManagerPadLabel") { bank_Pad.MM_Panel_Call(MODE_CREATE, UTILITIES_Switch.BoolValue(ct_Drive.TDD.ct_Bank.BANK_Pad_DATA.IsMM_Panel), false, false, 0, All_RightMenu_Pad_Y);}
          if(Clicked == OBJPREFIX + "MoneyManagerPad-resetLabel")
          {         //------------------------------------------------------------------------------------------------------------------------------------------
                    ct_Drive.TDD.ct_Bank.BANK_Pad_DATA.Set_PP_Ok = false;           Utilities.Set_Color("Set PP..OkLabel",      clrWhite);
                    ct_Drive.TDD.ct_Bank.BANK_Pad_DATA.Set_TP_Ok = false;           Utilities.Set_Color("Set TP..OkLabel",      clrWhite);
                    ct_Drive.TDD.ct_Bank.BANK_Pad_DATA.Set_SL_Ok = false;           Utilities.Set_Color("Set SL..OkLabel",      clrWhite);
                    ct_Drive.TDD.ct_Bank.BANK_Pad_DATA.Set_TS_Ok = false;           Utilities.Set_Color("Set TS..OkLabel",      clrWhite);
                    ct_Drive.TDD.ct_Bank.BANK_Pad_DATA.Set_MP_Ok = false;           Utilities.Set_Color("Set MP..OkLabel",      clrWhite);
                    //------------------------------------------------------------------------------------------------------------------------------------------
                    ct_Drive.TDD.ct_StopLoss.INP_Pip                                   = ct_Drive.TDD.ct_StopLoss.Fixed_Pip; //
                    ct_Drive.TDD.ct_TakeProfit.INP_Pip                                 = ct_Drive.TDD.ct_TakeProfit.Fixed_Pip; //
                    ct_Drive.TDD.ct_Pending.INP_Pip                                    = ct_Drive.TDD.ct_Pending.Fixed_Pip; //
                    ct_Drive.TDD.ct_Modify.Trails.TrailSL.Stops.INP_Pip                = ct_Drive.TDD.ct_Modify.Trails.TrailSL.Stops.Fixed_Pip; //
                    ct_Drive.TDD.ct_Modify.Trails.TrailSL.ProfitMin.INP_Pip            = ct_Drive.TDD.ct_Modify.Trails.TrailSL.ProfitMin.Fixed_Pip; //
                    //------------------------------------------------------------------------------------------------------------------------------------------
          }
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
          if(Clicked == OBJPREFIX + "MMType: Label")
          {         static int Keyswitch = 1;  //Alert("MMTypeX:", (string)MMTypeX); //
                    if(Keyswitch == 2 ) { Keyswitch = 0;  bank_Pad.MM_Panel_Type(MODE_CREATE, true, MM_Manual); return; }; ////LotsType7
                    if(Keyswitch == 0 ) { Keyswitch = 1;  bank_Pad.MM_Panel_Type(MODE_CREATE, true, MM_Fixed);  return; }; //fristly in fixed mode start//
                    if(Keyswitch == 1)  { Keyswitch = 2;  bank_Pad.MM_Panel_Type(MODE_CREATE, true, MM_Auto);   return;}; //
          } //
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
          if(Clicked ==  "LotsTypeEdite")
          {         ObjectSetString(0, "LotsTypeEdite", OBJPROP_TEXT, "");//donw in timer//
                    bank_Pad.KeyLotsTypeEdite = true; //
                    // ObjectSetInteger(0, "LotsTypeEdite", OBJPROP_BGCOLOR, clrRed);//
          }
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
}
//+------------------------------------------------------------------+
//||   ||||||||||                 Ce_eBank.mqh                      ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
