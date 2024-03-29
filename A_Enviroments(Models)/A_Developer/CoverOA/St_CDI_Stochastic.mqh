//+------------------------------------------------------------------+
//||   ||||||||||       St_CDI_Stochastic.mqh ||
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
class St_CDI_Stochastic : public St_CDI_Base
{
public:
          void          iStochastics();
          double        Stochastic_M_200_0,     Stochastic_M_200_1,     Stochastic_S_200_0,     Stochastic_S_200_1;
          double        Stochastic_M_14_0,      Stochastic_M_14_1,      Stochastic_S_14_0,      Stochastic_S_14_1;
          //--------------------------------
          bool          IS_Stochastic_M_200_0_UpTrend,  IS_Stochastic_S_200_0_UpTrend;
          bool          IS_Stochastic_M_14_0_UpTrend,   IS_Stochastic_S_14_0_UpTrend;
          //---------------------------------------------------------------------------------------------------------------------------------------------------------
          double        First_Stochastic200M[], Second_Stochastic200M_EMA20[],  Second_Stochastic200M_SMA20[],  Second_Stochastic200M_EMA200[], Second_Stochastic200M_SMA200[];
          double        First_Stochastic20M[],  Second_Stochastic20M_EMA20[],   Second_Stochastic20M_SMA20[],   Second_Stochastic20M_EMA200[],  Second_Stochastic20M_SMA200[];
          bool          KeyStochastic20M_CrossUp_200M,          KeyStochastic200M_EMA20_CrossUp_SMA20,          KeyStochastic20M_EMA20_CrossUp_SMA20;
          //---------------------------------------------------------------------------------------------------------------------------------------------------------
          double        First_Stochastic200S[], Second_Stochastic200S_EMA20[], Second_Stochastic200S_SMA20[], Second_Stochastic200S_EMA200[], Second_Stochastic200S_SMA200[];
          double        First_Stochastic20S[],  Second_Stochastic20S_EMA20[],  Second_Stochastic20S_SMA20[],  Second_Stochastic20S_EMA200[],  Second_Stochastic20S_SMA200[];
          bool          KeyStochastic20S_CrossUp_200,           KeyStochastic200S_EMA20_CrossUp_SMA20,          KeyStochastic20S_EMA20_CrossUp_SMA20;
          //---------------------------------------------------------------------------------------------------------------------------------------------------------
          bool          IS_StochasticUpWard;
          bool          IS_Bulish_200MUpS;;
          //---------------------------------------------------------------------------------------------------------------------------------------------------------
}; //---St_CDI_Stochastic     Indicators_Stochastic;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void St_CDI_Stochastic::iStochastics()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>.Low/High=0--close\close =1
/// Stochastic Oscillator
//========================================================
          Stochastic_M_200_0                    = iStochastic(NULL, 0, 200,  3, 3, MODE_EMA, 0, MODE_MAIN, 0);
          Stochastic_M_200_1                    = iStochastic(NULL, 0, 200,  3, 3, MODE_EMA, 0, MODE_MAIN, 1);
          Stochastic_S_200_0                    = iStochastic(NULL, 0, 200,  3, 3, MODE_EMA, 0, MODE_SIGNAL, 0);
          Stochastic_S_200_1                    = iStochastic(NULL, 0, 200,  3, 3, MODE_EMA, 0, MODE_SIGNAL, 1);
//==
          Stochastic_M_14_0                     = iStochastic(NULL, 0, 14,  3, 3, MODE_EMA, 0, MODE_MAIN, 0);
          Stochastic_M_14_1                     = iStochastic(NULL, 0, 14,  3, 3, MODE_EMA, 0, MODE_MAIN, 1);
          Stochastic_S_14_0                     = iStochastic(NULL, 0, 14,  3, 3, MODE_EMA, 0, MODE_SIGNAL, 0);
          Stochastic_S_14_1                     = iStochastic(NULL, 0, 14,  3, 3, MODE_EMA, 0, MODE_SIGNAL, 1);
//========================================================< 55;
          IS_Stochastic_M_200_0_UpTrend          = Stochastic_M_200_0  > Stochastic_M_200_1 ; //Print("money_direction of money");
          IS_Stochastic_S_200_0_UpTrend          = Stochastic_S_200_0  > Stochastic_S_200_1 ; //Print("money_direction of money");
//==
          IS_Stochastic_M_14_0_UpTrend           = Stochastic_M_14_0  > Stochastic_M_14_1 ; //Print("money_direction of money");
          IS_Stochastic_S_14_0_UpTrend           = Stochastic_S_14_0  > Stochastic_S_14_1 ; //Print("money_direction of money");
