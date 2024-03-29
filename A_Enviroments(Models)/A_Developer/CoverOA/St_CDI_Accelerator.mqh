//+------------------------------------------------------------------+
//||   ||||||||||     St_CDI_Accelerator.mqh  ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+


class St_CDI_Accelerator : public St_CDI_Base
{
public:
          void          iACs();
          double        Accelerator_0,          Accelerator_1;
          //---------------------------------------------------------------------------------------------------------------------------------------------------------
          bool          IsAccelerator_Up,       IsAccelerator_EMA20_CrossUp_Accelerator,        IsAccelerator_EMA20_CrossUp_SMA20;
          //---------------------------------------------------------------------------------------------------------------------------------------------------------
          double        Accelerator, First_Accelerator[], Second_Accelerator_EMA20[], Second_Accelerator_SMA20[], Second_Accelerator_EMA200[], Second_Accelerator_SMA200[];
          //---------------------------------------------------------------------------------------------------------------------------------------------------------
}; //---St_CDI_Accelerator     	Indicators_Accelerator;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void St_CDI_Accelerator::iACs()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
//// Bill Williams' Accelerator/Decelerator oscillator
          Accelerator_0                     = iAC(NULL, 0, 0);
          Accelerator_1                     = iAC(NULL, 0, 1);
          Init_XModeArray("iAC", First_Accelerator, Second_Accelerator_EMA20, Second_Accelerator_SMA20, Second_Accelerator_EMA200, Second_Accelerator_SMA200, 200);
//========================================================
          IsAccelerator_Up                            = Accelerator_0 > Accelerator_1;// Print("money_direction of money");
          IsAccelerator_EMA20_CrossUp_Accelerator     = Second_Accelerator_EMA20[0] > First_Accelerator[0];
          IsAccelerator_EMA20_CrossUp_SMA20           = Second_Accelerator_EMA20[0] > Second_Accelerator_SMA20[0];
///===
          ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          return;////
}

//+------------------------------------------------------------------+
//||   ||||||||||    St_CDI_Accelerator.mqh   ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+