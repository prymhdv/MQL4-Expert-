//+------------------------------------------------------------------+
//||   ||||||||||       St_CDI_ATR.mqh        ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+

class St_CDI_ATR : public St_CDI_Base
{         //---------------------------------------------------------------------------------------------------------------------------------------------------------
public:
          void          iATRs();
          double        Average_True_Range;
          double        ATR_200_0,      ATR_200_1;
          double        ATR_14_0,       ATR_14_1;
          //---------------------------------------------------------------------------------------------------------------------------------------------------------
          bool          IsATR_UP;
          double        First_ATR200[], Second_ATR200_EMA20[],  Second_ATR200_SMA20[],  Second_ATR200_EMA200[], Second_ATR200_SMA200[];
          double        First_ATR20[],  Second_ATR20_EMA20[],   Second_ATR20_SMA20[],   Second_ATR20_EMA200[],  Second_ATR20_SMA200[];
          //---------------------------------------------------------------------------------------------------------------------------------------------------------
          bool          IsATR200_EMA20_CrossUp_ATR200,          IsATR200_EMA20_CrossUp_SMA20,
                        IsATR20_EMA20_CrossUp_ATR20,            IsATR20_EMA20_CrossUp_SMA20;
          //---------------------------------------------------------------------------------------------------------------------------------------------------------

}; //---St_CDI_ATR             Indicators_ATR;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void St_CDI_ATR::iATRs()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
/////Average_True_Range
//
          ATR_200_0             = iATR(NULL, 0, 200, 0);
          ATR_200_1             = iATR(NULL, 0, 200, 1);
          ATR_14_0              = iATR(NULL, 0, 14, 0);
          ATR_14_1              = iATR(NULL, 0, 14, 1);
          Init_X200Array_X20Array("iATR", First_ATR200, Second_ATR200_EMA20, Second_ATR200_SMA20, Second_ATR200_EMA200, Second_ATR200_SMA200, First_ATR20, Second_ATR20_EMA20, Second_ATR20_SMA20, Second_ATR20_EMA200, Second_ATR20_SMA200, 200);
//========================================================
          IsATR_UP             = ATR_14_0 > ATR_14_1;// Print("money_direction of money");
          IsATR200_EMA20_CrossUp_ATR200     = Second_ATR200_EMA20[0] > First_ATR200[0];
          IsATR200_EMA20_CrossUp_SMA20      = Second_ATR200_EMA20[0] > Second_ATR200_SMA20[0];
///===
          IsATR20_EMA20_CrossUp_ATR20       = Second_ATR20_EMA20[0] > First_ATR20[0];
          IsATR20_EMA20_CrossUp_SMA20       = Second_ATR20_EMA20[0] > Second_ATR20_SMA20[0];
//========================================================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          return;//
}
//+------------------------------------------------------------------+
//||   ||||||||||       St_CDI_ATR.mqh        ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