//========================================================
          Init_X200Array_X20Array("iStochastic", First_Stochastic200M, Second_Stochastic200M_EMA20, Second_Stochastic200M_SMA20, Second_Stochastic200M_EMA200, Second_Stochastic200M_SMA200, First_Stochastic20M, Second_Stochastic20M_EMA20, Second_Stochastic20M_SMA20, Second_Stochastic20M_EMA200, Second_Stochastic20M_SMA200, 200);
          KeyStochastic20M_CrossUp_200M           = First_Stochastic20M[0] > First_Stochastic200M[0];
          KeyStochastic200M_EMA20_CrossUp_SMA20   = Second_Stochastic200M_EMA20[0] > Second_Stochastic200M_SMA20[0];
          KeyStochastic20M_EMA20_CrossUp_SMA20    = Second_Stochastic20M_EMA20[0] > Second_Stochastic20M_SMA20[0];//
//===
          Init_X200Array_X20Array("iStochastic", First_Stochastic200S, Second_Stochastic200S_EMA20, Second_Stochastic200S_SMA20, Second_Stochastic200S_EMA200, Second_Stochastic200S_SMA200, First_Stochastic20S, Second_Stochastic20S_EMA20, Second_Stochastic20S_SMA20, Second_Stochastic20S_EMA200, Second_Stochastic20S_SMA200, 200);
          KeyStochastic20S_CrossUp_200            = First_Stochastic20S[0] > First_Stochastic200S[0];
          KeyStochastic200S_EMA20_CrossUp_SMA20   = Second_Stochastic200S_EMA20[0] > Second_Stochastic200S_SMA20[0];
          KeyStochastic20S_EMA20_CrossUp_SMA20    = Second_Stochastic20S_EMA20[0] > Second_Stochastic20S_SMA20[0];//
//========================================================
          IS_StochasticUpWard  = IS_Stochastic_M_200_0_UpTrend && IS_Stochastic_M_14_0_UpTrend;
          IS_Bulish_200MUpS    =  Stochastic_M_200_1 > Stochastic_S_200_1;
