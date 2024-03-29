//+------------------------------------------------------------------+
//||   ||||||||||       St_CondicatorData_Indicators_MA.mqh         ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|             Class MyRoboTrader_Order::BEGIN                                 |2721 line class  MyRoboTrader_Order start
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOT\.CoverOT.mqh>
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
/*
          switch(TypeOrder)
          {         case OP_BUY: {   }; break; //
                    case OP_SELL: {   }; break; //
                    case OP_BUYLIMIT: {   }; break; //
                    case OP_SELLLIMIT: {   }; break; //
                    case OP_BUYSTOP: {   }; break; //
                    case OP_SELLSTOP: {   }; break; //
          }
*/

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class Ct_Order
{         /*
          * Duty of class Trade Functions
          * This is the group of functions intended for managing trading activities.
          * Trading functions can be used in Expert Advisors and scripts. OrderSend(), OrderClose(), OrderCloseBy(), OrderModify(), OrderDelete(),
          * trading functions changing the state of a trading account can be called only if trading by Expert Advisors is
          * allowed (the "Allow live trading" checkbox is enabled in the Expert Advisor or script properties).
          * Trading can be allowed or prohibited depending on various factors described in the Trade Permission section.
          *
          *
          * Function              Action                                                                                                                    Calling
          * OrderClose            Closes opened order                                                                     bool            OrderClose(int ticket,double lots,double price, int slippage, color arrow_color);
          * OrderCloseBy          Closes an opened order by another opposite opened order                                 bool            OrderCloseBy(int ticket, int opposite,color arrow_color);
          * OrderClosePrice       Returns close price of the currently selected order                                     double          OrderClosePrice();
          * OrderCloseTime        Returns close time of the currently selected order                                      datetime        OrderCloseTime();
          * OrderComment          Returns comment of the currently selected order                                         string          OrderComment();
          * OrderCommission       Returns calculated commission of the currently selected order                           double          OrderCommission();
          * OrderDelete           Deletes previously opened pending order                                                 bool            OrderDelete(int ticket,color arrow_color);
          * OrderExpiration       Returns expiration date of the selected pending order                                   datetime        OrderExpiration();
          * OrderLots             Returns amount of lots of the selected order                                            double          OrderLots();
          * OrderMagicNumber      Returns an identifying (magic) number of the currently selected order                   int             OrderMagicNumber();
          * OrderModify           Modification of characteristics of the previously opened or pending orders              bool            OrderModify(int ticket,double price, double stoploss, double takeprofit, datetime expiration, color arrow_color);
          * OrderOpenPrice        Returns open price of the currently selected order                                      double          OrderOpenPrice();
          * OrderOpenTime         Returns open time of the currently selected order                                       datetime        OrderOpenTime();
          * OrderPrint            Prints information about the selected order in the log                                  void            OrderPrint();                           #ticket number; open time; trade operation; amount of lots; symbol; open price; Stop Loss; Take Profit; close time; close price; commission; swap; profit; comment; magic number; pending order expiration date.
          * OrderProfit           Returns profit of the currently selected order                                          double          OrderProfit();                          The net profit value (without swaps or commissions) for the selected order. For open orders, it is the current unrealized profit. For closed orders, it is the fixed profit.
          * OrderSelect           The function selects an order for further processing                                    bool            OrderSelect( int index,int select, int pool=MODE_TRADES );    ct_Order index or order ticket depending on the second parameter.  SELECT_BY_POS - index in the order pool, SELECT_BY_TICKET - index is order ticket.  MODE_TRADES (default)- order selected from trading pool(opened and pending orders), MODE_HISTORY - order selected from history pool (closed and canceled order).
          * OrderSend             The main function used to open an order or place a pending order                        int             OrderSend(string symbol,int cmd,double volume,double price,int slippage,double stoploss,double takeprofit,string comment=NULL,int magic=0,datetime expiration=0,color arrow_color=clrNONE);
          * OrdersHistoryTotal    Returns the number of closed orders in the account history loaded into the terminal     int             OrdersHistoryTotal();                   The history list size depends on the current settings of the "Account history" tab of the terminal.
          * OrderStopLoss         Returns stop loss value of the currently selected order                                 double          OrderStopLoss();
          * OrdersTotal           Returns the number of market and pending orders                                         int             OrdersTotal();
          * OrderSwap             Returns swap value of the currently selected order                                      double          OrderSwap();
          * OrderSymbol           Returns symbol name of the currently selected order                                     string          OrderSymbol();
          * OrderTakeProfit       Returns take profit value of the currently selected order                               double          OrderTakeProfit();
          * OrderTicket           Returns ticket number of the currently selected order                                   int             OrderTicket();
          * OrderType             Returns order operation type of the currently selected order                            int             OrderType();    OP_BUY - buy order,OP_SELL - sell order,OP_BUYLIMIT - buy limit pending order,OP_BUYSTOP - buy stop pending order,OP_SELLLIMIT - sell limit pending order,OP_SELLSTOP - sell stop pending order.
          *
          *
          *
          *
          */
//===================================================================================
private:  int            Num;
          string         Name;
//===================================================================================
public:
          void           Ct_Order();
          void           ~Ct_Order() {};
          bool           Update();
          bool           UPDATED;
          bool           Manager();
          bool           MANAGED;
          St_Orders      OrderHistory[];
          //=======================================================================
          int            Symple();
          int            OrdersReport();
          bool           Is_Selected(int ct_Ticket);
          //=======================================================================
          bool           YOrderCloseBy(); //bool OrderCloseBy(Ticket_Num,);>>>>>>
          bool           YOrderDelete();  //bool OrderDelete();>>>>>>>>>
          bool           YOrderModify();  //bool OrderModify();//>>>>>..
          bool           YOrderPrint();   //void OrderPrint(); //Prints information about the selected order in the log in the following format://#ticket number; open time; trade operation; amount of lots; symbol; open price; Stop Loss; Take Profit; close time; close price; commission; swap; profit; comment; magic number; pending order expiration date.
          bool           YOrderSelect();  //bool OrderSelect();//>>>>>
          int            YOrderSend();    //int  OrderSend();  ///>>>>Returns number of the ticket assigned to the order by the trade server or -1 if it fails.
          //---------------------------------------
          void           ReverseOrder();//all orders//close and set  Reverse
          int            SelectOrderGetIndex(string cO);//
          //=============================
          //OrderGetDouble(ENUM_ORDER_PROPERTY_DOUBLE, );//>>>>>>>>off
          //OrderGetInteger();//>>>>>off
          //OrderGetString(); //>>>>>off
          //=============================
          //================================================================================/////OrdertManager////////
          //================================================================================
          string          TypeDescription(int type) {return "sellLimit";};
          //================================================================================
          //================================================================================
          double          GetPriceByTicket(const int Type, const int ct_Ticket);
          bool            ByOrderType(int TypeOrder);//
          bool            SearchOrdersByType();//
          bool            ExistsOrdersWithIdentifier(string identifier);

//================================================================================
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
Ct_Order::Ct_Order()
{         RunCallFunction++;
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADER Error", __LINE__, __FUNCTION__); //
          int O                          = 0; //
          Update();
          ArrayResize(OrderHistory, 300);
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADER Error", __LINE__, __FUNCTION__); //
}

//+------------------------------------------------------------------+
//|                                                                  |ct_Drive.TDD.ct_Modify.UPDATED
//+------------------------------------------------------------------+
bool Ct_Order::Update()
{         //
          UPDATED = true;
          if(this.UPDATED)                              { this.Manager();                                                                            }     //#1      Status Trade Ordering Manager Possition App Local Enviroments  |Put By KeyGet From ct_Conductor.ConditionWatch
          if(this.MANAGED)                              { ct_Drive.Etf_Trade_Mode = Et_Update_Order_Ending;     ct_Drive.TDD.ct_End.Update(TRADER_Panel_DATA.IsAuto_EndAll);    }     //#2      Status Trade Ordering Close Possition App Local Enviroments    |
          if(true)                                      { ct_Drive.Etf_Trade_Mode = Et_Update_Order_Starting;   ct_Drive.TDD.ct_Start.Update(TRADER_Panel_DATA.IsAuto_OrdersPut);      }     //#3      Status Trade Ordering Open Possition App Local Enviroments     |Put By KeyGet From ct_Conductor.ConditionWatch
          if(ct_Drive.TDD.ct_Start.UPDATED)             { ct_Drive.Etf_Trade_Mode = Et_Update_Order_Modifying;  ct_Drive.TDD.ct_Modify.Update(TRADER_Panel_DATA.IsAuto_OrdersModifications,false); }     //#4      Status Trade Ordering Modify App  Possition Local Enviroments  |
          //---Evaluate Orders ---- array of ticket traded need,,, today
          /// ct_Drive.TDD.ct_Conductor.TI_Curr.IsBasic_Profited_Vs_Lossed =ct_Drive.TDD.ct_Conductor.TI_Curr.Money_Profited>ct_Drive.TDD.ct_Conductor.TI_Curr.Money_Lossed;
          /// ---bissiness Risks
          //---Risk Of Market
          //---Risk Of Strategic
          //---Risk Of Sale
          //---Risk Of Management
          //---Risk Of Fundation
          //==========================================================
          // Status Trade App Cheack START Working Local Enviroments |
          //==========================================================
          UPDATED = (ct_Drive.TDD.ct_Start.UPDATED && ct_Drive.TDD.ct_Modify.UPDATED &&  ct_Drive.TDD.ct_End.UPDATED) ? true : false;
          //==========================================================
          // Trade App Cheack END Working Local Enviroments          |
          //==========================================================
          return UPDATED; //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Ct_Order::Manager()
{         this.MANAGED = false;
          this.MANAGED = true; //
          {         St_Orders::Total = 0;
                    if(OrderSelect(0, SELECT_BY_POS, MODE_TRADES))
                              for(int i = 0; OrderSelect(i, SELECT_BY_POS, MODE_TRADES); i++)  { ++St_Orders::Total;}  //
                    if(OrderSelect(0, SELECT_BY_POS, MODE_HISTORY))
                              for(int i = 0; OrderSelect(i, SELECT_BY_POS, MODE_HISTORY); i++) { ++St_Orders::Total;}  //
                    //
                    int idxs = 0;
                    ArrayResize(OrderHistory, St_Orders::Total); //Print("St_Orders::Total:", St_Orders::Total); //
                    bool res1 = OrderSelect(0, SELECT_BY_POS, MODE_TRADES);
                    for(int i = 0; (i <= ArraySize(OrderHistory) - 1) && (OrderSelect(i, SELECT_BY_POS, MODE_TRADES)); idxs = i++)//i >= ArraySize(OrderHistory) - 1   //OrderSelect(i, SELECT_BY_POS, MODE_TRADES)
                    {         bool res2 = OrderSelect(i, SELECT_BY_POS, MODE_TRADES);
                              OrderHistory[i].set(OrderTicket());//
                              //Print("1OrderHistory[" + (string)i + "].Ticket:", OrderHistory[i].Ticket, " OrderTicket:", OrderTicket(), " Size:", ArraySize(OrderHistory) - 1); //
                    }
                    //
                    for(int i = idxs; (i <= ArraySize(OrderHistory) - 1) && (OrderSelect(i, SELECT_BY_POS, MODE_HISTORY)); i++) //i >= ArraySize(OrderHistory) - 1  //OrderSelect(i, SELECT_BY_POS, MODE_HISTORY)
                    {         bool res3 = OrderSelect(i, SELECT_BY_POS, MODE_HISTORY);
                              OrderHistory[i].set(OrderTicket());//
                              //Print("2OrderHistory[" + (string)i + "].Ticket:", OrderHistory[i].Ticket, " OrderTicket:", OrderTicket(), " Size:", ArraySize(OrderHistory) - 1); //
                    }  //
                    // if(ArraySize(OrderHistory) - 1 > -1)Print("3OrderHistory[0].Ticket:", OrderHistory[0].Ticket, " Size:", ArraySize(OrderHistory) - 1); //
          }//
          //
          if(!this.MANAGED) {Alert("this.MANAGED: ", this.MANAGED);}
          //ct_Drive.KeyOrderManaged = this.MANAGED;
          return this.MANAGED; //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Ct_Order::ReverseOrder()
{         double Lots;
          int    op;
          for (int i = OrdersTotal() - 1; i >= 0; i--)
          {         if (OrderSelect(i, SELECT_BY_POS, MODE_TRADES))
                    {         if (OrderSymbol() == Symbol())
                              {         op = OrderType();
                                        if (op == OP_BUY)
                                        {         Lots = OrderLots();
                                                  bool OrderCloseX = OrderClose(OrderTicket(), OrderLots(), Bid, 7, CLR_NONE);
                                                  bool OrderSendX  = OrderSend(Symbol(), OP_SELL, Lots, Bid, 7, 0, 0, "Reverse", 0, 0, CLR_NONE); //
                                        } //
                                        if (op == OP_SELL)
                                        {         Lots = OrderLots();
                                                  bool OrderCloseX = OrderClose(OrderTicket(), OrderLots(), Ask, 7, CLR_NONE);
                                                  bool OrderSendX  = OrderSend(Symbol(), OP_BUY, Lots, Ask, 7, 0, 0, "Reverse", 0, 0, CLR_NONE); //
                                        } //
                              }//
                    }//
          }//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Ct_Order::YOrderCloseBy()
{         //=================================
          int order_id;///
          int opposite_id;//
          string commentOrderLong = ""; //
          string commentOrderShort = ""; //
          //=================================
          bool OrderSelectX = OrderSelect(SelectOrderGetIndex(commentOrderLong), SELECT_BY_POS);// Use this function by calling it like this:
          order_id = OrderTicket();
          OrderSelectX = OrderSelect(SelectOrderGetIndex(commentOrderShort), SELECT_BY_POS);//must existed//
          opposite_id = OrderTicket();
          bool OrderCloseByZ = OrderCloseBy(order_id, opposite_id, clrLime); //
          // It "just closes an order depending on the opposite one" thus saving one spread vs. close and then open an opposite one.
          // Not permitted on some brokers.
          // Hedging not permitted for US traders. //
          //However, if we use in this situation the function OrderCloseBy() intended for opposite closing of orders, the economic output will be better (as compared to the preceding alternative) by the amount proportional to the cost of one order's spread
//==================================
          return true;///
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int Ct_Order::SelectOrderGetIndex(string CommentCom)
{         bool exist = false;
          for(int i = OrdersTotal() - 1; i >= 0; i--)
          {         bool OrderSelectX = OrderSelect(i, SELECT_BY_POS);
                    if(OrderComment() == CommentCom) { exist = true; return(i); } //
          }
          if(!exist) return(-1); //
          return -1; //
}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int Ct_Order::Symple()
{
//====================================================================Get minimum stop level
          double minstoplevel = MarketInfo(Symbol(), MODE_STOPLEVEL);
          Print("Minimum Stop Level=", minstoplevel, " points");
          double price          = Ask;
//==================================================================== Cheaking Point is Fractional or symple
          double PipM           = 100.0000;       //UnFractionPoint   M=Tone==1,000,000;//standard Lot
          double Pip100K        = 010.0000;       //UnFractionPoint
          double Pip10K         = 001.0000;       //UnFractionPoint
          double PipK           = 000.1000;       //UnFractionPoint   K=killo==1,000;
          double Pip100         = 000.0100;       //UnFractionPoint
          double Pip10          = 000.0010;       //UnFractionPoint
          double Pip            = 000.0001;       //UnFractionPoint
          double Pipet          = 000.00001;      //FractionPoint
          //=====================================================
          Pip                   = 0.0001;         //UnFractionPoint
          Pipet                 = 0.00001;        //FractionPoint
          Pip                   = 0.01;           //UnFractionPoint
          Pipet                 = 0.001;          //FractionPoint
          if(Digits == 2 ) Pip  = 0.01; if(Digits == 4 )  Pip = 0.0001;
          if(Digits == 3 ) Pip  = 0.01; if(Digits == 5 )  Pip = 0.0001;
          if(Digits == 2 || Digits == 4 ) Pip = Point * 1;
          if(Digits == 3 || Digits == 5 ) Pip = Point * 10;
//====================================================================calculated SL and TP prices must be normalized
          double stoploss       = NormalizeDouble(Bid - minstoplevel * Pip, Digits);///
          double takeprofit     = NormalizeDouble(Bid + minstoplevel * Pip, Digits);
//====================================================================place market order to buy 1 lot
          int ticket            = OrderSend(Symbol(), OP_BUY, 1, price, 3, stoploss, takeprofit, "My order", 16384, 0, clrGreen);
          if(ticket < 0) {Print("OrderSend failed with error #", GetLastError()); }
          else           {Print("OrderSend placed successfully");}
//====================================================================
          return ticket; //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Ct_Order::Is_Selected(int TicketCom)
{         if(OrderSelect(TicketCom, SELECT_BY_TICKET, MODE_TRADES))if(OrderSymbol() == StSymbol.Current)return true ; //
          return false;//
}
//+------------------------------------------------------------------+
//|                                                                  |If a file has been opened successfully, the function returns the file handle, which is then used to access the file data. In case of failure returns INVALID_HANDLE.
//+------------------------------------------------------------------+
int Ct_Order::OrdersReport()
{         int handle = FileOpen("OrdersReport.csv", FILE_WRITE | FILE_CSV, "\t");
          if(handle < 0) return(0);
          // write header
          FileWrite(handle, "#", "open price", "open time", "symbol", "lots");
          int total = OrdersTotal();
          // write open orders
          for(int pos = 0; pos < total; pos++)
          {         if(OrderSelect(pos, SELECT_BY_POS) == false) continue;
                    FileWrite(handle, OrderTicket(), OrderOpenPrice(), OrderOpenTime(), OrderSymbol(), OrderLots()); //
          }
          FileClose(handle);//
          return(handle);//
}

//+------------------------------------------------------------------+
//| PriceByTkt                                                       |
//+------------------------------------------------------------------+
double Ct_Order::GetPriceByTicket(const int TypeCom, const int TicketCom)
{         double price = 0;
          if(OrdersTotal() >= 0)
                    if(OrderSelect(TicketCom, SELECT_BY_TICKET, MODE_TRADES))
                    {         if(TypeCom == OPENPRICE)price = OrderOpenPrice();
                              if(TypeCom == CLOSEPRICE)price = OrderClosePrice(); //
                    }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADER Error",  __LINE__, __FUNCTION__); //|
          return(price); //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Ct_Order::SearchOrdersByType()
{         //===================================================================
          for(int i = 0; OrdersTotal() - 1 > i; i++) ///remembe infiniti loop in conditors
          {         if(OrderSelect(i, SELECT_BY_POS, MODE_TRADES)) ////////////!!!!!!!!!!
                              switch(OrderType())
                              {         case OP_BUY: {Alert("work  OP_BUY", "-Line:", __LINE__);} break; //
                                        case OP_BUYSTOP: { Alert("work  OP_BUYSTOP", "-Line:", __LINE__);} break; //
                                        case OP_BUYLIMIT: { Alert("work  OP_BUYLIMIT", "-Line:", __LINE__); } break; //       //BuyLimitRunX
                                        case OP_SELL: {Alert("work  OP_SELL", "-Line:", __LINE__);} break; //
                                        case OP_SELLSTOP: {Alert(_LastError, "-C_TRADER Error", "-Line:", __LINE__);} break; //
                                        case OP_SELLLIMIT: { Alert(_LastError, "-C_TRADER Error-work OP_SELLLIMIT", "-Line:", __LINE__);} break; //
                                        default: { ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADER Error-default auto adjusted",  __LINE__, __FUNCTION__);} //
                              }//
          }//
//===================================================================
          return true;//
//===================================================================
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Ct_Order::ExistsOrdersWithIdentifier(string identifier)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "Capitan.mqh Error",  __LINE__, __FUNCTION__); //|
          for(int i = 0; i < OrdersTotal(); i++)
          {         if(OrderSelect(i, SELECT_BY_POS) == false)         continue;
                    if(StringFind(OrderComment(), identifier) == -1)   continue;///---gone next round of loop
                    if(DebugMode)                                    { Print("ct_Order from this action is still open. Skip action"); }
                    return true;//
          }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "Capitan.mqh Error",  __LINE__, __FUNCTION__); //|
          return false;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Ct_Order::ByOrderType(int TypeOrder)
{
//=============================================
          switch(TypeOrder)
          {         case OP_BUY:
                    {  }; break; //
                    case OP_SELL:
                    {    }; break; //
                    //-------------------------------------
                    case OP_BUYLIMIT:
                    {      }; break; //
                    case OP_SELLLIMIT:
                    {     }; break; //
                    //-------------------------------------
                    case OP_BUYSTOP:
                    {      }; break; //
                    case OP_SELLSTOP:
                    {    }; break; //
          }
//=============================================
          return false;//
//=============================================
}

//+------------------------------------------------------------------+
//|             Class MyRoboTrader_Order::BEGIN                                 |2721 line class  MyRoboTrader_Order start
//+------------------------------------------------------------------+
