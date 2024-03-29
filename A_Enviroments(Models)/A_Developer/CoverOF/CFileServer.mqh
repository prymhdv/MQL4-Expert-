//+------------------------------------------------------------------+
//||   ||||||||||       Sd_DATA_FILES_FOLDERS_DISK.mqh              ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
/*
If FILE_READ is specified, an attempt is made to open an existing file. If a file does not exist, file opening fails, a new file is not created.
•FILE_READ|FILE_WRITE – a new file is created if the file with the specified name does not exist.
•FILE_WRITE –  the file is created again with a zero size.
*/

#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(MQL4)\Include\Files\File.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(MQL4)\Include\Files\FileBin.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(MQL4)\Include\Files\FilePipe.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(MQL4)\Include\Files\FileTxt.mqh>
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOF\Cd_Files_Extend.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOF\Cd_FilesBin_Extend.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOF\Cd_FilesPipe_Extend.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOF\Cd_FilesTxt_Extend.mqh>
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
class CFileServer
{
public:
          CFileServer(void) {};
          CFileServer(string n) {name = n;};
          ~CFileServer(void) {};
          string name;
          //-----------------
          CFile                       File;
          CFileBin                    FileBin, FileBin2;
          CFilePipe                   FilePipe;
          CFileTxt                    FileTxt;

          Cd_Files_Extend             File_Extend;
          Cd_FilesBin_Extend          FileBin_Extend;
          Cd_FilesPipe_Extend         FilePipe_Extend;
          Cd_FilesTxt_Extend          FileTxt_Extend;

};
//+------------------------------------------------------------------+
