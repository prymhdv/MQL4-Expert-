//+------------------------------------------------------------------+
//||   ||||||||||       St_CDI_MFI.mqh        ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOA\St_CDI_Base.mqh>
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class St_CDI_MFI : public St_CDI_Base
{         //---Money_Flow_Index
public:

          double        MFI_200_0,      MFI_200_1;
          double        MFI_14_0,       MFI_14_1;
          bool          IsMFI_Up;
          bool          Is_MFI_14_Above_200_1;
          //---------------------------------------------------------------------------------------------------------------------------------------------------------
          double        First_MFI200[], Second_MFI200_EMA20[],  Second_MFI200_SMA20[],  Second_MFI200_EMA200[],         Second_MFI200_SMA200[];
          double        First_MFI20[],  Second_MFI20_EMA20[],   Second_MFI20_SMA20[],   Second_MFI20_EMA200[],          Second_MFI20_SMA200[];
          //---------------------------------------------------------------------------------------------------------------------------------------------------------
          bool          IsMFI200_EMA20_CrossUp_MFI200,          IsMFI200_EMA20_CrossUp_SMA20,
                        IsMFI20_EMA20_CrossUp_MFI20,            IsMFI20_EMA20_CrossUp_SMA20;
          //---
          St_CDI_MFI() {};
          ~St_CDI_MFI() {};

          //---------------------------------------------------------------------------------------------------------------------------------------------------------
          void iMFIs()
          {         ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
                    //Money_Flow_Index
                    MFI_200_0             = iMFI(NULL, 0, 200, 0);
                    MFI_200_1             = iMFI(NULL, 0, 200, 1);
                    MFI_14_0              = iMFI(NULL, 0, 14, 0);
                    MFI_14_1              = iMFI(NULL, 0, 14, 1);
                    Init_X200Array_X20Array("iMFI", First_MFI200, Second_MFI200_EMA20, Second_MFI200_SMA20, Second_MFI200_EMA200, Second_MFI200_SMA200, First_MFI20, Second_MFI20_EMA20, Second_MFI20_SMA20, Second_MFI20_EMA200, Second_MFI20_SMA200, 200);
                    //========================================================
                    IsMFI_Up                          = MFI_14_0 > MFI_14_1;// Print("money_direction of money");
                    Is_MFI_14_Above_200_1             = MFI_14_1 > MFI_200_1;
                    IsMFI200_EMA20_CrossUp_MFI200     = Second_MFI200_EMA20[0] > First_MFI200[0];
                    IsMFI200_EMA20_CrossUp_SMA20      = Second_MFI200_EMA20[0] > Second_MFI200_SMA20[0];
                    //===
                    IsMFI20_EMA20_CrossUp_MFI20       = Second_MFI20_EMA20[0] > First_MFI20[0];
                    IsMFI20_EMA20_CrossUp_SMA20       = Second_MFI20_EMA20[0] > Second_MFI20_SMA20[0];
                    ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
                    return;//
          }//
}; //---St_CDI_MFI             Indicators_MFI;

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class St_CDI_MFI_Base //--: public St_CDI_Base
{         //---Money_Flow_Index
public:

          //---
          St_CDI_MFI_Base(ENUM_TIMEFRAMES tf, int p) {TF = tf; PERIOD = p; initer(); };
          St_CDI_MFI_Base() {};
          ~St_CDI_MFI_Base() {};
          ENUM_TIMEFRAMES       TF;
          int                   PERIOD;
          St_iMFI  _iMFI_[100];
          void          initer() { for(int i = 0; i < ArraySize(_iMFI_); i++) { _iMFI_[i]._Value = (float)iMFI(NULL, TF, PERIOD, i); } }
          //---------------------------------------------------------------------------------------------------------------------------------------------------------

}; //---St_CDI_MFI             Indicators_MFI;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class St_CDI_MFI_Periods
{
public:
          St_CDI_MFI_Periods(ENUM_TIMEFRAMES tf)
          {         St_CDI_MFI_Base _500(tf, 500);          _500_ = _500;
                    St_CDI_MFI_Base _300(tf, 300);          _300_ = _300;
                    St_CDI_MFI_Base _200(tf, 200);          _200_ = _200;
                    St_CDI_MFI_Base _100(tf, 100);          _100_ = _100;
                    St_CDI_MFI_Base _50(tf, 50);            _50_  = _50;
                    St_CDI_MFI_Base _30(tf, 30);            _30_  = _30;
                    St_CDI_MFI_Base _20(tf, 20);            _20_  = _20;
                    St_CDI_MFI_Base _10(tf, 10);            _10_  = _10;
                    St_CDI_MFI_Base _5(tf, 5);              _5_   = _5;
                    St_CDI_MFI_Base _3(tf, 3);              _3_   = _3; //
          }
          St_CDI_MFI_Periods() {};
          ~St_CDI_MFI_Periods() {}; //
          St_CDI_MFI_Base _500_, _300_, _200_, _100_, _50_, _30_, _20_, _10_, _5_, _3_; //
          //----------------------
          bool IsBasic_Supprot_500v_300; //---- mfi 14 crossUp mfiMena20 or 200//--- && Mfi is bulish... and expanding diff of two line...
          //----------------------
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class St_CDI_MFI_TimeFrame
{
public:
          St_CDI_MFI_TimeFrame()
          {         St_CDI_MFI_Periods    _Current(PERIOD_CURRENT);     _Current_ = _Current;
                    St_CDI_MFI_Periods    _MN1(PERIOD_MN1);             _MN1_     = _MN1;
                    St_CDI_MFI_Periods    _W1(PERIOD_W1);               _W1_      = _W1;
                    St_CDI_MFI_Periods    _D1(PERIOD_D1);               _D1_      = _D1;
                    St_CDI_MFI_Periods    _H4(PERIOD_H4);               _H4_      = _H4;
                    St_CDI_MFI_Periods    _H1(PERIOD_H1);               _H1_      = _H1;
                    St_CDI_MFI_Periods    _M30(PERIOD_M30);             _M30_     = _M30;
                    St_CDI_MFI_Periods    _M15(PERIOD_M15);             _M15_     = _M15;
                    St_CDI_MFI_Periods    _M5(PERIOD_M5);               _M5_      = _M5;
                    St_CDI_MFI_Periods    _M1(PERIOD_M1);               _M1_      = _M1; //
          };
          ~St_CDI_MFI_TimeFrame() {}; //
          St_CDI_MFI_Periods    _Current_;
          St_CDI_MFI_Periods    _MN1_;
          St_CDI_MFI_Periods    _W1_;
          St_CDI_MFI_Periods    _D1_;
          St_CDI_MFI_Periods    _H4_;
          St_CDI_MFI_Periods    _H1_;
          St_CDI_MFI_Periods    _M30_;
          St_CDI_MFI_Periods    _M15_;
          St_CDI_MFI_Periods    _M5_;
          St_CDI_MFI_Periods    _M1_;
          //
          void  Update()
          {         St_CDI_MFI_Periods    _Current(PERIOD_CURRENT);     _Current_ = _Current;
                    St_CDI_MFI_Periods    _MN1(PERIOD_MN1);             _MN1_     = _MN1;
                    St_CDI_MFI_Periods    _W1(PERIOD_W1);               _W1_      = _W1;
                    St_CDI_MFI_Periods    _D1(PERIOD_D1);               _D1_      = _D1;
                    St_CDI_MFI_Periods    _H4(PERIOD_H4);               _H4_      = _H4;
                    St_CDI_MFI_Periods    _H1(PERIOD_H1);               _H1_      = _H1;
                    St_CDI_MFI_Periods    _M30(PERIOD_M30);             _M30_     = _M30;
                    St_CDI_MFI_Periods    _M15(PERIOD_M15);             _M15_     = _M15;
                    St_CDI_MFI_Periods    _M5(PERIOD_M5);               _M5_      = _M5;
                    St_CDI_MFI_Periods    _M1(PERIOD_M1);               _M1_      = _M1; //
          };

};
//+------------------------------------------------------------------+
//||   ||||||||||       St_CDI_MFI.mqh        ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
