//+------------------------------------------------------------------+
//||   ||||||||||       St_CDI_RVI.mqh        ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+


class St_CDI_RVI : public St_CDI_Base
{
public:
          void                  iRVIs();
          double                RVI_M_200_0,    RVI_M_200_1,    RVI_S_200_0,    RVI_S_200_1;
          double                RVI_M_14_0,     RVI_M_14_1,     RVI_S_14_0,     RVI_S_14_1;
          bool                  KeyRVI_M_14_0_UpTrend,          KeyRVI_S_14_0_UpTrend,          KeyRVI_M_200_0_UpTrend,         KeyRVI_S_200_0_UpTrend;
          //---------------------------------------------------------------------------------------------------------------------------------------------------------
          double                First_RVI200M[],        Second_RVI200M_EMA20[],         Second_RVI200M_SMA20[],         Second_RVI200M_EMA200[],        Second_RVI200M_SMA200[];
          double                First_RVI20M[],         Second_RVI20M_EMA20[],          Second_RVI20M_SMA20[],          Second_RVI20M_EMA200[],         Second_RVI20M_SMA200[];
          bool                  KeyRVI20M_CrossUp_200M,         KeyRVI200M_EMA20_CrossUp_SMA20,         KeyRVI20M_EMA20_CrossUp_SMA20;
          //---------------------------------------------------------------------------------------------------------------------------------------------------------
          double                First_RVI200S[],        Second_RVI200S_EMA20[],         Second_RVI200S_SMA20[],         Second_RVI200S_EMA200[],        Second_RVI200S_SMA200[];
          double                First_RVI20S[],         Second_RVI20S_EMA20[],          Second_RVI20S_SMA20[],          Second_RVI20S_EMA200[],         Second_RVI20S_SMA200[];
          bool                  KeyRVI20S_CrossUp_200,          KeyRVI200S_EMA20_CrossUp_SMA20,         KeyRVI20S_EMA20_CrossUp_SMA20;
          //---------------------------------------------------------------------------------------------------------------------------------------------------------
          double                RVI_MAIN;
          double                RVI_SIGNAL;
          //---------------------------------------------------------------------------------------------------------------------------------------------------------

}; //---St_CDI_RVI          Indicators_RVI;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void St_CDI_RVI::iRVIs()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
///Relative Vigor Index indicator
//========================================================////--200-120---12-14..slow-fast meaning
          RVI_M_200_0                    = iRVI(NULL, 0, 200, MODE_MAIN, 0);
          RVI_M_200_1                    = iRVI(NULL, 0, 200, MODE_MAIN, 1);
          RVI_S_200_0                    = iRVI(NULL, 0, 200, MODE_SIGNAL, 0);
          RVI_S_200_1                    = iRVI(NULL, 0, 200, MODE_SIGNAL, 1);
//==
          RVI_M_14_0                     = iRVI(NULL, 0, 12, MODE_MAIN, 0);
          RVI_M_14_1                     = iRVI(NULL, 0, 12, MODE_MAIN, 1);
          RVI_S_14_0                     = iRVI(NULL, 0, 12, MODE_SIGNAL, 0);
          RVI_S_14_1                     = iRVI(NULL, 0, 12, MODE_SIGNAL, 1);
//========================================================< 55;
          KeyRVI_M_200_0_UpTrend          = RVI_M_200_0  > RVI_M_200_1 ; //Print("money_direction of money");
          KeyRVI_S_200_0_UpTrend          = RVI_S_200_0  > RVI_S_200_1 ; //Print("money_direction of money");
//==
          KeyRVI_M_14_0_UpTrend           = RVI_M_14_0  > RVI_M_14_1 ; //Print("money_direction of money");
          KeyRVI_S_14_0_UpTrend           = RVI_S_14_0  > RVI_S_14_1 ; //Print("money_direction of money");
//========================================================< 55;
          Init_X200Array_X20Array("iRVI", First_RVI200M, Second_RVI200M_EMA20, Second_RVI200M_SMA20, Second_RVI200M_EMA200, Second_RVI200M_SMA200, First_RVI20M, Second_RVI20M_EMA20, Second_RVI20M_SMA20, Second_RVI20M_EMA200, Second_RVI20M_SMA200, 200);
          KeyRVI20M_CrossUp_200M           = First_RVI20M[0]            >       First_RVI200M[0];
          KeyRVI200M_EMA20_CrossUp_SMA20   = Second_RVI200M_EMA20[0]    >       Second_RVI200M_SMA20[0];
          KeyRVI20M_EMA20_CrossUp_SMA20    = Second_RVI20M_EMA20[0]     >       Second_RVI20M_SMA20[0];//
//===
          Init_X200Array_X20Array("iRVI", First_RVI200S, Second_RVI200S_EMA20, Second_RVI200S_SMA20, Second_RVI200S_EMA200, Second_RVI200S_SMA200, First_RVI20S, Second_RVI20S_EMA20, Second_RVI20S_SMA20, Second_RVI20S_EMA200, Second_RVI20S_SMA200, 200);
          KeyRVI20S_CrossUp_200            = First_RVI20S[0]            >       First_RVI200S[0];
          KeyRVI200S_EMA20_CrossUp_SMA20   = Second_RVI200S_EMA20[0]    >       Second_RVI200S_SMA20[0];
          KeyRVI20S_EMA20_CrossUp_SMA20    = Second_RVI20S_EMA20[0]     >       Second_RVI20S_SMA20[0];//
//========================================================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          return;//
//
}


//+------------------------------------------------------------------+
//||   ||||||||||       St_CDI_RVI.mqh        ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------
