//+------------------------------------------------------------------+
//||   ||||||||||                 St_Ticket_Counter.mqh              ||Ctp_TRADER
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+


struct St_Ticket_Counter
{

          int           _TotalAll,         _AllTotalMax,               _AllTotalMin,               _AllFutureOne,              _AllFutureTwo;

          int           _BuyTotal,         _BuyTotalMax,               _BuyTotalMin,               _BuyFutureOne,              _BuyFutureTwo;

          int           _BuyMarket,        _BuyMarketTotalMax,         _BuyMarketTotalMin,         _BuyMarketFutureOne,        _BuyMarketFutureTwo;
          int           _BuyLimit,         _BuyLimitTotalMax,          _BuyLimitTotalMin,          _BuyLimitFutureOne,         _BuyLimitFutureTwo;
          int           _BuyStop,          _BuyStopTotalMax,           _BuyStopTotalMin,           _BuyStopFutureOne,          _BuyStopFutureTwo;

          int           _SellTotal,        _SellTotalMax,              _SellTotalMin,              _SellFutureOne,             _SellFutureTwo;

          int           _SellMarket,       _SellMarketTotalMax,        _SellMarketTotalMin,        _SellMarketFutureOne,       _SellMarketFutureTwo;
          int           _SellLimit,        _SellLimitTotalMax,         _SellLimitTotalMin,         _SellLimitFutureOne,        _SellLimitFutureTwo;
          int           _SellStop,         _SellStopTotalMax,          _SellStopTotalMin,          _SellStopFutureOne,         _SellStopFutureTwo;
          //---------------------------------------------------------------------------------------------------------------------------------------]
          bool          Manager();
          bool          Is_Managed;
          int           GetCount_CurrentOrders(string symbol);
          int           OrderCounter(int TypeOrder);
          int           TotalOrderCounter();
          int           TotalCount(int TypeCom);
          int           CalculateCurrentOrdersCount(string symbol);

