//+------------------------------------------------------------------+
//||   ||||||||||       St_CondicatorData_Indicators_MA.mqh         ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+

#ifndef TestMode
#define TestMode

#else
//#include <0srcCapitan\QuartsExperts\MyRoboTrader.mqh> //defien in cross
//#include <0srcCapitan\QuartsExperts\ConductorController.mqh>
//#include <0srcCapitan\QuartsExperts\ConductorController.mqh>///on
#endif
////////////////

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|             Class MyRoboTrader     BEGIN                         |
//+------------------------------------------------------------------+
class Ct_Inform
{
public:
          Ct_Inform();
          ~Ct_Inform();
          //=======================================================

          //UseFixedValues/////////////////////////////////////////////////////////////////////////////////////////
          ////datetime Ct_Inform::UseTimeframe;///wrong
          ///////////////////////////
          bool    CommentOxKeyRun;//
          string  CommentOx(bool KeyShowCommentV = false, bool KeyCommentDay = false, bool Run = false);
          string  StartingAllowX(bool & KeyRunMarketX, string result = " |Cheak|: "  );
          string  Report();
          string  TodayWeekMonthDesc();
          string  TodayDesc(); }; ///>>>> if not close error dclaring...

//+------------------------------------------------------------------+
//|             Class MyRoboTrader     IMPLANT                       |
//+------------------------------------------------------------------+
Ct_Inform::Ct_Inform(void)
{         RunCallFunction++;
          //Alert("Ct_Inform::Ct_Inform(void)");
          Utilities.Capitan_TestBarExisted();
          ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_Inform Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
Ct_Inform::~Ct_Inform()
{         if(Capitan_DeinitErrorCatching)________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_Inform Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
//
///
}
//+------------------------------------------------------------------+
//|                  CommentOx                                       |
//+------------------------------------------------------------------+
string Ct_Inform::CommentOx(bool KeyShowCommentV = false, bool KeyCommentDay = false, bool Run = false)      //1.1  ON SCREEN COMMENT VIEW BLOCK EVERY TICK
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_Inform Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          CommentOxKeyRun = KeyCommentDay;
          string CommentX, CommentXoff, result;
          string TimeLocalDesc = TimeToString( TimeLocal(), TIME_DATE | TIME_MINUTES | TIME_SECONDS ); //
          //=============================================================
          if (ObjectFind(0, "KeyShowComment") >= 0)KeyShowCommentV = ObjectGetInteger(0, "KeyShowComment", OBJPROP_STATE); //    = Chart1.UseButton2.State();//other way if cheaking///Button state (pressed / depressed)
          if (ObjectFind(0, "LabelPadD2") >= 0)KeyShowCommentV = (ObjectGetInteger(0, "LabelPadD2", OBJPROP_COLOR) == clrGold); //    = Chart1.UseButton2.State();//other way if cheaking///Button state (pressed / depressed)
          CommentXoff = "\n============<<--CommentXoff--" + TimeLocalDesc + ">>=============";
          CommentX    = "\n============<<--CommentX--" + TimeLocalDesc + ">>=============";
          long UseSpread = 0; //
          if(KeyShowCommentV == true && KeyCommentDay == true)
          {         //==============================================================================
                    //Alert("work");
                    int Bars2; ///all Bar on chart
                    UseSpread = SymbolInfoInteger(Symbol(), SYMBOL_SPREAD);
                    long Volume_Bar = iVolume(NULL, 0, 0);
                    string Volume_Bar_direction;
                    if((iVolume(NULL, 0, 0) > iVolume(NULL, 0, 3)))
                              Volume_Bar_direction = "Volume_Bar_direction Up";
                    else
                              Volume_Bar_direction = "Volume_Bar_direction Down";
                    Bars2 = Bars(NULL, 0, 0, TimeCurrent()); //D'2021.01.19 00:00'   int h=TimeHour(TimeCurrent());  TimeDay(Time[0])
                    long  Bars3 = ChartGetInteger(0, CHART_VISIBLE_BARS);
                    //Bars=SeriesInfoInteger(0,0,SERIES_BARS_COUNT);
                    datetime Daystart = iTime(NULL, PERIOD_D1, 0);
                    int Barstart = Bars(NULL, 0, Daystart, TimeCurrent());
                    //////////////
                    iTime(NULL, PERIOD_D1, 0);
                    iTime(NULL, PERIOD_M1, 0);  //PERIOD_M1   TimeCurrent()  int Seconds()
                    string Time2 = TimeToStr(TimeCurrent(), TIME_DATE | TIME_MINUTES | TIME_SECONDS); //TimeSeconds()  TimeCurrent()
                    //==================================================================================
                    //==================================================================================
                    CommentX = StringFormat("\n=======<<--CommentX--%s>>======="
                                            "\n ReportS:(%s)              "
                                            "\n Key(%s)                      "
                                            "\n Time Period= %i ||  Ask= %.2f Bid= %.2f "
                                            "\n Point_Size*10= One || pip=%G Spread=%i || Symbol=%s"
                                            "\n Timer_Bar=%s   "
                                            "\n  Volume_Bar= %G ||  Low10Vloume= %s          "
                                            "\n========================================="
                                            "\n All_visible_Bars on Chart = %i     Start_Day_Bars on Chart = %i "
                                            "\n             All_Bars on Chart = %i "
                                            "\n========================================="
                                            "\n AccountFreeMargin :%.2f "
                                            "\n::: MyRoboTrader!::::: Hello Pourya::: | Ping: % i "
                                            "\n========================================="
                                            "\n | CountOrderTotal =%i | CountBuyTotal =%i || CountSellTotal =%i "
                                            "\n | CountBuyMarket =%i  | CountSellMarket =%i "
                                            "\n | CountBuyStop =%i  | CountSellStop =%i "
                                            "\n | CountBuyLimit =%i | CountSellLimit =%i "
                                            "\n========================================="
                                            "\n | FastMA:%.2f   | SlowMA:%.2f "
                                            "\n | FastMA2X:%.2f | FastMA3X:%.2f "
                                            "\n | SlowMA2X:%.2f | SlowMA3X:%.2f "
                                            "\n | FastMAShifted:%.2f  | SlowMAShifted:%.2f "
                                            "\n | MA200:%.2f   | MA500:%.2f "
                                            "\n========================================="
                                            "\n | FastMA 123:%.2f  | FastMA 138:%.2f | FastMA 161:%.2f "
                                            "\n | FastMA 178:%.2f  | FastMA 200:%.2f | FastMA 261:%.2f "
                                            "\n | FastMA -123:%.2f | FastMA -138:%.2f| FastMA -161:%.2f "
                                            "\n | FastMA -178:%.2f | FastMA -200:%.2f| FastMA -261:%.2f "
                                            "\n========================================="
                                            ,
                                            TimeLocalDesc,
                                            Report(),
                                            StartingAllowX(ct_Drive.TDD.ct_Market_Symbol.Is_Running),
                                            Period(), Ask,
                                            Bid,
                                            _Point * 10,
                                            UseSpread,
                                            _Symbol,
                                            Time2,
                                            Volume_Bar,
                                            Volume_Bar_direction,
                                            Bars3,
                                            Barstart,
                                            Bars2,
                                            AccountFreeMargin(),
                                            Dev_Checkup_Terminal._Mql_.PING_LAST,
                                            ct_Drive.TDD.ct_Ticket.Counter._TotalAll,
                                            ct_Drive.TDD.ct_Ticket.Counter._BuyTotal,
                                            ct_Drive.TDD.ct_Ticket.Counter._SellTotal,
                                            ct_Drive.TDD.ct_Ticket.Counter._BuyMarket,
                                            ct_Drive.TDD.ct_Ticket.Counter._SellMarket,
                                            ct_Drive.TDD.ct_Ticket.Counter._BuyStop,
                                            ct_Drive.TDD.ct_Ticket.Counter._SellStop,
                                            ct_Drive.TDD.ct_Ticket.Counter._BuyLimit,
                                            ct_Drive.TDD.ct_Ticket.Counter._SellLimit,
                                            ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA._Data.Value_NULL_PeriodFast1X_0_MODE_EMA_PRICE_CLOSE_0,
                                            ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA._Data.Value_NULL_PeriodSlow1X_0_MODE_EMA_PRICE_CLOSE_0,
                                            ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA._Data.Value_NULL_PeriodFast2X_0_MODE_EMA_PRICE_CLOSE_0,
                                            ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA._Data.Value_NULL_PeriodFast3X_0_MODE_EMA_PRICE_CLOSE_0,
                                            ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA._Data.Value_NULL_PeriodSlow2X_0_MODE_EMA_PRICE_CLOSE_0,
                                            ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA._Data.Value_NULL_PeriodSlow3X_0_MODE_EMA_PRICE_CLOSE_0,
                                            ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA._Data.Value_NULL_0_8_EMA_FLine_Shift5_MODE_EMA_PRICE_CLOSE_DB5,
                                            ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA._Data.Value_NULL_0_24_EMA_FLine_Shift5_MODE_EMA_PRICE_CLOSE_DB5,
                                            ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA._Data.Value_NULL_0_200_8_MODE_EMA_PRICE_MEDIAN_0,
                                            ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA._Data.Value_NULL_0_500_8_MODE_EMA_PRICE_MEDIAN_0,
                                            ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA._Data.Value_NULL_PeriodFast1X_0_MODE_EMA_PRICE_CLOSE_0_level_123,
                                            ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA._Data.Value_NULL_PeriodFast1X_0_MODE_EMA_PRICE_CLOSE_0_level_138,
                                            ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA._Data.Value_NULL_PeriodFast1X_0_MODE_EMA_PRICE_CLOSE_0_level_161,
                                            ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA._Data.Value_NULL_PeriodFast1X_0_MODE_EMA_PRICE_CLOSE_0_level_178,
                                            ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA._Data.Value_NULL_PeriodFast1X_0_MODE_EMA_PRICE_CLOSE_0_level_200,
                                            ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA._Data.Value_NULL_PeriodFast1X_0_MODE_EMA_PRICE_CLOSE_0_level_261,
                                            ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA._Data.Value_NULL_PeriodFast1X_0_MODE_EMA_PRICE_CLOSE_0_level_0123,
                                            ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA._Data.Value_NULL_PeriodFast1X_0_MODE_EMA_PRICE_CLOSE_0_level_0138,
                                            ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA._Data.Value_NULL_PeriodFast1X_0_MODE_EMA_PRICE_CLOSE_0_level_0161,
                                            ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA._Data.Value_NULL_PeriodFast1X_0_MODE_EMA_PRICE_CLOSE_0_level_0178,
                                            ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA._Data.Value_NULL_PeriodFast1X_0_MODE_EMA_PRICE_CLOSE_0_level_0200,
                                            ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA._Data.Value_NULL_PeriodFast1X_0_MODE_EMA_PRICE_CLOSE_0_level_0261
                                           );       ///direct lines
                    result = CommentX ; //
          }
          else if(KeyShowCommentV == true)
          {         CommentXoff = StringFormat("\n=======<<--CommentXoff--%s>>======= "
                                               "\n ReportS:(%s)                "
                                               "\n Key(%s)                         "
                                               "\n Time Period = %i  Ask =% .2f Bid = %.2f "
                                               "\n Point_Size*10 = One pip = %G Spread =%i Symbol =%s"
                                               "\n========================================="
                                               "\n AccountFreeMargin :%.2f "
                                               "\n::: MyRoboTrader!::::: Hello Pourya::: | Ping:%i "
                                               "\n========================================="
                                               "\n | CountOrderTotal =%i | CountBuyTotal =%i || CountSellTotal =%i "
                                               "\n | CountBuyMarket =%i  | CountSellMarket =%i "
                                               "\n | CountBuyStop =%i  | CountSellStop =%i "
                                               "\n | CountBuyLimit =%i | CountSellLimit =%i "
                                               "\n========================================="
                                               "\n | FastMA:%.2f   | SlowMA:%.2f "
                                               "\n | FastMA2X:%.2f | FastMA3X:%.2f "
                                               "\n | SlowMA2X:%.2f | SlowMA3X:%.2f "
                                               "\n | FastMAShifted: % .2f  | SlowMAShifted:%.2f "
                                               "\n | MA200:%.2f   | MA500:%.2f "
                                               "\n========================================="
                                               "\n | FastMA 123:%.2f  | FastMA 138:%.2f | FastMA 161:%.2f "
                                               "\n | FastMA 178:%.2f  | FastMA 200:%.2f | FastMA 261:%.2f "
                                               "\n | FastMA -123:%.2f | FastMA -138:%.2f| FastMA -161:%.2f "
                                               "\n | FastMA -178:%.2f | FastMA -200:%.2f| FastMA -261:%.2f "
                                               "\n=========================================",
                                               TimeLocalDesc,
                                               Report(),
                                               StartingAllowX(ct_Drive.TDD.ct_Market_Symbol.Is_Running),
                                               Period(),
                                               Ask,
                                               Bid,
                                               _Point * 10,
                                               UseSpread,
                                               _Symbol,
                                               AccountFreeMargin(),
                                               Dev_Checkup_Terminal._Mql_.PING_LAST,
                                               ct_Drive.TDD.ct_Ticket.Counter._TotalAll,
                                               ct_Drive.TDD.ct_Ticket.Counter._BuyTotal,
                                               ct_Drive.TDD.ct_Ticket.Counter._SellTotal,
                                               ct_Drive.TDD.ct_Ticket.Counter._BuyMarket,
                                               ct_Drive.TDD.ct_Ticket.Counter._SellMarket,
                                               ct_Drive.TDD.ct_Ticket.Counter._BuyStop,
                                               ct_Drive.TDD.ct_Ticket.Counter._SellStop,
                                               ct_Drive.TDD.ct_Ticket.Counter._BuyLimit,
                                               ct_Drive.TDD.ct_Ticket.Counter._SellLimit,
                                               ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA._Data.Value_NULL_PeriodFast1X_0_MODE_EMA_PRICE_CLOSE_0,
                                               ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA._Data.Value_NULL_PeriodSlow1X_0_MODE_EMA_PRICE_CLOSE_0,
                                               ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA._Data.Value_NULL_PeriodFast2X_0_MODE_EMA_PRICE_CLOSE_0,
                                               ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA._Data.Value_NULL_PeriodFast3X_0_MODE_EMA_PRICE_CLOSE_0,
                                               ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA._Data.Value_NULL_PeriodSlow2X_0_MODE_EMA_PRICE_CLOSE_0,
                                               ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA._Data.Value_NULL_PeriodSlow3X_0_MODE_EMA_PRICE_CLOSE_0,
                                               ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA._Data.Value_NULL_0_8_EMA_FLine_Shift5_MODE_EMA_PRICE_CLOSE_DB5,
                                               ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA._Data.Value_NULL_0_24_EMA_FLine_Shift5_MODE_EMA_PRICE_CLOSE_DB5,
                                               ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA._Data.Value_NULL_0_200_8_MODE_EMA_PRICE_MEDIAN_0,
                                               ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA._Data.Value_NULL_0_500_8_MODE_EMA_PRICE_MEDIAN_0,
                                               ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA._Data.Value_NULL_PeriodFast1X_0_MODE_EMA_PRICE_CLOSE_0_level_123,
                                               ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA._Data.Value_NULL_PeriodFast1X_0_MODE_EMA_PRICE_CLOSE_0_level_138,
                                               ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA._Data.Value_NULL_PeriodFast1X_0_MODE_EMA_PRICE_CLOSE_0_level_161,
                                               ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA._Data.Value_NULL_PeriodFast1X_0_MODE_EMA_PRICE_CLOSE_0_level_178,
                                               ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA._Data.Value_NULL_PeriodFast1X_0_MODE_EMA_PRICE_CLOSE_0_level_200,
                                               ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA._Data.Value_NULL_PeriodFast1X_0_MODE_EMA_PRICE_CLOSE_0_level_261,
                                               ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA._Data.Value_NULL_PeriodFast1X_0_MODE_EMA_PRICE_CLOSE_0_level_0123,
                                               ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA._Data.Value_NULL_PeriodFast1X_0_MODE_EMA_PRICE_CLOSE_0_level_0138,
                                               ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA._Data.Value_NULL_PeriodFast1X_0_MODE_EMA_PRICE_CLOSE_0_level_0161,
                                               ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA._Data.Value_NULL_PeriodFast1X_0_MODE_EMA_PRICE_CLOSE_0_level_0178,
                                               ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA._Data.Value_NULL_PeriodFast1X_0_MODE_EMA_PRICE_CLOSE_0_level_0200,
                                               ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA._Data.Value_NULL_PeriodFast1X_0_MODE_EMA_PRICE_CLOSE_0_level_0261
                                              );
                    result = CommentXoff ;//
          }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_Inform Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return result;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string Ct_Inform::StartingAllowX(bool & KeyRunMarketX, string result = " |Cheak|: "  )
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_Inform Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          //==========================================================
          //ENUM_DAY_OF_WEEK SUNDAY, MONDAY, TUESDAY, WEDNESDAY, THURSDAY, FRIDAY, SATURDAY;
          //Alert( TimeLocal() == (SUNDAY || TimeLocal() == SATURDAY));
          //Alert( TimeLocal());
          //---------------------------------------------------------------------
          //if((GetLastError() == 132) || (GetLastError() == 133)) return;
          if((GetLastError() == 132) || (GetLastError() == 133))________________________________________________________Xerorr.SuperviserX(_LastError, "-ERR_TRADE_DISABLED||ERR_MARKET_CLOSED",  __LINE__, __FUNCTION__);
          //==================================================================================================================================
          {         //Call with MqlDateTime type parameter
                    datetime MqlDateTimeX = TimeLocal( ); // Variable of structure type  MqlDateTime &  dt_struct
          }
          int TheDaySelext = -1;
          if(0)
          {         Alert("DayOfWeekNumber: " + (string)Dev_Calender.WeekDayNumber);
                    Alert("DayOfWeekNumber: " + (string)Dev_Calender.WeekDayNumber + "_SUNDAY 0:"    + (string)(SUNDAY          == 0) + (string)(SUNDAY));
                    Alert("DayOfWeekNumber: " + (string)Dev_Calender.WeekDayNumber + "_MONDAY 1:"    + (string)(MONDAY          == 1) + (string)(MONDAY));
                    Alert("DayOfWeekNumber: " + (string)Dev_Calender.WeekDayNumber + "_TUESDAY 2:"   + (string)(TUESDAY         == 2) + (string)(TUESDAY));
                    Alert("DayOfWeekNumber: " + (string)Dev_Calender.WeekDayNumber + "_WEDNESDAY 3:" + (string)(WEDNESDAY       == 3) + (string)(WEDNESDAY));
                    Alert("DayOfWeekNumber: " + (string)Dev_Calender.WeekDayNumber + "_THURSDAY 4:"  + (string)(THURSDAY        == 4) + (string)(THURSDAY));
                    Alert("DayOfWeekNumber: " + (string)Dev_Calender.WeekDayNumber + "_FRIDAY 5:"    + (string)(FRIDAY          == 5) + (string)(FRIDAY));
                    Alert("DayOfWeekNumber: " + (string)Dev_Calender.WeekDayNumber + "_SATURDAY 6:"  + (string)(SATURDAY        == 6) + (string)(SATURDAY)); Sleep(30000); }
          if(0)
          {         switch (Dev_Calender.WeekDayNumber)
                    {         case 0: {TheDaySelext = (int)SUNDAY;    Alert("SUNDAY: "      + (string)TheDaySelext); Sleep(10);} break;
                              case 1: {TheDaySelext = (int)MONDAY;    Alert("MONDAY: "      + (string)TheDaySelext); Sleep(30000);} break;
                              case 2: {TheDaySelext = (int)TUESDAY;   Alert("TUESDAY: "     + (string)TheDaySelext); Sleep(30000);} break;
                              case 3: {TheDaySelext = (int)WEDNESDAY; Alert("WEDNESDAY: "   + (string)TheDaySelext); Sleep(30000);} break;
                              case 4: {TheDaySelext = (int)THURSDAY;  Alert("THURSDAY: "    + (string)TheDaySelext); Sleep(30000);} break;
                              case 5: {TheDaySelext = (int)FRIDAY;    Alert("FRIDAY: "      + (string)TheDaySelext); Sleep(30000);} break;
                              case 6: {TheDaySelext = (int)SATURDAY;  Alert("SATURDAY: "    + (string)TheDaySelext); Sleep(30000);} break; //
                    }//
          }
          //============================//============================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_Inform Error",  __LINE__, __FUNCTION__); //
          //============================//============================
          //================================================================================================================
          int ErrorMode = 0;
          if(Dev_Calender.OffDayTimeSymbol)             {result = "OffDayTimeSymbol/"                   ; ErrorMode++;}
          if(Dev_Calender.OffDayTimeLocal)              {result = result + "OffDayTimeLocal/"           ; ErrorMode++;}
          //if(OFFDayCurrentLocal)              {result = result + "OFFDayCurrentLocal/"        ; ErrorMode++;}
          if(!ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_TRADEALLOWED)             {result = result + "Symbol TRADEALLOWED/"       ; ErrorMode++;}
          if(!Dev_Checkup_Terminal._Mql_.CONNECTED)               {result = result + "Dev_Checkup_Terminal._Mql_.CONNECTED/"        ; ErrorMode++;}
          if(!Dev_Checkup_Terminal._Mql_.TRADE_ALLOWED)           {result = result + "Dev_Checkup_Mql._Mql_.TRADE_ALLOWED/"    ; ErrorMode++;}
          if(!Dev_Checkup_Mql._Mql_.TRADE_ALLOWED)                {result = result + "Dev_Checkup_Mql._Mql_.TRADE_ALLOWED/"         ; ErrorMode++;}
          result +=  "\n ErrorMode: " + (string)ErrorMode + " Conditions " + "|erorrCounting:" + (string)________________________________________________________Xerorr.__Count__;
          ///
          bool KeyError = Dev_Checkup_Mql._Mql_.TRADE_ALLOWED && Dev_Checkup_Terminal._Mql_.TRADE_ALLOWED && Dev_Checkup_Terminal._Mql_.CONNECTED && ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_TRADEALLOWED  && (!Dev_Calender.OffDayTimeLocal) ;
          if(KeyError)
          {         switch(Dev_Calender.WeekDayNumber)
                    {         case 0:   result = "_Allowed_Successfull_" + (string)Dev_Calender.WeekDayNumber + " SUNDAY " ; break;
                              case 1:   result = "_Allowed_Successfull_" + (string)Dev_Calender.WeekDayNumber + " MONDAY "; break;
                              case 2:   result = "_Allowed_Successfull_" + (string)Dev_Calender.WeekDayNumber + " TUESDAY "; break;
                              case 3:   result = "_Allowed_Successfull_" + (string)Dev_Calender.WeekDayNumber + " WEDNESDAY " ; break;
                              case 4:   result = "_Allowed_Successfull_" + (string)Dev_Calender.WeekDayNumber + " THURSDAY " ; break;
                              case 5:   result = "_Allowed_Successfull_" + (string)Dev_Calender.WeekDayNumber + " FRIDAY " ; break;
                              case 6:   result = "_Allowed_Successfull_" + (string)Dev_Calender.WeekDayNumber + " SATURDAY " ; break; //
                    }
                    //Alert("(2314)-"+result);
          }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_Inform Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return result;  //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string Ct_Inform::Report()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_Inform Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          string   ReportS  ;
          for(int pos = 0; OrdersTotal() > pos; pos++)
                    if(OrderSelect(pos, SELECT_BY_POS))
                    {         string OrderOrderType;
                              switch(OrderType())
                              {         case 0: OrderOrderType = "OP_BUY"; break;
                                        case 1: OrderOrderType = "OP_SELL" ; break;
                                        case 2: OrderOrderType = "OP_BUYLIMIT" ; break;
                                        case 3: OrderOrderType = "OP_BUYSTOP"; break;
                                        case 4: OrderOrderType = "OP_SELLLIMIT"; break;
                                        case 5: OrderOrderType = "OP_SELLSTOP"; break; }
                              ReportS = ("   OrderTicket: " + (string)OrderTicket() + " OrderOrderType: " + OrderOrderType);
                              Print(ReportS); }
          //Print(ErrorDescription(GetLastError()) + "_" + (string)GetLastError() + " Report() line 32");
          ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_Inform Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return ReportS;//
}
//+------------------------------------------------------------------+
string  Ct_Inform::TodayWeekMonthDesc()
{         //==========================================================
          string resultDay = "free day";
          string resultMonth = "free month";
          //ENUM_DAY_OF_WEEK theDay
          int TimeLocalDayOfWeek        = TimeDayOfWeek(TimeLocal());
          int TimeServerDayOfWeek       = DayOfWeek();//
          Dev_Calender.WeekDayNumber  = DayOfWeek();;///of the last known server time..
          int TimeLocalDayOfMonth       = TimeDay(TimeLocal());
          int TimeLocalMonthOfYear      = TimeMonth(TimeLocal());
          //==========================================================
          switch(TimeLocalDayOfWeek)//Dev_Calender.WeekDayNumber
          {         case 0:   resultDay = " SUNDAY "    ; break;
                    case 1:   resultDay = " MONDAY "    ; break;
                    case 2:   resultDay = " TUESDAY "   ; break;
                    case 3:   resultDay = " WEDNESDAY " ; break;
                    case 4:   resultDay = " THURSDAY "  ; break;
                    case 5:   resultDay = " FRIDAY "    ; break;
                    case 6:   resultDay = " SATURDAY "  ; break; //
          } //
          /*The Gregorian calendar consists of the following 12 months:
                    January - 31 days
                    February - 28 days in a common year and 29 days in leap years
                    March - 31 days
                    April - 30 days
                    May - 31 days
                    June - 30 days
                    July - 31 days
                    August - 31 days
                    September - 30 days
                    October - 31 days
                    November - 30 days
                    December - 31 days
                    */
          switch(TimeLocalMonthOfYear)//Dev_Calender.WeekDayNumber
          {         case 1:   resultMonth = " Jan "    ; break;
                    case 2:   resultMonth = " Feb "   ; break;
                    case 3:   resultMonth = " Mar " ; break;
                    case 4:   resultMonth = " Apr "  ; break;
                    case 5:   resultMonth = " May "    ; break;
                    case 6:   resultMonth = " Jun "  ; break; //
                    case 7:   resultMonth = " Jul "    ; break;
                    case 8:   resultMonth = " Aug "   ; break;
                    case 9:   resultMonth = " Sep " ; break;
                    case 10:  resultMonth = " Oct "  ; break;
                    case 11:  resultMonth = " Nov "    ; break;
                    case 12:  resultMonth = " Dec "  ; break; //
          } //
          //Alert("TimeLocalDayOfWeek: ", result, "---TimeServerDayOfWeek: ", TimeServerDayOfWeek);
          //==========================================================
          return resultMonth + (string)TimeLocalDayOfMonth + resultDay ; //
          //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string  Ct_Inform::TodayDesc()
{         //==========================================================
          string resultDay = "free day";
          //ENUM_DAY_OF_WEEK theDay
          int TimeLocalDayOfWeek        = TimeDayOfWeek(TimeLocal());
          int TimeServerDayOfWeek       = DayOfWeek();//
          Dev_Calender.WeekDayNumber  = DayOfWeek();;///of the last known server time..
          //==========================================================
          switch(TimeLocalDayOfWeek)//Dev_Calender.WeekDayNumber
          {         case 0:   resultDay = " SUNDAY "    ; break;
                    case 1:   resultDay = " MONDAY "    ; break;
                    case 2:   resultDay = " TUESDAY "   ; break;
                    case 3:   resultDay = " WEDNESDAY " ; break;
                    case 4:   resultDay = " THURSDAY "  ; break;
                    case 5:   resultDay = " FRIDAY "    ; break;
                    case 6:   resultDay = " SATURDAY "  ; break; //
          } //
          //Alert("TimeLocalDayOfWeek: ", result, "---TimeServerDayOfWeek: ", TimeServerDayOfWeek);
          //==========================================================
          return resultDay ; //
          //
}

//======================================================================================================
//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
//======================================================================================================
//+------------------------------------------------------------------+
//|             Class Ct_Inform     BEGIN-END                 |
//+------------------------------------------------------------------+
