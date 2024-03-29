//+------------------------------------------------------------------+
//||   ||||||||||       St_CDI_BearsPower.mqh ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+


class St_CDI_BearsPower : public St_CDI_Base
{
public:
          void          iBearsPowers();
          double        BearsPower_14_0,        BearsPower_14_1;
          double        BearsPower_200_0,       BearsPower_200_1;
          //---------------------------------------------------------------------------------------------------------------------------------------------------------
          bool          IsBearsPower_14_UpTrend,        IsBearsPower_200_UpTrend,
                        IsBearsPower20_CrossUp_200,     IsBearsPower200_EMA20_CrossUp_SMA20,    IsBearsPower20_EMA20_CrossUp_SMA20;
          //---------------------------------------------------------------------------------------------------------------------------------------------------------
          double        First_BearsPower200[], Second_BearsPower200_EMA20[], Second_BearsPower200_SMA20[], Second_BearsPower200_EMA200[], Second_BearsPower200_SMA200[];
          double        First_BearsPower20[],  Second_BearsPower20_EMA20[],  Second_BearsPower20_SMA20[],  Second_BearsPower20_EMA200[],  Second_BearsPower20_SMA200[];
          //---------------------------------------------------------------------------------------------------------------------------------------------------------
          double                BearsPower;
          //---------------------------------------------------------------------------------------------------------------------------------------------------------
         

}; //---St_CDI_BearsPower   Indicators_BearsPower;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void St_CDI_BearsPower::iBearsPowers()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
///Bears Power indicator
          BearsPower_14_0              = iBearsPower(NULL, 0, 14, PRICE_CLOSE, 0);
          BearsPower_14_1              = iBearsPower(NULL, 0, 14, PRICE_CLOSE, 1);
          BearsPower_200_0             = iBearsPower(NULL, 0, 200, PRICE_CLOSE, 0);
          BearsPower_200_1             = iBearsPower(NULL, 0, 200, PRICE_CLOSE, 1);
//========================================================
          IsBearsPower_14_UpTrend             = (BearsPower_14_0  > BearsPower_14_1 ); //Print("money_direction of money");
          IsBearsPower_200_UpTrend            = (BearsPower_200_0 > BearsPower_200_1); //Print("money_direction of money");
//========================================================
          Init_X200Array_X20Array("iBearsPower", First_BearsPower200, Second_BearsPower200_EMA20, Second_BearsPower200_SMA20, Second_BearsPower200_EMA200, Second_BearsPower200_SMA200, First_BearsPower20, Second_BearsPower20_EMA20, Second_BearsPower20_SMA20, Second_BearsPower20_EMA200, Second_BearsPower20_SMA200, 200);
          IsBearsPower20_CrossUp_200            = First_BearsPower20[0] > First_BearsPower200[0];
          IsBearsPower200_EMA20_CrossUp_SMA20   = Second_BearsPower200_EMA20[0] > Second_BearsPower200_SMA20[0];
          IsBearsPower20_EMA20_CrossUp_SMA20    = Second_BearsPower20_EMA20[0] > Second_BearsPower20_SMA20[0];//
//========================================================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          return;//
}
//+------------------------------------------------------------------+
//||   ||||||||||       St_CDI_BearsPower.mqh ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
