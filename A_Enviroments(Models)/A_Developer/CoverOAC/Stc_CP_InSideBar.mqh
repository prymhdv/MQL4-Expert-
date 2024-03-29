//+------------------------------------------------------------------+
//||   ||||||||||               Stc_Bar_Info.mqh                    ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
struct Std_info_Order
{         string        OO_symbol;
          int           OO_cmd;
          double        OO_volume;
          double        OO_price;
          int           OO_slippage;
          double        OO_stoploss;
          double        OO_takeprofit;
          string        OO_comment;
          int           OO_magic;
          datetime      OO_expiration;
          color         OO_arrow_color;

};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
struct Std_info_Trade
{         int           interval;             //= 20;                               //Interval
          double        lot;                  //= 0.1;                              //Lot Size
          int           TP;                   //= 300;                              //Take Profit
          int           magic;                //= 555124;                           //Magic number
          int           slippage;             //= 2;                                //Slippage
          int           ExpDate;              //= 48;                               //Expiration Hour ct_Order
          datetime      _ExpDate;            // = 0;   //local variable to define a pending order expiration time

          double        buyPrice,            //define BuyStop price
                        buyTP,               //Take Profit BuyStop
                        buySL,               //Stop Loss BuyStop
                        sellPrice,           //define SellStop price
                        sellTP,              //Take Profit SellStop
                        sellSL;              //Stop Loss SellStop
          //---
          double        _bid ;
          double        _ask;
          //---
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
//---Current Inside Bar  previous Mother bar
struct Stc_CandlePattern__InSideBar
{         void                  Stc_CandlePattern__InSideBar();
          void                  Check_Candlestick_Pattern(int i, ENUM_TIMEFRAMES f);
          void                  CheckCondition(int i, ENUM_TIMEFRAMES f);

          double                open1,               //first candle Open price
                                open2,               //second candle Open price
                                close1,              //first candle Close price
                                close2,              //second candle Close price
                                low1,                //first candle Low price
                                low2,                //second candle Low price
                                high1,               //first candle High price
                                high2;               //second candle High price
          //---
          double                bar2size_def;             //= 800;   Bar 2 Default Size
          double                _bar2size, _bar1size  ;
          bool                  Is_not_flat;
          //----
          double                _point;
          bool                  Is_Bar1_bearish__Bar0_bullish,                  Is_InSideBar_Bulish;      //----Exported
          bool                  Is_Bar1_bullish__Bar0_bearish,                  Is_InSideBar_bearish;     //----Exported

          bool                  Is_Bar1_bearish__Bar0_bullish_Engulfing,        Is_Engulfing_bullish;     //----Exported      
          bool                  Is_Bar1_bullish__Bar0_bearish_Engulfing,        Is_Engulfing_bearish;     //----Exported

          double                Support_Level;
          double                BuyStop_Level;


          Std_info_Trade        info_Trade;
          datetime              timeBarInside;      //time of the bar, at which inside bar orders were opened, to avoid re-opening.
          datetime              timeBUOVB_BEOVB;    // orders are not yet opened for this pattern //indicate that orders are already placed on this pattern
          //---
          void                  Update();

