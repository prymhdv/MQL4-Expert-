//+------------------------------------------------------------------+
//||   ||||||||||       St_CDI_ADX.mqh        ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class St_CDI_Volume : public St_CDI_Base
{
public:
          void          iVolumes();
          double        Volume_0,       Volume_1;
          int           Volume_Diff5,   Volume_Diff10;
          double        First_Volume[],         Second_Volume_EMA20[],  Second_Volume_SMA20[],  Second_Volume_EMA200[],         Second_Volume_SMA200[];
          bool          IsVolume_EMA20_CrossUp_Volume,  IsVolume_EMA20_CrossUp_SMA20;
          //---------------------------------------------------------------------------------------------------------------------------------------------------------
          double          Volume_M_[], Volume_[];
          //---------------------------------------------------------------------------------------------------------------------------------------------------------
}; //---St_CDI_Volume          Indicators_Volume;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void St_CDI_Volume::iVolumes()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
/////iVolume_Index
          Volume_0                              = (double)iVolume(NULL, 0, 0);
          Volume_1                              = (double)iVolume(NULL, 0, 1);
          Volume_Diff5                          = (int)(iVolume(NULL, 0, 1)  - iVolume(NULL, 0, 5));
          Volume_Diff10                         = (int)(iVolume(NULL, 0, 1)  - iVolume(NULL, 0, 10));
//========================================================
          Init_XModeArray("iVolume", First_Volume, Second_Volume_EMA20, Second_Volume_SMA20, Second_Volume_EMA200, Second_Volume_SMA200, 200);
          IsVolume_EMA20_CrossUp_Volume     = Second_Volume_EMA20[0] > First_Volume[0];
          IsVolume_EMA20_CrossUp_SMA20      = Second_Volume_EMA20[0] > Second_Volume_SMA20[0];
//========================================================
          ArrayResize(Volume_, 200);  ArrayResize(Volume_M_, 200);
          for(int i = 0; i < ArraySize(Volume_); i++) {         Volume_[i] = (double)Volume[i]; }
          for(int i = 0; i < ArraySize(Volume_); i++) {         Volume_M_[i]   = iMAOnArray(Volume_, 0, 200, 0, MODE_EMA, i); }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          return;//
}



//+------------------------------------------------------------------+
//||   ||||||||||       St_CDI_ADX.mqh        ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
