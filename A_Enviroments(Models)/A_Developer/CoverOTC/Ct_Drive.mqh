//+------------------------------------------------------------------+
//|                                                     Ct_Drive.mqh |
//|                                                    A pourya 2021 |
//|                                                @prymhdvgmail.com |
//+------------------------------------------------------------------+MyRobo
#property copyright "A pourya 2021"
#property link      "@prymhdvgmail.com"
#property version   "1.00"
#property strict
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOTB\.CoverOTB.mqh>
//====================================================================
////+------------------------------------------------------------------+
////|                    Condition Manager information                 | Logical Oprate DataBase
////+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOTB\Ct_Signals.mqh>
////+------------------------------------------------------------------+
////|                    Positions Manager information                 | Logical Oprate DataBase
////+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOTB\Ct_StopLoss.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOTB\Ct_TakeProfit.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOTB\Ct_Pending.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOTB\Ct_RiskReward.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOTB\Ct_Size.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOTB\Ct_SetPrices.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOTB\Ct_SCMETime.mqh>

////======================================================================================================
////+------------------------------------------------------------------+
////|                    Positions Manager information                 | Control Opration DataBase
////+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOTB\Ct_Ticket.mqh>                           ////-----------bool Ct_Ticket::Update()  issue happen
Ct_Ticket             Obj_Ticket, Obj_TicketList[]; //
int                   Int_Ticket, Int_TicketList[];
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOTB\Ct_Order.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOTB\Ct_Start.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOTB\Ct_End.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOTB\Ct_Modify.mqh>                        //------- stack over floww no alert run
////======================================================================================================//
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOTB\Ct_Bank.mqh>
//+------------------------------------------------------------------+
//|             Class Ct_Drive     BEGIN                             |
//+------------------------------------------------------------------+
//2021.09.21 14:51:56.575     QUARTS_DEBUG ct_XAUUSD.F,H4: __IT is Gone__vDown __SELL DOWN_ _: true _ 1769.686813347937 _ 1763.500968803619
//------------------------------ FuncTest(Ct_Drive&)>>FuncTest(this);

