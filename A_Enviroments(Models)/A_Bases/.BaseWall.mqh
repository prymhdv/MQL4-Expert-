//+------------------------------------------------------------------+
//||   ||||||||||                 BaseWall.mqh                      ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    |||
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
#ifndef __BASEWALL__
//+------------------------------------------------------------------+
//|             Class SoundController     BEGIN                      |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Bases\.BasePlane.mqh>
//---Check Dependency--(Minor)To Varables off => #include <.RTL_Prymhdv\QuartsExperts\Base01\.Base01.mqh> //--- Module Existasnce(.BasePlane.mqh))
////+------------------------------------------------------------------+
////|    Module ~~ System ~~ Service ~~ app ~~Utilities~~              | //---   Service Utilities app
////+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Bases\sError.mqh>            C_ERROR         ________________________________________________________Xerorr;              ///>>OKEY 000
//---
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Bases\uUtilities.mqh>        C_UTILITIES     Utilities;      ///>>OKEY 053 
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Bases\uCallFunctions.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\B_MQL\wStaticSun.mqh>        ///>>OKEY 010 ///ByPass Proxy to Handel un Covered Declarng gone Global scoping //#NOERRORRING
//-----------------PreDeclare Function to implant later after classess define to methidolofy
//---off bool Pre_Comment_C_CONDUCTOR(); //---error - no #import declaration    .BaseWall.mqh       19        7  ///--error---no #import declaration  .BaseWall.mqh       19        6
class Global_Object
{
public:
          Global_Object(void) {};
          ~Global_Object(void) {};
          bool  Error()
          {         Is_Error = (_LastError == 0 || _LastError == 4000) ?  false : true ;        //#1
                    if(Is_Error) ErrorDesc = ErrorDescription(_LastError);                      //#2
                    ResetLastError();                                                           //#3
                    return Is_Error; //                                                         //#4
          }
          bool          Is_Error;//
          string        ErrorDesc; //
};
struct StrDescName
{         string     Desc;
          string     Name;//
          bool       IsTrue; //
};

enum E_Key3 { E_Void, E_True, E_False  };
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string  gf_Desc_ADD(string & ss, string s ) { return ss = ss + s;}
//-----------------------------------------------------------------------

struct Sc_Dev_math//y= ax+b
{         //
          string        name;
          double        Slope;
          double        Diff_B;
          double        Diff_Y, Diff_Y2;
          datetime      Diff_X, Diff_X2; //
          double        calcSlope(double y2, double y1, datetime t2, datetime t1 )               { Reset();     if (t2 - t1 == 0)return -1;       return (  (y2 - y1) /  (t2 - t1));  } //--MathAbs  un define +-
          double        GetY_LineFormule(double slope, datetime Point_time, double B_diff)       {  return NormalizeDouble((slope * Point_time) + B_diff, Digits); }
          datetime      GetX_LineFormule(double slope, double Point_Price, double B_diff)        {              if (slope == 0)return -1;       return (datetime)( (Point_Price - B_diff) / slope);   } //  y=mx+b  ///x=(y-b)/m
          double        GetB_LineFormule(double slope, datetime Point_time, double Point_Price)  {  return  Point_Price - (slope * Point_time); }
          //
          void          Reset() { name = ""; Slope = -1; Diff_B = -1; Diff_Y = -1; Diff_X = -1; Diff_Y2 = -1; Diff_X2 = -1;  }

