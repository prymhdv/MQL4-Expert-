//+------------------------------------------------------------------+
//||   ||||||||||       St_CDI_Custom.mqh     ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+


class St_CDI_Custom : public St_CDI_Base
{
public:
          bool          isCustom;
          //---------------------------------------------------------
          void          iCustoms();
          string        pplocation;
          double        Custom;
          double        Custom2;
          //Alert((datetime)Custom," -",__LINE__);
          // double CustomZigzag                         = iCustom(NULL, 0, "RSI",1, 1);
          //---------------------------------------------------------
}; //---St_CDI_Custom 		Indicators_Custom;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void St_CDI_Custom::iCustoms()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
//          pplocation = "Indicators\\A-Zigzaging\\best_zigzag\\ZZ_SEMAFOR_02.mq4";
////Custom                               = iCustom(NULL, 0, "p-timer barometer", 0, 0);
//// Custom2                              = iCustom(NULL, 0, "pplocation", 0, 0);
////Alert((datetime)Custom," -",__LINE__);
//// double CustomZigzag                         = iCustom(NULL, 0, "RSI",1, 1);
//          double  CustomZigzag          = iCustom(NULL, 0, "ZigZag", 0, 0); //Alert(CustomZigzag, ",CustomZigzag,", __LINE__);
//          double ZigZagHigh = iCustom(NULL, 0, "ZigZag", MODE_HIGH, 0); //Alert(ZigZagHigh, ",ZigZagHigh,", __LINE__);
//          double ZigZagLow = iCustom(NULL, 0, "ZigZag", MODE_LOW, 0); //Alert(ZigZagLow, ",ZigZagLow,", __LINE__);
//          if(0)
//          {         int n = 0, i = 0;
//                    double zag = 0, zig = 0;
//                    i = 0;
//                    while(n < 2)
//                    {         if(zig > 0) zag = zig;
//                              zig = iCustom(NULL, 0, "ZigZag", 0, i);
//                              if(zig > 0) n += 1;
//                              i++; } ///
//                    //if(zag < zig) indicator shows down
//                    // if(zig < zag) indicator shows up
//                    //
//          } //
          ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          return;//
}


//+------------------------------------------------------------------+
//||   ||||||||||       St_CDI_Custom.mqh     ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
