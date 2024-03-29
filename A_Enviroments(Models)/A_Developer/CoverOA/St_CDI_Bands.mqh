//+------------------------------------------------------------------+
//||   ||||||||||       St_CDI_Bands.mqh      ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+

class St_CDI_Bands : public St_CDI_Base
{
public:
          void          iBandss();
          double        BandsLOWER_200_0,       BandsLOWER_200_1,       BandsUPPER_200_0,       BandsUPPER_200_1;
          double        BandsLOWER_14_0,        BandsLOWER_14_1,        BandsUPPER_14_0,        BandsUPPER_14_1;
          bool          KeyBandsLOWER_14_0_UpTrend,     KeyBandsUPPER_14_0_UpTrend,     KeyBandsLOWER_200_0_UpTrend,    KeyBandsUPPER_200_0_UpTrend;
          //---------------------------------------------------------------------------------------------------------------------------------------------------------
          double        First_BandsLOWER200M[], Second_BandsLOWER200M_EMA20[],  Second_BandsLOWER200M_SMA20[],  Second_BandsLOWER200M_EMA200[], Second_BandsLOWER200M_SMA200[];
          double        First_BandsLOWER20M[],  Second_BandsLOWER20M_EMA20[],   Second_BandsLOWER20M_SMA20[],   Second_BandsLOWER20M_EMA200[],  Second_BandsLOWER20M_SMA200[];
          bool          KeyBandsLOWER20M_CrossUp_200M, KeyBandsLOWER200M_EMA20_CrossUp_SMA20, KeyBandsLOWER20M_EMA20_CrossUp_SMA20;
          //---------------------------------------------------------------------------------------------------------------------------------------------------------
          double        First_BandsUPPER200S[], Second_BandsUPPER200S_EMA20[],  Second_BandsUPPER200S_SMA20[],  Second_BandsUPPER200S_EMA200[], Second_BandsUPPER200S_SMA200[];
          double        First_BandsUPPER20S[],  Second_BandsUPPER20S_EMA20[],   Second_BandsUPPER20S_SMA20[],   Second_BandsUPPER20S_EMA200[],  Second_BandsUPPER20S_SMA200[];
          bool          KeyBandsUPPER20S_CrossUp_200, KeyBandsUPPER200S_EMA20_CrossUp_SMA20, KeyBandsUPPER20S_EMA20_CrossUp_SMA20;
          //---------------------------------------------------------------------------------------------------------------------------------------------------------
          bool          KeyBandsUpWard;
          //---------------------------------------------------------------------------------------------------------------------------------------------------------
}; //---St_CDI_Bands      	Indicators_Bands;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void St_CDI_Bands::iBandss()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
//========================================================
///Bollinger Bands® indicator
          double arrayset[];
          double BandsLOWEROnArray                   = iBandsOnArray(arrayset, 0, 20, 1.6, 0, MODE_LOWER, 0);
          double BandsUPPEROnArray                   = iBandsOnArray(arrayset, 0, 20, 1.6, 0, MODE_UPPER, 0);
///
          BandsLOWER_200_0                    = iBands(NULL, 0, 200, 2, 0, PRICE_LOW, MODE_LOWER, 0);
          BandsLOWER_200_1                    = iBands(NULL, 0, 200, 2, 0, PRICE_LOW, MODE_LOWER, 1);
          BandsUPPER_200_0                    = iBands(NULL, 0, 200, 2, 0, PRICE_HIGH, MODE_UPPER, 0);
          BandsUPPER_200_1                    = iBands(NULL, 0, 200, 2, 0, PRICE_HIGH, MODE_UPPER, 1);
//==
          BandsLOWER_14_0                     = iBands(NULL, 0, 14, 2, 0, PRICE_LOW, MODE_LOWER, 0);
          BandsLOWER_14_1                     = iBands(NULL, 0, 14, 2, 0, PRICE_LOW, MODE_LOWER, 1);
          BandsUPPER_14_0                     = iBands(NULL, 0, 14, 2, 0, PRICE_HIGH, MODE_UPPER, 0);
          BandsUPPER_14_1                     = iBands(NULL, 0, 14, 2, 0, PRICE_HIGH, MODE_UPPER, 1);
//========================================================< 55;
          KeyBandsLOWER_200_0_UpTrend          = BandsLOWER_200_0  > BandsLOWER_200_1 ; //Print("money_direction of money");
          KeyBandsUPPER_200_0_UpTrend          = BandsUPPER_200_0  > BandsUPPER_200_1 ; //Print("money_direction of money");
//==
          KeyBandsLOWER_14_0_UpTrend           = BandsLOWER_14_0  > BandsLOWER_14_1 ; //Print("money_direction of money");
          KeyBandsUPPER_14_0_UpTrend           = BandsUPPER_14_0  > BandsUPPER_14_1 ; //Print("money_direction of money");
//========================================================
          Init_X200Array_X20Array("iBands", First_BandsLOWER200M, Second_BandsLOWER200M_EMA20, Second_BandsLOWER200M_SMA20, Second_BandsLOWER200M_EMA200, Second_BandsLOWER200M_SMA200, First_BandsLOWER20M, Second_BandsLOWER20M_EMA20, Second_BandsLOWER20M_SMA20, Second_BandsLOWER20M_EMA200, Second_BandsLOWER20M_SMA200, 200);
          KeyBandsLOWER20M_CrossUp_200M           = First_BandsLOWER20M[0] > First_BandsLOWER200M[0];
          KeyBandsLOWER200M_EMA20_CrossUp_SMA20   = Second_BandsLOWER200M_EMA20[0] > Second_BandsLOWER200M_SMA20[0];
          KeyBandsLOWER20M_EMA20_CrossUp_SMA20    = Second_BandsLOWER20M_EMA20[0] > Second_BandsLOWER20M_SMA20[0];//
//===
          Init_X200Array_X20Array("iBands", First_BandsUPPER200S, Second_BandsUPPER200S_EMA20, Second_BandsUPPER200S_SMA20, Second_BandsUPPER200S_EMA200, Second_BandsUPPER200S_SMA200, First_BandsUPPER20S, Second_BandsUPPER20S_EMA20, Second_BandsUPPER20S_SMA20, Second_BandsUPPER20S_EMA200, Second_BandsUPPER20S_SMA200, 200);
          KeyBandsUPPER20S_CrossUp_200            = First_BandsUPPER20S[0] > First_BandsUPPER200S[0];
          KeyBandsUPPER200S_EMA20_CrossUp_SMA20   = Second_BandsUPPER200S_EMA20[0] > Second_BandsUPPER200S_SMA20[0];
          KeyBandsUPPER20S_EMA20_CrossUp_SMA20    = Second_BandsUPPER20S_EMA20[0] > Second_BandsUPPER20S_SMA20[0];//
//========================================================
          KeyBandsUpWard  = KeyBandsLOWER_200_0_UpTrend && KeyBandsLOWER_14_0_UpTrend;
//========================================================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          return;//
}

//+------------------------------------------------------------------+
//||   ||||||||||       St_CDI_Bands.mqh      ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+