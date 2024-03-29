//+------------------------------------------------------------------+
//||   ||||||||||    Stc_CandlePattern__Harmonic_Shape_3Drives.mqh  ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOAC\Harmonics\Stc_Base.mqh>
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
struct Stc_CandlePattern__Harmonic_Shape_3Drives : public Stc_CandlePattern__Harmonic_Shape_Base
{         //---
          Stc_CandlePattern__Harmonic_Path_data Line_O1;
          Stc_CandlePattern__Harmonic_Path_data Line_O2;
          Stc_CandlePattern__Harmonic_Path_data Line_C2;
          Stc_CandlePattern__Harmonic_Path_data Line_C3;
          Sg_Shape_<int>  _Shape_Com_;
          //
          bool                                          IS_Coondition_O2_O1, IS_Coondition_O2_O1_1, IS_Coondition_O2_O1_2;
          bool                                          IS_Coondition_C3_C2, IS_Coondition_C3_C2_1, IS_Coondition_C3_C2_2;

          double        ExDeffrence;//     0.20
          bool          Is_3Drives;

          void          Calc(int i  , ENUM_TIMEFRAMES f  ,bool k,Sg_Shape_<int> &_Shape_Com,int mul);
          void          Calc_Legs(int i , ENUM_TIMEFRAMES f ,int mul);
          void          __Condition();
          //
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Stc_CandlePattern__Harmonic_Shape_3Drives::Calc(int i  , ENUM_TIMEFRAMES f  ,bool k,Sg_Shape_<int> &_Shape_Com,int mul)
{         //---O1 O2 C2 C3
//---   O1  1.270 ~ 1.618  O2
//---   C2  1.270 ~ 1.618  C3
//---   -------------------
//---   finding the paths
//---   -------------------
//---
//---
//---
          Calc_Legs(i, f, mul);      __Condition();
//---
//---
//---
//---
//---
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Stc_CandlePattern__Harmonic_Shape_3Drives::Calc_Legs(int i  , ENUM_TIMEFRAMES f ,int mul)
{         //---  O1 O2 C2 C3
          {         Calc__Zigzag__Points(Rang_Zigzag,f, mul);
                    __Calc__Lines(Line_O1, f, i + 5, i + 4); //---  AB
                    __Calc__Lines(Line_O2, f, i + 4, i + 3); //---  AB
                    __Calc__Lines(Line_C2, f, i + 3, i + 2); //---  BC
                    __Calc__Lines(Line_C3, f, i + 2, i + 1); //---  CD
                    //
          }//
//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Stc_CandlePattern__Harmonic_Shape_3Drives::__Condition()
{         bool IS_Coondition = false; Is_3Drives = false;
//---
          if(Line_O1.Height == 0 || Line_C2.Height == 0 )return;
          Is_Perfect  = false;
          ExDeffrence = 0.20;
          if(Is_Perfect)
          {         double ValuePercentO2O1 = Line_O2.Height / Line_O1.Height;
                    IS_Coondition_O2_O1_1 = ValuePercentO2O1  == 1.270 ?  true : false;
                    IS_Coondition_O2_O1_2 = ValuePercentO2O1  == 1.618 ?  true : false;
                    //---
                    double ValuePercentC3C2 = Line_C3.Height / Line_C2.Height;
                    IS_Coondition_C3_C2_1 = ValuePercentC3C2  == 1.270 ?  true : false;
                    IS_Coondition_C3_C2_2 = ValuePercentC3C2  == 1.618 ?  true : false;//
                    Is_3Drives = (IS_Coondition_O2_O1_1 || IS_Coondition_O2_O1_2) && (IS_Coondition_C3_C2_1 || IS_Coondition_C3_C2_2); //
          }//
          else
          {         //---
                    double ValuePercentO2O1 = Line_O2.Height / Line_O1.Height;
                    IS_Coondition_O2_O1 = (ValuePercentO2O1  <= 1.618 + ExDeffrence && ValuePercentO2O1  >= 1.270 - ExDeffrence) ?  true : false; //--betwin (0.818 0.418)
                    //---
                    double ValuePercentC3C2 = Line_C3.Height / Line_C2.Height;
                    IS_Coondition_C3_C2 = (ValuePercentC3C2  <= 1.618 + ExDeffrence && ValuePercentC3C2  >= 1.270 - ExDeffrence) ?  true : false; //--betwin (0.818 0.418)
                    Is_3Drives = IS_Coondition_O2_O1 && IS_Coondition_C3_C2; //
          }//
}
//+------------------------------------------------------------------+
