//+------------------------------------------------------------------+
//||   ||||||||||                 eTradePanel.mqh                   ||Ctp_TRADER
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
struct Stc_CandlePattern__Two_bar
{         void Update();
          //--- define prices of the necessary bars
          double        open1;          //= NormalizeDouble(iOpen(Symbol(), Period(), 1), Digits);
          double        open2;          //= NormalizeDouble(iOpen(Symbol(), Period(), 2), Digits);
          double        close1;         //= NormalizeDouble(iClose(Symbol(), Period(), 1), Digits);
          double        close2;         //= NormalizeDouble(iClose(Symbol(), Period(), 2), Digits);
          double        low1;           //= NormalizeDouble(iLow(Symbol(), Period(), 1), Digits);
          double        low2;           //= NormalizeDouble(iLow(Symbol(), Period(), 2), Digits);
          double        high1;          //= NormalizeDouble(iHigh(Symbol(), Period(), 1), Digits);
          double        high2;          //= NormalizeDouble(iHigh(Symbol(), Period(), 2), Digits);

};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Stc_CandlePattern__Two_bar::Update()
{         //
          //--- define prices of the necessary bars
          open1        = NormalizeDouble(iOpen(Symbol(), Period(), 1), Digits);
          open2        = NormalizeDouble(iOpen(Symbol(), Period(), 2), Digits);
          close1       = NormalizeDouble(iClose(Symbol(), Period(), 1), Digits);
          close2       = NormalizeDouble(iClose(Symbol(), Period(), 2), Digits);
          low1         = NormalizeDouble(iLow(Symbol(), Period(), 1), Digits);
          low2         = NormalizeDouble(iLow(Symbol(), Period(), 2), Digits);
          high1        = NormalizeDouble(iHigh(Symbol(), Period(), 1), Digits);
          high2        = NormalizeDouble(iHigh(Symbol(), Period(), 2), Digits);
          //--- if the second bar is bearish, while the first one is bullish
          if(
                    open2  > close2      && //the second bar is bullish
                    close1 > open1       && //the first bar is bearish
                    high2  > high1       && //the bar 2 High exceeds the first one's High
                    open2  > close1      && //the second bar's Open exceeds the first bar's Close
                    low2   < low1)          //the second bar's Low is lower than the first bar's Low
          {         //--- we have listed all the conditions defining that the first bar is completely within the second one
          //---
          //---
          }//---
          //---
}