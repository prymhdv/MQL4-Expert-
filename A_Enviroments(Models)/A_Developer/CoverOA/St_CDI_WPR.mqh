//+------------------------------------------------------------------+
//||   ||||||||||       St_CDI_ADX.mqh        ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOA\St_CDI_Base.mqh>
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class St_CDI_WpR : public St_CDI_Base
{

public:
          void          iWPRs();
          double        WpR_200_0,      WpR_200_1;
          double        WpR_14_0,       WpR_14_1;
          //---------------------------------------------------------------------------------------------------------------------------------------------------------
          bool          IsWpR_14_UpTrend,       IsWpR_200_UpTrend;
          bool          IsWpR20_CrossUp_200,    IsWpR200_EMA20_CrossUp_SMA20,   IsWpR20_EMA20_CrossUp_SMA20;   //static

          //---------------------------------------------------------------------------------------------------------------------------------------------------------
          double        First_WPRs200[],        Second_WPRs200_EMA20[],         Second_WPRs200_SMA20[],         Second_WPRs200_EMA200[],        Second_WPRs200_SMA200[]; ///Dynamic
          double        First_WPRs20[],         Second_WPRs20_EMA20[],          Second_WPRs20_SMA20[],          Second_WPRs20_EMA200[],         Second_WPRs20_SMA200[];///Dynamic
          //---------------------------------------------------------------------------------------------------------------------------------------------------------
}; //---St_CDI_WpR          ct_Conductor.Indicators_WPR.;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void St_CDI_WpR::iWPRs()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
///Larry Williams' Percent Range
//========================================================
////%R = - (MAX (HIGH (i - n)) - CLOSE (i)) / (MAX (HIGH (i - n)) - MIN (LOW (i - n))) * 100
          WpR_200_0                    = iWPR(NULL, 0, 200, 0);
          WpR_200_1                    = iWPR(NULL, 0, 200, 1);
          WpR_14_0                     = iWPR(NULL, 0, 14, 0);
          WpR_14_1                     = iWPR(NULL, 0, 14, 1);
//========================================================
          IsWpR_14_UpTrend             = (WpR_14_0  > WpR_14_1 ); //Print("money_direction of money");
          IsWpR_200_UpTrend            = (WpR_200_0 > WpR_200_1); //Print("money_direction of money");
//========================================================
          Init_X200Array_X20Array("iWPR", First_WPRs200, Second_WPRs200_EMA20, Second_WPRs200_SMA20, Second_WPRs200_EMA200, Second_WPRs200_SMA200, First_WPRs20, Second_WPRs20_EMA20, Second_WPRs20_SMA20, Second_WPRs20_EMA200, Second_WPRs20_SMA200, 200);
          IsWpR20_CrossUp_200            = First_WPRs20[0] > First_WPRs200[0];
          IsWpR200_EMA20_CrossUp_SMA20   = Second_WPRs200_EMA20[0] > Second_WPRs200_SMA20[0];
          IsWpR20_EMA20_CrossUp_SMA20    = Second_WPRs20_EMA20[0] > Second_WPRs20_SMA20[0];
