//+------------------------------------------------------------------+
//||   ||||||||||         Cs_DevCheckupClientMQL.mqh                ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\B_MQL\.B_MQL.mqh>
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class Cs_DevCheckupClientMQL
{
public:
          void                          Cs_DevCheckupClientMQL() { /*Alert("Deinit: ", __FUNCSIG__);*/};
          void                          ~Cs_DevCheckupClientMQL() { }
          bool                          Update() { _Mql_.Update();   return UPDATED = true; };
          bool                          UPDATED;
          Ss_MqlCheckupClientMQL        _Mql_;


};










//+------------------------------------------------------------------+
//||   ||||||||||         Cs_DevCheckupClientMQL.mqh                ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
