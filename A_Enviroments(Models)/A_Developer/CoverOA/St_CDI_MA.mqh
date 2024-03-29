//+------------------------------------------------------------------+
//||   ||||||||||       St_CDI_MA.mqh                               ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOA\St_CDI_Base.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\B_MQL\CoverOT\tMqlConductor.mqh>
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOA\St_CDI_MA_Extra.mqh>
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOA\St_CDI_MA_Frist.mqh>
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOA\St_CDI_MA_Secound.mqh>
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|                                                                  |(string s, ENUM_TIMEFRAMES f, int ma_pe, int ma_sh, int ma_me, int ap, int sh)
//+------------------------------------------------------------------+
struct st_iMovingAvrages               //(string s, ENUM_TIMEFRAMES f,   int Kp, int Dp, int sl, int me, int pf, int mo, int sh)      iStochastic(NULL,0,5,3,3,MODE_SMA,0,MODE_SIGNAL,0)
{         St_MqlCondicator      mql;
          St_iMA        Main;
          st_iMovingAvrages MovingAvrage(string s, ENUM_TIMEFRAMES f, int ma_pe, int ma_sh, int ma_me, int ap, int sh)
          {         //st_iMovingAvrages MovingAvrages_5x_3x_3x_HighLowSimple;
                    //Stochastics_5x_3x_3x_HighLowSimple.Main   = St_iStochastic(s, f, Kp, Dp, sl, me, pf, MODE_MAIN, sh);         mql._iStochastic(Stochastics_5x_3x_3x_HighLowSimple.Main);
                    //Stochastics_5x_3x_3x_HighLowSimple.Signal = St_iStochastic(s, f, Kp, Dp, sl, me, pf, MODE_SIGNAL, sh);       mql._iStochastic(Stochastics_5x_3x_3x_HighLowSimple.Signal); //
                    //------------------------------------------------
                    st_iMovingAvrages MovingAvrages_1x_1x_Mx_Px; MovingAvrages_1x_1x_Mx_Px.Main  = St_iMA(s, f, ma_pe, ma_sh, ma_me, ap, sh);       mql._iMA(MovingAvrages_1x_1x_Mx_Px.Main); //
                    return MovingAvrages_1x_1x_Mx_Px;//
          }
//
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class Sti_MovingAvrage
{         //----------------------------------------------
          //
          //
          //-----------------------------------------------
public:
          void       Sti_MovingAvrage(ENUM_TIMEFRAMES F) {f = F; initer();}; //---!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! the creator needd inittting
          void       Sti_MovingAvrage() { /*initer(0, false, 0);  no need */  }
          void      ~Sti_MovingAvrage() {};
          //------------------------------------------------iMA(NULL,0,13,8,MODE_SMMA,PRICE_MEDIAN,i);
          St_MqlCondicator      mql;
          st_iMovingAvrages       MovingAvrages_1x_1x_Mx_Px[];
          st_iMovingAvrages       MovingAvrages_1x_1x_Mx_PClose[];
          int                     TotalBar;
          //------------------------------------------------
          bool      IsSignalBuy1_Sell0[];
          bool      IsSignalBulish[];
          //------------------------------------------------
          ENUM_TIMEFRAMES       f;
          void initer()
          {         TotalBar = ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.GDS.Wave1.A._Shift + 50;
                    ArrayResize(MovingAvrages_1x_1x_Mx_Px, TotalBar);
                    ArrayResize(IsSignalBuy1_Sell0, TotalBar);
                    ArrayResize(IsSignalBulish, TotalBar);
                    for(int i = 0; i < TotalBar; i++)
                    {         if(ArraySize(MovingAvrages_1x_1x_Mx_Px) > i)
                              {         MovingAvrages_1x_1x_Mx_Px[i] = MovingAvrages_1x_1x_Mx_Px[i].MovingAvrage(Symbol(), f, 1, 0, MODE_SMMA, PRICE_MEDIAN, i); //
                                        //------------------------------------------------
                                        IsSignalBuy1_Sell0[i] = MovingAvrages_1x_1x_Mx_Px[i].Main._Value > MovingAvrages_1x_1x_Mx_Px[i].Main._Value; //
                              }
                              //------------------------------------------------
                    }//
          }


}; //
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class St_CDI_MA_Peroid
{
public:
          void       St_CDI_MA_Peroid();
          void       ~St_CDI_MA_Peroid() {};
          Sti_MovingAvrage   _MN;       //
          Sti_MovingAvrage   _W1;       //
          Sti_MovingAvrage   _D1;       //
          Sti_MovingAvrage   _H4;       //
          Sti_MovingAvrage   _H1;       //
          Sti_MovingAvrage   _M30;      //
          Sti_MovingAvrage   _M15;      //
          Sti_MovingAvrage   _M5;       //
          Sti_MovingAvrage   _M1;       //
          //Sti_MovingAvrage   _Current;  //
          //----------------------
          void       Update()
          {         ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
                    {         //
                              Sti_MovingAvrage   MN       = Sti_MovingAvrage(PERIOD_MN1);            _MN            = MN;        //Print((string)( MN.Main.Max._Value),      "  inr--  MN.Main.Max._Value)");//  ////
                              Sti_MovingAvrage   W1       = Sti_MovingAvrage(PERIOD_W1);             _W1            = W1;        //Print((string)( W1.Main.Max._Value),      "  inr--  W1.Main.Max._Value)");//  ////
                              Sti_MovingAvrage   D1       = Sti_MovingAvrage(PERIOD_D1);             _D1            = D1;       // Print((string)( D1.Main.Max._Value),      "  inr--  D1.Main.Max._Value)");//  ////
                              Sti_MovingAvrage   H4       = Sti_MovingAvrage(PERIOD_H4);             _H4            = H4;        //Print((string)( H4.Main.Max._Value),      "  inr--  H4.Main.Max._Value)");//  ////
                              Sti_MovingAvrage   H1       = Sti_MovingAvrage(PERIOD_H1);             _H1            = H1;        //Print((string)( H1.Main.Max._Value),      "  inr--  H1.Main.Max._Value)");//  ////
                              Sti_MovingAvrage   M30      = Sti_MovingAvrage(PERIOD_M30);            _M30           = M30;        //Print((string)( M30.Main.Max._Value),     "  inr-- M30.Main.Max._Value)");//  ////
                              Sti_MovingAvrage   M15      = Sti_MovingAvrage(PERIOD_M15);            _M15           = M15;        //Print((string)( M15.Main.Max._Value),     "  inr-- M15.Main.Max._Value)");//  ////
                              Sti_MovingAvrage   M5       = Sti_MovingAvrage(PERIOD_M5);             _M5            = M5;        //Print((string)( M5.Main.Max._Value),      "  inr--  M5.Main.Max._Value)");//  ////
                              Sti_MovingAvrage   M1       = Sti_MovingAvrage(PERIOD_M1);             _M1            = M1;        //Print((string)( M1.Main.Max._Value),      "  inr--  M1.Main.Max._Value)");//  ////
                              //Sti_MovingAvrage   Current  = Sti_MovingAvrage(PERIOD_CURRENT);        _Current       = Current;    //Print((string)( Current.Main.Max._Value), "  inr--  Current.Main.Max._Value)");//  //
                              //
                    }//
                    ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
          } //
          /* _Current make pointer  even false it re inited and bug making*/
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void St_CDI_MA_Peroid::St_CDI_MA_Peroid()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
          Sti_MovingAvrage   MN         = Sti_MovingAvrage(PERIOD_MN1);            _MN          = MN; //
          Sti_MovingAvrage   W1         = Sti_MovingAvrage(PERIOD_W1);             _W1          = W1; //
          Sti_MovingAvrage   D1         = Sti_MovingAvrage(PERIOD_D1);             _D1          = D1; //
          Sti_MovingAvrage   H4         = Sti_MovingAvrage(PERIOD_H4);             _H4          = H4; //
          Sti_MovingAvrage   H1         = Sti_MovingAvrage(PERIOD_H1);             _H1          = H1; //
          Sti_MovingAvrage   M30        = Sti_MovingAvrage(PERIOD_M30);            _M30         = M30; //
          Sti_MovingAvrage   M15        = Sti_MovingAvrage(PERIOD_M15);            _M15         = M15; //
          Sti_MovingAvrage   M5         = Sti_MovingAvrage(PERIOD_M5);             _M5          = M5; //
          Sti_MovingAvrage   M1         = Sti_MovingAvrage(PERIOD_M1);             _M1          = M1; //
          //Sti_MovingAvrage   Current    = Sti_MovingAvrage(PERIOD_CURRENT);        _Current     = Current; //
          ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
}
//+------------------------------------------------------------------+
//||   ||||||||||                       St_CDI_MA.mqh               ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
