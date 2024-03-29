//+------------------------------------------------------------------+
//||   ||||||||||       St_CDI_Ichimoku.mqh   ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+

class St_CDI_Ichimoku : public St_CDI_Base
{         //---------------------------------------------------------------------------------------------------------------------------------------------------------
public:
          void          iIchimokus();
          double        tenkan_sen;
          double        kijun_sen;
          double        sen_kou_spana;
          double        sen_kou_spanb;
          double        chi_kou_span;
          //---------------------------------------------------------------------------------------------------------------------------------------------------------
}; //---St_CDI_Ichimoku        Indicators_Ichimoku;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void St_CDI_Ichimoku::iIchimokus()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          tenkan_sen                           = iIchimoku(NULL, 0, 9, 26, 52, MODE_TENKANSEN, 0);
          kijun_sen                            = iIchimoku(NULL, 0, 9, 26, 52, MODE_KIJUNSEN, 0);
          sen_kou_spana                        = iIchimoku(NULL, 0, 9, 26, 52, MODE_SENKOUSPANA, 0);
          sen_kou_spanb                        = iIchimoku(NULL, 0, 9, 26, 52, MODE_SENKOUSPANB, 0);
          chi_kou_span                         = iIchimoku(NULL, 0, 9, 26, 52, MODE_CHIKOUSPAN, 0);//
//===================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          return;///
} //


//+------------------------------------------------------------------+
//||   ||||||||||       St_CDI_Ichimoku.mqh   ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
