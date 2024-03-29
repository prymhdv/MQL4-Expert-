//+------------------------------------------------------------------+
//||   ||||||||||                 eTradePanel.mqh                   ||Ctp_TRADER
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\C_OSLib\.C_OSLib.mqh>

//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOAC\Harmonics\Stc_Base.mqh>
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOAC\Harmonics\Stc_ABCD.mqh>
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOAC\Harmonics\Stc_Butterfly.mqh>
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOAC\Harmonics\Stc_Bat.mqh>
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOAC\Harmonics\Stc_Crab.mqh>
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOAC\Harmonics\Stc_Cypher.mqh>
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOAC\Harmonics\Stc_Gartley.mqh>
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOAC\Harmonics\Stc_Shark.mqh>
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOAC\Harmonics\Stc_3Drives.mqh>
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOAC\Harmonics\Stc_5Drives.mqh>
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
enum E_Harmonics
{         E_Harmonic_Void,
          E_Harmonic_Bearish_ABCD,
          E_Harmonic_Bearish_Butterfly,
          E_Harmonic_Bearish_Bat,
          E_Harmonic_Bearish_Crab,
          E_Harmonic_Bearish_Cypher,
          E_Harmonic_Bearish_Gartley,
          E_Harmonic_Bearish_Shark,
          E_Harmonic_Bearish_3Drives,
          E_Harmonic_Bearish_5Drives,
          //
          E_Harmonic_Buish_ABCD,
          E_Harmonic_Buish_Butterfly,
          E_Harmonic_Buish_Bat,
          E_Harmonic_Buish_Crab,
          E_Harmonic_Buish_Cypher,
          E_Harmonic_Buish_Gartley,
          E_Harmonic_Buish_Shark,
          E_Harmonic_Buish_3Drives,
          E_Harmonic_Buish_5Drives
          //
};
//+------------------------------------------------------------------+
//|                                                                  |
//|                                                                  |
//|                                                                  |
//+------------------------------------------------------------------+
struct Stc_CandlePattern__Harmonic
{         Stc_CandlePattern__Harmonic_Shape_ABCD              Harmonic__ABCD;
          Stc_CandlePattern__Harmonic_Shape_Butterfly         Harmonic__Butterfly;
          Stc_CandlePattern__Harmonic_Shape_Bat               Harmonic__Bat;
          Stc_CandlePattern__Harmonic_Shape_Crab              Harmonic__Crab;
          Stc_CandlePattern__Harmonic_Shape_Cypher            Harmonic__Cypher;
          Stc_CandlePattern__Harmonic_Shape_Gartley           Harmonic__Gartley;
          Stc_CandlePattern__Harmonic_Shape_Shark             Harmonic__Shark;
          Stc_CandlePattern__Harmonic_Shape_3Drives           Harmonic__3Drives;
          Stc_CandlePattern__Harmonic_Shape_5Drives           Harmonic__5Drives;
          //---
          void       Check_Harmonic_Pattern(int i, ENUM_TIMEFRAMES f, bool k, Sg_Shape_<int> &_Shape_Com, int mul);
          E_Harmonics e_Harmonics;//

//---
//---
//---
//---
//---
};