//========================================================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          return;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
struct st_iStochastics               //(string s, ENUM_TIMEFRAMES f,   int Kp, int Dp, int sl, int me, int pf, int mo, int sh)      iStochastic(NULL,0,5,3,3,MODE_SMA,0,MODE_SIGNAL,0)
{         St_MqlCondicator      mql;
          St_iStochastic        Main, Signal;
          st_iStochastics Stochastic(string s, ENUM_TIMEFRAMES f,   int Kp, int Dp, int sl, int me, int pf, /*int mo,*/ int sh)
          {         st_iStochastics Stochastics_5x_3x_3x_HighLowSimple;
                    Stochastics_5x_3x_3x_HighLowSimple.Main   = St_iStochastic(s, f, Kp, Dp, sl, me, pf, MODE_MAIN, sh);         mql._iStochastic(Stochastics_5x_3x_3x_HighLowSimple.Main);
                    Stochastics_5x_3x_3x_HighLowSimple.Signal = St_iStochastic(s, f, Kp, Dp, sl, me, pf, MODE_SIGNAL, sh);       mql._iStochastic(Stochastics_5x_3x_3x_HighLowSimple.Signal); //
                    return Stochastics_5x_3x_3x_HighLowSimple;//
          }
//
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class Sti_Stochastic
{         //----------------------------------------------
          //
          //
          //-----------------------------------------------
public:
          void       Sti_Stochastic(ENUM_TIMEFRAMES F) {f = F; initer();}; //---!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! the creator needd inittting
          void       Sti_Stochastic() { /*initer(0, false, 0);  no need */  }
          void      ~Sti_Stochastic() {};
          //------------------------------------------------iStochastic(NULL,0,5,3,3,MODE_SMA,0,MODE_MAIN,0) > iStochastic(NULL,0,5,3,3,MODE_SMA,0,MODE_SIGNAL,0))
          St_MqlCondicator      mql;
          st_iStochastics       Stochastics_5_3_3_HighLowSMA[];
          st_iStochastics       Stochastics_5_3_3_HighLowEMA[];
          int                   TotalBar;
          //------------------------------------------------
          bool      IsSignalBuy1_Sell0[];

          //------------------------------------------------
          ENUM_TIMEFRAMES       f;
          void initer()
          {         TotalBar = ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.GDS.Wave1.A._Shift + 50;
                    ArrayResize(Stochastics_5_3_3_HighLowSMA, TotalBar);
                    ArrayResize(IsSignalBuy1_Sell0, TotalBar);
                    for(int i = 0; i < TotalBar; i++)
                    {         Stochastics_5_3_3_HighLowSMA[i] = Stochastics_5_3_3_HighLowSMA[i].Stochastic(Symbol(), f, 5, 3, 3, MODE_SMA, 0, 0); ///// 25  15  3 is ok not 25  15  15 
                              //------------------------------------------------
                              IsSignalBuy1_Sell0[i] = Stochastics_5_3_3_HighLowSMA[i].Main._Value > Stochastics_5_3_3_HighLowSMA[i].Signal._Value; //
                              //------------------------------------------------
                    }//
          }


}; //
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class St_CDI_Stochastic_Peroid
{
public:
          void       St_CDI_Stochastic_Peroid();
          void       ~St_CDI_Stochastic_Peroid() {};
          Sti_Stochastic   _MN;       //
          Sti_Stochastic   _W1;       //
          Sti_Stochastic   _D1;       //
          Sti_Stochastic   _H4;       //
          Sti_Stochastic   _H1;       //
          Sti_Stochastic   _M30;      //
          Sti_Stochastic   _M15;      //
          Sti_Stochastic   _M5;       //
          Sti_Stochastic   _M1;       //
          Sti_Stochastic   _Current;  //
          //----------------------
          void       Update()
          {         ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
                    {         //
                              Sti_Stochastic   MN       = Sti_Stochastic(PERIOD_MN1);            _MN            = MN;        //Print((string)( MN.Main.Max._Value),      "  inr--  MN.Main.Max._Value)");//  ////
                              Sti_Stochastic   W1       = Sti_Stochastic(PERIOD_W1);             _W1            = W1;        //Print((string)( W1.Main.Max._Value),      "  inr--  W1.Main.Max._Value)");//  ////
                              Sti_Stochastic   D1       = Sti_Stochastic(PERIOD_D1);             _D1            = D1;       // Print((string)( D1.Main.Max._Value),      "  inr--  D1.Main.Max._Value)");//  ////
                              Sti_Stochastic   H4       = Sti_Stochastic(PERIOD_H4);             _H4            = H4;        //Print((string)( H4.Main.Max._Value),      "  inr--  H4.Main.Max._Value)");//  ////
                              Sti_Stochastic   H1       = Sti_Stochastic(PERIOD_H1);             _H1            = H1;        //Print((string)( H1.Main.Max._Value),      "  inr--  H1.Main.Max._Value)");//  ////
                              Sti_Stochastic   M30      = Sti_Stochastic(PERIOD_M30);            _M30           = M30;        //Print((string)( M30.Main.Max._Value),     "  inr-- M30.Main.Max._Value)");//  ////
                              Sti_Stochastic   M15      = Sti_Stochastic(PERIOD_M15);            _M15           = M15;        //Print((string)( M15.Main.Max._Value),     "  inr-- M15.Main.Max._Value)");//  ////
                              Sti_Stochastic   M5       = Sti_Stochastic(PERIOD_M5);             _M5            = M5;        //Print((string)( M5.Main.Max._Value),      "  inr--  M5.Main.Max._Value)");//  ////
                              Sti_Stochastic   M1       = Sti_Stochastic(PERIOD_M1);             _M1            = M1;        //Print((string)( M1.Main.Max._Value),      "  inr--  M1.Main.Max._Value)");//  ////
                              Sti_Stochastic   Current  = Sti_Stochastic(PERIOD_CURRENT);        _Current       = Current;    //Print((string)( Current.Main.Max._Value), "  inr--  Current.Main.Max._Value)");//  //
                              //
                    }//
                    ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
          } //
          /* _Current make pointer  even false it re inited and bug making*/
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void St_CDI_Stochastic_Peroid::St_CDI_Stochastic_Peroid()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
          Sti_Stochastic   MN         = Sti_Stochastic(PERIOD_MN1);            _MN          = MN; //
          Sti_Stochastic   W1         = Sti_Stochastic(PERIOD_W1);             _W1          = W1; //
          Sti_Stochastic   D1         = Sti_Stochastic(PERIOD_D1);             _D1          = D1; //
          Sti_Stochastic   H4         = Sti_Stochastic(PERIOD_H4);             _H4          = H4; //
          Sti_Stochastic   H1         = Sti_Stochastic(PERIOD_H1);             _H1          = H1; //
          Sti_Stochastic   M30        = Sti_Stochastic(PERIOD_M30);            _M30         = M30; //
          Sti_Stochastic   M15        = Sti_Stochastic(PERIOD_M15);            _M15         = M15; //
          Sti_Stochastic   M5         = Sti_Stochastic(PERIOD_M5);             _M5          = M5; //
          Sti_Stochastic   M1         = Sti_Stochastic(PERIOD_M1);             _M1          = M1; //
          Sti_Stochastic   Current    = Sti_Stochastic(PERIOD_CURRENT);        _Current     = Current; //
          ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
}
//+------------------------------------------------------------------+
//||   ||||||||||       St_CDI_Stochastic.mqh ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
