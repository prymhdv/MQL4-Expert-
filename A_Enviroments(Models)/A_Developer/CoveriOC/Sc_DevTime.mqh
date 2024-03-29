//+------------------------------------------------------------------+
//||   ||||||||||                 Sc_DevTime.mqh                    ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
struct Sc_DevTime
{
public:
//=============================================
          double         TimeGMTOffsetXX;
          float          TimeGMTOffsetXXCurrect;
          int            TimeGMTOffsetX;
          MqlDateTime    TimeGMTXPM;
          datetime       TimeGMTX;
          float          TimeDaylightSavingsX ;
          string         prevTimeString; //>>>>>>>>>.unresolved static variable '-C_STATICSUN-::prevTime'
          datetime       prevTime; ///<<<<<<<<<<caused Unsolved if not set valuse in globals of class<<<<
          datetime       myTime;
          datetime       localtime;
          int            timeOffset;
          datetime       ServerLocalOffset;
//=============================================
          void Sc_DevTime()
          {         TimeGMTOffsetXX             = (float)TimeGMT() - (float)TimeLocal();        // Alert(TimeGMTOffsetXX / (60 * 60), " TimeGMTOffsetXX","-Line:",__LINE__);
                    TimeGMTOffsetXXCurrect      = (float)TimeGMT() - (float)TimeCurrent();      // Alert(TimeGMTOffsetXXCurrect / (60 * 60), " TimeGMTOffsetXXCurrect","-Line:",__LINE__);
                    TimeGMTOffsetX              = TimeGMTOffset();                              //Alert(TimeGMTOffsetX, " TimeGMTOffsetX","-Line:",__LINE__);
                    TimeGMTX                    = TimeGMT(TimeGMTXPM);                                    // Alert(TimeGMTX, " TimeGMTX","-Line:",__LINE__);
                    TimeDaylightSavingsX        = (float)TimeDaylightSavings();                 // Alert(TimeDaylightSavingsX / (60 * 60), " TimeDaylightSavingsX","-Line:",__LINE__);
                    prevTimeString              = ""; ///<<<<<<<<<<caused Unsolved if not set valuse in globals of class<<<<
                    prevTime                    = -1; //>>>>>>>>>.unresolved static variable '-C_STATICSUN-::prevTime'
                    myTime                      = -1;
                    localtime                   = -1;
                    timeOffset                  = -1; //
          }

}; Sc_DevTime DevTime;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+




//+------------------------------------------------------------------+
//||   ||||||||||                 Sc_DevTime.mqh                    ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+