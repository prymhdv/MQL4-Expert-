//+------------------------------------------------------------------+
//||   ||||||||||                 eFlowPanel.mqh                    ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Bases\.BaseWall.mqh>
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+ s_E_TL_Movment_AB.E_Bar_TL_Movment_wAwB   s_E_TL_Movment_AB._Bar_Is_E_Movment_UU
struct St_E_TL_Movment_AB
{         E_TL_Movment          E_Bar_TL_Movment_wAwB;
          bool                  _Bar_Is_E_Movment_UU;
          bool                  _Bar_Is_E_Movment_DU;
          bool                  _Bar_Is_E_Movment_ULL;
          bool                  _Bar_Is_E_Movment_DLL;

};
struct St_E_TL_Movment_ABCD
{         E_TL_Movment          E_Bar_TL_Movment_wAwBwCwD;
          //-------------------------------------------------------
          bool                  _Bar_Is_E_Movment_ULL_DLL;
          bool                  _Bar_Is_E_Movment_DLL_DLL;
          bool                  _Bar_Is_E_Movment_UU_DLL;
          bool                  _Bar_Is_E_Movment_DU_DLL;
          //
          bool                  _Bar_Is_E_Movment_ULL_ULL;
          bool                  _Bar_Is_E_Movment_DLL_ULL;
          bool                  _Bar_Is_E_Movment_UU_ULL;
          bool                  _Bar_Is_E_Movment_DU_ULL;
          //
          bool                  _Bar_Is_E_Movment_DLL_UU;
          bool                  _Bar_Is_E_Movment_ULL_UU;
          bool                  _Bar_Is_E_Movment_UU_UU;
          bool                  _Bar_Is_E_Movment_DU_UU;
          //
          bool                  _Bar_Is_E_Movment_ULL_DU;
          bool                  _Bar_Is_E_Movment_DLL_DU;
          bool                  _Bar_Is_E_Movment_UU_DU;
          bool                  _Bar_Is_E_Movment_DU_DU;//
};
struct St_Bar_TL_Movment_0_5
{         string name;
          ENUM_TIMEFRAMES TF;
          int SB, MB, EB, SB_2, MB_2, EB_2;
          St_Bar_TL_Movment_0_5(string n, ENUM_TIMEFRAMES tf, int sb, int mb, int eb, int sb_2, int mb_2, int eb_2) {  name = n;  TF = tf;  SB = sb; MB = mb; EB = eb; SB_2 = sb_2; MB_2 = mb_2; EB_2 = eb_2; initer(); }
          ~St_Bar_TL_Movment_0_5() {};
          St_Bar_TL_Movment_0_5() {};
          //-------------------------------------------------------
          bool                  _Bar_Is__0_1_Bulish;//
          bool                  _Bar_Is__0_5_Bulish;//
          bool                  _Bar_Is__5_10_Bulish;//
          bool                  _Bar_Is__10_15_Bulish;//
          //-- E_TL_Movment          E_Bar_TL_Movment_0_5, E_Bar_TL_Movment_0_5_10_15;
          St_E_TL_Movment_ABCD  s_E_TL_Movment_ABCD;
          St_E_TL_Movment_AB    s_E_TL_Movment_AB;
          //-------------------------------------------------------

