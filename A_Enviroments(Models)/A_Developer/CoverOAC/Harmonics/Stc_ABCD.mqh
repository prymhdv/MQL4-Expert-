//+------------------------------------------------------------------+
//||   ||||||||||     Stc_CandlePattern__Harmonic_Shape_ABCD.mqh    ||
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
struct Stc_CandlePattern__Harmonic_Shape_ABCD : public Stc_CandlePattern__Harmonic_Shape_Base
{         //---

          Stc_CandlePattern__Harmonic_Path_data Line_AB;
          Stc_CandlePattern__Harmonic_Path_data Line_BC;
          Stc_CandlePattern__Harmonic_Path_data Line_CD;
          Sg_Shape_<int>  _Shape_Com_;
          //
          bool          Is_ABCD;

          bool          IS_Coondition_AB_BC, IS_Coondition_AB_BC_1, IS_Coondition_AB_BC_2;
          bool          IS_Coondition_BC_CD, IS_Coondition_BC_CD_1, IS_Coondition_BC_CD_2;

          void          Calc(int , ENUM_TIMEFRAMES f  ,bool k,Sg_Shape_<int> &_Shape_Com, int mul);
          void          Calc_Legs(int i  , ENUM_TIMEFRAMES f  , int mul);
          void          __Condition();

};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Stc_CandlePattern__Harmonic_Shape_ABCD::Calc(int i, ENUM_TIMEFRAMES f ,bool k,Sg_Shape_<int> &_Shape_Com, int mul)
{         //---  AB BC CD
//---   AB 0.618 ~ 0.786 BC
//---   BC 1.270 ~ 1.618 CD
//---   -------------------
//---   finding the paths
//---   -------------------
          int step = 3;
          ///for(int k = 0; k < 100; k++)= k
          {         Calc_Legs(i, f, mul);    __Condition(); }  // EACH CYCLE CATCH LAST CONDITION
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Stc_CandlePattern__Harmonic_Shape_ABCD::Calc_Legs(int  i, ENUM_TIMEFRAMES f  , int mul)
{         //---  AB BC CD
          {         Calc__Zigzag__Points(Rang_Zigzag,f, mul);
                    __Calc__Lines(Line_AB, f, i + 4,  i + 3); //---  AB wave
                    __Calc__Lines(Line_BC, f, i + 3,  i + 2); //---  BC
                    __Calc__Lines(Line_CD, f, i + 2,  i + 1); //---  CD
                    //
          }//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Stc_CandlePattern__Harmonic_Shape_ABCD::__Condition()
{
//---
          if(  Line_AB.Height == 0 || Line_BC.Height == 0)return;
          Is_Perfect = false;
          Is_ABCD = false;
          if(Is_Perfect)
          {         double ValuePercentABBC = Line_BC.Height / Line_AB.Height;
                    IS_Coondition_AB_BC = (ValuePercentABBC  == 0.618 || ValuePercentABBC  == 0.786 ) ?  true : false;
                    //IS_Coondition_AB_BC = (ValuePercentABBC  == 0.786 ) ?  true : false;//
                    //
                    double ValuePercentBCCD = Line_CD.Height / Line_BC.Height;//
                    IS_Coondition_BC_CD = (ValuePercentBCCD  == 1.270 || ValuePercentBCCD  == 1.618 ) ?  true : false;
                    //IS_Coondition_BC_CD = (ValuePercentBCCD  == 1.618 ) ?  true : false;////
                    Is_ABCD = IS_Coondition_AB_BC || IS_Coondition_BC_CD;//
          }
          else
          {         double ValuePercentABBC = Line_BC.Height / Line_AB.Height;
                    IS_Coondition_AB_BC = (ValuePercentABBC  == 0.618 + 0.20 ) ?  true : false;
                    IS_Coondition_AB_BC = (ValuePercentABBC  == 0.618 - 0.20) ?  true : false;
                    //
                    IS_Coondition_AB_BC_1 = (ValuePercentABBC  <= 0.618 + 0.20 && ValuePercentABBC  >= 0.618 - 0.20) ?  true : false; //--betwin (0.818 0.418)
                    //
                    IS_Coondition_AB_BC = (ValuePercentABBC  == 0.786 + 0.20) ?  true : false;
                    IS_Coondition_AB_BC = (ValuePercentABBC  >= 0.786 - 0.20) ?  true : false;
                    //
                    IS_Coondition_AB_BC_2 = (ValuePercentABBC  <= 0.786 + 0.20 && ValuePercentABBC  >= 0.786 - 0.20) ?  true : false;
                    IS_Coondition_AB_BC = IS_Coondition_AB_BC_1 || IS_Coondition_AB_BC_2;
                    //---
                    //---
                    double ValuePercentBCCD = Line_CD.Height / Line_BC.Height;
                    IS_Coondition_BC_CD = (ValuePercentBCCD  == 1.270 + 0.20) ?  true : false;
                    IS_Coondition_BC_CD = (ValuePercentBCCD  == 1.270 - 0.20) ?  true : false;
                    //
                    IS_Coondition_AB_BC_1 = (ValuePercentBCCD  <= 1.270 + 0.20 && ValuePercentBCCD  >= 1.270 - 0.20) ?  true : false;
                    //
                    IS_Coondition_BC_CD = (ValuePercentBCCD  == 1.618 + 0.20) ?  true : false;//
                    IS_Coondition_BC_CD = (ValuePercentBCCD  == 1.618 - 0.20) ?  true : false;//
                    //
                    IS_Coondition_AB_BC_2 = (ValuePercentBCCD  <= 1.618 + 0.20 && ValuePercentBCCD  >= 1.618 - 0.20) ?  true : false;//
                    IS_Coondition_AB_BC = IS_Coondition_AB_BC_1 || IS_Coondition_AB_BC_2;//
                    Is_ABCD = IS_Coondition_AB_BC_1 && IS_Coondition_AB_BC_2; //
          } //
}//
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
