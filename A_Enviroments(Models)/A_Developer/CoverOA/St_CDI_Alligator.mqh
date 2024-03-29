//+------------------------------------------------------------------+
//||   ||||||||||       St_CDI_Alligator.mqh  ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class  St_CDI_Alligator : public St_CDI_Base
{
public:
          void          iAlligators();
          double        AlligatorJAW_1300_0,    AlligatorJAW_1300_1,    AlligatorTEETH_1300_0,  AlligatorTEETH_1300_1,  AlligatorLIPS_1300_0,   AlligatorLIPS_1300_1;
          double        AlligatorJAW_130_0,     AlligatorJAW_130_1,     AlligatorTEETH_130_0,   AlligatorTEETH_130_1,   AlligatorLIPS_130_0,    AlligatorLIPS_130_1;
          double        AlligatorJAW_13_0,      AlligatorJAW_13_1,      AlligatorTEETH_13_0,    AlligatorTEETH_13_1,    AlligatorLIPS_13_0,     AlligatorLIPS_13_1;
          //---------------------------------------------------------------------------------------------------------------------------------------------------------
          bool          KeyAlligatorJAW_1300_0_UpTrend,       KeyAlligatorTEETH_1300_0_UpTrend,       KeyAlligatorLIPS_1300_0_UpTrend,
                        KeyAlligatorJAW_130_0_UpTrend,        KeyAlligatorTEETH_130_0_UpTrend,        KeyAlligatorLIPS_130_0_UpTrend,
                        KeyAlligatorJAW_13_0_UpTrend,         KeyAlligatorTEETH_13_0_UpTrend,         KeyAlligatorLIPS_13_0_UpTrend;
          //---------------------------------------------------------------------------------------------------------------------------------------------------------
          double        First_AlligatorJAW_1300[],      Second_AlligatorJAW_1300_EMA20[],       Second_AlligatorJAW_1300_SMA20[],       Second_AlligatorJAW_1300_EMA200[],      Second_AlligatorJAW_1300_SMA200[],
                        First_AlligatorJAW_130[],       Second_AlligatorJAW_130_EMA20[],        Second_AlligatorJAW_130_SMA20[],        Second_AlligatorJAW_130_EMA200[],       Second_AlligatorJAW_130_SMA200[],
                        First_AlligatorJAW_13[],        Second_AlligatorJAW_13_EMA20[],         Second_AlligatorJAW_13_SMA20[],         Second_AlligatorJAW_13_EMA200[],        Second_AlligatorJAW_13_SMA200[];
          //---------------------------------------------------------------------------------------------------------------------------------------------------------
          bool          KeyAlligatorJAW_130_CrossUp_200,        KeyAlligatorJAW_1300_EMA20_CrossUp_SMA20,       KeyAlligatorJAW_130_EMA20_CrossUp_SMA20;
          //---------------------------------------------------------------------------------------------------------------------------------------------------------
          double        First_AlligatorTEETH_1300[],    Second_AlligatorTEETH_1300_EMA20[],     Second_AlligatorTEETH_1300_SMA20[],     Second_AlligatorTEETH_1300_EMA200[],    Second_AlligatorTEETH_1300_SMA200[],
                        First_AlligatorTEETH_130[],     Second_AlligatorTEETH_130_EMA20[],      Second_AlligatorTEETH_130_SMA20[],      Second_AlligatorTEETH_130_EMA200[],     Second_AlligatorTEETH_130_SMA200[],
                        First_AlligatorTEETH_13[],      Second_AlligatorTEETH_13_EMA20[],       Second_AlligatorTEETH_13_SMA20[],       Second_AlligatorTEETH_13_EMA200[],      Second_AlligatorTEETH_13_SMA200[];
          //---------------------------------------------------------------------------------------------------------------------------------------------------------
          bool          KeyAlligatorTEETH_130_CrossUp_200, KeyAlligatorTEETH_1300_EMA20_CrossUp_SMA20, KeyAlligatorTEETH_130_EMA20_CrossUp_SMA20;
          //---------------------------------------------------------------------------------------------------------------------------------------------------------
          double        First_AlligatorLIPS_1300[],     Second_AlligatorLIPS_1300_EMA20[],      Second_AlligatorLIPS_1300_SMA20[],      Second_AlligatorLIPS_1300_EMA200[],     Second_AlligatorLIPS_1300_SMA200[],
                        First_AlligatorLIPS_130[],      Second_AlligatorLIPS_130_EMA20[],       Second_AlligatorLIPS_130_SMA20[],       Second_AlligatorLIPS_130_EMA200[],      Second_AlligatorLIPS_130_SMA200[],
                        First_AlligatorLIPS_13[],       Second_AlligatorLIPS_13_EMA20[],        Second_AlligatorLIPS_13_SMA20[],        Second_AlligatorLIPS_13_EMA200[],       Second_AlligatorLIPS_13_SMA200[];
          //---------------------------------------------------------------------------------------------------------------------------------------------------------
          bool          KeyAlligatorLIPS_130_CrossUp_200,       KeyAlligatorLIPS_1300_EMA20_CrossUp_SMA20,      KeyAlligatorLIPS_130_EMA20_CrossUp_SMA20;
          //---------------------------------------------------------------------------------------------------------------------------------------------------------
          bool          KeyAlligatorUpWard; //
          //---------------------------------------------------------------------------------------------------------------------------------------------------------
          double                AlligatorJAW;
          double                AlligatorTEETH;
          double                AlligatorLIPS;
          //---------------------------------------------------------------------------------------------------------------------------------------------------------
}; //---St_CDI_Alligator              Indicators_Alligator;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void St_CDI_Alligator::iAlligators()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
//Alligator indicator
//========================================================////--200-120---12-14..slow-fast meaning
          AlligatorJAW_1300_0              = iAlligator(NULL, 0, 1300, 800, 800, 5, 5, 3, MODE_EMA, PRICE_CLOSE, MODE_GATORJAW, 0);
          AlligatorJAW_1300_1              = iAlligator(NULL, 0, 1300, 800, 800, 5, 5, 3, MODE_EMA, PRICE_CLOSE, MODE_GATORJAW, 1);
