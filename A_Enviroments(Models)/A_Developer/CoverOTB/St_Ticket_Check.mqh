//+------------------------------------------------------------------+
//||   ||||||||||                 eTradePanel.mqh                   ||Ctp_TRADER
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
struct St_Ticket_Check
{         //---
          bool          Is_TicketToObjct;
          bool          Is_Ticket_Alive;                //= false; /// OrderCloseTime() == 0 //The order must be previously selected by the OrderSelect() function.
          bool          Is_Alive()                      {return OrderCloseTime() == 0;}; //The order must be previously selected by the OrderSelect() function.
          bool          Is_Pending;                     //= false; Last_Type > OP_SELL;
          bool          Is_Market;                      //= false; Last_Type < OP_BUYLIMIT;
          //---
          bool          Is_Last_Type_OP_SELL;           //= Last_Type == OP_SELL;
          bool          Is_Last_Type_OP_BUY;            //= Last_Type == OP_BUY;
          bool          Is_Last_Type_OP_SELLLIMIT;      //= Last_Type == OP_SELLLIMIT;
          bool          Is_Last_Type_OP_SELLSTOP;       //= Last_Type == OP_SELLSTOP;
          bool          Is_Last_Type_OP_BUYLIMIT;       //= Last_Type == OP_BUYLIMIT;
          bool          Is_Last_Type_OP_BUYSTOP;        //= Last_Type == OP_BUYSTOP;
          //---
          bool          Is_Buying;                      //= false;// OrderStopLoss() < OrderOpenPrice();
          bool          Is_Selling;                     //= false;// OrderStopLoss() > OrderOpenPrice();
          //---
          bool          Is_ExactSymbol;                 //= false;//OrderSymbol() == Symbol();//
          bool          Is_ExactMagicNumber;            //= false;//OrderMagicNumber() ==  ct_Bank.MagicNumber;//
          //---
          bool          Is_Last_StopLossZero;           //= false;//OrderStopLoss() == 0;//
          bool          Is_Last_TakeProfitZero;         //= false;//OrderTakeProfit() == 0;//

          bool          Is_CloseByBid;                  //= false;//(OrderClose(OrderTicket(), OrderLots(), Bid, ct_Inform.UseSlippage, Violet));//Send Closes opened order.
          bool          Is_CloseByAsk;                  //= false;//(OrderClose(OrderTicket(), OrderLots(), Ask, ct_Inform.UseSlippage, Violet));//Send Closes opened order.
          bool          Is_OP_SELL;                     //= false;//OrderType() <= OP_SELL;//OP_SELL//1//Sell operation
          bool          Is_PendingOrNoExactSymbol;
          //---
          bool          Is_DistanceBuyTouchTrailStop;
          bool          Is_DistanceSellTouchTrailStop;
          bool          Is_UpdatedPrice;
          //---
          bool          Is_SELECT_BY_TICKET_MODE_TRADES;  //= OrderSelect(O, SELECT_BY_TICKET, MODE_TRADES); //ORDER_Is_SELECT_BY_TICKET_MODE_TRADES
          bool          Is_SELECT_BY_TICKET_MODE_HISTORY; //= OrderSelect(O, SELECT_BY_TICKET, MODE_HISTORY);//ORDER_Is_SELECT_BY_TICKET_MODE_HISTORY
          bool          Is_SELECT_BY_POS_MODE_TRADES;     //= OrderSelect(O, SELECT_BY_POS, MODE_TRADES);    //ORDER_Is_SELECT_BY_POS_MODE_TRADES
          bool          Is_SELECT_BY_POS_MODE_HISTORY;    //= OrderSelect(O, SELECT_BY_POS, MODE_HISTORY);   //ORDER_Is_SELECT_BY_POS_MODE_HISTORY
          //
          int           Get_OrderType() { return OrderType();}
          //

};
//+------------------------------------------------------------------+
