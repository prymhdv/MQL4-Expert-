//+------------------------------------------------------------------+
//||   ||||||||||       Sd_DATA_FILES_FOLDERS_DISK.mqh              ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(MQL4)\Include\Files\File.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(MQL4)\Include\Files\FileBin.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(MQL4)\Include\Files\FilePipe.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(MQL4)\Include\Files\FileTxt.mqh>
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
class Cd_FilesBin_Extend: public CFileBin
{
public:
          Cd_FilesBin_Extend(void) {};
          ~Cd_FilesBin_Extend(void) {};
          void Set(  string name, int flags) {    m_name = name;  m_flags =   flags; }
          //
};