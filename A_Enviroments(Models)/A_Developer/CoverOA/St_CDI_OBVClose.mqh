//+------------------------------------------------------------------+
//||   ||||||||||       St_CDI_OBVClose.mqh   ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+


class St_CDI_OBVClose : public St_CDI_Base
{
public:
          void          iOBVs();
          double        OBVClose_0,             OBVClose_1;
          //---------------------------------------------------------------------------------------------------------------------------------------------------------
          double        First_OBVClose[],       Second_OBVClose_EMA20[],        Second_OBVClose_SMA20[],        Second_OBVClose_EMA200[],       Second_OBVClose_SMA200[];
          bool          IsOBVClose_EMA20_CrossUp_OBVClose,      IsOBVClose_EMA20_CrossUp_SMA20;
          //---------------------------------------------------------------------------------------------------------------------------------------------------------
}; //---St_CDI_OBVClose        Indicators_OBVClose;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void St_CDI_OBVClose::iOBVs()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
//// On Balance Volume indicator
          OBVClose_0                             = iOBV(NULL, 0, PRICE_CLOSE, 0);
          OBVClose_1                             = iOBV(NULL, 0, PRICE_CLOSE, 1);
//========================================================
          Init_XModeArray("iOBV", First_OBVClose, Second_OBVClose_EMA20, Second_OBVClose_SMA20, Second_OBVClose_EMA200, Second_OBVClose_SMA200, 200);
          IsOBVClose_EMA20_CrossUp_OBVClose   = Second_OBVClose_EMA20[0] > First_OBVClose[0];
          IsOBVClose_EMA20_CrossUp_SMA20      = Second_OBVClose_EMA20[0] > Second_OBVClose_SMA20[0];
//========================================================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          return;//
}
//+------------------------------------------------------------------+
//||   ||||||||||       St_CDI_OBVClose.mqh   ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+