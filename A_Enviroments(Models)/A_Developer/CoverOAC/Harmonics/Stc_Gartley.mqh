//+------------------------------------------------------------------+
//||   ||||||||||    Stc_CandlePattern__Harmonic_Shape_Gartley.mqh  ||
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
struct Stc_CandlePattern__Harmonic_Shape_Gartley : public Stc_CandlePattern__Harmonic_Shape_Base
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

          bool          Is_Gartley;

          void          Calc(int i  , ENUM_TIMEFRAMES f  ,bool k,Sg_Shape_<int> &_Shape_Com,int mul);
          void          Calc_Legs(int i  , ENUM_TIMEFRAMES f  ,int mul);
          void          __Condition();

};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Stc_CandlePattern__Harmonic_Shape_Gartley::Calc(int i , ENUM_TIMEFRAMES f ,bool k,Sg_Shape_<int> &_Shape_Com,int mul)
{         //---  XA AB BC CD
//---   XA 0.618            AB
//---   AB 0.382 ~ 0.886    BC
//---   BC 1.272 ~ 1.618    CD
//---   XA 0.786            CD
//---   -------------------
//---   finding the paths
//---   -------------------
//---
          Calc_Legs(i, f,mul);      __Condition();
//---
//---
//---
//---
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Stc_CandlePattern__Harmonic_Shape_Gartley::Calc_Legs(int i , ENUM_TIMEFRAMES f  ,int mul)
{         //---  XA AB BC CD
          {         Calc__Zigzag__Points(Rang_Zigzag,f,  mul);
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
void Stc_CandlePattern__Harmonic_Shape_Gartley::__Condition()
{         bool IS_Coondition = false;
//---
          Is_Gartley = false;
          if(Line_XA.Height == 0 || Line_AB.Height == 0 || Line_BC.Height == 0)return;
          Is_Perfect = false;
          if(Is_Perfect)
          {         double ValuePercentXAAB = Line_AB.Height / Line_XA.Height;
                    IS_Coondition_XA_AB = ValuePercentXAAB  == 0.618 ?  true : false;
                    //---
                    double ValuePercentABBC = Line_BC.Height / Line_AB.Height;
                    IS_Coondition_AB_BC_1 = ValuePercentABBC  == 0.382 ?  true : false;
                    IS_Coondition_AB_BC_2 = ValuePercentABBC  == 0.886 ?  true : false;
                    //---
                    double ValuePercentBCCD = Line_CD.Height / Line_BC.Height;
                    IS_Coondition_BC_CD_1 = ValuePercentBCCD  == 1.272  ?  true : false;
                    IS_Coondition_BC_CD_2 = ValuePercentBCCD  == 1.618  ?  true : false;
                    //---
                    double ValuePercentXACD = Line_CD.Height / Line_XA.Height;
                    IS_Coondition_XA_CD = ValuePercentXACD  == 0.786  ?  true : false;//
                    Is_Gartley = (IS_Coondition_XA_AB) && (IS_Coondition_AB_BC_1 || IS_Coondition_AB_BC_2) && (IS_Coondition_BC_CD_1 || IS_Coondition_BC_CD_2) && IS_Coondition_XA_CD; //
          }//
          else
          {         //---
                    double ValuePercentXAAB = Line_AB.Height / Line_XA.Height;
                    IS_Coondition_XA_AB = (ValuePercentXAAB  <= 0.618 + 0.20 && ValuePercentXAAB  >= 0.618 - 0.20) ?  true : false; //--betwin (0.818 0.418)
                    //---
                    double ValuePercentABBC = Line_BC.Height / Line_AB.Height;
                    IS_Coondition_AB_BC = (ValuePercentABBC  <= 0.886 + 0.20 && ValuePercentABBC  >= 0.382 - 0.20) ?  true : false; //--betwin (0.818 0.418)
                    //---
                    double ValuePercentBCCD = Line_CD.Height / Line_BC.Height;
                    IS_Coondition_BC_CD = (ValuePercentBCCD  <= 1.618 + 0.20 && ValuePercentBCCD  >= 1.272 - 0.20) ?  true : false; //--betwin (0.818 0.418)
                    //---
                    double ValuePercentXACD = Line_CD.Height / Line_XA.Height;
                    IS_Coondition_XA_CD = (ValuePercentXACD  <= 0.786 + 0.20 && ValuePercentXACD  >= 0.786 - 0.20) ?  true : false; //--betwin (0.818 0.418)
                    Is_Gartley = IS_Coondition_XA_AB && IS_Coondition_AB_BC && IS_Coondition_BC_CD && IS_Coondition_XA_CD; //
          }//
}
//+------------------------------------------------------------------+
