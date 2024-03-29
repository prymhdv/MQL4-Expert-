//+------------------------------------------------------------------+
//||   ||||||||||       St_CDI_OsMA.mqh       ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+

class St_CDI_OsMA : public St_CDI_Base
{
public:
          void          iOsMAs();
          double        OsMA_14_0,      OsMA_14_1;
          double        OsMA_200_0,     OsMA_200_1;
          //---------------------------------------------------------------------------------------------------------------------------------------------------------
          bool          IsOsMA_14_UpTrend,      IsOsMA_200_UpTrend,
                        IsOsMA20_CrossUp_200,   IsOsMA200_EMA20_CrossUp_SMA20,  IsOsMA20_EMA20_CrossUp_SMA20;
          //---------------------------------------------------------------------------------------------------------------------------------------------------------
          double        First_OsMA200[],        Second_OsMA200_EMA20[],         Second_OsMA200_SMA20[],         Second_OsMA200_EMA200[],        Second_OsMA200_SMA200[];
          double        First_OsMA20[],         Second_OsMA20_EMA20[],          Second_OsMA20_SMA20[],          Second_OsMA20_EMA200[],         Second_OsMA20_SMA200[];
          //---------------------------------------------------------------------------------------------------------------------------------------------------------

}; //---St_CDI_OsMA		Indicators_OsMA;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void St_CDI_OsMA::iOsMAs()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
/// Moving_Average_of_Oscillator
          OsMA_14_0              = iOsMA(NULL, 0, 12, 26, 9, PRICE_CLOSE, 0);
          OsMA_14_1              = iOsMA(NULL, 0, 12, 26, 9, PRICE_CLOSE, 1);
          OsMA_200_0             = iOsMA(NULL, 0, 120, 260, 90, PRICE_CLOSE, 0);
          OsMA_200_1             = iOsMA(NULL, 0, 120, 260, 90, PRICE_CLOSE, 1);
//========================================================
          IsOsMA_14_UpTrend             = (OsMA_14_0  > OsMA_14_1 ); //Print("money_direction of money");
          IsOsMA_200_UpTrend            = (OsMA_200_0 > OsMA_200_1); //Print("money_direction of money");
//========================================================
          Init_X200Array_X20Array("iOsMA", First_OsMA200, Second_OsMA200_EMA20, Second_OsMA200_SMA20, Second_OsMA200_EMA200, Second_OsMA200_SMA200, First_OsMA20, Second_OsMA20_EMA20, Second_OsMA20_SMA20, Second_OsMA20_EMA200, Second_OsMA20_SMA200, 200);
          IsOsMA20_CrossUp_200            = First_OsMA20[0] > First_OsMA200[0];
          IsOsMA200_EMA20_CrossUp_SMA20   = Second_OsMA200_EMA20[0] > Second_OsMA200_SMA20[0];
          IsOsMA20_EMA20_CrossUp_SMA20    = Second_OsMA20_EMA20[0] > Second_OsMA20_SMA20[0];//
//========================================================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          return;//
}

//+------------------------------------------------------------------+
//||   ||||||||||       St_CDI_OsMA.mqh       ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+