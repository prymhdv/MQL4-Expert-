//+------------------------------------------------------------------+
//||   ||||||||||       St_CDI_RSI.mqh        ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOA\St_CDI_Base.mqh>
class St_CDI_RSI : public St_CDI_Base
{
public:
          void          iRSIs();
          double        RSIOnArray;
          //---------------------------------------------------------------------------------------------------------------------------------------------------------
          double        RSI_14_0,       RSI_14_1,
                        RSI_200_0,      RSI_200_1;
          //---------------------------------------------------------------------------------------------------------------------------------------------------------
          bool          IsRSI_14_UpTrend,       IsRSI_200_UpTrend,
                        IsRSI20_CrossUp_200,    IsRSI200_EMA20_CrossUp_SMA20,   IsRSI20_EMA20_CrossUp_SMA20;
          bool          Is_RSI_14_Near_CU_80;
          bool          Is_RSI_14_Near_CD_20;
          bool          Is_RSI_14_Near_CB_50; // +50 > +   -5- >-
          //---------------------------------------------------------------------------------------------------------------------------------------------------------
public:
          //---------------------------------------------------------------------------------------------------------------------------------------------------------
          double        First_RSI200[], Second_RSI200_EMA20[],  Second_RSI200_SMA20[],  Second_RSI200_EMA200[], Second_RSI200_SMA200[],
                        First_RSI20[],  Second_RSI20_EMA20[],   Second_RSI20_SMA20[],   Second_RSI20_EMA200[],  Second_RSI20_SMA200[];
          //---------------------------------------------------------------------------------------------------------------------------------------------------------
}; //---St_CDI_RSI                    Indicators_RSI;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void St_CDI_RSI::iRSIs()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
///Relative Strength Index indicator
          double arrayset[];
          RSIOnArray                           = iRSIOnArray(arrayset, 100, 14, 0);////ExtBufferX[1] its is value af arry not arry
          RSI_14_0              = iRSI(NULL, 0, 14, PRICE_CLOSE, 1);//!!!
          RSI_14_1              = iRSI(NULL, 0, 14, PRICE_CLOSE, 3);
          RSI_200_0             = iRSI(NULL, 0, 200, PRICE_CLOSE, 0);
          RSI_200_1             = iRSI(NULL, 0, 200, PRICE_CLOSE, 1);
          //****************************************************
          IsRSI_14_UpTrend      = (RSI_14_0  > RSI_14_1 ); //Print("money_direction of money");
          IsRSI_200_UpTrend     = (RSI_200_0 > RSI_200_1); //Print("money_direction of money");
          //****************************************************
          Is_RSI_14_Near_CU_80  =   RSI_14_0 >= 80      ;
          Is_RSI_14_Near_CD_20  =   RSI_14_0 <= 20      ;
          Is_RSI_14_Near_CB_50  =   RSI_14_0  > 50      ;
          //****************************************************
          Init_X200Array_X20Array("iRSI", First_RSI200, Second_RSI200_EMA20, Second_RSI200_SMA20, Second_RSI200_EMA200, Second_RSI200_SMA200, First_RSI20, Second_RSI20_EMA20, Second_RSI20_SMA20, Second_RSI20_EMA200, Second_RSI20_SMA200, 200);
          IsRSI20_CrossUp_200            = First_RSI20[0] > First_RSI200[0];
          IsRSI200_EMA20_CrossUp_SMA20   = Second_RSI200_EMA20[0] > Second_RSI200_SMA20[0];
          IsRSI20_EMA20_CrossUp_SMA20    = Second_RSI20_EMA20[0] > Second_RSI20_SMA20[0];//
          //****************************************************
          ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
          //****************************************************
          return;//
}
//+------------------------------------------------------------------+
//||   ||||||||||       St_CDI_RSI.mqh        ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
