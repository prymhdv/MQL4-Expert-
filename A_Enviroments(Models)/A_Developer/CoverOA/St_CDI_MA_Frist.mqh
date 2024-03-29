//+------------------------------------------------------------------+
//||   ||||||||||       St_CDI_MA.mqh                               ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOA\St_CDI_Base.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\B_MQL\CoverOT\tMqlConductor.mqh>
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+

struct Stcd_Indicators_MA_Frist
{         //
          double Get_MovingAvreg(string _symbol, int _timeframe, int _period, int _ma_shift, ENUM_MA_METHOD _ma_method, ENUM_APPLIED_PRICE _applied_price, int _shift)
          {         return iMA(_symbol, _timeframe, _period, _ma_shift, _ma_method, _applied_price, _shift);}
          int Period_Selected;

          int Shift_Selected;

          int ApplyTo;                      //--   Close  Open   High  Low median  typical weighted   previus_Ind  frist_Ind

          int LevelCount;
          //--level by distance   1  2  3  4  5  6   7   8   9   10   11     12     13     14    15    16      17      18      19       20
          //--level by distance   10 20 30 50 80 130 210 340 550 890  1,440  2,330  3,770  6,100 9870  15,970  25,840  41,810  67,650   109,460
          //--level by distance   1  2  3  5  8  13  21  34  55  88   143    231    374    605   979   1584    2563    4147    6710     10857

          int MovingAvreg_Method;  //-- SMA EMA
          Std_Price     _Price;
          void SetPrices(double MA_Method_Price) 
          {         //---
                    _Price._Close         = 0;
                    _Price._Open          = 0;
                    _Price._High          = 0;
                    _Price._Low           = 0;
                    _Price._Median        = 0;
                    _Price._Typical       = 0;
                    _Price._Weighted      = 0;
                    _Price._previus_Ind   = 0;
                    _Price._frist_Ind     = 0;
                    //---
                    for(int k = 1; k < 10; k++) {_Price._Close_Level.Level[k].Posetive = 0;       _Price._Close_Level.Level[0].Negative = 0;}
                    //---
          };


};
//+------------------------------------------------------------------+