          //
          /*
                        Dev_Math.Slope  = Dev_Math.calcSlope(Point_frist.Price, Point_Correction.Price, Point_frist.Time, Point_Correction.Time);
                        Dev_Math.Diff_B = Dev_Math.GetB_LineFormule(Dev_Math.Slope, Point_Correction.Time, Point_Correction.Price);
                        Dev_Math.Diff_X = Time[0] + PeriodSeconds() * 30;
                        Dev_Math.Diff_Y = Dev_Math.GetY_LineFormule(Dev_Math.Slope,Dev_Math.Diff_X,Dev_Math.Diff_B);
                        //----
          */
};
//---Sc_Dev_math     Dev_Math;
enum E_Market_Direction_ima
{         E_Market_Void, E_Market_Bulish_Expanding, E_Market_Bulish_Nearing, E_Market_Bearish_Expanding, E_Market_Bearish_Nearing

};
enum Et_IMA_NEAR
{         Et_IMA_NEAR_0_130p,           Et_IMA_NEAR_0_130n,
          Et_IMA_NEAR_130p_210p,        Et_IMA_NEAR_130n_210n,
          Et_IMA_NEAR_210p_340p,        Et_IMA_NEAR_210n_340n,
          Et_IMA_NEAR_340p_550p,        Et_IMA_NEAR_340n_550n,
          Et_IMA_NEAR_550p_890p,        Et_IMA_NEAR_550n_890n,
          //-- Et_IMA_NEAR_1440p, Et_IMA_NEAR_1440n,
          //----
          Et_IMA_NEAR_890p_1300p,       Et_IMA_NEAR_890n_1300n,
          Et_IMA_NEAR_1300p_2100p,      Et_IMA_NEAR_1300n_2100n,
          Et_IMA_NEAR_2100p_3400p,      Et_IMA_NEAR_2100n_3400n,
          Et_IMA_NEAR_3400p_5500p,      Et_IMA_NEAR_3400n_5500n,
          Et_IMA_NEAR_5500p_8900p,      Et_IMA_NEAR_5500n_8900n,
          //-- Et_IMA_NEAR_14400p, Et_IMA_NEAR_14400n,
          //----
          Et_IMA_NEAR_8900p_13000p,     Et_IMA_NEAR_8900n_13000n,
          Et_IMA_NEAR_13000p_21000p,    Et_IMA_NEAR_13000n_21000n,
          Et_IMA_NEAR_21000p_34000p,    Et_IMA_NEAR_21000n_34000n,
          Et_IMA_NEAR_34000p_55000p,    Et_IMA_NEAR_34000n_55000n,
          Et_IMA_NEAR_55000p_89000p,    Et_IMA_NEAR_55000n_89000n,
          //-- Et_IMA_NEAR_144000p, Et_IMA_NEAR_14400n,
          Et_IMA_NEAR_Void
          //
};

enum E_TL_Movment //E_TL_Movment_Type
{         E_Movment_Void,
          E_Movment_UU,
          E_Movment_DU,
          E_Movment_ULL,
          E_Movment_DLL,
          //

          E_Movment_ULL_DLL,
          E_Movment_DLL_DLL,
          E_Movment_UU_DLL,
          E_Movment_DU_DLL,
          //
          E_Movment_ULL_ULL,
          E_Movment_DLL_ULL,
          E_Movment_UU_ULL,
          E_Movment_DU_ULL,
          //
          E_Movment_DLL_UU,
          E_Movment_ULL_UU,
          E_Movment_UU_UU,
          E_Movment_DU_UU,
          //
          E_Movment_ULL_DU,
          E_Movment_DLL_DU,
          E_Movment_UU_DU,
          E_Movment_DU_DU,

};
enum E_Wave_Type
{         E_Correcton,
          E_Passed,
          E_Passed_70,
          E_Passed_50,
          E_Passed_30,
          E_Passed_10,
          E_Correcton_70,
          E_Correcton_50,
          E_Correcton_30,
          E_Correcton_10

};
enum E_Place_Point
{         E_PP_Void, E_PP_Lowest, E_PP_Highest };
//---------------------------------------------------
////  double        Price_Highest;
//      //  double        Price_Lowest; //
//      //  int           Shift;
//        //
//        datetime      Extermum_Time;
//        double        Extermum_Price;//---On--
//        int           Extermum_Shift;
//    Sg_Wave_                 Wave_Lowest, Wave_Highest;
//---------------------------------------------------
struct Sg_Point_
{         datetime              _Time;
          double                _Close, _High, _Low, _Open, _Price; //;
          int                   _Shift;
          ENUM_TIMEFRAMES       TF;
          ///------------------------------------------------------
          bool          Is_Lowest;    //---
          bool          Is_Highest;   //---
          E_Place_Point Place_Point;
          bool          Is_Touched;
          //
          double        Diff_Ask;
          double        Diff_High, Diff_Low;
          //
          bool          Is_Diff_High_Maximum, Is_Diff_Low_Maximum;
          int           All_diff_High_Shift, All_diff_Low_Shift;

          //
          double        MACD_Value_Main, MACD_Value_Signal; //