///
          AlligatorTEETH_1300_0            = iAlligator(NULL, 0, 1300, 800, 800, 5, 5, 3, MODE_EMA, PRICE_CLOSE, MODE_GATORTEETH, 0);
          AlligatorTEETH_1300_1            = iAlligator(NULL, 0, 1300, 800, 800, 5, 5, 3, MODE_EMA, PRICE_CLOSE, MODE_GATORTEETH, 1);
///
          AlligatorLIPS_1300_0             = iAlligator(NULL, 0, 1300, 800, 800, 5, 5, 3, MODE_EMA, PRICE_CLOSE, MODE_GATORLIPS, 0);
          AlligatorLIPS_1300_1             = iAlligator(NULL, 0, 1300, 800, 800, 5, 5, 3, MODE_EMA, PRICE_CLOSE, MODE_GATORLIPS, 1);
///==
//==
          AlligatorJAW_130_0              = iAlligator(NULL, 0, 130, 80, 80, 5, 5, 3, MODE_EMA, PRICE_CLOSE, MODE_GATORJAW, 0);
          AlligatorJAW_130_1              = iAlligator(NULL, 0, 130, 80, 80, 5, 5, 3, MODE_EMA, PRICE_CLOSE, MODE_GATORJAW, 1);
///
          AlligatorTEETH_130_0            = iAlligator(NULL, 0, 130, 80, 80, 5, 5, 3, MODE_EMA, PRICE_CLOSE, MODE_GATORTEETH, 0);
          AlligatorTEETH_130_1            = iAlligator(NULL, 0, 130, 80, 80, 5, 5, 3, MODE_EMA, PRICE_CLOSE, MODE_GATORTEETH, 1);
