//+------------------------------------------------------------------+
//||   ||||||||||       St_CDI_MA_All.mqh                               ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOA\St_CDI_Base.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\B_MQL\CoverOT\tMqlConductor.mqh>
//#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOTC\.CoverOTC.mqh>
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
struct St_CondicatorData_Trigers //---fast solution
{         St_CondicatorData_Trigers()
          {         ArrayResize(_500_, 20);
                    ArrayResize(_20_, 20);
                    ArrayResize(_500_M, 20);
                    ArrayResize(_20_M, 20); };
          ~St_CondicatorData_Trigers() {};
          //-----------------------------------------------------------
          /*dataZone*/

          bool       IsSellTriger_500_Lower_500_M;
          bool       IsBuyTriger_500_Grater_500_M;
          bool       Is_INC_Close_Grater_500_ ;
          bool       Is_DEC_Close_Lower_500_ ;
          //----
          bool       IsSellTriger_20_Lower_20_M;
          bool       IsBuyTriger_20_Grater_20_M;
          bool       Is_INC_Close_Grater_20_ ;
          bool       Is_DEC_Close_Lower_20_ ;
          //----
          bool       IsExpanding(int fp, int lp, double &_X_[], double &_X_M[])                 {return MathAbs(_X_[fp] - _X_M[fp]) > MathAbs(_X_[lp] - _X_M[lp]);};  /*else nearing*/ //--IsExpanding(0,3,_500_,_500_M);
          bool       IsExpanding(int fp, int lp, double &_X_[], double _Xfp_, double _Xlp_)     {return MathAbs(_X_[fp] - _Xfp_) > MathAbs(_X_[lp] - _Xlp_);};/*else nearing*/
          bool       IsExpanding(int fp, int lp, double &_X_[], double _Xp_)                    {return MathAbs(_X_[fp] - _Xp_) > MathAbs(_X_[lp] - _Xp_);};/*else nearing*/

          //
          bool       IsExpanding_20_, IsExpanding_500_; /*false nearing*/ /*true expanding*/
          bool       IsNearing_EMA500_Close200;
          //
          bool       IsExpanding_20_Bulish, IsExpanding_500__Bulish;
          bool       IsExpanding_20_Bearish, IsExpanding_500__Bearish;
          //--

          //-----------------------------------------------------------
          double _500_[] ;//= iMA(  string symbol, int timeframe, int ma_period, int ma_shift, int ma_method, int applied_price, int shift);
          double _20_[]  ;//= iMA(  string symbol, int timeframe, int ma_period, int ma_shift, int ma_method, int applied_price, int shift);
          //
          double _500_M[] ;//= iMAOnArray( double array[], int total, int ma_period, int ma_shift, int ma_method, int shift );
          double _20_M[] ;//= iMAOnArray( double array[], int total, int ma_period, int ma_shift, int ma_method, int shift );
          //-----------------------------------------------------------
          /*FunctionZone*/
          bool       Update()
          {         //ct_Drive.TDD.ct_Conductor.DC_data.Indicators.
                    //--we need just 10 candel info
                    ArrayResize(_500_, 500);
                    ArrayResize(_20_, 20);
                    ArrayResize(_500_M, 500);
                    ArrayResize(_20_M, 20);
                    for(int i = 0; i < ArraySize(_500_); i++)   { _500_[i] = NormalizeDouble(iMA(  NULL, PERIOD_CURRENT, 500, 0, MODE_EMA, PRICE_CLOSE, i), _Digits); }
                    for(int i = 0; i < ArraySize(_20_); i++)    { _20_[i]  = NormalizeDouble(iMA(  NULL, PERIOD_CURRENT, 20, 0, MODE_EMA, PRICE_CLOSE, i), _Digits);}
                    //
                    for(int i = 0; i < ArraySize(_500_M); i++)  {_500_M[i]   = NormalizeDouble(iMAOnArray( _500_, 500, 500, 0, MODE_EMA, i ), _Digits);}
                    for(int i = 0; i < ArraySize(_20_M); i++)   {_20_M[i]    = NormalizeDouble(iMAOnArray( _20_, 20, 20,   0, MODE_EMA, i), _Digits);}
                    //
                    //--------------
                    //Alert("the triger 500m: ", _500_M, "   500: ", _500_[0]);
                    //Alert("the triger 20m: ", _20_M, "  20: ", _20_[0]);
                    //--------------
                    //extern trigers
                    IsSellTriger_500_Lower_500_M    = _500_[0] < _500_M[0];
                    IsBuyTriger_500_Grater_500_M     = _500_[0] > _500_M[0];
                    //
                    IsSellTriger_20_Lower_20_M          = _20_[0] < _20_M[0];
                    IsBuyTriger_20_Grater_20_M          = _20_[0] > _20_M[0];
                    //
                    Is_INC_Close_Grater_500_    = _500_[0] < Close[0] && Close[1] > Close[5];
                    Is_DEC_Close_Lower_500_     = _500_[0] > Close[0] && Close[1] < Close[5];;
                    //
                    Is_INC_Close_Grater_20_     = _20_[0] < Close[0] && Close[1] > Close[5];;
                    Is_DEC_Close_Lower_20_      = _20_[0] > Close[0] && Close[1] < Close[5];;
                    //--------------
                    IsExpanding_20_  = IsExpanding(0, 3, _20_, _20_M );
                    IsExpanding_500_ = IsExpanding(0, 3, _500_, _500_M);
                    //
                    IsExpanding_20_Bulish       = IsExpanding_20_  &&  IsBuyTriger_20_Grater_20_M ;
                    IsExpanding_500__Bulish     = IsExpanding_500_ &&  IsBuyTriger_500_Grater_500_M ;
                    IsExpanding_20_Bearish      = IsExpanding_20_  &&  IsSellTriger_20_Lower_20_M ;
                    IsExpanding_500__Bearish    = IsExpanding_500_ &&  IsSellTriger_500_Lower_500_M ;
                    //--------------
                    IsNearing_EMA500_Close200 = !IsExpanding(1, 200, _500_, Close[1], Close[200] );
                    IsNearing_EMA500_Close200 = !IsExpanding(1, 200, _500_, Close[200] );//som un undersanding wrong
                    IsNearing_EMA500_Close200 = !IsExpanding(1, 200, _500_, _500_M); // work ok
                    //--Alert("IsNearing_EMA500_Close200: ",IsNearing_EMA500_Close200);
                    //--------------
                    return true;//
          };


};
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