          void set(int sh, double sp, datetime t, ENUM_TIMEFRAMES tf, string n)
          {         TF                   = tf;
                    _Shift               = sh;
                    _Time                = iTime(NULL, tf, _Shift);
                    _Close               = iClose(NULL, tf, _Shift);
                    _High                = iHigh(NULL, tf, _Shift);
                    _Low                 = iLow(NULL, tf, _Shift);
                    _Open                = iOpen(NULL, tf, _Shift);
                    _Price      = sp;
                    if(n != "")         { Diff_High = _High - ObjectGetValueByShift( n, _Shift);       Diff_Low = _Low  - ObjectGetValueByShift( n, _Shift);}
                    //;
                    _Shift        = _Shift;
                    _Close        = iClose(NULL, tf, _Shift);
                    _Time         = iTime(NULL, tf, _Shift);
                    Diff_High     = iHigh(NULL, tf, _Shift) - ObjectGetValueByShift( n, _Shift);
                    Diff_Low      = iLow(NULL, tf, _Shift)  - ObjectGetValueByShift( n, _Shift);//
                    _High         = iHigh(NULL, tf, _Shift);
                    _Low          = iLow(NULL, tf, _Shift);//
          }
          void setArray(Sg_Point_ &a[], int sh, double sp, datetime t, ENUM_TIMEFRAMES tf, string n)
          {         TF                   = tf;
                    _Shift               = sh;
                    _Time                = iTime(NULL, tf, _Shift);
                    _Close               = iClose(NULL, tf, _Shift);
                    _High                = iHigh(NULL, tf, _Shift);
                    _Low                 = iLow(NULL, tf, _Shift);
                    _Open                = iOpen(NULL, tf, _Shift);
                    _Price      = sp;
                    if(n != "")         { Diff_High = _High - ObjectGetValueByShift( n, _Shift);       Diff_Low = _Low  - ObjectGetValueByShift( n, _Shift);}
                    //;
                    a[_Shift]._Shift        = _Shift;
                    a[_Shift]._Close        = iClose(NULL, tf, _Shift);
                    a[_Shift]._Time         = iTime(NULL, tf, _Shift);
                    a[_Shift].Diff_High     = iHigh(NULL, tf, _Shift) - ObjectGetValueByShift( n, _Shift);
                    a[_Shift].Diff_Low      = iLow(NULL, tf, _Shift)  - ObjectGetValueByShift( n, _Shift);//
                    a[_Shift]._High         = iHigh(NULL, tf, _Shift);
                    a[_Shift]._Low          = iLow(NULL, tf, _Shift);//
          }
          //
};


struct Sg_Wave_
{         void           Sg_Wave_(string n)        {name = n;} ;
          void          ~Sg_Wave_() {};
          void          Sg_Wave_() {};
          //****************************************************
          string        name;
          bool          IsBasic_Existed()    { return ObjectFind(ChartID(), name) >= 0; }
          bool          ISBasic_NotExisted() { return ObjectFind(ChartID(), name) < 0; };
          Sc_Dev_math   Dev_Math;
          int           BarCount;

          Sg_Point_      A; //
          Sg_Point_      Z; //
          Sg_Point_      S;  // shifted
          Sg_Point_      All[];
          void SetUp(ENUM_TIMEFRAMES f, int s, double p, datetime t, int s2, double p2, datetime t2, Sg_Wave_ & w, Sg_Wave_ & w2)
          {         A.set(s, p, t, f, "");
                    Z.set(s2, p2, t2, f, "");
                    //
                    calc_ExtemumPlace();
                    Calc_Highth(); Calc_Is_Bulish();  Calc_FiboRet(w, f); Calc_Slope();  Calc_FiboRet_LastWave2(w2); //
          }

          void    calc_ExtemumPlace()
          {         if(Z._Price < A._Price)       { Z.Place_Point   = E_PP_Lowest;  A.Place_Point   = E_PP_Highest;   Z.Is_Lowest  = true;  Z.Is_Highest = false;   A.Is_Lowest  = false;  A.Is_Highest = true; }
                    else                                          { Z.Place_Point   = E_PP_Highest; Z.Place_Point   = E_PP_Lowest;    Z.Is_Highest = true;  Z.Is_Lowest  = false;   A.Is_Highest = false;  A.Is_Lowest  = true; }//
          } //

