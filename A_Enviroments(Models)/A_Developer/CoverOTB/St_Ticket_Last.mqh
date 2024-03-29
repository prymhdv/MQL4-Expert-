//+------------------------------------------------------------------+
//||   ||||||||||                 eTradePanel.mqh                   ||Ctp_TRADER
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+

struct St_Ticket_Last
{

//--------------------------------------------------------------------------------Last_OpenPrices
          double        MarketSellPrice;                        //= 0;                  ModifyTicket_NewSellMarketPrice
          double        MarketBuyPrice;                         //= 0;                  ModifyTicket_NewBuyMarketPrice
          double        PendingSellLimitPrice;                  //= 0;                  ModifyTicket_NewSellLimitPendingPrice
          double        PendingSellStopPrice;                   //= 0;                  ModifyTicket_NewSellStopPendingPrice
          double        PendingBuyLimitPrice;                   //= 0;                  ModifyTicket_NewBuyLimitPendingPrice
          double        PendingBuyStopPrice;                    //= 0;                  ModifyTicket_NewBuyMarketPendingPrice
//================================================================================
          int           PendingPip;                             //= 50; //
          double        MarketPrice;                            //= 0;                  //ModifyTicket_NewMarketPrice  //= MathRound(Bid * 1.02);
          double        PendingPrice;                           //= 0;                  //ModifyTicket_NewPendingPrice //= New_PendingPip * Point; //
          //---
          double        PointDistanceSell;
          double        PointDistanceBuy;
          //---

}; 
//+------------------------------------------------------------------+
