//+------------------------------------------------------------------+
//||   ||||||||||                 C_BarNews_Base.mqh                ||Ctp_TRADER
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
class C_RangeSecound
{
public:
          C_RangeSecound(void) {};
          ~C_RangeSecound(void) {};
          datetime timeStampWaiting;
          datetime Cross(datetime timeCurr, short range )
          {         if(timeCurr > timeStampWaiting) { timeStampWaiting = timeCurr + range; return timeCurr;}
                    return timeCurr;//
          } //
};
struct C_BarNews_Current_Bar_info
{         C_BarNews_Current_Bar_info() {Current_Bar_Time_Stamp = 0; Bar_New_Detected_Count = 0; Is_NewBar = false;}
          ~C_BarNews_Current_Bar_info() {Current_Bar_Time_Stamp = 0; Bar_New_Detected_Count = 0;}
          string                tf_Desc;
          //-------------------------------------------
          int                   Bar_New_Detected_Count;
          bool                  Detect_NewBar_Change;
          datetime              Current_Bar_Time_Stamp;
          string                desc;
          bool                  Is_NewBar;
          bool                  IsNewMinute;
          //-------------------------------------------
          //
          C_RangeSecound RangeSecoundTimer;
          bool Run(datetime timeCurr, ENUM_TIMEFRAMES m_timeFrame, int periodSecound) //iTime(m_symbol, m_timeFrame, 0)
          {         // ---rset
                    Detect_NewBar_Change = false;
                    tf_Desc              = Utilities.TimeFrameToString(m_timeFrame);
                    //---main calc---
                    {         //---
                              //---Cheach result; when crossed place
                              Detect_NewBar_Change = ( Current_Bar_Time_Stamp <=  timeCurr);//---over realase of candel time its != can implant
                              //---Update Stamp
                              if( Detect_NewBar_Change) { Current_Bar_Time_Stamp =  timeCurr + periodSecound; desc = "Is_NewBar"; Bar_New_Detected_Count++;;  return Is_NewBar = true;  } //
                              else                      { desc = "IsNot_NewBar";                                                                              return Is_NewBar = false; }; //
                    }//
          }

};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class C_BarNews_Base
{         /*
          solid bar news class
          */
private:
//---data
          string                m_symbol;
          ENUM_TIMEFRAMES       m_timeFrame;
public:
          void  C_BarNews_Base(int BarRange_ShiftCount, string s, ENUM_TIMEFRAMES f)
          {         m_timeFrame   = f;
                    m_symbol      = s;
                    //Current_Time_Stamp = iTime(s, f, b); //
                    //---------------------------------------------------
                    Detect_NewBar();
                    //-----------------------------------------------------------------
          };
          void  ~C_BarNews_Base() {};
          void  C_BarNews_Base() {}//
          bool  Update()
          {         //
                    bool Is_Run = false;
                    // Execute on bar open
                    //EVERY UPDATE CREATED STAPM THAT ARE SAME AS CURRENT
                    Detect_NewBar();
                    return  CBT.Is_NewBar;
                    //
          }
          //******************************************************************
          C_BarNews_Current_Bar_info CBT;
          C_BarNews_Current_Bar_info CBT__HalfMinute;
          C_BarNews_Current_Bar_info CBT__QuartMinute;
          C_BarNews_Current_Bar_info CBT__Seccound;
          C_BarNews_Current_Bar_info CBT__2Seccound;
          C_BarNews_Current_Bar_info CBT__5Seccound;
          //---
          int                   Count;
          bool                  Detect_NewBar();
          //---
};
//+------------------------------------------------------------------+  ************
//|                                                                  |  *****/******
//+------------------------------------------------------------------+
bool C_BarNews_Base::Detect_NewBar()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "C_UTILITIES  Error",  __LINE__, __FUNCTION__); //|
          /*
          Note in new bar open
          Stamp time must define previusly
          Execute on bar open
          */
          
          //------------------------------------------------------------------------------------
          CBT.Run(iTime(m_symbol, m_timeFrame, 0), m_timeFrame, PeriodSeconds());
          CBT__HalfMinute.Run(CBT__HalfMinute.RangeSecoundTimer.Cross(TimeLocal(), 30), m_timeFrame, PeriodSeconds() / 2);
          CBT__QuartMinute.Run(CBT__QuartMinute.RangeSecoundTimer.Cross(TimeLocal(), 15), m_timeFrame, PeriodSeconds() / 4);
          CBT__Seccound.Run(CBT__Seccound.RangeSecoundTimer.Cross(TimeLocal(), 1), m_timeFrame, 60 / 60);
          CBT__2Seccound.Run(CBT__2Seccound.RangeSecoundTimer.Cross(TimeLocal(), 2), m_timeFrame, 2);
          CBT__5Seccound.Run(CBT__5Seccound.RangeSecoundTimer.Cross(TimeLocal(), 5), m_timeFrame, 30 / 12);
          //-----------------------------------------------------------------------
          ________________________________________________________Xerorr.SuperviserX(_LastError, "C_UTILITIES  Error",  __LINE__, __FUNCTION__); //|
          return CBT.Detect_NewBar_Change; //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class C_BarNews_
{
private:

public:
          void           C_BarNews_(int BarRange_ShiftCount, string f_symbol, ENUM_TIMEFRAMES f_timeFrame);
          void          ~C_BarNews_() {} ;
          void           C_BarNews_()  ;
          bool           Update();
          //******************************************************************
          C_BarNews_Base  _CURRENT;
          C_BarNews_Base  _MN1;
          C_BarNews_Base  _W1;
          C_BarNews_Base  _D1;
          C_BarNews_Base  _H4;
          C_BarNews_Base  _H1;
          C_BarNews_Base  _M30;
          C_BarNews_Base  _M15;
          C_BarNews_Base  _M5;
          C_BarNews_Base  _M1;



};

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_BarNews_::C_BarNews_()
{         C_BarNews_Base _CURRENT_(   0,      Symbol(), PERIOD_CURRENT) ; _CURRENT   = _CURRENT_;
          C_BarNews_Base _MN1_(       0,      Symbol(), PERIOD_MN1) ;     _MN1       = _MN1_;
          C_BarNews_Base _W1_(        0,      Symbol(), PERIOD_W1) ;      _W1        = _W1_;
          C_BarNews_Base _D1_(        0,      Symbol(), PERIOD_D1) ;      _D1        = _D1_;
          C_BarNews_Base _H4_(        0,      Symbol(), PERIOD_H4) ;      _H4        = _H4_;
          C_BarNews_Base _H1_(        0,      Symbol(), PERIOD_H1) ;      _H1        = _H1_;
          C_BarNews_Base _M30_(       0,      Symbol(), PERIOD_M30) ;     _M30       = _M30_;
          C_BarNews_Base _M15_(       0,      Symbol(), PERIOD_M15) ;     _M15       = _M15_;
          C_BarNews_Base _M5_(        0,      Symbol(), PERIOD_M5) ;      _M5        = _M5_;
          C_BarNews_Base _M1_(        0,      Symbol(), PERIOD_M1) ;      _M1        = _M1_;   //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_BarNews_::Update()
{
//
          _CURRENT.Update();
          _MN1.Update();
          _W1.Update();
          _D1.Update();
          _H4.Update();
          _H1.Update();
          _M30.Update();
          _M15.Update();
          _M5.Update();
          _M1.Update();
          return true;//
///
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
