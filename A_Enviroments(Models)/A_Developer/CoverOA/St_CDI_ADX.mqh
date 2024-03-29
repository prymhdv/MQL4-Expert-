//+------------------------------------------------------------------+
//||   ||||||||||       St_CDI_ADX.mqh        ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+

struct St_CDI_ADXs
{         St_CDI_ADXs() {}
          ~St_CDI_ADXs() {}
          double               ADXsMain;
          double               ADXsDIp;
          double               ADXsDIn;
          //---------------------------------
          bool DIsBull1_Bear0; //Market Bulish
          bool DIsBullOverMain;//Market Bulish   //false market realBulish crossed
          bool DIsBearOverMain;
          //---------------------------------
          void SetConditions()
          {         DIsBull1_Bear0  = ADXsDIp > ADXsDIn;
                    DIsBullOverMain = ADXsDIp > ADXsMain;
                    DIsBearOverMain = ADXsDIn > ADXsMain;
                    //
          }

};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class St_CDI_ADX : public St_CDI_Base
{
public:    St_CDI_ADX() { ArrayResize(ADXs14, 20); ArrayResize(ADXs200, 20); }
          ~St_CDI_ADX() {}
          void          iADXs();
          double        ADX_MAIN_200_0,         ADX_MAIN_200_1,         ADX_PLUSDI_200_0,       ADX_PLUSDI_200_1,       ADX_MINUSDI_200_0,      ADX_MINUSDI_200_1;
          double        ADX_MAIN_14_0,          ADX_MAIN_14_1,          ADX_PLUSDI_14_0,        ADX_PLUSDI_14_1,        ADX_MINUSDI_14_0,       ADX_MINUSDI_14_1;
          //---------------------------------------------------------------------------------------------------------------------------------------------------------
          bool          KeyADX_MAIN_14_0_UpTrend,       KeyADX_PLUSDI_14_0_UpTrend,     KeyADX_MINUSDI_14_0_UpTrend,
                        KeyADX_MAIN_200_0_UpTrend,      KeyADX_PLUSDI_200_0_UpTrend,    KeyADX_MINUSDI_200_0_UpTrend;
          //---------------------------------------------------------------------------------------------------------------------------------------------------------
          double        First_ADX_MAIN200[],            Second_ADX_MAIN200_EMA20[],     Second_ADX_MAIN200_SMA20[],     Second_ADX_MAIN200_EMA200[],    Second_ADX_MAIN200_SMA200[],
                        First_ADX_MAIN20[],             Second_ADX_MAIN20_EMA20[],      Second_ADX_MAIN20_SMA20[],      Second_ADX_MAIN20_EMA200[],     Second_ADX_MAIN20_SMA200[];
          bool          KeyADX_MAIN20_CrossUp_200M,             KeyADX_MAIN200_EMA20_CrossUp_SMA20,             KeyADX_MAIN20_EMA20_CrossUp_SMA20;
          //---------------------------------------------------------------------------------------------------------------------------------------------------------
          double        First_ADX_PLUSDI200[],          Second_ADX_PLUSDI200_EMA20[],   Second_ADX_PLUSDI200_SMA20[],   Second_ADX_PLUSDI200_EMA200[],  Second_ADX_PLUSDI200_SMA200[],
                        First_ADX_PLUSDI20[],           Second_ADX_PLUSDI20_EMA20[],    Second_ADX_PLUSDI20_SMA20[],    Second_ADX_PLUSDI20_EMA200[],   Second_ADX_PLUSDI20_SMA200[];
          bool          KeyADX_PLUSDI20_CrossUp_200,            KeyADX_PLUSDI200_EMA20_CrossUp_SMA20,           KeyADX_PLUSDI20_EMA20_CrossUp_SMA20;
          //---------------------------------------------------------------------------------------------------------------------------------------------------------
          double        First_ADX_MINUSDI200[],         Second_ADX_MINUSDI200_EMA20[],  Second_ADX_MINUSDI200_SMA20[],  Second_ADX_MINUSDI200_EMA200[], Second_ADX_MINUSDI200_SMA200[],
                        First_ADX_MINUSDI20[],          Second_ADX_MINUSDI20_EMA20[],   Second_ADX_MINUSDI20_SMA20[],   Second_ADX_MINUSDI20_EMA200[],  Second_ADX_MINUSDI20_SMA200[];
          bool          KeyADX_MINUSDI20_CrossUp_200,           KeyADX_MINUSDI200_EMA20_CrossUp_SMA20,          KeyADX_MINUSDI20_EMA20_CrossUp_SMA20;
          //---------------------------------------------------------------------------------------------------------------------------------------------------------
          bool          KeyADXUpWard;
          //---------------------------------------------------------------------------------------------------------------------------------------------------------
          St_CDI_ADXs           ADXs14[];
          St_CDI_ADXs           ADXs200[];
          //---------------------------------------------------------------------------------------------------------------------------------------------------------
          double                Average_Dir_Move_MAIN;
          double                Average_Dir_Move_PLUSDI;
          double                Average_Dir_Move_MINUSDI;
          //---------------------------------------------------------------------------------------------------------------------------------------------------------
          bool DIsBull1_Bear0; //Market Bulish
          bool DIsBullOverMain;//Market Bulish   //false market realBulish crossed
          bool DIsBearOverMain;//Market bearish  //false market realbearish crossed
          bool IsBulishDIp;
          bool IsBulishDIn;
          //---------------
          char ModeTraders;      // { -9 -8 -7 -6 -5 -4 -3 -2 -1 0 +1 +2 +3 +4 +5 +6 +7 +8 +9 }
          //---------------
          double ADX_MINUSDI_MacdCross_1;
          double ADX_PLUSDI_MacdCross_1;
          bool   IsCrossOkBulishDIp;
          bool   IsCrossOkBulishDIn;
          //---------------

}; //---St_CDI_ADX                    Indicators_ADX;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void St_CDI_ADX::iADXs()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          ///Average_Dir_Move_MAIN
          //========================================================////--200-120---12-14..slow-fast meaning
          int periodcountFast = 50;
          int periodcountSlow = 200;
          ADX_MAIN_200_0                    = iADX(NULL, 0, periodcountSlow, PRICE_CLOSE, MODE_MAIN, 0);
          ADX_MAIN_200_1                    = iADX(NULL, 0, periodcountSlow, PRICE_CLOSE, MODE_MAIN, 1);
          ADX_PLUSDI_200_0                  = iADX(NULL, 0, periodcountSlow, PRICE_CLOSE, MODE_PLUSDI, 0);
          ADX_PLUSDI_200_1                  = iADX(NULL, 0, periodcountSlow, PRICE_CLOSE, MODE_PLUSDI, 1);
          ADX_MINUSDI_200_0                 = iADX(NULL, 0, periodcountSlow, PRICE_CLOSE, MODE_MINUSDI, 0);
          ADX_MINUSDI_200_1                 = iADX(NULL, 0, periodcountSlow, PRICE_CLOSE, MODE_MINUSDI, 1);
          //==
          ADX_MAIN_14_0                    = iADX(NULL, 0, periodcountFast, PRICE_CLOSE, MODE_MAIN, 0);//is terender
          ADX_MAIN_14_1                    = iADX(NULL, 0, periodcountFast, PRICE_CLOSE, MODE_MAIN, 1);
          ADX_PLUSDI_14_0                  = iADX(NULL, 0, periodcountFast, PRICE_CLOSE, MODE_PLUSDI, 0);
          ADX_PLUSDI_14_1                  = iADX(NULL, 0, periodcountFast, PRICE_CLOSE, MODE_PLUSDI, 1);
          ADX_MINUSDI_14_0                 = iADX(NULL, 0, periodcountFast, PRICE_CLOSE, MODE_MINUSDI, 0);
          ADX_MINUSDI_14_1                 = iADX(NULL, 0, periodcountFast, PRICE_CLOSE, MODE_MINUSDI, 1);
          //---------------------------------------------------------------------------------
          IsBulishDIp  = iADX(NULL, 0, periodcountFast, PRICE_CLOSE, MODE_PLUSDI, 1)  > iADX(NULL, 0, periodcountFast, PRICE_CLOSE, MODE_PLUSDI, 2);
          IsBulishDIn = iADX(NULL, 0, periodcountFast, PRICE_CLOSE, MODE_MINUSDI, 1) > iADX(NULL, 0, periodcountFast, PRICE_CLOSE, MODE_MINUSDI, 2);
          //---------------------------------------------------------------------------------
          int countArray = 50;
          ArrayResize(ADXs14, countArray); ArrayResize(ADXs200, countArray);
          for(int i = 0; i < ArraySize(ADXs14) - 1; i++)
          {         ADXs14[i].ADXsMain = iADX(NULL, 0, periodcountFast, PRICE_CLOSE, MODE_MAIN, i);
                    ADXs14[i].ADXsDIp  = iADX(NULL, 0, periodcountFast, PRICE_CLOSE, MODE_PLUSDI, i);
                    ADXs14[i].ADXsDIn  = iADX(NULL, 0, periodcountFast, PRICE_CLOSE, MODE_MINUSDI, i);
                    //
                    ADXs200[i].ADXsMain = iADX(NULL, 0, periodcountSlow, PRICE_CLOSE, MODE_MAIN, i);
                    ADXs200[i].ADXsDIp  = iADX(NULL, 0, periodcountSlow, PRICE_CLOSE, MODE_PLUSDI, i);
                    ADXs200[i].ADXsDIn  = iADX(NULL, 0, periodcountSlow, PRICE_CLOSE, MODE_MINUSDI, i);////
                    //
                    ADXs14[i].SetConditions();
                    ADXs200[i].SetConditions();
                    //
          }
          {         if(1)
                    {         //Print("size: ",ArraySize(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.BarShift));//
                              //Print("sizeidx: ",ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.Idx);//
                              ADX_MINUSDI_MacdCross_1                 = iADX(NULL, 0, periodcountFast, PRICE_CLOSE, MODE_MINUSDI, ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.BarShift[ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.Idx]);
                              ADX_PLUSDI_MacdCross_1                  = iADX(NULL, 0, periodcountFast, PRICE_CLOSE, MODE_PLUSDI, ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.BarShift[ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.Idx]);//
                    }
                    //-----------
                    IsCrossOkBulishDIn = ADX_MINUSDI_MacdCross_1 < ADX_MINUSDI_14_1;
                    IsCrossOkBulishDIp = ADX_PLUSDI_MacdCross_1 < ADX_PLUSDI_14_1; //
          }
          //cheak outs
          // where buyers
          DIsBull1_Bear0  = ADX_PLUSDI_14_1 > ADX_MINUSDI_14_1;
          DIsBullOverMain = ADX_PLUSDI_14_1 > ADX_MAIN_14_1;
          DIsBearOverMain = ADX_MINUSDI_14_1 > ADX_MAIN_14_1;
          //========================================================
          //if(!DIsBullOverMain || !DIsBearOverMain) {ModeTraders = 0;}         //---market Null Conterol A
          //else if() {ModeTraders = 1;}    //---market Buyers Conterol A
          //else if() {ModeTraders = -1;}   //---market Seller Conterol A
          //else if() {ModeTraders = +2;}   //---market Buyers Conterol B
          //else if() {ModeTraders = -2;}   //---market Seller Conterol B
          //else if() {ModeTraders = +3;}   //---market Buyers Conterol C
          //else if() {ModeTraders = -3;}   //---market Seller Conterol C
          //========================================================< 55;
          KeyADX_MAIN_200_0_UpTrend       = ADX_MAIN_200_0  > ADX_MAIN_200_1 ; //Print("money_direction of money");
          KeyADX_PLUSDI_200_0_UpTrend     = ADX_PLUSDI_200_0  > ADX_PLUSDI_200_1 ; //Print("money_direction of money");
          KeyADX_MINUSDI_200_0_UpTrend    = ADX_MINUSDI_200_0  > ADX_MINUSDI_200_1 ; //Print("money_direction of money");
          //==
          KeyADX_MAIN_14_0_UpTrend       = ADX_MAIN_14_0  > ADX_MAIN_14_1 ; //Print("money_direction of money");
          KeyADX_PLUSDI_14_0_UpTrend     = ADX_PLUSDI_14_0  > ADX_PLUSDI_14_1 ; //Print("money_direction of money");
          KeyADX_MINUSDI_14_0_UpTrend    = ADX_MINUSDI_14_0  > ADX_MINUSDI_14_1 ; //Print("money_direction of money");
          //========================================================< 55;
          Init_X200Array_X20Array("iADX", First_ADX_MAIN200, Second_ADX_MAIN200_EMA20, Second_ADX_MAIN200_SMA20, Second_ADX_MAIN200_EMA200, Second_ADX_MAIN200_SMA200, First_ADX_MAIN20, Second_ADX_MAIN20_EMA20, Second_ADX_MAIN20_SMA20, Second_ADX_MAIN20_EMA200, Second_ADX_MAIN20_SMA200, 200);
          KeyADX_MAIN20_CrossUp_200M           = First_ADX_MAIN20[0] > First_ADX_MAIN200[0];
          KeyADX_MAIN200_EMA20_CrossUp_SMA20   = Second_ADX_MAIN200_EMA20[0] > Second_ADX_MAIN200_SMA20[0];
          KeyADX_MAIN20_EMA20_CrossUp_SMA20    = Second_ADX_MAIN20_EMA20[0]  > Second_ADX_MAIN20_SMA20[0];//
          //===
          Init_X200Array_X20Array("iADX", First_ADX_PLUSDI200, Second_ADX_PLUSDI200_EMA20, Second_ADX_PLUSDI200_SMA20, Second_ADX_PLUSDI200_EMA200, Second_ADX_PLUSDI200_SMA200, First_ADX_PLUSDI20, Second_ADX_PLUSDI20_EMA20, Second_ADX_PLUSDI20_SMA20, Second_ADX_PLUSDI20_EMA200, Second_ADX_PLUSDI20_SMA200, 200);
          KeyADX_PLUSDI20_CrossUp_200            = First_ADX_PLUSDI20[0] > First_ADX_PLUSDI200[0];
          KeyADX_PLUSDI200_EMA20_CrossUp_SMA20   = Second_ADX_PLUSDI200_EMA20[0] > Second_ADX_PLUSDI200_SMA20[0];
          KeyADX_PLUSDI20_EMA20_CrossUp_SMA20    = Second_ADX_PLUSDI20_EMA20[0] > Second_ADX_PLUSDI20_SMA20[0];//
          //===
          Init_X200Array_X20Array("iADX", First_ADX_MINUSDI200, Second_ADX_MINUSDI200_EMA20, Second_ADX_MINUSDI200_SMA20, Second_ADX_MINUSDI200_EMA200, Second_ADX_MINUSDI200_SMA200, First_ADX_MINUSDI20, Second_ADX_MINUSDI20_EMA20, Second_ADX_MINUSDI20_SMA20, Second_ADX_MINUSDI20_EMA200, Second_ADX_MINUSDI20_SMA200, 200);
          KeyADX_MINUSDI20_CrossUp_200            = First_ADX_MINUSDI20[0] > First_ADX_MINUSDI200[0];
          KeyADX_MINUSDI200_EMA20_CrossUp_SMA20   = Second_ADX_MINUSDI200_EMA20[0] > Second_ADX_MINUSDI200_SMA20[0];
          KeyADX_MINUSDI20_EMA20_CrossUp_SMA20    = Second_ADX_MINUSDI20_EMA20[0] > Second_ADX_MINUSDI20_SMA20[0];//
          //
          //========================================================
          KeyADXUpWard         = KeyADX_MAIN_200_0_UpTrend && KeyADX_MAIN_14_0_UpTrend;
          //========================================================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
          return;//
}//
//+------------------------------------------------------------------+
//||   ||||||||||       St_CDI_ADX.mqh        ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