///
          AlligatorLIPS_130_0             = iAlligator(NULL, 0, 130, 80, 80, 5, 5, 3, MODE_EMA, PRICE_CLOSE, MODE_GATORLIPS, 0);
          AlligatorLIPS_130_1             = iAlligator(NULL, 0, 130, 80, 80, 5, 5, 3, MODE_EMA, PRICE_CLOSE, MODE_GATORLIPS, 1);
//==
//==
          AlligatorJAW_13_0              = iAlligator(NULL, 0, 13, 8, 8, 5, 5, 3, MODE_EMA, PRICE_CLOSE, MODE_GATORJAW, 0);
          AlligatorJAW_13_1              = iAlligator(NULL, 0, 13, 8, 8, 5, 5, 3, MODE_EMA, PRICE_CLOSE, MODE_GATORJAW, 1);
///
          AlligatorTEETH_13_0            = iAlligator(NULL, 0, 13, 8, 8, 5, 5, 3, MODE_EMA, PRICE_CLOSE, MODE_GATORTEETH, 0);
          AlligatorTEETH_13_1            = iAlligator(NULL, 0, 13, 8, 8, 5, 5, 3, MODE_EMA, PRICE_CLOSE, MODE_GATORTEETH, 1);
///
          AlligatorLIPS_13_0             = iAlligator(NULL, 0, 13, 8, 8, 5, 5, 3, MODE_EMA, PRICE_CLOSE, MODE_GATORLIPS, 0);
          AlligatorLIPS_13_1             = iAlligator(NULL, 0, 13, 8, 8, 5, 5, 3, MODE_EMA, PRICE_CLOSE, MODE_GATORLIPS, 1);
//========================================================< 55;
          KeyAlligatorJAW_1300_0_UpTrend          = AlligatorJAW_1300_0   > AlligatorJAW_1300_1 ; //Print("money_direction of money");
          KeyAlligatorTEETH_1300_0_UpTrend        = AlligatorTEETH_1300_0 > AlligatorTEETH_1300_1 ; //Print("money_direction of money");
          KeyAlligatorLIPS_1300_0_UpTrend         = AlligatorLIPS_1300_0  > AlligatorLIPS_1300_1 ; //Print("money_direction of money");
//==
          KeyAlligatorJAW_130_0_UpTrend           = AlligatorJAW_130_0   > AlligatorJAW_130_1 ; //Print("money_direction of money");
          KeyAlligatorTEETH_130_0_UpTrend         = AlligatorTEETH_130_0 > AlligatorTEETH_130_1 ; //Print("money_direction of money");
          KeyAlligatorLIPS_130_0_UpTrend          = AlligatorLIPS_130_0  > AlligatorLIPS_130_1 ; //Print("money_direction of money");
///======
          KeyAlligatorJAW_13_0_UpTrend            = AlligatorJAW_13_0   > AlligatorJAW_13_1 ; //Print("money_direction of money");
          KeyAlligatorTEETH_13_0_UpTrend          = AlligatorTEETH_13_0 > AlligatorTEETH_13_1 ; //Print("money_direction of money");
          KeyAlligatorLIPS_13_0_UpTrend           = AlligatorLIPS_13_0  > AlligatorLIPS_13_1 ; //Print("money_direction of money");
