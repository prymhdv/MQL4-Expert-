//+------------------------------------------------------------------+
//||   ||||||||||    St_CDI_Accumulation.mqh  ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+



class St_CDI_Accumulation : public St_CDI_Base
{
public:
          void          iADs();
          double        Accumulation_0,         Accumulation_1;
          double        First_Accumulation[],   Second_Accumulation_EMA20[],    Second_Accumulation_SMA20[],    Second_Accumulation_EMA200[],   Second_Accumulation_SMA200[];
          bool          IsAccumulation_EMA20_CrossUp_Accumulation,      IsAccumulation_EMA20_CrossUp_SMA20;
          //---------------------------------------------------------------------------------------------------------------------------------------------------------
}; //---St_CDI_Accumulation    Indicators_Accumulation;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void St_CDI_Accumulation::iADs()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
////Accumulation/Distribution indicator
          Accumulation_0                        = iAD(NULL, 0, 0);
          Accumulation_1                        = iAD(NULL, 0, 1);
//========================================================
          Init_XModeArray("iAD", First_Accumulation, Second_Accumulation_EMA20, Second_Accumulation_SMA20, Second_Accumulation_EMA200, Second_Accumulation_SMA200, 200);
          IsAccumulation_EMA20_CrossUp_Accumulation   = Second_Accumulation_EMA20[0] > First_Accumulation[0];
          IsAccumulation_EMA20_CrossUp_SMA20      = Second_Accumulation_EMA20[0] > Second_Accumulation_SMA20[0];
//========================================================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          return;////
}

//+------------------------------------------------------------------+
//||   ||||||||||    St_CDI_Accumulation.mqh  ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
