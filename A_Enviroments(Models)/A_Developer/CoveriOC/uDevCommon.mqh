//+------------------------------------------------------------------+
//||   ||||||||||            uDevCommon.mqh                         ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\B_MQL\uMqlCommon.mqh>
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class Cu_DevCommon
{         //------------------------------------------------
public:
          void            Cu_DevCommon() {};
          void           ~Cu_DevCommon() {};
          //------------------------------------------------
          Su_MqlCommon   MqlCommon;
          //------------------------------------------------
          bool           UPDATED;
          bool           Update()
          {         //---off gone Market update---
                    //
                    //-/-MqlCommon._Comment("Hello QuartzMVC");
                    //----------------------------------------------------------
                    if          (SystemTickCountLast < MqlCommon._GetTickCount())       {SystemTickCountLast = MqlCommon.GetTickCount_int;  Is_SystemTickNew = true;}
                    else                                                                {Is_SystemTickNew = false;}         //---off gone Market update---
                    //==========================================================
                    // SYS Timer Cheackup Start C_WINUSER32 App Enviroments<<<<|
                    //==========================================================
                    //
                    UPDATED = true;
                    return UPDATED;
                    //
                    //==========================================================
                    // SYS Timer Cheackup End C_WINUSER32 App Enviroments<<<<<<|
                    //==========================================================
          };
          //------------------------------------------------
          void           OnTick_();
//===================================================================

          uint           SystemTickCountLast;
          bool           Is_SystemTickNew;
//===================================================================//--- input parameters
          int            tiks_before;// = 500; // number of ticks till termination
          int            pips_to_go;// = 15; // distance in pips
          int            seconds_st;// = 50; // number of seconds given to the Expert Advisor

          datetime       launch_time;//--- globals
          int            tick_counter;// = 0;
//===================================================================
          void           Commenter();
//
};
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void Cu_DevCommon::OnTick_()
{         static double first_bid = 0.0;
          MqlTick       tick;
          double        distance;
          SymbolInfoTick(_Symbol, tick); tick_counter++;
          if(first_bid == 0.0) { launch_time = tick.time; first_bid = tick.bid; Print("first_bid =", first_bid); return; }
          distance = (tick.bid - first_bid) / _Point;                           //--- price distance in pips
//--- show a notification to track the EA operation
          string comm = "From the moment of start:\r\n\x25CF elapsed seconds: " +
                        IntegerToString(tick.time - launch_time) + " ;" +
                        "\r\n\x25CF ticks received: " + (string)tick_counter + " ;" +
                        "\r\n\x25CF price went in points: " + StringFormat("%G", distance);
          Comment(comm);
//==========================================================================================
          if(tick_counter >= tiks_before)               TerminalClose(0); //--- section for checking condition to close the terminal  // exit by tick counter
          if(distance > pips_to_go)                     TerminalClose(1);    // go up by the number of pips equal to pips_to_go
          if(distance < -pips_to_go)                    TerminalClose(-1);   // go down by the number of pips equal to pips_to_go
          if(tick.time - launch_time > seconds_st)      TerminalClose(100);  // termination by timeout
//==========================================================================================
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Cu_DevCommon::Commenter()
{
//--------------------------------------------------------------------
//--------------------------------------------------------------------
}


//+------------------------------------------------------------------+
//||   ||||||||||            uDevCommon.mqh                         ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
