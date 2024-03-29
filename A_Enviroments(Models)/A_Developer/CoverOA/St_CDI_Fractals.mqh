//+------------------------------------------------------------------+
//||   ||||||||||       St_CDI_Fractals.mqh   ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+


class St_CDI_Fractals : public St_CDI_Base
{         //---------------------------------------------------------------------------------------------------------------------------------------------------------
public:
          void          iFractalss();
          double        FractalsLOWER_0,        FractalsLOWER_1;
          double        First_FractalsLOWER[],  Second_FractalsLOWER_EMA20[],   Second_FractalsLOWER_SMA20[],   Second_FractalsLOWER_EMA200[],  Second_FractalsLOWER_SMA200[];
          bool          IsFractalsLOWER_EMA20_CrossUp_SMA20;
          bool          IsFractalsLOWER_0_UpTrend;
          //---------------------------------------------------------------------------------------------------------------------------------------------------------
          double        FractalsUPPER_0,        FractalsUPPER_1;
          double        First_FractalsUPPER[],  Second_FractalsUPPER_EMA20[],   Second_FractalsUPPER_SMA20[],   Second_FractalsUPPER_EMA200[],  Second_FractalsUPPER_SMA200[];
          bool          IsFractalsUPPER_EMA20_CrossUp_SMA20;
          bool          IsFractalsUPPER_0_UpTrend;
          //---------------------------------------------------------------------------------------------------------------------------------------------------------
          bool          IsFractalsUpWard;
          //---------------------------------------------------------------------------------------------------------------------------------------------------------
}; //--St_CDI_Fractals        Indicators_Fractals;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void St_CDI_Fractals::iFractalss()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
/// Fractals indicator
//========================================================
          FractalsLOWER_0                         = iFractals(NULL, 0, MODE_LOWER, 0);
          FractalsLOWER_1                         = iFractals(NULL, 0, MODE_LOWER, 1);
          FractalsUPPER_0                         = iFractals(NULL, 0, MODE_UPPER, 0);
          FractalsUPPER_1                         = iFractals(NULL, 0, MODE_UPPER, 1);
//========================================================< 55;
          IsFractalsLOWER_0_UpTrend               = FractalsLOWER_0 > FractalsLOWER_1 ; //Print("money_direction of money");
          IsFractalsUPPER_0_UpTrend               = FractalsUPPER_0 > FractalsUPPER_1 ; //Print("money_direction of money");
//==
//========================================================
          Init_XModeArray("iFractals", First_FractalsLOWER, Second_FractalsLOWER_EMA20, Second_FractalsLOWER_SMA20, Second_FractalsLOWER_EMA200, Second_FractalsLOWER_SMA200, 200);
          IsFractalsLOWER_EMA20_CrossUp_SMA20   = Second_FractalsLOWER_EMA20[0] > Second_FractalsLOWER_SMA20[0];
//===
          Init_XModeArray("iFractals", First_FractalsUPPER, Second_FractalsUPPER_EMA20, Second_FractalsUPPER_SMA20, Second_FractalsUPPER_EMA200, Second_FractalsUPPER_SMA200, 200);
          IsFractalsUPPER_EMA20_CrossUp_SMA20   = Second_FractalsUPPER_EMA20[0] > Second_FractalsUPPER_SMA20[0];
//========================================================
          IsFractalsUpWard  = IsFractalsLOWER_0_UpTrend && IsFractalsUPPER_0_UpTrend;
//========================================================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          return;//
}
//+------------------------------------------------------------------+
//||   ||||||||||       St_CDI_Fractals.mqh   ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+