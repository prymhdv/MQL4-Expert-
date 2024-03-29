//+------------------------------------------------------------------+
//||   ||||||||||       St_CDI_Envelopes.mqh  ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+




class St_CDI_Envelopes : public St_CDI_Base
{
public:
          void          iEnvelopess();
          double        EnvelopesLOWER_200_0,   EnvelopesLOWER_200_1,   EnvelopesUPPER_200_0,   EnvelopesUPPER_200_1;
          double        EnvelopesLOWER_14_0,    EnvelopesLOWER_14_1,    EnvelopesUPPER_14_0,    EnvelopesUPPER_14_1;
          bool          KeyEnvelopesLOWER_14_0_UpTrend,         KeyEnvelopesUPPER_14_0_UpTrend,         KeyEnvelopesLOWER_200_0_UpTrend,        KeyEnvelopesUPPER_200_0_UpTrend;
          //---------------------------------------------------------------------------------------------------------------------------------------------------------
          double        First_EnvelopesLOWER200M[],     Second_EnvelopesLOWER200M_EMA20[],      Second_EnvelopesLOWER200M_SMA20[],      Second_EnvelopesLOWER200M_EMA200[],     Second_EnvelopesLOWER200M_SMA200[];
          double        First_EnvelopesLOWER20M[],      Second_EnvelopesLOWER20M_EMA20[],       Second_EnvelopesLOWER20M_SMA20[],       Second_EnvelopesLOWER20M_EMA200[],      Second_EnvelopesLOWER20M_SMA200[];
          bool          KeyEnvelopesLOWER20M_CrossUp_200M, KeyEnvelopesLOWER200M_EMA20_CrossUp_SMA20, KeyEnvelopesLOWER20M_EMA20_CrossUp_SMA20;
          //---------------------------------------------------------------------------------------------------------------------------------------------------------
          double        First_EnvelopesUPPER200S[],     Second_EnvelopesUPPER200S_EMA20[],      Second_EnvelopesUPPER200S_SMA20[],      Second_EnvelopesUPPER200S_EMA200[],     Second_EnvelopesUPPER200S_SMA200[];
          double        First_EnvelopesUPPER20S[],      Second_EnvelopesUPPER20S_EMA20[],       Second_EnvelopesUPPER20S_SMA20[],       Second_EnvelopesUPPER20S_EMA200[],      Second_EnvelopesUPPER20S_SMA200[];
          bool          KeyEnvelopesUPPER20S_CrossUp_200,       KeyEnvelopesUPPER200S_EMA20_CrossUp_SMA20,      KeyEnvelopesUPPER20S_EMA20_CrossUp_SMA20;
          //---------------------------------------------------------------------------------------------------------------------------------------------------------
          bool          KeyEnvelopesUpWard;
          //---------------------------------------------------------------------------------------------------------------------------------------------------------
          double                Envelopes;
          double                EnvelopesOnArray;
          //---------------------------------------------------------------------------------------------------------------------------------------------------------
}; //---St_CDI_Envelopes    ct_Conductor.Indicators_Envelopes.;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void St_CDI_Envelopes::iEnvelopess()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
//========================================================
/// Envelopes indicator
          double arrayset[];
          double EnvelopesLOWEROnArray            = iEnvelopesOnArray(arrayset, 0, 20, MODE_SMA, 0, 0.61, MODE_LOWER, 0);
          double EnvelopesUPPEROnArray            = iEnvelopesOnArray(arrayset, 0, 20, MODE_SMA, 0, 0.61, MODE_UPPER, 0);
///
          EnvelopesLOWER_200_0                    = iEnvelopes(NULL, 0, 200, MODE_SMA, 10, PRICE_CLOSE, 0.61, MODE_LOWER, 0);
          EnvelopesLOWER_200_1                    = iEnvelopes(NULL, 0, 200, MODE_SMA, 10, PRICE_CLOSE, 0.61, MODE_LOWER, 1);
          EnvelopesUPPER_200_0                    = iEnvelopes(NULL, 0, 200, MODE_SMA, 10, PRICE_CLOSE, 0.61, MODE_UPPER, 0);
          EnvelopesUPPER_200_1                    = iEnvelopes(NULL, 0, 200, MODE_SMA, 10, PRICE_CLOSE, 0.61, MODE_UPPER, 1);
