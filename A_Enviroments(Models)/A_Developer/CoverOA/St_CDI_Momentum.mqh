//+------------------------------------------------------------------+
//||   ||||||||||       St_CDI_Momentum.mqh   ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+

class St_CDI_Momentum : public St_CDI_Base
{
public:
          void          iMomentums();
          double        Momentum_14_0,          Momentum_14_1;
          double        Momentum_200_0,         Momentum_200_1;
          //---------------------------------------------------------------------------------------------------------------------------------------------------------
          bool          IsMomentum_14_UpTrend,                  IsMomentum_200_UpTrend,
                        IsMomentum20_CrossUp_200,               IsMomentum200_EMA20_CrossUp_SMA20,      IsMomentum20_EMA20_CrossUp_SMA20,
                        IsMomentum20_EMA200_CrossUp_SMA200,     IsMomentum200_EMA200_CrossUp_SMA200;
          //---------------------------------------------------------------------------------------------------------------------------------------------------------
          double        First_Momentum200[],    Second_Momentum200_EMA20[],     Second_Momentum200_SMA20[],     Second_Momentum200_EMA200[],    Second_Momentum200_SMA200[];
          double        First_Momentum20[],     Second_Momentum20_EMA20[],      Second_Momentum20_SMA20[],      Second_Momentum20_EMA200[],     Second_Momentum20_SMA200[];
          //---------------------------------------------------------------------------------------------------------------------------------------------------------
          double        MomentumOnArray;
          //---------------------------------------------------------------------------------------------------------------------------------------------------------
          double                Momentum;
          //---------------------------------------------------------------------------------------------------------------------------------------------------------
}; //---St_CDI_Momentum     Indicators_Momentum;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void St_CDI_Momentum::iMomentums()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
///Momentum
          double arrayset[];
          MomentumOnArray                     = iMomentumOnArray(arrayset, 100, 12, 0);////ExtBufferX[1] its is value af arry not arry
          Momentum_14_0                       = iMomentum(NULL, 0, 14, PRICE_CLOSE, 0);
          Momentum_14_1                       = iMomentum(NULL, 0, 14, PRICE_CLOSE, 1);
          Momentum_200_0                      = iMomentum(NULL, 0, 200, PRICE_CLOSE, 0);
          Momentum_200_1                      = iMomentum(NULL, 0, 200, PRICE_CLOSE, 1);
//========================================================
          IsMomentum_14_UpTrend             = (Momentum_14_0  > Momentum_14_1 ); //Print("money_direction of money");
          IsMomentum_200_UpTrend            = (Momentum_200_0 > Momentum_200_1); //Print("money_direction of money");
//========================================================
          Init_X200Array_X20Array("iMomentum", First_Momentum200, Second_Momentum200_EMA20, Second_Momentum200_SMA20, Second_Momentum200_EMA200, Second_Momentum200_SMA200, First_Momentum20, Second_Momentum20_EMA20, Second_Momentum20_SMA20, Second_Momentum20_EMA200, Second_Momentum20_SMA200, 200);
          IsMomentum20_CrossUp_200             = First_Momentum20[0] > First_Momentum200[0];
          IsMomentum20_EMA20_CrossUp_SMA20     = Second_Momentum20_EMA20[0] > Second_Momentum20_SMA20[0];//
          IsMomentum20_EMA200_CrossUp_SMA200   = Second_Momentum20_EMA200[0] > Second_Momentum20_SMA200[0];
          IsMomentum200_EMA200_CrossUp_SMA200  = Second_Momentum200_EMA200[0] > Second_Momentum200_SMA200[0];
          IsMomentum200_EMA20_CrossUp_SMA20    = Second_Momentum200_EMA20[0] > Second_Momentum200_SMA20[0];
//========================================================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          return;///
}

//+------------------------------------------------------------------+
//||   ||||||||||       St_CDI_Momentum.mqh   ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
