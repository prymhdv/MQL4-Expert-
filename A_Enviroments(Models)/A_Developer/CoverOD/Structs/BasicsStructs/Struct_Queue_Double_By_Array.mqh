//+------------------------------------------------------------------+
//||   ||||||||||       Sd_DATA_FILES_FOLDERS_DISK.mqh              ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
template<typename t>
struct CDSQueue_Double_By_Array_Node
{         CDSQueue_Double_By_Array_Node() {}:
          ~CDSQueue_Double_By_Array_Node() {};
          t items [2];
          t stat_array[3];
          int  fornt ;
          int  rear;
          //
};
