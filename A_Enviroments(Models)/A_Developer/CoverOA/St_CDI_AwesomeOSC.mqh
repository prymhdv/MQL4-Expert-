//+------------------------------------------------------------------+
//||   ||||||||||       St_CDI_AwesomeOSC.mqh ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+



class St_CDI_AwesomeOSC : public St_CDI_Base
{
public:
          void          iAOs();
          double        AwesomeOSC_0,           AwesomeOSC_1;
          double        First_AwesomeOSC[],     Second_AwesomeOSC_EMA20[],      Second_AwesomeOSC_SMA20[],      Second_AwesomeOSC_EMA200[],     Second_AwesomeOSC_SMA200[];
          bool          IsAwesomeOSC_EMA20_CrossUp_AwesomeOSC,          IsAwesomeOSC_EMA20_CrossUp_SMA20;
          //---------------------------------------------------------------------------------------------------------------------------------------------------------
}; //---St_CDI_AwesomeOSC      Indicators_AwesomeOSC;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void St_CDI_AwesomeOSC::iAOs()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
/// Awesome oscillator
          AwesomeOSC_0                          = iAO(NULL, 0, 0);
          AwesomeOSC_1                          = iAO(NULL, 0, 1);
//========================================================
          Init_XModeArray("iAO", First_AwesomeOSC, Second_AwesomeOSC_EMA20, Second_AwesomeOSC_SMA20, Second_AwesomeOSC_EMA200, Second_AwesomeOSC_SMA200, 200);
          IsAwesomeOSC_EMA20_CrossUp_AwesomeOSC   = Second_AwesomeOSC_EMA20[0] > First_AwesomeOSC[0];
          IsAwesomeOSC_EMA20_CrossUp_SMA20      = Second_AwesomeOSC_EMA20[0] > Second_AwesomeOSC_SMA20[0];
//========================================================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          return;////
}

//+------------------------------------------------------------------+
//||   ||||||||||       St_CDI_AwesomeOSC.mqh ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
