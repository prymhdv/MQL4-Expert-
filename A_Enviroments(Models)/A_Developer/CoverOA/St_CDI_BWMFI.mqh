//+------------------------------------------------------------------+
//||   ||||||||||       St_CDI_BWMFI.mqh      ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+


class St_CDI_BWMFI : public St_CDI_Base
{
public:
          void          iBWMFIs();
          double        BWMFI_0,                BWMFI_1;
          double        First_BWMFI[],  Second_BWMFI_EMA20[],   Second_BWMFI_SMA20[],   Second_BWMFI_EMA200[],  Second_BWMFI_SMA200[];
          bool          IsBWMFI_EMA20_CrossUp_BWMFI,    IsBWMFI_EMA20_CrossUp_SMA20;
          //---
          double                Market_Facilitation_Index;
          //---------------------------------------------------------------------------------------------------------------------------------------------------------
}; ///--St_CDI_BWMFI           Indicators_BWMFI;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void St_CDI_BWMFI::iBWMFIs()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
/////Market_Facilitation_Index
          BWMFI_0                              = iBWMFI(NULL, 0, 0);
          BWMFI_1                              = iBWMFI(NULL, 0, 1);
//========================================================
          Init_XModeArray("iOBV", First_BWMFI, Second_BWMFI_EMA20, Second_BWMFI_SMA20, Second_BWMFI_EMA200, Second_BWMFI_SMA200, 200);
          IsBWMFI_EMA20_CrossUp_BWMFI   = Second_BWMFI_EMA20[0] > First_BWMFI[0];
          IsBWMFI_EMA20_CrossUp_SMA20      = Second_BWMFI_EMA20[0] > Second_BWMFI_SMA20[0];
//========================================================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          return;//
}

//+------------------------------------------------------------------+
//||   ||||||||||       St_CDI_BWMFI.mqh      ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
