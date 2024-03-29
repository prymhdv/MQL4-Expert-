//+------------------------------------------------------------------+
//||   ||||||||||       St_CDI_BullsPower.mqh ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+



class St_CDI_BullsPower : public St_CDI_Base
{
public:
          void          iBullsPowers();
          double        BullsPower_14_0,        BullsPower_14_1,
                        BullsPower_200_0,       BullsPower_200_1;
          //---------------------------------------------------------------------------------------------------------------------------------------------------------
          bool          IsBullsPower_14_UpTrend,        IsBullsPower_200_UpTrend,
                        IsBullsPower20_CrossUp_200,     IsBullsPower200_EMA20_CrossUp_SMA20,    IsBullsPower20_EMA20_CrossUp_SMA20;
          //---------------------------------------------------------------------------------------------------------------------------------------------------------
          double        First_BullsPower200[],  Second_BullsPower200_EMA20[],   Second_BullsPower200_SMA20[],   Second_BullsPower200_EMA200[],  Second_BullsPower200_SMA200[];
          double        First_BullsPower20[],   Second_BullsPower20_EMA20[],    Second_BullsPower20_SMA20[],    Second_BullsPower20_EMA200[],   Second_BullsPower20_SMA200[];
          //---------------------------------------------------------------------------------------------------------------------------------------------------------
          double                BullsPower;
          //------------------------------------
          
          double                BullsPower_M14_;
          //---------------------------------------------------------------------------------------------------------------------------------------------------------

}; //---St_CDI_BullsPower   Indicators_BullsPower;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void St_CDI_BullsPower::iBullsPowers()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
///Bulls Power indicator
          BullsPower_14_0              = iBullsPower(NULL, 0, 14, PRICE_CLOSE, 0);
          BullsPower_14_1              = iBullsPower(NULL, 0, 14, PRICE_CLOSE, 1);
          BullsPower_200_0             = iBullsPower(NULL, 0, 200, PRICE_CLOSE, 0);
          BullsPower_200_1             = iBullsPower(NULL, 0, 200, PRICE_CLOSE, 1);
//--------------------------------------------------------
          BullsPower_M14_              = 
//========================================================
          IsBullsPower_14_UpTrend             = (BullsPower_14_0  > BullsPower_14_1 ); //Print("money_direction of money");
          IsBullsPower_200_UpTrend            = (BullsPower_200_0 > BullsPower_200_1); //Print("money_direction of money");
//========================================================
          Init_X200Array_X20Array("iBullsPower", First_BullsPower200, Second_BullsPower200_EMA20, Second_BullsPower200_SMA20, Second_BullsPower200_EMA200, Second_BullsPower200_SMA200, First_BullsPower20, Second_BullsPower20_EMA20, Second_BullsPower20_SMA20, Second_BullsPower20_EMA200, Second_BullsPower20_SMA200, 200);
          IsBullsPower20_CrossUp_200            = First_BullsPower20[0] > First_BullsPower200[0];
          IsBullsPower200_EMA20_CrossUp_SMA20   = Second_BullsPower200_EMA20[0] > Second_BullsPower200_SMA20[0];
          IsBullsPower20_EMA20_CrossUp_SMA20    = Second_BullsPower20_EMA20[0] > Second_BullsPower20_SMA20[0];//
//========================================================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          return;//
}


//+------------------------------------------------------------------+
//||   ||||||||||       St_CDI_BullsPower.mqh ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