          int                   OrderOpenF(Std_info_Order &v);
          void                  SetOrder();//
          //
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Stc_CandlePattern__InSideBar::Stc_CandlePattern__InSideBar()
{         info_Trade.interval      = 20;                               //Interval
          info_Trade.lot           = 0.1;                              //Lot Size
          info_Trade.TP            = 300;                              //Take Profit
          info_Trade.magic         = 555124;                           //Magic number
          info_Trade.slippage      = 2;                                //Slippage
          info_Trade.ExpDate       = 48;                               //Expiration Hour ct_Order
          bar2size_def             = 800 * Point;                      //Bar 2 Default Size
//---
          info_Trade._ExpDate      = 0;   //local variable to define a pending order expiration time
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Stc_CandlePattern__InSideBar::Check_Candlestick_Pattern(int i, ENUM_TIMEFRAMES f)
{
//---
          CheckCondition(i, f);
//---
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Stc_CandlePattern__InSideBar::CheckCondition(int i, ENUM_TIMEFRAMES f)
{         //--- define prices of the necessary bars
          open1        = NormalizeDouble(iOpen(Symbol(),  f, i + 0), Digits);
          open2        = NormalizeDouble(iOpen(Symbol(),  f, i + 1), Digits);
          //
          close1       = NormalizeDouble(iClose(Symbol(), f, i + 0), Digits);
          close2       = NormalizeDouble(iClose(Symbol(), f, i + 1), Digits);
          //
          low1         = NormalizeDouble(iLow(Symbol(),   f, i + 0), Digits);
          low2         = NormalizeDouble(iLow(Symbol(),   f, i + 1), Digits);
          //
          high1        = NormalizeDouble(iHigh(Symbol(),  f, i + 0), Digits);
          high2        = NormalizeDouble(iHigh(Symbol(),  f, i + 1), Digits);
          //---
          _point        = MarketInfo(Symbol(), MODE_POINT);
          _bar2size     = NormalizeDouble(((high2 - low2) / _point), 0);
          _bar1size     = NormalizeDouble(((high1 - low1) / _point), 0);
          //----
          {         //
                    {         //--- if the second bar is bearish, while the first one is bullish OP_BUYSTOP   //--like two candel hammer
                              Is_InSideBar_Bulish = Is_Bar1_bearish__Bar0_bullish =
                                                              //
                                                              //timeBarInside != iTime(Symbol(),  (ENUM_TIMEFRAMES)f, 1)     && //no orders have been opened at this pattern yet
                                                              //_bar2size > bar2size_def                              && //the second bar is big enough, so the market is not flat
                                                              //
                                                              open2 > close2                                    && //the second bar is bearish ok
                                                              close1 > open1                                    && //the first bar is bullish  ok
                                                              //
                                                              high2 > high1                                     && //the bar 2 High exceeds the first one's High ok
                                                              open2 > close1                                    && //the second bar's Open exceeds the first one's Close ok
                                                              //
                                                              low2 < low1;                                         //the second bar's Low is lower than the first one's Low  ok   or equal
                              //---
                    }//
                    {         //--- if the second bar is bullish, while the first one is bearish OP_SELLSTOP //--like two candel hammer
                              Is_InSideBar_bearish = Is_Bar1_bullish__Bar0_bearish =
                                                               //timeBarInside != iTime(Symbol(), f, 1)     && //no orders have been opened at this pattern yet
                                                               //_bar2size > bar2size_def                              && //the second bar is big enough, so the market is not flat
                                                               //
                                                               open2 < close2                                    && //the second bar is bullish ok
                                                               close1 < open1                                    && //the first bar is bearish  ok
                                                               //
                                                               high2 > high1                                     && //the second bar's High is higher than the first one's High ok
                                                               open2 < close1                                    && //the second bar's Open exceeds the first one's Close ok
                                                               //
                                                               low2 < low1;                                         //the bar 2 Low exceeds the first one's Low ok or equal
                              //---
                    }//
          }
          {
                    {         //--- Finding bearish pattern BEOVB OP_SELLSTOP //--like two candel hammer
                              Is_Engulfing_bearish = Is_Bar1_bullish__Bar0_bearish_Engulfing =
                                                               //timeBUOVB_BEOVB != iTime(Symbol(), f, 1) && // orders are not yet opened for this pattern
                                                               //_bar1size > bar2size_def && //first bar is big enough not to consider a flat market  ok
                                                               //
                                                               low1   < low2 &&           //First bar's Low is below second bar's Low  ok
                                                               high1  > high2 &&          //First bar's High is above second bar's High  ok
                                                               //
                                                               close1 < open2 &&          //First bar's Close price is lower than second bar's Open price  ok
                                                               open1  > close1 &&         //First bar is a bearish bar  ok
                                                               open2  < close2            //Second bar is a bullish bar  Ok
                                                               ;//
                    }
                    {         //--- Finding bullish pattern BUOVB OP_BUYSTOP //--like two candel hammer OP_BUYSTOP
                              Is_Engulfing_bullish = Is_Bar1_bearish__Bar0_bullish_Engulfing =
                                                               //timeBUOVB_BEOVB != iTime(Symbol(), f, 1) && // orders are not yet opened for this pattern
                                                               //_bar1size > bar2size_def && //first bar is big enough not to consider a flat market
                                                               //
                                                               low1   < low2 &&           //First bar's Low is below second bar's Low ok
                                                               high1  > high2 &&          //First bar's High is above second bar's High ok
                                                               //
                                                               close1 > open2 &&          //First bar's Close price is higher than second bar's Open price ok
                                                               open1  < close1 &&         //First bar is a bullish bar ok
                                                               open2  > close2            //Second bar is a bearish bar ok
                                                               ; //
                    }//
          }
          if(Is_InSideBar_Bulish)  {Support_Level = close2;  BuyStop_Level = high1;  timeBarInside   = iTime(Symbol(), f, 1);};
          if(Is_InSideBar_bearish) {Support_Level = open2;   BuyStop_Level = low1;   timeBarInside   = iTime(Symbol(), f, 1);};
          if(Is_Engulfing_bearish) {Support_Level = high1;   BuyStop_Level = low1;   timeBUOVB_BEOVB = iTime(Symbol(), f, 1);};    //--- we have described all conditions indicating that the first bar completely engulfs the second bar and is a bearish bar
          if(Is_Engulfing_bullish) {Support_Level = low1;    BuyStop_Level = high1;  timeBUOVB_BEOVB = iTime(Symbol(), f, 1);};    //--- we have described all conditions indicating that the first bar completely engulfs the second bar and is a bullish bar
          //---
}
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void Stc_CandlePattern__InSideBar::Update()
{         info_Trade._bid     = NormalizeDouble(MarketInfo(Symbol(), MODE_BID), Digits); //define a lower price
          info_Trade._ask     = NormalizeDouble(MarketInfo(Symbol(), MODE_ASK), Digits); //define an upper price
          //---
          CheckCondition(0, (ENUM_TIMEFRAMES)Period());
          //---
          if(Is_Bar1_bearish__Bar0_bullish && false) SetOrder();//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Stc_CandlePattern__InSideBar::SetOrder()
{         //---
          info_Trade.buyPrice    = NormalizeDouble(high2 + info_Trade.interval * _point, Digits); //define an order price considering the interval
          info_Trade.buySL       = NormalizeDouble(low2 - info_Trade.interval * _point, Digits);  //define a stop loss considering the interval
          info_Trade.buyTP       = NormalizeDouble(info_Trade.buyPrice + info_Trade.TP * _point, Digits);    //define a take profit
          //---
          info_Trade._ExpDate    = TimeCurrent() + info_Trade.ExpDate * 60 * 60;                  //a pending order expiration time calculation
          //---
          info_Trade.sellPrice   = NormalizeDouble(low2 - info_Trade.interval * _point, Digits);
          info_Trade.sellSL      = NormalizeDouble(high2 + info_Trade.interval * _point, Digits);
          info_Trade.sellTP      = NormalizeDouble(info_Trade.sellPrice - info_Trade.TP * _point, Digits);
          //---
          //---
          if(false)
          {         Std_info_Order Order_;
                    Order_.OO_symbol            = Symbol();
                    Order_.OO_cmd               = OP_BUYSTOP;
                    Order_.OO_volume            = info_Trade.lot;
                    Order_.OO_price             = info_Trade.buyPrice;
                    Order_.OO_slippage          = info_Trade.slippage;
                    Order_.OO_stoploss          = info_Trade.buySL;
                    Order_.OO_takeprofit        = info_Trade.buyTP;
                    Order_.OO_comment           = NULL;
                    Order_.OO_magic             = info_Trade.magic;
                    Order_.OO_expiration        = info_Trade._ExpDate;
                    Order_.OO_arrow_color       = Blue;
                    //----
                    OrderOpenF(Order_);
                    //-------------------------------
                    Order_.OO_symbol            = Symbol();
                    Order_.OO_cmd               = OP_SELLSTOP;
                    Order_.OO_volume            = info_Trade.lot;
                    Order_.OO_price             = info_Trade.sellPrice;
                    Order_.OO_slippage          = info_Trade.slippage;
                    Order_.OO_stoploss          = info_Trade.sellSL;
                    Order_.OO_takeprofit        = info_Trade.sellTP;
                    Order_.OO_comment           = NULL;
                    Order_.OO_magic             = info_Trade.magic;
                    Order_.OO_expiration        = info_Trade._ExpDate;
                    Order_.OO_arrow_color       = Blue;
                    //----
                    OrderOpenF(Order_);//
          }
          //-------------------------------
          //--- we have listed all the conditions defining that the first bar is completely within the second one
          timeBarInside = iTime(Symbol(), Period(), 1); //indicate that orders are already placed on this pattern
}
//+----------------------------------------------------------------------------------------------------------------------+
//| The function opens or sets an order                                                                                  |
//| symbol      - symbol, at which a deal is performed.                                                                  |
//| cmd         - a deal (may be equal to any of the deal values).                                                       |
//| volume      - amount of lots.                                                                                        |
//| price       - Open price.                                                                                            |
//| slippage    - maximum price deviation for market buy or sell orders.                                                 |
//| stoploss    - position close price when an unprofitability level is reached (0 if there is no unprofitability level).|
//| takeprofit  - position close price when a profitability level is reached (0 if there is no profitability level).     |
//| comment     - order comment. The last part of comment can be changed by the trade server.                            |
//| magic       - order magic number. It can be used as a user-defined ID.                                               |
//| expiration  - pending order expiration time.                                                                         |
//| arrow_color - open arrow color on a chart. If the parameter is absent or equal to CLR_NONE,                          |
//|               the open arrow is not displayed on a chart.                                                            |
//+----------------------------------------------------------------------------------------------------------------------+
int Stc_CandlePattern__InSideBar::OrderOpenF(Std_info_Order &_ORDER)
{         //---
          int      result       = -1;    //result of opening an order
          int      Error        = 0;     //error when opening an order
          int      attempt      = 0;     //amount of performed attempts
          int      attemptMax   = 3;     //maximum amount of attempts
          bool     exit_loop    = false; //exit the loop
          string   lang         = TerminalInfoString(TERMINAL_LANGUAGE); //trading terminal language, for defining the language of the messages
          double   stopllvl     = NormalizeDouble(MarketInfo(_ORDER.OO_symbol, MODE_STOPLEVEL) * MarketInfo(_ORDER.OO_symbol, MODE_POINT), Digits); //minimum stop loss/ take profit level, in points
          double        tp;
          double        sl;
          //---
          //the module provides safe order opening.
          //--- check stop orders for buying
          if(_ORDER.OO_cmd == OP_BUY || _ORDER.OO_cmd == OP_BUYLIMIT || _ORDER.OO_cmd == OP_BUYSTOP)
          {         tp = (_ORDER.OO_takeprofit - _ORDER.OO_price) / MarketInfo(_ORDER.OO_symbol, MODE_POINT);
                    sl = (_ORDER.OO_price - _ORDER.OO_stoploss) / MarketInfo(_ORDER.OO_symbol, MODE_POINT);
                    if(tp > 0 && tp <= stopllvl)
                    {         _ORDER.OO_takeprofit = _ORDER.OO_price + stopllvl + 2 * MarketInfo(_ORDER.OO_symbol, MODE_POINT); }
                    if(sl > 0 && sl <= stopllvl)
                    {         _ORDER.OO_stoploss = _ORDER.OO_price - (stopllvl + 2 * MarketInfo(_ORDER.OO_symbol, MODE_POINT)); }//
          }
          //--- check stop orders for selling
          if(_ORDER.OO_cmd == OP_SELL || _ORDER.OO_cmd == OP_SELLLIMIT || _ORDER.OO_cmd == OP_SELLSTOP)
          {         tp = (_ORDER.OO_price - _ORDER.OO_takeprofit) / MarketInfo(_ORDER.OO_symbol, MODE_POINT);
                    sl = (_ORDER.OO_stoploss - _ORDER.OO_price) / MarketInfo(_ORDER.OO_symbol, MODE_POINT);
                    if(tp > 0 && tp <= stopllvl)
                    {         _ORDER.OO_takeprofit = _ORDER.OO_price - (stopllvl + 2 * MarketInfo(_ORDER.OO_symbol, MODE_POINT)); }
                    if(sl > 0 && sl <= stopllvl)
                    {         _ORDER.OO_stoploss = _ORDER.OO_price + stopllvl + 2 * MarketInfo(_ORDER.OO_symbol, MODE_POINT); }//
          }
          //---
          //--- while loop
          while(!exit_loop)
          {         //---
                    result = OrderSend(_ORDER.OO_symbol, _ORDER.OO_cmd, _ORDER.OO_volume, _ORDER.OO_price, _ORDER.OO_slippage, _ORDER.OO_stoploss, _ORDER.OO_takeprofit, _ORDER.OO_comment, _ORDER.OO_magic, _ORDER.OO_expiration, _ORDER.OO_arrow_color); //attempt to open an order using the specified parameters
                    //--- if there is an error when opening an order
                    if(result < 0)
                    {         Error = GetLastError();                                     //assign a code to an error
                              switch(Error)                                               //error enumeration
                              {         //order closing error enumeration and an attempt to fix them
                                        case  2:
                                                  if(attempt < attemptMax)
                                                  {         attempt = attempt + 1;                             //define one more attempt
                                                            Sleep(3000);                                       //3 seconds of delay
                                                            RefreshRates();
                                                            break;                                             //exit switch
                                                  }
                                                  if(attempt == attemptMax)
                                                  {         attempt = 0;                                       //reset the amount of attempts to zero
                                                            exit_loop = true;                                  //exit while
                                                            break;                                             //exit switch
                                                  }
                                        case  3:
                                                  RefreshRates();
                                                  exit_loop = true;                                     //exit while
                                                  break;                                                //exit switch
                                        case  4:
                                                  if(attempt < attemptMax)
                                                  {         attempt = attempt + 1;                             //define one more attempt
                                                            Sleep(3000);                                       //3 seconds of delay
                                                            RefreshRates();
                                                            break;                                             //exit switch
                                                  }
                                                  if(attempt == attemptMax)
                                                  {         attempt = 0;                                       //reset the amount of attempts to zero
                                                            exit_loop = true;                                  //exit while
                                                            break;                                             //exit switch
                                                  }
                                        case  5:
                                                  exit_loop = true;                                     //exit while
                                                  break;                                                //exit switch
                                        case  6:
                                                  if(attempt < attemptMax)
                                                  {         attempt = attempt + 1;                             //define one more attempt
                                                            Sleep(5000);                                       //3 seconds of delay
                                                            break;                                             //exit switch
                                                  }
                                                  if(attempt == attemptMax)
                                                  {         attempt = 0;                                       //reset the amount of attempts to zero
                                                            exit_loop = true;                                  //exit while
                                                            break;                                             //exit switch
                                                  }
                                        case  8:
                                                  if(attempt < attemptMax)
                                                  {         attempt = attempt + 1;                             //define one more attempt
                                                            Sleep(7000);                                       //3 seconds of delay
                                                            break;                                             //exit switch
                                                  }
                                                  if(attempt == attemptMax)
                                                  {         attempt = 0;                                       //reset the amount of attempts to zero
                                                            exit_loop = true;                                  //exit while
                                                            break;                                             //exit switch
                                                  }
                                        case 64:
                                                  exit_loop = true;                                     //exit while
                                                  break;                                                //exit switch
                                        case 65:
                                                  exit_loop = true;                                     //exit while
                                                  break;                                                //exit switch
                                        case 128:
                                                  Sleep(3000);
                                                  RefreshRates();
                                                  continue;                                             //exit switch
                                        case 129:
                                                  if(attempt < attemptMax)
                                                  {         attempt = attempt + 1;                             //define one more attempt
                                                            Sleep(3000);                                       //3 seconds of delay
                                                            RefreshRates();
                                                            break;                                             //exit switch
                                                  }
                                                  if(attempt == attemptMax)
                                                  {         attempt = 0;                                       //reset the amount of attempts to zero
                                                            exit_loop = true;                                  //exit while
                                                            break;                                             //exit switch
                                                  }
                                        case 130:
                                                  exit_loop = true;                                     //exit while
                                                  break;
                                        case 131:
                                                  exit_loop = true;                                     //exit while
                                                  break;                                                //exit switch
                                        case 132:
                                                  Sleep(10000);                                         //sleep for 10 seconds
                                                  RefreshRates();                                       //update data
                                                  //exit_loop = true;                                   //exit while
                                                  break;                                                //exit switch
                                        case 133:
                                                  exit_loop = true;                                     //exit while
                                                  break;                                                //exit switch
                                        case 134:
                                                  exit_loop = true;                                     //exit while
                                                  break;                                                //exit switch
                                        case 135:
                                                  if(attempt < attemptMax)
                                                  {         attempt = attempt + 1;                             //define one more attempt
                                                            RefreshRates();
                                                            break;                                             //exit switch
                                                  }
                                                  if(attempt == attemptMax)
                                                  {         attempt = 0;                                       //reset the amount of attempts to zero
                                                            exit_loop = true;                                  //exit while
                                                            break;                                             //exit switch
                                                  }
                                        case 136:
                                                  if(attempt < attemptMax)
                                                  {         attempt = attempt + 1;                             //define one more attempt
                                                            RefreshRates();
                                                            break;                                             //exit switch
                                                  }
                                                  if(attempt == attemptMax)
                                                  {         attempt = 0;                                       //reset the amount of attempts to zero
                                                            exit_loop = true;                                  //exit while
                                                            break;                                             //exit switch
                                                  }
                                        case 137:
                                                  if(attempt < attemptMax)
                                                  {         attempt = attempt + 1;
                                                            Sleep(2000);
                                                            RefreshRates();
                                                            break; }
                                                  if(attempt == attemptMax)
                                                  {         attempt = 0;
                                                            exit_loop = true;
                                                            break; }
                                        case 138:
                                                  if(attempt < attemptMax)
                                                  {         attempt = attempt + 1;
                                                            Sleep(1000);
                                                            RefreshRates();
                                                            break; }
                                                  if(attempt == attemptMax)
                                                  {         attempt = 0;
                                                            exit_loop = true;
                                                            break; }
                                        case 139:
                                                  exit_loop = true;
                                                  break;
                                        case 141:
                                                  Sleep(5000);
                                                  exit_loop = true;
                                                  break;
                                        case 145:
                                                  exit_loop = true;
                                                  break;
                                        case 146:
                                                  if(attempt < attemptMax)
                                                  {         attempt = attempt + 1;
                                                            Sleep(2000);
                                                            RefreshRates();
                                                            break; }
                                                  if(attempt == attemptMax)
                                                  {         attempt = 0;
                                                            exit_loop = true;
                                                            break; }
                                        case 147:
                                                  if(attempt < attemptMax)
                                                  {         attempt = attempt + 1;
                                                            _ORDER.OO_expiration = 0;
                                                            break; }
                                                  if(attempt == attemptMax)
                                                  {         attempt = 0;
                                                            exit_loop = true;
                                                            break; }
                                        case 148:
                                                  exit_loop = true;
                                                  break;
                                        default:
                                                  Print("Error: ", Error);
                                                  exit_loop = true; //exit while
                                                  break;          //other options
                              } }
                    //--- if no errors detected
                    else
                    {         if(lang == "Russian") {Print("Ордер успешно открыт. ", result);}
                              if(lang == "English") {Print("The order is successfully opened.", result);}
                              Error = 0;                                //reset the error code to zero
                              break;                                    //exit while
                              //errorCount =0;                          //reset the amount of attempts to zero
                    }//
          }
          return(result);//
}
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
