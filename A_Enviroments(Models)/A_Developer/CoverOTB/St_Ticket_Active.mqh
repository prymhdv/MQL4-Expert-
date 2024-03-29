//+------------------------------------------------------------------+
//||   ||||||||||                 eTradePanel.mqh                   ||Ctp_TRADER
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
struct St_Ticket_Active
{         /*
                   *    bool          Ct_Ticket::Is_TICKET,                     Is_ORDER,                        Is_POSSITION,                         Is_MARKET,                      Is_PENDING;
                   *    bool          Ct_Ticket::Is_Ticket();                 //Is_Order();                    //Is_Possition();                       Is_Market();                    Is_Pending();
                   *    bool          Ct_Ticket::Is_TicketInPendingPool();    //Is_OrderPendingPool();         //Is_PossitionInPendingPool();          Is_MarketInPendingPool();       Is_PendingInPendingPool();
                   *    bool          Ct_Ticket::Is_TicketInMarketPool();     //Is_OrderMarketPool();          //Is_PossitionInMarketPool();           Is_MarketInMarketPool();        Is_PendingInMarketPool();
                   *    bool          Ct_Ticket::Is_TicketInPendingHistory(); //Is_OrderPendingHistory();      //Is_PossitionInPendingHistory();       Is_MarketInPendingHistory();    Is_PendingInPendingHistory();
                   *    bool          Ct_Ticket::Is_TicketInMarketHistory();  //Is_OrderMarketHistory();       //Is_PossitionInMarketHistory();        Is_MarketInMarketHistory();     Is_PendingInMarketHistory();
                   */
//===================================================================
          St_Ticket_Counter  _Counter;
          //---
          bool          IsMarketsBuy,
                        IsPendingsBuyLimit,
                        IsPendingsBuyStop,
                        IsMarketsSell,
                        IsPendingsSellLimit,
                        IsPendingsSellStop;
          //----
          bool          Is_TICKET,
                        Is_ORDER,
                        Is_POSSITION,
                        Is_MARKET,
                        Is_PENDING;
          bool          Is_Ticket() { return Is_TICKET = (OrdersTotal() > 0);};//Is_TICKET = (OrdersTotal() > 0) ? true : false;
          //---------------------------------------------------------
          bool          Is_TICKET_MARKET,
                        Is_TICKET_MARKET_POOL,
                        Is_TICKET_MARKET_HISTORY;
          bool          Is_TicketMarket()               { if(Is_Ticket()) {return Is_TICKET_MARKET = (_Counter.HowManyPositions() > 0); } return false;};
          //---------------------------------------------------------
          bool          Is_TICKET_MARKET_SELL,
                        Is_TICKET_MARKET_SELL_POOL,
                        Is_TICKET_MARKET_SELL_HISTORY;
          bool          Is_TicketMarketSell()           { if(Is_Ticket()) {return Is_TICKET_MARKET_SELL = (_Counter.HowManyPositions(NULL, OP_SELL) > 0); } return false;};
          //--------------------------------------------------------
          bool          Is_TICKET_MARKET_BUY,
                        Is_TICKET_MARKET_BUY_POOL,
                        Is_TICKET_MARKET_BUY_HISTORY;
          bool          Is_TicketMarketBuy()            { if(Is_Ticket()) {return Is_TICKET_MARKET_BUY = (_Counter.HowManyPositions(NULL, OP_BUY) > 0); } return false;};
          //---------------------------------------------------------
          //---------------------------------------------------------
          bool          Is_TICKET_PENDING,
                        Is_TICKET_PENDING_POOL,
                        Is_TICKET_PENDING_HISTORY;
          bool          Is_TicketPending()              { if(Is_Ticket()) { return Is_TICKET_PENDING = (_Counter.HowManyOrders() > 0); } return false;};
          //---------------------------------------------------------
          bool          Is_TICKET_PENDING_SELL_LIMIT,
                        Is_TICKET_PENDING_SELL_LIMIT_POOL,
                        Is_TICKET_PENDING_SELL_LIMIT_HISTORY;
          bool          Is_TicketPendingSellLimit()     { if(Is_Ticket()) { return Is_TICKET_PENDING_SELL_LIMIT = (_Counter.HowManyOrders(NULL, OP_SELLLIMIT) > 0); } return false;};
          //---------------------------------------------------------
          bool          Is_TICKET_PENDING_SELL_STOP,
                        Is_TICKET_PENDING_SELL_STOP_POOL,
                        Is_TICKET_PENDING_SELL_STOP_HISTORY;
          bool          Is_TicketPendingSellStop()      { if(Is_Ticket()) { return Is_TICKET_PENDING_SELL_STOP = (_Counter.HowManyOrders(NULL, OP_SELLSTOP) > 0); } return false;};
          //---------------------------------------------------------
          bool          Is_TICKET_PENDING_BUY_LIMIT,
                        Is_TICKET_PENDING_BUY_LIMIT_POOL,
                        Is_TICKET_PENDING_BUY_LIMIT_HISTORY;
          bool          Is_TicketPendingBuyLimit()      { if(Is_Ticket()) { return Is_TICKET_PENDING_BUY_LIMIT = (_Counter.HowManyOrders(NULL, OP_BUYLIMIT) > 0); } return false;};
          //---------------------------------------------------------
          bool          Is_TICKET_PENDING_BUY_STOP,
                        Is_TICKET_PENDING_BUY_STOP_POOL,
                        Is_TICKET_PENDING_BUY_STOP_HISTORY;
          bool          Is_TicketPendingBuyStop()       { if(Is_Ticket()) { return Is_TICKET_PENDING_BUY_STOP = (_Counter.HowManyOrders(NULL, OP_BUYSTOP) > 0); } return false;};



};