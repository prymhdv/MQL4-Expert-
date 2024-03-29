//+------------------------------------------------------------------+ ProjectName - CompanyName - Copyright - WebSite
//||    ||||||||||          ProjectName:QUARTS.mq4                  || Worlds Watcher V00-build FC-2021-01-10//QUARTS_DEBUG build FC-2021-04-10
//|||   ||||||  ||        Copyright © 2020-2022, MetaJetEngine     ||| MyRoboTrader V00-build FC-2021-01-10
//||||  ||   |||||            Email: @prymhdvgmail.com            |||| MyRoboTrader V06-build FC-2021-04-10
//|||   |||||||  |            HTTPS: www.Oprymhdv.com              ||| MyRoboTrader V08-build FC-2022-01-13
//||    ||||||||||      MyRoboTrader V08-build FC-2022-01-13        ||"ComponentInterfaceAbstractImplanting" 2021 12 13 02:13:36 ct_Start. Weekly Reply
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(ControlersCall)\MCV_Data_Model.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(ControlersCall)\MCV_Method_View.mqh>
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
//---   Module  ---\\//---   Module  ---\\//---   Module  ---\\//---   Module  ---\\//---   Module  ---\\//---   Module  ---\\//---   Module  ---\\//---   Module  ---\\//---   Module  ---\\//---   Module  ---\\    |
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
//*********************************************************************************************************************************************************************************************************************
//||    |||||   ||      ||   |||||   ||    ||   ||||||||                                ||\\
//||    ||       ||    ||    ||      ||||  ||      ||                                   ||\\
//||    ||||      ||  ||     ||||    || || ||      ||                                   ||\\
//||    ||         ||||      ||      ||  ||||      ||                                   ||\\
//||    |||||       ||       |||||   ||    ||      ||                                   ||\\
//+--------------------------------------------------------------------------------------+===View======= Functions Set Get
//|     Module ~~ View ~~ UI ~~ GUI ~~ Represents Current Model State ~~ Panels Complete |class Ce_RightMenu: public Sg_OnChartEvent_base
//+--------------------------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Views)(Event)\eTradePanel.mqh>                  Ce_TradePanel         Event_TradePanel;
//-----------------------------------------------------------------------------------------------------------------------------------------
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Views)(Event)\eElliotWavePanel.mqh>             Cgpe_ElliotWavePanel  Event_ElliotWavePanel;
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Views)(Event)\eFlowPanel.mqh>                   Ce_FlowPanel          Event_FlowPanel;
//-----------------------------------------------------------------------------------------------------------------------------------------
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Views)(Event)\eRightMenu.mqh>                   Ce_RightMenu          Event_RightMenu;
//-----------------------------------------------------------------------------------------------------------------------------------------
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Views)(Event)\eBank.mqh>                        Ce_eBank              Event_Bank;
//-------------------------------------------------------------------------------------------------------------------------------------------------------
//+-----------------------------------------------------------------------------------------------------------------------------------------------------+
//|                                            TRADE PROGRESSION >>>                                                                                    |
//+-----------------------------------------------------------------------------------------------------------------------------------------------------+
//    [Start        TRADE]  >>>  ct_Order Line is active by timer(cycler) each cycle event happen or key active mean it driving the start ordering that Subcycle    like  OrderPutting.IsMarkets when acctive...progression start to put...
//    [void C_TIMER::Update(bool IsAllow)] >>> [bool C_OSTART_Pad::Update()] >>> [ct_Drive.Update();] >>> [ct_Order.Update();]] [ct_Start..Update();]]  [bool C_OSTART::Command_Put_OrderStart()]  [Put_OrderStart_Markets();]  [OrderPutting.IsMarketsSellDone =  OrderPut(OP_SELL, 0, ct_Drive.ObjTicket);]
//    [OrderSend(PutSymbol, PutType, PutLots, PutPrice, PutSlippage, PutSL, PutTP, PutComment, PutMagicNumber, PutExpiration, PutArrow);]
//
//    [END          TRADE]
//
//    [Modification TRADE]
//==========================================================
// Status E Trade App Local Enviroments <<<<<<<<<<<<<<<<<<<|
//==========================================================
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
//---   Module  ---\\//---   Module  ---\\//---   Module  ---\\//---   Module  ---\\//---   Module  ---\\//---   Module  ---\\//---   Module  ---\\//---   Module  ---\\//---   Module  ---\\//---   Module  ---\\    |
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
//+------------------------------------------------------------------+ ProjectName - CompanyName - Copyright - WebSite
//||    ||||||||||          ProjectName:QUARTS.mq4                  || Worlds Watcher V00-build FC-2021-01-10//QUARTS_DEBUG build FC-2021-04-10
//|||   ||||||  ||        Copyright © 2020-2022, MetaJetEngine     ||| MyRoboTrader V00-build FC-2021-01-10
//||||  ||   |||||            Email: @prymhdvgmail.com            |||| MyRoboTrader V06-build FC-2021-04-10
//|||   |||||||  |            HTTPS: www.Oprymhdv.com              ||| MyRoboTrader V08-build FC-2022-01-13
//||    ||||||||||      MyRoboTrader V08-build FC-2022-01-13        ||"ComponentInterfaceAbstractImplanting" 2021 12 13 02:13:36 ct_Start. Weekly Reply
//+------------------------------------------------------------------+