          uint          HowManyOrders(string f_symbol = "",    int f_cmd = - 1, int f_magic = - 1, datetime f_openTime = 0);  //All pending TicketOrders
          uint          HowManyPositions(string f_symbol = "", int f_cmd = - 1, int f_magic = - 1, datetime f_openTime = 0 ); // time after which positions were opened TicketPositions
          //---------------------------------------------------------------------------------------------------------------------------------------]

};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool St_Ticket_Counter::Manager()
{         _BuyMarket                   = OrderCounter(OP_BUY);
          _BuyLimit                    = OrderCounter(OP_BUYLIMIT);
          _BuyStop                     = OrderCounter(OP_BUYSTOP);
          ///
          _SellMarket                  = OrderCounter(OP_SELL);
          _SellLimit                   = OrderCounter(OP_SELLLIMIT);
          _SellStop                    = OrderCounter(OP_SELLSTOP);
          ///
          _TotalAll                    = TotalOrderCounter();
          _SellTotal                   =  _SellMarket +  _SellStop +  _SellLimit;
          _BuyTotal                    =  _BuyMarket  +  _BuyStop  +  _BuyLimit;
          //
          return Is_Managed = true; //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+All pending
uint St_Ticket_Counter::HowManyOrders(string f_symbol = "", int f_cmd = -1, int f_magic = -1, datetime f_openTime = 0)
{         uint f_total = 0;
//---
          for(int i = OrdersTotal() - 1; i >= 0; i--)
                    if(OrderSelect(i, SELECT_BY_POS, MODE_TRADES))
                    {         int f_type = OrderType();
                              if(f_type == OP_BUY || f_type == OP_SELL) continue;//---
                              bool KeyOk = (f_symbol   == OrderSymbol()      || f_symbol == "") &&
                                           (f_cmd      == OrderType()        || f_cmd == -1) &&
                                           (f_magic    == OrderMagicNumber() || f_magic == -1) &&
                                           (f_openTime <= OrderOpenTime()    || f_openTime == 0);
                              if(KeyOk)f_total++; //
                    }
//---
          return f_total; //
          //=====================================================
//Examples of using functions
//1) Count the number of all pending orders:                                                                    HowManyOrders();
//2) Count the number of all pending orders for the current financial instrument :                              HowManyOrders(_Symbol);
//3) Count the number of pending orders for all financial instruments of the OP_BUYLIMIT type :                 HowManyOrders("", OP_BUYLIMIT);
//4) Count the number of pending orders for EURUSD, "Sell Stop" type and with the identifier 12345 :            HowManyOrders("EURUSD", OP_SELLSTOP, 12345);
//5) Count the number of all pending orders placed on the market after December 1, 2016 after 00: 00:           HowManyOrders("", -1, -1, D'2016.12.01 00:00');
          //=====================================================
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
uint St_Ticket_Counter::HowManyPositions( string f_symbol = "", int f_cmd = - 1, int f_magic = - 1, datetime f_openTime = 0) // time after which positions were opened
{         uint f_total = 0 ;
          for ( int i = OrdersTotal () - 1 ; i >= 0 ; i--)// ---decrising count;//
                    if ( OrderSelect (i, SELECT_BY_POS, MODE_TRADES ))
                    {         int f_type = OrderType ();
                              if (f_type == OP_BUYLIMIT || f_type == OP_SELLLIMIT || f_type == OP_BUYSTOP   || f_type == OP_SELLSTOP )continue ;// ---
                              bool KeyOk = (f_symbol   == OrderSymbol ()      || f_symbol == "" ) &&
                                           (f_cmd      == OrderType ()        || f_cmd == - 1 ) &&
                                           (f_magic    == OrderMagicNumber () || f_magic == - 1 ) &&
                                           (f_openTime <= OrderOpenTime ()    || f_openTime == 0 );
                              if (KeyOk)f_total ++; //
                    }// ---
          return f_total; //
          //=====================================================
//Examples of using functions
//1) Count the number of all open positions:                                              HowManyPositions ();
//2) Count the number of all positions for the current financial instrument :             HowManyPositions ( _Symbol );
//3) Count the number of positions for all financial instruments to buy :                 HowManyPositions ( "", OP_BUY );
//4) Count the number of positions for EURUSD, for sale and with ID 12345 :               HowManyPositions ( "EURUSD", OP_SELL, 12345 );
//5) Count the number of all positions opened after December 1, 2016 after 00: 00:        HowManyPositions ( "", - 1, - 1, D'2016.12.01 00:00 ' );
          //=====================================================
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int St_Ticket_Counter::TotalCount(int TypeCom)
{         int result = 0;
          for(int i = 0; i < OrdersTotal(); i++)
          {         if(OrderSelect(i, SELECT_BY_POS, MODE_TRADES))
                    {         if(TypeCom == DefMagicNumber)             if (OrderMagicNumber() ==  ct_Drive.TDD.ct_Bank.MagicNumber)             { result++;  ct_Drive.TDD.ct_Bank.MagicNumberOk      = true;}
                                        else {} //
                              if(TypeCom == DefMax_ProfitTicket)        if (OrderProfit()      >=  ct_Drive.TDD.ct_Bank.Max_ProfitTicket)        { result++;  ct_Drive.TDD.ct_Bank.Max_ProfitTicketOk = true;}
                                        else {} //
                              if(TypeCom == DefMin_ProfitTicket)        if (OrderProfit()      <=  ct_Drive.TDD.ct_Bank.Min_ProfitTicket)        { result++;  ct_Drive.TDD.ct_Bank.Min_ProfitTicketOk = true;}
                                        else {} //
                              if(TypeCom == DefMax_LossTicket)          if (OrderProfit()      >=  ct_Drive.TDD.ct_Bank.Max_LossTicket)          { result++;  ct_Drive.TDD.ct_Bank.Max_LossTicketOk   = true;}
                                        else {} //
                              if(TypeCom == DefMin_LossTicket)          if (OrderProfit()      <=  ct_Drive.TDD.ct_Bank.Min_LossTicket)          { result++;  ct_Drive.TDD.ct_Bank.Min_LossTicketOk   = true;}
                                        else {} //
                              //==========================================================================================
                              if(TypeCom == DefMagicNumber)  if (OrderMagicNumber() ==  ct_Drive.TDD.ct_Bank.MagicNumber) result++; //
                              if(TypeCom == DefMagicNumber)  if (OrderMagicNumber() ==  ct_Drive.TDD.ct_Bank.MagicNumber) result++; //
                    } //
          }
          return(result);//
}
//+------------------------------------------------------------------+
//| Calculate open positions                                         |
//+------------------------------------------------------------------+
int St_Ticket_Counter::CalculateCurrentOrdersCount(string symbol)
{         int buys = 0, sells = 0;
//---
          for(int i = 0; i < OrdersTotal(); i++)
          {         if(OrderSelect(i, SELECT_BY_POS, MODE_TRADES) == false)
                              break;
                    if(OrderSymbol() == Symbol() && OrderMagicNumber() == MAGICMA)
                    {         if(OrderType() == OP_BUY)
                                        buys++;
                              if(OrderType() == OP_SELL)
                                        sells++; } }
//--- return orders volume
          if(buys > 0)
                    return(buys);
          else
                    return(-sells); //
}
//+------------------------------------------------------------------+
//| Calculate open positions                                         |
//+------------------------------------------------------------------+
int St_Ticket_Counter::GetCount_CurrentOrders(string symbol)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-Ct_Ticket Error", __LINE__, __FUNCTION__); //|
          //=========================================================|
          //--- Inputs
          double Lots_          = 0.1;
          double MaximumRisk   = 0.02;
          double DecreaseFactor = 3;
          int    MovingPeriod  = 12;
          int    MovingShift   = 6;
          int    MAGICMA_1 = 0;
          /////
          int buys = 0, sells = 0;
//---
          for(int i = 0; i < OrdersTotal() - 1; i++)
          {         if(OrderSelect(i, SELECT_BY_POS, MODE_TRADES))  //next loop///  if(OrderSelect(i, SELECT_BY_POS, MODE_TRADES) == false) countinue;//next loop///breakr out for loop
                              if(OrderSymbol() == Symbol() && OrderMagicNumber() == MAGICMA_1)
                              {         if(OrderType() == OP_BUY)  buys++;
                                        if(OrderType() == OP_SELL) sells++; //
                              }//
          }//
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Ct_Ticket Error", __LINE__, __FUNCTION__); //|
          //=========================================================|
          if(buys > 0) return(buys);//--- return orders volume
          else       return(-sells); //
}
//+------------------------------------------------------------------+
//|                      Total ct_Order Count                           |23
//+------------------------------------------------------------------+
int St_Ticket_Counter::TotalOrderCounter()
{         //============================//============================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Ct_Ticket Error", __LINE__, __FUNCTION__); //
          //============================//============================
          int OrderCount = 0;
          for(int Counter_ = 0; Counter_ <= OrdersTotal() - 1; Counter_++)
          {         bool select = OrderSelect(Counter_, SELECT_BY_POS);
                    //bool KeySelect      = !OrderSelect(Counter, SELECT_BY_POS, MODE_TRADES);
                    //me
                    bool KeyLiveOrder   = (OrderCloseTime() == 0);
                    bool KeyMagicOrder  = (OrderMagicNumber() ==  ct_Drive.TDD.ct_Bank.MagicNumber);
                    bool KeySymbolOrder = (OrderSymbol() == StSymbol.Current);
                    if(KeyLiveOrder && !KeyMagicOrder && !KeySymbolOrder) { OrderCount++;} //me
                    if(KeyLiveOrder && !KeyMagicOrder &&  KeySymbolOrder) { OrderCount++;} //me
                    if(KeyLiveOrder &&  KeyMagicOrder &&  KeySymbolOrder) { OrderCount++;} //zobat
                    if(KeyLiveOrder &&  KeyMagicOrder && !KeySymbolOrder) { OrderCount++;} //zobat
          }
          //============================//============================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Ct_Ticket Error", __LINE__, __FUNCTION__); //
          //============================//============================
          return(OrderCount); //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int St_Ticket_Counter::OrderCounter(int TypeOrder)
{         //==========================
          int OrderCount = 0;
//====================================================================
          switch(TypeOrder)
          {         case OP_BUY: {   }; break; //
                    case OP_SELL: {   }; break; //
                    case OP_BUYLIMIT: {   }; break; //
                    case OP_SELLLIMIT: {   }; break; //
                    case OP_BUYSTOP: {   }; break; //
                    case OP_SELLSTOP: {   }; break; //
          }
//====================================================================
          for(int Counter_ = 0; Counter_ <= OrdersTotal() - 1; Counter_++)
          {         bool select = OrderSelect(Counter_, SELECT_BY_POS);
                    if(select && (OrderType() == TypeOrder) && (OrderCloseTime() == 0))
                    {         if( (OrderMagicNumber() !=  ct_Drive.TDD.ct_Bank.MagicNumber) && (OrderSymbol() == StSymbol.Current)) { OrderCount++;} //me
                              if( (OrderMagicNumber() !=  ct_Drive.TDD.ct_Bank.MagicNumber) && (OrderSymbol() != StSymbol.Current)) { OrderCount++;} //me
                              if( (OrderMagicNumber() ==  ct_Drive.TDD.ct_Bank.MagicNumber) && (OrderSymbol() == StSymbol.Current)) { OrderCount++;} //zobat
                              if( (OrderMagicNumber() ==  ct_Drive.TDD.ct_Bank.MagicNumber) && (OrderSymbol() != StSymbol.Current)) { OrderCount++;} //zobat
                    }//
          }//
          return(OrderCount); //
//====================================================================
          return -1;//
}