//========================================================< 55;
          if(0)
          {         Init_X2000Array_X200Array_X20Array("iMACD", First_AlligatorJAW_1300, Second_AlligatorJAW_1300_EMA20, Second_AlligatorJAW_1300_SMA20, Second_AlligatorJAW_1300_EMA200, Second_AlligatorJAW_1300_SMA200,
                                                       First_AlligatorJAW_130, Second_AlligatorJAW_130_EMA20, Second_AlligatorJAW_130_SMA20, Second_AlligatorJAW_130_EMA200, Second_AlligatorJAW_130_SMA200,
                                                       First_AlligatorJAW_13, Second_AlligatorJAW_13_EMA20, Second_AlligatorJAW_13_SMA20, Second_AlligatorJAW_13_EMA200, Second_AlligatorJAW_13_SMA200,
                                                       200);
                    KeyAlligatorJAW_130_CrossUp_200           = First_AlligatorJAW_130[0] > First_AlligatorJAW_1300[0];
                    KeyAlligatorJAW_1300_EMA20_CrossUp_SMA20   = Second_AlligatorJAW_1300_EMA20[0] > Second_AlligatorJAW_1300_SMA20[0];
                    KeyAlligatorJAW_130_EMA20_CrossUp_SMA20    = Second_AlligatorJAW_130_EMA20[0] > Second_AlligatorJAW_130_SMA20[0];//
//===
                    Init_X2000Array_X200Array_X20Array("iMACD", First_AlligatorJAW_1300, Second_AlligatorJAW_1300_EMA20, Second_AlligatorJAW_1300_SMA20, Second_AlligatorJAW_1300_EMA200, Second_AlligatorJAW_1300_SMA200,
                                                       First_AlligatorJAW_130, Second_AlligatorJAW_130_EMA20, Second_AlligatorJAW_130_SMA20, Second_AlligatorJAW_130_EMA200, Second_AlligatorJAW_130_SMA200,
                                                       First_AlligatorJAW_13, Second_AlligatorJAW_13_EMA20, Second_AlligatorJAW_13_SMA20, Second_AlligatorJAW_13_EMA200, Second_AlligatorJAW_13_SMA200,
                                                       200);
                    KeyAlligatorJAW_130_CrossUp_200            = First_AlligatorJAW_130[0] > First_AlligatorJAW_1300[0];
                    KeyAlligatorJAW_1300_EMA20_CrossUp_SMA20   = Second_AlligatorJAW_1300_EMA20[0] > Second_AlligatorJAW_1300_SMA20[0];
                    KeyAlligatorJAW_130_EMA20_CrossUp_SMA20    = Second_AlligatorJAW_130_EMA20[0] > Second_AlligatorJAW_130_SMA20[0];//
//===
                    Init_X2000Array_X200Array_X20Array("iMACD", First_AlligatorLIPS_1300, Second_AlligatorLIPS_1300_EMA20, Second_AlligatorLIPS_1300_SMA20, Second_AlligatorLIPS_1300_EMA200, Second_AlligatorLIPS_1300_SMA200,
                                                       First_AlligatorLIPS_130, Second_AlligatorLIPS_130_EMA20, Second_AlligatorLIPS_130_SMA20, Second_AlligatorLIPS_130_EMA200, Second_AlligatorLIPS_130_SMA200,
                                                       First_AlligatorLIPS_13, Second_AlligatorLIPS_13_EMA20, Second_AlligatorLIPS_13_SMA20, Second_AlligatorLIPS_13_EMA200, Second_AlligatorLIPS_13_SMA200,
                                                       200);
                    KeyAlligatorLIPS_130_CrossUp_200            = First_AlligatorLIPS_130[0] > First_AlligatorLIPS_1300[0];
                    KeyAlligatorLIPS_1300_EMA20_CrossUp_SMA20   = Second_AlligatorLIPS_1300_EMA20[0] > Second_AlligatorLIPS_1300_SMA20[0];
                    KeyAlligatorLIPS_130_EMA20_CrossUp_SMA20    = Second_AlligatorLIPS_130_EMA20[0] > Second_AlligatorLIPS_130_SMA20[0];//
//========================================================
                    KeyAlligatorUpWard  = KeyAlligatorJAW_1300_0_UpTrend && KeyAlligatorJAW_130_0_UpTrend; ///
                    ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          }//
          return;//
}

//+------------------------------------------------------------------+
//||   ||||||||||       St_CDI_Alligator.mqh  ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