struct Stc_E_Harmonics_TimeFrame
{         E_Harmonics   e_Harmonics;
          string        TfDesc;//
          int           BarNum;//
          string        DescAll;
          void Set(E_Harmonics e_harmonics, string tfDesc, int barNum)
          {         e_Harmonics = e_harmonics;
                    TfDesc      = tfDesc; //
                    BarNum      = barNum;
                    DescAll =  string(barNum) + tfDesc  + EnumToString(e_harmonics); //
          } //
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Stc_CandlePattern__Harmonic::Check_Harmonic_Pattern(int i, ENUM_TIMEFRAMES f, bool k, Sg_Shape_<int> &_Shape_Com, int mul)
{
//----
          e_Harmonics = E_Harmonic_Void;
          Stc_E_Harmonics_TimeFrame E_Harmonics_TimeFrame;
          string tf = Utilities.TimeFrameToString(f);
          {         Harmonic__ABCD.Calc         (i, f, k, _Shape_Com, mul);
                    if( Harmonic__ABCD.Is_ABCD)
                    {         if(Harmonic__ABCD.Is_Bulish ) {e_Harmonics = E_Harmonic_Buish_ABCD;   E_Harmonics_TimeFrame.Set(E_Harmonic_Buish_ABCD, tf, Harmonic__ABCD.Line_AB._Start.BarNumber);}
                              else                          {e_Harmonics = E_Harmonic_Bearish_ABCD; E_Harmonics_TimeFrame.Set(E_Harmonic_Bearish_ABCD, tf, Harmonic__ABCD.Line_AB._Start.BarNumber); }
                              //Cat.say(i + "  " + (string)i + Detect_NewBar._M1.CBT.Is_NewBar + tf + " Is_ABCD: "        + (string)Harmonic__ABCD.Line_AB._Start.BarNumber ); //
                    }  //else {Cat.s("NOT Is_ABCD");};
                    Harmonic__Butterfly.Calc    (i, f, k, _Shape_Com, mul);
                    if( Harmonic__Butterfly.Is_Butterfly)
                    {         if(Harmonic__Butterfly.Is_Bulish ) {e_Harmonics = E_Harmonic_Buish_Butterfly; E_Harmonics_TimeFrame.Set(E_Harmonic_Buish_Butterfly, tf, Harmonic__Butterfly.Line_AB._Start.BarNumber);}
                              else                               {e_Harmonics = E_Harmonic_Bearish_Butterfly; E_Harmonics_TimeFrame.Set(E_Harmonic_Bearish_Butterfly, tf, Harmonic__Butterfly.Line_AB._Start.BarNumber); }
                              //Cat.say(i + "  " + (string)i + Detect_NewBar._M1.CBT.Is_NewBar + tf + " Is_Butterfly: "   + (string)Harmonic__Butterfly.Line_AB._Start.BarNumber);//
                    } //else {Cat.s("NOT Is_Butterfly");};
                    Harmonic__Bat.Calc          (i, f, k, _Shape_Com, mul);
                    if( Harmonic__Bat.Is_Bat)
                    {         if(Harmonic__Bat.Is_Bulish ) {e_Harmonics = E_Harmonic_Buish_Bat; E_Harmonics_TimeFrame.Set(E_Harmonic_Buish_Bat, tf, Harmonic__Bat.Line_AB._Start.BarNumber);}
                              else                         {e_Harmonics = E_Harmonic_Bearish_Bat; E_Harmonics_TimeFrame.Set(E_Harmonic_Bearish_Bat, tf, Harmonic__Bat.Line_AB._Start.BarNumber); }
                              //Cat.say(i + "  " + (string)i + Detect_NewBar._M1.CBT.Is_NewBar + tf + " Is_Bat: "         + (string)Harmonic__Bat.Line_AB._Start.BarNumber); //
                    }       //else {Cat.s("NOT Is_Bat");};
                    Harmonic__Crab.Calc         (i, f, k, _Shape_Com, mul);
                    if( Harmonic__Crab.Is_Crab)
                    {         if(Harmonic__Crab.Is_Bulish ) {e_Harmonics = E_Harmonic_Buish_Crab; E_Harmonics_TimeFrame.Set(E_Harmonic_Buish_Crab, tf, Harmonic__Crab.Line_AB._Start.BarNumber);}
                              else                         {e_Harmonics = E_Harmonic_Bearish_Crab; E_Harmonics_TimeFrame.Set(E_Harmonic_Bearish_Crab, tf, Harmonic__Crab.Line_AB._Start.BarNumber); }
                              //Cat.say(i + "  " + (string)i + Detect_NewBar._M1.CBT.Is_NewBar + tf + " Is_Crab: "        + (string)Harmonic__Crab.Line_AB._Start.BarNumber); //
                    }      //else {Cat.s("NOT Is_Crab");};
                    Harmonic__Cypher.Calc       (i, f, k, _Shape_Com, mul);
                    if( Harmonic__Cypher.Is_Cypher)
                    {         if(Harmonic__Cypher.Is_Bulish ) {e_Harmonics = E_Harmonic_Buish_Cypher; E_Harmonics_TimeFrame.Set(E_Harmonic_Buish_Cypher, tf, Harmonic__Cypher.Line_AB._Start.BarNumber);}
                              else                            {e_Harmonics = E_Harmonic_Bearish_Cypher; E_Harmonics_TimeFrame.Set(E_Harmonic_Bearish_Cypher, tf, Harmonic__Cypher.Line_AB._Start.BarNumber); }
                              //Cat.say(i + "  " + (string)i + Detect_NewBar._M1.CBT.Is_NewBar + tf + " Is_Cypher: "      + (string)Harmonic__Cypher.Line_AB._Start.BarNumber);//
                    }     //else {Cat.s("NOT Is_Cypher");};
                    Harmonic__Gartley.Calc      (i, f, k, _Shape_Com, mul);
                    if( Harmonic__Gartley.Is_Gartley)
                    {         if(Harmonic__Gartley.Is_Bulish ) {e_Harmonics = E_Harmonic_Buish_Gartley; E_Harmonics_TimeFrame.Set(E_Harmonic_Buish_Gartley, tf, Harmonic__Gartley.Line_AB._Start.BarNumber);}
                              else                             {e_Harmonics = E_Harmonic_Bearish_Gartley; E_Harmonics_TimeFrame.Set(E_Harmonic_Bearish_Gartley, tf, Harmonic__Gartley.Line_AB._Start.BarNumber); }
                              //Cat.say(i + "  " + (string)i + Detect_NewBar._M1.CBT.Is_NewBar + tf + " Is_Gartley: "     + (string)Harmonic__Gartley.Line_AB._Start.BarNumber);//
                    }    //else {Cat.s("NOT Is_Gartley");};
                    Harmonic__Shark.Calc        (i, f, k, _Shape_Com, mul);
                    if( Harmonic__Shark.Is_Shark)
                    {         if(Harmonic__Shark.Is_Bulish ) {e_Harmonics = E_Harmonic_Buish_Shark; E_Harmonics_TimeFrame.Set(E_Harmonic_Buish_Shark, tf, Harmonic__Shark.Line_AB._Start.BarNumber);}
                              else                         {e_Harmonics = E_Harmonic_Bearish_Shark;  E_Harmonics_TimeFrame.Set(E_Harmonic_Bearish_Shark, tf, Harmonic__Shark.Line_AB._Start.BarNumber);}
                              //Cat.say(i + "  " + (string)i + Detect_NewBar._M1.CBT.Is_NewBar + tf + " Is_Shark: "       + (string)Harmonic__Shark.Line_AB._Start.BarNumber);//
                    }      //else {Cat.s("NOT Is_Shark");};
                    Harmonic__3Drives.Calc      (i, f, k, _Shape_Com, mul);
                    if( Harmonic__3Drives.Is_3Drives)
                    {         if(Harmonic__3Drives.Is_Bulish ) {e_Harmonics = E_Harmonic_Buish_3Drives;    E_Harmonics_TimeFrame.Set(E_Harmonic_Buish_3Drives, tf, Harmonic__3Drives.Line_O1._Start.BarNumber);}
                              else                         {e_Harmonics = E_Harmonic_Bearish_3Drives;     E_Harmonics_TimeFrame.Set(E_Harmonic_Bearish_3Drives, tf, Harmonic__3Drives.Line_O1._Start.BarNumber);}
                              //Cat.say(i + "  " + (string)i + Detect_NewBar._M1.CBT.Is_NewBar + tf + " Is_3Drives: "     + (string)Harmonic__3Drives.Line_O1._Start.BarNumber); //
                    }    //else {Cat.s("NOT Is_3Drives");};
                    Harmonic__5Drives.Calc      (i, f, k, _Shape_Com, mul);
                    if( Harmonic__5Drives.Is_5Drives)
                    {         if(Harmonic__5Drives.Is_Bulish ) {e_Harmonics = E_Harmonic_Buish_5Drives;    E_Harmonics_TimeFrame.Set(E_Harmonic_Buish_5Drives, tf, Harmonic__5Drives.Line_OX._Start.BarNumber);}
                              else                         {e_Harmonics = E_Harmonic_Bearish_5Drives;     E_Harmonics_TimeFrame.Set(E_Harmonic_Bearish_5Drives, tf, Harmonic__5Drives.Line_OX._Start.BarNumber);}
                              //Cat.say(i + "  " + (string)i + Detect_NewBar._M1.CBT.Is_NewBar + tf + " Is_5Drives: "     + (string)Harmonic__5Drives.Line_OX._Start.BarNumber); //
                    }    //else {Cat.s("NOT Is_5Drives");};
                    //Alert("-ddd-----------------------------");
          }
//----
}
//+------------------------------------------------------------------+
//|     Upper request implanted                                      |
//+------------------------------------------------------------------+
struct Stc_CandlePattern__Harmonic_Periods
{         Stc_CandlePattern__Harmonic     _CURRENT;
          Stc_CandlePattern__Harmonic     _MN1;
          Stc_CandlePattern__Harmonic     _W1;
          Stc_CandlePattern__Harmonic     _D1;
          Stc_CandlePattern__Harmonic     _H4;
          Stc_CandlePattern__Harmonic     _H1;
          Stc_CandlePattern__Harmonic     _M30;
          Stc_CandlePattern__Harmonic     _M15;
          Stc_CandlePattern__Harmonic     _M5;
          Stc_CandlePattern__Harmonic     _M1;//
};
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
