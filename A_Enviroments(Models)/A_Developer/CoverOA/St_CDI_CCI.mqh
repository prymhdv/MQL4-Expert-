//+------------------------------------------------------------------+
//||   ||||||||||       St_CDI_CCI.mqh        ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+

class St_CDI_CCI : public St_CDI_Base
{
public:
          void          iCCIs();
          double        CCI_14_0,               CCI_14_1;
          double        CCI_200_0,              CCI_200_1;
          //---------------------------------------------------------------------------------------------------------------------------------------------------------
          bool          IsCCI_14_UpTrend,                       IsCCI_200_UpTrend,
                        IsCCI20_CrossUp_200,                    IsCCI200_EMA20_CrossUp_SMA20,           IsCCI20_EMA20_CrossUp_SMA20,
                        IsCCI20_EMA200_CrossUp_SMA200,          IsCCI200_EMA200_CrossUp_SMA200;
          //---------------------------------------------------------------------------------------------------------------------------------------------------------
          double        First_CCI200[], Second_CCI200_EMA20[], Second_CCI200_SMA20[], Second_CCI200_EMA200[], Second_CCI200_SMA200[];
          double        First_CCI20[], Second_CCI20_EMA20[], Second_CCI20_SMA20[], Second_CCI20_EMA200[], Second_CCI20_SMA200[];
          //---------------------------------------------------------------------------------------------------------------------------------------------------------
          double        CCIOnArray;
          //---------------------------------------------------------------------------------------------------------------------------------------------------------
}; //---St_CDI_CCI        	Indicators_CCI;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void St_CDI_CCI::iCCIs()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
///Commodity_Channel_Index
          double arrayset[];
          CCIOnArray                     = iCCIOnArray(arrayset, 0, 12, 0);
          CCI_14_0                       = iCCI(NULL, 0, 14, PRICE_CLOSE, 0);
          CCI_14_1                       = iCCI(NULL, 0, 14, PRICE_CLOSE, 1);
          CCI_200_0                      = iCCI(NULL, 0, 200, PRICE_CLOSE, 0);
          CCI_200_1                      = iCCI(NULL, 0, 200, PRICE_CLOSE, 1);
//========================================================
          IsCCI_14_UpTrend             = (CCI_14_0  > CCI_14_1 ); //Print("money_direction of money");
          IsCCI_200_UpTrend            = (CCI_200_0 > CCI_200_1); //Print("money_direction of money");
//========================================================
          Init_X200Array_X20Array("iCCI", First_CCI200, Second_CCI200_EMA20, Second_CCI200_SMA20, Second_CCI200_EMA200, Second_CCI200_SMA200, First_CCI20, Second_CCI20_EMA20, Second_CCI20_SMA20, Second_CCI20_EMA200, Second_CCI20_SMA200, 200);
          IsCCI20_CrossUp_200             = First_CCI20[0] > First_CCI200[0];
          IsCCI20_EMA20_CrossUp_SMA20     = Second_CCI20_EMA20[0] > Second_CCI20_SMA20[0];//
          IsCCI20_EMA200_CrossUp_SMA200   = Second_CCI20_EMA200[0] > Second_CCI20_SMA200[0];
          IsCCI200_EMA200_CrossUp_SMA200  = Second_CCI200_EMA200[0] > Second_CCI200_SMA200[0];
          IsCCI200_EMA20_CrossUp_SMA20    = Second_CCI200_EMA20[0] > Second_CCI200_SMA20[0];
//========================================================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          return;/////
}



//+------------------------------------------------------------------+
//||   ||||||||||       St_CDI_CCI.mqh        ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
