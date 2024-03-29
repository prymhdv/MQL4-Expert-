//+------------------------------------------------------------------+
//||   ||||||||||            tDevMarketSymbol.mqh                   ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\B_MQL\sMql_DateTime.mqh>
//+------------------------------------------------------------------+
//|             Class MyRoboTrader     BEGIN                         |
//+------------------------------------------------------------------+
class Cs_DevCalender
{
public:
          void                   Cs_DevCalender() {/*Alert("Cs_DevCalender::Cs_DevCalender()");*/};
          void                   ~Cs_DevCalender() {};
          Ss_Mql_DateTime         _Mql_;//---DRIVE OR BE MEMBER TO ACCESS

          int                    LastSeccund;
//===================================================================
          bool                   ServerLocalDiff;                 // = TimeCurrent() != TimeLocal();//Returns the local time of a computer,
//===================================================================
          bool                   IsSATURDAY_Local;
          bool                   IsSUNDAY_Local;
          bool                   IsMONDAY_Local;
          bool                   IsTUESDAY_Local;
          bool                   IsWEDNESDAY_Local;
          bool                   IsTHURSDAY_Local;
          bool                   IsFRIDAY_Local;
//===================================================================
          bool                   IsSATURDAY_GMT;
          bool                   IsSUNDAY_GMT;
          bool                   IsMONDAY_GMT;
          bool                   IsTUESDAY_GMT;
          bool                   IsWEDNESDAY_GMT;
          bool                   IsTHURSDAY_GMT;
          bool                   IsFRIDAY_GMT;
//===================================================================
          bool                   IsSATURDAY_Current;
          bool                   IsSUNDAY_Current;
          bool                   IsMONDAY_Current;
          bool                   IsTUESDAY_Current;
          bool                   IsWEDNESDAY_Current;
          bool                   IsTHURSDAY_Current;
          bool                   IsFRIDAY_Current;
//===================================================================
          bool                   OffDayTimeLocal;//
          bool                   OffDayTimeGMT;//
          bool                   OffDayTimeCurrent;//Server;//;
          bool                   OffDayTimeSymbol;
          bool                   KeyOffDayCandel;
          bool                   OffDayTime;
//===================================================================_TimeLocal
          string                 DayOfWeek_Desc(datetime time);
          string                 DayOfMonth_Desc(datetime time);
          string                 TimeCurrentDec;
          string                 TimeLocalDec;
          int                    YearOfDateNumber; //number of year for Symbol
          int                    MonthOfYearNumber; //number of monthe for Symbol
          int                    DayOfYearNumber ; ///number of Year for Symbol
          int                    WeekDayNumber; ///number of week for Symbol
          int                    SecondsOfPERIOD; ///number of Second for PERIOD Symbol  (PeriodSeconds(PERIOD_M1)
//===================================================================
          bool Cs_DevCalender::Update(datetime SymbolTIME)// ct_Market_Symbol._Mql_.Symbol_TIME;
          {
//===================================================================
                    //================================
                    LastSeccund                     = _Mql_._Seconds_ = Seconds(); //---OR Seconds())
                    ServerLocalDiff                 = TimeCurrent() != TimeLocal();//Returns the local time of a computer,
                    //================================
                    IsSATURDAY_Local                = TimeDayOfWeek(TimeLocal()) == SATURDAY;
                    IsSUNDAY_Local                  = TimeDayOfWeek(TimeLocal()) == SUNDAY;
                    IsMONDAY_Local                  = TimeDayOfWeek(TimeLocal()) == MONDAY;
                    IsTUESDAY_Local                 = TimeDayOfWeek(TimeLocal()) == TUESDAY;
                    IsWEDNESDAY_Local               = TimeDayOfWeek(TimeLocal()) == WEDNESDAY;
                    IsTHURSDAY_Local                = TimeDayOfWeek(TimeLocal()) == THURSDAY;
                    IsFRIDAY_Local                  = TimeDayOfWeek(TimeLocal()) == FRIDAY;
                    //================================
                    IsSATURDAY_GMT                  = TimeDayOfWeek(TimeGMT()) == SATURDAY;
                    IsSUNDAY_GMT                    = TimeDayOfWeek(TimeGMT()) == SUNDAY;
                    IsMONDAY_GMT                    = TimeDayOfWeek(TimeGMT()) == MONDAY;
                    IsTUESDAY_GMT                   = TimeDayOfWeek(TimeGMT()) == TUESDAY;
                    IsWEDNESDAY_GMT                 = TimeDayOfWeek(TimeGMT()) == WEDNESDAY;
                    IsTHURSDAY_GMT                  = TimeDayOfWeek(TimeGMT()) == THURSDAY;
                    IsFRIDAY_GMT                    = TimeDayOfWeek(TimeGMT()) == FRIDAY;
                    //================================
                    IsSATURDAY_Current              = TimeDayOfWeek(TimeCurrent()) == SATURDAY;
                    IsSUNDAY_Current                = TimeDayOfWeek(TimeCurrent()) == SUNDAY;
                    IsMONDAY_Current                = TimeDayOfWeek(TimeCurrent()) == MONDAY;
                    IsTUESDAY_Current               = TimeDayOfWeek(TimeCurrent()) == TUESDAY;
                    IsWEDNESDAY_Current             = TimeDayOfWeek(TimeCurrent()) == WEDNESDAY;
                    IsTHURSDAY_Current              = TimeDayOfWeek(TimeCurrent()) == THURSDAY;
                    IsFRIDAY_Current                = TimeDayOfWeek(TimeCurrent()) == FRIDAY;
                    //================================
                    OffDayTimeLocal                 = ( IsSATURDAY_Local || IsSUNDAY_Local) ;//must return true
                    OffDayTimeGMT                   = ( IsSATURDAY_GMT || IsSUNDAY_GMT) ;//must return true
                    OffDayTimeCurrent               = ( IsSATURDAY_Current || IsSUNDAY_Current) ;//must return true
                    //================================
                    YearOfDateNumber                = TimeYear(TimeLocal()); //if(Year()==2006 && Month()<5)
                    MonthOfYearNumber               = TimeMonth(TimeLocal());
                    DayOfYearNumber                 = TimeDayOfYear(TimeLocal()); ///number of week for Symbol
                    WeekDayNumber                   = TimeDayOfWeek(TimeLocal()); ///number of week for Symbol
                    SecondsOfPERIOD                 = PeriodSeconds(PERIOD_M1);//
                    //================================
                    TimeCurrentDec                  = TimeToStr(TimeCurrent(), TIME_DATE | TIME_MINUTES | TIME_SECONDS);
                    TimeLocalDec                    = TimeToStr(TimeLocal(), TIME_DATE | TIME_MINUTES | TIME_SECONDS);
                    //================================
                    ENUM_DAY_OF_WEEK SymbolTIME_Day = ENUM_DAY_OF_WEEK(TimeDayOfWeek(SymbolTIME));
                    //SYMBOL_TIME Time of the last quote datetime
                    OffDayTimeSymbol                = (SymbolTIME_Day == SATURDAY) || (SymbolTIME_Day == SUNDAY) ;
                    if(IsConnected())                 { OffDayTimeCurrent     = ( TimeCurrent() != iTime(Symbol(), PERIOD_M1, 0) ); }
                    //MqlDateTime&  dt_struct      // Variable of structure type); };
                    //================================
                    return true;//
          }

};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string Cs_DevCalender::DayOfWeek_Desc(datetime time)
{         //
          switch(TimeDayOfWeek(time))
          {         case 0 : return "Sunday";
                    case 1 : return "Monday";
                    case 2 : return "Tuesday";
                    case 3 : return "Wednesday";//
                    case 4 : return "Thursday";//
                    case 5 : return "Friday";//
                    case 6 : return "Saturday";//
          } //
          return"none";
//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string Cs_DevCalender::DayOfMonth_Desc(datetime time)
{         //
          switch(TimeDayOfWeek(time))
          {         case 0 :    return "Jan";
                    case 1 :    return "Feb";
                    case 2 :    return "Mar";
                    case 3 :    return "Apr";//
                    case 4 :    return "May";//
                    case 5 :    return "Jun";//
                    case 6 :    return "Jul";//
                    case 7 :    return "Aug";//
                    case 8 :    return "Sep";//
                    case 9 :    return "Oct";//
                    case 10 :   return "Nov";//
                    case 11 :   return "Dec";//
          } //
          return"none";
//
}
//+------------------------------------------------------------------+
//||   ||||||||||            tDevMarketSymbol.mqh                   ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