          //-------------------------------------------------------
          void                  initer(); //
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void St_Bar_TL_Movment_0_5::initer()
//Define E_Bar_TL_Movment_0_5
{         //
          {
                    {         _Bar_Is__0_1_Bulish   =  iClose(NULL, TF, SB)  >   iClose(NULL, TF, MB); // iClose(NULL, TF, 0)
                              _Bar_Is__0_5_Bulish   =  iClose(NULL, TF, MB)  >   iClose(NULL, TF, EB); //
                    }
                    s_E_TL_Movment_AB.E_Bar_TL_Movment_wAwB = -1;
                    //
                    if(_Bar_Is__0_1_Bulish &&   _Bar_Is__0_5_Bulish  )                  { s_E_TL_Movment_AB.E_Bar_TL_Movment_wAwB = E_Movment_ULL;  }
                    else if(!_Bar_Is__0_1_Bulish   && !_Bar_Is__0_5_Bulish  )           { s_E_TL_Movment_AB.E_Bar_TL_Movment_wAwB = E_Movment_DLL;  }
                    //
                    if((_Bar_Is__0_1_Bulish  ) && (!_Bar_Is__0_5_Bulish  ))             { s_E_TL_Movment_AB.E_Bar_TL_Movment_wAwB = E_Movment_UU;   }
                    else if((!_Bar_Is__0_1_Bulish  ) && (_Bar_Is__0_5_Bulish  ))        { s_E_TL_Movment_AB.E_Bar_TL_Movment_wAwB = E_Movment_DU;   }
                    //
                    s_E_TL_Movment_AB._Bar_Is_E_Movment_UU                                  = s_E_TL_Movment_AB.E_Bar_TL_Movment_wAwB == E_Movment_UU;
                    s_E_TL_Movment_AB._Bar_Is_E_Movment_DU                                  = s_E_TL_Movment_AB.E_Bar_TL_Movment_wAwB == E_Movment_DU;
                    s_E_TL_Movment_AB._Bar_Is_E_Movment_ULL                                 = s_E_TL_Movment_AB.E_Bar_TL_Movment_wAwB == E_Movment_ULL;
                    s_E_TL_Movment_AB._Bar_Is_E_Movment_DLL                                 = s_E_TL_Movment_AB.E_Bar_TL_Movment_wAwB == E_Movment_DLL;      //
          }
          //
          if(s_E_TL_Movment_AB.E_Bar_TL_Movment_wAwB == E_Movment_UU)           {ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc1 = gf_Desc_ADD(ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc1, "[" + name + "BM-UU]");};
          if(s_E_TL_Movment_AB.E_Bar_TL_Movment_wAwB == E_Movment_DU)           {ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc1 = gf_Desc_ADD(ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc1, "[" + name + "BM-DU]");};
          if(s_E_TL_Movment_AB.E_Bar_TL_Movment_wAwB == E_Movment_ULL)          {ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc1 = gf_Desc_ADD(ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc1, "[" + name + "BM-ULL]");};
          if(s_E_TL_Movment_AB.E_Bar_TL_Movment_wAwB == E_Movment_DLL)          {ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc1 = gf_Desc_ADD(ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc1, "[" + name + "BM-DLL]");};
          //
          //-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
          //Define _Bar_TL_Movment_0_5_10
          {
                    {         s_E_TL_Movment_ABCD._Bar_Is_E_Movment_ULL_ULL     = false;         ///
                              s_E_TL_Movment_ABCD._Bar_Is_E_Movment_DLL_ULL     = false;    //     \//
                              //
                              s_E_TL_Movment_ABCD._Bar_Is_E_Movment_UU_ULL      = false;            ///
                              s_E_TL_Movment_ABCD._Bar_Is_E_Movment_DU_ULL      = false;    //     \//
                              s_E_TL_Movment_ABCD._Bar_Is_E_Movment_ULL_DLL     = false;           ///
                              s_E_TL_Movment_ABCD._Bar_Is_E_Movment_DLL_DLL     = false;    //     \//
                              //
                              s_E_TL_Movment_ABCD._Bar_Is_E_Movment_UU_DLL      = false;            ///
                              s_E_TL_Movment_ABCD._Bar_Is_E_Movment_DU_DLL      = false;     //     \//
                              //
                              s_E_TL_Movment_ABCD._Bar_Is_E_Movment_ULL_UU      = false;            ///
                              s_E_TL_Movment_ABCD._Bar_Is_E_Movment_DLL_UU      = false;    //     \//
                              //
                              s_E_TL_Movment_ABCD._Bar_Is_E_Movment_UU_UU       = false;          ///
                              s_E_TL_Movment_ABCD._Bar_Is_E_Movment_DU_UU       = false;    //     \//
                              s_E_TL_Movment_ABCD._Bar_Is_E_Movment_ULL_DU      = false;           ///
                              s_E_TL_Movment_ABCD._Bar_Is_E_Movment_DLL_DU      = false;     //     \//
                              //
                              s_E_TL_Movment_ABCD._Bar_Is_E_Movment_UU_DU       = false;    //      \//\
                              s_E_TL_Movment_ABCD._Bar_Is_E_Movment_DU_DU       = false;
                              //
                    }   //
                    {         _Bar_Is__0_1_Bulish   =  iClose(NULL, TF, SB)  >   iClose(NULL, TF, MB); // iClose(NULL, TF, 0)
                              _Bar_Is__0_5_Bulish   =  iClose(NULL, TF, MB)  >   iClose(NULL, TF, EB); //
                              _Bar_Is__5_10_Bulish  =  iClose(NULL, TF, SB_2)  >   iClose(NULL, TF, MB_2); // iClose(NULL, TF, 0)
                              _Bar_Is__10_15_Bulish =  iClose(NULL, TF, MB_2)  >   iClose(NULL, TF, EB_2); // iClose(NULL, TF, 0)
                    }
                    s_E_TL_Movment_ABCD.E_Bar_TL_Movment_wAwBwCwD = -1;
                    //
                    if(_Bar_Is__0_1_Bulish &&   _Bar_Is__0_5_Bulish)              //     //
                    {         if(_Bar_Is__5_10_Bulish &&   _Bar_Is__10_15_Bulish)               { s_E_TL_Movment_ABCD.E_Bar_TL_Movment_wAwBwCwD = E_Movment_ULL_ULL;   s_E_TL_Movment_ABCD._Bar_Is_E_Movment_ULL_ULL = true;}         ///
                              else if (!_Bar_Is__5_10_Bulish &&   !_Bar_Is__10_15_Bulish)       { s_E_TL_Movment_ABCD.E_Bar_TL_Movment_wAwBwCwD = E_Movment_DLL_ULL;   s_E_TL_Movment_ABCD._Bar_Is_E_Movment_DLL_ULL = true;}    //     \//
                              //
                              if(_Bar_Is__5_10_Bulish &&   !_Bar_Is__10_15_Bulish)              { s_E_TL_Movment_ABCD.E_Bar_TL_Movment_wAwBwCwD = E_Movment_UU_ULL;    s_E_TL_Movment_ABCD._Bar_Is_E_Movment_UU_ULL = true;}           ///
                              else if (!_Bar_Is__5_10_Bulish &&   _Bar_Is__10_15_Bulish)        { s_E_TL_Movment_ABCD.E_Bar_TL_Movment_wAwBwCwD = E_Movment_DU_ULL;    s_E_TL_Movment_ABCD._Bar_Is_E_Movment_DU_ULL = true;}    //     \//
                    }
                    else if(!_Bar_Is__0_1_Bulish &&   !_Bar_Is__0_5_Bulish)    //      \\
                    {         if(_Bar_Is__5_10_Bulish &&   _Bar_Is__10_15_Bulish)               { s_E_TL_Movment_ABCD.E_Bar_TL_Movment_wAwBwCwD = E_Movment_ULL_DLL;   s_E_TL_Movment_ABCD._Bar_Is_E_Movment_ULL_DLL = true;}           ///
                              else if (!_Bar_Is__5_10_Bulish &&   !_Bar_Is__10_15_Bulish)       { s_E_TL_Movment_ABCD.E_Bar_TL_Movment_wAwBwCwD = E_Movment_DLL_DLL;   s_E_TL_Movment_ABCD._Bar_Is_E_Movment_DLL_DLL = true;}    //     \//
                              //
                              if(_Bar_Is__5_10_Bulish &&   !_Bar_Is__10_15_Bulish)              { s_E_TL_Movment_ABCD.E_Bar_TL_Movment_wAwBwCwD = E_Movment_UU_DLL;    s_E_TL_Movment_ABCD._Bar_Is_E_Movment_UU_DLL = true;}           ///
                              else if (!_Bar_Is__5_10_Bulish &&   _Bar_Is__10_15_Bulish)        { s_E_TL_Movment_ABCD.E_Bar_TL_Movment_wAwBwCwD = E_Movment_DU_DLL;    s_E_TL_Movment_ABCD._Bar_Is_E_Movment_DU_DLL = true;}    //     \//
                    }
                    //
                    if(_Bar_Is__0_1_Bulish &&   !_Bar_Is__0_5_Bulish)       //      \/
                    {         if(_Bar_Is__5_10_Bulish &&   _Bar_Is__10_15_Bulish)               { s_E_TL_Movment_ABCD.E_Bar_TL_Movment_wAwBwCwD = E_Movment_ULL_UU;    s_E_TL_Movment_ABCD._Bar_Is_E_Movment_ULL_UU = true;}           ///
                              else if (!_Bar_Is__5_10_Bulish &&   !_Bar_Is__10_15_Bulish)       { s_E_TL_Movment_ABCD.E_Bar_TL_Movment_wAwBwCwD = E_Movment_DLL_UU;    s_E_TL_Movment_ABCD._Bar_Is_E_Movment_DLL_UU = true;}    //     \//
                              //
                              if(_Bar_Is__5_10_Bulish &&  !_Bar_Is__10_15_Bulish)               { s_E_TL_Movment_ABCD.E_Bar_TL_Movment_wAwBwCwD = E_Movment_UU_UU;     s_E_TL_Movment_ABCD._Bar_Is_E_Movment_UU_UU = true;}           ///
                              else if (!_Bar_Is__5_10_Bulish &&   _Bar_Is__10_15_Bulish)        { s_E_TL_Movment_ABCD.E_Bar_TL_Movment_wAwBwCwD = E_Movment_DU_UU;     s_E_TL_Movment_ABCD._Bar_Is_E_Movment_DU_UU = true;}    //     \//
                    }
                    else if(!_Bar_Is__0_1_Bulish &&   _Bar_Is__0_5_Bulish)  //      /\
                    {         if(_Bar_Is__5_10_Bulish &&   _Bar_Is__10_15_Bulish)               { s_E_TL_Movment_ABCD.E_Bar_TL_Movment_wAwBwCwD = E_Movment_ULL_DU;    s_E_TL_Movment_ABCD._Bar_Is_E_Movment_ULL_DU = true;}           ///
                              else if (!_Bar_Is__5_10_Bulish &&   !_Bar_Is__10_15_Bulish)       { s_E_TL_Movment_ABCD.E_Bar_TL_Movment_wAwBwCwD = E_Movment_DLL_DU;    s_E_TL_Movment_ABCD._Bar_Is_E_Movment_DLL_DU = true;}    //     \//
                              //
                              if(_Bar_Is__5_10_Bulish &&   !_Bar_Is__10_15_Bulish)              { s_E_TL_Movment_ABCD.E_Bar_TL_Movment_wAwBwCwD = E_Movment_UU_DU;     s_E_TL_Movment_ABCD._Bar_Is_E_Movment_UU_DU = true;}     //      \//\
                              else if (!_Bar_Is__5_10_Bulish &&   _Bar_Is__10_15_Bulish)        { s_E_TL_Movment_ABCD.E_Bar_TL_Movment_wAwBwCwD = E_Movment_DU_DU;     s_E_TL_Movment_ABCD._Bar_Is_E_Movment_DU_DU = true;}    //      \/\/
                    }
                    //-------------------------------------------------------------------------------------------------------------------------------------------
          }
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
};//
struct St_Bar_TL_Movment_0_5_Periods
{         St_Bar_TL_Movment_0_5_Periods() { update(0, 1, 5, 6, 7, 15);};
          ~St_Bar_TL_Movment_0_5_Periods() { };
          St_Bar_TL_Movment_0_5   _Current;
          St_Bar_TL_Movment_0_5   _1M;
          St_Bar_TL_Movment_0_5   _5M;
          St_Bar_TL_Movment_0_5   _15M;
          St_Bar_TL_Movment_0_5   _30M;
          St_Bar_TL_Movment_0_5   _H1;
          St_Bar_TL_Movment_0_5   _H4;
          St_Bar_TL_Movment_0_5   _D1;
          St_Bar_TL_Movment_0_5   _W1;
          St_Bar_TL_Movment_0_5   _MN1;
          void update( int SB, int MB, int EB, int SB_2, int MB_2, int EB_2)
          {         ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
                    St_Bar_TL_Movment_0_5   _Current_(  "C",    PERIOD_CURRENT, SB, MB, EB, SB_2, MB_2, EB_2);  _Current   = _Current_;
                    St_Bar_TL_Movment_0_5   _1M_(       "1M",   PERIOD_M1,      SB, MB, EB, SB_2, MB_2, EB_2);  _1M        = _1M_;
                    St_Bar_TL_Movment_0_5   _5M_(       "5M",   PERIOD_M5,      SB, MB, EB, SB_2, MB_2, EB_2);  _5M        = _5M_;
                    St_Bar_TL_Movment_0_5   _15M_(      "15M",  PERIOD_M15,     SB, MB, EB, SB_2, MB_2, EB_2);  _15M       = _15M_;
                    St_Bar_TL_Movment_0_5   _30M_(      "30M",  PERIOD_M30,     SB, MB, EB, SB_2, MB_2, EB_2);  _30M       = _30M_;
                    St_Bar_TL_Movment_0_5   _H1_(       "H1",   PERIOD_H1,      SB, MB, EB, SB_2, MB_2, EB_2);  _H1        = _H1_;
                    St_Bar_TL_Movment_0_5   _H4_(       "H4",   PERIOD_H4,      SB, MB, EB, SB_2, MB_2, EB_2);  _H4        = _H4_;
                    St_Bar_TL_Movment_0_5   _D1_(       "D1",   PERIOD_D1,      SB, MB, EB, SB_2, MB_2, EB_2);  _D1        = _D1_;
                    St_Bar_TL_Movment_0_5   _W1_(       "W1",   PERIOD_W1,      SB, MB, EB, SB_2, MB_2, EB_2);  _W1        = _W1_;
                    St_Bar_TL_Movment_0_5   _MN1_(      "MN1",  PERIOD_MN1,     SB, MB, EB, SB_2, MB_2, EB_2);  _MN1       = _MN1_;    //
                    ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
          }

};
//+------------------------------------------------------------------+
