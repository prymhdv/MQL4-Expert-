//+------------------------------------------------------------------+
//||   ||||||||||   Stc_CandlePattern__Harmonic_Shape_Cypher.mqh    ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+'
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOAC\Harmonics\Stc_Base.mqh>
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
struct Stc_CandlePattern__Harmonic_Shape_Cypher : public Stc_CandlePattern__Harmonic_Shape_Base
{         //---
          Stc_CandlePattern__Harmonic_Path_data Line_XA;
          Stc_CandlePattern__Harmonic_Path_data Line_AB;
          Stc_CandlePattern__Harmonic_Path_data Line_BC;
          Stc_CandlePattern__Harmonic_Path_data Line_CD;
          Sg_Shape_<int>  _Shape_Com_;
          //
          bool                                          IS_Coondition_AB_BC, IS_Coondition_AB_BC_1, IS_Coondition_AB_BC_2;
          bool                                          IS_Coondition_BC_CD, IS_Coondition_BC_CD_1, IS_Coondition_BC_CD_2;
          bool                                          IS_Coondition_XA_AB, IS_Coondition_XA_AB_1, IS_Coondition_XA_AB_2;
          bool                                          IS_Coondition_XA_CD, IS_Coondition_XA_CD_1, IS_Coondition_XA_CD_2;

          bool          Is_Cypher;

          void          Calc(int i , ENUM_TIMEFRAMES f  ,bool k,Sg_Shape_<int> &_Shape_Com,int mul);
          void          Calc_Legs(int i  , ENUM_TIMEFRAMES f  ,int mul);
          void          __Condition();

};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Stc_CandlePattern__Harmonic_Shape_Cypher::Calc(int i  , ENUM_TIMEFRAMES f ,bool k,Sg_Shape_<int> &_Shape_Com,int mul)
{         //---  XA AB BC CD
//---   XA 0.382 ~ 0.618    AB
//---   AB 1.130 ~ 1.410    BC
//---   BC 1.272 ~ 2.000    CD
//---   XA 0.786            CD
//---   -------------------
//---   finding the paths
//---   -------------------
//---
          Calc_Legs(i, f,mul); __Condition();
//---
//---
//---
//---
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Stc_CandlePattern__Harmonic_Shape_Cypher::Calc_Legs(int i  , ENUM_TIMEFRAMES f ,int mul)
{         //---  XA AB BC CD
          {         Calc__Zigzag__Points(Rang_Zigzag,f,mul);
                    __Calc__Lines(Line_XA, f, i + 5, i + 4); //---  AB
                    __Calc__Lines(Line_AB, f, i + 4, i + 3); //---  AB
                    __Calc__Lines(Line_BC, f, i + 3, i + 2); //---  BC
                    __Calc__Lines(Line_CD, f, i + 2, i + 1); //---  CD
                    //
          }//
//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Stc_CandlePattern__Harmonic_Shape_Cypher::__Condition()
{         bool IS_Coondition = false;
//---
          if(Line_XA.Height == 0 || Line_AB.Height == 0 || Line_BC.Height == 0)return;
          Is_Cypher = false;
          Is_Perfect = false;
          if(Is_Perfect)
          {         double ValuePercentXAAB = Line_AB.Height / Line_XA.Height;
                    IS_Coondition_XA_AB_1 = ValuePercentXAAB  == 0.382 ?  true : false;
                    IS_Coondition_XA_AB_2 = ValuePercentXAAB  == 0.618 ?  true : false;
                    //---
                    double ValuePercentABBC = Line_BC.Height / Line_AB.Height;
                    IS_Coondition_AB_BC_1 = ValuePercentABBC  == 1.130 ?  true : false;
                    IS_Coondition_AB_BC_2 = ValuePercentABBC  == 1.410 ?  true : false;
                    //---
                    double ValuePercentBCCD = Line_CD.Height / Line_BC.Height;
                    IS_Coondition_BC_CD_1 = ValuePercentBCCD  == 1.272  ?  true : false;
                    IS_Coondition_BC_CD_2 = ValuePercentBCCD  == 2.000  ?  true : false;
                    //---
                    double ValuePercentXACD = Line_CD.Height / Line_XA.Height;
                    IS_Coondition_XA_CD = ValuePercentXACD  == 0.786  ?  true : false;//
                    Is_Cypher = (IS_Coondition_XA_AB_1 || IS_Coondition_XA_AB_2) && (IS_Coondition_AB_BC_1 || IS_Coondition_AB_BC_2) && (IS_Coondition_BC_CD_1 || IS_Coondition_BC_CD_2) && IS_Coondition_XA_CD; //
          }//
          else
          {         //---
                    double ValuePercentXAAB = Line_AB.Height / Line_XA.Height;
                    IS_Coondition_XA_AB = (ValuePercentXAAB  <= 0.618 + 0.20 && ValuePercentXAAB  >= 0.382 - 0.20) ?  true : false; //--betwin (0.818 0.418)
                    //---
                    double ValuePercentABBC = Line_BC.Height / Line_AB.Height;
                    IS_Coondition_AB_BC = (ValuePercentABBC  <= 1.410 + 0.20 && ValuePercentABBC  >= 1.130 - 0.20) ?  true : false; //--betwin (0.818 0.418)
                    //---
                    double ValuePercentBCCD = Line_CD.Height / Line_BC.Height;
                    IS_Coondition_BC_CD = (ValuePercentBCCD  <= 2.000 + 0.20 && ValuePercentBCCD  >= 1.272 - 0.20) ?  true : false; //--betwin (0.818 0.418)
                    //---
                    double ValuePercentXACD = Line_CD.Height / Line_XA.Height;
                    IS_Coondition_XA_CD = (ValuePercentXACD  <= 0.786 + 0.20 && ValuePercentXACD  >= 0.786 - 0.20) ?  true : false; //--betwin (0.818 0.418)
                    Is_Cypher = IS_Coondition_XA_AB && IS_Coondition_AB_BC && IS_Coondition_BC_CD && IS_Coondition_XA_CD; //
          }//
}
//+------------------------------------------------------------------+
