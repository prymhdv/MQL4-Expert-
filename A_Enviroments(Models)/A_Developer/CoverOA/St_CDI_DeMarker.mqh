//+------------------------------------------------------------------+
//||   ||||||||||       St_CDI_DeMarker.mqh   ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+

class St_CDI_DeMarker : public St_CDI_Base
{
public:
          void          iDeMarkers();
          double        DeMarker_200_0,         DeMarker_200_1;
          double        DeMarker_14_0,          DeMarker_14_1;
          //---------------------------------------------------------------------------------------------------------------------------------------------------------
          bool          IsDeMarker_14_UpTrend,          IsDeMarker_200_UpTrend;
          bool          IsDeMarker20_CrossUp_200,       IsDeMarker200_EMA20_CrossUp_SMA20,      IsDeMarker20_EMA20_CrossUp_SMA20;
          //---------------------------------------------------------------------------------------------------------------------------------------------------------
          double        First_DeMarker200[],    Second_DeMarker200_EMA20[],     Second_DeMarker200_SMA20[],     Second_DeMarker200_EMA200[],    Second_DeMarker200_SMA200[]; ///Dynamic
          double        First_DeMarker20[],     Second_DeMarker20_EMA20[],      Second_DeMarker20_SMA20[],      Second_DeMarker20_EMA200[],     Second_DeMarker20_SMA200[];///Dynamic
          //---------------------------------------------------------------------------------------------------------------------------------------------------------
            double                DeMarker;
          //---------------------------------------------------------------------------------------------------------------------------------------------------------
}; //---St_CDI_DeMarker   	Indicators_DeMarker;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void St_CDI_DeMarker::iDeMarkers()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
/// DeMarker indicator
//========================================================
////%R = - (MAX (HIGH (i - n)) - CLOSE (i)) / (MAX (HIGH (i - n)) - MIN (LOW (i - n))) * 100
          DeMarker_200_0                    = iDeMarker(NULL, 0, 200, 0);
          DeMarker_200_1                    = iDeMarker(NULL, 0, 200, 1);
          DeMarker_14_0                     = iDeMarker(NULL, 0, 14, 0);
          DeMarker_14_1                     = iDeMarker(NULL, 0, 14, 1);
//========================================================
          IsDeMarker_14_UpTrend             = (DeMarker_14_0  > DeMarker_14_1 ); //Print("money_direction of money");
          IsDeMarker_200_UpTrend            = (DeMarker_200_0 > DeMarker_200_1); //Print("money_direction of money");
//========================================================
          Init_X200Array_X20Array("iDeMarker", First_DeMarker200, Second_DeMarker200_EMA20, Second_DeMarker200_SMA20, Second_DeMarker200_EMA200, Second_DeMarker200_SMA200, First_DeMarker20, Second_DeMarker20_EMA20, Second_DeMarker20_SMA20, Second_DeMarker20_EMA200, Second_DeMarker20_SMA200, 200);
          IsDeMarker20_CrossUp_200            = First_DeMarker20[0] > First_DeMarker200[0];
          IsDeMarker200_EMA20_CrossUp_SMA20   = Second_DeMarker200_EMA20[0] > Second_DeMarker200_SMA20[0];
          IsDeMarker20_EMA20_CrossUp_SMA20    = Second_DeMarker20_EMA20[0] > Second_DeMarker20_SMA20[0];
//========================================================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          return;//
}

//+------------------------------------------------------------------+
//||   ||||||||||       St_CDI_DeMarker.mqh   ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+