//========================================================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          return;//
}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class Sti_WPR
{
public:
          Sti_WPR(void) {f = PERIOD_CURRENT; initer(200);};
          ~Sti_WPR(void) {};
          Sti_WPR(ENUM_TIMEFRAMES F) {f = F; initer(200);};
          St_MqlCondicator      mql;
          ENUM_TIMEFRAMES       f;
          St_iWPR               t_iWPR_400[], t_iWPR_200[], t_iWPR_14[];
          double                _iWPR_200[];
          //---condition state
          bool                  Is_WPR200_WPR14_0_Buy_Supportive;
          bool                  IsComplex_WPR200_WPR14_0_BS;     //= (IsBasic_Slow_Above_m50) && ( IsBasic_Fast_Grater_m50 ) && (IsBasic_Fast_Bulish) && IsBasic_Slow_Bulish ? true : false; //
          bool                  IsComplex_WPR200_WPR14_0_SS;     //= (!IsBasic_Slow_Above_m50) && ( !IsBasic_Fast_Grater_m50 ) && (!IsBasic_Fast_Bulish) && !IsBasic_Slow_Bulish ? true : false; //
          bool                  IsBasic_400_v_14_Bulish;         //= t_iWPR_14[0]._Value > t_iWPR_200[0]._Value;
          bool                  IsBasic_400_v_200_Bulish;        //= t_iWPR_200[0]._Value > t_iWPR_400[0]._Value;
          bool                  IsBasic_400_v_400_Bulish50;      //= t_iWPR_400[0]._Value > t_iWPR_400[50]._Value;
          //----------------------------------------------------------------------------------------------------
          bool                  IsBasic_Wpr_Lower_20;
          bool                  IsBasic_Wpr_Grater_80;

          bool IsBasic_Fast_Above_Slow;// = t_iWPR_14[0]._Value > t_iWPR_200[0]._Value;
          //---------------------------------------------------------------------
          bool IsBasic_Fast_Bulish;//     = t_iWPR_14[0]._Value > t_iWPR_14[3]._Value;
          bool IsBasic_Slow_Bulish;//     = t_iWPR_200[0]._Value > t_iWPR_200[3]._Value;
          //---------------------------------------------------------------------
          bool IsBasic_Fast_Grater_m50;//  = t_iWPR_14[0]._Value > -50 ;
          bool IsBasic_Fast_Lower_m80;//  = t_iWPR_14[0]._Value > -80 ;
          bool IsBasic_Fast_Grater_m20;// = t_iWPR_14[0]._Value  <> -20 ;
          //---------------------------------------------------------------------
          bool IsBasic_Slow_Above_m50;//  = t_iWPR_200[0]._Value > -50 ;
          bool IsBasic_Slow_Lower_m80;//  = t_iWPR_200[0]._Value > -80 ;
          bool IsBasic_Slow_Grater_m20;// = t_iWPR_200[0]._Value < -20 ;
          //---
          int                   total_Bar;
          void                  initer(int bc);
          //
          double                iWPR_Values[]; //---!!! local array not resized !!!
          //-------------------------------------------------------------------------------
          double                iWPR_200_iEMA200[];
          double                iWPR_200_iEMA200_iEMA200[];
          bool                  IsExpanding(int fp, int lp, double &_X_[], double &_X_M[]) {return MathAbs(_X_[fp] - _X_M[fp]) > MathAbs(_X_[lp] - _X_M[lp]);};  /*else nearing*/
          bool                  IsExp_iWPR_200_iEMA200_iEMA200__iWPR_200_iEMA200___1_14;
          //
};
//+------------------------------------------------------------------+
//|                                                                  |dependency channelzigzag
//+------------------------------------------------------------------+
void Sti_WPR::initer(int bc)/// wpr rane 0-100  0 is high   -100 is low
{         total_Bar = bc;
          int Size_ = ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.GDS.Wave1.A._Shift + 50;//ArraySize(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._Current.t_iMACD_Main_12_26_9_PriceClose);
          total_Bar = Size_;
          ArrayResize(t_iWPR_400, total_Bar + 1);
          ArrayResize(t_iWPR_200, total_Bar + 1);
          ArrayResize(t_iWPR_14, total_Bar + 1);
          int Sizer = ArrayResize(iWPR_Values, total_Bar + 2);
          //-- Alert("Sizer:", Sizer);
          //----------------------------------------------------------------------------------------------------------------------
          for(int i = 0; i < total_Bar + 1; i++)
          {         t_iWPR_400[i]   = St_iWPR(NULL, f, 400, i);  mql._iWPR(t_iWPR_400[i]);
                    t_iWPR_200[i]   = St_iWPR(NULL, f, 200, i);  mql._iWPR(t_iWPR_200[i]);
                    t_iWPR_14[i]    = St_iWPR(NULL, f, 14,  i);  mql._iWPR(t_iWPR_14[i]); //
                    //-- St_iWPR test[];
                    //-- ArrayResize(test, total_Bar + 1);
                    //--  ArrayCopy(test, t_iWPR_200); //--'test' - structures or classes containing objects are not allowed        St_CDI_WPR.mqh    86        31
          } //
          //----------------------------------------------------------------------------------------------------------------------
          ArraySetAsSeries(iWPR_Values, true);  //!!!!!!!!!!!!!!!!!!!!!!!! Solution
          for(int i = 0; i < total_Bar  ; i++)
          {         iWPR_Values[i] = -iWPR(NULL,  f, 200, i);  } //--
          //----------------------------------------------------------------------------------------------------------------------
          for(int i = 0; i < total_Bar ; i++)
          {         t_iWPR_200[i]._MovingAvrage           = (float)iMAOnArray(iWPR_Values,  0, 20, 0, MODE_EMA, i);//
                    t_iWPR_200[i].Is_Basic_Bulish_MovingAvrage  = t_iWPR_200[i]._MovingAvrage > iWPR_Values[i] ; //
          }
          //----------------------------------------------------------------------------------------------------------------------
          //--Alert(EnumToString(f), "   t_iWPR_200[0]._MovingAvrage ", DoubleToStr(t_iWPR_200[0]._MovingAvrage, 1), "   iWPR_Values[0] ", DoubleToStr(iWPR_Values[0], 1)); //
          //--control state
          {         //
                    IsBasic_Fast_Above_Slow = t_iWPR_14[0]._Value > t_iWPR_200[0]._Value;
                    //---------------------------------------------------------------------
                    IsBasic_Fast_Bulish     = t_iWPR_14[0]._Value > t_iWPR_14[3]._Value;
                    IsBasic_Slow_Bulish     = t_iWPR_200[0]._Value > t_iWPR_200[3]._Value;
                    //---------------------------------------------------------------------
                    IsBasic_Fast_Grater_m50  = t_iWPR_14[0]._Value > -50 ;
                    IsBasic_Fast_Lower_m80  = t_iWPR_14[0]._Value < -80 ;
                    IsBasic_Fast_Grater_m20  = t_iWPR_14[0]._Value > -20 ;    //--[0,-20]
                    //---------------------------------------------------------------------
                    IsBasic_Slow_Above_m50  = t_iWPR_200[0]._Value > -50 ;
                    IsBasic_Slow_Lower_m80  = t_iWPR_200[0]._Value < -80 ;
                    IsBasic_Slow_Grater_m20 = t_iWPR_200[0]._Value > -20 ;
                    //---------------------------------------------------------------------
                    IsBasic_400_v_14_Bulish      = t_iWPR_14[0]._Value  > t_iWPR_200[0]._Value;
                    IsBasic_400_v_200_Bulish     = t_iWPR_200[0]._Value > t_iWPR_400[0]._Value;
                    IsBasic_400_v_400_Bulish50   = t_iWPR_400[0]._Value > t_iWPR_400[50]._Value;
                    //---------------------------------------------------------------------
                    //
                    Is_WPR200_WPR14_0_Buy_Supportive = (t_iWPR_200[0]._Value > -50) && ( t_iWPR_14[0]._Value > -50 ) ; //
                    IsComplex_WPR200_WPR14_0_BS = ( IsBasic_Slow_Bulish &&  IsBasic_Slow_Above_m50) && (  IsBasic_Fast_Above_Slow ) ; // && (IsBasic_Fast_Bulish) ||     IsBasic_Slow_Above_m50  IsBasic_Fast_Grater_m50
                    IsComplex_WPR200_WPR14_0_SS = (!IsBasic_Slow_Bulish && !IsBasic_Slow_Above_m50) && ( !IsBasic_Fast_Above_Slow ) ; // && (!IsBasic_Fast_Bulish) || !IsBasic_Slow_Bulish
          }
          //---------others
          {         //----------------------------------------------------------------------------------------------------------------------
                    ArrayResize(_iWPR_200, 1000);
                    ArraySetAsSeries(_iWPR_200, true);  //!!!!!!!!!!!!!!!!!!!!!!!! Solution !!!! befor assagnment
                    for(int i = 0; i < 1000; i++)
                    {         _iWPR_200[i]    = iWPR(NULL,  f, 200, i);}
                    ArrayResize(iWPR_200_iEMA200, 1000);
                    ArraySetAsSeries(iWPR_200_iEMA200, true);  //!!!!!!!!!!!!!!!!!!!!!!!! Solution !!!! befor assagnment
                    for(int i = 0; i < 1000; i++)
                    {         iWPR_200_iEMA200[i] = iMAOnArray(_iWPR_200, 0, 200, 0, MODE_EMA, i);}
                    //----------------------------------------------------------------------------------------------------------------------
                    ArrayResize(iWPR_200_iEMA200_iEMA200, 1000);
                    iWPR_200_iEMA200_iEMA200[0] = iMAOnArray(iWPR_200_iEMA200, 0, 200, 0, MODE_EMA, 0);
                    //----------------------------------------------------------------------------------------------------------------------
                    IsExp_iWPR_200_iEMA200_iEMA200__iWPR_200_iEMA200___1_14 = IsExpanding( 1,  14, iWPR_200_iEMA200,  iWPR_200_iEMA200_iEMA200);
                    //----------------------------------------------------------------------------------------------------------------------
          }//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class Sti_WPR_Peroid
{
public:
          void       Sti_WPR_Peroid();
          void       ~Sti_WPR_Peroid() {};
          Sti_WPR   _Current;  //
          Sti_WPR   _MN;       //
          Sti_WPR   _W1;       //
          Sti_WPR   _D1;       //
          Sti_WPR   _H4;       //
          Sti_WPR   _H1;       //
          Sti_WPR   _M30;      //
          Sti_WPR   _M15;      //
          Sti_WPR   _M5;       //
          Sti_WPR   _M1;       //
          //----------------------
          void       Update()
          {         Sti_WPR   Current  = Sti_WPR(PERIOD_CURRENT);        _Current       = Current;    //Print((string)( Current.Main.Max._Value), "  inr--  Current.Main.Max._Value)");//  //
                    Sti_WPR   MN       = Sti_WPR(PERIOD_MN1);            _MN            = MN;        //Print((string)( MN.Main.Max._Value),      "  inr--  MN.Main.Max._Value)");//  ////
                    Sti_WPR   W1       = Sti_WPR(PERIOD_W1);             _W1            = W1;        //Print((string)( W1.Main.Max._Value),      "  inr--  W1.Main.Max._Value)");//  ////
                    Sti_WPR   D1       = Sti_WPR(PERIOD_D1);             _D1            = D1;       // Print((string)( D1.Main.Max._Value),      "  inr--  D1.Main.Max._Value)");//  ////
                    Sti_WPR   H4       = Sti_WPR(PERIOD_H4);             _H4            = H4;        //Print((string)( H4.Main.Max._Value),      "  inr--  H4.Main.Max._Value)");//  ////
                    Sti_WPR   H1       = Sti_WPR(PERIOD_H1);             _H1            = H1;        //Print((string)( H1.Main.Max._Value),      "  inr--  H1.Main.Max._Value)");//  ////
                    Sti_WPR   M30      = Sti_WPR(PERIOD_M30);            _M30           = M30;        //Print((string)( M30.Main.Max._Value),     "  inr-- M30.Main.Max._Value)");//  ////
                    Sti_WPR   M15      = Sti_WPR(PERIOD_M15);            _M15           = M15;        //Print((string)( M15.Main.Max._Value),     "  inr-- M15.Main.Max._Value)");//  ////
                    Sti_WPR   M5       = Sti_WPR(PERIOD_M5);             _M5            = M5;        //Print((string)( M5.Main.Max._Value),      "  inr--  M5.Main.Max._Value)");//  ////
                    Sti_WPR   M1       = Sti_WPR(PERIOD_M1);             _M1            = M1;        //Print((string)( M1.Main.Max._Value),      "  inr--  M1.Main.Max._Value)");//  ////
          }//
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Sti_WPR_Peroid::Sti_WPR_Peroid()
{         //
          Sti_WPR   Current    = Sti_WPR(PERIOD_CURRENT);   _Current          = Current; //
          Sti_WPR   MN         = Sti_WPR(PERIOD_MN1);            _MN          = MN; //
          Sti_WPR   W1         = Sti_WPR(PERIOD_W1);             _W1          = W1; //
          Sti_WPR   D1         = Sti_WPR(PERIOD_D1);             _D1          = D1; //
          Sti_WPR   H4         = Sti_WPR(PERIOD_H4);             _H4          = H4; //
          Sti_WPR   H1         = Sti_WPR(PERIOD_H1);             _H1          = H1; //
          Sti_WPR   M30        = Sti_WPR(PERIOD_M30);           _M30          = M30; //
          Sti_WPR   M15        = Sti_WPR(PERIOD_M15);           _M15          = M15; //
          Sti_WPR   M5         = Sti_WPR(PERIOD_M5);             _M5          = M5; //
          Sti_WPR   M1         = Sti_WPR(PERIOD_M1);             _M1          = M1; //
}
//+------------------------------------------------------------------+
//||   ||||||||||       St_CDI_ADX.mqh        ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
