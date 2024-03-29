//+------------------------------------------------------------------+
//||   ||||||||||   Stc_CandlePattern__Harmonic_Shape_Shark.mqh     ||
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
struct Stc_CandlePattern__Harmonic_Shape_Shark : public Stc_CandlePattern__Harmonic_Shape_Base
{         //---
          Stc_CandlePattern__Harmonic_Path_data Line_OX;
          Stc_CandlePattern__Harmonic_Path_data Line_XA;
          Stc_CandlePattern__Harmonic_Path_data Line_AB;
          Stc_CandlePattern__Harmonic_Path_data Line_BC;
          Sg_Shape_<int>  _Shape_Com_;
          //
          bool                                          IS_Coondition_AB_BC, IS_Coondition_AB_BC_1, IS_Coondition_AB_BC_2;
          bool                                          IS_Coondition_XA_AB, IS_Coondition_XA_AB_1, IS_Coondition_XA_AB_2;
          bool                                          IS_Coondition_BC_OX, IS_Coondition_BC_OX_1, IS_Coondition_BC_OX_2;

          bool          Is_Shark;

          void          Calc(int i  , ENUM_TIMEFRAMES f  ,bool k,Sg_Shape_<int> &_Shape_Com,int mul);
          void          Calc_Legs(int i , ENUM_TIMEFRAMES f ,int mul);
          void          __Condition();

};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Stc_CandlePattern__Harmonic_Shape_Shark::Calc(int i  , ENUM_TIMEFRAMES f ,bool k,Sg_Shape_<int> &_Shape_Com,int mul)
{         //---OX XA AB BC
//---   OX  1.130 ~ 1.618  AB
//---   XA  1.618 ~ 2.24   BC
//---   OX  0.886 ~ 1.130  BC
//---   -------------------
//---   finding the paths
//---   -------------------
//---
//---
          Calc_Legs(i, f,  mul);      __Condition();
//---
//---
//---
//---
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Stc_CandlePattern__Harmonic_Shape_Shark::Calc_Legs(int i , ENUM_TIMEFRAMES f ,int mul)
{         //---  OX XA AB BC
          {         Calc__Zigzag__Points(Rang_Zigzag,f,  mul);
                    __Calc__Lines(Line_OX, f, i + 5, i + 4); //---  AB
                    __Calc__Lines(Line_XA, f, i + 4, i + 3); //---  AB
                    __Calc__Lines(Line_AB, f, i + 3, i + 2); //---  BC
                    __Calc__Lines(Line_BC, f, i + 2, i + 1); //---  CD
                    //
          }//
//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Stc_CandlePattern__Harmonic_Shape_Shark::__Condition()
{         Is_Shark = false;
          bool IS_Coondition = false;
//---
          if(Line_OX.Height == 0 || Line_XA.Height == 0 || Line_BC.Height == 0)return;
          Is_Perfect = false;
          if(Is_Perfect)
          {         double ValuePercentOXAB = Line_AB.Height / Line_OX.Height;
                    IS_Coondition_XA_AB_1 = ValuePercentOXAB  == 1.130 ?  true : false;
                    IS_Coondition_XA_AB_2 = ValuePercentOXAB  == 1.618 ?  true : false;
                    //---
                    double ValuePercentXABC = Line_BC.Height / Line_XA.Height;
                    IS_Coondition_AB_BC_1 = ValuePercentXABC  == 1.618 ?  true : false;
                    IS_Coondition_AB_BC_2 = ValuePercentXABC  == 2.240 ?  true : false;
                    //---
                    double ValuePercentBCOX = Line_OX.Height / Line_BC.Height;
                    IS_Coondition_BC_OX_1 = ValuePercentBCOX  == 0.886  ?  true : false;
                    IS_Coondition_BC_OX_2 = ValuePercentBCOX  == 1.130  ?  true : false;//
                    Is_Shark = (IS_Coondition_XA_AB_1 || IS_Coondition_XA_AB_2) && (IS_Coondition_AB_BC_1 || IS_Coondition_AB_BC_2) && (IS_Coondition_BC_OX_1 || IS_Coondition_BC_OX_2); //
          }//
          else
          {         //---
                    double ValuePercentXAAB = Line_AB.Height / Line_XA.Height;
                    IS_Coondition_XA_AB = (ValuePercentXAAB  <= 1.618 + 0.20 && ValuePercentXAAB  >= 1.130 - 0.20) ?  true : false; //--betwin (0.818 0.418)
                    //---
                    double ValuePercentABBC = Line_BC.Height / Line_AB.Height;
                    IS_Coondition_AB_BC = (ValuePercentABBC  <= 2.240 + 0.20 && ValuePercentABBC  >= 1.618 - 0.20) ?  true : false; //--betwin (0.818 0.418)
                    //---
                    double ValuePercentBCOX = Line_OX.Height / Line_BC.Height;
                    IS_Coondition_BC_OX = (ValuePercentBCOX  <= 1.130 + 0.20 && ValuePercentBCOX  >= 0.886 - 0.20) ?  true : false; //--betwin (0.818 0.418)
                    Is_Shark = IS_Coondition_XA_AB && IS_Coondition_AB_BC && IS_Coondition_BC_OX; //
          }//
}
//+------------------------------------------------------------------+
