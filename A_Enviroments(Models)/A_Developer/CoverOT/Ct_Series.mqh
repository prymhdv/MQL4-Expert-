//+------------------------------------------------------------------+
//||   ||||||||||       St_CondicatorData_Indicators_MA.mqh         ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\B_MQL\CoverOT\tMqlSeries.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOAC\Std_Bar_Info.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOAC\Stc_Bar_Info.mqh>
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class Ct_Series  
{
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
public:
          void           Ct_Series() {/*Alert("Ct_Series:: Ct_Series()");*/};
          void          ~Ct_Series() {};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
public:
          Ct_MqlSeries   MQL;
          Std_Bar_Info   Candels[];
          //---------------------------------------------------------
         
          ///
          void          Sample();
          void          Sample2();
          //===================================================================
          datetime      Candel_0_Time_PERIOD_M1;
          //
          bool          Ct_Series::Update()
          {         ct_Series_Base.RefreshRate();;
                    //----------------------------
                    Candel_0_Time_PERIOD_M1 = iTime(Symbol(), PERIOD_M1, 0);
                    //----------------------------
                    return true;//
          }//
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Ct_Series::Sample()
{         datetime TimeAsSeries[];
//--- set access to the array like to a timeseries
          ArraySetAsSeries(TimeAsSeries, true);
          ResetLastError();
          int copied = CopyTime(NULL, 0, 0, 10, TimeAsSeries);
          if(copied <= 0)
          {         Print("The copy operation of the open time values for last 10 bars has failed");
                    return; }
          Print("TimeCurrent =", TimeCurrent());
          Print("ArraySize(Time) =", ArraySize(TimeAsSeries));
          int size = ArraySize(TimeAsSeries);
          for(int i = 0; i < size; i++)
          {         Print("TimeAsSeries[" + (string)i + "] =", TimeAsSeries[i]); }
          datetime ArrayNotSeries[];
          ArraySetAsSeries(ArrayNotSeries, false);
          ResetLastError();
          copied = CopyTime(NULL, 0, 0, 10, ArrayNotSeries);
          if(copied <= 0)
          {         Print("The copy operation of the open time values for last 10 bars has failed");
                    return; }
          size = ArraySize(ArrayNotSeries);
          for(int i = size - 1; i >= 0; i--)
          {         Print("ArrayNotSeries[" + (string)i + "] =", ArrayNotSeries[i]); } //
          /*
          TimeCurrent = 2009.06.11 14:16:23
          ArraySize(Time) = 10
          TimeAsSeries[0] = 2009.06.11 14:00:00
          TimeAsSeries[1] = 2009.06.11 13:00:00
          TimeAsSeries[2] = 2009.06.11 12:00:00
          TimeAsSeries[3] = 2009.06.11 11:00:00
          TimeAsSeries[4] = 2009.06.11 10:00:00
          TimeAsSeries[5] = 2009.06.11 09:00:00
          TimeAsSeries[6] = 2009.06.11 08:00:00
          TimeAsSeries[7] = 2009.06.11 07:00:00
          TimeAsSeries[8] = 2009.06.11 06:00:00
          TimeAsSeries[9] = 2009.06.11 05:00:00

          ArrayNotSeries[9] = 2009.06.11 14:00:00
          ArrayNotSeries[8] = 2009.06.11 13:00:00
          ArrayNotSeries[7] = 2009.06.11 12:00:00
          ArrayNotSeries[6] = 2009.06.11 11:00:00
          ArrayNotSeries[5] = 2009.06.11 10:00:00
          ArrayNotSeries[4] = 2009.06.11 09:00:00
          ArrayNotSeries[3] = 2009.06.11 08:00:00
          ArrayNotSeries[2] = 2009.06.11 07:00:00
          ArrayNotSeries[1] = 2009.06.11 06:00:00
          ArrayNotSeries[0] = 2009.06.11 05:00:00
          */
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Ct_Series::Sample2()
{         MqlRates rates[];
          ArraySetAsSeries(rates, true);
          int copied = CopyRates(Symbol(), 0, 0, 100, rates);
          if(copied > 0)
          {         Print("Bars copied: " + (string)copied);
                    string format = "open = %G, high = %G, low = %G, close = %G, volume = %d";
                    string out;
                    int size = fmin(copied, 10);
                    for(int i = 0; i < size; i++)
                    {         out = (string)i + ":" + TimeToString(rates[i].time);
                              out = out + " " + StringFormat(format,
                                                             rates[i].open,
                                                             rates[i].high,
                                                             rates[i].low,
                                                             rates[i].close,
                                                             rates[i].tick_volume);
                              Print(out); } //
          } //
          else Print("Failed to get history data for the symbol ", Symbol()); //
}

//+------------------------------------------------------------------+
//||   ||||||||||            uDevSeries.mqh                         ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
