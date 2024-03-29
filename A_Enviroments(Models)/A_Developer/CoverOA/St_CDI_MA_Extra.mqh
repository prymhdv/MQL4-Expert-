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
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+

#define szima 16
struct Sg_Point_SR
{         bool IsBasic_Suppoertve ;
          bool IsBasic_Ressistancive; //
          bool IsComplex_CrossUp;
          bool IsComplex_CrossDown;//
};
enum E_State_To_Pick
{         E_Void_Pick, E_INCing_befor_Pick, E_INCed_befor_Pick_Crossed, E_INCed_after_Pick_Crossed, E_Decing_after_Pick };
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class St_CDI_MA_All2// : public St_CDI_Base
{
public:
          void       St_CDI_MA_All2() { }
          //-- St_MqlCondicator      MQL;
          bool          IsBasic_Bulish_MA__0_1,  IsBasic_Bulish_MA__0_3, IsBasic_Bulish_MA__0_10,   IsBasic_Bulish_MA__0_50,    IsBasic_Bulish_MA__0_100;
          double        Diff_Ask, Diff_Bid, Diff_Open ;
          bool          IsBasic_AboveAsk;
          //--------------------------------------------------
          //float        Price_Level_130p, Price_Level_130n;
          //float        Price_Level_210p, Price_Level_210n;
          //float        Price_Level_340p, Price_Level_340n;
          //float        Price_Level_550p, Price_Level_550n;
          //float        Price_Level_890p, Price_Level_890n;
          //--------------------------------------------------
          //---State

          E_State_To_Pick State_To_Pick_300p;
          E_State_To_Pick State_To_Pick_300n;
          E_State_To_Pick State_To_Pick_500p;
          E_State_To_Pick State_To_Pick_500n;
          E_State_To_Pick State_To_Pick_800p;
          E_State_To_Pick State_To_Pick_800n;
          E_State_To_Pick State_To_Pick_1300p;
          E_State_To_Pick State_To_Pick_1300n;
          E_State_To_Pick State_To_Pick_2100p;
          E_State_To_Pick State_To_Pick_2100n;

          void            Get_State_To_Pick(int pfar, double cr, int pnear, E_State_To_Pick &es, int idx)
          {         //
                    if          ( GetDiffState(  Close[pfar], cr, _iMa_[idx]._Value))  {es = E_INCing_befor_Pick;}
                    else if     (!GetDiffState(  Close[pfar], cr, _iMa_[idx]._Value))  {es = E_INCed_befor_Pick_Crossed;}
                    else if     ( GetDiffState( cr,  Close[pnear], _iMa_[idx]._Value)) {es = E_INCed_after_Pick_Crossed;}
                    else if     (!GetDiffState( cr,  Close[pnear], _iMa_[idx]._Value)) {es = E_Decing_after_Pick;}; //
          };
          bool GetDiffState(double x1, double x2, double c)
          {         double Diff_C_X1; Diff_C_X1 = MathAbs(c - x1);
                    double Diff_C_X2; Diff_C_X2 = MathAbs(c - x2);
                    return  Diff_C_X2 - Diff_C_X1 > 0;  //
          };
          //--------------------------------------------------
          Sg_Point_SR   Point_SR[szima];
          //--------------------------------------------------
          Et_IMA_NEAR   et_IMA_NEAR;
          //--------------------------------------------------
          St_iMA_B      _iMa_[szima]; // 5--not support 512 kb
          //---------------------------------------------------
          void       St_CDI_MA_All2(ENUM_MA_METHOD mode, ENUM_TIMEFRAMES tf, ENUM_APPLIED_PRICE Ap, int PeriodCount )
          {         CALC__iMAs2(_iMa_, mode, tf, PeriodCount, Ap);//  Alert("-core constractor-", _iMa_._Value);
          }
          //--------------------------------------------------
          //     if(ma_prev < ma_prevslow && ma_current >= ma_currentslow)Alert("crossing up");
          //--------------------------------------iMA(NULL, 0, 13, 8, MODE_EMA, PRICE_MEDIAN, 0);
          template<typename Typer>
          void CALC__iMAs2(Typer & typer[], ENUM_MA_METHOD mode,  ENUM_TIMEFRAMES tf, int ma_p, ENUM_APPLIED_PRICE Ap)
          {         //---[        ]
                    {         for(int i = 0; i < ArraySize(_iMa_); i++)
                              {         typer[i].symbol             = NULL ;
                                        typer[i].timeframe          = tf ;
                                        typer[i].ma_period          = ma_p ;
                                        typer[i].ma_shift_Line      = 0 ;
                                        typer[i].ma_method          = mode;//MODE_EMA
                                        typer[i].applied_price      = Ap ;
                                        typer[i].shift              = i ;
                                        //--off--  typer[i]._Value             = _iMA_B(typer); //
                                        typer[i]._Value             = (float)iMA(typer[i].symbol, typer[i].timeframe, typer[i].ma_period, typer[i].ma_shift_Line, typer[i].ma_method, typer[i].applied_price, typer[i].shift); NormalizeDouble(typer[i]._Value, _Digits);
                                        typer[i].SetLevels();
                                        //--off--MQL._iMA_B(typer); //
                                        // Alert("-core typer-", typer._Value);
                                        // typer._Price.Set_Price_Values(typer, i, f); //
                                        //-----------------------------------------
                                        Point_SR[i].IsBasic_Suppoertve            = Ask > typer[i]._Value;
                                        Point_SR[i].IsBasic_Ressistancive         = Bid < typer[i]._Value;
                                        Point_SR[i].IsComplex_CrossUp             = ( (i > 1) && Point_SR[i].IsBasic_Suppoertve           && Point_SR[i - 1].IsBasic_Ressistancive);
                                        Point_SR[i].IsComplex_CrossDown           = ( (i > 1) && Point_SR[i].IsBasic_Ressistancive        && Point_SR[i - 1].IsBasic_Suppoertve);
                                        //-----------------------------------------
                              }
                              //----------------------------------------
                              //--   Alert((string)ma_p, EnumToString(tf), "  Point_SR[i].IsBasic_Suppoertve: ", Point_SR[0].IsBasic_Suppoertve, "  Point_SR[i].IsBasic_Ressistancive: ", Point_SR[0].IsBasic_Ressistancive, "  Point_SR[i].IsComplex_CrossUp: ", Point_SR[0].IsComplex_CrossUp, "  Point_SR[i].IsComplex_CrossDown:", Point_SR[0].IsComplex_CrossDown); //
                              //----------------------------------------ref is active
                              IsBasic_Bulish_MA__0_1  = ( _iMa_[0]._Value > _iMa_[1]._Value); //
                              IsBasic_Bulish_MA__0_3  = ( _iMa_[0]._Value > _iMa_[3]._Value); //
                              IsBasic_Bulish_MA__0_10 = ( _iMa_[0]._Value > _iMa_[10]._Value); //
                              //  IsBasic_Bulish_MA__0_50 = ( _iMa_[0]._Value > _iMa_[50]._Value); //
                              //  IsBasic_Bulish_MA__0_100 = ( _iMa_[0]._Value > _iMa_[100]._Value); //
                              //-----------------------------------------
                              Diff_Ask  = _iMa_[0]._Value - Ask;
                              Diff_Bid  = _iMa_[0]._Value - Bid;
                              Diff_Open = _iMa_[0]._Value - iOpen(typer[0].symbol, typer[0].timeframe, 0);
                              //-----------------------------------------
                              IsBasic_AboveAsk = Diff_Ask > 0; //--when posetive
                              //-----------------------------------------
                              //Price_Level_130p = _iMa_[0]._Value + 130 * Point; Price_Level_130n = _iMa_[0]._Value - 130 * Point;
                              //Price_Level_210p = _iMa_[0]._Value + 210 * Point; Price_Level_210n = _iMa_[0]._Value - 210 * Point;
                              //Price_Level_340p = _iMa_[0]._Value + 340 * Point; Price_Level_340n = _iMa_[0]._Value - 340 * Point;
                              //Price_Level_550p = _iMa_[0]._Value + 550 * Point; Price_Level_550n = _iMa_[0]._Value - 550 * Point;
                              //Price_Level_890p = _iMa_[0]._Value + 890 * Point; Price_Level_890n = _iMa_[0]._Value - 890 * Point;
                              //----------------------------------------- (> cover ) not correct
                              if     (-10  * Point > Diff_Ask && -130 * Point < Diff_Ask)     { et_IMA_NEAR = Et_IMA_NEAR_0_130p; }
                              else if(+10  * Point < Diff_Ask && +130 * Point > Diff_Ask)     { et_IMA_NEAR = Et_IMA_NEAR_0_130n; }
                              else if(-130 * Point > Diff_Ask && -210 * Point < Diff_Ask)     { et_IMA_NEAR = Et_IMA_NEAR_130p_210p; }
                              else if(+130 * Point < Diff_Ask && +210 * Point > Diff_Ask)     { et_IMA_NEAR = Et_IMA_NEAR_130n_210n; }
                              else if(-210 * Point > Diff_Ask && -340 * Point < Diff_Ask)     { et_IMA_NEAR = Et_IMA_NEAR_210p_340p; }
                              else if(+210 * Point < Diff_Ask && +340 * Point > Diff_Ask)     { et_IMA_NEAR = Et_IMA_NEAR_210n_340n; }
                              else if(-340 * Point > Diff_Ask && -550 * Point < Diff_Ask)     { et_IMA_NEAR = Et_IMA_NEAR_340p_550p; }
                              else if(+340 * Point < Diff_Ask && +550 * Point > Diff_Ask)     { et_IMA_NEAR = Et_IMA_NEAR_340n_550n; }
                              else if(-550 * Point > Diff_Ask && -890 * Point < Diff_Ask)     { et_IMA_NEAR = Et_IMA_NEAR_550p_890p; }
                              else if(+550 * Point < Diff_Ask && +890 * Point > Diff_Ask)     { et_IMA_NEAR = Et_IMA_NEAR_550n_890n; }
                              //--- else if(-890 * Point > Diff_Ask && -1440 * Point < Diff_Ask)    { et_IMA_NEAR = Et_IMA_NEAR_1440p; }
                              //--- else if(+890 * Point < Diff_Ask && +1440 * Point > Diff_Ask)    { et_IMA_NEAR = Et_IMA_NEAR_1440n; }
                              else if(-890  * Point > Diff_Ask && -1300 * Point < Diff_Ask)     { et_IMA_NEAR = Et_IMA_NEAR_890p_1300p; }
                              else if(+890  * Point < Diff_Ask && +1300 * Point > Diff_Ask)     { et_IMA_NEAR = Et_IMA_NEAR_890n_1300n; }
                              else if(-1300 * Point > Diff_Ask && -2100 * Point < Diff_Ask)     { et_IMA_NEAR = Et_IMA_NEAR_1300p_2100p; }
                              else if(+1300 * Point < Diff_Ask && +2100 * Point > Diff_Ask)     { et_IMA_NEAR = Et_IMA_NEAR_1300n_2100n; }
                              else if(-2100 * Point > Diff_Ask && -3400 * Point < Diff_Ask)     { et_IMA_NEAR = Et_IMA_NEAR_2100p_3400p; }
                              else if(+2100 * Point < Diff_Ask && +3400 * Point > Diff_Ask)     { et_IMA_NEAR = Et_IMA_NEAR_2100n_3400n; }
                              else if(-3400 * Point > Diff_Ask && -5500 * Point < Diff_Ask)     { et_IMA_NEAR = Et_IMA_NEAR_3400p_5500p; }
                              else if(+3400 * Point < Diff_Ask && +5500 * Point > Diff_Ask)     { et_IMA_NEAR = Et_IMA_NEAR_3400n_5500n; }
                              else if(-5500 * Point > Diff_Ask && -8900 * Point < Diff_Ask)     { et_IMA_NEAR = Et_IMA_NEAR_5500p_8900p; }
                              else if(+5500 * Point < Diff_Ask && +8900 * Point > Diff_Ask)     { et_IMA_NEAR = Et_IMA_NEAR_5500n_8900n; }
                              //--- else if(-890 * Point > Diff_Ask && -1440 * Point < Diff_Ask)    { et_IMA_NEAR = Et_IMA_NEAR_1440p; }
                              //--- else if(+890 * Point < Diff_Ask && +1440 * Point > Diff_Ask)    { et_IMA_NEAR = Et_IMA_NEAR_1440n; }
                              else if(-8900  * Point > Diff_Ask && -13000 * Point < Diff_Ask)   { et_IMA_NEAR = Et_IMA_NEAR_8900p_13000p; }
                              else if(+8900  * Point < Diff_Ask && +13000 * Point > Diff_Ask)   { et_IMA_NEAR = Et_IMA_NEAR_8900n_13000n; }
                              else if(-13000 * Point > Diff_Ask && -21000 * Point < Diff_Ask)   { et_IMA_NEAR = Et_IMA_NEAR_13000p_21000p; }
                              else if(+13000 * Point < Diff_Ask && +21000 * Point > Diff_Ask)   { et_IMA_NEAR = Et_IMA_NEAR_13000n_21000n; }
                              else if(-21000 * Point > Diff_Ask && -34000 * Point < Diff_Ask)   { et_IMA_NEAR = Et_IMA_NEAR_21000p_34000p; }
                              else if(+21000 * Point < Diff_Ask && +34000 * Point > Diff_Ask)   { et_IMA_NEAR = Et_IMA_NEAR_21000n_34000n; }
                              else if(-34000 * Point > Diff_Ask && -55000 * Point < Diff_Ask)   { et_IMA_NEAR = Et_IMA_NEAR_34000p_55000p; }
                              else if(+34000 * Point < Diff_Ask && +55000 * Point > Diff_Ask)   { et_IMA_NEAR = Et_IMA_NEAR_34000n_55000n; }
                              else if(-55000 * Point > Diff_Ask && -89000 * Point < Diff_Ask)   { et_IMA_NEAR = Et_IMA_NEAR_55000p_89000p; }
                              else if(+55000 * Point < Diff_Ask && +89000 * Point > Diff_Ask)   { et_IMA_NEAR = Et_IMA_NEAR_55000n_89000n; }
                              else                                                              { et_IMA_NEAR = Et_IMA_NEAR_Void;  }
                              //-----------------------------------------
                    }//
                    Get_State_To_Pick(3,  _iMa_[2]._Value_Level_p300, 0, State_To_Pick_300p, 2); //
                    Get_State_To_Pick(3,  _iMa_[2]._Value_Level_n300, 0, State_To_Pick_300n, 2); //
                    Get_State_To_Pick(3,  _iMa_[2]._Value_Level_p500, 0, State_To_Pick_500p, 2); //
                    Get_State_To_Pick(3,  _iMa_[2]._Value_Level_n500, 0, State_To_Pick_500n, 2); //
                    Get_State_To_Pick(3,  _iMa_[2]._Value_Level_p800, 0, State_To_Pick_800p, 2); //
                    Get_State_To_Pick(3,  _iMa_[2]._Value_Level_n800, 0, State_To_Pick_800n, 2); //
                    Get_State_To_Pick(3,  _iMa_[2]._Value_Level_p1300, 0, State_To_Pick_1300p, 2); //
                    Get_State_To_Pick(3,  _iMa_[2]._Value_Level_n1300, 0, State_To_Pick_1300n, 2); //
                    Get_State_To_Pick(3,  _iMa_[2]._Value_Level_p2100, 0, State_To_Pick_2100p, 2); //
                    Get_State_To_Pick(3,  _iMa_[2]._Value_Level_n2100, 0, State_To_Pick_2100n, 2); //
          } //
          double _iMA_B(St_iMA_B &MA[]) { for(int i = 0; i < ArraySize(MA); i++)  { MA[i]._Value = (float)iMA(MA[i].symbol, MA[i].timeframe, MA[i].ma_period, MA[i].ma_shift_Line, MA[i].ma_method, MA[i].applied_price, MA[i].shift); NormalizeDouble(MA[i]._Value, _Digits);} return 1; }
          //====================================================================================
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
struct Ste_MA_Element
{         St_CDI_MA_All2                _x_, _y_;
          Sg_Point_SR                   Point_SR__X_v_Y_[szima];
          bool                          IsBasic_X_Above_Y;
          bool                          IsComplex_X_Y_Bulish;
          bool                          IsSuper_ON_Buy__OFF_Sell_X_Y;
          E_Market_Direction_ima        E_Market_Direction_ima_X_v_Y_;

          bool IsBasic_E_MD_ima_X_v_Y_E_Market_Void()                 {return E_Market_Direction_ima_X_v_Y_ == E_Market_Void; };
          bool IsBasic_E_MD_ima_X_v_Y_E_Market_Bulish_Expanding()     {return E_Market_Direction_ima_X_v_Y_ == E_Market_Bulish_Expanding; };
          bool IsBasic_E_MD_ima_X_v_Y_E_Market_Bulish_Nearing()       {return E_Market_Direction_ima_X_v_Y_ == E_Market_Bulish_Nearing; };
          bool IsBasic_E_MD_ima_X_v_Y_E_Market_Bearish_Expanding()    {return E_Market_Direction_ima_X_v_Y_ == E_Market_Bearish_Expanding; };
          bool IsBasic_E_MD_ima_X_v_Y_E_Market_Bearish_Nearing()      {return E_Market_Direction_ima_X_v_Y_ == E_Market_Bearish_Nearing; };//
          void Set()
          {         IsBasic_E_MD_ima_X_v_Y_E_Market_Void()                 ;//{return E_Market_Direction_ima_500_v_300_ == E_Market_Void; };
                    IsBasic_E_MD_ima_X_v_Y_E_Market_Bulish_Expanding()     ;//{return E_Market_Direction_ima_500_v_300_ == E_Market_Bulish_Expanding; };
                    IsBasic_E_MD_ima_X_v_Y_E_Market_Bulish_Nearing()       ;//{return E_Market_Direction_ima_500_v_300_ == E_Market_Bulish_Nearing; };
                    IsBasic_E_MD_ima_X_v_Y_E_Market_Bearish_Expanding()    ;//{return E_Market_Direction_ima_500_v_300_ == E_Market_Bearish_Expanding; };
                    IsBasic_E_MD_ima_X_v_Y_E_Market_Bearish_Nearing()      ;//{return E_Market_Direction_ima_500_v_300_ == E_Market_Bearish_Nearing; };//
          }
          double _X_v_Y_Range[szima];//
          bool   IsBasic_tExpanding_fNearing_X_v_Y_;//
          Ste_MA_Element() {};
          Ste_MA_Element(ENUM_MA_METHOD mode, ENUM_TIMEFRAMES tf, ENUM_APPLIED_PRICE ap, int x, int y )  //--ENUM_MA_METHOD mode, ENUM_TIMEFRAMES tf, ENUM_APPLIED_PRICE Ap
          {         St_CDI_MA_All2 _x( mode, tf, ap, x);  _x_      = _x;   //  Alert(" core constractor period ", _500_._iMa_._Value);
                    St_CDI_MA_All2 _y( mode, tf, ap, y);  _y_      = _y;//
          }


};

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class St_CDI_MA_All_PeriodCount
{
public:
          St_CDI_MA_All2       _500_, _300_, _200_,  _100_, _80_, _50_, _30_, _20_, _10_, _8_, _5_, _3_  ;      //--the size of local variables is too large (more than 512kb)      St_CDI_MA_All.mqh       373       11
          //Ste_MA_Element       _500_v_300_;
          //--------------------------------------------------------------
          Sg_Point_SR           Point_SR__500_v_300_[szima],
                                Point_SR__300_v_200_[szima],
                                Point_SR__200_v_100_[szima],
                                Point_SR__100_v_50_[szima],
                                Point_SR__50_v_30_[szima],
                                Point_SR__30_v_20_[szima],
                                Point_SR__20_v_10_[szima],
                                Point_SR__10_v_5_[szima],
                                Point_SR__5_v_3_[szima],
                                //
                                Point_SR__10_v_3_[szima],
                                Point_SR__20_v_5_[szima],
                                Point_SR__30_v_8_[szima];
          //--------------------------------------------------------------
          bool IsBasic_500_Above_300__Bearish,
               IsBasic_300_Above_200__Bearish,
               IsBasic_200_Above_100__Bearish,
               IsBasic_100_Above_50__Bearish,
               IsBasic_80_Above_50_Bearish,
               IsBasic_50_Above_30_Bearish,
               IsBasic_30_Above_20_Bearish,
               IsBasic_20_Above_10_Bearish,
               IsBasic_10_Above_5_Bearish,
               IsBasic_8_Above_5_Bearish,
               IsBasic_5_Above_3_Bearish;
          //
          bool IsBasic_8_Above_5_Bearish_Above_3;
          bool IsBasic_80_Above_50_Bearish_Above_30;
          bool IsBasic_50_Above_5__Bearish, IsBasic_30_Above_3__Bearish;;

          bool IsComplex_500_300_Bulish,
               IsComplex_300_200_Bulish,
               IsComplex_200_100_Bulish,
               IsComplex_100_50_Bulish,
               IsComplex_50_30_Bulish,
               IsComplex_30_20_Bulish,
               IsComplex_20_10_Bulish,
               IsComplex_10_5_Bulish,
               IsComplex_8_5_Bulish,
               IsComplex_5_3_Bulish;
          bool IsSuper_ON_Buy__OFF_Sell_500_300,
               IsSuper_ON_Buy__OFF_Sell_300_200,
               IsSuper_ON_Buy__OFF_Sell_200_100,
               IsSuper_ON_Buy__OFF_Sell_100_50,
               IsSuper_ON_Buy__OFF_Sell_50_30,
               IsSuper_ON_Buy__OFF_Sell_30_20,
               IsSuper_ON_Buy__OFF_Sell_20_10,
               IsSuper_ON_Buy__OFF_Sell_10_5,
               IsSuper_ON_Buy__OFF_Sell_5_3;
          //--------------------------------------------------------------
          E_Market_Direction_ima  E_Market_Direction_ima_500_v_300_,
                                  E_Market_Direction_ima_300_v_200_,
                                  E_Market_Direction_ima_200_v_100_,
                                  E_Market_Direction_ima_100_v_50_,
                                  E_Market_Direction_ima_50_v_30_,
                                  E_Market_Direction_ima_30_v_20_,
                                  E_Market_Direction_ima_20_v_10_,
                                  E_Market_Direction_ima_10_v_5_,
                                  E_Market_Direction_ima_8_v_5_,
                                  E_Market_Direction_ima_5_v_3_,
                                  E_Market_Direction_ima_10_v_3_,
                                  //---
                                  E_Market_Direction_ima_20_v_5_,
                                  E_Market_Direction_ima_30_v_8_
                                  ;
          bool IsBasic_E_MD_ima_500_v_300_E_Market_Void()                 {return E_Market_Direction_ima_500_v_300_ == E_Market_Void; };
          bool IsBasic_E_MD_ima_500_v_300_E_Market_Bulish_Expanding()     {return E_Market_Direction_ima_500_v_300_ == E_Market_Bulish_Expanding; };
          bool IsBasic_E_MD_ima_500_v_300_E_Market_Bulish_Nearing()       {return E_Market_Direction_ima_500_v_300_ == E_Market_Bulish_Nearing; };
          bool IsBasic_E_MD_ima_500_v_300_E_Market_Bearish_Expanding()    {return E_Market_Direction_ima_500_v_300_ == E_Market_Bearish_Expanding; };
          bool IsBasic_E_MD_ima_500_v_300_E_Market_Bearish_Nearing()      {return E_Market_Direction_ima_500_v_300_ == E_Market_Bearish_Nearing; };
          //---
          bool IsBasic_E_MD_ima_300_v_200_E_Market_Void()                 {return E_Market_Direction_ima_300_v_200_ == E_Market_Void; };
          bool IsBasic_E_MD_ima_300_v_200_E_Market_Bulish_Expanding()     {return E_Market_Direction_ima_300_v_200_ == E_Market_Bulish_Expanding; };
          bool IsBasic_E_MD_ima_300_v_200_E_Market_Bulish_Nearing()       {return E_Market_Direction_ima_300_v_200_ == E_Market_Bulish_Nearing; };
          bool IsBasic_E_MD_ima_300_v_200_E_Market_Bearish_Expanding()    {return E_Market_Direction_ima_300_v_200_ == E_Market_Bearish_Expanding; };
          bool IsBasic_E_MD_ima_300_v_200_E_Market_Bearish_Nearing()      {return E_Market_Direction_ima_300_v_200_ == E_Market_Bearish_Nearing; };
          //---
          bool IsBasic_E_MD_ima_200_v_100_E_Market_Void()                 {return E_Market_Direction_ima_200_v_100_ == E_Market_Void; };
          bool IsBasic_E_MD_ima_200_v_100_E_Market_Bulish_Expanding()     {return E_Market_Direction_ima_200_v_100_ == E_Market_Bulish_Expanding; };
          bool IsBasic_E_MD_ima_200_v_100_E_Market_Bulish_Nearing()       {return E_Market_Direction_ima_200_v_100_ == E_Market_Bulish_Nearing; };
          bool IsBasic_E_MD_ima_200_v_100_E_Market_Bearish_Expanding()    {return E_Market_Direction_ima_200_v_100_ == E_Market_Bearish_Expanding; };
          bool IsBasic_E_MD_ima_200_v_100_E_Market_Bearish_Nearing()      {return E_Market_Direction_ima_200_v_100_ == E_Market_Bearish_Nearing; };
          //---
          bool IsBasic_E_MD_ima_100_v_50_E_Market_Void()                 {return E_Market_Direction_ima_100_v_50_ == E_Market_Void; };
          bool IsBasic_E_MD_ima_100_v_50_E_Market_Bulish_Expanding()     {return E_Market_Direction_ima_100_v_50_ == E_Market_Bulish_Expanding; };
          bool IsBasic_E_MD_ima_100_v_50_E_Market_Bulish_Nearing()       {return E_Market_Direction_ima_100_v_50_ == E_Market_Bulish_Nearing; };
          bool IsBasic_E_MD_ima_100_v_50_E_Market_Bearish_Expanding()    {return E_Market_Direction_ima_100_v_50_ == E_Market_Bearish_Expanding; };
          bool IsBasic_E_MD_ima_100_v_50_E_Market_Bearish_Nearing()      {return E_Market_Direction_ima_100_v_50_ == E_Market_Bearish_Nearing; };
          //---
          bool IsBasic_E_MD_ima_50_v_30_E_Market_Void()                 {return E_Market_Direction_ima_50_v_30_ == E_Market_Void; };
          bool IsBasic_E_MD_ima_50_v_30_E_Market_Bulish_Expanding()     {return E_Market_Direction_ima_50_v_30_ == E_Market_Bulish_Expanding; };
          bool IsBasic_E_MD_ima_50_v_30_E_Market_Bulish_Nearing()       {return E_Market_Direction_ima_50_v_30_ == E_Market_Bulish_Nearing; };
          bool IsBasic_E_MD_ima_50_v_30_E_Market_Bearish_Expanding()    {return E_Market_Direction_ima_50_v_30_ == E_Market_Bearish_Expanding; };
          bool IsBasic_E_MD_ima_50_v_30_E_Market_Bearish_Nearing()      {return E_Market_Direction_ima_50_v_30_ == E_Market_Bearish_Nearing; };
          //---
          bool IsBasic_E_MD_ima_30_v_20_E_Market_Void()                 {return E_Market_Direction_ima_30_v_20_ == E_Market_Void; };
          bool IsBasic_E_MD_ima_30_v_20_E_Market_Bulish_Expanding()     {return E_Market_Direction_ima_30_v_20_ == E_Market_Bulish_Expanding; };
          bool IsBasic_E_MD_ima_30_v_20_E_Market_Bulish_Nearing()       {return E_Market_Direction_ima_30_v_20_ == E_Market_Bulish_Nearing; };
          bool IsBasic_E_MD_ima_30_v_20_E_Market_Bearish_Expanding()    {return E_Market_Direction_ima_30_v_20_ == E_Market_Bearish_Expanding; };
          bool IsBasic_E_MD_ima_30_v_20_E_Market_Bearish_Nearing()      {return E_Market_Direction_ima_30_v_20_ == E_Market_Bearish_Nearing; };
          //---
          bool IsBasic_E_MD_ima_20_v_10_E_Market_Void()                 {return E_Market_Direction_ima_20_v_10_ == E_Market_Void; };
          bool IsBasic_E_MD_ima_20_v_10_E_Market_Bulish_Expanding()     {return E_Market_Direction_ima_20_v_10_ == E_Market_Bulish_Expanding; };
          bool IsBasic_E_MD_ima_20_v_10_E_Market_Bulish_Nearing()       {return E_Market_Direction_ima_20_v_10_ == E_Market_Bulish_Nearing; };
          bool IsBasic_E_MD_ima_20_v_10_E_Market_Bearish_Expanding()    {return E_Market_Direction_ima_20_v_10_ == E_Market_Bearish_Expanding; };
          bool IsBasic_E_MD_ima_20_v_10_E_Market_Bearish_Nearing()      {return E_Market_Direction_ima_20_v_10_ == E_Market_Bearish_Nearing; };
          //---
          bool IsBasic_E_MD_ima_10_v_5_E_Market_Void()                 {return E_Market_Direction_ima_10_v_5_ == E_Market_Void; };
          bool IsBasic_E_MD_ima_10_v_5_E_Market_Bulish_Expanding()     {return E_Market_Direction_ima_10_v_5_ == E_Market_Bulish_Expanding; };
          bool IsBasic_E_MD_ima_10_v_5_E_Market_Bulish_Nearing()       {return E_Market_Direction_ima_10_v_5_ == E_Market_Bulish_Nearing; };
          bool IsBasic_E_MD_ima_10_v_5_E_Market_Bearish_Expanding()    {return E_Market_Direction_ima_10_v_5_ == E_Market_Bearish_Expanding; };
          bool IsBasic_E_MD_ima_10_v_5_E_Market_Bearish_Nearing()      {return E_Market_Direction_ima_10_v_5_ == E_Market_Bearish_Nearing; };
          //---
          bool IsBasic_E_MD_ima_8_v_5_E_Market_Void()                 {return E_Market_Direction_ima_8_v_5_ == E_Market_Void; };
          bool IsBasic_E_MD_ima_8_v_5_E_Market_Bulish_Expanding()     {return E_Market_Direction_ima_8_v_5_ == E_Market_Bulish_Expanding; };
          bool IsBasic_E_MD_ima_8_v_5_E_Market_Bulish_Nearing()       {return E_Market_Direction_ima_8_v_5_ == E_Market_Bulish_Nearing; };
          bool IsBasic_E_MD_ima_8_v_5_E_Market_Bearish_Expanding()    {return E_Market_Direction_ima_8_v_5_ == E_Market_Bearish_Expanding; };
          bool IsBasic_E_MD_ima_8_v_5_E_Market_Bearish_Nearing()      {return E_Market_Direction_ima_8_v_5_ == E_Market_Bearish_Nearing; };
          //---
          bool IsBasic_E_MD_ima_5_v_3_E_Market_Void()                 {return E_Market_Direction_ima_5_v_3_ == E_Market_Void; };
          bool IsBasic_E_MD_ima_5_v_3_E_Market_Bulish_Expanding()     {return E_Market_Direction_ima_5_v_3_ == E_Market_Bulish_Expanding; };
          bool IsBasic_E_MD_ima_5_v_3_E_Market_Bulish_Nearing()       {return E_Market_Direction_ima_5_v_3_ == E_Market_Bulish_Nearing; };
          bool IsBasic_E_MD_ima_5_v_3_E_Market_Bearish_Expanding()    {return E_Market_Direction_ima_5_v_3_ == E_Market_Bearish_Expanding; };
          bool IsBasic_E_MD_ima_5_v_3_E_Market_Bearish_Nearing()      {return E_Market_Direction_ima_5_v_3_ == E_Market_Bearish_Nearing; };
          //---
          bool IsBasic_E_MD_ima_10_v_3_E_Market_Void()                 {return E_Market_Direction_ima_10_v_3_ == E_Market_Void; };
          bool IsBasic_E_MD_ima_10_v_3_E_Market_Bulish_Expanding()     {return E_Market_Direction_ima_10_v_3_ == E_Market_Bulish_Expanding; };
          bool IsBasic_E_MD_ima_10_v_3_E_Market_Bulish_Nearing()       {return E_Market_Direction_ima_10_v_3_ == E_Market_Bulish_Nearing; };
          bool IsBasic_E_MD_ima_10_v_3_E_Market_Bearish_Expanding()    {return E_Market_Direction_ima_10_v_3_ == E_Market_Bearish_Expanding; };
          bool IsBasic_E_MD_ima_10_v_3_E_Market_Bearish_Nearing()      {return E_Market_Direction_ima_10_v_3_ == E_Market_Bearish_Nearing; };
          //---
          //---
          bool IsBasic_E_MD_ima_20_v_5_E_Market_Void()                 {return E_Market_Direction_ima_20_v_5_ == E_Market_Void; };
          bool IsBasic_E_MD_ima_20_v_5_E_Market_Bulish_Expanding()     {return E_Market_Direction_ima_20_v_5_ == E_Market_Bulish_Expanding; };
          bool IsBasic_E_MD_ima_20_v_5_E_Market_Bulish_Nearing()       {return E_Market_Direction_ima_20_v_5_ == E_Market_Bulish_Nearing; };
          bool IsBasic_E_MD_ima_20_v_5_E_Market_Bearish_Expanding()    {return E_Market_Direction_ima_20_v_5_ == E_Market_Bearish_Expanding; };
          bool IsBasic_E_MD_ima_20_v_5_E_Market_Bearish_Nearing()      {return E_Market_Direction_ima_20_v_5_ == E_Market_Bearish_Nearing; };
          //---
          bool IsBasic_E_MD_ima_30_v_8_E_Market_Void()                 {return E_Market_Direction_ima_30_v_8_ == E_Market_Void; };
          bool IsBasic_E_MD_ima_30_v_8_E_Market_Bulish_Expanding()     {return E_Market_Direction_ima_30_v_8_ == E_Market_Bulish_Expanding; };
          bool IsBasic_E_MD_ima_30_v_8_E_Market_Bulish_Nearing()       {return E_Market_Direction_ima_30_v_8_ == E_Market_Bulish_Nearing; };
          bool IsBasic_E_MD_ima_30_v_8_E_Market_Bearish_Expanding()    {return E_Market_Direction_ima_30_v_8_ == E_Market_Bearish_Expanding; };
          bool IsBasic_E_MD_ima_30_v_8_E_Market_Bearish_Nearing()      {return E_Market_Direction_ima_30_v_8_ == E_Market_Bearish_Nearing; };


          //bool IsBasic_E_MD_ima_X_v_X_E_Market_(int id, E_Market_Direction_ima Enuma)
          //{         switch(Enuma)
          //          {         case  E_Market_Void:              {if(Enuma == E_Market_Void)return true; else return false; }                break;
          //                    case  E_Market_Bulish_Expanding:  {Enuma == E_Market_Bulish_Expanding}    break;
          //                    case  E_Market_Bulish_Nearing:    {Enuma == E_Market_Bulish_Nearing}      break;
          //                    case  E_Market_Bearish_Expanding: {Enuma == E_Market_Bearish_Expanding}   break;
          //                    case  E_Market_Bearish_Nearing:   {Enuma == E_Market_Bearish_Nearing}     break;
          //                    default:                                                                           break; //
          //          }//
          //}
          //--------------------------------------------------------------
          //bool IsBasic_Signal_Buy_3__20_, IsBasic_Signal_Sell_3__20_; Point_SR__500_v_300_.IsComplex_CrossUp_ (fast cross down and slow cross up)
          //bool IsBasic_Signal_Buy_3__20_, IsBasic_Signal_Sell_3__20_;
          //bool IsBasic_Signal_Buy_3__20_, IsBasic_Signal_Sell_3__20_;
          //bool IsBasic_Signal_Buy_3__20_, IsBasic_Signal_Sell_3__20_;
          //bool IsBasic_Signal_Buy_3__20_, IsBasic_Signal_Sell_3__20_;
          //bool IsBasic_Signal_Buy_3__20_, IsBasic_Signal_Sell_3__20_;
          //bool IsBasic_Signal_Buy_3__20_, IsBasic_Signal_Sell_3__20_;
          //bool IsBasic_Signal_Buy_3__20_, IsBasic_Signal_Sell_3__20_;
          //bool IsBasic_Signal_Buy_500__20_, IsBasic_Signal_Sell_500__20_;
          //--------------------------------------------------------------
          double _500_v_300_Range[szima],
                 _300_v_200_Range[szima],
                 _200_v_100_Range[szima],
                 _100_v_50_Range[szima],
                 _50_v_30_Range[szima],
                 _30_v_20_Range[szima],
                 _20_v_10_Range[szima],
                 _10_v_5_Range[szima],
                 _5_v_3_Range[szima],
                 //
                 _10_v_3_Range[szima],
                 _20_v_5_Range[szima],
                 _30_v_8_Range[szima];

          bool   IsBasic_tExpanding_fNearing_500_v_300_,
                 IsBasic_tExpanding_fNearing_300_v_200_,
                 IsBasic_tExpanding_fNearing_200_v_100_,
                 IsBasic_tExpanding_fNearing_100_v_50_,
                 IsBasic_tExpanding_fNearing_50_v_30_,
                 IsBasic_tExpanding_fNearing_30_v_20_,
                 IsBasic_tExpanding_fNearing_20_v_10_,
                 IsBasic_tExpanding_fNearing_10_v_5_,

                 IsBasic_tExpanding_fNearing_5_v_3_,
                 IsBasic_tExpanding_fNearing_10_v_3_,
                 //

                 IsBasic_tExpanding_fNearing_20_v_5_,
                 IsBasic_tExpanding_fNearing_30_v_8_;
          ;
          //--------------------------------------------------------------
          St_CDI_MA_All_PeriodCount(ENUM_MA_METHOD mode, ENUM_TIMEFRAMES tf, ENUM_APPLIED_PRICE ap )  //--ENUM_MA_METHOD mode, ENUM_TIMEFRAMES tf, ENUM_APPLIED_PRICE Ap
          {         St_CDI_MA_All2 _500( mode, tf, ap, 500);  _500_      = _500;   //  Alert(" core constractor period ", _500_._iMa_._Value);
                    St_CDI_MA_All2 _300( mode, tf, ap, 300);  _300_      = _300;
                    St_CDI_MA_All2 _200( mode, tf, ap, 200);  _200_      = _200;
                    St_CDI_MA_All2 _100( mode, tf, ap, 100);  _100_      = _100;
                    St_CDI_MA_All2 _80(  mode, tf, ap, 80);   _80_       = _80;
                    St_CDI_MA_All2 _50(  mode, tf, ap, 50);   _50_       = _50;
                    St_CDI_MA_All2 _30(  mode, tf, ap, 30);   _30_       = _30;
                    St_CDI_MA_All2 _20(  mode, tf, ap, 20);   _20_       = _20;
                    St_CDI_MA_All2 _10(  mode, tf, ap, 10);   _10_       = _10;
                    St_CDI_MA_All2 _8(   mode, tf, ap, 8);    _8_        = _8;
                    St_CDI_MA_All2 _5(   mode, tf, ap, 5);    _5_        = _5;
                    St_CDI_MA_All2 _3(   mode, tf, ap, 3);    _3_        = _3;
                    //----------------------------------------------------------
                    //Ste_MA_Element _500_v_300(mode, tf, ap, 500, 300 );       _500_v_300_ = _500_v_300;;
                    //----------------------------------------------------------
                    {         //-----------------
                              IsBasic_500_Above_300__Bearish    = _500_._iMa_[0]._Value > _300_._iMa_[0]._Value ;
                              IsBasic_300_Above_200__Bearish    = _300_._iMa_[0]._Value > _200_._iMa_[0]._Value ;
                              IsBasic_200_Above_100__Bearish    = _200_._iMa_[0]._Value > _100_._iMa_[0]._Value ;
                              IsBasic_100_Above_50__Bearish     = _100_._iMa_[0]._Value > _50_._iMa_[0]._Value ;
                              IsBasic_80_Above_50_Bearish      = _80_._iMa_[0]._Value  > _50_._iMa_[0]._Value ;
                              IsBasic_50_Above_30_Bearish      = _50_._iMa_[0]._Value  > _30_._iMa_[0]._Value ;
                              IsBasic_30_Above_20_Bearish      = _30_._iMa_[0]._Value  > _20_._iMa_[0]._Value ;
                              IsBasic_20_Above_10_Bearish      = _20_._iMa_[0]._Value  > _10_._iMa_[0]._Value ;
                              IsBasic_8_Above_5_Bearish        = _8_._iMa_[0]._Value   > _5_._iMa_[0]._Value ;
                              IsBasic_10_Above_5_Bearish       = _10_._iMa_[0]._Value  > _5_._iMa_[0]._Value ;
                              IsBasic_5_Above_3_Bearish        = _5_._iMa_[0]._Value   > _3_._iMa_[0]._Value ;
                              //-----------------
                              IsBasic_8_Above_5_Bearish_Above_3    = IsBasic_5_Above_3_Bearish && IsBasic_8_Above_5_Bearish;
                              IsBasic_80_Above_50_Bearish_Above_30 = IsBasic_80_Above_50_Bearish && IsBasic_50_Above_30_Bearish;
                              //-----------------
                              IsBasic_50_Above_5__Bearish       = _50_._iMa_[0]._Value  > _5_._iMa_[0]._Value ;//--mean Sell  BearishTrend
                              IsBasic_30_Above_3__Bearish       = _30_._iMa_[0]._Value  > _3_._iMa_[0]._Value ;//--mean Sell  BearishTrend
                              //-----------------
                              IsComplex_500_300_Bulish    = _500_.IsBasic_Bulish_MA__0_3 && _300_.IsBasic_Bulish_MA__0_3;
                              IsComplex_300_200_Bulish    = _300_.IsBasic_Bulish_MA__0_3 && _200_.IsBasic_Bulish_MA__0_3;;
                              IsComplex_200_100_Bulish    = _200_.IsBasic_Bulish_MA__0_3 && _100_.IsBasic_Bulish_MA__0_3;;
                              IsComplex_100_50_Bulish     = _100_.IsBasic_Bulish_MA__0_3 && _50_.IsBasic_Bulish_MA__0_3;;
                              IsComplex_50_30_Bulish      = _50_.IsBasic_Bulish_MA__0_3  && _30_.IsBasic_Bulish_MA__0_3;;
                              IsComplex_30_20_Bulish      = _30_.IsBasic_Bulish_MA__0_3  && _20_.IsBasic_Bulish_MA__0_3;;
                              IsComplex_20_10_Bulish      = _20_.IsBasic_Bulish_MA__0_3  && _10_.IsBasic_Bulish_MA__0_3;;
                              IsComplex_10_5_Bulish       = _10_.IsBasic_Bulish_MA__0_3  && _5_.IsBasic_Bulish_MA__0_3;;
                              IsComplex_8_5_Bulish        = _8_.IsBasic_Bulish_MA__0_3   && _5_.IsBasic_Bulish_MA__0_3;;
                              IsComplex_5_3_Bulish        = _5_.IsBasic_Bulish_MA__0_3   && _3_.IsBasic_Bulish_MA__0_3;;
                              //-----------------
                              IsSuper_ON_Buy__OFF_Sell_500_300  = !IsBasic_500_Above_300__Bearish && IsComplex_500_300_Bulish;
                              IsSuper_ON_Buy__OFF_Sell_300_200  = !IsBasic_300_Above_200__Bearish && IsComplex_300_200_Bulish;
                              IsSuper_ON_Buy__OFF_Sell_200_100  = !IsBasic_200_Above_100__Bearish && IsComplex_200_100_Bulish;
                              IsSuper_ON_Buy__OFF_Sell_100_50   = !IsBasic_100_Above_50__Bearish  && IsComplex_100_50_Bulish;
                              IsSuper_ON_Buy__OFF_Sell_50_30    = !IsBasic_50_Above_30_Bearish   && IsComplex_50_30_Bulish;
                              IsSuper_ON_Buy__OFF_Sell_30_20    = !IsBasic_30_Above_20_Bearish   && IsComplex_30_20_Bulish;
                              IsSuper_ON_Buy__OFF_Sell_20_10    = !IsBasic_20_Above_10_Bearish   && IsComplex_20_10_Bulish;
                              IsSuper_ON_Buy__OFF_Sell_10_5     = !IsBasic_10_Above_5_Bearish    && IsComplex_10_5_Bulish;
                              IsSuper_ON_Buy__OFF_Sell_5_3      = !IsBasic_5_Above_3_Bearish     && IsComplex_5_3_Bulish;
                              //-----------------
                    }//
                    {         //-----------------------------------------
                              for(int i = 0; i < ArraySize(_500_._iMa_); i++)
                              {         Point_SR__500_v_300_[i].IsBasic_Suppoertve            = _300_._iMa_[i]._Value > _500_._iMa_[i]._Value;
                                        Point_SR__500_v_300_[i].IsBasic_Ressistancive         = _300_._iMa_[i]._Value < _500_._iMa_[i]._Value;
                                        Point_SR__500_v_300_[i].IsComplex_CrossUp             = ( (i > 1) && Point_SR__500_v_300_[i].IsBasic_Suppoertve           && Point_SR__500_v_300_[i - 1].IsBasic_Ressistancive);
                                        Point_SR__500_v_300_[i].IsComplex_CrossDown           = ( (i > 1) && Point_SR__500_v_300_[i].IsBasic_Ressistancive        && Point_SR__500_v_300_[i - 1].IsBasic_Suppoertve);///
                                        //------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                        Point_SR__300_v_200_[i].IsBasic_Suppoertve            = _200_._iMa_[i]._Value > _300_._iMa_[i]._Value;
                                        Point_SR__300_v_200_[i].IsBasic_Ressistancive         = _200_._iMa_[i]._Value < _300_._iMa_[i]._Value;
                                        Point_SR__300_v_200_[i].IsComplex_CrossUp             = ( (i > 1) && Point_SR__300_v_200_[i].IsBasic_Suppoertve           && Point_SR__300_v_200_[i - 1].IsBasic_Ressistancive);
                                        Point_SR__300_v_200_[i].IsComplex_CrossDown           = ( (i > 1) && Point_SR__300_v_200_[i].IsBasic_Ressistancive        && Point_SR__300_v_200_[i - 1].IsBasic_Suppoertve);///
                                        //------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                        Point_SR__200_v_100_[i].IsBasic_Suppoertve            = _100_._iMa_[i]._Value > _200_._iMa_[i]._Value;
                                        Point_SR__200_v_100_[i].IsBasic_Ressistancive         = _100_._iMa_[i]._Value < _200_._iMa_[i]._Value;
                                        Point_SR__200_v_100_[i].IsComplex_CrossUp             = ( (i > 1) && Point_SR__200_v_100_[i].IsBasic_Suppoertve           && Point_SR__200_v_100_[i - 1].IsBasic_Ressistancive);
                                        Point_SR__200_v_100_[i].IsComplex_CrossDown           = ( (i > 1) && Point_SR__200_v_100_[i].IsBasic_Ressistancive        && Point_SR__200_v_100_[i - 1].IsBasic_Suppoertve);///
                                        //------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                        Point_SR__100_v_50_[i].IsBasic_Suppoertve            = _50_._iMa_[i]._Value > _100_._iMa_[i]._Value;
                                        Point_SR__100_v_50_[i].IsBasic_Ressistancive         = _50_._iMa_[i]._Value < _100_._iMa_[i]._Value;
                                        Point_SR__100_v_50_[i].IsComplex_CrossUp             = ( (i > 1) && Point_SR__100_v_50_[i].IsBasic_Suppoertve           && Point_SR__100_v_50_[i - 1].IsBasic_Ressistancive);
                                        Point_SR__100_v_50_[i].IsComplex_CrossDown           = ( (i > 1) && Point_SR__100_v_50_[i].IsBasic_Ressistancive        && Point_SR__100_v_50_[i - 1].IsBasic_Suppoertve);///
                                        //------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                        Point_SR__50_v_30_[i].IsBasic_Suppoertve            = _30_._iMa_[i]._Value > _50_._iMa_[i]._Value;
                                        Point_SR__50_v_30_[i].IsBasic_Ressistancive         = _30_._iMa_[i]._Value < _50_._iMa_[i]._Value;
                                        Point_SR__50_v_30_[i].IsComplex_CrossUp             = ( (i > 1) && Point_SR__50_v_30_[i].IsBasic_Suppoertve           && Point_SR__50_v_30_[i - 1].IsBasic_Ressistancive);
                                        Point_SR__50_v_30_[i].IsComplex_CrossDown           = ( (i > 1) && Point_SR__50_v_30_[i].IsBasic_Ressistancive        && Point_SR__50_v_30_[i - 1].IsBasic_Suppoertve);///
                                        //------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                        Point_SR__30_v_20_[i].IsBasic_Suppoertve            = _20_._iMa_[i]._Value > _30_._iMa_[i]._Value;
                                        Point_SR__30_v_20_[i].IsBasic_Ressistancive         = _20_._iMa_[i]._Value < _30_._iMa_[i]._Value;
                                        Point_SR__30_v_20_[i].IsComplex_CrossUp             = ( (i > 1) && Point_SR__30_v_20_[i].IsBasic_Suppoertve           && Point_SR__30_v_20_[i - 1].IsBasic_Ressistancive);
                                        Point_SR__30_v_20_[i].IsComplex_CrossDown           = ( (i > 1) && Point_SR__30_v_20_[i].IsBasic_Ressistancive        && Point_SR__30_v_20_[i - 1].IsBasic_Suppoertve);///
                                        //------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                        Point_SR__20_v_10_[i].IsBasic_Suppoertve            = _10_._iMa_[i]._Value > _20_._iMa_[i]._Value;
                                        Point_SR__20_v_10_[i].IsBasic_Ressistancive         = _10_._iMa_[i]._Value < _20_._iMa_[i]._Value;
                                        Point_SR__20_v_10_[i].IsComplex_CrossUp             = ( (i > 1) && Point_SR__20_v_10_[i].IsBasic_Suppoertve           && Point_SR__20_v_10_[i - 1].IsBasic_Ressistancive);
                                        Point_SR__20_v_10_[i].IsComplex_CrossDown           = ( (i > 1) && Point_SR__20_v_10_[i].IsBasic_Ressistancive        && Point_SR__20_v_10_[i - 1].IsBasic_Suppoertve);///
                                        //------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                        Point_SR__10_v_5_[i].IsBasic_Suppoertve            = _5_._iMa_[i]._Value > _10_._iMa_[i]._Value;
                                        Point_SR__10_v_5_[i].IsBasic_Ressistancive         = _5_._iMa_[i]._Value < _10_._iMa_[i]._Value;
                                        Point_SR__10_v_5_[i].IsComplex_CrossUp             = ( (i > 1) && Point_SR__10_v_5_[i].IsBasic_Suppoertve           && Point_SR__10_v_5_[i - 1].IsBasic_Ressistancive);
                                        Point_SR__10_v_5_[i].IsComplex_CrossDown           = ( (i > 1) && Point_SR__10_v_5_[i].IsBasic_Ressistancive        && Point_SR__10_v_5_[i - 1].IsBasic_Suppoertve);///
                                        //------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                        Point_SR__5_v_3_[i].IsBasic_Suppoertve            = _3_._iMa_[i]._Value > _5_._iMa_[i]._Value;
                                        Point_SR__5_v_3_[i].IsBasic_Ressistancive         = _3_._iMa_[i]._Value < _5_._iMa_[i]._Value;
                                        Point_SR__5_v_3_[i].IsComplex_CrossUp             = ( (i > 1) && Point_SR__5_v_3_[i].IsBasic_Suppoertve           && Point_SR__5_v_3_[i - 1].IsBasic_Ressistancive);
                                        Point_SR__5_v_3_[i].IsComplex_CrossDown           = ( (i > 1) && Point_SR__5_v_3_[i].IsBasic_Ressistancive        && Point_SR__5_v_3_[i - 1].IsBasic_Suppoertve);///
                                        //------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                        Point_SR__10_v_3_[i].IsBasic_Suppoertve            = _3_._iMa_[i]._Value > _10_._iMa_[i]._Value;
                                        Point_SR__10_v_3_[i].IsBasic_Ressistancive         = _3_._iMa_[i]._Value < _10_._iMa_[i]._Value;
                                        Point_SR__10_v_3_[i].IsComplex_CrossUp             = ( (i > 1) && Point_SR__10_v_3_[i].IsBasic_Suppoertve           && Point_SR__10_v_3_[i - 1].IsBasic_Ressistancive);
                                        Point_SR__10_v_3_[i].IsComplex_CrossDown           = ( (i > 1) && Point_SR__10_v_3_[i].IsBasic_Ressistancive        && Point_SR__10_v_3_[i - 1].IsBasic_Suppoertve);///
                                        //------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                        Point_SR__20_v_5_[i].IsBasic_Suppoertve            = _5_._iMa_[i]._Value > _20_._iMa_[i]._Value;
                                        Point_SR__20_v_5_[i].IsBasic_Ressistancive         = _5_._iMa_[i]._Value < _20_._iMa_[i]._Value;
                                        Point_SR__20_v_5_[i].IsComplex_CrossUp             = ( (i > 1) && Point_SR__20_v_5_[i].IsBasic_Suppoertve           && Point_SR__20_v_5_[i - 1].IsBasic_Ressistancive);
                                        Point_SR__20_v_5_[i].IsComplex_CrossDown           = ( (i > 1) && Point_SR__20_v_5_[i].IsBasic_Ressistancive        && Point_SR__20_v_5_[i - 1].IsBasic_Suppoertve);///
                                        //------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                        Point_SR__30_v_8_[i].IsBasic_Suppoertve            = _8_._iMa_[i]._Value > _30_._iMa_[i]._Value;
                                        Point_SR__30_v_8_[i].IsBasic_Ressistancive         = _8_._iMa_[i]._Value < _30_._iMa_[i]._Value;
                                        Point_SR__30_v_8_[i].IsComplex_CrossUp             = ( (i > 1) && Point_SR__30_v_8_[i].IsBasic_Suppoertve           && Point_SR__30_v_8_[i - 1].IsBasic_Ressistancive);
                                        Point_SR__30_v_8_[i].IsComplex_CrossDown           = ( (i > 1) && Point_SR__30_v_8_[i].IsBasic_Ressistancive        && Point_SR__30_v_8_[i - 1].IsBasic_Suppoertve);///
                                        //------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                        _500_v_300_Range[i]     = MathAbs(_300_._iMa_[i]._Value - _500_._iMa_[i]._Value);
                                        _300_v_200_Range[i]     = MathAbs(_200_._iMa_[i]._Value - _300_._iMa_[i]._Value);;
                                        _200_v_100_Range[i]     = MathAbs(_100_._iMa_[i]._Value - _200_._iMa_[i]._Value);;
                                        _100_v_50_Range[i]      = MathAbs(_50_._iMa_[i]._Value  - _100_._iMa_[i]._Value);;
                                        _50_v_30_Range[i]       = MathAbs(_30_._iMa_[i]._Value - _50_._iMa_[i]._Value);;
                                        _30_v_20_Range[i]       = MathAbs(_20_._iMa_[i]._Value - _30_._iMa_[i]._Value);;
                                        _20_v_10_Range[i]       = MathAbs(_10_._iMa_[i]._Value - _20_._iMa_[i]._Value);;
                                        _10_v_5_Range[i]        = MathAbs(_10_._iMa_[i]._Value - _5_._iMa_[i]._Value);;
                                        _5_v_3_Range[i]         = MathAbs(_5_._iMa_[i]._Value - _3_._iMa_[i]._Value);;
                                        //
                                        _10_v_3_Range[i]        = MathAbs(_10_._iMa_[i]._Value - _3_._iMa_[i]._Value);;
                                        _20_v_5_Range[i]        = MathAbs(_20_._iMa_[i]._Value - _5_._iMa_[i]._Value);;
                                        _30_v_8_Range[i]        = MathAbs(_30_._iMa_[i]._Value - _8_._iMa_[i]._Value);;
                                        //------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                        //if((i > 1))
                                        //{         IsBasic_tExpanding_fNearing_500_v_300_ = _500_v_300_Range[i] < _500_v_300_Range[i - 1];
                                        //          IsBasic_tExpanding_fNearing_300_v_200_ = _300_v_200_Range[i] < _300_v_200_Range[i - 1];
                                        //          IsBasic_tExpanding_fNearing_200_v_100_ = _200_v_100_Range[i] < _200_v_100_Range[i - 1];
                                        //          IsBasic_tExpanding_fNearing_100_v_50_  = _100_v_50_Range[i]  < _100_v_50_Range[i - 1];
                                        //          IsBasic_tExpanding_fNearing_50_v_30_   = _50_v_30_Range[i]   < _50_v_30_Range[i - 1];
                                        //          IsBasic_tExpanding_fNearing_30_v_20_   = _30_v_20_Range[i]   < _30_v_20_Range[i - 1];
                                        //          IsBasic_tExpanding_fNearing_20_v_10_   = _20_v_10_Range[i]   < _20_v_10_Range[i - 1];
                                        //          IsBasic_tExpanding_fNearing_10_v_5_    = _10_v_5_Range[i]    < _10_v_5_Range[i - 1];
                                        //          IsBasic_tExpanding_fNearing_5_v_3_     = _5_v_3_Range[i]     < _5_v_3_Range[i - 1];
                                        //          //
                                        //}
                                        //------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                              }
                              //------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                              {         IsBasic_tExpanding_fNearing_500_v_300_ = _500_v_300_Range[0] > _500_v_300_Range[10];
                                        IsBasic_tExpanding_fNearing_300_v_200_ = _300_v_200_Range[0] > _300_v_200_Range[10];
                                        IsBasic_tExpanding_fNearing_200_v_100_ = _200_v_100_Range[0] > _200_v_100_Range[10];
                                        IsBasic_tExpanding_fNearing_100_v_50_  = _100_v_50_Range[0]  > _100_v_50_Range[10];
                                        IsBasic_tExpanding_fNearing_50_v_30_   = _50_v_30_Range[0]   > _50_v_30_Range[10];
                                        IsBasic_tExpanding_fNearing_30_v_20_   = _30_v_20_Range[0]   > _30_v_20_Range[10];
                                        IsBasic_tExpanding_fNearing_20_v_10_   = _20_v_10_Range[0]   > _20_v_10_Range[10];
                                        IsBasic_tExpanding_fNearing_10_v_5_    = _10_v_5_Range[0]    > _10_v_5_Range[10];
                                        IsBasic_tExpanding_fNearing_5_v_3_     = _5_v_3_Range[0]     > _5_v_3_Range[10];
                                        //
                                        IsBasic_tExpanding_fNearing_10_v_3_    = _10_v_3_Range[0]    > _10_v_3_Range[10];
                                        IsBasic_tExpanding_fNearing_20_v_5_    = _20_v_5_Range[0]    > _20_v_5_Range[5];
                                        IsBasic_tExpanding_fNearing_30_v_8_    = _30_v_8_Range[1]    > _30_v_8_Range[6];
                                        //
                              }
                              //--bypass if else method by previous defined enumation
                              {         E_Market_Direction_ima_500_v_300_ = (Point_SR__500_v_300_[0].IsBasic_Suppoertve    &&  IsBasic_tExpanding_fNearing_500_v_300_)  ? E_Market_Bulish_Expanding  : E_Market_Void ;
                                        E_Market_Direction_ima_500_v_300_ = (Point_SR__500_v_300_[0].IsBasic_Suppoertve    &&  !IsBasic_tExpanding_fNearing_500_v_300_) ? E_Market_Bulish_Nearing    : E_Market_Direction_ima_500_v_300_ ;
                                        E_Market_Direction_ima_500_v_300_ = (Point_SR__500_v_300_[0].IsBasic_Ressistancive &&  IsBasic_tExpanding_fNearing_500_v_300_)  ? E_Market_Bearish_Expanding : E_Market_Direction_ima_500_v_300_ ;
                                        E_Market_Direction_ima_500_v_300_ = (Point_SR__500_v_300_[0].IsBasic_Ressistancive &&  !IsBasic_tExpanding_fNearing_500_v_300_) ? E_Market_Bearish_Nearing   : E_Market_Direction_ima_500_v_300_ ;
                                        //
                                        E_Market_Direction_ima_300_v_200_ = (Point_SR__300_v_200_[0].IsBasic_Suppoertve    &&  IsBasic_tExpanding_fNearing_300_v_200_)  ? E_Market_Bulish_Expanding  : E_Market_Void ;
                                        E_Market_Direction_ima_300_v_200_ = (Point_SR__300_v_200_[0].IsBasic_Suppoertve    &&  !IsBasic_tExpanding_fNearing_300_v_200_) ? E_Market_Bulish_Nearing    : E_Market_Direction_ima_300_v_200_ ;
                                        E_Market_Direction_ima_300_v_200_ = (Point_SR__300_v_200_[0].IsBasic_Ressistancive &&  IsBasic_tExpanding_fNearing_300_v_200_)  ? E_Market_Bearish_Expanding : E_Market_Direction_ima_300_v_200_ ;
                                        E_Market_Direction_ima_300_v_200_ = (Point_SR__300_v_200_[0].IsBasic_Ressistancive &&  !IsBasic_tExpanding_fNearing_300_v_200_) ? E_Market_Bearish_Nearing   : E_Market_Direction_ima_300_v_200_ ;
                                        //
                                        E_Market_Direction_ima_200_v_100_ = (Point_SR__200_v_100_[0].IsBasic_Suppoertve    &&  IsBasic_tExpanding_fNearing_200_v_100_)  ? E_Market_Bulish_Expanding  : E_Market_Void ;
                                        E_Market_Direction_ima_200_v_100_ = (Point_SR__200_v_100_[0].IsBasic_Suppoertve    &&  !IsBasic_tExpanding_fNearing_200_v_100_) ? E_Market_Bulish_Nearing    : E_Market_Direction_ima_200_v_100_ ;
                                        E_Market_Direction_ima_200_v_100_ = (Point_SR__200_v_100_[0].IsBasic_Ressistancive &&  IsBasic_tExpanding_fNearing_200_v_100_)  ? E_Market_Bearish_Expanding : E_Market_Direction_ima_200_v_100_ ;
                                        E_Market_Direction_ima_200_v_100_ = (Point_SR__200_v_100_[0].IsBasic_Ressistancive &&  !IsBasic_tExpanding_fNearing_200_v_100_) ? E_Market_Bearish_Nearing   : E_Market_Direction_ima_200_v_100_ ;
                                        //
                                        E_Market_Direction_ima_100_v_50_ = (Point_SR__100_v_50_[0].IsBasic_Suppoertve    &&  IsBasic_tExpanding_fNearing_100_v_50_)  ? E_Market_Bulish_Expanding  : E_Market_Void ;
                                        E_Market_Direction_ima_100_v_50_ = (Point_SR__100_v_50_[0].IsBasic_Suppoertve    &&  !IsBasic_tExpanding_fNearing_100_v_50_) ? E_Market_Bulish_Nearing    : E_Market_Direction_ima_100_v_50_ ;
                                        E_Market_Direction_ima_100_v_50_ = (Point_SR__100_v_50_[0].IsBasic_Ressistancive &&  IsBasic_tExpanding_fNearing_100_v_50_)  ? E_Market_Bearish_Expanding : E_Market_Direction_ima_100_v_50_ ;
                                        E_Market_Direction_ima_100_v_50_ = (Point_SR__100_v_50_[0].IsBasic_Ressistancive &&  !IsBasic_tExpanding_fNearing_100_v_50_) ? E_Market_Bearish_Nearing   : E_Market_Direction_ima_100_v_50_ ;
                                        //
                                        E_Market_Direction_ima_50_v_30_ = (Point_SR__50_v_30_[0].IsBasic_Suppoertve    &&  IsBasic_tExpanding_fNearing_50_v_30_)  ? E_Market_Bulish_Expanding  : E_Market_Void ;
                                        E_Market_Direction_ima_50_v_30_ = (Point_SR__50_v_30_[0].IsBasic_Suppoertve    &&  !IsBasic_tExpanding_fNearing_50_v_30_) ? E_Market_Bulish_Nearing    : E_Market_Direction_ima_50_v_30_ ;
                                        E_Market_Direction_ima_50_v_30_ = (Point_SR__50_v_30_[0].IsBasic_Ressistancive &&  IsBasic_tExpanding_fNearing_50_v_30_)  ? E_Market_Bearish_Expanding : E_Market_Direction_ima_50_v_30_ ;
                                        E_Market_Direction_ima_50_v_30_ = (Point_SR__50_v_30_[0].IsBasic_Ressistancive &&  !IsBasic_tExpanding_fNearing_50_v_30_) ? E_Market_Bearish_Nearing   : E_Market_Direction_ima_50_v_30_ ;
                                        //
                                        E_Market_Direction_ima_30_v_20_ = (Point_SR__30_v_20_[0].IsBasic_Suppoertve    &&  IsBasic_tExpanding_fNearing_30_v_20_)  ? E_Market_Bulish_Expanding  : E_Market_Void ;
                                        E_Market_Direction_ima_30_v_20_ = (Point_SR__30_v_20_[0].IsBasic_Suppoertve    &&  !IsBasic_tExpanding_fNearing_30_v_20_) ? E_Market_Bulish_Nearing    : E_Market_Direction_ima_30_v_20_ ;
                                        E_Market_Direction_ima_30_v_20_ = (Point_SR__30_v_20_[0].IsBasic_Ressistancive &&  IsBasic_tExpanding_fNearing_30_v_20_)  ? E_Market_Bearish_Expanding : E_Market_Direction_ima_30_v_20_ ;
                                        E_Market_Direction_ima_30_v_20_ = (Point_SR__30_v_20_[0].IsBasic_Ressistancive &&  !IsBasic_tExpanding_fNearing_30_v_20_) ? E_Market_Bearish_Nearing   : E_Market_Direction_ima_30_v_20_ ;
                                        //
                                        E_Market_Direction_ima_20_v_10_ = (Point_SR__20_v_10_[0].IsBasic_Suppoertve    &&  IsBasic_tExpanding_fNearing_20_v_10_)  ? E_Market_Bulish_Expanding  : E_Market_Void ;
                                        E_Market_Direction_ima_20_v_10_ = (Point_SR__20_v_10_[0].IsBasic_Suppoertve    &&  !IsBasic_tExpanding_fNearing_20_v_10_) ? E_Market_Bulish_Nearing    : E_Market_Direction_ima_20_v_10_ ;
                                        E_Market_Direction_ima_20_v_10_ = (Point_SR__20_v_10_[0].IsBasic_Ressistancive &&  IsBasic_tExpanding_fNearing_20_v_10_)  ? E_Market_Bearish_Expanding : E_Market_Direction_ima_20_v_10_ ;
                                        E_Market_Direction_ima_20_v_10_ = (Point_SR__20_v_10_[0].IsBasic_Ressistancive &&  !IsBasic_tExpanding_fNearing_20_v_10_) ? E_Market_Bearish_Nearing   : E_Market_Direction_ima_20_v_10_ ;
                                        //
                                        E_Market_Direction_ima_10_v_5_ = (Point_SR__10_v_5_[0].IsBasic_Suppoertve    &&  IsBasic_tExpanding_fNearing_10_v_5_)  ? E_Market_Bulish_Expanding  : E_Market_Void ;
                                        E_Market_Direction_ima_10_v_5_ = (Point_SR__10_v_5_[0].IsBasic_Suppoertve    &&  !IsBasic_tExpanding_fNearing_10_v_5_) ? E_Market_Bulish_Nearing    : E_Market_Direction_ima_10_v_5_ ;
                                        E_Market_Direction_ima_10_v_5_ = (Point_SR__10_v_5_[0].IsBasic_Ressistancive &&  IsBasic_tExpanding_fNearing_10_v_5_)  ? E_Market_Bearish_Expanding : E_Market_Direction_ima_10_v_5_ ;
                                        E_Market_Direction_ima_10_v_5_ = (Point_SR__10_v_5_[0].IsBasic_Ressistancive &&  !IsBasic_tExpanding_fNearing_10_v_5_) ? E_Market_Bearish_Nearing   : E_Market_Direction_ima_10_v_5_ ;
                                        //
                                        E_Market_Direction_ima_10_v_3_ = (Point_SR__10_v_3_[0].IsBasic_Suppoertve    &&  IsBasic_tExpanding_fNearing_10_v_3_)  ? E_Market_Bulish_Expanding  : E_Market_Void ;
                                        E_Market_Direction_ima_10_v_3_ = (Point_SR__10_v_3_[0].IsBasic_Suppoertve    &&  !IsBasic_tExpanding_fNearing_10_v_3_) ? E_Market_Bulish_Nearing    : E_Market_Direction_ima_10_v_3_ ;
                                        E_Market_Direction_ima_10_v_3_ = (Point_SR__10_v_3_[0].IsBasic_Ressistancive &&  IsBasic_tExpanding_fNearing_10_v_3_)  ? E_Market_Bearish_Expanding : E_Market_Direction_ima_10_v_3_ ;
                                        E_Market_Direction_ima_10_v_3_ = (Point_SR__10_v_3_[0].IsBasic_Ressistancive &&  !IsBasic_tExpanding_fNearing_10_v_3_) ? E_Market_Bearish_Nearing   : E_Market_Direction_ima_10_v_3_ ;
                                        //
                                        E_Market_Direction_ima_5_v_3_ = (Point_SR__5_v_3_[0].IsBasic_Suppoertve    &&  IsBasic_tExpanding_fNearing_5_v_3_)  ? E_Market_Bulish_Expanding  : E_Market_Void ;
                                        E_Market_Direction_ima_5_v_3_ = (Point_SR__5_v_3_[0].IsBasic_Suppoertve    &&  !IsBasic_tExpanding_fNearing_5_v_3_) ? E_Market_Bulish_Nearing    : E_Market_Direction_ima_5_v_3_ ;
                                        E_Market_Direction_ima_5_v_3_ = (Point_SR__5_v_3_[0].IsBasic_Ressistancive &&  IsBasic_tExpanding_fNearing_5_v_3_)  ? E_Market_Bearish_Expanding : E_Market_Direction_ima_5_v_3_ ;
                                        E_Market_Direction_ima_5_v_3_ = (Point_SR__5_v_3_[0].IsBasic_Ressistancive &&  !IsBasic_tExpanding_fNearing_5_v_3_) ? E_Market_Bearish_Nearing   : E_Market_Direction_ima_5_v_3_ ;
                                        //
                                        //-----
                                        E_Market_Direction_ima_20_v_5_ = (Point_SR__20_v_5_[0].IsBasic_Suppoertve    &&  IsBasic_tExpanding_fNearing_20_v_5_)  ? E_Market_Bulish_Expanding  : E_Market_Void ;
                                        E_Market_Direction_ima_20_v_5_ = (Point_SR__20_v_5_[0].IsBasic_Suppoertve    &&  !IsBasic_tExpanding_fNearing_20_v_5_) ? E_Market_Bulish_Nearing    : E_Market_Direction_ima_20_v_5_ ;  //E_Market_Direction_ima_20_v_5_==E_Market_Bulish_Nearing
                                        E_Market_Direction_ima_20_v_5_ = (Point_SR__20_v_5_[0].IsBasic_Ressistancive &&  IsBasic_tExpanding_fNearing_20_v_5_)  ? E_Market_Bearish_Expanding : E_Market_Direction_ima_20_v_5_ ;
                                        E_Market_Direction_ima_20_v_5_ = (Point_SR__20_v_5_[0].IsBasic_Ressistancive &&  !IsBasic_tExpanding_fNearing_20_v_5_) ? E_Market_Bearish_Nearing   : E_Market_Direction_ima_20_v_5_ ;
                                        //
                                        E_Market_Direction_ima_30_v_8_ = (Point_SR__30_v_8_[0].IsBasic_Suppoertve    &&  IsBasic_tExpanding_fNearing_30_v_8_)  ? E_Market_Bulish_Expanding  : E_Market_Void ;
                                        E_Market_Direction_ima_30_v_8_ = (Point_SR__30_v_8_[0].IsBasic_Suppoertve    &&  !IsBasic_tExpanding_fNearing_30_v_8_) ? E_Market_Bulish_Nearing    : E_Market_Direction_ima_30_v_8_ ;  //E_Market_Direction_ima_20_v_5_==E_Market_Bulish_Nearing
                                        E_Market_Direction_ima_30_v_8_ = (Point_SR__30_v_8_[0].IsBasic_Ressistancive &&  IsBasic_tExpanding_fNearing_30_v_8_)  ? E_Market_Bearish_Expanding : E_Market_Direction_ima_30_v_8_ ;
                                        E_Market_Direction_ima_30_v_8_ = (Point_SR__30_v_8_[0].IsBasic_Ressistancive &&  !IsBasic_tExpanding_fNearing_30_v_8_) ? E_Market_Bearish_Nearing   : E_Market_Direction_ima_30_v_8_ ;
                                        //
                              }
                              //-- Alert(  EnumToString(ap), "  ", EnumToString(mode), "  ", EnumToString(tf), "   Is Suppoertve: ", Point_SR__5_v_3_[0].IsBasic_Suppoertve, "   Is Ressistancive: ", Point_SR__5_v_3_[0].IsBasic_Ressistancive, "   Is CrossUp: ", Point_SR__5_v_3_[0].IsComplex_CrossUp, "   Is CrossDown:", Point_SR__5_v_3_[0].IsComplex_CrossDown); //
                              //--  Alert( "_500_v_300_Range: ", _500_v_300_Range[0], "  IsBasic_tExpanding_fNearing_500_v_300_: ", IsBasic_tExpanding_fNearing_500_v_300_ );
                              //--Alert("E_Market_Direction_ima_500_v_300_", EnumToString(E_Market_Direction_ima_500_v_300_));
                              //-----------------------------------------
                    }
                    //---------------
          }
          St_CDI_MA_All_PeriodCount() {};
          ~St_CDI_MA_All_PeriodCount() {};



};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class St_CDI_MA_All_ApplayedPrice
{
public:
          St_CDI_MA_All_PeriodCount       _PRICE_CLOSE_, _PRICE_OPEN_, _PRICE_HIGH_, _PRICE_LOW_; // _PRICE_MEDIAN_, _PRICE_TYPICAL_, _PRICE_WEIGHTED_;

          St_CDI_MA_All_ApplayedPrice( ENUM_TIMEFRAMES tf, ENUM_MA_METHOD mode ) //--ENUM_MA_METHOD mode, ENUM_TIMEFRAMES tf, ENUM_APPLIED_PRICE Ap
          {         St_CDI_MA_All_PeriodCount PRICE_CLOSE_(    mode, tf, PRICE_CLOSE    );      _PRICE_CLOSE_    = PRICE_CLOSE_;    // Alert(" core constractor ap  ", _PRICE_CLOSE_._500_._iMa_._Value);
                    St_CDI_MA_All_PeriodCount PRICE_OPEN_(     mode, tf, PRICE_OPEN     );      _PRICE_OPEN_     = PRICE_OPEN_;
                    St_CDI_MA_All_PeriodCount PRICE_HIGH_(     mode, tf, PRICE_HIGH     );      _PRICE_HIGH_     = PRICE_HIGH_;
                    St_CDI_MA_All_PeriodCount PRICE_LOW_(      mode, tf, PRICE_LOW      );      _PRICE_LOW_      = PRICE_LOW_;
                    //St_CDI_MA_All_PeriodCount PRICE_MEDIAN_(   mode, tf, PRICE_MEDIAN   );      _PRICE_MEDIAN_   = PRICE_MEDIAN_;
                    //St_CDI_MA_All_PeriodCount PRICE_TYPICAL_(  mode, tf, PRICE_TYPICAL  );      _PRICE_TYPICAL_  = PRICE_TYPICAL_;
                    //St_CDI_MA_All_PeriodCount PRICE_WEIGHTED_( mode, tf, PRICE_WEIGHTED );      _PRICE_WEIGHTED_ = PRICE_WEIGHTED_;
                    //
          }
          St_CDI_MA_All_ApplayedPrice() {};
          ~St_CDI_MA_All_ApplayedPrice() {};



};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+ main caller
class St_CDI_MA_All_All_Modes
{
public:
          St_CDI_MA_All_ApplayedPrice       _SMA_, _EMA_, _SMMA_, _LWMA_;
          //--------------------------------------------------------------
          bool Is_Complex_SMA_Close_Bulish, Is_Complex_EMA_Close_Bulish, Is_Complex_SMMA_Close_Bulish, Is_Complex_LWMA_Close_Bulish;
          //--------------------------------------------------------------
          St_CDI_MA_All_All_Modes() {};
          ~St_CDI_MA_All_All_Modes() {};
          St_CDI_MA_All_All_Modes(ENUM_TIMEFRAMES tf)
          {         St_CDI_MA_All_ApplayedPrice       SMA_(tf, MODE_SMA), EMA_(tf, MODE_EMA), SMMA_(tf, MODE_SMMA), LWMA_(tf, MODE_LWMA);
                    _SMA_  = SMA_;
                    _EMA_  = EMA_;
                    _SMMA_ = SMMA_;
                    _LWMA_ = LWMA_;//
          };
          void       Update() //--the size of local variables is too large (more than 512kb)    St_CDI_MA_All.mqh       464       16
          {         /*
                    //
                              St_CDI_MA_All_Periods_Mode       SMA_(MODE_SMA), EMA_(MODE_EMA), SMMA_(MODE_SMMA), LWMA_(MODE_LWMA);
                              _SMA_  = SMA_;
                              _EMA_  = EMA_;   //--Alert(" core constractor mode ", _EMA_._Current_._PRICE_CLOSE_._500_._iMa_._Value);
                              _SMMA_ = SMMA_;  // Alert( "  ------  ", _EMA_._Current_._PRICE_CLOSE_._500_._iMa_._Value);
                              _LWMA_ = LWMA_;  // Alert("updated St_CDI_MA_All_All_Modes");
                    //
                    */
          } //
          void Update2(ENUM_TIMEFRAMES tf) //--the size of local variables is too large (more than 512kb)    St_CDI_MA_All.mqh       464       16
          {         //
                    St_CDI_MA_All_ApplayedPrice       SMA_(tf, MODE_SMA), EMA_(tf, MODE_EMA), SMMA_(tf, MODE_SMMA), LWMA_(tf, MODE_LWMA);
                    _SMA_  = SMA_;
                    _EMA_  = EMA_;
                    _SMMA_ = SMMA_;
                    _LWMA_ = LWMA_;//
                    //--------------------------------------------------------------
                    Is_Complex_SMA_Close_Bulish  =  !_SMA_._PRICE_CLOSE_.IsBasic_500_Above_300__Bearish  &&   ! _SMA_._PRICE_CLOSE_.IsBasic_30_Above_20_Bearish;  //---macro AND Middle Bulish
                    Is_Complex_EMA_Close_Bulish  =  !_EMA_._PRICE_CLOSE_.IsBasic_500_Above_300__Bearish  &&   ! _EMA_._PRICE_CLOSE_.IsBasic_30_Above_20_Bearish;
                    Is_Complex_SMMA_Close_Bulish =  !_SMMA_._PRICE_CLOSE_.IsBasic_500_Above_300__Bearish &&   ! _SMMA_._PRICE_CLOSE_.IsBasic_30_Above_20_Bearish;
                    Is_Complex_LWMA_Close_Bulish =  !_LWMA_._PRICE_CLOSE_.IsBasic_500_Above_300__Bearish &&   ! _LWMA_._PRICE_CLOSE_.IsBasic_30_Above_20_Bearish;
                    //--------------------------------------------------------------
          }//
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class St_CDI_MA_All_Periods
{
public:
          //  Def       Def_Mode_;   _MN1_,_W1_,_D1_,_H4_,_H1_,_M30_,_M15_,_M5_,_M1_;//
          St_CDI_MA_All_Periods(ENUM_MA_METHOD mode);// the size of local variables is too large (more than 512kb)   St_CDI_MA_All.mqh       431       11

          St_CDI_MA_All_Periods() {};
          ~St_CDI_MA_All_Periods() {};
          void       Update() {};

};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
template<typename Def>
class St_CDI_MA_All_Periods_Templater
{
public:

          Def           _Def_;

          St_CDI_MA_All_Periods_Templater() {};
          ~St_CDI_MA_All_Periods_Templater() {};
          void Update(ENUM_TIMEFRAMES tf) //--the size of local variables is too large (more than 512kb)    St_CDI_MA_All.mqh       464       16
          {         //
                    Def       _Def(tf); _Def_  = _Def; //
          }

};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
template<typename Def, typename DefA, typename DefB >
class St_CDI_MA_All_Periods_Templater2
{
public:

          Def           _Def_SMA_,      _Def_EMA_,      _Def_SMMA_,     _Def_LWMA_;
          DefA          _PRICE_CLOSE_,  _PRICE_OPEN_,   _PRICE_HIGH_,   _PRICE_LOW_,    _PRICE_MEDIAN_,         _PRICE_TYPICAL_,        _PRICE_WEIGHTED_;
          DefB          _500_,          _300_,          _200_,          _100_,          _50_,                   _30_,                   _20_,                   _10_,           _5_,    _3_  ;

          St_CDI_MA_All_Periods_Templater() {};
          ~St_CDI_MA_All_Periods_Templater() {};
          void Update(ENUM_TIMEFRAMES tf) //--the size of local variables is too large (more than 512kb)    St_CDI_MA_All.mqh       464       16
          {         //
                    Def       _Def_SMA (tf); _Def_SMA_  = _Def_SMA;
                    Def       _Def_EMA (tf); _Def_EMA_  = _Def_EMA;
                    Def       _Def_SMMA(tf); _Def_SMMA_ = _Def_SMMA;
                    Def       _Def_LWMA(tf); _Def_LWMA_ = _Def_LWMA;
                    DefB      _500( mode, tf, Ap, 500);  _500_      = _500;
//
          }

};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
