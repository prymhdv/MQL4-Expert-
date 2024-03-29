//+------------------------------------------------------------------+
//||   ||||||||||                 eTradePanel.mqh                   ||Ctp_TRADER
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
struct St_Ticket_New
{         int           Open_Pip;                                //= 50; // NewOpen_Pip
          int           Market_Pip;                              //= 50; //
          int           Pending_Pip;                             //= 50; //

          int           Open_Percent;                            //= 50; //
          int           Market_Percent;                          //= 50; //
          int           Pending_Percent;                         //= 50; //

          double        OpenPrice;                               //OrderOpenPrice();     //ModifyTicket_OpenPrices
          double        OpenPrice_Pip;
          double        OpenPrice_Percent;

          double        MarketPrice;                             //= 0;                  //ModifyTicket_NewMarketPrice  //= MathRound(Bid * 1.02);
          double        MarketPrice_Pip;
          double        MarketPrice_Percent;

          double        PendingPrice;                            //= 0;                  //ModifyTicket_NewPendingPrice //= New_PendingPip * Point; //
          double        PendingPrice_Pip;
          double        PendingPrice_Percent;

          int           Type;                                    //= -1;// OrderType();  //
//================================================================================
          int           Number;                                  //                      //ModifyTicket_Index;
          double        StopLoss;                                //= MathRound(Bid - 2 * SLX * Point);//= Bid + TPX * Point; //0.0001  double SL_New = 0;
          double        TakeProfit;                              //= MathRound(Bid + 2 * TPX * Point);//= Bid - SLX * Point;
          datetime      Expiration;                              //= Day();/////New_Expiration
          color         ArrowColor;                              //= clrYellow;////
//--------------------------------------------------------------------------------New_OpenPrices
          double        MarketSellPrice;                         //= 0;                  ModifyTicket_NewSellMarketPrice
          double        MarketBuyPrice;                          //= 0;                  ModifyTicket_NewBuyMarketPrice
          double        PendingSellLimitPrice;                   //= 0;                  ModifyTicket_NewSellLimitPendingPrice
          double        PendingSellStopPrice;                    //= 0;                  ModifyTicket_NewSellStopPendingPrice
          double        PendingBuyLimitPrice;                    //= 0;                  ModifyTicket_NewBuyLimitPendingPrice
          double        PendingBuyStopPrice;                     //= 0;                  ModifyTicket_NewBuyMarketPendingPrice
          //---
          double        TrailStopPrice;//


}; 
//+------------------------------------------------------------------+
