//+------------------------------------------------------------------+
//||   ||||||||||    Stc_CandlePattern__Harmonic_Shape_5Drives.mqh  ||
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
struct Stc_CandlePattern__Harmonic_Shape_5Drives : public Stc_CandlePattern__Harmonic_Shape_Base
{         //---
          Stc_CandlePattern__Harmonic_Path_data Line_OX;
          Stc_CandlePattern__Harmonic_Path_data Line_AB;
          Stc_CandlePattern__Harmonic_Path_data Line_BC;
          Stc_CandlePattern__Harmonic_Path_data Line_CD;
          Sg_Shape_<int>  _Shape_Com_;
          //
          bool                                          IS_Coondition_AB_BC, IS_Coondition_AB_BC_1, IS_Coondition_AB_BC_2;
          bool                                          IS_Coondition_BC_CD, IS_Coondition_BC_CD_1, IS_Coondition_BC_CD_2;
          bool                                          IS_Coondition_OX_AB, IS_Coondition_OX_AB_1, IS_Coondition_OX_AB_2;
          double        ExDeffrence;//     0.20
          bool          Is_5Drives;

          void          Calc(int i  , ENUM_TIMEFRAMES f  ,bool k,Sg_Shape_<int> &_Shape_Com,int mul);
          void          Calc_Legs(int i  , ENUM_TIMEFRAMES f ,int mul);
          void          __Condition();//

};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Stc_CandlePattern__Harmonic_Shape_5Drives::Calc(int i , ENUM_TIMEFRAMES f  ,bool k,Sg_Shape_<int> &_Shape_Com,int mul)
{         //---OX AB BC CD
//---   OX 1.130 ~ 1.618  AB            high of OX
//---   AB 1.618 ~ 2.240  BC
//---   BC 0.50           CD
//---   -------------------
//---   finding the paths
//---   -------------------
//---
//---
          Calc_Legs(i, f,  mul);  __Condition();//
//---
//---
//---
//---
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Stc_CandlePattern__Harmonic_Shape_5Drives::Calc_Legs(int i  , ENUM_TIMEFRAMES f  ,int mul)
{         //---  OX AB BC CD
          {         Calc__Zigzag__Points(Rang_Zigzag,f,  mul);
                    __Calc__Lines(Line_OX, f, i + 4, i + 3); //---  AB
                    __Calc__Lines(Line_AB, f, i + 3, i + 2); //---  AB
                    __Calc__Lines(Line_BC, f, i + 2, i + 1); //---  BC
                    __Calc__Lines(Line_CD, f, i + 1, i + 0); //---  CD
                    //
          }//
//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Stc_CandlePattern__Harmonic_Shape_5Drives::__Condition()
{         bool IS_Coondition = false;  Is_5Drives = false;
//---
          if(Line_OX.Height == 0 || Line_AB.Height == 0 || Line_BC.Height == 0)return;
          Is_Perfect    = false;
          ExDeffrence   = 0.20;
          if(Is_Perfect)
          {         double ValuePercentOXAB = Line_AB.Height / Line_OX.Height;
                    IS_Coondition_OX_AB_1 = ValuePercentOXAB  == 1.130 ?  true : false;
                    IS_Coondition_OX_AB_2 = ValuePercentOXAB  == 1.618 ?  true : false;
                    //---
                    double ValuePercentABBC = Line_BC.Height / Line_AB.Height;
                    IS_Coondition_AB_BC_1 = ValuePercentABBC  == 1.618 ?  true : false;
                    IS_Coondition_AB_BC_2 = ValuePercentABBC  == 2.240 ?  true : false;
                    //---
                    double ValuePercentBCCD = Line_CD.Height / Line_BC.Height;
                    IS_Coondition_BC_CD = ValuePercentBCCD  == 0.50  ?  true : false;//
                    Is_5Drives = (IS_Coondition_OX_AB_1 || IS_Coondition_OX_AB_2) && (IS_Coondition_AB_BC_1 || IS_Coondition_AB_BC_2) && IS_Coondition_BC_CD; //
          }//
          else
          {         //---
                    double ValuePercentOXAB = Line_AB.Height / Line_OX.Height;
                    IS_Coondition_OX_AB = (ValuePercentOXAB  <= 1.618 + ExDeffrence && ValuePercentOXAB  >= 1.130 - ExDeffrence) ?  true : false; //--betwin (0.818 0.418)
                    //---
                    double ValuePercentABBC = Line_BC.Height / Line_AB.Height;
                    IS_Coondition_AB_BC = (ValuePercentABBC  <= 2.240 + ExDeffrence && ValuePercentABBC  >= 1.618 - ExDeffrence) ?  true : false; //--betwin (0.818 0.418)
                    //---
                    double ValuePercentBCCD = Line_CD.Height / Line_BC.Height;
                    IS_Coondition_BC_CD = (ValuePercentBCCD  <= 1.50 + ExDeffrence && ValuePercentBCCD  >= 0.50 - ExDeffrence) ?  true : false; //--betwin (0.818 0.418)
                    Is_5Drives = IS_Coondition_OX_AB && IS_Coondition_AB_BC && IS_Coondition_BC_CD; //
          }//
}
//+------------------------------------------------------------------+
