//+------------------------------------------------------------------+
//||   ||||||||||       St_CDI_Force.mqh      ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class St_CDI_Force : public St_CDI_Base
{
public:
          void          iForces();
          double        Force_14_0,             Force_14_1;
          double        Force_200_0,            Force_200_1;
          //---------------------------------------------------------------------------------------------------------------------------------------------------------
          bool          IsForce_14_UpTrend,                     IsForce_200_UpTrend,
                        IsForce20_CrossUp_200,                  IsForce200_EMA20_CrossUp_SMA20,         IsForce20_EMA20_CrossUp_SMA20,
                        IsForce20_EMA200_CrossUp_SMA200,        IsForce200_EMA200_CrossUp_SMA200;
          //---------------------------------------------------------------------------------------------------------------------------------------------------------
          bool          Is_Force_14_above_200_1_bulish;
          //---------------------------------------------------------------------------------------------------------------------------------------------------------
          double        First_Force200[],       Second_Force200_EMA20[],        Second_Force200_SMA20[],        Second_Force200_EMA200[],       Second_Force200_SMA200[];
          //---------------------------------------------------------------------------------------------------------------------------------------------------------
          double        First_Force20[],        Second_Force20_EMA20[],         Second_Force20_SMA20[],         Second_Force20_EMA200[],        Second_Force20_SMA200[];
          //---------------------------------------------------------------------------------------------------------------------------------------------------------
}; //---St_CDI_Force          Indicators_Force;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void St_CDI_Force::iForces()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
/////Force_Index
          Force_14_0                       = iForce(NULL, 0, 14, MODE_SMA, PRICE_CLOSE, 0);
          Force_14_1                       = iForce(NULL, 0, 14, MODE_SMA, PRICE_CLOSE, 1);
          Force_200_0                      = iForce(NULL, 0, 200, MODE_SMA, PRICE_CLOSE, 0);
          Force_200_1                      = iForce(NULL, 0, 200, MODE_SMA, PRICE_CLOSE, 0);
//========================================================
          IsForce_14_UpTrend                    = (Force_14_0  > Force_14_1 ); //Print("money_direction of money");
          IsForce_200_UpTrend                   = (Force_200_0 > Force_200_1); //Print("money_direction of money");
          Is_Force_14_above_200_1_bulish        =  Force_14_1 > Force_200_1;  //--bulish force
//========================================================
          Init_X200Array_X20Array("iForce", First_Force200, Second_Force200_EMA20, Second_Force200_SMA20, Second_Force200_EMA200, Second_Force200_SMA200, First_Force20, Second_Force20_EMA20, Second_Force20_SMA20, Second_Force20_EMA200, Second_Force20_SMA200, 200);
          IsForce20_CrossUp_200             = First_Force20[0] > First_Force200[0];
          IsForce20_EMA20_CrossUp_SMA20     = Second_Force20_EMA20[0] > Second_Force20_SMA20[0];//
          IsForce20_EMA200_CrossUp_SMA200   = Second_Force20_EMA200[0] > Second_Force20_SMA200[0];
          IsForce200_EMA200_CrossUp_SMA200  = Second_Force200_EMA200[0] > Second_Force200_SMA200[0];
          IsForce200_EMA20_CrossUp_SMA20    = Second_Force200_EMA20[0] > Second_Force200_SMA20[0];
//========================================================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          return;/////
}

//+------------------------------------------------------------------+
//||   ||||||||||       St_CDI_Force.mqh      ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