//==
          EnvelopesLOWER_14_0                     = iEnvelopes(NULL, 0, 14, MODE_SMA, 10, PRICE_CLOSE, 0.61, MODE_LOWER, 0);
          EnvelopesLOWER_14_1                     = iEnvelopes(NULL, 0, 14, MODE_SMA, 10, PRICE_CLOSE, 0.61, MODE_LOWER, 1);
          EnvelopesUPPER_14_0                     = iEnvelopes(NULL, 0, 14, MODE_SMA, 10, PRICE_CLOSE, 0.61, MODE_UPPER, 0);
          EnvelopesUPPER_14_1                     = iEnvelopes(NULL, 0, 14, MODE_SMA, 10, PRICE_CLOSE, 0.16, MODE_UPPER, 1);
//========================================================< 55;
          KeyEnvelopesLOWER_200_0_UpTrend          = EnvelopesLOWER_200_0  > EnvelopesLOWER_200_1 ; //Print("money_direction of money");
          KeyEnvelopesUPPER_200_0_UpTrend          = EnvelopesUPPER_200_0  > EnvelopesUPPER_200_1 ; //Print("money_direction of money");
//==
          KeyEnvelopesLOWER_14_0_UpTrend           = EnvelopesLOWER_14_0  > EnvelopesLOWER_14_1 ; //Print("money_direction of money");
          KeyEnvelopesUPPER_14_0_UpTrend           = EnvelopesUPPER_14_0  > EnvelopesUPPER_14_1 ; //Print("money_direction of money");
//========================================================
          Init_X200Array_X20Array("iEnvelopes", First_EnvelopesLOWER200M, Second_EnvelopesLOWER200M_EMA20, Second_EnvelopesLOWER200M_SMA20, Second_EnvelopesLOWER200M_EMA200, Second_EnvelopesLOWER200M_SMA200, First_EnvelopesLOWER20M, Second_EnvelopesLOWER20M_EMA20, Second_EnvelopesLOWER20M_SMA20, Second_EnvelopesLOWER20M_EMA200, Second_EnvelopesLOWER20M_SMA200, 200);
          KeyEnvelopesLOWER20M_CrossUp_200M           = First_EnvelopesLOWER20M[0] > First_EnvelopesLOWER200M[0];
          KeyEnvelopesLOWER200M_EMA20_CrossUp_SMA20   = Second_EnvelopesLOWER200M_EMA20[0] > Second_EnvelopesLOWER200M_SMA20[0];
          KeyEnvelopesLOWER20M_EMA20_CrossUp_SMA20    = Second_EnvelopesLOWER20M_EMA20[0] > Second_EnvelopesLOWER20M_SMA20[0];//
//===
          Init_X200Array_X20Array("iEnvelopes", First_EnvelopesUPPER200S, Second_EnvelopesUPPER200S_EMA20, Second_EnvelopesUPPER200S_SMA20, Second_EnvelopesUPPER200S_EMA200, Second_EnvelopesUPPER200S_SMA200, First_EnvelopesUPPER20S, Second_EnvelopesUPPER20S_EMA20, Second_EnvelopesUPPER20S_SMA20, Second_EnvelopesUPPER20S_EMA200, Second_EnvelopesUPPER20S_SMA200, 200);
          KeyEnvelopesUPPER20S_CrossUp_200            = First_EnvelopesUPPER20S[0] > First_EnvelopesUPPER200S[0];
          KeyEnvelopesUPPER200S_EMA20_CrossUp_SMA20   = Second_EnvelopesUPPER200S_EMA20[0] > Second_EnvelopesUPPER200S_SMA20[0];
          KeyEnvelopesUPPER20S_EMA20_CrossUp_SMA20    = Second_EnvelopesUPPER20S_EMA20[0] > Second_EnvelopesUPPER20S_SMA20[0];//
//========================================================
          KeyEnvelopesUpWard  = KeyEnvelopesLOWER_200_0_UpTrend && KeyEnvelopesLOWER_14_0_UpTrend;
//========================================================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          return;//
}


//+------------------------------------------------------------------+
//||   ||||||||||       St_CDI_Envelopes.mqh  ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