          void      Calc_Diffs(ENUM_TIMEFRAMES f)
          {         BarCount = Z._Shift + A._Shift - Z._Shift + 20;  //---
                    //Alert(name + " BarCount ", BarCount," Z._Shift ", Z._Shift," A._Shift ", A._Shift);
                    ArrayResize(All, BarCount);
                    for(int i = Z._Shift  ; i < A._Shift + 1 ; i++ ) { All[i].set(i, 0, 0, f, name); }
                    double temp_diff_high       = 0;
                    int    temp_diff_high_Shift = 0;
                    double temp_diff_low        = 0;
                    int    temp_diff_low_Shift  = 0;
                    //
                    double max_High = All[0].Diff_High;
                    double max_Low  = All[0].Diff_Low;
                    for(int i = Z._Shift  ; i < A._Shift + 1 ; i++ )
                    {         //
                              /*find maximum_high in aarray*/ if( All[i].Diff_High > max_High) { max_High = All[i].Diff_High;   temp_diff_high = All[i].Diff_High;      temp_diff_high_Shift = i; All[0].All_diff_High_Shift = i; }//
                              /*find maximum_low in aarray*/  if( All[i].Diff_Low < max_Low)   { max_Low  = All[i].Diff_Low;    temp_diff_low  = All[i].Diff_Low;       temp_diff_low_Shift  = i; All[0].All_diff_Low_Shift  = i; }//
                    }
                    // Alert(name +   "A._Shift ", A._Shift, "    Z._Shift ", Z._Shift, "     temp_diff_high_Shift ", temp_diff_high_Shift, "    temp_diff_high ", temp_diff_high, "    max_High:", max_High); //
                    // Alert(name +   "A._Shift ", A._Shift, "    Z._Shift ", Z._Shift, "     temp_diff_low_Shift ",  temp_diff_low_Shift, "      temp_diff_low ",  temp_diff_low, "    max_Low:", max_Low); //
          }
          double        Highth;//--Range All
          double        Calc_Highth()    { return Highth = MathAbs(Z._Price - A._Price);};      //= (Z._Price > A._Price)  ? Z._Price - A._Price : A._Price - Z._Price; }
          //
          double        Slope;
          double        Calc_Slope()     { if(Z._Time - A._Time == 0) { return 0; Alert("dived zeero ", __FUNCTION__ ); } Slope =   Is_Bulish ?    Z._Price - A._Price / Z._Time - A._Time  :   A._Price - Z._Price / Z._Time - A._Time; /*Alert(name + " Slope:", Slope);*/  return Slope;  }
          //
          bool          Is_Bulish;// Is_Bulish_TL_2_4__TL_1_3  Is_Bulish_TL_2_4__TL_1_3
          bool          Calc_Is_Bulish() {  return Is_Bulish = (Z._Price > A._Price) ? true : false;};
          //
          double        FiboRet_LastWave;
          double        FiboRet_LastWave2;
          double        Calc_FiboRet(Sg_Wave_ & w, ENUM_TIMEFRAMES f)
          {         if(w.Highth == 0) {w.Highth += 1;}
                    FiboRet_LastWave  = NormalizeDouble(Highth / w.Highth, 3);    Wave_Type_Before = (FiboRet_LastWave * 100  >= 100) ?  E_Passed : E_Correcton;
                    Is_Wave_Type_Before_E_Correcton = Wave_Type_Before == E_Correcton ? true : false;  Is_Wave_Type_Before_E_Passed = Wave_Type_Before == E_Passed ? true : false;
                    Wave_Type_Before =  (FiboRet_LastWave * 100  >= 100) ?  E_Passed : E_Correcton;//Is_Bulish &&
                    ///
                    {         int Shift_Highest = iHighest(NULL, f, MODE_HIGH, Z._Shift, 0);   double High_ = iHigh(NULL, f, Shift_Highest);
                              int Shift_Lowest  = iLowest(NULL, f, MODE_LOW, Z._Shift, 0);     double Low_  = iLow(NULL, f, Shift_Lowest);
                              //
                              double After_Highth = Is_Bulish ? MathAbs(Z._Price - Low_) : MathAbs(Z._Price - High_);
                              if(Highth == 0) {Highth += 1;}
                              double  FiboRet_AfterWave  = NormalizeDouble( After_Highth  / Highth, 3);    //--  Alert(name + " After_Highth ", After_Highth, "       Highth ", Highth     );
                              Wave_Type_After =   (FiboRet_AfterWave * 100  >= 100) ?  E_Passed : E_Correcton;//
                              //---if(Wave_Type_After == E_Correcton)
                              {         if ((FiboRet_AfterWave * 100  >= 70) && (FiboRet_AfterWave * 100  <= 100))      { Wave_Type_After = E_Correcton_70; }//if(name == "Wave5")Alert(name + " E_Correcton_70 -FiboRet_AfterWave * 100 - ", FiboRet_AfterWave * 100);  } //Is_Bulish &&
                                        else if((FiboRet_AfterWave * 100  >= 50) && (FiboRet_AfterWave * 100  <= 70))   { Wave_Type_After = E_Correcton_50; }//if(name == "Wave5")Alert(name + " E_Correcton_50 -FiboRet_AfterWave * 100 - ", FiboRet_AfterWave * 100);  } //Is_Bulish &&
                                        else if((FiboRet_AfterWave * 100  >= 30) && (FiboRet_AfterWave * 100  <= 50))   { Wave_Type_After = E_Correcton_30; }//if(name == "Wave5")Alert(name + " E_Correcton_30 -FiboRet_AfterWave * 100 - ", FiboRet_AfterWave * 100);  } //Is_Bulish &&
                                        else if((FiboRet_AfterWave * 100  >= 10) && (FiboRet_AfterWave * 100  <= 30))   { Wave_Type_After = E_Correcton_10; }//if(name == "Wave5")Alert(name + " E_Correcton_10 -FiboRet_AfterWave * 100 - ", FiboRet_AfterWave * 100);  } //Is_Bulish &&
                                        else if((FiboRet_AfterWave * 100  >= 110) && (FiboRet_AfterWave * 100  <= 130)) { Wave_Type_After = E_Passed_10;    }//if(name == "Wave5")Alert(name + " E_Passed_10 -FiboRet_AfterWave * 100 - ", FiboRet_AfterWave * 100);     } //Is_Bulish &&
                                        else if((FiboRet_AfterWave * 100  >= 130) && (FiboRet_AfterWave * 100  <= 150)) { Wave_Type_After = E_Passed_30;    }//if(name == "Wave5")Alert(name + " E_Passed_30 -FiboRet_AfterWave * 100 - ", FiboRet_AfterWave * 100);     } //Is_Bulish &&
                                        else if((FiboRet_AfterWave * 100  >= 150) && (FiboRet_AfterWave * 100  <= 170)) { Wave_Type_After = E_Passed_50;    }//if(name == "Wave5")Alert(name + " E_Passed_50 -FiboRet_AfterWave * 100 - ", FiboRet_AfterWave * 100);     } //Is_Bulish &&
                                        else if((FiboRet_AfterWave * 100  >= 170) && (FiboRet_AfterWave * 100  <= 200)) { Wave_Type_After = E_Passed_70;    }//if(name == "Wave5")Alert(name + " E_Passed_70 -FiboRet_AfterWave * 100 - ", FiboRet_AfterWave * 100);     } //Is_Bulish &&
                                        //
                                        //if((FiboRet_AfterWave * 100  >= 70) && (FiboRet_AfterWave * 100  <= 100))
                                        //{         Wave_Type_After = E_Passed_70; }
                                        //else
                                        //{         Wave_Type_After = E_Correcton_70; } //
                                        //
                              }
                              //
                    }
                    //
                    return  FiboRet_LastWave; //
          }
          double        Calc_FiboRet_LastWave2(Sg_Wave_ & w) { if(w.Highth == 0) {w.Highth += 1;} FiboRet_LastWave2 = NormalizeDouble(Highth / w.Highth, 3);      return  FiboRet_LastWave;     } //
          //**********************

          //
          bool          Is_MACD_Divergenced;//  by previous  Sg_Point_ of last wave 3-5   2-4  1-3  0-2
          E_Wave_Type   Wave_Type_Before, Wave_Type_After;
          bool          Is_Wave_Type_Before_E_Correcton, Is_Wave_Type_Before_E_Passed;
          //
};
//+------------------------------------------------------------------+
//|             Class SoundController     BEGIN                      |
//+------------------------------------------------------------------+
#endif
//+------------------------------------------------------------------+
//||   ||||||||||                 BaseWall.mqh                      ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    |||
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
