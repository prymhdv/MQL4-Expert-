//+------------------------------------------------------------------+
//||   ||||||||||       St_CDI_SAR.mqh        ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class St_CDI_SAR : public St_CDI_Base
{
public:   ~St_CDI_SAR() {}
          St_CDI_SAR() {ArrayResize(SARs, 50); }

          double        SAR_0,                  SAR_1;
          double        SARs[];
          void          iSARs();
          //---------------------------------------------------------------------------------------------------------------------------------------------------------
          double        First_SAR[],    Second_SAR_EMA20[],     Second_SAR_SMA20[],     Second_SAR_EMA200[],    Second_SAR_SMA200[];
          bool          IsSAR_EMA20_CrossUp_SAR,        IsSAR_EMA20_CrossUp_SMA20;
          //---
          double                Parabolic_Stop_and_Reverse;
          bool                  Is_SAR_ABOVE_CLOSE_1;
          //---------------------------------------------------------------------------------------------------------------------------------------------------------
}; //---St_CDI_SAR             Indicators_SAR;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void St_CDI_SAR::iSARs()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
//Parabolic_Stop_and_Reverse
          SAR_0             = iSAR(Symbol(), 0, 0.02, 0.2, 0);
          SAR_1             = iSAR(Symbol(), 0, 0.02, 0.2, 1);
          //--------------------------------------------------
          ArrayResize(SARs, ArraySize(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.t_iMACD_12_26_9_PriceClose));
          for(int i = 0; i < ArraySize(SARs) - 1; i++)
          {         SARs[i] = iSAR(Symbol(), 0, 0.02, 0.2, i); //
          }
          Is_SAR_ABOVE_CLOSE_1 = SAR_1 > Close[1];
//========================================================
          Init_XModeArray("iSAR", First_SAR, Second_SAR_EMA20, Second_SAR_SMA20, Second_SAR_EMA200, Second_SAR_SMA200, 200);
          IsSAR_EMA20_CrossUp_SAR        = Second_SAR_EMA20[0] > First_SAR[0];
          IsSAR_EMA20_CrossUp_SMA20      = Second_SAR_EMA20[0] > Second_SAR_SMA20[0];
//========================================================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          return;//
}



//+------------------------------------------------------------------+
//||   ||||||||||       St_CDI_SAR.mqh        ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
