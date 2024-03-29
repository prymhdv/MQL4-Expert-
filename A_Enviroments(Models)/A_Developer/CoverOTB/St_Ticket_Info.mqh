//+------------------------------------------------------------------+
//||   ||||||||||                 eTradePanel.mqh                   ||Ctp_TRADER
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+

struct St_Ticket_Info
{

          int                   ct_Ticket;       // OrderTicket();
          double                OpenPrice;    // double        Ct_Ticket::Last_OpenPrice;                              //OrderOpenPrice();     //ModifyTicket_OpenPrices
          datetime              OpenTime;     // datetime      Ct_Ticket::Last_OpenTime;                               //= OrderOpenTime();//
          double                ClosePrice;   // double        Ct_Ticket::Last_ClosePrice;                             //= OrderClosePrice();//
          datetime              CloseTime;    // datetime      Ct_Ticket::Last_CloseTime;                              //= OrderCloseTime();//
          //---
          string                Comment;      // string        Ct_Ticket::Last_Comment;                                //= OrderComment();//
          double                Commission;   // double        Ct_Ticket::Last_Commission;                             //= OrderCommission();//
          datetime              Expiration;   // OrderExpiration();
          double                Lots;         // double        Ct_Ticket::Last_Lots;                                   //= OrderLots();//
          //---
          int                   MagicNumber;  // int           Ct_Ticket::Last_MagicNumber;                            //= OrderMagicNumber();//
          double                Profit;       // double        Ct_Ticket::Last_Profit;                                 //= OrderProfit();//The net profit value (without swaps or commissions) for the selected order.
          double                StopLoss;     // OrderStopLoss();
          double                TakeProfit;   // OrderTakeProfit();
          //---
          double                Swap;         // double        Ct_Ticket::Last_Swap;                                   //= OrderSwap();//
          string                Symbol;       // string        Ct_Ticket::Last_Symbol;                                 //= OrderSymbol();//
          int                   Type;         // OrderType();
          //---
          int                   Opposite;     //
          double                PriceToClose; // = Bid;     // close price if Buy?>> sell?>>
          //---
          int                   Slippage;     //
          color                 ArrowColor;   //  = clrAzure; // color// close price if Buy?>> sell?>>
          //---
          int                   HistoryTotal; // OrdersHistoryTotal();//Returns the number of closed orders in the account history loaded into the terminal.
          int                   Total;        // OrdersTotal();//Returns the number of market and pending orders.
          string                Text;         //   = "?";

}; 
//+------------------------------------------------------------------+
