//+------------------------------------------------------------------+
//||   ||||||||||                 eTradePanel.mqh                   ||Ctp_TRADER
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
#property copyright "A pourya 2021"
#property link      "@prymhdvgmail.com"
#property version   "1.00"
#property strict
//+------------------------------------------------------------------+
//|             Class MyRoboTrader_Ct_TICKET::BEGIN                   |
//+------------------------------------------------------------------+
#define  DefMagicNumber      0
#define  DefMin_LossTicket   1
#define  DefMax_LossTicket   2
#define  DefMin_ProfitTicket 3
#define  DefMax_ProfitTicket 4

#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOTB\St_Ticket_Modifier.mqh >
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOTB\St_Ticket_Counter.mqh >
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOTB\St_Ticket_Info.mqh >
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOTB\St_Ticket_New.mqh >
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOTB\St_Ticket_Last.mqh >
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOTB\St_Ticket_Check.mqh >
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOTB\St_Ticket_Active.mqh >

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class Ct_Ticket
{
private:
public:
          void                  Ct_Ticket();
          void                  ~Ct_Ticket() {};
          bool                  Update();
          bool                  UPDATED, InerUPDATED;
          bool                  Manager();
          bool                  MANAGED;
          St_Orders              _Order_Last;
          void                  getLastTicket()  { bool IsBasic_Selected_Last  = OrderSelect(OrdersHistoryTotal() - 1, SELECT_BY_POS, MODE_HISTORY);    if(IsBasic_Selected_Last)_Order_Last.set( OrderTicket());    }
//===================================================================
          string                m_name;
          int                   m_index;
          int                   Pre_TicketCom;
          //---
          St_Ticket_Counter     Counter;
          St_Ticket_Info        _Info;
          St_Ticket_Modifier    _Modifier;
          St_Ticket_New         _New;
          St_Ticket_Last        _Last;
          St_Ticket_Check       _Check;
          St_Ticket_Active      _Active;
//===================================================================
          bool                  TicketObjArrayReset(Ct_Ticket &TicketObjArrayCom[]);

          bool                  Ticket_To_TicketObj_Single(int TicketCom, Ct_Ticket &TicketObjOut, int _SelectMode = SELECT_BY_TICKET, int _PoolMode = MODE_TRADES);
          bool                  Ticket_To_TicketObj(int &TicketArrayCom[], Ct_Ticket &TicketObjArrayOut[], int _SelectMode = SELECT_BY_TICKET, int _PoolMode = MODE_TRADES);

          bool                  GetFiledsStatus(int TicketCom, Ct_Ticket &TicketObjOut, int _SelectMode = SELECT_BY_TICKET, int _PoolMode = MODE_TRADES);// order object set values

          bool                  SelectTicket                    (int TicketCom,      int _SelectMode = SELECT_BY_TICKET, int _PoolMode = MODE_TRADES);//SELECT_BY_POS //MODE_HISTORY//
          bool                  SelectTicket_By_Array           (int &TicketCom[],   int _SelectMode = SELECT_BY_TICKET, int _PoolMode = MODE_TRADES);//SELECT_BY_POS //MODE_HISTORY//

          bool                  SelectTicket_By_Obj             (Ct_Ticket &ObjCom,   int _SelectMode = SELECT_BY_TICKET, int _PoolMode = MODE_TRADES);//SelectTicket(TicketCom, SELECT_BY_TICKET, MODE_TRADES);
          bool                  SelectTicket_By_Obj_Array       (Ct_Ticket &ObjCom[], int _SelectMode = SELECT_BY_TICKET, int _PoolMode = MODE_TRADES);//
//===================================================================#1
          int                   Get_TicketsNumber(int &IntTicketListAllCom[], string f_symbol = "", int f_cmd = - 1, int f_magic = - 1);
          //---
          int                   Int_TicketListAll[], IntTicketListBuyMarket[], IntTicketListBuyLimit[], IntTicketBuyStop[], IntTicketListSellMarket[], IntTicketListSellLimit[], IntTicketSellStop[];
//===================================================================

//---
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
Ct_Ticket::Ct_Ticket()
{         //Alert("Ct_Ticket::Ct_Ticket()(1)");
          Update();
          //Alert("Ct_Ticket::Ct_Ticket()(2)"); --bypassed issus
          //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Ct_Ticket::Update()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADER Error", __LINE__, __FUNCTION__); //
          getLastTicket();
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADER Error", __LINE__, __FUNCTION__); //
          if(InerUPDATED) return UPDATED =  false;
          else           //----
          {
                    {         _Modifier.TrailStop                     = 10;
                              _Modifier.TrailStopDef                  = 10;
                              _Modifier.TrailStopStep                 = 5;
                              _Modifier.Is_TrailStop                  = _Modifier.TrailStop > 0;//Defined
                              //----
                              _Modifier.MinProfit                     = 50;
                              _Modifier.MinProfitDef                  = 150;
                              _Modifier.MinProfitStep                 = 5;
                              _Modifier.Is_MinProfit                  = _Modifier.MinProfit > 0;//Defined
                              //----
                              _Modifier.MaxProfit                     = 100 + 50;
                              _Modifier.MaxProfitDef                  = 100 + 150;
                              _Modifier.MaxProfitStep                 = 100 + 5;
                              _Modifier.Is_MaxProfit                  = _Modifier.MaxProfit > 0;//Defined//
                    }//
                    ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADER Error", __LINE__, __FUNCTION__); //
                    _Active.Is_Ticket();//
                    _Active.Is_TicketMarket();    _Active.Is_TicketMarketSell();          _Active.Is_TicketMarketBuy();
                    _Active.Is_TicketPending();   _Active.Is_TicketPendingSellLimit();    _Active.Is_TicketPendingSellStop();     _Active.Is_TicketPendingBuyLimit();     _Active.Is_TicketPendingBuyStop();//
                    ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADER Error", __LINE__, __FUNCTION__); //
                    //Alert("Ct_Ticket::Ct_Ticket()(01)");
                    //00//prpose of function????>>>>>[Modifications by model is true]
                    //00//Logic of function???  >>>>>[Is_Ticket] , [cheak Selection valure type] ,[pack tickets], [cheak global valuse],[Modifications by model is true]
                    //--when any tickt is found...
                    ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADER Error", __LINE__, __FUNCTION__); //
                    if(_Active.Is_Ticket())
                    {         //
                              _Check.Is_SELECT_BY_POS_MODE_TRADES = SelectTicket(0, SELECT_BY_POS, MODE_TRADES); //Gone Pos mode search...select pose zero...mean can get .
                              //
                              if(_Check.Is_SELECT_BY_POS_MODE_TRADES && _Check.Is_Alive())
                              {         //Alert("Ct_Ticket::Ct_Ticket()(001)");
                                        //---- when GetTickets
                                        if(Get_TicketsNumber(Int_TicketListAll, StSymbol.Current, -1, -1) > -1)
                                        {         //Alert("Ct_Ticket::Ct_Ticket()(0001)");
                                                  if(Ticket_To_TicketObj(Int_TicketListAll, Obj_TicketList, SELECT_BY_TICKET, MODE_TRADES))
                                                  {};//
                                                  //Alert("Ct_Ticket::Ct_Ticket()(0003)");//
                                        }; //
                              } //
                    }
                    ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADER Error", __LINE__, __FUNCTION__); //
                    Counter._TotalAll  = OrdersTotal();
                    this.Manager();
                    Counter.Manager();
                    //============================================================================================
          }
          //Alert("Ct_Ticket::Ct_Ticket()(02)");
          if(this.MANAGED)UPDATED = true; //
          if(UPDATED) { InerUPDATED = false; return UPDATED = true;} //;
          else {Alert("Status Trade TicketManager App Enviroments.UPDATED: ", UPDATED);}
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADER Error", __LINE__, __FUNCTION__); //
          return UPDATED = false; //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Ct_Ticket::Manager()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADER Error", __LINE__, __FUNCTION__); //
          MANAGED = false;
          //
          if(ct_Drive.TDD.ct_Market_Symbol.Is_Running && TRADER_Panel_DATA.IsTicketManage && _Active.Is_TICKET)//if(IsConnected&&KeyRunMarket)
          {         Counter.Manager();
                    //
                    ct_Drive.TDD.ct_Start._Comments.SellMarket = "[SM:" + IntegerToString(Counter._SellMarket    + 1) + "|Total:" + IntegerToString(Counter._SellTotal + 1) + ct_Drive.TDD.ct_Signals.DATAS.Decition_All_SignalEstimateOut.Desc;                  ; //unresolved static variable 'C_TRADER::argTicketIndexer' Capitan.mqh         2131      3
                    ct_Drive.TDD.ct_Start._Comments.SellLimit  = "[SL:" + IntegerToString(Counter._SellLimit     + 1) + "|Total:" + IntegerToString(Counter._SellTotal + 1) + ct_Drive.TDD.ct_Signals.DATAS.Decition_All_SignalEstimateOut.Desc; //+ "_Total: "
                    ct_Drive.TDD.ct_Start._Comments.SellStop   = "[SS:" + IntegerToString(Counter._SellStop      + 1) + "|Total:" + IntegerToString(Counter._SellTotal + 1) + ct_Drive.TDD.ct_Signals.DATAS.Decition_All_SignalEstimateOut.Desc;
                    ct_Drive.TDD.ct_Start._Comments.BuyMarket  = "[BM:" + IntegerToString(Counter._BuyMarket     + 1) + "|Total:" + IntegerToString(Counter._BuyTotal  + 1) + ct_Drive.TDD.ct_Signals.DATAS.Decition_All_SignalEstimateOut.Desc; //"Sell-Market_Put:"
                    ct_Drive.TDD.ct_Start._Comments.BuyLimit   = "[BL:" + IntegerToString(Counter._BuyLimit      + 1) + "|Total:" + IntegerToString(Counter._BuyTotal  + 1) + ct_Drive.TDD.ct_Signals.DATAS.Decition_All_SignalEstimateOut.Desc;
                    ct_Drive.TDD.ct_Start._Comments.BuyStop    = "[BS"  + IntegerToString(Counter._BuyStop       + 1) + "|Total:" + IntegerToString(Counter._BuyTotal  + 1) + ct_Drive.TDD.ct_Signals.DATAS.Decition_All_SignalEstimateOut.Desc; //
                    MANAGED = true;//
                    //
          }
          else {MANAGED = true;}
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADER Error", __LINE__, __FUNCTION__); //
          return MANAGED; //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Ct_Ticket::TicketObjArrayReset(Ct_Ticket & TicketObjArrayCom[])
{         Ct_Ticket TicketObjComNULL;
          int SizeGet = ArraySize(TicketObjArrayCom);
          for(int i = 0 ; SizeGet - 1 > i ; i++) { TicketObjArrayCom[i]._Info.ct_Ticket = NULL;  TicketObjArrayCom[i] = TicketObjComNULL; }
          return true;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Ct_Ticket::Ticket_To_TicketObj_Single(int TicketCom, Ct_Ticket & TicketObjOut, int _SelectMode = SELECT_BY_TICKET, int _PoolMode = MODE_TRADES)
{         return GetFiledsStatus( TicketCom, TicketObjOut, _SelectMode, _PoolMode);}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Ct_Ticket::Ticket_To_TicketObj(int &TicketArrayCom[], Ct_Ticket & TicketObjArrayOut[], int _SelectMode = SELECT_BY_TICKET, int _PoolMode = MODE_TRADES)
{         //===================================================================
          //---input..Output....
          //---
          //--- int           &TicketArrayCom[];
          //--- Ct_Ticket      &TicketObjArrayOut[];
          //--- int           _SelectMode           = SELECT_BY_TICKET;
          //--- int           _PoolMode             = MODE_TRADES;
          //---input..Output....
          //---
          //00//prpose of function????>>>>>[Get Tickets ToPack as TicketObj]
          //00//Logic of function???  >>>>>[Get tickets Array] , [cheak same range arrays ] ,[pack tickets], [cheak global valuse],[Modifications by model is true]
          bool Result                   = false;//
          if(false)
          {         int  Sizeof_TicketArrayCom       = ArraySize(TicketArrayCom);
                    //---cheak size
                    if(false)
                    {         if(Sizeof_TicketArrayCom > -1)
                              {         //return Result;
                                        int       Num_element     = ArrayResize(TicketObjArrayOut, Sizeof_TicketArrayCom); Sleep(500);
                                        bool      Is_Num_element  = Num_element == -1;
                                        if(Is_Num_element)return false; //
                              } ///mean cant resize..
                    }
                    //---------------------------------------------------------------------------------------------------------------------------------------------
                    //---
                    bool          ResultArray[];
                    ResultSTR     ResultSelect[];
                    //----
                    if(Sizeof_TicketArrayCom > -1) {      if(!(ArrayResize(ResultArray, Sizeof_TicketArrayCom) == -1))      return false;} ////
                    if(Sizeof_TicketArrayCom > -1) {      if(!(ArrayResize(ResultSelect, Sizeof_TicketArrayCom) == -1))     return false;} ////
                    //Alert("bool Ct_Ticket::Ticket_To_TicketObj");
                    //---Catch results [filling ResultArray]
                    for(int i = 0 ; i < Sizeof_TicketArrayCom - 1 ; i++)
                    {         ResultSelect[i].index = i;
                              //-- array out of range happen.. //--- [risk of stack over flow] --solve...
                              ResultSelect[i].result = ResultArray[i] = Result =  Ticket_To_TicketObj_Single(TicketArrayCom[i], TicketObjArrayOut[i], _SelectMode, _PoolMode);//
                    }
                    //---[Cheack Results]
                    for(int i = 0 ; i < Sizeof_TicketArrayCom - 1 ; i++)
                    {         if(!ResultArray[i]) {Result = false;}
                              if(!ResultSelect[i].result) {ResultSelect[0].countFalse++; }//
                    }
                    //============================================================================================
                    if(true)//--errorr out of range.... bypass needed..
                    {         if(!ResultSelect[0].countFalse > 0) {Result = false;}
                              else {Result = true;}//
                    } //
                    //============================================================================================
          }//
          return Result;  //has no mode[in]  ct_Order index or order ticket depending on the second parameter.
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Ct_Ticket::GetFiledsStatus(int TicketCom, Ct_Ticket & TicketObjOut, int _SelectMode = SELECT_BY_TICKET, int _PoolMode = MODE_TRADES)
{         //==============================================
          // int Size = ArrayResize(ObjCom, OrdersTotal()); //error//isnt array..
          if(TicketCom != Pre_TicketCom ) {Pre_TicketCom = TicketCom; m_index++;}
          //---
          if(SelectTicket(TicketCom, _SelectMode, _PoolMode)) //  if(OrderSelect(TicketCom, SELECT_BY_TICKET, MODE_TRADES))
          {         //--- Set ct_Ticket info
                    {         TicketObjOut._Info.ct_Ticket       = OrderTicket();//|| TicketCom//Last_Number
                              TicketObjOut._Info.OpenPrice    = OrderOpenPrice();
                              TicketObjOut._Info.OpenTime     = OrderOpenTime();
                              TicketObjOut._Info.ClosePrice   = OrderClosePrice();
                              TicketObjOut._Info.CloseTime    = OrderCloseTime();
                              TicketObjOut._Info.Comment      = OrderComment();
                              TicketObjOut._Info.Commission   = OrderCommission();
                              TicketObjOut._Info.Expiration   = OrderExpiration();
                              TicketObjOut._Info.Lots         = OrderLots();
                              TicketObjOut._Info.MagicNumber  = OrderMagicNumber();
                              TicketObjOut._Info.Profit       = OrderProfit();//The net profit value (without swaps or commissions) for the selected order.
                              TicketObjOut._Info.StopLoss     = OrderStopLoss();
                              TicketObjOut._Info.TakeProfit   = OrderTakeProfit();
                              TicketObjOut._Info.Swap         = OrderSwap();
                              TicketObjOut._Info.Symbol       = OrderSymbol();
                              TicketObjOut._Info.Type         = OrderType();
                              TicketObjOut._Info.Opposite     = 0; //
                              TicketObjOut._Info.PriceToClose = 0;
                              TicketObjOut._Info.Slippage     = ct_Drive.TDD.ct_Market_Symbol.Slippage; //
                              //---
                              if((TicketObjOut._Info.Type == OP_SELL) || (TicketObjOut._Info.Type == OP_SELLLIMIT) || (TicketObjOut._Info.Type == OP_SELLSTOP) ) {TicketObjOut._Info.PriceToClose = Bid;}
                              else {TicketObjOut._Info.PriceToClose = Ask;};   // close price if Buy?>> sell?>>
                              //---
                              TicketObjOut._Info.ArrowColor  = clrAzure; // color
                              //---
                              if((TicketObjOut._Info.Type == OP_SELL) || (TicketObjOut._Info.Type == OP_SELLLIMIT) || (TicketObjOut._Info.Type == OP_SELLSTOP) ) {TicketObjOut._Info.ArrowColor = clrRed;}
                              else {TicketObjOut._Info.ArrowColor = clrAzure;};
                              //
                              TicketObjOut._Info.HistoryTotal = OrdersHistoryTotal();//Returns the number of closed orders in the account history loaded into the terminal.
                              TicketObjOut._Info.Total        = OrdersTotal();//Returns the number of market and pending orders.
                    }//
                    //--- Cheak ct_Ticket info
                    {         _Check.Is_Ticket_Alive                = TicketObjOut._Info.CloseTime == 0;
                              _Check.Is_Pending                     = TicketObjOut._Info.Type >  OP_SELL;
                              _Check.Is_Market                      = TicketObjOut._Info.Type <  OP_BUYLIMIT;
                              //---
                              _Check.Is_Last_Type_OP_SELL           = TicketObjOut._Info.Type == OP_SELL;
                              _Check.Is_Last_Type_OP_BUY            = TicketObjOut._Info.Type == OP_BUY;
                              _Check.Is_Last_Type_OP_SELLLIMIT      = TicketObjOut._Info.Type == OP_SELLLIMIT;
                              _Check.Is_Last_Type_OP_SELLSTOP       = TicketObjOut._Info.Type == OP_SELLSTOP;
                              _Check.Is_Last_Type_OP_BUYLIMIT       = TicketObjOut._Info.Type == OP_BUYLIMIT;
                              _Check.Is_Last_Type_OP_BUYSTOP        = TicketObjOut._Info.Type == OP_BUYSTOP;
                              //---
                              _Check.Is_Buying                      = TicketObjOut._Info.StopLoss           <  TicketObjOut._Info.OpenPrice; //Last_Type == OP_BUY; //OrderStopLoss() < OrderOpenPrice();
                              _Check.Is_Selling                     = TicketObjOut._Info.StopLoss           >  TicketObjOut._Info.OpenPrice; //Last_Type == OP_SELL; //OrderStopLoss() > OrderOpenPrice();
                              _Check.Is_Last_StopLossZero           = TicketObjOut._Info.StopLoss           == 0;//
                              _Check.Is_Last_TakeProfitZero         = TicketObjOut._Info.TakeProfit         == 0;//
                              _Check.Is_ExactSymbol                 = TicketObjOut._Info.Symbol             == Symbol();//      StSymbol.Current
                              _Check.Is_ExactMagicNumber            = TicketObjOut._Info.MagicNumber        ==  ct_Drive.TDD.ct_Bank.MagicNumber; //
                              //---
                              _Last.PointDistanceSell               = MathAbs(TicketObjOut._Info.OpenPrice - Bid);  ///Sells closeby Buy  op
                              _Last.PointDistanceBuy                = MathAbs(TicketObjOut._Info.OpenPrice - Ask);  ///Buys  closeby Sell op
                              //---
                              //>>>Change double to int>>>by percing
                              _Check.Is_DistanceBuyTouchTrailStop   = _Last.PointDistanceBuy  >= _Modifier.NewTrailStop; /////InTrade Profite|Losse bigger than trailstop
                              _Check.Is_DistanceSellTouchTrailStop  = _Last.PointDistanceSell >= _Modifier.NewTrailStop; //// InTrade Profite|Losse bigger than trailstop
                              //BuyTargetTP                  = Ask + New_TrailStop;
                              //SellTargetTP                 = Bid - New_TrailStop;
                              {         _Check.Is_Buying ? _New.OpenPrice = TicketObjOut._Info.OpenPrice + _New.Open_Pip : TicketObjOut._Info.OpenPrice = TicketObjOut._Info.OpenPrice - _New.Open_Pip;
                                        //---
                                        _Check.Is_UpdatedPrice           = _New.OpenPrice != TicketObjOut._Info.OpenPrice;  //   same>> New_OpenPrice == Last_OpenPrice;
                                        //---
                                        if(_Check.Is_UpdatedPrice) {}
                                        else {_New.OpenPrice = Ask + 200 * Point;} //Force To Change if same//
                              }//
                    }//
                    //--- ct_Ticket Modifier
                    {         if(_Modifier.MinProfitInp > 0)      { _Modifier.MinProfit     = _Modifier.MinProfitInp;}
                              else { _Modifier.MinProfit     = _Modifier.MinProfitDef;}
                              //---
                              if(_Modifier.MaxProfitInp > 0)      { _Modifier.MaxProfit     = _Modifier.MaxProfitInp;}
                              else { _Modifier.MaxProfit     = _Modifier.MaxProfitDef;}
                              //---
                              if(_Modifier.TrailStopInp > 0)      { _Modifier.TrailStop     = _Modifier.TrailStopInp;}
                              else { _Modifier.TrailStop     = _Modifier.TrailStopDef;}
                              //---
                              if(_Modifier.TrailStopStepInp > 0)  { _Modifier.TrailStopStep = _Modifier.TrailStopInp;}
                              else { _Modifier.TrailStopStep = _Modifier.TrailStopStepDef;}
                              //---
                              _Modifier.Is_TrailStop = _Modifier.TrailStop > 0;
                              //---
                              _Modifier.Is_Modifybles = ((_Check.Is_Ticket_Alive && _Modifier.Is_TrailStop) &&  (_Check.Is_ExactSymbol && _Check.Is_ExactMagicNumber));// && (Is_Last_StopLossZero || Is_Last_TakeProfitZero ); //
//===================================================================================================================================================//Analysis of ct_Ticket:
                              if(_Modifier.Is_Modifybles)
                              {         // Initial value///Trailing distance
                                        uint           Min_Dist        = (uint)ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_STOPLEVEL;        //Min. distance//minimal distance for Stop Loss/Take Profit
                                        //---
                                        if (_Modifier.TrailStop < Min_Dist)         _Modifier.TrailStop = Min_Dist;                                     // If less than allowed  // New value of TS
                                        //---
                                        bool          TouchedBuySL    = false;
                                        bool          TouchedSellSL   = false;
                                        //---
                                        if(!_Check.Is_ExactSymbol || _Check.Is_Pending) {_Check.Is_PendingOrNoExactSymbol  = true;} //return false;//continue; // The order is not "ours".ArePending //At the next iteration
                                        //---
                                        TicketObjOut._Info.StopLoss     = OrderStopLoss();              // SL of the selected order
                                        TicketObjOut._Info.StopLoss     = NormalizeDouble(TicketObjOut._Info.StopLoss, Digits);
                                        //---
                                        _Check.Is_Last_StopLossZero     = NormalizeDouble(TicketObjOut._Info.StopLoss, Digits) == 0;
                                        //---
                                        if(TicketObjOut._Info.Type == OP_BUY)  _New.StopLoss = NormalizeDouble(Bid - _Modifier.TrailStop * Point, Digits);
                                        if(TicketObjOut._Info.Type == OP_SELL) _New.StopLoss = NormalizeDouble(Ask + _Modifier.TrailStop * Point, Digits);
                                        ///---
                                        TouchedBuySL              = TicketObjOut._Info.StopLoss < _New.StopLoss;     // If it is lower than we want
                                        TouchedSellSL             = TicketObjOut._Info.StopLoss > _New.StopLoss;     // If it is higher than we want //or equal to zero
                                        //---
                                        if(_Check.Is_Last_Type_OP_BUY  && TouchedBuySL)         {_New.StopLoss = Bid - _Modifier.TrailStop * Point; TicketObjOut._Info.Text = "Buy "; _Modifier.Is_Modifybles = true; }     // then modify it;// Text for Buy   // To be modified
                                        //---
                                        if((_Check.Is_Last_Type_OP_SELL && TouchedSellSL) || _Check.Is_Last_StopLossZero) {_New.StopLoss = Ask + _Modifier.TrailStop * Point; TicketObjOut._Info.Text = "Sell"; _Modifier.Is_Modifybles = true; }; //
                                        //---
                                        _New.TrailStopPrice             = (Point * _Modifier.TrailStop);
                                        //---
                                        _New.Pending_Pip                = 50; //
                                        _New.PendingPrice_Pip           = _New.PendingPrice_Pip * Point; //
                                        _New.PendingPrice_Percent       = MathRound(Bid * 1.02);
                                        _New.Expiration                 = Day();/////New_Expiration
                                        _New.ArrowColor                 = clrYellow;////
                                        //---
                                        if(0)Alert( _Modifier.MinProfitInp, "||, _Modifier.MinProfitInp,,", __LINE__);//
                              }//
                    }//
//===================================================================================================================================================
                    _Check.Is_TicketToObjct          = true;
//===================================================================================================================================================
          }
          //
          //==============================================
          return false;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Ct_Ticket::SelectTicket(int TicketCom, int _SelectMode = SELECT_BY_TICKET, int _PoolMode = MODE_TRADES )//SELECT_BY_POS //MODE_HISTORY//
{         return  OrderSelect(TicketCom, _SelectMode, _PoolMode);
//
} //has no mode[in]  ct_Order index or order ticket depending on the second parameter.
//+------------------------------------------------------------------+
//|                                                                  |SelectTicket(TicketCom, SELECT_BY_TICKET, MODE_TRADES);
//+------------------------------------------------------------------+
bool Ct_Ticket::SelectTicket_By_Array(int &TicketCom[],   int _SelectMode = SELECT_BY_TICKET, int _PoolMode = MODE_TRADES)//SELECT_BY_POS //MODE_HISTORY//
{         int SizeArray = ArraySize(TicketCom);
          bool Result = false;
          bool ResultArray[];       bool ResultArraySizeOk = ArrayResize(ResultArray, SizeArray) > -1; if(!ResultArraySizeOk) return false; ////
          ResultSTR ResultSelect[]; bool ResultSelectArraySizeOk = ArrayResize(ResultSelect, SizeArray) > -1; if(!ResultSelectArraySizeOk) return false; ////
          //============================================================================================Catch results filling ResultArray
          for(int i = 0 ; i < SizeArray - 1 ; i++) { ResultSelect[i].index = i; ResultSelect[i].result = ResultArray[i] = Result = SelectTicket(TicketCom[i], _SelectMode, _PoolMode); }
          //============================================================================================Cheack Results
          for(int i = 0 ; i < SizeArray - 1 ; i++) { if(!ResultArray[i]) {Result = false;}   if(!ResultSelect[i].result) {ResultSelect[0].countFalse++; } }
          //============================================================================================
          if(false)//--errorr out of range.... bypass needed..
          {         if(!ResultSelect[0].countFalse > 0) {Result = false;}
                    else {Result = true;}//
          }
          //============================================================================================
          return Result;  //has no mode[in]  ct_Order index or order ticket depending on the second parameter.
          //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Ct_Ticket::SelectTicket_By_Obj(Ct_Ticket & ObjCom,   int _SelectMode = SELECT_BY_TICKET, int _PoolMode = MODE_TRADES )
{         return SelectTicket(ObjCom._Info.ct_Ticket, _SelectMode, _PoolMode);} //has no mode[in]  ct_Order index or order ticket depending on the second parameter.
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Ct_Ticket::SelectTicket_By_Obj_Array(Ct_Ticket & ObjCom[], int _SelectMode = SELECT_BY_TICKET, int _PoolMode = MODE_TRADES )
{         int SizeArray = ArraySize(ObjCom);
          bool Result = false;
          bool ResultArray[];       bool ResultArraySizeOk = ArrayResize(ResultArray, SizeArray) > -1; if(!ResultArraySizeOk) return false; ////
          ResultSTR ResultSelect[]; bool ResultSelectArraySizeOk = ArrayResize(ResultSelect, SizeArray) > -1; if(!ResultSelectArraySizeOk) return false; ////
          //============================================================================================Catch results filling ResultArray
          for(int i = 0 ; i < SizeArray - 1 ; i++) { ResultSelect[i].index = i; ResultSelect[i].result = ResultArray[i] = Result = SelectTicket_By_Obj(ObjCom[i], _SelectMode, _PoolMode); }
          //============================================================================================Cheack Results
          for(int i = 0 ; i < SizeArray - 1 ; i++) { if(!ResultArray[i]) {Result = false;}   if(!ResultSelect[i].result) {ResultSelect[0].countFalse++; } }
          //============================================================================================
          //---
          //---
          if(false)//--errorr out of range.... bypass needed..
          {         if(!ResultSelect[0].countFalse > 0) {Result = false;}
                    else {Result = true;} }
          //============================================================================================
          return Result;  //has no mode[in]  ct_Order index or order ticket depending on the second parameter.
}
//+------------------------------------------------------------------+
//|                                                                  |For Single Tickets ok.. return frist ticket selected
//+------------------------------------------------------------------+
//----//can improove to return array of tickets..
int Ct_Ticket::Get_TicketsNumber(int &IntTicketListAllCom[], string f_symbol = "", int f_cmd = - 1, int f_magic = - 1)
{         ////=====================================================.
          //---Returns ticket number of the currently selected order(by for frist order..).
          //Alert("Ct_Ticket::Get_TicketsNumber(...)01");
          if(false)//--- stack overfolow happend
          {         Get_TicketsNumber(IntTicketListBuyMarket,  f_symbol, OP_BUY,       f_magic);
                    Get_TicketsNumber(IntTicketListBuyLimit,   f_symbol, OP_BUYLIMIT,  f_magic);
                    Get_TicketsNumber(IntTicketBuyStop,        f_symbol, OP_BUYSTOP,   f_magic);
                    Get_TicketsNumber(IntTicketListSellMarket, f_symbol, OP_SELL,      f_magic);
                    Get_TicketsNumber(IntTicketListSellLimit,  f_symbol, OP_SELLLIMIT, f_magic);
                    Get_TicketsNumber(IntTicketSellStop,       f_symbol, OP_SELLSTOP,  f_magic);//
          }
          ////=====================================================
          bool IntTicketListAllComSizeOk = ArrayResize(IntTicketListAllCom, OrdersTotal()) > -1;  //---like five element range
          ////=====================================================
          bool KeyOk = false; //
          for(int i = OrdersTotal() - 1; i >= 0; i--)///<<start from end  ///start from begining>> for(int i =0 ; OrdersTotal() - 1 >= i; i++)
          {         if(OrderSelect(i, SELECT_BY_POS, MODE_TRADES))
                    {         KeyOk = (f_symbol == OrderSymbol()      || f_symbol == "") &&
                                      (f_cmd    == OrderType()        || f_cmd    == -1) &&
                                      (f_magic  == OrderMagicNumber() || f_magic  == -1);
                              if(KeyOk && IntTicketListAllComSizeOk)IntTicketListAllCom[i] = OrderTicket(); //
                    }//
          }//
          if(KeyOk)return OrderTicket(); //
          return -1; //
          //=====================================================
//If more than one order matches the criteria, the function will return the ticket of the one that was issued the latest. If the order you are looking for does not exist, the function returns -1.
//1) Find an open position ticket for EURUSD, for sale and with the ID 12345 :                  GetOrderTicket("EURUSD", OP_SELL, 12345);
//2) Find a EURUSD ticket order, of any type and with the ID 12345:                             GetOrderTicket("EURUSD", -1, 12345);
//3) Find a ticket of a pending order for EURUSD, type "Sell Stop" and with any identifier :    GetOrderTicket ( "EURUSD", OP_SELLSTOP );
//4) Find a ticket order among all financial instruments of any type that has the ID 12345:     GetOrderTicket("", -1, 12345);
          //=====================================================
}
//+------------------------------------------------------------------+
//|             Class MyRoboTrader_Ct_TICKET::BEGIN                   |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
