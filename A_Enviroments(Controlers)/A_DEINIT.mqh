//+------------------------------------------------------------------+
//|                        C_DEINIT.mqh                              |
//+------------------------------------------------------------------+
//||   ||||||||||               C_DEINIT.mqh                        ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(ControlersCall)\MCV_Data_Model.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(ControlersCall)\MCV_Method_View.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(ControlersCall)\MCV_Interface_Control.mqh>
//===================================================================
//ERR_OBJECT_DOES_NOT_EXIST
//===================================================================
class C_DEINIT
{
//====================================================================
private:

public:
          void   C_DEINIT() {};
          void   ~C_DEINIT() {};
          void   Run(int reason );
          void   OnDeinitLog(bool IsAllow);
          void   UninitReason(bool IsAllow);

//====================================================================
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_DEINIT::Run( int reason )
{         EventKillTimer();     //Destroy timer
          ObjectsDeleteAll();
          Vg_IsBasic_UNINITED = true;
          //===========================================================================//delete Tools;// delete Charter; not using cause neddd deleting...//must be Pointer
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-OnDeinit Error",  __LINE__, __FUNCTION__); //|!a1.KeyOffDayTimeLocal
          SafeObjectTotalByDeiniter = ObjectsTotal();
          //===============================================================
          //===============================================================
          //ct_Drive.OrderCloseX();
          //===============================================================
          OnDeinitLog(false);
          UninitReason(false);
          ExtDialog.OnDeinitX( reason);
          //===============================================================
          if(false)
          {         //C_STATICSUN::DeleteAnaliseAllObjectName(SuperKeyAnaliseAllObject);
                    if(!Capitan_DeinitErrorCatching) ObjectsDeleteAll();  //for no erroing on exite//just can make remember values// for global Object eroring...///its Play Frist function in ct_Order of deiniting prossess
                    ObjectsDeleteAll();//
          }
          //===============================================================
          //===============================================================
          if(false)Print("OnDeinit====ENDCalling-QUARTS-====" + (string)TimeLocal() + "====" + "erorrCounting:" + (string)________________________________________________________Xerorr.__Count__ + "=========");
          if(false)Alert("OnDeinit====ENDCalling-QUARTS-====" + (string)TimeLocal() + "====" + "erorrCounting:" + (string)________________________________________________________Xerorr.__Count__ + "=========");//
          //=============================================================================================================================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-ChartRun Error",  __LINE__, __FUNCTION__);
//
}

//+------------------------------------------------------------------+
void C_DEINIT::OnDeinitLog(bool IsAllow)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "Capitan.mqh Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          if(IsAllow)
          {         Print("....END MyRoboTrader--a1.OrderCloser()==true>>>" + ErrorDescription(_LastError) + "|" + (string)_LastError );
                    Print(" MyRoboTrader.Capitan.OnChartOBJ  Start secounds: ", GetTickCount()  / 1000); //
                    Print("     OnDeinit Log Is:        ");
                    printf("ACCOUNT_BALANCE =  %.2f", AccountInfoDouble(ACCOUNT_BALANCE));
                    printf("ACCOUNT_CREDIT =  %.2f", AccountInfoDouble(ACCOUNT_CREDIT));
                    printf("ACCOUNT_PROFIT =  %.2f", AccountInfoDouble(ACCOUNT_PROFIT));
                    printf("ACCOUNT_EQUITY =  %.2f", AccountInfoDouble(ACCOUNT_EQUITY));
                    printf("ACCOUNT_MARGIN =  %.2f", AccountInfoDouble(ACCOUNT_MARGIN));
                    printf("ACCOUNT_MARGIN_FREE =  %.2f", AccountInfoDouble(ACCOUNT_FREEMARGIN));
                    printf("ACCOUNT_MARGIN_LEVEL =  %.2f", AccountInfoDouble(ACCOUNT_MARGIN_LEVEL));
                    printf("ACCOUNT_MARGIN_SO_CALL = %.2f", AccountInfoDouble(ACCOUNT_MARGIN_SO_CALL));
                    printf("ACCOUNT_MARGIN_SO_SO = %.2f", AccountInfoDouble(ACCOUNT_MARGIN_SO_SO));
                    Print("The name of the broker = ", AccountInfoString(ACCOUNT_COMPANY));
                    Print("Deposit currency = ", AccountInfoString(ACCOUNT_CURRENCY));
                    Print("Client name = ", AccountInfoString(ACCOUNT_NAME));
                    Print("The name of the trade server = ", AccountInfoString(ACCOUNT_SERVER));
//======================================
//--- show all the Information available from the function AccountInfoInteger()
                    printf("ACCOUNT_LOGIN =  %d", AccountInfoInteger(ACCOUNT_LOGIN));
                    printf("ACCOUNT_LEVERAGE =  %d", AccountInfoInteger(ACCOUNT_LEVERAGE));
                    bool thisAccountTradeAllowed = AccountInfoInteger(ACCOUNT_TRADE_ALLOWED);
                    bool EATradeAllowed = AccountInfoInteger(ACCOUNT_TRADE_EXPERT);
                    ENUM_ACCOUNT_TRADE_MODE tradeMode = (ENUM_ACCOUNT_TRADE_MODE)AccountInfoInteger(ACCOUNT_TRADE_MODE);
                    ENUM_ACCOUNT_STOPOUT_MODE stopOutMode = (ENUM_ACCOUNT_STOPOUT_MODE)AccountInfoInteger(ACCOUNT_MARGIN_SO_MODE);
                    if(thisAccountTradeAllowed)//--- ct_Inform about the possibility to perform a trade operation
                              Print("Trade for this account is permitted");
                    else Print("Trade for this account is prohibited!");
                    if(EATradeAllowed)//--- Find out if it is possible to trade on this account by Expert Advisors
                              Print("Trade by Expert Advisors is permitted for this account");
                    else Print("Trade by Expert Advisors is prohibited for this account!");
                    switch(tradeMode)//--- Find out the account type
                    {         case(ACCOUNT_TRADE_MODE_DEMO): Print("This is a demo account"); break;
                              case(ACCOUNT_TRADE_MODE_CONTEST): Print("This is a competition account"); break;
                              default: Print("This is a real account!"); //
                    }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
                    switch(stopOutMode)//--- Find out the StopOut level setting mode
                    {         case(ACCOUNT_STOPOUT_MODE_PERCENT): Print("The StopOut level is specified percentage"); break;
                              default: Print("The StopOut level is specified in monetary terms");//
                    }//
          }//
          ________________________________________________________Xerorr.SuperviserX(_LastError, "Capitan.mqh Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
//Print reason
void    C_DEINIT::UninitReason(bool IsAllow)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "Capitan.mqh Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
// if(MQLInfoInteger(MQL_PROGRAM_TYPE) == PROGRAM_EXPERT)
          if(IsAllow)
          {         switch(UninitializeReason())//
                    {         case REASON_PROGRAM     :
                                        //Print("Expert Advisor self terminated",ObjectsTotalX);
                                        Alert("UninitReason: -Expert Advisor self terminated.", C_STATICSUN::ObjectsTotalStatic);
                                        break;
                              case REASON_REMOVE      :
                                        //Print("Expert Advisor removed from the chart",ObjectsTotalX);
                                        Alert("UninitReason: -Expert Advisor removed from the chart.", C_STATICSUN::ObjectsTotalStatic);
                                        break;
                              case REASON_RECOMPILE   :
                                        Print("UninitReason: -Expert Advisorhas been recompiled.", C_STATICSUN::ObjectsTotalStatic);
                                        //Alert("UninitReason-Expert Advisorhas been recompiled",ObjectsTotalX);
                                        break;
                              case REASON_CHARTCHANGE :
                                        //Print("Symbol or chart period has been changed",ObjectsTotalX);
                                        Alert("UninitReason: -Symbol or chart period has been changed.", C_STATICSUN::ObjectsTotalStatic);
                                        break;
                              case REASON_CHARTCLOSE  :
                                        //Print("Chart has been closed",ObjectsTotalX);
                                        Alert("UninitReason: -Chart has been closed.", C_STATICSUN::ObjectsTotalStatic);
                                        break;
                              case REASON_PARAMETERS  :
                                        //Print("Input parameters have been changed by a user",ObjectsTotalX);
                                        Alert("UninitReason: -Input parameters have been changed by a user.", C_STATICSUN::ObjectsTotalStatic);
                                        break;
                              case REASON_ACCOUNT     :
                                        //Print("Another account has been activated or reconnection to the trade server has occurred due to changes in the account settings",ObjectsTotalX);
                                        Alert("UninitReason: -Another account has been activated or reconnection to the trade server has occurred due to changes in the account settings.", C_STATICSUN::ObjectsTotalStatic);
                                        break;
                              case REASON_TEMPLATE    :
                                        //Print("A new template has been applied",ObjectsTotalX);
                                        Alert("UninitReason: -A new template has been applied.", C_STATICSUN::ObjectsTotalStatic);
                                        break;
                              case REASON_INITFAILED  :
                                        //Print("OnInit() handler has returned a nonzero value",ObjectsTotalX);
                                        Alert("UninitReason: -OnInit() handler has returned a nonzero value.", C_STATICSUN::ObjectsTotalStatic);
                                        break;
                              case REASON_CLOSE       :
                                        //Print("Terminal has been closed",ObjectsTotalX);
                                        Alert("UninitReason: -Terminal has been closed.", C_STATICSUN::ObjectsTotalStatic);
                                        break;//
                    } //
          }//
          ________________________________________________________Xerorr.SuperviserX(_LastError, "Capitan.mqh Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
}
//====================================================================
//+------------------------------------------------------------------+
