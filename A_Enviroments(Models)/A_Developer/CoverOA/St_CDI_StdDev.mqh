//+------------------------------------------------------------------+
//||   ||||||||||       St_CDI_StdDev.mqh     ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+


class St_CDI_StdDev : public St_CDI_Base
{
public:
          void          iStdDevs();
          double        StdDev_14_0,            StdDev_14_1;
          double        StdDev_200_0,           StdDev_200_1;
          //---------------------------------------------------------------------------------------------------------------------------------------------------------
          bool          IsStdDev_14_UpTrend,                    IsStdDev_200_UpTrend,
                        IsStdDev20_CrossUp_200,                 IsStdDev200_EMA20_CrossUp_SMA20,        IsStdDev20_EMA20_CrossUp_SMA20,
                        IsStdDev20_EMA200_CrossUp_SMA200,       IsStdDev200_EMA200_CrossUp_SMA200;
          //---------------------------------------------------------------------------------------------------------------------------------------------------------
          double        First_StdDev200[],      Second_StdDev200_EMA20[],       Second_StdDev200_SMA20[],       Second_StdDev200_EMA200[],      Second_StdDev200_SMA200[];
          //---------------------------------------------------------------------------------------------------------------------------------------------------------
          double        First_StdDev20[],       Second_StdDev20_EMA20[],        Second_StdDev20_SMA20[],        Second_StdDev20_EMA200[],       Second_StdDev20_SMA200[];
          //---------------------------------------------------------------------------------------------------------------------------------------------------------
          double        Standard_Deviation;
          double        Standard_DeviationArray;
          //---------------------------------------------------------------------------------------------------------------------------------------------------------

}; //--St_CDI_StdDev     	Indicators_StdDev;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void St_CDI_StdDev::iStdDevs()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
///Standard_Deviation
          double arrayset[];
          Standard_DeviationArray           = iStdDevOnArray(arrayset, 100, 10, 0, MODE_EMA, 0);
          StdDev_14_0                       = iStdDev(NULL,  0, 14, 0, MODE_EMA, PRICE_CLOSE, 0);
          StdDev_14_1                       = iStdDev(NULL,  0, 14, 0, MODE_EMA, PRICE_CLOSE, 1);
          StdDev_200_0                      = iStdDev(NULL,  0, 200, 0, MODE_EMA, PRICE_CLOSE, 0);
          StdDev_200_1                      = iStdDev(NULL,  0, 200, 0, MODE_EMA, PRICE_CLOSE, 1);
//========================================================
          IsStdDev_14_UpTrend             = (StdDev_14_0  > StdDev_14_1 ); //Print("money_direction of money");
          IsStdDev_200_UpTrend            = (StdDev_200_0 > StdDev_200_1); //Print("money_direction of money");
//========================================================
          Init_X200Array_X20Array("iStdDev", First_StdDev200, Second_StdDev200_EMA20, Second_StdDev200_SMA20, Second_StdDev200_EMA200, Second_StdDev200_SMA200, First_StdDev20, Second_StdDev20_EMA20, Second_StdDev20_SMA20, Second_StdDev20_EMA200, Second_StdDev20_SMA200, 200);
          IsStdDev20_CrossUp_200             = First_StdDev20[0] > First_StdDev200[0];
          IsStdDev20_EMA20_CrossUp_SMA20     = Second_StdDev20_EMA20[0] > Second_StdDev20_SMA20[0];//
          IsStdDev20_EMA200_CrossUp_SMA200   = Second_StdDev20_EMA200[0] > Second_StdDev20_SMA200[0];
          IsStdDev200_EMA200_CrossUp_SMA200  = Second_StdDev200_EMA200[0] > Second_StdDev200_SMA200[0];
          IsStdDev200_EMA20_CrossUp_SMA20    = Second_StdDev200_EMA20[0] > Second_StdDev200_SMA20[0];
//========================================================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          return;//
}

//+------------------------------------------------------------------+
//||   ||||||||||       St_CDI_StdDev.mqh     ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