struct Stp_TRADER_DATA
{         bool                  Is_AutoTradeDirect;
          bool                  Is_AutoTradeDirectOnline;
          bool                  IsTicketManage;
          bool                  IsConditionWatch;
          bool                  IsAuto_OrdersPut;
          bool                  IsAuto_OrdersModifications;
          bool                  IsAuto_EndAll;
          bool                  Is_Close_SubTicketEnd;


}; Stp_TRADER_DATA TRADER_Panel_DATA;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
enum Et_Trade_Mode
{         Et_Update_Tickets,
          Et_Update_Bank,
          Et_Update_Conductor,
          Et_Update_Order,
          Et_Update_Order_Void,
          Et_Update_Order_Wating,
          Et_Update_Order_Wating_No,
          Et_Update_Order_Selling,
          Et_Update_Order_Buying,
          Et_Update_Order_Watching,
          Et_Update_Order_Starting,
          Et_Update_Order_Starting_Errored,
          Et_Update_Order_Modifying,
          Et_Update_Order_Ending,
          //
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class Ct_Configs
{
public:
          Ct_Configs(void) {};
          ~Ct_Configs(void) {};
          bool IsAllowConfig;
          bool IsShow_Events_Shapes;
          bool IsShow_Channel_Shapes;
          bool IsShow_Pivots_Shapes;
          bool IsShow_MACD_Shapes;
          bool IsShow_Book_Shapes;
          bool IsShow_CHSD_Shapes;
          bool IsShow_RRBoxs_Shapes;
          //--------------------------------------
          void PanelShow(bool b)
          {
                    {         RectLabelX.GDS.Set_Action_2(MODE_CREATE, b);
                              RectLabelX.GDS.Set_Desc_1("RLBLB-Ct_Configs-Panel");
                              RectLabelX.GDS.Set_Tip_3(STYLE_SOLID, 1, BORDER_FLAT);
                              RectLabelX.GDS.Set_Color_2(clrMidnightBlue, clrNONE);
                              RectLabelX.GDS.Set_Location_5(235, 45, 120, 210, CORNER_RIGHT_UPPER);
                              RectLabelX.GDS.Set_Chart_6();
                              RectLabelX.GDS.Set_Common_6(true, 10, false, false, false, "RLBLB-Ct_Configs-Panel");
                              RectLabelX.Action(RectLabelX); //
                              //
                              RectLabelX.GDS.Set_Action_2(MODE_CREATE, b);
                              RectLabelX.GDS.Set_Desc_1("RLBLB-Ct_Configs-Panel2");
                              RectLabelX.GDS.Set_Tip_3(STYLE_SOLID, 1, BORDER_FLAT);
                              RectLabelX.GDS.Set_Color_2(clrDarkSlateBlue, clrNONE);
                              RectLabelX.GDS.Set_Location_5(235, 45, 120, 15, CORNER_RIGHT_UPPER);
                              RectLabelX.GDS.Set_Chart_6();
                              RectLabelX.GDS.Set_Common_6(true, 10, false, false, false, "RLBLB-Ct_Configs-Panel2");
                              RectLabelX.Action(RectLabelX); //
                              //
                              LabelX.GDS.Set_Action_2(MODE_CREATE, b);
                              LabelX.GDS.Set_Desc_4("RLBLB-Ct_Configs-Panel-Header", "Trader Configs", "Arial", 9);
                              LabelX.GDS.Set_Color_1(clrWhite);
                              LabelX.GDS.Set_Location_5(235 - 8 - 10, 45, 0, CORNER_RIGHT_UPPER, ANCHOR_LEFT_UPPER);
                              LabelX.GDS.Set_Common_6(false, 50, false, false, false, "RLBLB-Ct_Configs-Panel-Header");
                              LabelX.GDS.Set_Chart_6();
                              LabelX.Action(LabelX);//
                              //=========================0
                              EditX.GDS.Set_Action_2(MODE_CREATE, b);
                              EditX.GDS.Set_Desc_4("RLBLB-Ct_Configs-Panel-EDT-ScalpAmount", "ScalpAmount:" + DoubleToString(ct_Drive.TDD.ct_Signals.DATAS.ScalpAmount_All_Trader, _Digits), "Tahoma", 7);
                              EditX.GDS.Set_Self_2(ALIGN_CENTER, readonlyDEF);
                              EditX.GDS.Set_Location_5(235 - 4, 63, 70 + 20, 15, CORNER_RIGHT_UPPER);
                              EditX.GDS.Set_Color_3(clrDarkSlateBlue, clrDarkSlateBlue, clrWhite);
                              EditX.GDS.Set_Common_6(false, 60, false, false, false, EditDEF_tooltip + "RLBLB-Ct_Configs-Panel-EDT-ScalpAmount");
                              EditX.GDS.Set_Chart_6();
                              EditX.Action(EditX);//
                              //
                              ButtonX.GDS.Set_Action_2(MODE_CREATE, b);
                              ButtonX.GDS.Set_Desc_4("RLBLB-Ct_Configs-Panel-BTN-ScalpAmount", "OK", "Arial", 7);
                              ButtonX.GDS.Set_Self_1(ButtonDEF_state);
                              ButtonX.GDS.Set_Location_5(235 - 4 - 70 - 2 - 20, 63, 20, 15, CORNER_RIGHT_UPPER);
                              ButtonX.GDS.Set_Color_3(clrLavender, clrLavender, clrDarkCyan);
                              ButtonX.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "RLBLB-Ct_Configs-Panel-BTN-ScalpAmount");
                              ButtonX.GDS.Set_Chart_6();
                              ButtonX.Action(ButtonX);//
                              //=========================1
                              EditX.GDS.Set_Action_2(MODE_CREATE, b);
                              EditX.GDS.Set_Desc_4("RLBLB-Ct_Configs-Panel-EDT-WaitCount", "WaitCount:" + IntegerToString(ct_Drive.TDD.ct_Start.Max_Candel_Wating_After_Win), "Tahoma", 7);
                              EditX.GDS.Set_Self_2(ALIGN_CENTER, false);
                              EditX.GDS.Set_Location_5(235 - 4, 63 + 16, 70 + 20, 15, CORNER_RIGHT_UPPER);
                              EditX.GDS.Set_Color_3(clrDarkSlateBlue, clrDarkSlateBlue, clrWhite);
                              EditX.GDS.Set_Common_6(false, 60, false, false, false, EditDEF_tooltip + "RLBLB-Ct_Configs-Panel-EDT-WaitCount");
                              EditX.GDS.Set_Chart_6();
                              EditX.Action(EditX);//
                              //
                              ButtonX.GDS.Set_Action_2(MODE_CREATE, b);
                              ButtonX.GDS.Set_Desc_4("RLBLB-Ct_Configs-Panel-BTN-WaitCount", "OK", "Arial", 7);
                              ButtonX.GDS.Set_Self_1(ButtonDEF_state);
                              ButtonX.GDS.Set_Location_5(235 - 4 - 70 - 2 - 20, 63 + 16, 20, 15, CORNER_RIGHT_UPPER);
                              ButtonX.GDS.Set_Color_3(clrLavender, clrLavender, clrDarkCyan);
                              ButtonX.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "RLBLB-Ct_Configs-Panel-BTN-WaitCount");
                              ButtonX.GDS.Set_Chart_6();
                              ButtonX.Action(ButtonX);//
                              //=========================2
                              EditX.GDS.Set_Action_2(MODE_CREATE, b);
                              EditX.GDS.Set_Desc_4("RLBLB-Ct_Configs-Panel-EDT-ScalpAmountB", "ScalpAmount", "Tahoma", 7);
                              EditX.GDS.Set_Self_2(ALIGN_CENTER, readonlyDEF);
                              EditX.GDS.Set_Location_5(235 - 4, 63 + 16 + 16, 70 + 20, 15, CORNER_RIGHT_UPPER);
                              EditX.GDS.Set_Color_3(clrDarkSlateBlue, clrDarkSlateBlue, clrWhite);
                              EditX.GDS.Set_Common_6(false, 60, false, false, false, EditDEF_tooltip + "RLBLB-Ct_Configs-Panel-EDT-ScalpAmountB");
                              EditX.GDS.Set_Chart_6();
                              EditX.Action(EditX);//
                              //
                              ButtonX.GDS.Set_Action_2(MODE_CREATE, b);
                              ButtonX.GDS.Set_Desc_4("RLBLB-Ct_Configs-Panel-BTN-ScalpAmountB", "OK", "Arial", 7);
                              ButtonX.GDS.Set_Self_1(ButtonDEF_state);
                              ButtonX.GDS.Set_Location_5(235 - 4 - 70 + 20 - 2 - 40, 63 + 16 * 2, 20, 15, CORNER_RIGHT_UPPER);
                              ButtonX.GDS.Set_Color_3(clrLavender, clrLavender, clrDarkCyan);
                              ButtonX.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "RLBLB-Ct_Configs-Panel-BTN-ScalpAmountB");
                              ButtonX.GDS.Set_Chart_6();
                              ButtonX.Action(ButtonX);//
                              //=========================3
                              EditX.GDS.Set_Action_2(MODE_CREATE, b);
                              EditX.GDS.Set_Desc_4("RLBLB-Ct_Configs-Panel-EDT-ScalpAmountC", "ScalpAmount", "Tahoma", 7);
                              EditX.GDS.Set_Self_2(ALIGN_CENTER, readonlyDEF);
                              EditX.GDS.Set_Location_5(235 - 4, 63 + 16 + 16 + 16, 70 + 20, 15, CORNER_RIGHT_UPPER);
                              EditX.GDS.Set_Color_3(clrDarkSlateBlue, clrDarkSlateBlue, clrWhite);
                              EditX.GDS.Set_Common_6(false, 60, false, false, false, EditDEF_tooltip + "RLBLB-Ct_Configs-Panel-EDT-ScalpAmountC");
                              EditX.GDS.Set_Chart_6();
                              EditX.Action(EditX);//
                              //
                              ButtonX.GDS.Set_Action_2(MODE_CREATE, b);
                              ButtonX.GDS.Set_Desc_4("RLBLB-Ct_Configs-Panel-BTN-ScalpAmountC", "OK", "Arial", 7);
                              ButtonX.GDS.Set_Self_1(ButtonDEF_state);
                              ButtonX.GDS.Set_Location_5(235 - 4 - 70 + 20 - 2 - 40, 63 + 16 * 3, 20, 15, CORNER_RIGHT_UPPER);
                              ButtonX.GDS.Set_Color_3(clrLavender, clrLavender, clrDarkCyan);
                              ButtonX.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "RLBLB-Ct_Configs-Panel-BTN-ScalpAmountC");
                              ButtonX.GDS.Set_Chart_6();
                              ButtonX.Action(ButtonX);//
                              //=========================
                              //
                              ButtonX.GDS.Set_Action_2(MODE_CREATE, b);
                              ButtonX.GDS.Set_Desc_4("RLBLB-Ct_Configs-Panel-BTN-Reset", "Reset", "Arial", 7);
                              ButtonX.GDS.Set_Self_1(ButtonDEF_state);
                              ButtonX.GDS.Set_Location_5(235 - 4 - 70 - 2 + 70, 63 + 16 * 4, 20 + 20 + 50, 15, CORNER_RIGHT_UPPER);
                              ButtonX.GDS.Set_Color_3(clrLavender, clrLavender, clrDarkCyan);
                              ButtonX.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "RLBLB-Ct_Configs-Panel-BTN-Reset");
                              ButtonX.GDS.Set_Chart_6();
                              ButtonX.Action(ButtonX);//
                              //=========================DATAS.Is_Pressed_MACD_Trader
                              ButtonX.GDS.Set_Action_2(MODE_CREATE, b);
                              ButtonX.GDS.Set_Desc_4("RLBLB-Ct_Configs-Panel-BTN-MACDTrader", "MACDTrader-ADX", "Arial", 7);
                              ButtonX.GDS.Set_Self_1(ButtonDEF_state);
                              ButtonX.GDS.Set_Location_5(235 - 4 - 70 - 2 + 70, 63 + 16 * 5, 20 + 20 + 50, 15, CORNER_RIGHT_UPPER);
                              ButtonX.GDS.Set_Color_3(clrLavender, clrLavender, clrDarkCyan);
                              ButtonX.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "RLBLB-Ct_Configs-Panel-BTN-MACDTrader");
                              ButtonX.GDS.Set_Chart_6();
                              ButtonX.Action(ButtonX);//
                              //=========================DATAS.Is_Pressed_MACD_Trader
                              ButtonX.GDS.Set_Action_2(MODE_CREATE, b);
                              ButtonX.GDS.Set_Desc_4("RLBLB-Ct_Configs-Panel-BTN-MACDTrader-Solo", "MACDTrader-Solo", "Arial", 7);
                              ButtonX.GDS.Set_Self_1(ButtonDEF_state);
                              ButtonX.GDS.Set_Location_5(235 - 4 - 70 - 2 + 70, 63 + 16 * 6, 20 + 20 + 50, 15, CORNER_RIGHT_UPPER);
                              ButtonX.GDS.Set_Color_3(clrLavender, clrLavender, clrDarkCyan);
                              ButtonX.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "RLBLB-Ct_Configs-Panel-BTN-MACDTrader-Solo");
                              ButtonX.GDS.Set_Chart_6();
                              ButtonX.Action(ButtonX);//
                              //=========================&& DATAS.Is_Pressed_TreeSence_Trader
                              ButtonX.GDS.Set_Action_2(MODE_CREATE, b);
                              ButtonX.GDS.Set_Desc_4("RLBLB-Ct_Configs-Panel-BTN-TreeTrader", "TreeTrader", "Arial", 7);
                              ButtonX.GDS.Set_Self_1(ButtonDEF_state);
                              ButtonX.GDS.Set_Location_5(235 - 4 - 70 - 2 + 70, 63 + 16 * 7, 20 + 20 + 50, 15, CORNER_RIGHT_UPPER);
                              ButtonX.GDS.Set_Color_3(clrLavender, clrLavender, clrDarkCyan);
                              ButtonX.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "RLBLB-Ct_Configs-Panel-BTN-TreeTrader");
                              ButtonX.GDS.Set_Chart_6();
                              ButtonX.Action(ButtonX);//
                              //=========================
                              ButtonX.GDS.Set_Action_2(MODE_CREATE, b);
                              ButtonX.GDS.Set_Desc_4("RLBLB-Ct_Configs-Panel-BTN-ArrayTrader", "ArrayTrader", "Arial", 7);
                              ButtonX.GDS.Set_Self_1(ButtonDEF_state);
                              ButtonX.GDS.Set_Location_5(235 - 4 - 70 - 2 + 70, 63 + 16 * 8, 20 + 20 + 50, 15, CORNER_RIGHT_UPPER);
                              ButtonX.GDS.Set_Color_3(clrLavender, clrLavender, clrDarkCyan);
                              ButtonX.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "RLBLB-Ct_Configs-Panel-BTN-ArrayTrader");
                              ButtonX.GDS.Set_Chart_6();
                              ButtonX.Action(ButtonX);//
                              //=========================
                              ButtonX.GDS.Set_Action_2(MODE_CREATE, b);
                              ButtonX.GDS.Set_Desc_4("RLBLB-Ct_Configs-Panel-BTN-NNTrader", "NNTrader", "Arial", 7);
                              ButtonX.GDS.Set_Self_1(ButtonDEF_state);
                              ButtonX.GDS.Set_Location_5(235 - 4 - 70 - 2 + 70, 63 + 16 * 9, 20 + 20 + 50, 15, CORNER_RIGHT_UPPER);
                              ButtonX.GDS.Set_Color_3(clrLavender, clrLavender, clrDarkCyan);
                              ButtonX.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "RLBLB-Ct_Configs-Panel-BTN-NNTrader");
                              ButtonX.GDS.Set_Chart_6();
                              ButtonX.Action(ButtonX);//
                              //=========================
                              ButtonX.GDS.Set_Action_2(MODE_CREATE, b);
                              ButtonX.GDS.Set_Desc_4("RLBLB-Ct_Configs-Panel-BTN-FETrader", "FETrader", "Arial", 7);
                              ButtonX.GDS.Set_Self_1(ButtonDEF_state);
                              ButtonX.GDS.Set_Location_5(235 - 4 - 70 - 2 + 70, 63 + 16 * 10, 20 + 20 + 50, 15, CORNER_RIGHT_UPPER);
                              ButtonX.GDS.Set_Color_3(clrLavender, clrLavender, clrDarkCyan);
                              ButtonX.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "RLBLB-Ct_Configs-Panel-BTN-FETrader");
                              ButtonX.GDS.Set_Chart_6();
                              ButtonX.Action(ButtonX);//
                              //=========================
                    }
                    //
                    {         bool result0 = ct_Drive.TDD.ct_Start.Is_Candel_Wating_After_Win ?
                                             ObjectSetInteger(0, "RLBLB-Ct_Configs-Panel-BTN-WaitCount", OBJPROP_BGCOLOR, clrMidnightBlue) | ObjectSetInteger(0, "RLBLB-Ct_Configs-Panel-BTN-WaitCount", OBJPROP_COLOR, clrLavender) :
                                             ObjectSetInteger(0, "RLBLB-Ct_Configs-Panel-BTN-WaitCount", OBJPROP_COLOR, clrLavender)       | ObjectSetInteger(0, "RLBLB-Ct_Configs-Panel-BTN-WaitCount", OBJPROP_BGCOLOR, clrDarkCyan); // bool result0  = ct_Drive.TDD.ct_Signals.DATAS.IsReset                                             ? ObjectSetInteger(0, "RLBLB-Ct_Configs-Panel-BTN-Reset", OBJPROP_BGCOLOR, clrMidnightBlue) | ObjectSetInteger(0, "RLBLB-Ct_Configs-Panel-BTN-Reset", OBJPROP_COLOR, clrLavender) : ObjectSetInteger(0, "RLBLB-Ct_Configs-Panel-BTN-Reset", OBJPROP_COLOR, clrLavender) | ObjectSetInteger(0, "RLBLB-Ct_Configs-Panel-BTN-Reset", OBJPROP_BGCOLOR, clrDarkCyan); //
                              bool result1  = ct_Drive.TDD.ct_Signals.DATAS.Is_Active_All_TraderScalpAmount ?
                                              ObjectSetInteger(0, "RLBLB-Ct_Configs-Panel-BTN-ScalpAmount", OBJPROP_BGCOLOR, clrMidnightBlue) | ObjectSetInteger(0, "RLBLB-Ct_Configs-Panel-BTN-ScalpAmount", OBJPROP_COLOR, clrLavender) :
                                              ObjectSetInteger(0, "RLBLB-Ct_Configs-Panel-BTN-ScalpAmount", OBJPROP_COLOR, clrLavender) | ObjectSetInteger(0, "RLBLB-Ct_Configs-Panel-BTN-ScalpAmount", OBJPROP_BGCOLOR, clrDarkCyan); //
                              bool result2  = ct_Drive.TDD.ct_Signals.DATAS.Is_Pressed_MACD_Trader ?
                                              ObjectSetInteger(0, "RLBLB-Ct_Configs-Panel-BTN-MACDTrader", OBJPROP_BGCOLOR, clrMidnightBlue) | ObjectSetInteger(0, "RLBLB-Ct_Configs-Panel-BTN-MACDTrader", OBJPROP_COLOR, clrLavender) :
                                              ObjectSetInteger(0, "RLBLB-Ct_Configs-Panel-BTN-MACDTrader", OBJPROP_COLOR, clrLavender) | ObjectSetInteger(0, "RLBLB-Ct_Configs-Panel-BTN-MACDTrader", OBJPROP_BGCOLOR, clrDarkCyan); //
                              bool result3 = ct_Drive.TDD.ct_Signals.DATAS.Is_Pressed_MACDSolo_Trader ?
                                             ObjectSetInteger(0, "RLBLB-Ct_Configs-Panel-BTN-MACDTrader-Solo", OBJPROP_BGCOLOR, clrMidnightBlue) | ObjectSetInteger(0, "RLBLB-Ct_Configs-Panel-BTN-MACDTrader-Solo", OBJPROP_COLOR, clrLavender) :
                                             ObjectSetInteger(0, "RLBLB-Ct_Configs-Panel-BTN-MACDTrader-Solo", OBJPROP_COLOR, clrLavender)       | ObjectSetInteger(0, "RLBLB-Ct_Configs-Panel-BTN-MACDTrader-Solo", OBJPROP_BGCOLOR, clrDarkCyan); //
                              bool result4  = ct_Drive.TDD.ct_Signals.DATAS.Is_Pressed_TreeSence_Trader ?
                                              ObjectSetInteger(0, "RLBLB-Ct_Configs-Panel-BTN-TreeTrader", OBJPROP_BGCOLOR, clrMidnightBlue)    | ObjectSetInteger(0, "RLBLB-Ct_Configs-Panel-BTN-TreeTrader", OBJPROP_COLOR, clrLavender) :
                                              ObjectSetInteger(0, "RLBLB-Ct_Configs-Panel-BTN-TreeTrader", OBJPROP_COLOR, clrLavender)          | ObjectSetInteger(0, "RLBLB-Ct_Configs-Panel-BTN-TreeTrader", OBJPROP_BGCOLOR, clrDarkCyan); //
                              bool result5  = ct_Drive.TDD.ct_Signals.DATAS.Is_Pressed_ArraySence_Trader ?
                                              ObjectSetInteger(0, "RLBLB-Ct_Configs-Panel-BTN-ArrayTrader", OBJPROP_BGCOLOR, clrMidnightBlue)   | ObjectSetInteger(0, "RLBLB-Ct_Configs-Panel-BTN-ArrayTrader", OBJPROP_COLOR, clrLavender) :
                                              ObjectSetInteger(0, "RLBLB-Ct_Configs-Panel-BTN-ArrayTrader", OBJPROP_COLOR, clrLavender)         | ObjectSetInteger(0, "RLBLB-Ct_Configs-Panel-BTN-ArrayTrader", OBJPROP_BGCOLOR, clrDarkCyan); //
                              bool result6  = ct_Drive.TDD.ct_Signals.DATAS.Is_Pressed_NNSence_Trader ?
                                              ObjectSetInteger(0, "RLBLB-Ct_Configs-Panel-BTN-NNTrader", OBJPROP_BGCOLOR, clrMidnightBlue)      | ObjectSetInteger(0, "RLBLB-Ct_Configs-Panel-BTN-NNTrader", OBJPROP_COLOR, clrLavender) :
                                              ObjectSetInteger(0, "RLBLB-Ct_Configs-Panel-BTN-NNTrader", OBJPROP_COLOR, clrLavender)            | ObjectSetInteger(0, "RLBLB-Ct_Configs-Panel-BTN-NNTrader", OBJPROP_BGCOLOR, clrDarkCyan); //
                              bool result7  = ct_Drive.TDD.ct_Signals.DATAS.Is_Pressed_FE_Trader ?
                                              ObjectSetInteger(0, "RLBLB-Ct_Configs-Panel-BTN-FETrader", OBJPROP_BGCOLOR, clrMidnightBlue)      | ObjectSetInteger(0, "RLBLB-Ct_Configs-Panel-BTN-FETrader", OBJPROP_COLOR, clrLavender) :
                                              ObjectSetInteger(0, "RLBLB-Ct_Configs-Panel-BTN-FETrader", OBJPROP_COLOR, clrLavender)            | ObjectSetInteger(0, "RLBLB-Ct_Configs-Panel-BTN-FETrader", OBJPROP_BGCOLOR, clrDarkCyan); //
                    } //
          }



          void OnClick(bool isAllowConfig, string sparam)
          {         if(!isAllowConfig)
                    {         if(sparam == "RLBLBorderExpert-ONOFF-Trade-Config")  {PanelShow(false);}//
                              return;//
                    } //
                    if(sparam == "RLBLBorderExpert-ONOFF-Trade-Config")
                    {         PanelShow(true);//
                    }
                    if(sparam == "RLBLB-Ct_Configs-Panel-BTN-Reset")
                    {         ct_Drive.TDD.ct_Signals.DATAS.ScalpAmount_All_Trader            = 2;
                              ct_Drive.TDD.ct_Signals.DATAS.ScalpAmount_MACD_Trader           = 2.5;
                              ct_Drive.TDD.ct_Signals.DATAS.ScalpAmount_TreeSence_Trader      = 3.5;
                              ct_Drive.TDD.ct_Signals.DATAS.ScalpAmount_ArraySence_Trader     = 4.5; //
                              ct_Drive.TDD.ct_Signals.DATAS.IsReset = ~ct_Drive.TDD.ct_Signals.DATAS.IsReset;
                              bool result = ct_Drive.TDD.ct_Signals.DATAS.IsReset ? ObjectSetInteger(0, "RLBLB-Ct_Configs-Panel-BTN-Reset", OBJPROP_BGCOLOR, clrMidnightBlue) | ObjectSetInteger(0, "RLBLB-Ct_Configs-Panel-BTN-Reset", OBJPROP_COLOR, clrLavender) : ObjectSetInteger(0, "RLBLB-Ct_Configs-Panel-BTN-Reset", OBJPROP_COLOR, clrLavender) | ObjectSetInteger(0, "RLBLB-Ct_Configs-Panel-BTN-Reset", OBJPROP_BGCOLOR, clrDarkCyan); //
                              ObjectSetInteger(0, "RLBLB-Ct_Configs-Panel-BTN-Reset", OBJPROP_STATE, false);//
                    } //
                    if(sparam == "RLBLB-Ct_Configs-Panel-BTN-ScalpAmount")
                    {         //ct_Drive.TDD.ct_Signals.DATAS.ScalpAmount_MACD_Trader = NormalizeDouble(StringToDouble(ObjectGetString(0, "S_EDIT " + "RLBLB-Ct_Configs-Panel-EDT-ScalpAmount", OBJPROP_TEXT)), _Digits); //
                              ct_Drive.TDD.ct_Signals.DATAS.ScalpAmount_All_Trader = NormalizeDouble(StringToDouble(ObjectGetString(0, "S_EDIT " + "RLBLB-Ct_Configs-Panel-EDT-ScalpAmount", OBJPROP_TEXT)), _Digits); //
                              ct_Drive.TDD.ct_Signals.DATAS.Is_Active_All_TraderScalpAmount = ~ct_Drive.TDD.ct_Signals.DATAS.Is_Active_All_TraderScalpAmount ; //
                              bool result = ct_Drive.TDD.ct_Signals.DATAS.Is_Active_All_TraderScalpAmount ?
                                            ObjectSetInteger(0, "RLBLB-Ct_Configs-Panel-BTN-ScalpAmount", OBJPROP_BGCOLOR, clrMidnightBlue) | ObjectSetInteger(0, "RLBLB-Ct_Configs-Panel-BTN-ScalpAmount", OBJPROP_COLOR, clrLavender) :
                                            ObjectSetInteger(0, "RLBLB-Ct_Configs-Panel-BTN-ScalpAmount", OBJPROP_COLOR, clrLavender)       | ObjectSetInteger(0, "RLBLB-Ct_Configs-Panel-BTN-ScalpAmount", OBJPROP_BGCOLOR, clrDarkCyan); //
                              //ObjectSetInteger(0, "RLBLB-Ct_Configs-Panel-BTN-ScalpAmount", OBJPROP_STATE, false);//
                    }
                    if(sparam == "RLBLB-Ct_Configs-Panel-BTN-WaitCount")
                    {         //ObjectSetString(0, "RLBLB-Ct_Configs-Panel-EDT-WaitCount", OBJPROP_TEXT,);
                              //if(ObjectFind(0,"S_EDIT " + "RLBLB-Ct_Configs-Panel-EDT-WaitCount") < 0) Alert("not founded RLBLB-Ct_Configs-Panel-EDT-WaitCount");
                              //Alert(ObjectGetString(0,"S_EDIT " + "RLBLB-Ct_Configs-Panel-EDT-WaitCount", OBJPROP_TEXT));
                              ct_Drive.TDD.ct_Start.Max_Candel_Wating_After_Win = (int)ObjectGetString(0, "S_EDIT " + "RLBLB-Ct_Configs-Panel-EDT-WaitCount", OBJPROP_TEXT); //
                              //ObjectGetInteger(0, "RLBLB-Ct_Configs-Panel-BTN-WaitCount", OBJPROP_STATE) ?           /*when create it seted default flase not keep value of key*/
                              //ObjectSetInteger(0, "RLBLB-Ct_Configs-Panel-BTN-WaitCount", OBJPROP_STATE, false) :
                              //ObjectSetInteger(0, "RLBLB-Ct_Configs-Panel-BTN-WaitCount", OBJPROP_STATE, true);
                              ct_Drive.TDD.ct_Start.Is_Candel_Wating_After_Win = ~ct_Drive.TDD.ct_Start.Is_Candel_Wating_After_Win;
                              bool result = ct_Drive.TDD.ct_Start.Is_Candel_Wating_After_Win ?
                                            ObjectSetInteger(0, "RLBLB-Ct_Configs-Panel-BTN-WaitCount", OBJPROP_BGCOLOR, clrMidnightBlue) | ObjectSetInteger(0, "RLBLB-Ct_Configs-Panel-BTN-WaitCount", OBJPROP_COLOR, clrLavender) :
                                            ObjectSetInteger(0, "RLBLB-Ct_Configs-Panel-BTN-WaitCount", OBJPROP_COLOR, clrLavender)       | ObjectSetInteger(0, "RLBLB-Ct_Configs-Panel-BTN-WaitCount", OBJPROP_BGCOLOR, clrDarkCyan); //
                    }
                    //RLBLB-Ct_Configs-Panel-BTN-ScalpAll
                    if(sparam == "RLBLB-Ct_Configs-Panel-BTN-TreeTrader")
                    {         ct_Drive.TDD.ct_Signals.DATAS.Is_Pressed_TreeSence_Trader = ~ct_Drive.TDD.ct_Signals.DATAS.Is_Pressed_TreeSence_Trader; //
                              bool result = ct_Drive.TDD.ct_Signals.DATAS.Is_Pressed_TreeSence_Trader ?
                                            ObjectSetInteger(0, "RLBLB-Ct_Configs-Panel-BTN-TreeTrader", OBJPROP_BGCOLOR, clrMidnightBlue) | ObjectSetInteger(0, "RLBLB-Ct_Configs-Panel-BTN-TreeTrader", OBJPROP_COLOR, clrLavender) :
                                            ObjectSetInteger(0, "RLBLB-Ct_Configs-Panel-BTN-TreeTrader", OBJPROP_COLOR, clrLavender)       | ObjectSetInteger(0, "RLBLB-Ct_Configs-Panel-BTN-TreeTrader", OBJPROP_BGCOLOR, clrDarkCyan); //
                              //
                    }//
                    if(sparam == "RLBLB-Ct_Configs-Panel-BTN-MACDTrader")
                    {         ct_Drive.TDD.ct_Signals.DATAS.Is_Pressed_MACD_Trader = ~ct_Drive.TDD.ct_Signals.DATAS.Is_Pressed_MACD_Trader; //
                              bool result = ct_Drive.TDD.ct_Signals.DATAS.Is_Pressed_MACD_Trader ?
                                            ObjectSetInteger(0, "RLBLB-Ct_Configs-Panel-BTN-MACDTrader", OBJPROP_BGCOLOR, clrMidnightBlue) | ObjectSetInteger(0, "RLBLB-Ct_Configs-Panel-BTN-MACDTrader", OBJPROP_COLOR, clrLavender) :
                                            ObjectSetInteger(0, "RLBLB-Ct_Configs-Panel-BTN-MACDTrader", OBJPROP_COLOR, clrLavender)       | ObjectSetInteger(0, "RLBLB-Ct_Configs-Panel-BTN-MACDTrader", OBJPROP_BGCOLOR, clrDarkCyan); //
                              //
                    }//
                    if(sparam == "RLBLB-Ct_Configs-Panel-BTN-MACDTrader-Solo")
                    {         ct_Drive.TDD.ct_Signals.DATAS.Is_Pressed_MACDSolo_Trader = ~ct_Drive.TDD.ct_Signals.DATAS.Is_Pressed_MACDSolo_Trader; //
                              bool result = ct_Drive.TDD.ct_Signals.DATAS.Is_Pressed_MACDSolo_Trader ?
                                            ObjectSetInteger(0, "RLBLB-Ct_Configs-Panel-BTN-MACDTrader-Solo", OBJPROP_BGCOLOR, clrMidnightBlue) | ObjectSetInteger(0, "RLBLB-Ct_Configs-Panel-BTN-MACDTrader-Solo", OBJPROP_COLOR, clrLavender) :
                                            ObjectSetInteger(0, "RLBLB-Ct_Configs-Panel-BTN-MACDTrader-Solo", OBJPROP_COLOR, clrLavender)       | ObjectSetInteger(0, "RLBLB-Ct_Configs-Panel-BTN-MACDTrader-Solo", OBJPROP_BGCOLOR, clrDarkCyan); //
                              //
                    }//
                    if(sparam == "RLBLB-Ct_Configs-Panel-BTN-NNTrader")
                    {         ct_Drive.TDD.ct_Signals.DATAS.Is_Pressed_NNSence_Trader = ~ct_Drive.TDD.ct_Signals.DATAS.Is_Pressed_NNSence_Trader; //
                              bool result = ct_Drive.TDD.ct_Signals.DATAS.Is_Pressed_NNSence_Trader ?
                                            ObjectSetInteger(0, "RLBLB-Ct_Configs-Panel-BTN-NNTrader", OBJPROP_BGCOLOR, clrMidnightBlue) | ObjectSetInteger(0, "RLBLB-Ct_Configs-Panel-BTN-NNTrader", OBJPROP_COLOR, clrLavender) :
                                            ObjectSetInteger(0, "RLBLB-Ct_Configs-Panel-BTN-NNTrader", OBJPROP_COLOR, clrLavender)       | ObjectSetInteger(0, "RLBLB-Ct_Configs-Panel-BTN-NNTrader", OBJPROP_BGCOLOR, clrDarkCyan); //
                              //
                    }//
                    if(sparam == "RLBLB-Ct_Configs-Panel-BTN-FETrader")
                    {         ct_Drive.TDD.ct_Signals.DATAS.Is_Pressed_FE_Trader = ~ct_Drive.TDD.ct_Signals.DATAS.Is_Pressed_FE_Trader; //
                              bool result = ct_Drive.TDD.ct_Signals.DATAS.Is_Pressed_FE_Trader ?
                                            ObjectSetInteger(0, "RLBLB-Ct_Configs-Panel-BTN-FETrader", OBJPROP_BGCOLOR, clrMidnightBlue) | ObjectSetInteger(0, "RLBLB-Ct_Configs-Panel-BTN-FETrader", OBJPROP_COLOR, clrLavender) :
                                            ObjectSetInteger(0, "RLBLB-Ct_Configs-Panel-BTN-FETrader", OBJPROP_COLOR, clrLavender)       | ObjectSetInteger(0, "RLBLB-Ct_Configs-Panel-BTN-FETrader", OBJPROP_BGCOLOR, clrDarkCyan); //
                              //
                    }//
          }


          //
          //
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class St_Drive_Data ////heap and stack!///not efected
{
public:
          St_Drive_Data()
          {         //
                    //ct_Drive.TDD.ct_Configs.IsActiveEvents_Shapes     = true;
                    //ct_Drive.TDD.ct_Configs.IsActiveChannel_Shapes    = true;
                    //ct_Drive.TDD.ct_Configs.IsActivePivots_Shapes     = true;//mean not shown
                    //ct_Drive.TDD.ct_Configs.IsActiveMACD_Shapes       = true;
                    //ct_Drive.TDD.ct_Configs.IsActiveBook_Shapes       = true;
                    //ct_Drive.TDD.ct_Configs.IsActive_CHSD_Shapes      = true;
                    //ct_Drive.TDD.ct_Configs.IsActive_RRBoxs_Shapes    = true;
                    //ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid.Update();
          };
          ~St_Drive_Data() {};
          //---------------------------------------
          St_Size                  st_Size;//--must be solid to cover all opration
          Ct_Account               ct_Account;
          Ct_Market_Symbol         ct_Market_Symbol;
          Ct_Order                 ct_Order;
          //-----------------------------
          Ct_Ticket                ct_Ticket;
          Ct_Bank                  ct_Bank;//       ct_NanoBank;         //miniBank(1, -3);
          Ct_Conductor             ct_Conductor;         //ct_Drive.TDD.ct_Conductor.
          Ct_Signals               ct_Signals;
          //---------------------------------
          Ct_Configs               ct_Configs;
          //---------------------------------
          Ct_StopLoss              ct_StopLoss;                   //
          Ct_TakeProfit            ct_TakeProfit;                   //
          Ct_Pending               ct_Pending;                   //
          Ct_RiskReward            ct_RiskReward;                   //
          Ct_Size                  ct_Size;
          Ct_SetPrices             ct_SetPrices;                   //
          Ct_SCMETime              ct_SCMETime;
          //---------------------------------------------------------------
          Ct_Start                 ct_Start;
          Ct_End                   ct_End;
          Ct_Modify                ct_Modify;//
}; //St_Drive_Data TDD;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class Ct_Drive: public Global_Object
{
public:///for many traders

          St_Drive_Data         TDD;

//=======================================================================
public://Clase base Function
          void                  Ct_Drive();     ///////default
          void                  ~Ct_Drive();    ///////default  Just One

          bool                  Update();
          bool                  UPDATED;
          bool                  Manager(int Sl_Fixed_Pip);
          bool                  MANAGED;
          Et_Trade_Mode         Etf_Trade_Mode;
          bool                  IS_TREE_SCALP_ACTIVE_Pub;//= true;
          //=======================================================================
          bool                  Get_Symbol_Account_Market_Data();
          bool                  GETDATA;
          double                Efficiently_Percent;
          double                Efficiently_Percent_Sell;
          double                Efficiently_Percent_Buy;
public:   //======================================================
          MqlTick               last_tick;
          //==========================================================
          // SYS App Enviroments                                     |
          //==========================================================
          union                 U_Staticer;//        union Ct_Drive::U_Staticer;//<<<not accepted///'Ct_Drive' - identifier already used
          U_Staticer               StaticS();
          //==========================================================
          // SYS App Enviroments                                     |
          //==========================================================
          int                    OpenPos_Count(const int Type);
          double                 AVG_Price();
          double                 All_Profits();
          double                 All_Points();
          //======================================================
};//
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
Ct_Drive::~Ct_Drive()
{         if(Capitan_DeinitErrorCatching)________________________________________________________Xerorr.SuperviserX(_LastError, "-Ct_Drive Error", __LINE__, __FUNCTION__); //|
          return; //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
Ct_Drive::Ct_Drive()///////default
{         RunCallFunction++;//==========================================================FristOf allLoading
          Get_Symbol_Account_Market_Data();
          this.Error();
          return; //;
} //
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Ct_Drive::Update()
{         //
          ct_Drive_Pad_Inputs.Update(300);  //---input update
          if(!ct_Drive_Pad_Inputs.Is_Update)    {Alert(__FUNCTION__ + "  ct_Drive_Pad_Inputs.MANAGED : ",  ct_Drive_Pad_Inputs.MANAGED );}//
          if(ct_Drive_Pad_Inputs.MANAGED) {}
          //================================================================================================================================
          UPDATED = true;
          //________________________________________________________Xerorr.SuperviserX(_LastError, "-Ct_Drive Error", __LINE__, __FUNCTION__); //Sleep(10); //
          if(UPDATED)                                   {      this.Manager(300); } // Status Ct_Drive Manager SYS App Enviroments            |#1
          if(MANAGED)                                   {       Etf_Trade_Mode = Et_Update_Conductor;   TDD.ct_Conductor.Update(); }    // Status Trade Conditions App watch Enviroments           |#4
          /*if(TDD.ct_Conductor.UPDATED*//*lag 1 min)*/ {       /*signal Update*/                       TDD.ct_Signals.Update();  }
          if(true/*TDD.ct_Bank.UPDATED*/)               {       Etf_Trade_Mode = Et_Update_Tickets;     TDD.ct_Ticket.Update(); }       // Status Trade ct_Ticket  App Enviroments                    |#2
          if(true/*TDD.ct_Ticket.UPDATED*/)             {       Etf_Trade_Mode = Et_Update_Bank;        TDD.ct_Bank.Update(); }         // Status Trade 'SetPrices' App Levels Enviroments         |#3 Prapare to trade
          /*if(TDD.ct_Conductor.UPDATED)*/              {       Etf_Trade_Mode = Et_Update_Order;       TDD.ct_Order.Update(); }        // Status Trade Ordering App Conditions watch Enviroments  |#5
          _ACTOR_.Update();//
          //=========================================================+
          // Status Trade Cheack App Conditions watch Enviroments    |#6 CheackAll
          //=========================================================+
          UPDATED = (MANAGED && TDD.ct_Ticket.UPDATED &&  TDD.ct_Bank.UPDATED  && TDD.ct_Signals.UPDATED && TDD.ct_Order.UPDATED);   //---&& TDD.ct_Conductor.UPDATED update by ne bar detection
          if(!UPDATED) {Alert(__FUNCTION__ + "   failed update");};
          //==========================================================
          // Trade App Cheack END Working Local Enviroments          |
          //==========================================================
          //________________________________________________________Xerorr.SuperviserX(_LastError, "-Ct_Drive Error", __LINE__, __FUNCTION__);
          return UPDATED; //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Ct_Drive::Manager(int Sl_Fixed_Pip)
{         if(MANAGED) { MANAGED = false;}//when recall///force to recalc
          if(!MANAGED)
          {         //---off---int SizeIntTicketList = ArrayResize(IntTicketList, ct_Start._Tickets.Num_All_Index); //
                    //======================== //filling///
                    //---off---ArrayCopy(IntTicketList, ct_Start._Tickets.Num_BuyMarket, 0, 0, WHOLE_ARRAY); //
                    //---off---ArrayCopy(IntTicketList, ct_Start._Tickets.Num_SellMarket, ct_Start._Tickets.Num_BuyMarket_Size, 0, WHOLE_ARRAY); //
                    //==============================================================================================================================
                    Get_Symbol_Account_Market_Data();
                    if(!GETDATA)                         {Alert(__FUNCTION__ + "  GETDATA: ",               GETDATA);} //
                    MANAGED = true; //
                    if(MANAGED) {  return MANAGED = true;} //
                    else {Alert(" Status Ct_Drive Manager SYS App Enviroments.MANAGED: ", MANAGED);}//
          } //
          return MANAGED = false; //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
U_Staticer Ct_Drive::StaticS() {U_Staticer Dexpoer; return Dexpoer; }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string ifString(bool isPip, string DescOne, string DescTwo)
{         //string ifString(digits == pipDigits, "", "'")
          return "'"; //
}
//+------------------------------------------------------------------+
//| OpenPos                                                          |
//+------------------------------------------------------------------+
int Ct_Drive::OpenPos_Count(const int Type)
{         int count = 0;
          for(int i = 0; i < OrdersTotal(); i++)
          {         if(OrderSelect(i, SELECT_BY_POS, MODE_TRADES))
                    {         if(OrderSymbol() == _Symbol || OrderMagicNumber() ==  TDD.ct_Bank.MagicNumber)
                              {         if(OrderType() == OP_SELL && Type == OP_SELL)  count++;
                                        if(OrderType() == OP_BUY &&  Type == OP_BUY)   count++;
                                        if(OrderType() <= OP_SELL && Type == OP_ALL)   count++;//
                              }//
                    }//
          }//
          return(count);//
}
//+------------------------------------------------------------------+
//| ØOpenPrice                                                       |
//+------------------------------------------------------------------+
double Ct_Drive::AVG_Price()
{         double ordlots        = 0;
          double price          = 0;
          double avgprice       = 0;
          if(OrdersTotal() >= 1)
          {         ordlots = 0.00001; //
                    for(int i = OrdersTotal() - 1; i >= 0; i--)
                    {         if(OrderSelect(i, SELECT_BY_POS, MODE_TRADES))
                              {         if(OrderSymbol() == _Symbol && OrderMagicNumber() ==  TDD.ct_Bank.MagicNumber)////OR all trading form
                                        {         if(OrderType() <= OP_SELL) //MarketOrdersOnly///SELL OR BUY
                                                  {         ordlots += OrderLots();
                                                            price += OrderLots() * OrderOpenPrice(); //
                                                  }//
                                        }//
                              }//
                    }//
          }//
          avgprice = price / ordlots;//-- CalcAvgPrice
          return(avgprice);//
}
//+------------------------------------------------------------------+
//| FloatingProfits                                                  |
//+------------------------------------------------------------------+
double Ct_Drive::All_Profits()
{         double profit = 0;
          for(int i = OrdersTotal() - 1; i >= 0; i--)
          {         if(OrderSelect(i, SELECT_BY_POS, MODE_TRADES))
                    {         if(OrderSymbol() == _Symbol && OrderMagicNumber() ==  TDD.ct_Bank.MagicNumber)
                              {         if(OrderType() <= OP_SELL) //MarketOrdersOnly
                                        {         profit += OrderProfit() + OrderCommission() + OrderSwap(); }//
                              }//
                    }//
          }
          return(profit);//
}
//+------------------------------------------------------------------+
//| FloatingPoints                                                   |
//+------------------------------------------------------------------+
double Ct_Drive::All_Points()
{         double sellpts = 0;
          double buypts = 0;
//--
          for(int i = OrdersTotal() - 1; i >= 0; i--)
          {         if(OrderSelect(i, SELECT_BY_POS, MODE_TRADES))
                    {         if(OrderSymbol() == _Symbol && OrderMagicNumber() ==  TDD.ct_Bank.MagicNumber)
                              {         if(OrderType() == OP_SELL)
                                                  sellpts += (OrderOpenPrice() - OrderClosePrice()) / _Point;
                                        if(OrderType() == OP_BUY)
                                                  buypts += (OrderClosePrice() - OrderOpenPrice()) / _Point;//
                              }//
                    }//
          }
          return(sellpts + buypts);//
}


//+------------------------------------------------------------------+
//| Gets basic info on Symbol and Account. It remains unchanged.     |
//+------------------------------------------------------------------+
bool Ct_Drive::Get_Symbol_Account_Market_Data()
{         //Alert("Start-Stack error " + __FUNCTION__);
          GETDATA = false;
          TDD.ct_Account.Update(TDD.st_Size, Equity_Fixed_Inp); //
          TDD.ct_Market_Symbol.UpdateAll();//
          //==========================================================
          if(TDD.ct_Account.UPDATED && TDD.ct_Market_Symbol.UPDATEDAll )GETDATA = true;
          //==========================================================
          return GETDATA; //
}

//+------------------------------------------------------------------+
//|             Class Ct_Drive     BEGIN-END                         |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
