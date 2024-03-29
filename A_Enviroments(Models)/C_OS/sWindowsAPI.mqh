//+------------------------------------------------------------------+
//|                                                 C_WINDOWSAPI.mqh |
//|                                                    A pourya 2021 |
//|                                                @prymhdvgmail.com |
//+------------------------------------------------------------------+
#property copyright "A pourya 2021"
#property link      "@prymhdvgmail.com"
#property version   "1.00"
#property strict


///Windows Apps Win32 Get Started Get Started with Win32 and C++   /////#import  "user32.dll"
//
//DLL                 Description of Contents
//GDI32.dll           Graphics Device Interface (GDI) functions for device output, such as those for drawing and font management.
//Kernel32.dll        Low - level operating system functions for memory management and resource handling.
//User32.dll          Windows management functions for message handling, timers, menus, and communications.
///==========================================================================================
//How can I see the functions in a DLL?
//Use dumpbin command-line.
//dumpbin /IMPORTS <path-to-file> should provide the function imported into that DLL.
//dumpbin /EXPORTS <path-to-file> should provide the functions it exports.
//Dec 14, 2010
//=========================; void __stdcall keybd_event(BYTE bVk, BYTE bScan, DWORD dwFlags, ULONG_PTR dwExtraInfo)
//============================================================================================
#define GA_ROOT 2
//=================================
#define LPCSTR  string
#define DWORD   int
#define BOOL    bool
#define LPCTSTR string
#define HWND    int
#define UINT    uint
#define MB_ICONERROR 0x00000010
#import  "user32.dll"
int MessageBoxW(HWND hWnd, LPCTSTR lpText, LPCTSTR lpCaption, UINT uType);
//bool ShowWindow(int hWnd, int nCmdShow);/// ShowWindow(GetParent(parent), SW_MINIMIZE);///defined in winuser32
// int m[11];int p[11];
bool GetWindowPlacement(int hWnd, int & lpwndpl[]);/// int x=GetWindowLongA(h,-8);//  bool z=GetWindowPlacement(h,m);/// z=GetWindowPlacement(x,p);
int GetWindowLongA(int hWnd, int GWL_STYLE);  // yo
//if(m[9]>p[9] || m[10]>p[10]){
//     Alert("Chart is maximized");
//  }
//  else{
//     Alert("Chart is NOT maximized");
#import
#define SW_MAXIMIZE 3
#define SW_MINIMIZE 6
#define SW_RESTORE 9

#define SW_SHOWMINIMIZED 11

//=================================
#import "windows.dll"
#import "kernel32.dll"
//=================================
//IntPtr==int
// IntPtr CreateThread(IntPtr lpThreadAttributes, uint dwStackSize, IntPtr lpStartAddress, IntPtr lpParameter, uint dwCreationFlags, IntPtr lpThreadId);//CreateThread
int CreateThread(int lpThreadAttributes, uint dwStackSize, int lpStartAddress, int lpParameter, uint dwCreationFlags, int lpThreadId);//CreateThread
//=================================
int  GetTimeZoneInformation(int& TZInfoArray[]);
int  GetLastError();
//void GetLocalTime(datetime& GetLocalTimeSYS);///GetLocalTime(ByRef time As SYSTEMTIME)///structor need  ByRef time As>> SYSTEMTIME
void GetLocalTime(int& GetLocalTimeSYS);///GetLocalTime(ByRef time As SYSTEMTIME)
//=================
#import "lib.ex4"
int GetLastError();
//==================
#import "kernel32.dll"
int CreateNamedPipeW(string pipeName, int openMode, int pipeMode, int maxInstances, int outBufferSize, int inBufferSize, int defaultTimeOut, int security);
int ConnectNamedPipe(int hPipe, int lpOverlapped);
int ReadFile(int hPipe, int& inBuffer[], int NumberOfBytesToRead, int& bytesRead[], int lpOverlapped);
int WriteFile(int hPipe, string sBuffer, int NumberOfBytesToWrite, int& bytesWritten[], int lpOverlapped);
int FlushFileBuffers(int hPipe);
int DisconnectNamedPipe(int hPipe);
int CloseHandle(int hPipe);
//int MulDiv(string X, int N1, int N2);
int CreateFileW(string name, int desiredAccess, int SharedMode, int security, int creation, int flags, int templateFile);
#import
//==================
#import "kernel32.dll"
// "kernel32.dll" is required by log() function
// requires use of Microsoft DebugView app (debugging alternative for MQL4)
// see http://www.forexfactory.com/showthread.php?t=245303 thread for more info
void OutputDebugStringA(string msg);
#import
//==================
#import "shell32.dll"
// call another executable from within MQL4
int ShellExecuteA(int hwnd, string lpOperation, string lpFile, string lpParameters, string lpDirectory, int nShowCmd);
#import
//==================
///https://docs.microsoft.com/en-us/windows/win32/api/wininet/
#import "wininet.dll"///
// "wininet.dll" is required by ReadWebPage() function
#define INTERNET_FLAG_PRAGMA_NOCACHE    0x00000100 // Forces the request to be resolved by the origin server, even if a cached copy exists on the proxy.
#define INTERNET_FLAG_NO_CACHE_WRITE    0x04000000 // Does not add the returned entity to the cache. 
#define INTERNET_FLAG_RELOAD            0x80000000 // Forces a download of the requested file, object, or directory listing from the origin server, not from the cache.
int InternetAttemptConnect (int x);
int InternetOpenA(string sAgent, int lAccessType, string sProxyName = "", string sProxyBypass = "", int lFlags = 0);
int InternetOpenUrlA(int hInternetSession, string sUrl, string sHeaders = "", int lHeadersLength = 0, int lFlags = 0, int lContext = 0);
int InternetReadFile(int hFile, int& sBuffer[], int lNumBytesToRead, int& lNumberOfBytesRead[]);
int InternetCloseHandle(int hInet);
BOOL InternetCheckConnectionA(LPCSTR lpszUrl, DWORD  dwFlags, DWORD  dwReserved);
#import
//======================================================================================================
//typedef
struct INTERNET_CONNECTED
{         DWORD dwConnectedState;
          DWORD dwFlags;//
          int   eample;//
} INTERNET_CONNECTED_INFO, LPINTERNET_CONNECTED_INFO_X;
INTERNET_CONNECTED my_set = {0.0, 0.0, 5 };///initing by creating
//======================
// bool PostMessageA_WindowsX_WM_SIZING = (bool)PostMessageA(a, WM_SIZING, 35429, 0);////sending pressing WM_COMMAND_35429  ..////sys return bool///
//An application typically posts a message to notify a specific window to perform a task.
// An application typically sends a message to notify a window procedure to perform a task immediately.
///By using the InSendMessage or InSendMessageEx function, a window procedure can determine whether it is processing a message sent by another thread. This capability is useful when message processing depends on the origin of the message.
//WM_PAINT message,  WM_TIMER message,  WM_QUIT
//WM_KEYDOWN and WM_KEYUP)
// WM ::General //// TCM and TCN        Tab control         Tab Control Messages and Tab Control Notifications
//Clipboard Messages
//Clipboard Notifications
//Common Dialog Box Notifications
//Cursor Notifications
//Data Copy Message
//Desktop Window Manager Messages
//Device Management Messages
//Dialog Box Notifications
//Dynamic Data Exchange Messages
//Dynamic Data Exchange Notifications
//Hook Notifications
//Keyboard Accelerator Messages
//Keyboard Accelerator Notifications
//Keyboard Input Messages
//Keyboard Input Notifications
//Menu Notifications
//Mouse Input Notifications
//Multiple Document Interface Messages
//Raw Input Notifications
//Scroll Bar Notifications
//Timer Notifications
//Window Messages
//Window Notifications
//====================
//MSG msg;
//BOOL bRet;
//while( (bRet = GetMessage( &msg, NULL, 0, 0 )) != 0)
//{         if (bRet == -1)
//          {         // handle the error and possibly exit
//          }
//          else
//          {         TranslateMessage(&msg);
//                    DispatchMessage(&msg); //
//          } //
//}
//======================================================================================================
/*
if(hwnd == 0) {

    hwnd = WindowHandle(_Symbol, RTimeFrame);

    if(hwnd == 0) {

      return;

    } else {

      Print ("Offline Chart Window for ",_Symbol," detected.");

    }

  }

  if(MT4InternalMsg == 0) {

    MT4InternalMsg = RegisterWindowMessageA("MetaTrader4_Internal_Message");

    if(MT4InternalMsg == 0)

      return;

  }

  if(PostMessageA(hwnd, WM_COMMAND, MT4_WMCMD_UPDATE_DATA, 0) == 0) {

    hwnd = 0;

  } else {

    PostMessageA(hwnd, MT4InternalMsg, 2, 1);

  }
  //=======================
   void UpdateChartWindow() {

  static int MT4InternalMsg = 0;

  static CChart MyOffLineChart;

  long chart_id = ChartNext(0);



  if(MT4InternalMsg == 0) {

    MT4InternalMsg = RegisterWindowMessageA("MetaTrader4_Internal_Message");

    if(MT4InternalMsg == 0)

      return;

  }

  while(chart_id != -1 ) {

    if(StringCompare(ChartSymbol(chart_id),_Symbol) == 0 && ChartGetInteger(chart_id,CHART_IS_OFFLINE)) {

      MyOffLineChart.Attach(chart_id);

      PostMessageW(MyOffLineChart.WindowHandle(), WM_COMMAND, MT4_WMCMD_UPDATE_DATA, 0);

      PostMessageW(MyOffLineChart.WindowHandle(), MT4InternalMsg, 2, 1);

      break;

    } else {

      chart_id = ChartNext(chart_id);

    }

  }

  if(chart_id == -1) {

    MyOffLineChart.Attach(MyOffLineChart.Open(_Symbol,PERIOD_M2));

    MyOffLineChart.ApplyTemplate(TemplateFile);

  }

  return;

}



  */
//======================================================================================================
//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
//======================================================================================================
//+------------------------------------------------------------------+
//|             Class MouseController     BEGIN-END                  |
//+------------------------------------------------------------------+
//#include <windows.h>
//#include <stdio.h>
//
//void main()
//{
//    SYSTEMTIME st, lt;
//
//    GetSystemTime(&st);
//    GetLocalTime(&lt);
//
//    printf("The system time is: %02d:%02d\n", st.wHour, st.wMinute);
//    printf(" The local time is: %02d:%02d\n", lt.wHour, lt.wMinute);
//}
class C_WINDOWSAPI
{       

private:
          string         WinName;
          int            WinIndex;
          datetime       GetLocalTimeSYSX;//
          int            GetLocalTimeSYS;//
public:
          void           C_WINDOWSAPI();
          bool           CONSTRACTED;
          void           ~C_WINDOWSAPI();
         
          //
          void           EnableOrdersHistoryAll();
          void           ShowWindowX();
          bool           SendMessage();
          bool           MT4_WMCMD(int MT4_WMCMDCom, int IndexCom);
          ///
          //=========================================================
        
          //=========================================================
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
C_WINDOWSAPI::C_WINDOWSAPI()
{         RunCallFunction++;  //============================//============================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-ErrorController-Error",  __LINE__, __FUNCTION__); //
          //============================//============================
         
//===================================================================
          //SYSTEMTIME st, lt;
          GetLocalTime(GetLocalTimeSYS); //
          //Alert("GetLocalTimeSYS: ", (datetime)GetLocalTimeSYS); ///
          CONSTRACTED = true; //
          //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
C_WINDOWSAPI::~C_WINDOWSAPI()
{         
          if(Capitan_DeinitErrorCatching)________________________________________________________Xerorr.SuperviserX(_LastError, "-ErrorController-Error",  __LINE__, __FUNCTION__); //
          //Alert("Deinit: ", __FUNCSIG__, __LINE__);//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|                                                                  |MT4_WMCMD(MT4_WMCMD_IND_CZig_34328, 0);
//+------------------------------------------------------------------+
bool C_WINDOWSAPI::MT4_WMCMD(int MT4_WMCMDCom, int IndexCom)
{         //int main = GetAncestor(WindowHandle(NULL, _Period), GA_ROOT);  <Set Name="GA_ROOT"             Value="2" />
          //GetAncestor(WNHandleIndex, GA_ROOT);
          int main = GetAncestor(WindowHandle(_Symbol, _Period), GA_ROOT);// WindowHandle= mt4 function!!
          PostMessageW(main, WM_COMMAND, MT4_WMCMDCom, IndexCom);
          //Alert("Function EnableAllHistory() disabled");MT4_WMCMD_34300
          Sleep(0); return true; //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_WINDOWSAPI::SendMessage()
{
#define WM_MDIMAXIMIZE_X 0x0225
#define WM_SYSCOMMAND_X         //message instead with one of the following constants:
//#define SC_CLOSE
//#define SC_RESTORE
//#define SC_MAXIMIZE
#define SC_MINIMIZE
//============
          int Msg = WM_SYSCOMMAND + 0;
          int wParam = SC_MINIMIZE + 0;
          int hWnd = 0;
          SendMessageA( hWnd, WM_SYSCOMMAND, SW_MINIMIZE, 0);
          return true;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_WINDOWSAPI::EnableOrdersHistoryAll()
{         //WinCommand-Defines: http://forum.mql4.com/30667
          // http://forum.mql4.com/ru/14463/page5#401551
          // http://forum.mql4.com/46407#596672
          // 33058 - All History, 33057 - Last 3 Months, 33063 - Last Month
          //#define MT4_WMCMD_ALL_HISTORY 33058
          //#define MT4_WMCMD_3_MONTHS 33057
          //#define MT4_WMCMD_LAST_MONTH 33063
          //int main = GetAncestor(WindowHandle(NULL, _Period), GA_ROOT);  <Set Name="GA_ROOT"             Value="2" />
          int main = GetAncestor(WindowHandle(_Symbol, _Period), GA_ROOT);// WindowHandle= mt4 function!!
          //PostMessageW(main, WM_COMMAND, MT4_WMCMD_ALL_HISTORY, 0);
          PostMessageW(main, WM_COMMAND, 33058, 0);//
          //Alert("Function EnableAllHistory() disabled");
          Sleep(5000);//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_WINDOWSAPI::ShowWindowX()
{         int hWnd = WindowHandle(Symbol(), Period());
          int parent = GetParent(hWnd);
          ShowWindow(parent, SW_SHOWMINIMIZED);//
}
//======================================================================================================
//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
//======================================================================================================
//+------------------------------------------------------------------+
//|             Class MouseController     BEGIN-END                  |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//<!--
//    API Monitor Definitions
//    (c) 2010-2012, Rohitab Batra <rohitab@rohitab.com>
//    http://www.rohitab.com/apimonitor/
//-->
//<ApiMonitor>
//    <Include Filename="Headers\windows.h.xml" />
//    <Include Filename="Headers\shell.h.xml" />
//    <Include Filename="Headers\gdi.h.xml" />
//    <Include Filename="Headers\security.h.xml" />
//    <Include Filename="Headers\power.h.xml" />
//
//    <Module Name="User32.dll" CallingConvention="STDCALL" ErrorFunc="GetLastError" OnlineHelp="MSDN">
//
//        <!-- TODO: Bitflags -->
//        <Variable Name="PMENUBARINFO"                           Type="Alias"    Base="LPVOID" />
//
//        <!-- Variables -->
//        <Variable Name="WNDPROC"                                Type="Alias"    Base="LPVOID" />
//        <Variable Name="MSGBOXCALLBACK"                         Type="Alias"    Base="LPVOID" />
//        <Variable Name="HDESK"                                  Type="Alias"    Base="HANDLE" />
//        <Variable Name="SENDASYNCPROC"                          Type="Alias"    Base="LPVOID" />
//        <Variable Name="WNDENUMPROC"                            Type="Alias"    Base="LPVOID" />
//        <Variable Name="HDEVNOTIFY"                             Type="Alias"    Base="PVOID" />
//        <Variable Name="HCONV"                                  Type="Alias"    Base="HANDLE" />
//        <Variable Name="HDDEDATA"                               Type="Alias"    Base="HANDLE" />
//        <Variable Name="HSZ"                                    Type="Alias"    Base="HANDLE" />
//        <Variable Name="HCONVLIST"                              Type="Alias"    Base="HANDLE" />
//        <Variable Name="PFNCALLBACK"                            Type="Alias"    Base="LPVOID" />
//        <Variable Name="HHOOK"                                  Type="Alias"    Base="HANDLE" />
//        <Variable Name="HOOKPROC"                               Type="Alias"    Base="LPVOID" />
//        <Variable Name="CONST MENUTEMPLATE*"                    Type="Alias"    Base="LPVOID" />
//        <Variable Name="MONITORENUMPROC"                        Type="Alias"    Base="LPVOID" />
//        <Variable Name="DRAWSTATEPROC"                          Type="Alias"    Base="LPVOID" />
//        <Variable Name="GRAYSTRINGPROC"                         Type="Alias"    Base="LPVOID" />
//        <Variable Name="HRAWINPUT"                              Type="Alias"    Base="HANDLE" />
//        <Variable Name="TIMERPROC"                              Type="Alias"    Base="LPVOID" />
//        <Variable Name="PROPENUMPROC"                           Type="Alias"    Base="LPVOID" />
//        <Variable Name="PROPENUMPROCEX"                         Type="Alias"    Base="LPVOID" />
//        <Variable Name="WINSTAENUMPROC"                         Type="Alias"    Base="LPVOID" />
//        <Variable Name="DESKTOPENUMPROC"                        Type="Alias"    Base="LPVOID" />
//        <Variable Name="WINEVENTPROC"                           Type="Alias"    Base="LPVOID" />
//        <Variable Name="HWINSTA"                                Type="Alias"    Base="HANDLE" />
//        <Variable Name="HWINEVENTHOOK"                          Type="Alias"    Base="HANDLE" />
//        <Variable Name="HTOUCHINPUT"                            Type="Alias"    Base="HANDLE" />
//        <Variable Name="HGESTUREINFO"                           Type="Alias"    Base="HANDLE" />
//        <Variable Name="HINTERACTIONCONTEXT"                    Type="Alias"    Base="HANDLE" />
//        <Variable Name="HINTERACTIONCONTEXT*"                   Type="Pointer"  Base="HINTERACTIONCONTEXT" />
//        <Variable Name="INTERACTION_CONTEXT_OUTPUT_CALLBACK"    Type="Alias"    Base="LPVOID" />
//        <Variable Name="PDEVICE_NOTIFY_CALLBACK_ROUTINE"        Type="Alias"    Base="LPVOID" />
//
//        <!-- Arrays -->
//        <Variable Name="DWORD [CCHILDREN_TITLEBAR + 1]"             Type="Array"    Base="DWORD"    Count="6" />
//        <Variable Name="DWORD [CCHILDREN_SCROLLBAR + 1]"            Type="Array"    Base="DWORD"    Count="6" />
//        <Variable Name="BYTE [32]"                                  Type="Array"    Base="BYTE"     Count="32" />
//        <Variable Name="WCHAR [POINTER_DEVICE_PRODUCT_STRING_MAX]"  Type="Array"    Base="WCHAR"    Count="520" />
//
//        <!-- TITLEBARINFO -->
//        <Variable Name="TITLEBARINFO" Type="Struct">
//            <Field Type="DWORD"                             Name="cbSize" />
//            <Field Type="RECT"                              Name="rcTitleBar" />
//            <Field Type="DWORD [CCHILDREN_TITLEBAR + 1]"    Name="rgstate" />
//        </Variable>
//        <Variable Name="PTITLEBARINFO" Type="Pointer" Base="TITLEBARINFO" />
//
//        <!-- [DISPLAY_DEVICE_STATE] -->
//        <Variable Name="[DISPLAY_DEVICE_STATE]" Type="Alias" Base="DWORD">
//            <Display Name="DWORD" />
//            <Flag>
//                <Set Name="DISPLAY_DEVICE_ACTIVE"               Value="0x00000001" />
//                <Set Name="DISPLAY_DEVICE_MIRRORING_DRIVER"     Value="0x00000008" />
//                <Set Name="DISPLAY_DEVICE_MODESPRUNED"          Value="0x08000000" />
//                <Set Name="DISPLAY_DEVICE_PRIMARY_DEVICE"       Value="0x00000004" />
//                <Set Name="DISPLAY_DEVICE_REMOVABLE"            Value="0x00000020" />
//                <Set Name="DISPLAY_DEVICE_VGA_COMPATIBLE"       Value="0x00000010" />
//            </Flag>
//        </Variable>
//
//        <!-- DISPLAY_DEVICE -->
//        <Variable Name="DISPLAY_DEVICE" Type="Struct">
//            <Field Type="DWORD"                     Name="cb" />
//            <Field Type="TCHAR [32]"                Name="DeviceName" />
//            <Field Type="TCHAR [128]"               Name="DeviceString" />
//            <Field Type="[DISPLAY_DEVICE_STATE]"    Name="StateFlags" />
//            <Field Type="TCHAR [128]"               Name="DeviceID" />
//            <Field Type="TCHAR [128]"               Name="DeviceKey" />
//        </Variable>
//        <Variable Name="PDISPLAY_DEVICE" Type="Pointer" Base="DISPLAY_DEVICE" />
//
//        <!-- ICONINFOEX -->
//        <Variable Name="ICONINFOEX" Type="Struct">
//            <Field Type="DWORD"             Name="cbSize" />
//            <Field Type="BOOL"              Name="fIcon" />
//            <Field Type="DWORD"             Name="xHotspot" />
//            <Field Type="DWORD"             Name="yHotspot" />
//            <Field Type="HBITMAP"           Name="hbmMask" />
//            <Field Type="HBITMAP"           Name="hbmColor" />
//            <Field Type="WORD"              Name="wResID" />
//            <Field Type="TCHAR [MAX_PATH]"  Name="szModName" />
//            <Field Type="TCHAR [MAX_PATH]"  Name="szResName" />
//        </Variable>
//        <Variable Name="PICONINFOEX" Type="Pointer" Base="ICONINFOEX" />
//
//        <!-- PAINTSTRUCT -->
//        <Variable Name="PAINTSTRUCT" Type="Struct">
//            <Field Type="HDC"           Name="hdc" />
//            <Field Type="BOOL"          Name="fErase" />
//            <Field Type="RECT"          Name="rcPaint" />
//            <Field Type="BOOL"          Name="fRestore" />
//            <Field Type="BOOL"          Name="fIncUpdate" />
//            <Field Type="BYTE [32]"     Name="rgbReserved" />
//        </Variable>
//        <Variable Name="LPPAINTSTRUCT"      Type="Pointer" Base="PAINTSTRUCT" />
//        <Variable Name="const PAINTSTRUCT*" Type="Pointer" Base="PAINTSTRUCT" />
//
//        <!-- SCROLLBARINFO -->
//        <Variable Name="SCROLLBARINFO" Type="Struct">
//            <Field Type="DWORD"                             Name="cbSize" />
//            <Field Type="RECT"                              Name="rcScrollBar" />
//            <Field Type="int"                               Name="dxyLineButton" />
//            <Field Type="int"                               Name="xyThumbTop" />
//            <Field Type="int"                               Name="xyThumbBottom" />
//            <Field Type="int"                               Name="reserved" />
//            <Field Type="DWORD [CCHILDREN_SCROLLBAR + 1]"   Name="rgstate" />
//        </Variable>
//        <Variable Name="PSCROLLBARINFO" Type="Pointer" Base="SCROLLBARINFO" />
//
//        <!-- [MOUSEINPUT_Data]-->
//        <Variable Name="[MOUSEINPUT_Data]" Type="Alias" Base="DWORD">
//            <Display Name="DWORD" />
//            <Flag>
//                <Set Name="XBUTTON1"        Value="0x0001" />
//                <Set Name="XBUTTON2"        Value="0x0002" />
//            </Flag>
//        </Variable>
//
//        <!-- [MOUSEEVENTF] -->
//        <Variable Name="[MOUSEEVENTF]" Type="Alias" Base="DWORD">
//            <Display Name="DWORD" />
//            <Flag>
//                <Set Name="MOUSEEVENTF_MOVE"                Value="0x0001" />
//                <Set Name="MOUSEEVENTF_LEFTDOWN"            Value="0x0002" />
//                <Set Name="MOUSEEVENTF_LEFTUP"              Value="0x0004" />
//                <Set Name="MOUSEEVENTF_RIGHTDOWN"           Value="0x0008" />
//                <Set Name="MOUSEEVENTF_RIGHTUP"             Value="0x0010" />
//                <Set Name="MOUSEEVENTF_MIDDLEDOWN"          Value="0x0020" />
//                <Set Name="MOUSEEVENTF_MIDDLEUP"            Value="0x0040" />
//                <Set Name="MOUSEEVENTF_XDOWN"               Value="0x0080" />
//                <Set Name="MOUSEEVENTF_XUP"                 Value="0x0100" />
//                <Set Name="MOUSEEVENTF_WHEEL"               Value="0x0800" />
//                <Set Name="MOUSEEVENTF_HWHEEL"              Value="0x01000" />
//                <Set Name="MOUSEEVENTF_MOVE_NOCOALESCE"     Value="0x2000" />
//                <Set Name="MOUSEEVENTF_VIRTUALDESK"         Value="0x4000" />
//                <Set Name="MOUSEEVENTF_ABSOLUTE"            Value="0x8000" />
//            </Flag>
//        </Variable>
//
//        <!-- MOUSEINPUT -->
//        <Variable Name="MOUSEINPUT" Type="Struct">
//            <Field Type="LONG"                  Name="dx" />
//            <Field Type="LONG"                  Name="dy" />
//            <Field Type="[MOUSEINPUT_Data]"     Name="mouseData" />
//            <Field Type="[MOUSEEVENTF]"         Name="dwFlags" />
//            <Field Type="DWORD"                 Name="time" />
//            <Field Type="ULONG_PTR"             Name="dwExtraInfo" />
//        </Variable>
//
//        <!-- [KEYEVENTF] -->
//        <Variable Name="[KEYEVENTF]" Type="Alias" Base="DWORD">
//            <Display Name="DWORD" />
//            <Flag>
//                <Set Name="KEYEVENTF_EXTENDEDKEY"   Value="0x0001" />
//                <Set Name="KEYEVENTF_KEYUP"         Value="0x0002" />
//                <Set Name="KEYEVENTF_UNICODE"       Value="0x0004" />
//                <Set Name="KEYEVENTF_SCANCODE"      Value="0x0008" />
//            </Flag>
//        </Variable>
//
//        <!-- KEYBDINPUT -->
//        <Variable Name="KEYBDINPUT" Type="Struct">
//            <Field Type="[VirtKeyCode]"     Name="wVk" />
//            <Field Type="WORD"              Name="wScan" />
//            <Field Type="[KEYEVENTF]"       Name="dwFlags" />
//            <Field Type="DWORD"             Name="time" />
//            <Field Type="ULONG_PTR"         Name="dwExtraInfo" />
//        </Variable>
//
//        <!-- HARDWAREINPUT -->
//        <Variable Name="HARDWAREINPUT" Type="Struct">
//            <Field Type="DWORD"     Name="uMsg" />
//            <Field Type="WORD"      Name="wParamL" />
//            <Field Type="WORD"      Name="wParamH" />
//        </Variable>
//
//        <!-- [INPUT_u] -->
//        <Variable Name="[INPUT_u]" Type="Union">
//            <Display Name="union" />
//            <Field Type="MOUSEINPUT"        Name="mi" />
//            <Field Type="KEYBDINPUT"        Name="ki" />
//            <Field Type="HARDWAREINPUT"     Name="hi" />
//        </Variable>
//
//        <!-- [INPUT_Type] -->
//        <Variable Name="[INPUT_Type]" Type="Alias" Base="DWORD">
//            <Display Name="DWORD" />
//            <Enum>
//                <Set Name="INPUT_MOUSE"     Value="0" />
//                <Set Name="INPUT_KEYBOARD"  Value="1" />
//                <Set Name="INPUT_HARDWARE"  Value="2" />
//            </Enum>
//        </Variable>
//
//        <!-- INPUT -->
//        <Variable Name="INPUT" Type="Struct">
//            <Field Type="[INPUT_Type]"  Name="type" />
//            <Field Type="[INPUT_u]"     Name="" />
//        </Variable>
//        <Variable Name="LPINPUT" Type="Pointer" Base="INPUT" />
//
//        <!-- [WindowStyle] -->
//        <Variable Name="[WindowStyle]" Type="Alias" Base="DWORD">
//            <Display Name="DWORD" />
//            <Flag>
//                <Set Name="WS_BORDER"           Value="0x00800000" />
//                <Set Name="WS_CAPTION"          Value="0x00C00000" />
//                <Set Name="WS_CHILD"            Value="0x40000000" />
//                <Set Name="WS_CLIPCHILDREN"     Value="0x02000000" />
//                <Set Name="WS_CLIPSIBLINGS"     Value="0x04000000" />
//                <Set Name="WS_DISABLED"         Value="0x08000000" />
//                <Set Name="WS_DLGFRAME"         Value="0x00400000" />
//                <Set Name="WS_GROUP"            Value="0x00020000" />
//                <Set Name="WS_HSCROLL"          Value="0x00100000" />
//                <Set Name="WS_MAXIMIZE"         Value="0x01000000" />
//                <Set Name="WS_MAXIMIZEBOX"      Value="0x00010000" />
//                <Set Name="WS_MINIMIZE"         Value="0x20000000" />
//                <Set Name="WS_MINIMIZEBOX"      Value="0x00020000" />
//                <Set Name="WS_OVERLAPPED"       Value="0x00000000" />
//                <Set Name="WS_OVERLAPPEDWINDOW" Value="0x00cf0000" />
//                <Set Name="WS_POPUP"            Value="0x80000000" />
//                <Set Name="WS_POPUPWINDOW"      Value="0x80880000" />
//                <Set Name="WS_SYSMENU"          Value="0x00080000" />
//                <Set Name="WS_TABSTOP"          Value="0x00010000" />
//                <Set Name="WS_THICKFRAME"       Value="0x00040000" />
//                <Set Name="WS_VISIBLE"          Value="0x10000000" />
//                <Set Name="WS_VSCROLL"          Value="0x00200000" />
//            </Flag>
//        </Variable>
//
//        <!-- [WindowExStyle] -->
//        <Variable Name="[WindowExStyle]" Type="Alias" Base="DWORD">
//            <Display Name="DWORD" />
//            <Flag>
//                <Set Name="WS_EX_ACCEPTFILES"       Value="0x00000010" />
//                <Set Name="WS_EX_APPWINDOW"         Value="0x00040000" />
//                <Set Name="WS_EX_CLIENTEDGE"        Value="0x00000200" />
//                <Set Name="WS_EX_COMPOSITED"        Value="0x02000000" />
//                <Set Name="WS_EX_CONTEXTHELP"       Value="0x00000400" />
//                <Set Name="WS_EX_CONTROLPARENT"     Value="0x00010000" />
//                <Set Name="WS_EX_DLGMODALFRAME"     Value="0x00000001" />
//                <Set Name="WS_EX_LAYERED"           Value="0x00080000" />
//                <Set Name="WS_EX_LAYOUTRTL"         Value="0x00400000" />
//                <Set Name="WS_EX_LEFTSCROLLBAR"     Value="0x00004000" />
//                <Set Name="WS_EX_MDICHILD"          Value="0x00000040" />
//                <Set Name="WS_EX_NOACTIVATE"        Value="0x08000000" />
//                <Set Name="WS_EX_NOINHERITLAYOUT"   Value="0x00100000" />
//                <Set Name="WS_EX_NOPARENTNOTIFY"    Value="0x00000004" />
//                <Set Name="WS_EX_OVERLAPPEDWINDOW"  Value="0x00000300" />
//                <Set Name="WS_EX_PALETTEWINDOW"     Value="0x00000188" />
//                <Set Name="WS_EX_RIGHT"             Value="0x00001000" />
//                <Set Name="WS_EX_RTLREADING"        Value="0x00002000" />
//                <Set Name="WS_EX_STATICEDGE"        Value="0x00020000" />
//                <Set Name="WS_EX_TOOLWINDOW"        Value="0x00000080" />
//                <Set Name="WS_EX_TOPMOST"           Value="0x00000008" />
//                <Set Name="WS_EX_TRANSPARENT"       Value="0x00000020" />
//                <Set Name="WS_EX_WINDOWEDGE"        Value="0x00000100" />
//            </Flag>
//        </Variable>
//
//        <!-- [DialogStyle] -->
//        <Variable Name="[DialogStyle]" Type="Alias" Base="DWORD">
//            <Display Name="DWORD" />
//            <Flag>
//                <!-- Dialog Styles -->
//                <Set Name="DS_ABSALIGN"         Value="0x01" />
//                <Set Name="DS_SYSMODAL"         Value="0x02" />
//                <Set Name="DS_LOCALEDIT"        Value="0x20" />
//                <Set Name="DS_SETFONT"          Value="0x40" />
//                <Set Name="DS_MODALFRAME"       Value="0x80" />
//                <Set Name="DS_NOIDLEMSG"        Value="0x100" />
//                <Set Name="DS_SETFOREGROUND"    Value="0x200" />
//                <Set Name="DS_3DLOOK"           Value="0x0004" />
//                <Set Name="DS_FIXEDSYS"         Value="0x0008" />
//                <Set Name="DS_NOFAILCREATE"     Value="0x0010" />
//                <Set Name="DS_CONTROL"          Value="0x0400" />
//                <Set Name="DS_CENTER"           Value="0x0800" />
//                <Set Name="DS_CENTERMOUSE"      Value="0x1000" />
//                <Set Name="DS_CONTEXTHELP"      Value="0x2000" />
//                <Set Name="DS_SHELLFONT"        Value="0x48" />
//                <Set Name="DS_USEPIXELS"        Value="0x8000" />
//
//                <!-- Window Styles from [WindowStyle] -->
//                <Set Name="WS_BORDER"           Value="0x00800000" />
//                <Set Name="WS_CAPTION"          Value="0x00C00000" />
//                <Set Name="WS_CHILD"            Value="0x40000000" />
//                <Set Name="WS_CLIPCHILDREN"     Value="0x02000000" />
//                <Set Name="WS_CLIPSIBLINGS"     Value="0x04000000" />
//                <Set Name="WS_DISABLED"         Value="0x08000000" />
//                <Set Name="WS_DLGFRAME"         Value="0x00400000" />
//                <Set Name="WS_GROUP"            Value="0x00020000" />
//                <Set Name="WS_HSCROLL"          Value="0x00100000" />
//                <Set Name="WS_MAXIMIZE"         Value="0x01000000" />
//                <Set Name="WS_MAXIMIZEBOX"      Value="0x00010000" />
//                <Set Name="WS_MINIMIZE"         Value="0x20000000" />
//                <Set Name="WS_MINIMIZEBOX"      Value="0x00020000" />
//                <Set Name="WS_OVERLAPPED"       Value="0x00000000" />
//                <Set Name="WS_OVERLAPPEDWINDOW" Value="0x00cf0000" />
//                <Set Name="WS_POPUP"            Value="0x80000000" />
//                <Set Name="WS_POPUPWINDOW"      Value="0x80880000" />
//                <Set Name="WS_SYSMENU"          Value="0x00080000" />
//                <Set Name="WS_TABSTOP"          Value="0x00010000" />
//                <Set Name="WS_THICKFRAME"       Value="0x00040000" />
//                <Set Name="WS_VISIBLE"          Value="0x10000000" />
//                <Set Name="WS_VSCROLL"          Value="0x00200000" />
//            </Flag>
//        </Variable>
//
//        <!-- DLGTEMPLATE -->
//        <Variable Name="DLGTEMPLATE" Type="Struct" Pack="2">
//            <Field Type="[DialogStyle]"         Name="style" />
//            <Field Type="[WindowExStyle]"   Name="dwExtendedStyle" />
//            <Field Type="WORD"              Name="cdit" />
//            <Field Type="short"               Name="x" />
//            <Field Type="short"               Name="y" />
//            <Field Type="short"               Name="cx" />
//            <Field Type="short"               Name="cy" />
//        </Variable>
//        <Variable Name="LPCDLGTEMPLATE" Type="Pointer" Base="DLGTEMPLATE" />
//
//        <!-- MSGBOXPARAMS -->
//        <Variable Name="MSGBOXPARAMS" Type="Struct">
//            <Field Type="UINT"                      Name="cbSize" />
//            <Field Type="HWND"                      Name="hwndOwner" />
//            <Field Type="HINSTANCE"                 Name="hInstance" />
//            <Field Type="LPCTSTR"                   Name="lpszText" />
//            <Field Type="LPCTSTR"                   Name="lpszCaption" />
//            <Field Type="DWORD"                     Name="dwStyle" />
//            <Field Type="LPCTSTR"                   Name="lpszIcon" />
//            <Field Type="DWORD_PTR"                 Name="dwContextHelpId" />
//            <Field Type="MSGBOXCALLBACK"    Name="lpfnMsgBoxCallback" />
//            <Field Type="DWORD"                     Name="dwLanguageId" />
//        </Variable>
//        <Variable Name="const LPMSGBOXPARAMS" Type="Pointer" Base="MSGBOXPARAMS" />
//
//        <!-- BSMINFO -->
//        <Variable Name="BSMINFO" Type="Struct">
//            <Field Type="UINT"        Name="cbSize" />
//            <Field Type="HDESK"       Name="hdesk" />
//            <Field Type="HWND"        Name="hwnd" />
//            <Field Type="LUID"        Name="luid" />
//        </Variable>
//        <Variable Name="PBSMINFO" Type="Pointer" Base="BSMINFO" />
//
//        <!-- [MSGFLTINFO] -->
//        <Variable Name="[MSGFLTINFO]" Type="Alias" Base="DWORD">
//            <Display Name="DWORD" />
//            <Enum>
//                <Set Name="MSGFLTINFO_NONE"                         Value="0" />
//                <Set Name="MSGFLTINFO_ALREADYALLOWED_FORWND"        Value="1" />
//                <Set Name="MSGFLTINFO_ALREADYDISALLOWED_FORWND"     Value="2" />
//                <Set Name="MSGFLTINFO_ALLOWED_HIGHER"               Value="3" />
//            </Enum>
//        </Variable>
//
//        <!-- CHANGEFILTERSTRUCT -->
//        <Variable Name="CHANGEFILTERSTRUCT" Type="Struct">
//            <Field Type="DWORD"           Name="cbSize" />
//            <Field Type="[MSGFLTINFO]"          Name="ExtStatus" />
//        </Variable>
//        <Variable Name="PCHANGEFILTERSTRUCT" Type="Pointer" Base="CHANGEFILTERSTRUCT" />
//
//        <!-- ALTTABINFO -->
//        <Variable Name="ALTTABINFO" Type="Struct">
//            <Field Type="DWORD" Name="cbSize" />
//            <Field Type="int"         Name="cItems" />
//            <Field Type="int"         Name="cColumns" />
//            <Field Type="int"         Name="cRows" />
//            <Field Type="int"         Name="iColFocus" />
//            <Field Type="int"         Name="iRowFocus" />
//            <Field Type="int"         Name="cxItem" />
//            <Field Type="int"         Name="cyItem" />
//            <Field Type="POINT" Name="ptStart" />
//        </Variable>
//        <Variable Name="PALTTABINFO" Type="Pointer" Base="ALTTABINFO" />
//
//        <!-- [GUITHREADINFO_Flags] -->
//        <Variable Name="[GUITHREADINFO_Flags]" Type="Alias" Base="DWORD">
//            <Display Name="DWORD" />
//            <Flag>
//                <Set Name="GUI_CARETBLINKING"   Value="0x00000001" />
//                <Set Name="GUI_INMOVESIZE"      Value="0x00000002" />
//                <Set Name="GUI_INMENUMODE"      Value="0x00000004" />
//                <Set Name="GUI_SYSTEMMENUMODE"  Value="0x00000008" />
//                <Set Name="GUI_POPUPMENUMODE"   Value="0x00000010" />
//            </Flag>
//        </Variable>
//
//        <!-- GUITHREADINFO -->
//        <Variable Name="GUITHREADINFO" Type="Struct">
//            <Field Type="DWORD"                       Name="cbSize" />
//            <Field Type="[GUITHREADINFO_Flags]"           Name="flags" />
//            <Field Type="HWND"                        Name="hwndActive" />
//            <Field Type="HWND"                        Name="hwndFocus" />
//            <Field Type="HWND"                        Name="hwndCapture" />
//            <Field Type="HWND"                        Name="hwndMenuOwner" />
//            <Field Type="HWND"                        Name="hwndMoveSize" />
//            <Field Type="HWND"                        Name="hwndCaret" />
//            <Field Type="RECT"                        Name="rcCaret" />
//        </Variable>
//        <Variable Name="LPGUITHREADINFO" Type="Pointer" Base="GUITHREADINFO" />
//
//        <!-- WINDOWINFO -->
//        <Variable Name="WINDOWINFO" Type="Struct">
//            <Field Type="DWORD"               Name="cbSize" />
//            <Field Type="RECT"                    Name="rcWindow" />
//            <Field Type="RECT"                    Name="rcClient" />
//            <Field Type="[WindowStyle]"         Name="dwStyle" />
//            <Field Type="[WindowExStyle]"       Name="dwExStyle" />
//            <Field Type="DWORD"             Name="dwWindowStatus" />
//            <Field Type="UINT"                    Name="cxWindowBorders" />
//            <Field Type="UINT"                    Name="cyWindowBorders" />
//            <Field Type="ATOM"                    Name="atomWindowType" />
//            <Field Type="WORD"                    Name="wCreatorVersion" />
//        </Variable>
//        <Variable Name="PWINDOWINFO" Type="Pointer" Base="WINDOWINFO" />
//
//        <!-- [WPF_Flags] -->
//        <Variable Name="[WPF_Flags]" Type="Alias" Base="UINT">
//            <Display Name="UINT" />
//            <Flag>
//                <Set Name="WPF_SETMINPOSITION"          Value="0x0001" />
//                <Set Name="WPF_RESTORETOMAXIMIZED"      Value="0x0002" />
//                <Set Name="WPF_ASYNCWINDOWPLACEMENT"    Value="0x0004" />
//            </Flag>
//        </Variable>
//
//        <!-- WINDOWPLACEMENT -->
//        <Variable Name="WINDOWPLACEMENT" Type="Struct">
//            <Field Type="UINT"            Name="length" />
//            <Field Type="[WPF_Flags]"           Name="flags" />
//            <Field Type="UINT"            Name="showCmd" />
//            <Field Type="POINT"           Name="ptMinPosition" />
//            <Field Type="POINT"           Name="ptMaxPosition" />
//            <Field Type="RECT"            Name="rcNormalPosition" />
//        </Variable>
//        <Variable Name="WINDOWPLACEMENT*" Type="Pointer" Base="WINDOWPLACEMENT" />
//
//        <!-- UPDATELAYEREDWINDOWINFO -->
//        <Variable Name="UPDATELAYEREDWINDOWINFO" Type="Struct">
//            <Field Type="DWORD"                 Name="cbSize" />
//            <Field Type="HDC"                   Name="hdcDst" />
//            <Field Type="const POINT*"          Name="pptDst" />
//            <Field Type="const SIZE*"           Name="psize" />
//            <Field Type="HDC"                   Name="hdcSrc" />
//            <Field Type="const POINT*"          Name="pptSrc" />
//            <Field Type="COLORREF"              Name="crKey" />
//            <Field Type="const BLENDFUNCTION*"  Name="pblend" />
//            <Field Type="DWORD"                 Name="dwFlags" />
//            <Field Type="const RECT*"           Name="prcDirty" />
//        </Variable>
//        <Variable Name="const UPDATELAYEREDWINDOWINFO*" Type="Pointer" Base="UPDATELAYEREDWINDOWINFO" />
//
//        <!-- COMBOBOXINFO -->
//        <Variable Name="COMBOBOXINFO" Type="Struct">
//            <Field Type="DWORD"       Name="cbSize" />
//            <Field Type="RECT"            Name="rcItem" />
//            <Field Type="RECT"            Name="rcButton" />
//            <Field Type="DWORD"       Name="stateButton" />
//            <Field Type="HWND"            Name="hwndCombo" />
//            <Field Type="HWND"            Name="hwndItem" />
//            <Field Type="HWND"            Name="hwndList" />
//        </Variable>
//        <Variable Name="PCOMBOBOXINFO" Type="Pointer" Base="COMBOBOXINFO" />
//
//        <!-- [CursorFlags] -->
//        <Variable Name="[CursorFlags]" Type="Alias" Base="DWORD">
//            <Display Name="DWORD" />
//            <Flag>
//                <Set Name="CURSOR_SHOWING" Value="0x00000001" />
//            </Flag>
//        </Variable>
//
//        <!-- CURSORINFO -->
//        <Variable Name="CURSORINFO" Type="Struct">
//            <Field Type="DWORD"           Name="cbSize" />
//            <Field Type="[CursorFlags]" Name="flags" />
//            <Field Type="HCURSOR"         Name="hCursor" />
//            <Field Type="POINT"           Name="ptScreenPos" />
//        </Variable>
//        <Variable Name="PCURSORINFO" Type="Pointer" Base="CURSORINFO" />
//
//        <!-- CONVCONTEXT -->
//        <Variable Name="CONVCONTEXT" Type="Struct">
//            <Field Type="UINT"                                  Name="cb" />
//            <Field Type="UINT"                                  Name="wFlags" />
//            <Field Type="UINT"                                  Name="wCountryID" />
//            <Field Type="[CODE_PAGE|int]"                     Name="iCodePage" />
//            <Field Type="DWORD"                                 Name="dwLangID" />
//            <Field Type="DWORD"                                 Name="dwSecurity" />
//            <Field Type="SECURITY_QUALITY_OF_SERVICE"     Name="qos" />
//        </Variable>
//        <Variable Name="PCONVCONTEXT" Type="Pointer" Base="CONVCONTEXT" />
//
//        <!-- [CONVINFO_XTYP] -->
//        <Variable Name="[CONVINFO_XTYP]" Type="Alias" Base="UINT">
//            <Enum>
//                <Set Name="XTYP_ERROR"              Value="0x8002" />
//                <Set Name="XTYP_ADVDATA"            Value="0x4010" />
//                <Set Name="XTYP_ADVREQ"             Value="0x2022" />
//                <Set Name="XTYP_ADVSTART"           Value="0x1030" />
//                <Set Name="XTYP_ADVSTOP"            Value="0x8040" />
//                <Set Name="XTYP_EXECUTE"            Value="0x4050" />
//                <Set Name="XTYP_CONNECT"            Value="0x1062" />
//                <Set Name="XTYP_MONITOR"            Value="0x80F2" />
//                <Set Name="XTYP_CONNECT_CONFIRM"    Value="0x8072" />
//                <Set Name="XTYP_XACT_COMPLETE"      Value="0x8080" />
//                <Set Name="XTYP_POKE"               Value="0x4090" />
//                <Set Name="XTYP_REGISTER"           Value="0x80A2" />
//                <Set Name="XTYP_REQUEST"            Value="0x20B0" />
//                <Set Name="XTYP_DISCONNECT"         Value="0x80C2" />
//                <Set Name="XTYP_UNREGISTER"         Value="0x80D2" />
//                <Set Name="XTYP_WILDCONNECT"        Value="0x20E2" />
//            </Enum>
//        </Variable>
//
//        <!-- [CONVINFO_STATUS] -->
//        <Variable Name="[CONVINFO_STATUS]" Type="Alias" Base="UINT">
//            <Enum>
//                <Set Name="ST_CONNECTED"        Value="0x0001" />
//                <Set Name="ST_ADVISE"           Value="0x0002" />
//                <Set Name="ST_ISLOCAL"          Value="0x0004" />
//                <Set Name="ST_BLOCKED"          Value="0x0008" />
//                <Set Name="ST_CLIENT"           Value="0x0010" />
//                <Set Name="ST_TERMINATED"       Value="0x0020" />
//                <Set Name="ST_INLIST"           Value="0x0040" />
//                <Set Name="ST_BLOCKNEXT"        Value="0x0080" />
//                <Set Name="ST_ISSELF"           Value="0x0100" />
//            </Enum>
//        </Variable>
//
//        <!-- [CONVINFO_STATE] -->
//        <Variable Name="[CONVINFO_STATE]" Type="Alias" Base="UINT">
//            <Enum>
//                <Set Name="XST_NULL"                Value="0" />
//                <Set Name="XST_INCOMPLETE"          Value="1" />
//                <Set Name="XST_CONNECTED"           Value="2" />
//                <Set Name="XST_INIT1"               Value="3" />
//                <Set Name="XST_INIT2"               Value="4" />
//                <Set Name="XST_REQSENT"             Value="5" />
//                <Set Name="XST_DATARCVD"            Value="6" />
//                <Set Name="XST_POKESENT"            Value="7" />
//                <Set Name="XST_POKEACKRCVD"         Value="8" />
//                <Set Name="XST_EXECSENT"            Value="9" />
//                <Set Name="XST_EXECACKRCVD"         Value="10" />
//                <Set Name="XST_ADVSENT"             Value="11" />
//                <Set Name="XST_UNADVSENT"           Value="12" />
//                <Set Name="XST_ADVACKRCVD"          Value="13" />
//                <Set Name="XST_UNADVACKRCVD"        Value="14" />
//                <Set Name="XST_ADVDATASENT"         Value="15" />
//                <Set Name="XST_ADVDATAACKRCVD"      Value="16" />
//            </Enum>
//        </Variable>
//
//        <!-- CONVINFO -->
//        <Variable Name="CONVINFO" Type="Struct">
//            <Field Type="DWORD"                   Name="cb" />
//            <Field Type="DWORD_PTR"             Name="hUser" />
//            <Field Type="HCONV"                   Name="hConvPartner" />
//            <Field Type="HSZ"                     Name="hszSvcPartner" />
//            <Field Type="HSZ"                     Name="hszServiceReq" />
//            <Field Type="HSZ"                     Name="hszTopic" />
//            <Field Type="HSZ"                     Name="hszItem" />
//            <Field Type="UINT"                    Name="wFmt" />
//            <Field Type="[CONVINFO_XTYP]"       Name="wType" />
//            <Field Type="[CONVINFO_STATUS]"     Name="wStatus" />
//            <Field Type="[CONVINFO_STATE]"      Name="wConvst" />
//            <Field Type="UINT"                    Name="wLastError" />
//            <Field Type="HCONVLIST"           Name="hConvList" />
//            <Field Type="CONVCONTEXT"                   Name="ConvCtxt" />
//            <Field Type="HWND"                    Name="hwnd" />
//            <Field Type="HWND"                    Name="hwndPartner" />
//        </Variable>
//        <Variable Name="PCONVINFO" Type="Pointer" Base="CONVINFO" />
//
//        <!-- [FLASHWINFO_Flags] -->
//        <Variable Name="[FLASHWINFO_Flags]" Type="Alias" Base="DWORD">
//            <Display Name="DWORD" />
//            <Flag>
//                <Set Name="FLASHW_STOP"         Value="0" />
//                <Set Name="FLASHW_CAPTION"      Value="0x00000001" />
//                <Set Name="FLASHW_TRAY"         Value="0x00000002" />
//                <Set Name="FLASHW_ALL"          Value="0x00000003" />
//                <Set Name="FLASHW_TIMER"        Value="0x00000004" />
//                <Set Name="FLASHW_TIMERNOFG"    Value="0x0000000C" />
//            </Flag>
//        </Variable>
//
//        <!-- FLASHWINFO -->
//        <Variable Name="FLASHWINFO" Type="Struct">
//            <Field Type="UINT"                    Name="cbSize" />
//            <Field Type="HWND"                    Name="hwnd" />
//            <Field Type="[FLASHWINFO_Flags]"    Name="dwFlags" />
//            <Field Type="UINT"                    Name="uCount" />
//            <Field Type="DWORD"                   Name="dwTimeout" />
//        </Variable>
//        <Variable Name="PFLASHWINFO" Type="Pointer" Base="FLASHWINFO" />
//
//        <!-- ICONINFO -->
//        <Variable Name="ICONINFO" Type="Struct">
//            <Field Type="BOOL"        Name="fIcon" />
//            <Field Type="DWORD"       Name="xHotspot" />
//            <Field Type="DWORD"       Name="yHotspot" />
//            <Field Type="HBITMAP"     Name="hbmMask" />
//            <Field Type="HBITMAP"     Name="hbmColor" />
//        </Variable>
//        <Variable Name="PICONINFO" Type="Pointer" Base="ICONINFO" />
//
//        <!-- [ACCEL_Flags] -->
//        <Variable Name="[ACCEL_Flags]" Type="Alias" Base="BYTE">
//            <Display Name="BYTE" />
//            <Flag>
//                <Set Name="FVIRTKEY"            Value="0x01" />
//                <Set Name="FNOINVERT"           Value="0x02" />
//                <Set Name="FSHIFT"              Value="0x04" />
//                <Set Name="FCONTROL"            Value="0x08" />
//                <Set Name="FALT"        Value="0x10" />
//            </Flag>
//        </Variable>
//
//        <!-- ACCEL -->
//        <Variable Name="ACCEL" Type="Struct">
//            <Field Type="[ACCEL_Flags]"         Name="fVirt" />
//            <Field Type="[VirtKeyCode]"     Name="key" />
//            <Field Type="WORD"                Name="cmd" />
//        </Variable>
//        <Variable Name="LPACCEL" Type="Pointer" Base="ACCEL" />
//
//        <!-- LASTINPUTINFO -->
//        <Variable Name="LASTINPUTINFO" Type="Struct">
//            <Field Type="UINT"      Name="cbSize" />
//            <Field Type="DWORD"       Name="dwTime" />
//        </Variable>
//        <Variable Name="PLASTINPUTINFO" Type="Pointer" Base="LASTINPUTINFO" />
//
//        <!-- [MENUINFO_Mask] -->
//        <Variable Name="[MENUINFO_Mask]" Type="Alias" Base="DWORD">
//            <Display Name="DWORD" />
//            <Flag>
//                <Set Name="MIM_MAXHEIGHT"         Value="0x00000001" />
//                <Set Name="MIM_BACKGROUND"        Value="0x00000002" />
//                <Set Name="MIM_HELPID"            Value="0x00000004" />
//                <Set Name="MIM_MENUDATA"          Value="0x00000008" />
//                <Set Name="MIM_STYLE"             Value="0x00000010" />
//                <Set Name="MIM_APPLYTOSUBMENUS"   Value="0x80000000" />
//            </Flag>
//        </Variable>
//
//        <!-- [MENUINFO_Style] -->
//        <Variable Name="[MENUINFO_Style]" Type="Alias" Base="DWORD">
//            <Display Name="DWORD" />
//            <Flag>
//                <Set Name="MNS_NOCHECK"         Value="0x80000000" />
//                <Set Name="MNS_MODELESS"        Value="0x40000000" />
//                <Set Name="MNS_DRAGDROP"        Value="0x20000000" />
//                <Set Name="MNS_AUTODISMISS"     Value="0x10000000" />
//                <Set Name="MNS_NOTIFYBYPOS"     Value="0x08000000" />
//                <Set Name="MNS_CHECKORBMP"      Value="0x04000000" />
//            </Flag>
//        </Variable>
//
//        <!-- MENUINFO -->
//        <Variable Name="MENUINFO" Type="Struct">
//            <Field Type="DWORD"       Name="cbSize" />
//            <Field Type="[MENUINFO_Mask]"       Name="fMask" />
//            <Field Type="[MENUINFO_Style]"      Name="dwStyle" />
//            <Field Type="UINT"        Name="cyMax" />
//            <Field Type="HBRUSH"      Name="hbrBack" />
//            <Field Type="DWORD"       Name="dwContextHelpID" />
//            <Field Type="ULONG_PTR"   Name="dwMenuData" />
//        </Variable>
//        <Variable Name="LPCMENUINFO" Type="Pointer" Base="MENUINFO" />
//
//        <!-- [MENUITEMINFO_MASK] -->
//        <Variable Name="[MENUITEMINFO_MASK]" Type="Alias" Base="UINT">
//            <Display Name="UINT" />
//            <Flag>
//                <Set Name="MIIM_STATE"       Value="0x00000001" />
//                <Set Name="MIIM_ID"          Value="0x00000002" />
//                <Set Name="MIIM_SUBMENU"     Value="0x00000004" />
//                <Set Name="MIIM_CHECKMARKS"  Value="0x00000008" />
//                <Set Name="MIIM_TYPE"        Value="0x00000010" />
//                <Set Name="MIIM_DATA"        Value="0x00000020" />
//                <Set Name="MIIM_STRING"      Value="0x00000040" />
//                <Set Name="MIIM_BITMAP"      Value="0x00000080" />
//                <Set Name="MIIM_FTYPE"       Value="0x00000100" />
//            </Flag>
//        </Variable>
//
//        <!-- [MENUITEM_TYPE] -->
//        <Variable Name="[MENUITEM_TYPE]" Type="Alias" Base="UINT">
//            <Display Name="UINT" />
//            <Flag>
//                <Set Name="MFT_STRING"          Value="0x00000000" />
//                <Set Name="MFT_BITMAP"          Value="0x00000004" />
//                <Set Name="MFT_MENUBARBREAK"    Value="0x00000020" />
//                <Set Name="MFT_MENUBREAK"       Value="0x00000040" />
//                <Set Name="MFT_OWNERDRAW"       Value="0x00000100" />
//                <Set Name="MFT_RADIOCHECK"      Value="0x00000200" />
//                <Set Name="MFT_SEPARATOR"       Value="0x00000800" />
//                <Set Name="MFT_RIGHTORDER"      Value="0x00002000" />
//                <Set Name="MFT_RIGHTJUSTIFY"    Value="0x00004000" />
//            </Flag>
//        </Variable>
//
//        <!-- [MENUITEM_STATE] -->
//        <Variable Name="[MENUITEM_STATE]" Type="Alias" Base="UINT">
//            <Display Name="UINT" />
//            <Flag>
//                <Set Name="MFS_DISABLED"        Value="0x00000003" />
//                <Set Name="MFS_CHECKED"         Value="0x00000008" />
//                <Set Name="MFS_HILITE"          Value="0x00000080" />
//                <Set Name="MFS_ENABLED"         Value="0x00000000" />
//                <Set Name="MFS_UNCHECKED"       Value="0x00000000" />
//                <Set Name="MFS_UNHILITE"        Value="0x00000000" />
//                <Set Name="MFS_DEFAULT"         Value="0x00001000" />
//            </Flag>
//        </Variable>
//
//        <!-- [HBMMENU] -->
//        <Variable Name="[HBMMENU]" Type="Alias" Base="HBITMAP">
//            <Display Name="HBITMAP" />
//            <Flag>
//                <Set Name="HBMMENU_CALLBACK"            Value="-1" />
//                <Set Name="HBMMENU_SYSTEM"              Value="1" />
//                <Set Name="HBMMENU_MBAR_RESTORE"        Value="2" />
//                <Set Name="HBMMENU_MBAR_MINIMIZE"       Value="3" />
//                <Set Name="HBMMENU_MBAR_CLOSE"          Value="5" />
//                <Set Name="HBMMENU_MBAR_CLOSE_D"        Value="6" />
//                <Set Name="HBMMENU_MBAR_MINIMIZE_D"     Value="7" />
//                <Set Name="HBMMENU_POPUP_CLOSE"         Value="8" />
//                <Set Name="HBMMENU_POPUP_RESTORE"       Value="9" />
//                <Set Name="HBMMENU_POPUP_MAXIMIZE"      Value="10" />
//                <Set Name="HBMMENU_POPUP_MINIMIZE"      Value="11" />
//            </Flag>
//        </Variable>
//
//        <!-- MENUITEMINFO -->
//        <Variable Name="MENUITEMINFO" Type="Struct">
//            <Field Type="UINT"                    Name="cbSize" />
//            <Field Type="[MENUITEMINFO_MASK]"   Name="fMask" />
//            <Field Type="[MENUITEM_TYPE]"       Name="fType" />
//            <Field Type="[MENUITEM_STATE]"      Name="fState" />
//            <Field Type="UINT"                    Name="wID" />
//            <Field Type="HMENU"                   Name="hSubMenu" />
//            <Field Type="HBITMAP"                 Name="hbmpChecked" />
//            <Field Type="HBITMAP"                 Name="hbmpUnchecked" />
//            <Field Type="ULONG_PTR"             Name="dwItemData" />
//            <Field Type="LPTSTR"                  Name="dwTypeData" />
//            <Field Type="UINT"                    Name="cch" />
//            <Field Type="[HBMMENU]"             Name="hbmpItem" />
//        </Variable>
//        <Variable Name="LPMENUITEMINFO"  Type="Pointer" Base="MENUITEMINFO" />
//        <Variable Name="LPCMENUITEMINFO"  Type="Pointer" Base="MENUITEMINFO" />
//
//        <!-- TPMPARAMS -->
//        <Variable Name="TPMPARAMS" Type="Struct">
//            <Field Type="UINT"  Name="cbSize" />
//            <Field Type="RECT"  Name="rcExclude" />
//        </Variable>
//        <Variable Name="LPTPMPARAMS" Type="Pointer" Base="TPMPARAMS" />
//
//        <!-- MOUSEMOVEPOINT -->
//        <Variable Name="MOUSEMOVEPOINT" Type="Struct">
//            <Field Type="int"         Name="x" />
//            <Field Type="int"         Name="y" />
//            <Field Type="DWORD"       Name="time" />
//            <Field Type="ULONG_PTR" Name="dwExtraInfo" />
//        </Variable>
//        <Variable Name="LPMOUSEMOVEPOINT" Type="Pointer" Base="MOUSEMOVEPOINT" />
//
//        <!-- MONITORINFO -->
//        <Variable Name="MONITORINFO" Type="Struct">
//            <Field Type="DWORD"                   Name="cbSize" />
//            <Field Type="RECT"                    Name="rcMonitor" />
//            <Field Type="RECT"                    Name="rcWork" />
//            <Field Type="[MONITORINFO_Flags]"   Name="dwFlags" />
//        </Variable>
//        <Variable Name="LPMONITORINFO" Type="Pointer" Base="MONITORINFO" />
//
//        <!-- [RAWINPUTDEVICE_Flags] -->
//        <Variable Name="[RAWINPUTDEVICE_Flags]" Type="Alias" Base="DWORD">
//            <Display Name="DWORD" />
//            <Flag>
//                <Set Name="RIDEV_REMOVE"           Value="0x00000001" />
//                <Set Name="RIDEV_EXCLUDE"          Value="0x00000010" />
//                <Set Name="RIDEV_PAGEONLY"         Value="0x00000020" />
//                <Set Name="RIDEV_NOLEGACY"         Value="0x00000030" />
//                <Set Name="RIDEV_INPUTSINK"        Value="0x00000100" />
//                <Set Name="RIDEV_CAPTUREMOUSE"     Value="0x00000200" />
//                <Set Name="RIDEV_NOHOTKEYS"        Value="0x00000200" />
//                <Set Name="RIDEV_APPKEYS"          Value="0x00000400" />
//                <Set Name="RIDEV_EXINPUTSINK"      Value="0x00001000" />
//                <Set Name="RIDEV_DEVNOTIFY"        Value="0x00002000" />
//                <Set Name="RIDEV_EXMODEMASK"       Value="0x000000F0" />
//            </Flag>
//        </Variable>
//
//        <!-- RAWINPUTDEVICE -->
//        <Variable Name="RAWINPUTDEVICE" Type="Struct">
//            <Field Type="USHORT"                      Name="usUsagePage" />
//            <Field Type="USHORT"                      Name="usUsage" />
//            <Field Type="[RAWINPUTDEVICE_Flags]"    Name="dwFlags" />
//            <Field Type="HWND"                            Name="hwndTarget" />
//        </Variable>
//        <Variable Name="PRAWINPUTDEVICE"  Type="Pointer" Base="RAWINPUTDEVICE" />
//        <Variable Name="PCRAWINPUTDEVICE" Type="Pointer" Base="RAWINPUTDEVICE" />
//
//        <!-- [RIM_TYPE] -->
//        <Variable Name="[RIM_TYPE]" Type="Alias" Base="DWORD">
//            <Display Name="DWORD" />
//            <Enum>
//                <Set Name="RIM_TYPEMOUSE"       Value="0" />
//                <Set Name="RIM_TYPEKEYBOARD"    Value="1" />
//                <Set Name="RIM_TYPEHID"         Value="2" />
//            </Enum>
//        </Variable>
//
//        <!-- RAWINPUTDEVICELIST -->
//        <Variable Name="RAWINPUTDEVICELIST" Type="Struct">
//            <Field Type="HANDLE"          Name="hDevice" />
//            <Field Type="[RIM_TYPE]"    Name="dwType" />
//        </Variable>
//        <Variable Name="PRAWINPUTDEVICELIST" Type="Pointer" Base="RAWINPUTDEVICELIST" />
//
//        <!-- [ClassStyle] -->
//        <Variable Name="[ClassStyle]" Type="Alias" Base="UINT">
//            <Display Name="UINT" />
//            <Flag>
//                <Set Name="CS_VREDRAW"          Value="0x0001" />
//                <Set Name="CS_HREDRAW"          Value="0x0002" />
//                <Set Name="CS_DBLCLKS"          Value="0x0008" />
//                <Set Name="CS_OWNDC"            Value="0x0020" />
//                <Set Name="CS_CLASSDC"          Value="0x0040" />
//                <Set Name="CS_PARENTDC"         Value="0x0080" />
//                <Set Name="CS_NOCLOSE"          Value="0x0200" />
//                <Set Name="CS_SAVEBITS"         Value="0x0800" />
//                <Set Name="CS_BYTEALIGNCLIENT"  Value="0x1000" />
//                <Set Name="CS_BYTEALIGNWINDOW"  Value="0x2000" />
//                <Set Name="CS_GLOBALCLASS"      Value="0x4000" />
//                <Set Name="CS_IME"              Value="0x00010000" />
//                <Set Name="CS_DROPSHADOW"       Value="0x00020000" />
//            </Flag>
//        </Variable>
//
//        <!-- WNDCLASS -->
//        <Variable Name="WNDCLASS" Type="Struct">
//            <Field Type="[ClassStyle]"  Name="style" />
//            <Field Type="WNDPROC"               Name="lpfnWndProc" />
//            <Field Type="int"                   Name="cbClsExtra" />
//            <Field Type="int"                   Name="cbWndExtra" />
//            <Field Type="HINSTANCE"             Name="hInstance" />
//            <Field Type="HICON"                 Name="hIcon" />
//            <Field Type="HCURSOR"               Name="hCursor" />
//            <Field Type="HBRUSH"                Name="hbrBackground" />
//            <Field Type="LPCTSTR"               Name="lpszMenuName" />
//            <Field Type="LPCTSTR"               Name="lpszClassName" />
//        </Variable>
//        <Variable Name="LPWNDCLASS"         Type="Pointer" Base="WNDCLASS" />
//        <Variable Name="CONST WNDCLASS*"    Type="Pointer" Base="WNDCLASS" />
//
//        <!-- WNDCLASSEX -->
//        <Variable Name="WNDCLASSEX" Type="Struct">
//            <Field Type="UINT"                  Name="cbSize" />
//            <Field Type="[ClassStyle]"  Name="style" />
//            <Field Type="WNDPROC"               Name="lpfnWndProc" />
//            <Field Type="int"                   Name="cbClsExtra" />
//            <Field Type="int"                   Name="cbWndExtra" />
//            <Field Type="HINSTANCE"             Name="hInstance" />
//            <Field Type="HICON"                 Name="hIcon" />
//            <Field Type="HCURSOR"               Name="hCursor" />
//            <Field Type="HBRUSH"                Name="hbrBackground" />
//            <Field Type="LPCTSTR"               Name="lpszMenuName" />
//            <Field Type="LPCTSTR"               Name="lpszClassName" />
//            <Field Type="HICON"                 Name="hIconSm" />
//        </Variable>
//        <Variable Name="LPWNDCLASSEX"       Type="Pointer" Base="WNDCLASSEX" />
//        <Variable Name="CONST WNDCLASSEX*"  Type="Pointer" Base="WNDCLASSEX" />
//
//        <!-- [WindowLongIndex] -->
//        <Variable Name="[WindowLongIndex]" Type="Alias" Base="int">
//            <Display Name="int" />
//            <Enum>
//                <Set Name="GWL_WNDPROC"                     Value="-4" />
//                <Set Name="GWL_HINSTANCE"                   Value="-6" />
//                <Set Name="GWL_HWNDPARENT"                  Value="-8" />
//                <Set Name="GWL_ID"                          Value="-12" />
//                <Set Name="GWL_STYLE"                       Value="-16" />
//                <Set Name="GWL_EXSTYLE"                     Value="-20" />
//                <Set Name="GWL_USERDATA"                    Value="-21" />
//                <Set Name="DWL_MSGRESULT"                   Value="0" />
//                <Set Name="DWL_DLGPROC"                     Value="4" />
//                <Set Name="DWL_USER"                        Value="8" />
//            </Enum>
//        </Variable>
//
//        <!-- [ClassLongIndex] -->
//        <Variable Name="[ClassLongIndex]" Type="Alias" Base="int">
//            <Display Name="int" />
//            <Enum>
//                <Set Name="GCL_MENUNAME"                    Value="-8" />
//                <Set Name="GCL_HBRBACKGROUND"               Value="-10" />
//                <Set Name="GCL_HCURSOR"                     Value="-12" />
//                <Set Name="GCL_HICON"                       Value="-14" />
//                <Set Name="GCL_HMODULE"                     Value="-16" />
//                <Set Name="GCL_CBWNDEXTRA"                  Value="-18" />
//                <Set Name="GCL_CBCLSEXTRA"                  Value="-20" />
//                <Set Name="GCL_WNDPROC"                     Value="-24" />
//                <Set Name="GCL_STYLE"                       Value="-26" />
//                <Set Name="GCW_ATOM"                        Value="-32" />
//                <Set Name="GCL_HICONSM"                     Value="-34" />
//            </Enum>
//        </Variable>
//
//        <!-- [SystemMetricIndex] -->
//        <Variable Name="[SystemMetricIndex]" Type="Alias" Base="int">
//            <Display Name="int" />
//            <Enum>
//                <Set Name="SM_CXSCREEN"                     Value="0" />
//                <Set Name="SM_CYSCREEN"                     Value="1" />
//                <Set Name="SM_CXVSCROLL"                    Value="2" />
//                <Set Name="SM_CYHSCROLL"                    Value="3" />
//                <Set Name="SM_CYCAPTION"                    Value="4" />
//                <Set Name="SM_CXBORDER"                     Value="5" />
//                <Set Name="SM_CYBORDER"                     Value="6" />
//                <Set Name="SM_CXDLGFRAME"                   Value="7" />
//                <Set Name="SM_CYDLGFRAME"                   Value="8" />
//                <Set Name="SM_CYVTHUMB"                     Value="9" />
//                <Set Name="SM_CXHTHUMB"                     Value="10" />
//                <Set Name="SM_CXICON"                       Value="11" />
//                <Set Name="SM_CYICON"                       Value="12" />
//                <Set Name="SM_CXCURSOR"                     Value="13" />
//                <Set Name="SM_CYCURSOR"                     Value="14" />
//                <Set Name="SM_CYMENU"                       Value="15" />
//                <Set Name="SM_CXFULLSCREEN"                 Value="16" />
//                <Set Name="SM_CYFULLSCREEN"                 Value="17" />
//                <Set Name="SM_CYKANJIWINDOW"                Value="18" />
//                <Set Name="SM_MOUSEPRESENT"                 Value="19" />
//                <Set Name="SM_CYVSCROLL"                    Value="20" />
//                <Set Name="SM_CXHSCROLL"                    Value="21" />
//                <Set Name="SM_DEBUG"                        Value="22" />
//                <Set Name="SM_SWAPBUTTON"                   Value="23" />
//                <Set Name="SM_RESERVED1"                    Value="24" />
//                <Set Name="SM_RESERVED2"                    Value="25" />
//                <Set Name="SM_RESERVED3"                    Value="26" />
//                <Set Name="SM_RESERVED4"                    Value="27" />
//                <Set Name="SM_CXMIN"                        Value="28" />
//                <Set Name="SM_CYMIN"                        Value="29" />
//                <Set Name="SM_CXSIZE"                       Value="30" />
//                <Set Name="SM_CYSIZE"                       Value="31" />
//                <Set Name="SM_CXFRAME"                      Value="32" />
//                <Set Name="SM_CYFRAME"                      Value="33" />
//                <Set Name="SM_CXMINTRACK"                   Value="34" />
//                <Set Name="SM_CYMINTRACK"                   Value="35" />
//                <Set Name="SM_CXDOUBLECLK"                  Value="36" />
//                <Set Name="SM_CYDOUBLECLK"                  Value="37" />
//                <Set Name="SM_CXICONSPACING"                Value="38" />
//                <Set Name="SM_CYICONSPACING"                Value="39" />
//                <Set Name="SM_MENUDROPALIGNMENT"            Value="40" />
//                <Set Name="SM_PENWINDOWS"                   Value="41" />
//                <Set Name="SM_DBCSENABLED"                  Value="42" />
//                <Set Name="SM_CMOUSEBUTTONS"                Value="43" />
//                <Set Name="SM_SECURE"                       Value="44" />
//                <Set Name="SM_CXEDGE"                       Value="45" />
//                <Set Name="SM_CYEDGE"                       Value="46" />
//                <Set Name="SM_CXMINSPACING"                 Value="47" />
//                <Set Name="SM_CYMINSPACING"                 Value="48" />
//                <Set Name="SM_CXSMICON"                     Value="49" />
//                <Set Name="SM_CYSMICON"                     Value="50" />
//                <Set Name="SM_CYSMCAPTION"                  Value="51" />
//                <Set Name="SM_CXSMSIZE"                     Value="52" />
//                <Set Name="SM_CYSMSIZE"                     Value="53" />
//                <Set Name="SM_CXMENUSIZE"                   Value="54" />
//                <Set Name="SM_CYMENUSIZE"                   Value="55" />
//                <Set Name="SM_ARRANGE"                      Value="56" />
//                <Set Name="SM_CXMINIMIZED"                  Value="57" />
//                <Set Name="SM_CYMINIMIZED"                  Value="58" />
//                <Set Name="SM_CXMAXTRACK"                   Value="59" />
//                <Set Name="SM_CYMAXTRACK"                   Value="60" />
//                <Set Name="SM_CXMAXIMIZED"                  Value="61" />
//                <Set Name="SM_CYMAXIMIZED"                  Value="62" />
//                <Set Name="SM_NETWORK"                      Value="63" />
//                <Set Name="SM_CLEANBOOT"                    Value="67" />
//                <Set Name="SM_CXDRAG"                       Value="68" />
//                <Set Name="SM_CYDRAG"                       Value="69" />
//                <Set Name="SM_SHOWSOUNDS"                   Value="70" />
//                <Set Name="SM_CXMENUCHECK"                  Value="71" />
//                <Set Name="SM_CYMENUCHECK"                  Value="72" />
//                <Set Name="SM_SLOWMACHINE"                  Value="73" />
//                <Set Name="SM_MIDEASTENABLED"               Value="74" />
//                <Set Name="SM_MOUSEWHEELPRESENT"            Value="75" />
//                <Set Name="SM_XVIRTUALSCREEN"               Value="76" />
//                <Set Name="SM_YVIRTUALSCREEN"               Value="77" />
//                <Set Name="SM_CXVIRTUALSCREEN"              Value="78" />
//                <Set Name="SM_CYVIRTUALSCREEN"              Value="79" />
//                <Set Name="SM_CMONITORS"                    Value="80" />
//                <Set Name="SM_SAMEDISPLAYFORMAT"            Value="81" />
//                <Set Name="SM_IMMENABLED"                   Value="82" />
//                <Set Name="SM_CXFOCUSBORDER"                Value="83" />
//                <Set Name="SM_CYFOCUSBORDER"                Value="84" />
//                <Set Name="SM_TABLETPC"                     Value="86" />
//                <Set Name="SM_MEDIACENTER"                  Value="87" />
//                <Set Name="SM_STARTER"                      Value="88" />
//                <Set Name="SM_SERVERR2"                     Value="89" />
//                <Set Name="SM_MOUSEHORIZONTALWHEELPRESENT"  Value="91" />
//                <Set Name="SM_CXPADDEDBORDER"               Value="92" />
//            </Enum>
//        </Variable>
//
//        <!-- [PeekMessageFlag] -->
//        <Variable Name="[PeekMessageFlag]" Type="Alias" Base="UINT">
//            <Display Name="UINT" />
//            <Flag>
//                <Set Name="PM_NOREMOVE"                     Value="0x0000" />
//                <Set Name="PM_REMOVE"                       Value="0x0001" />
//                <Set Name="PM_NOYIELD"                      Value="0x0002" />
//                <Set Name="PM_QS_INPUT"                     Value="0x4070000" />
//                <Set Name="PM_QS_POSTMESSAGE"               Value="0x980000" />
//                <Set Name="PM_QS_PAINT"                     Value="0x200000" />
//                <Set Name="PM_QS_SENDMESSAGE"               Value="0x400000" />
//            </Flag>
//        </Variable>
//
//        <!-- [QueueStatusFlag] -->
//        <Variable Name="[QueueStatusFlag]" Type="Alias" Base="DWORD">
//            <Display Name="DWORD" />
//            <Flag>
//                <Set Name="QS_KEY"                  Value="0x0001" />
//                <Set Name="QS_MOUSEMOVE"            Value="0x0002" />
//                <Set Name="QS_MOUSEBUTTON"          Value="0x0004" />
//                <Set Name="QS_POSTMESSAGE"          Value="0x0008" />
//                <Set Name="QS_TIMER"                Value="0x0010" />
//                <Set Name="QS_PAINT"                Value="0x0020" />
//                <Set Name="QS_SENDMESSAGE"          Value="0x0040" />
//                <Set Name="QS_HOTKEY"               Value="0x0080" />
//                <Set Name="QS_ALLPOSTMESSAGE"       Value="0x0100" />
//                <Set Name="QS_RAWINPUT"             Value="0x0400" />
//                <Set Name="QS_MOUSE"                Value="0x0006" />
//                <Set Name="QS_INPUT"                Value="0x0407" />
//                <Set Name="QS_ALLEVENTS"            Value="0x04bf" />
//                <Set Name="QS_ALLINPUT"             Value="0x04ff" />
//            </Flag>
//        </Variable>
//
//        <!-- [WindowMessageFilterEnum] -->
//        <Variable Name="[WindowMessageFilterEnum]" Type="Alias" Base="DWORD">
//            <Display Name="DWORD" />
//            <Enum>
//                <Set Name="MSGFLT_ADD"              Value="1" />
//                <Set Name="MSGFLT_REMOVE"           Value="2" />
//            </Enum>
//        </Variable>
//
//        <!-- [UserObjectInformationEnum] -->
//        <Variable Name="[UserObjectInformationEnum]" Type="Alias" Base="int">
//            <Display Name="int" />
//            <Enum>
//                <Set Name="UOI_FLAGS"           Value="1" />
//                <Set Name="UOI_NAME"            Value="2" />
//                <Set Name="UOI_TYPE"            Value="3" />
//                <Set Name="UOI_USER_SID"        Value="4" />
//                <Set Name="UOI_HEAPSIZE"        Value="5" />
//                <Set Name="UOI_IO"              Value="6" />
//            </Enum>
//        </Variable>
//
//        <!-- [GetAncestorEnum] -->
//        <Variable Name="[GetAncestorEnum]" Type="Alias" Base="UINT">
//            <Display Name="UINT" />
//            <Enum>
//                <Set Name="GA_PARENT"           Value="1" />
//                <Set Name="GA_ROOT"             Value="2" />
//                <Set Name="GA_ROOTOWNER"        Value="3" />
//            </Enum>
//        </Variable>
//
//        <!-- [GetWindowEnum] -->
//        <Variable Name="[GetWindowEnum]" Type="Alias" Base="UINT">
//            <Display Name="UINT" />
//            <Enum>
//                <Set Name="GW_HWNDFIRST"        Value="0" />
//                <Set Name="GW_HWNDLAST"         Value="1" />
//                <Set Name="GW_HWNDNEXT"         Value="2" />
//                <Set Name="GW_HWNDPREV"         Value="3" />
//                <Set Name="GW_OWNER"            Value="4" />
//                <Set Name="GW_CHILD"            Value="5" />
//                <Set Name="GW_ENABLEDPOPUP"     Value="6" />
//            </Enum>
//        </Variable>
//
//        <!-- [DCExFlags] -->
//        <Variable Name="[DCExFlags]" Type="Alias" Base="DWORD">
//            <Display Name="DWORD" />
//            <Flag>
//                <Set Name="DCX_WINDOW"              Value="0x00000001" />
//                <Set Name="DCX_CACHE"               Value="0x00000002" />
//                <Set Name="DCX_NORESETATTRS"        Value="0x00000004" />
//                <Set Name="DCX_CLIPCHILDREN"        Value="0x00000008" />
//                <Set Name="DCX_CLIPSIBLINGS"        Value="0x00000010" />
//                <Set Name="DCX_PARENTCLIP"          Value="0x00000020" />
//                <Set Name="DCX_EXCLUDERGN"          Value="0x00000040" />
//                <Set Name="DCX_INTERSECTRGN"        Value="0x00000080" />
//                <Set Name="DCX_EXCLUDEUPDATE"       Value="0x00000100" />
//                <Set Name="DCX_INTERSECTUPDATE"     Value="0x00000200" />
//                <Set Name="DCX_LOCKWINDOWUPDATE"    Value="0x00000400" />
//                <Set Name="DCX_VALIDATE"            Value="0x00200000" />
//            </Flag>
//        </Variable>
//
//        <!-- [EnumDisplayDevicesFlags] -->
//        <Variable Name="[EnumDisplayDevicesFlags]" Type="Alias" Base="DWORD">
//            <Display Name="DWORD" />
//            <Flag>
//                <Set Name="EDD_GET_DEVICE_INTERFACE_NAME"   Value="0x00000001" />
//            </Flag>
//        </Variable>
//
//        <!-- [WinEventFlags] -->
//        <Variable Name="[WinEventFlags]" Type="Alias" Base="UINT">
//            <Display Name="UINT" />
//            <Flag>
//                <Set Name="WINEVENT_OUTOFCONTEXT"       Value="0x0000" />
//                <Set Name="WINEVENT_SKIPOWNTHREAD"      Value="0x0001" />
//                <Set Name="WINEVENT_SKIPOWNPROCESS"     Value="0x0002" />
//                <Set Name="WINEVENT_INCONTEXT"          Value="0x0004" />
//            </Flag>
//        </Variable>
//
//        <!-- [RedrawWindowFlags] -->
//        <Variable Name="[RedrawWindowFlags]" Type="Alias" Base="UINT">
//            <Display Name="UINT" />
//            <Flag>
//                <Set Name="RDW_INVALIDATE"          Value="0x0001" />
//                <Set Name="RDW_INTERNALPAINT"       Value="0x0002" />
//                <Set Name="RDW_ERASE"               Value="0x0004" />
//                <Set Name="RDW_VALIDATE"            Value="0x0008" />
//                <Set Name="RDW_NOINTERNALPAINT"     Value="0x0010" />
//                <Set Name="RDW_NOERASE"             Value="0x0020" />
//                <Set Name="RDW_NOCHILDREN"          Value="0x0040" />
//                <Set Name="RDW_ALLCHILDREN"         Value="0x0080" />
//                <Set Name="RDW_UPDATENOW"           Value="0x0100" />
//                <Set Name="RDW_ERASENOW"            Value="0x0200" />
//                <Set Name="RDW_FRAME"               Value="0x0400" />
//                <Set Name="RDW_NOFRAME"             Value="0x0800" />
//            </Flag>
//        </Variable>
//
//        <!-- [AnimateWindowFlags] -->
//        <Variable Name="[AnimateWindowFlags]" Type="Alias" Base="DWORD">
//            <Display Name="DWORD" />
//            <Flag>
//                <Set Name="AW_HOR_POSITIVE"         Value="0x00000001" />
//                <Set Name="AW_HOR_NEGATIVE"         Value="0x00000002" />
//                <Set Name="AW_VER_POSITIVE"         Value="0x00000004" />
//                <Set Name="AW_VER_NEGATIVE"         Value="0x00000008" />
//                <Set Name="AW_CENTER"               Value="0x00000010" />
//                <Set Name="AW_HIDE"                 Value="0x00010000" />
//                <Set Name="AW_ACTIVATE"             Value="0x00020000" />
//                <Set Name="AW_SLIDE"                Value="0x00040000" />
//                <Set Name="AW_BLEND"                Value="0x00080000" />
//            </Flag>
//        </Variable>
//
//        <!-- [SetWindowPosFlags] -->
//        <Variable Name="[SetWindowPosFlags]" Type="Alias" Base="UINT">
//            <Display Name="UINT" />
//            <Flag>
//                <Set Name="SWP_NOSIZE"          Value="0x0001" />
//                <Set Name="SWP_NOMOVE"          Value="0x0002" />
//                <Set Name="SWP_NOZORDER"        Value="0x0004" />
//                <Set Name="SWP_NOREDRAW"        Value="0x0008" />
//                <Set Name="SWP_NOACTIVATE"      Value="0x0010" />
//                <Set Name="SWP_FRAMECHANGED"    Value="0x0020" />
//                <Set Name="SWP_SHOWWINDOW"      Value="0x0040" />
//                <Set Name="SWP_HIDEWINDOW"      Value="0x0080" />
//                <Set Name="SWP_NOCOPYBITS"      Value="0x0100" />
//                <Set Name="SWP_NOSENDCHANGING"  Value="0x0400" />
//                <Set Name="SWP_NOREPOSITION"    Value="0x0200" />
//                <Set Name="SWP_DEFERERASE"      Value="0x2000" />
//                <Set Name="SWP_ASYNCWINDOWPOS"  Value="0x4000" />
//            </Flag>
//        </Variable>
//
//        <!-- [SendMessageTimeoutFlags] -->
//        <Variable Name="[SendMessageTimeoutFlags]" Type="Alias" Base="UINT">
//            <Display Name="UINT" />
//            <Flag>
//                <Set Name="SMTO_NORMAL"                 Value="0x0000" />
//                <Set Name="SMTO_BLOCK"                  Value="0x0001" />
//                <Set Name="SMTO_ABORTIFHUNG"            Value="0x0002" />
//                <Set Name="SMTO_NOTIMEOUTIFNOTHUNG"     Value="0x0008" />
//                <Set Name="SMTO_ERRORONEXIT"            Value="0x0020" />
//            </Flag>
//        </Variable>
//
//        <!-- [DrawIconFlags] -->
//        <Variable Name="[DrawIconFlags]" Type="Alias" Base="UINT">
//            <Display Name="UINT" />
//            <Flag>
//                <Set Name="DI_MASK"         Value="0x0001" />
//                <Set Name="DI_IMAGE"        Value="0x0002" />
//                <Set Name="DI_NORMAL"       Value="0x0003" />
//                <Set Name="DI_COMPAT"       Value="0x0004" />
//                <Set Name="DI_DEFAULTSIZE"  Value="0x0008" />
//                <Set Name="DI_NOMIRROR"     Value="0x0010" />
//            </Flag>
//        </Variable>
//
//        <!-- [ObjectIdEnum] -->
//        <Variable Name="[ObjectIdEnum]" Type="Alias" Base="LONG">
//            <Display Name="LONG" />
//            <Enum>
//                <Set Name="OBJID_WINDOW"                Value="0x00000000" />
//                <Set Name="OBJID_SYSMENU"               Value="0xFFFFFFFF" />
//                <Set Name="OBJID_TITLEBAR"              Value="0xFFFFFFFE" />
//                <Set Name="OBJID_MENU"                  Value="0xFFFFFFFD" />
//                <Set Name="OBJID_CLIENT"                Value="0xFFFFFFFC" />
//                <Set Name="OBJID_VSCROLL"               Value="0xFFFFFFFB" />
//                <Set Name="OBJID_HSCROLL"               Value="0xFFFFFFFA" />
//                <Set Name="OBJID_SIZEGRIP"              Value="0xFFFFFFF9" />
//                <Set Name="OBJID_CARET"                 Value="0xFFFFFFF8" />
//                <Set Name="OBJID_CURSOR"                Value="0xFFFFFFF7" />
//                <Set Name="OBJID_ALERT"                 Value="0xFFFFFFF6" />
//                <Set Name="OBJID_SOUND"                 Value="0xFFFFFFF5" />
//                <Set Name="OBJID_QUERYCLASSNAMEIDX"     Value="0xFFFFFFF4" />
//                <Set Name="OBJID_NATIVEOM"              Value="0xFFFFFFF0" />
//            </Enum>
//        </Variable>
//
//        <!-- [DrawStateFlags] -->
//        <Variable Name="[DrawStateFlags]" Type="Alias" Base="UINT">
//            <Display Name="UINT" />
//            <Flag>
//                <Set Name="DST_COMPLEX"         Value="0x0000" />
//                <Set Name="DST_TEXT"            Value="0x0001" />
//                <Set Name="DST_PREFIXTEXT"      Value="0x0002" />
//                <Set Name="DST_ICON"            Value="0x0003" />
//                <Set Name="DST_BITMAP"          Value="0x0004" />
//                <Set Name="DSS_NORMAL"          Value="0x0000" />
//                <Set Name="DSS_UNION"           Value="0x0010" />
//                <Set Name="DSS_DISABLED"        Value="0x0020" />
//                <Set Name="DSS_MONO"            Value="0x0080" />
//                <Set Name="DSS_HIDEPREFIX"      Value="0x0200" />
//                <Set Name="DSS_PREFIXONLY"      Value="0x0400" />
//                <Set Name="DSS_RIGHT"           Value="0x8000" />
//            </Flag>
//        </Variable>
//
//        <!-- [MenuCommandPosFlag] -->
//        <Variable Name="[MenuCommandPosFlag]" Type="Alias" Base="UINT">
//            <Display Name="UINT" />
//            <Enum>
//                <Set Name="MF_BYCOMMAND"        Value="0x00000000" />
//                <Set Name="MF_BYPOSITION"       Value="0x00000400" />
//            </Enum>
//        </Variable>
//
//        <Variable Name="[InsertMenuFlags]" Type="Alias" Base="UINT">
//            <Display Name="UINT" />
//            <Flag>
//                <Set Name="MF_BYCOMMAND"        Value="0x00000000" />
//                <Set Name="MF_BYPOSITION"       Value="0x00000400" />
//                <Set Name="MF_BITMAP"           Value="0x00000004" />
//                <Set Name="MF_CHECKED"          Value="0x00000008" />
//                <Set Name="MF_DISABLED"         Value="0x00000002" />
//                <Set Name="MF_ENABLED"          Value="0x00000000" />
//                <Set Name="MF_GRAYED"           Value="0x00000001" />
//                <Set Name="MF_MENUBARBREAK"     Value="0x00000020" />
//                <Set Name="MF_MENUBREAK"        Value="0x00000040" />
//                <Set Name="MF_OWNERDRAW"        Value="0x00000100" />
//                <Set Name="MF_POPUP"            Value="0x00000010" />
//                <Set Name="MF_SEPARATOR"        Value="0x00000800" />
//                <Set Name="MF_STRING"           Value="0x00000000" />
//                <Set Name="MF_UNCHECKED"        Value="0x00000000" />
//            </Flag>
//        </Variable>
//
//        <!-- [EnableMenuItemFlag] -->
//        <Variable Name="[EnableMenuItemFlag]" Type="Alias" Base="UINT">
//            <Display Name="UINT" />
//            <Flag>
//                <Set Name="MF_BYCOMMAND"    Value="0x00000000" />
//                <Set Name="MF_BYPOSITION"   Value="0x00000400" />
//                <Set Name="MF_ENABLED"      Value="0x00000000" />
//                <Set Name="MF_GRAYED"       Value="0x00000001" />
//                <Set Name="MF_DISABLED"     Value="0x00000002" />
//            </Flag>
//        </Variable>
//
//        <!-- [EnableMenuItemResult] -->
//        <Variable Name="[EnableMenuItemResult]" Type="Alias" Base="int">
//            <Display Name="BOOL" />
//            <Enum>
//                <Set Name="MF_ENABLED"      Value="0x00000000" />
//                <Set Name="MF_GRAYED"       Value="0x00000001" />
//                <Set Name="MF_DISABLED"     Value="0x00000002" />
//            </Enum>
//        </Variable>
//
//        <!-- [CheckMenuItemFlag] -->
//        <Variable Name="[CheckMenuItemFlag]" Type="Alias" Base="UINT">
//            <Display Name="UINT" />
//            <Flag>
//                <Set Name="MF_BYCOMMAND"    Value="0x00000000" />
//                <Set Name="MF_BYPOSITION"   Value="0x00000400" />
//                <Set Name="MF_CHECKED"      Value="0x00000008" />
//                <Set Name="MF_UNCHECKED"    Value="0x00000000" />
//            </Flag>
//        </Variable>
//
//        <!-- [ClipboardFormat] -->
//        <Variable Name="[ClipboardFormat]" Type="Alias" Base="UINT">
//            <Display Name="UINT" />
//            <Enum>
//                <Set Name="CF_TEXT"             Value="1" />
//                <Set Name="CF_BITMAP"           Value="2" />
//                <Set Name="CF_METAFILEPICT"     Value="3" />
//                <Set Name="CF_SYLK"             Value="4" />
//                <Set Name="CF_DIF"              Value="5" />
//                <Set Name="CF_TIFF"             Value="6" />
//                <Set Name="CF_OEMTEXT"          Value="7" />
//                <Set Name="CF_DIB"              Value="8" />
//                <Set Name="CF_PALETTE"          Value="9" />
//                <Set Name="CF_PENDATA"          Value="10" />
//                <Set Name="CF_RIFF"             Value="11" />
//                <Set Name="CF_WAVE"             Value="12" />
//                <Set Name="CF_UNICODETEXT"      Value="13" />
//                <Set Name="CF_ENHMETAFILE"      Value="14" />
//                <Set Name="CF_HDROP"            Value="15" />
//                <Set Name="CF_LOCALE"           Value="16" />
//                <Set Name="CF_DIBV5"            Value="17" />
//                <Set Name="CF_OWNERDISPLAY"     Value="0x0080" />
//                <Set Name="CF_DSPTEXT"          Value="0x0081" />
//                <Set Name="CF_DSPBITMAP"        Value="0x0082" />
//                <Set Name="CF_DSPMETAFILEPICT"  Value="0x0083" />
//                <Set Name="CF_DSPENHMETAFILE"   Value="0x008E" />
//            </Enum>
//        </Variable>
//
//        <!-- [HwndInsertAfterEnum] -->
//        <Variable Name="[HwndInsertAfterEnum]" Type="Alias" Base="HWND">
//            <Display Name="HWND" />
//            <Flag Reset="True">
//                <Set Name="HWND_TOP"            Value="0" />
//                <Set Name="HWND_BOTTOM"         Value="1" />
//                <Set Name="HWND_TOPMOST"        Value="-1" />
//                <Set Name="HWND_NOTOPMOST"      Value="-2" />
//            </Flag>
//        </Variable>
//
//        <!-- [WindowsHook] -->
//        <Variable Name="[WindowsHook]" Type="Alias" Base="int">
//            <Display Name="int" />
//            <Enum>
//                <Set Name="WH_MSGFILTER"        Value="-1" />
//                <Set Name="WH_JOURNALRECORD"    Value="0" />
//                <Set Name="WH_JOURNALPLAYBACK"  Value="1" />
//                <Set Name="WH_KEYBOARD"         Value="2" />
//                <Set Name="WH_GETMESSAGE"       Value="3" />
//                <Set Name="WH_CALLWNDPROC"      Value="4" />
//                <Set Name="WH_CBT"              Value="5" />
//                <Set Name="WH_SYSMSGFILTER"     Value="6" />
//                <Set Name="WH_MOUSE"            Value="7" />
//                <Set Name="WH_HARDWARE"         Value="8" />
//                <Set Name="WH_DEBUG"            Value="9" />
//                <Set Name="WH_SHELL"            Value="10" />
//                <Set Name="WH_FOREGROUNDIDLE"   Value="11" />
//                <Set Name="WH_CALLWNDPROCRET"   Value="12" />
//                <Set Name="WH_KEYBOARD_LL"      Value="13" />
//                <Set Name="WH_MOUSE_LL"         Value="14" />
//            </Enum>
//        </Variable>
//
//        <!--
//    TODO: We can't use these in CallNextHookEx since the value depends on type of hook
//    <Enum Name="HookCode">
//        <Set Name="HC_ACTION"           Value="0" />
//        <Set Name="HC_GETNEXT"          Value="1" />
//        <Set Name="HC_SKIP"             Value="2" />
//        <Set Name="HC_NOREMOVE"         Value="3" />
//        <Set Name="HC_SYSMODALON"       Value="4" />
//        <Set Name="HC_SYSMODALOFF"      Value="5" />
//    </Enum>
//    <Enum Name="CBTHookCode">
//        <Set Name="HCBT_MOVESIZE"       Value="0" />
//        <Set Name="HCBT_MINMAX"         Value="1" />
//        <Set Name="HCBT_QS"             Value="2" />
//        <Set Name="HCBT_CREATEWND"      Value="3" />
//        <Set Name="HCBT_DESTROYWND"     Value="4" />
//        <Set Name="HCBT_ACTIVATE"       Value="5" />
//        <Set Name="HCBT_CLICKSKIPPED"   Value="6" />
//        <Set Name="HCBT_KEYSKIPPED"     Value="7" />
//        <Set Name="HCBT_SYSCOMMAND"     Value="8" />
//        <Set Name="HCBT_SETFOCUS"       Value="9" />
//    </Enum>
//    -->
//        <!-- [MsgWaitForMultipleObjectsFlags] -->
//        <Variable Name="[MsgWaitForMultipleObjectsFlags]" Type="Alias" Base="DWORD">
//            <Display Name="DWORD" />
//            <Flag>
//                <Set Name="MWMO_WAITALL"        Value="0x0001" />
//                <Set Name="MWMO_ALERTABLE"      Value="0x0002" />
//                <Set Name="MWMO_INPUTAVAILABLE" Value="0x0004" />
//            </Flag>
//        </Variable>
//
//        <!-- [KeyboardLayoutHandle] -->
//        <Variable Name="[KeyboardLayoutHandle]" Type="Alias" Base="HKL">
//            <Display Name="HKL" />
//            <Enum Reset="True">
//                <Set Name="HKL_PREV"    Value="0" />
//                <Set Name="HKL_NEXT"    Value="1" />
//            </Enum>
//        </Variable>
//
//        <!-- [KeyboardLayoutFlags] -->
//        <Variable Name="[KeyboardLayoutFlags]" Type="Alias" Base="UINT">
//            <Display Name="UINT" />
//            <Flag>
//                <Set Name="KLF_ACTIVATE"        Value="0x00000001" />
//                <Set Name="KLF_SUBSTITUTE_OK"   Value="0x00000002" />
//                <Set Name="KLF_REORDER"         Value="0x00000008" />
//                <Set Name="KLF_REPLACELANG"     Value="0x00000010" />
//                <Set Name="KLF_NOTELLSHELL"     Value="0x00000080" />
//                <Set Name="KLF_SETFORPROCESS"   Value="0x00000100" />
//                <Set Name="KLF_SHIFTLOCK"       Value="0x00010000" />
//                <Set Name="KLF_RESET"           Value="0x40000000" />
//            </Flag>
//        </Variable>
//
//        <!-- [MonitorFlags] -->
//        <Variable Name="[MonitorFlags]" Type="Alias" Base="DWORD">
//            <Display Name="DWORD" />
//            <Flag>
//                <Set Name="MONITOR_DEFAULTTONULL"       Value="0x00000000" />
//                <Set Name="MONITOR_DEFAULTTOPRIMARY"    Value="0x00000001" />
//                <Set Name="MONITOR_DEFAULTTONEAREST"    Value="0x00000002" />
//            </Flag>
//        </Variable>
//
//        <!-- [ScrollWindowFlags] -->
//        <Variable Name="[ScrollWindowFlags]" Type="Alias" Base="UINT">
//            <Display Name="UINT" />
//            <Flag>
//                <Set Name="SW_SCROLLCHILDREN"   Value="0x0001" />
//                <Set Name="SW_INVALIDATE"       Value="0x0002" />
//                <Set Name="SW_ERASE"            Value="0x0004" />
//                <Set Name="SW_SMOOTHSCROLL"     Value="0x0010" />
//            </Flag>
//        </Variable>
//
//        <!-- [EnumDisplaySettingsEnum] -->
//        <Variable Name="[EnumDisplaySettingsEnum]" Type="Alias" Base="DWORD">
//            <Display Name="DWORD" />
//            <Enum>
//                <Set Name="ENUM_CURRENT_SETTINGS"   Value="-1" />
//                <Set Name="ENUM_REGISTRY_SETTINGS"  Value="-2" />
//            </Enum>
//        </Variable>
//
//        <!-- [ButtonState] -->
//        <Variable Name="[ButtonState]" Type="Alias" Base="UINT">
//            <Display Name="UINT" />
//            <Enum>
//                <Set Name="BST_UNCHECKED"       Value="0x0000" />
//                <Set Name="BST_CHECKED"         Value="0x0001" />
//                <Set Name="BST_INDETERMINATE"   Value="0x0002" />
//                <Set Name="BST_PUSHED"          Value="0x0004" />
//                <Set Name="BST_FOCUS"           Value="0x0008" />
//            </Enum>
//        </Variable>
//
//        <!-- [LayeredWindowAttribute] -->
//        <Variable Name="[LayeredWindowAttribute]" Type="Alias" Base="DWORD">
//            <Display Name="DWORD" />
//            <Flag>
//                <Set Name="LWA_COLORKEY"    Value="0x00000001" />
//                <Set Name="LWA_ALPHA"       Value="0x00000002" />
//            </Flag>
//        </Variable>
//        <Variable Name="[LayeredWindowAttribute*]" Type="Pointer" Base="[LayeredWindowAttribute]">
//            <Display Name="DWORD*" />
//        </Variable>
//
//        <!-- [UpdateLayeredWindowFlags] -->
//        <Variable Name="[UpdateLayeredWindowFlags]" Type="Alias" Base="DWORD">
//            <Display Name="DWORD" />
//            <Flag>
//                <Set Name="ULW_COLORKEY"    Value="0x00000001" />
//                <Set Name="ULW_ALPHA"       Value="0x00000002" />
//                <Set Name="ULW_OPAQUE"      Value="0x00000004" />
//            </Flag>
//        </Variable>
//
//        <!-- [MapVirtualKeyType] -->
//        <Variable Name="[MapVirtualKeyType]" Type="Alias" Base="UINT">
//            <Display Name="UINT" />
//            <Enum>
//                <Set Name="MAPVK_VK_TO_VSC"     Value="0" />
//                <Set Name="MAPVK_VSC_TO_VK"     Value="1" />
//                <Set Name="MAPVK_VK_TO_CHAR"    Value="2" />
//                <Set Name="MAPVK_VSC_TO_VK_EX"  Value="3" />
//                <Set Name="MAPVK_VK_TO_VSC_EX"  Value="4" />
//            </Enum>
//        </Variable>
//
//        <!-- [DesktopFlags] -->
//        <Variable Name="[DesktopFlags]" Type="Alias" Base="DWORD">
//            <Display Name="DWORD" />
//            <Enum>
//                <Set Name="DF_ALLOWOTHERACCOUNTHOOK"    Value="0x0001" />
//            </Enum>
//        </Variable>
//
//        <!-- [DESKTOP_ACCESS_MASK] -->
//        <Variable Name="[DESKTOP_ACCESS_MASK]" Type="Alias" Base="ACCESS_MASK">
//            <Display Name="ACCESS_MASK" />
//            <Flag>
//                <Set Name="DESKTOP_READOBJECTS"         Value="0x0001" />
//                <Set Name="DESKTOP_CREATEWINDOW"        Value="0x0002" />
//                <Set Name="DESKTOP_CREATEMENU"          Value="0x0004" />
//                <Set Name="DESKTOP_HOOKCONTROL"         Value="0x0008" />
//                <Set Name="DESKTOP_JOURNALRECORD"       Value="0x0010" />
//                <Set Name="DESKTOP_JOURNALPLAYBACK"     Value="0x0020" />
//                <Set Name="DESKTOP_ENUMERATE"           Value="0x0040" />
//                <Set Name="DESKTOP_WRITEOBJECTS"        Value="0x0080" />
//                <Set Name="DESKTOP_SWITCHDESKTOP"       Value="0x0100" />
//            </Flag>
//        </Variable>
//
//        <!-- [WindowStationAccessRights] -->
//        <Variable Name="[WindowStationAccessRights]" Type="Alias" Base="DWORD">
//            <Display Name="ACCESS_MASK" />
//            <Flag>
//                <Set Name="DELETE"                      Value="0x00010000" />
//                <Set Name="READ_CONTROL"                Value="0x00020000" />
//                <Set Name="SYNCHRONIZE"                 Value="0x00100000" />
//                <Set Name="WRITE_DAC"                   Value="0x00040000" />
//                <Set Name="WRITE_OWNER"                 Value="0x00080000" />
//                <Set Name="STANDARD_RIGHTS_ALL"         Value="0x001F0000" />
//                <Set Name="STANDARD_RIGHTS_REQUIRED"    Value="0x000F0000" />
//                <Set Name="ACCESS_SYSTEM_SECURITY"      Value="0x01000000" />
//                <Set Name="WINSTA_ENUMDESKTOPS"         Value="0x0001" />
//                <Set Name="WINSTA_READATTRIBUTES"       Value="0x0002" />
//                <Set Name="WINSTA_ACCESSCLIPBOARD"      Value="0x0004" />
//                <Set Name="WINSTA_CREATEDESKTOP"        Value="0x0008" />
//                <Set Name="WINSTA_WRITEATTRIBUTES"      Value="0x0010" />
//                <Set Name="WINSTA_ACCESSGLOBALATOMS"    Value="0x0020" />
//                <Set Name="WINSTA_EXITWINDOWS"          Value="0x0040" />
//                <Set Name="WINSTA_ENUMERATE"            Value="0x0100" />
//                <Set Name="WINSTA_READSCREEN"           Value="0x0200" />
//                <Set Name="WINSTA_ALL_ACCESS"           Value="0x37F" />
//                <Set Name="MAXIMUM_ALLOWED"             Value="0x02000000" />
//            </Flag>
//        </Variable>
//
//        <!-- [CreateWindowStationFlags] -->
//        <Variable Name="[CreateWindowStationFlags]" Type="Alias" Base="DWORD">
//            <Display Name="DWORD" />
//            <Enum>
//                <Set Name="CWF_CREATE_ONLY" Value="0x00000001" />
//            </Enum>
//        </Variable>
//
//        <!-- [LockSetForegroundWindowCode] -->
//        <Variable Name="[LockSetForegroundWindowCode]" Type="Alias" Base="UINT">
//            <Display Name="UINT" />
//            <Enum>
//                <Set Name="LSFW_LOCK"   Value="1" />
//                <Set Name="LSFW_UNLOCK" Value="2" />
//            </Enum>
//        </Variable>
//
//        <!-- [DeviceNotificationFlags] -->
//        <Variable Name="[DeviceNotificationFlags]" Type="Alias" Base="DWORD">
//            <Display Name="DWORD" />
//            <Flag>
//                <Set Name="DEVICE_NOTIFY_WINDOW_HANDLE"         Value="0x00000000" />
//                <Set Name="DEVICE_NOTIFY_SERVICE_HANDLE"        Value="0x00000001" />
//                <Set Name="DEVICE_NOTIFY_ALL_INTERFACE_CLASSES" Value="0x00000004" />
//            </Flag>
//        </Variable>
//
//        <!-- [TrackPopupMenuFlags] -->
//        <Variable Name="[TrackPopupMenuFlags]" Type="Alias" Base="UINT">
//            <Display Name="UINT" />
//            <Flag>
//                <Set Name="TPM_LEFTBUTTON"          Value="0x0000" />
//                <Set Name="TPM_RIGHTBUTTON"         Value="0x0002" />
//                <Set Name="TPM_LEFTALIGN"           Value="0x0000" />
//                <Set Name="TPM_CENTERALIGN"         Value="0x0004" />
//                <Set Name="TPM_RIGHTALIGN"          Value="0x0008" />
//                <Set Name="TPM_TOPALIGN"            Value="0x0000" />
//                <Set Name="TPM_VCENTERALIGN"        Value="0x0010" />
//                <Set Name="TPM_BOTTOMALIGN"         Value="0x0020" />
//                <Set Name="TPM_HORIZONTAL"          Value="0x0000" />
//                <Set Name="TPM_VERTICAL"            Value="0x0040" />
//                <Set Name="TPM_NONOTIFY"            Value="0x0080" />
//                <Set Name="TPM_RETURNCMD"           Value="0x0100" />
//                <Set Name="TPM_RECURSE"             Value="0x0001" />
//                <Set Name="TPM_HORPOSANIMATION"     Value="0x0400" />
//                <Set Name="TPM_HORNEGANIMATION"     Value="0x0800" />
//                <Set Name="TPM_VERPOSANIMATION"     Value="0x1000" />
//                <Set Name="TPM_VERNEGANIMATION"     Value="0x2000" />
//                <Set Name="TPM_NOANIMATION"         Value="0x4000" />
//                <Set Name="TPM_LAYOUTRTL"           Value="0x8000" />
//                <Set Name="TPM_WORKAREA"            Value="0x10000" />
//            </Flag>
//        </Variable>
//
//        <!-- [GetMenuDefaultItemFlags] -->
//        <Variable Name="[GetMenuDefaultItemFlags]" Type="Alias" Base="UINT">
//            <Display Name="UINT" />
//            <Flag>
//                <Set Name="GMDI_USEDISABLED"    Value="0x0001" />
//                <Set Name="GMDI_GOINTOPOPUPS"   Value="0x0002" />
//            </Flag>
//        </Variable>
//
//        <!-- [LoadImageString/LPCTSTR] -->
//        <Variable Name="[LoadImageString/LPCTSTR]" Type="Alias" Base="LPCTSTR">
//            <Display Name="LPCTSTR" />
//            <Enum>
//                <!-- OEM Bitmaps -->
//                <Set Name="OBM_CLOSE"                     Value="32754" />
//                <Set Name="OBM_UPARROW"                   Value="32753" />
//                <Set Name="OBM_DNARROW"                   Value="32752" />
//                <Set Name="OBM_RGARROW"                   Value="32751" />
//                <Set Name="OBM_LFARROW"                   Value="32750" />
//                <Set Name="OBM_REDUCE"                    Value="32749" />
//                <Set Name="OBM_ZOOM"                      Value="32748" />
//                <Set Name="OBM_RESTORE"                   Value="32747" />
//                <Set Name="OBM_REDUCED"                   Value="32746" />
//                <Set Name="OBM_ZOOMD"                     Value="32745" />
//                <Set Name="OBM_RESTORED"                  Value="32744" />
//                <Set Name="OBM_UPARROWD"                  Value="32743" />
//                <Set Name="OBM_DNARROWD"                  Value="32742" />
//                <Set Name="OBM_RGARROWD"                  Value="32741" />
//                <Set Name="OBM_LFARROWD"                  Value="32740" />
//                <Set Name="OBM_MNARROW"                   Value="32739" />
//                <Set Name="OBM_COMBO"                     Value="32738" />
//                <Set Name="OBM_UPARROWI"                  Value="32737" />
//                <Set Name="OBM_DNARROWI"                  Value="32736" />
//                <Set Name="OBM_RGARROWI"                  Value="32735" />
//                <Set Name="OBM_LFARROWI"                  Value="32734" />
//                <Set Name="OBM_OLD_CLOSE"                 Value="32767" />
//                <Set Name="OBM_SIZE"                      Value="32766" />
//                <Set Name="OBM_OLD_UPARROW"               Value="32765" />
//                <Set Name="OBM_OLD_DNARROW"               Value="32764" />
//                <Set Name="OBM_OLD_RGARROW"               Value="32763" />
//                <Set Name="OBM_OLD_LFARROW"               Value="32762" />
//                <Set Name="OBM_BTSIZE"                    Value="32761" />
//                <Set Name="OBM_CHECK"                     Value="32760" />
//                <Set Name="OBM_CHECKBOXES"                Value="32759" />
//                <Set Name="OBM_BTNCORNERS"                Value="32758" />
//                <Set Name="OBM_OLD_REDUCE"                Value="32757" />
//                <Set Name="OBM_OLD_ZOOM"                  Value="32756" />
//                <Set Name="OBM_OLD_RESTORE"         Value="32755" />
//
//                <!-- OEM Cursors -->
//                <Set Name="OCR_NORMAL"                    Value="32512" />
//                <Set Name="OCR_IBEAM"                     Value="32513" />
//                <Set Name="OCR_WAIT"                      Value="32514" />
//                <Set Name="OCR_CROSS"                     Value="32515" />
//                <Set Name="OCR_UP"                        Value="32516" />
//                <Set Name="OCR_SIZE"                      Value="32640" />
//                <Set Name="OCR_ICON"                      Value="32641" />
//                <Set Name="OCR_SIZENWSE"                  Value="32642" />
//                <Set Name="OCR_SIZENESW"                  Value="32643" />
//                <Set Name="OCR_SIZEWE"                    Value="32644" />
//                <Set Name="OCR_SIZENS"                    Value="32645" />
//                <Set Name="OCR_SIZEALL"                   Value="32646" />
//                <Set Name="OCR_ICOCUR"                    Value="32647" />
//                <Set Name="OCR_NO"                        Value="32648" />
//                <Set Name="OCR_HAND"                      Value="32649" />
//                <Set Name="OCR_APPSTARTING"               Value="32650" />
//
//                <!-- OEM Icons -->
//                <Set Name="OIC_SAMPLE"                    Value="32512" />
//                <Set Name="OIC_ERROR"               Value="32513" />
//                <Set Name="OIC_QUES"                      Value="32514" />
//                <Set Name="OIC_WARNING"                   Value="32515" />
//                <Set Name="OIC_INFORMATION"         Value="32516" />
//                <Set Name="OIC_WINLOGO"                   Value="32517" />
//                <Set Name="OIC_SHIELD"                    Value="32518" />
//            </Enum>
//        </Variable>
//
//        <!-- [LoadBitmapString/LPCTSTR] -->
//        <Variable Name="[LoadBitmapString/LPCTSTR]" Type="Alias" Base="LPCTSTR">
//            <Display Name="LPCTSTR" />
//            <Enum>
//                <!-- OEM Bitmaps -->
//                <Set Name="OBM_CLOSE"                     Value="32754" />
//                <Set Name="OBM_UPARROW"                   Value="32753" />
//                <Set Name="OBM_DNARROW"                   Value="32752" />
//                <Set Name="OBM_RGARROW"                   Value="32751" />
//                <Set Name="OBM_LFARROW"                   Value="32750" />
//                <Set Name="OBM_REDUCE"                    Value="32749" />
//                <Set Name="OBM_ZOOM"                      Value="32748" />
//                <Set Name="OBM_RESTORE"                   Value="32747" />
//                <Set Name="OBM_REDUCED"                   Value="32746" />
//                <Set Name="OBM_ZOOMD"                     Value="32745" />
//                <Set Name="OBM_RESTORED"                  Value="32744" />
//                <Set Name="OBM_UPARROWD"                  Value="32743" />
//                <Set Name="OBM_DNARROWD"                  Value="32742" />
//                <Set Name="OBM_RGARROWD"                  Value="32741" />
//                <Set Name="OBM_LFARROWD"                  Value="32740" />
//                <Set Name="OBM_MNARROW"                   Value="32739" />
//                <Set Name="OBM_COMBO"                     Value="32738" />
//                <Set Name="OBM_UPARROWI"                  Value="32737" />
//                <Set Name="OBM_DNARROWI"                  Value="32736" />
//                <Set Name="OBM_RGARROWI"                  Value="32735" />
//                <Set Name="OBM_LFARROWI"                  Value="32734" />
//                <Set Name="OBM_OLD_CLOSE"                 Value="32767" />
//                <Set Name="OBM_SIZE"                      Value="32766" />
//                <Set Name="OBM_OLD_UPARROW"               Value="32765" />
//                <Set Name="OBM_OLD_DNARROW"               Value="32764" />
//                <Set Name="OBM_OLD_RGARROW"               Value="32763" />
//                <Set Name="OBM_OLD_LFARROW"               Value="32762" />
//                <Set Name="OBM_BTSIZE"                    Value="32761" />
//                <Set Name="OBM_CHECK"                     Value="32760" />
//                <Set Name="OBM_CHECKBOXES"                Value="32759" />
//                <Set Name="OBM_BTNCORNERS"                Value="32758" />
//                <Set Name="OBM_OLD_REDUCE"                Value="32757" />
//                <Set Name="OBM_OLD_ZOOM"                  Value="32756" />
//                <Set Name="OBM_OLD_RESTORE"         Value="32755" />
//            </Enum>
//        </Variable>
//
//        <!-- [LoadCursorString/LPCTSTR] -->
//        <Variable Name="[LoadCursorString/LPCTSTR]" Type="Alias" Base="LPCTSTR">
//            <Display Name="LPCTSTR" />
//            <Enum>
//                <Set Name="IDC_ARROW"           Value="32512" />
//                <Set Name="IDC_IBEAM"           Value="32513" />
//                <Set Name="IDC_WAIT"            Value="32514" />
//                <Set Name="IDC_CROSS"           Value="32515" />
//                <Set Name="IDC_UPARROW"         Value="32516" />
//                <Set Name="IDC_SIZE"            Value="32640" />
//                <Set Name="IDC_ICON"            Value="32641" />
//                <Set Name="IDC_SIZENWSE"        Value="32642" />
//                <Set Name="IDC_SIZENESW"        Value="32643" />
//                <Set Name="IDC_SIZEWE"          Value="32644" />
//                <Set Name="IDC_SIZENS"          Value="32645" />
//                <Set Name="IDC_SIZEALL"         Value="32646" />
//                <Set Name="IDC_NO"              Value="32648" />
//                <Set Name="IDC_HAND"            Value="32649" />
//                <Set Name="IDC_APPSTARTING"     Value="32650" />
//                <Set Name="IDC_HELP"            Value="32651" />
//            </Enum>
//        </Variable>
//
//        <!-- [LoadIconString/LPCTSTR] -->
//        <Variable Name="[LoadIconString/LPCTSTR]" Type="Alias" Base="LPCTSTR">
//            <Display Name="LPCTSTR" />
//            <Enum>
//                <Set Name="IDI_APPLICATION"     Value="32512" />
//                <Set Name="IDI_ERROR"           Value="32513" />
//                <Set Name="IDI_QUESTION"        Value="32514" />
//                <Set Name="IDI_WARNING"         Value="32515" />
//                <Set Name="IDI_INFORMATION"     Value="32516" />
//                <Set Name="IDI_WINLOGO"         Value="32517" />
//                <Set Name="IDI_SHIELD"          Value="32518" />
//            </Enum>
//        </Variable>
//
//        <!-- [CursorId] -->
//        <Variable Name="[CursorId]" Type="Alias" Base="DWORD">
//            <Display Name="DWORD" />
//            <Enum>
//                <Set Name="OCR_NORMAL"                    Value="32512" />
//                <Set Name="OCR_IBEAM"                     Value="32513" />
//                <Set Name="OCR_WAIT"                      Value="32514" />
//                <Set Name="OCR_CROSS"                     Value="32515" />
//                <Set Name="OCR_UP"                        Value="32516" />
//                <Set Name="OCR_SIZE"                      Value="32640" />
//                <Set Name="OCR_ICON"                      Value="32641" />
//                <Set Name="OCR_SIZENWSE"                  Value="32642" />
//                <Set Name="OCR_SIZENESW"                  Value="32643" />
//                <Set Name="OCR_SIZEWE"                    Value="32644" />
//                <Set Name="OCR_SIZENS"                    Value="32645" />
//                <Set Name="OCR_SIZEALL"                   Value="32646" />
//                <Set Name="OCR_ICOCUR"                    Value="32647" />
//                <Set Name="OCR_NO"                        Value="32648" />
//                <Set Name="OCR_HAND"                      Value="32649" />
//                <Set Name="OCR_APPSTARTING"               Value="32650" />
//            </Enum>
//        </Variable>
//
//        <!-- [WindowRegion] -->
//        <Variable Name="[WindowRegion]" Type="Alias" Base="int">
//            <Display Name="int" />
//            <Enum>
//                <Set Name="ERROR"           Value="0" />
//                <Set Name="NULLREGION"      Value="1" />
//                <Set Name="SIMPLEREGION"    Value="2" />
//                <Set Name="COMPLEXREGION"   Value="3" />
//            </Enum>
//        </Variable>
//
//        <!-- [TOUCHINPUT_Flags] -->
//        <Variable Name="[TOUCHINPUT_Flags]" Type="Alias" Base="DWORD">
//            <Display Name="DWORD" />
//            <Flag>
//                <Set Name="TOUCHEVENTF_MOVE"           Value="0x0001" />
//                <Set Name="TOUCHEVENTF_DOWN"           Value="0x0002" />
//                <Set Name="TOUCHEVENTF_UP"             Value="0x0004" />
//                <Set Name="TOUCHEVENTF_INRANGE"        Value="0x0008" />
//                <Set Name="TOUCHEVENTF_PRIMARY"        Value="0x0010" />
//                <Set Name="TOUCHEVENTF_NOCOALESCE"     Value="0x0020" />
//                <Set Name="TOUCHEVENTF_PEN"            Value="0x0040" />
//                <Set Name="TOUCHEVENTF_PALM"           Value="0x0080" />
//            </Flag>
//        </Variable>
//
//        <!-- [TOUCHINPUT_Mask] -->
//        <Variable Name="[TOUCHINPUT_Mask]" Type="Alias" Base="DWORD">
//            <Display Name="DWORD" />
//            <Flag>
//                <Set Name="TOUCHINPUTMASKF_TIMEFROMSYSTEM"  Value="0x0001" />
//                <Set Name="TOUCHINPUTMASKF_EXTRAINFO"       Value="0x0002" />
//                <Set Name="TOUCHINPUTMASKF_CONTACTAREA"     Value="0x0004" />
//            </Flag>
//        </Variable>
//
//        <!-- TOUCHINPUT -->
//        <Variable Name="TOUCHINPUT" Type="Struct">
//            <Field Type="LONG"                        Name="x" />
//            <Field Type="LONG"                        Name="y" />
//            <Field Type="HANDLE"                  Name="hSource" />
//            <Field Type="DWORD"                   Name="dwID" />
//            <Field Type="[TOUCHINPUT_Flags]"    Name="dwFlags" />
//            <Field Type="[TOUCHINPUT_Mask]"     Name="dwMask" />
//            <Field Type="DWORD"                   Name="dwTime" />
//            <Field Type="ULONG_PTR"             Name="dwExtraInfo" />
//            <Field Type="DWORD"                   Name="cxContact" />
//            <Field Type="DWORD"                   Name="cyContact" />
//        </Variable>
//        <Variable Name="PTOUCHINPUT" Type="Pointer" Base="TOUCHINPUT" />
//
//        <!-- [GestureId] -->
//        <Variable Name="[GestureId]" Type="Alias" Base="DWORD">
//            <Display Name="DWORD" />
//            <Flag>
//                <Set Name="GID_ZOOM"           Value="3" />
//                <Set Name="GID_PAN"            Value="4" />
//                <Set Name="GID_ROTATE"         Value="5" />
//                <Set Name="GID_TWOFINGERTAP"   Value="6" />
//                <Set Name="GID_PRESSANDTAP"    Value="7" />
//            </Flag>
//        </Variable>
//
//        <!-- GESTURECONFIG -->
//        <Variable Name="GESTURECONFIG" Type="Struct">
//            <Field Type="[GestureId]"   Name="dwID" />
//            <Field Type="DWORD"           Name="dwWant" />
//            <Field Type="DWORD"           Name="dwBlock" />
//        </Variable>
//        <Variable Name="PGESTURECONFIG" Type="Pointer" Base="GESTURECONFIG" />
//
//        <!-- POINTS -->
//        <Variable Name="POINTS" Type="Struct">
//            <Field Type="SHORT"       Name="x" />
//            <Field Type="SHORT"     Name="y" />
//        </Variable>
//
//        <!-- [GESTUREINFO_Flags] -->
//        <Variable Name="[GESTUREINFO_Flags]" Type="Alias" Base="DWORD">
//            <Display Name="DWORD" />
//            <Flag>
//                <Set Name="GF_BEGIN"    Value="0x00000001" />
//                <Set Name="GF_INERTIA"  Value="0x00000002" />
//                <Set Name="GF_END"      Value="0x00000004" />
//            </Flag>
//        </Variable>
//
//        <!-- GESTUREINFO -->
//        <Variable Name="GESTUREINFO" Type="Struct">
//            <Field Type="UINT"                        Name="cbSize" />
//            <Field Type="[GESTUREINFO_Flags]"   Name="dwFlags" />
//            <Field Type="DWORD"                   Name="dwID" />
//            <Field Type="HWND"                        Name="hwndTarget" />
//            <Field Type="POINTS"                  Name="ptsLocation" />
//            <Field Type="DWORD"                   Name="dwInstanceID" />
//            <Field Type="DWORD"                   Name="dwSequenceID" />
//            <Field Type="ULONGLONG"           Name="ullArguments" />
//            <Field Type="UINT"                        Name="cbExtraArgs" />
//        </Variable>
//        <Variable Name="PGESTUREINFO" Type="Pointer" Base="GESTUREINFO" />
//
//        <!-- RAWINPUTHEADER -->
//        <Variable Name="RAWINPUTHEADER" Type="Struct">
//            <Field Type="[RIM_TYPE]"    Name="dwType" />
//            <Field Type="DWORD"         Name="dwSize" />
//            <Field Type="HANDLE"        Name="hDevice" />
//            <Field Type="WPARAM"        Name="wParam" />
//        </Variable>
//
//        <!-- [RAWMOUSE_STATE] -->
//        <Variable Name="[RAWMOUSE_STATE]" Type="Alias" Base="USHORT">
//            <Display Name="USHORT" />
//            <Flag>
//                <Set Name="RI_MOUSE_LEFT_BUTTON_DOWN"       Value="0x0001" />
//                <Set Name="RI_MOUSE_LEFT_BUTTON_UP"         Value="0x0002" />
//                <Set Name="RI_MOUSE_RIGHT_BUTTON_DOWN"      Value="0x0004" />
//                <Set Name="RI_MOUSE_RIGHT_BUTTON_UP"        Value="0x0008" />
//                <Set Name="RI_MOUSE_MIDDLE_BUTTON_DOWN"     Value="0x0010" />
//                <Set Name="RI_MOUSE_MIDDLE_BUTTON_UP"       Value="0x0020" />
//                <Set Name="RI_MOUSE_BUTTON_4_DOWN"          Value="0x0040" />
//                <Set Name="RI_MOUSE_BUTTON_4_UP"            Value="0x0080" />
//                <Set Name="RI_MOUSE_BUTTON_5_DOWN"          Value="0x0100" />
//                <Set Name="RI_MOUSE_BUTTON_5_UP"            Value="0x0200" />
//                <Set Name="RI_MOUSE_WHEEL"                  Value="0x0400" />
//            </Flag>
//        </Variable>
//
//        <!-- [RAWMOUSE_u_s] -->
//        <Variable Name="[RAWMOUSE_u_s]" Type="Struct">
//            <Display Name="struct" />
//            <Field Type="[RAWMOUSE_STATE]"  Name="usButtonFlags" />
//            <Field Type="USHORT"            Name="usButtonData" />
//        </Variable>
//
//        <!-- [RAWMOUSE_u] -->
//        <Variable Name="[RAWMOUSE_u]" Type="Union">
//            <Display Name="union" />
//            <Field Type="ULONG"             Name="ulButtons" />
//            <Field Type="[RAWMOUSE_u_s]"    Name="" />
//        </Variable>
//
//        <!-- [RAWMOUSE_FLAGS] -->
//        <Variable Name="[RAWMOUSE_FLAGS]" Type="Alias" Base="USHORT">
//            <Display Name="USHORT" />
//            <Flag>
//                <Set Name="MOUSE_MOVE_RELATIVE"         Value="0" />
//                <Set Name="MOUSE_MOVE_ABSOLUTE"         Value="1" />
//                <Set Name="MOUSE_VIRTUAL_DESKTOP"       Value="0x02" />
//                <Set Name="MOUSE_ATTRIBUTES_CHANGED"    Value="0x04" />
//                <Set Name="MOUSE_MOVE_NOCOALESCE"       Value="0x08" />
//            </Flag>
//        </Variable>
//
//        <!-- RAWMOUSE -->
//        <Variable Name="RAWMOUSE" Type="Struct">
//            <Field Type="[RAWMOUSE_FLAGS]"  Name="usFlags" />
//            <Field Type="[RAWMOUSE_u]"      Name="" />
//            <Field Type="ULONG"             Name="ulRawButtons" />
//            <Field Type="LONG"              Name="lLastX" />
//            <Field Type="LONG"              Name="lLastY" />
//            <Field Type="ULONG"             Name="ulExtraInformation" />
//        </Variable>
//
//        <!-- [RAWKEYBOARD_FLAGS] -->
//        <Variable Name="[RAWKEYBOARD_FLAGS]" Type="Alias" Base="USHORT">
//            <Display Name="USHORT" />
//            <Flag>
//                <Set Name="RI_KEY_MAKE"             Value="0" />
//                <Set Name="RI_KEY_BREAK"            Value="1" />
//                <Set Name="RI_KEY_E0"               Value="2" />
//                <Set Name="RI_KEY_E1"               Value="4" />
//                <Set Name="RI_KEY_TERMSRV_SET_LED"  Value="8" />
//                <Set Name="RI_KEY_TERMSRV_SHADOW"   Value="0x10" />
//            </Flag>
//        </Variable>
//
//        <!-- RAWKEYBOARD -->
//        <Variable Name="RAWKEYBOARD" Type="Struct">
//            <Field Type="USHORT"                Name="MakeCode" />
//            <Field Type="[RAWKEYBOARD_FLAGS]"   Name="Flags" />
//            <Field Type="USHORT"                Name="Reserved" />
//            <Field Type="[VirtKeyCode]"         Name="VKey" Display="USHORT" />
//            <Field Type="[WinMsg]"              Name="Message" />
//            <Field Type="ULONG"                 Name="ExtraInformation" />
//        </Variable>
//
//        <!-- RAWHID -->
//        <Variable Name="RAWHID" Type="Struct">
//            <Field Type="DWORD"         Name="dwSizeHid" />
//            <Field Type="DWORD"         Name="dwCount" />
//            <!-- TODO: Count="dwCount" for bRawData (after support for selective encoding for unions) -->
//            <Field Type="BYTE [1]"      Name="bRawData" />
//        </Variable>
//
//        <!-- [RAWINPUT_u] -->
//        <Variable Name="[RAWINPUT_u]" Type="Union">
//            <Display Name="union" />
//            <Field Type="RAWMOUSE"      Name="mouse" />
//            <Field Type="RAWKEYBOARD"   Name="keyboard" />
//            <Field Type="RAWHID"        Name="hid" />
//        </Variable>
//
//        <!-- RAWINPUT -->
//        <Variable Name="RAWINPUT" Type="Struct">
//            <Field Type="RAWINPUTHEADER"    Name="header" />
//            <Field Type="[RAWINPUT_u]"      Name="data" />
//        </Variable>
//        <Variable Name="PRAWINPUT"  Type="Pointer" Base="RAWINPUT" />
//        <Variable Name="PRAWINPUT*" Type="Pointer" Base="PRAWINPUT" />
//
//        <!-- [CreateWindow_CW] -->
//        <Variable Name="[CreateWindow_CW]" Type="Alias" Base="int">
//            <Display Name="int" />
//            <Enum>
//                <Set Name="CW_USEDEFAULT"     Value="0x80000000" />
//            </Enum>
//        </Variable>
//
//        <!-- WINCOMPATTRDATA -->
//        <Variable Name="WINCOMPATTRDATA" Type="Struct">
//            <Field Type="[DwmWindowAttr]"   Name="attribute" />
//            <Field Type="PVOID"             Name="pData" Length="dataSize" />
//            <Field Type="ULONG"             Name="dataSize" />
//        </Variable>
//        <Variable Name="WINCOMPATTRDATA*" Type="Pointer" Base="WINCOMPATTRDATA" />
//
//        <!-- [TOUCH_FEEDBACK_MODE] -->
//        <Variable Name="[TOUCH_FEEDBACK_MODE]" Type="Alias" Base="UINT">
//            <Display Name="DWORD" />
//            <Enum>
//                <Set Name="TOUCH_FEEDBACK_DEFAULT"        Value="0x1" />
//                <Set Name="TOUCH_FEEDBACK_INDIRECT"     Value="0x2" />
//                <Set Name="TOUCH_FEEDBACK_NONE"         Value="0x3" />
//            </Enum>
//        </Variable>
//
//        <!-- POINTER_INPUT_TYPE -->
//        <Variable Name="POINTER_INPUT_TYPE" Type="Alias" Base="DWORD">
//            <Enum>
//                <Set Name="PT_POINTER"      Value="0x00000001" />
//                <Set Name="PT_TOUCH"        Value="0x00000002" />
//                <Set Name="PT_PEN"          Value="0x00000003" />
//                <Set Name="PT_MOUSE"        Value="0x00000004" />
//            </Enum>
//        </Variable>
//        <Variable Name="POINTER_INPUT_TYPE*" Type="Pointer" Base="POINTER_INPUT_TYPE" />
//
//        <!-- POINTER_FLAGS -->
//        <Variable Name="POINTER_FLAGS" Type="Alias" Base="UINT32">
//            <Flag>
//                <Set Name="POINTER_FLAG_NONE"               Value="0x00000000" />
//                <Set Name="POINTER_FLAG_NEW"                Value="0x00000001" />
//                <Set Name="POINTER_FLAG_INRANGE"            Value="0x00000002" />
//                <Set Name="POINTER_FLAG_INCONTACT"          Value="0x00000004" />
//                <Set Name="POINTER_FLAG_FIRSTBUTTON"        Value="0x00000010" />
//                <Set Name="POINTER_FLAG_SECONDBUTTON"       Value="0x00000020" />
//                <Set Name="POINTER_FLAG_THIRDBUTTON"        Value="0x00000040" />
//                <Set Name="POINTER_FLAG_FOURTHBUTTON"       Value="0x00000080" />
//                <Set Name="POINTER_FLAG_FIFTHBUTTON"        Value="0x00000100" />
//                <Set Name="POINTER_FLAG_PRIMARY"            Value="0x00002000" />
//                <Set Name="POINTER_FLAG_CONFIDENCE"         Value="0x00004000" />
//                <Set Name="POINTER_FLAG_CANCELED"           Value="0x00008000" />
//                <Set Name="POINTER_FLAG_DOWN"               Value="0x00010000" />
//                <Set Name="POINTER_FLAG_UPDATE"             Value="0x00020000" />
//                <Set Name="POINTER_FLAG_UP"                 Value="0x00040000" />
//                <Set Name="POINTER_FLAG_WHEEL"              Value="0x00080000" />
//                <Set Name="POINTER_FLAG_HWHEEL"             Value="0x00100000" />
//                <Set Name="POINTER_FLAG_CAPTURECHANGED"     Value="0x00200000" />
//            </Flag>
//        </Variable>
//
//        <!-- [POINTER_MOD_FLAGS] -->
//        <Variable Name="[POINTER_MOD_FLAGS]" Type="Alias" Base="DWORD">
//            <Display Name="DWORD" />
//            <Flag>
//                <Set Name="POINTER_MOD_SHIFT"   Value="0x0004" />
//                <Set Name="POINTER_MOD_CTRL"    Value="0x0008" />
//            </Flag>
//        </Variable>
//
//        <!-- POINTER_BUTTON_CHANGE_TYPE -->
//        <Variable Name="POINTER_BUTTON_CHANGE_TYPE" Type="Alias" Base="UINT">
//            <Enum>
//                <Set Name="POINTER_CHANGE_NONE"                             Value="0" />
//                <Set Name="POINTER_CHANGE_FIRSTBUTTON_DOWN"         Value="1" />
//                <Set Name="POINTER_CHANGE_FIRSTBUTTON_UP"           Value="2" />
//                <Set Name="POINTER_CHANGE_SECONDBUTTON_DOWN"    Value="3" />
//                <Set Name="POINTER_CHANGE_SECONDBUTTON_UP"          Value="4" />
//                <Set Name="POINTER_CHANGE_THIRDBUTTON_DOWN"         Value="5" />
//                <Set Name="POINTER_CHANGE_THIRDBUTTON_UP"           Value="6" />
//                <Set Name="POINTER_CHANGE_FOURTHBUTTON_DOWN"    Value="7" />
//                <Set Name="POINTER_CHANGE_FOURTHBUTTON_UP"          Value="8" />
//                <Set Name="POINTER_CHANGE_FIFTHBUTTON_DOWN"         Value="9" />
//                <Set Name="POINTER_CHANGE_FIFTHBUTTON_UP"           Value="10" />
//            </Enum>
//        </Variable>
//
//        <!-- POINTER_INFO -->
//        <Variable Name="POINTER_INFO" Type="Struct">
//            <Field Type="POINTER_INPUT_TYPE"            Name="pointerType" />
//            <Field Type="UINT32"                        Name="pointerId" />
//            <Field Type="UINT32"                        Name="frameId" />
//            <Field Type="POINTER_FLAGS"                 Name="pointerFlags" />
//            <Field Type="HANDLE"                        Name="sourceDevice" />
//            <Field Type="HWND"                          Name="hwndTarget" />
//            <Field Type="POINT"                         Name="ptPixelLocation" />
//            <Field Type="POINT"                         Name="ptHimetricLocation" />
//            <Field Type="POINT"                         Name="ptPixelLocationRaw" />
//            <Field Type="POINT"                         Name="ptHimetricLocationRaw" />
//            <Field Type="DWORD"                         Name="dwTime" />
//            <Field Type="UINT32"                        Name="historyCount" />
//            <Field Type="INT32"                         Name="InputData" />
//            <Field Type="DWORD"                         Name="dwKeyStates" />
//            <Field Type="UINT64"                        Name="PerformanceCount" />
//            <Field Type="POINTER_BUTTON_CHANGE_TYPE"    Name="ButtonChangeType" />
//        </Variable>
//        <Variable Name="POINTER_INFO*"          Type="Pointer" Base="POINTER_INFO" />
//        <Variable Name="const POINTER_INFO*"    Type="Pointer" Base="POINTER_INFO" />
//
//        <!-- TOUCH_FLAGS -->
//        <Variable Name="TOUCH_FLAGS" Type="Alias" Base="UINT32">
//            <Flag>
//                <Set Name="TOUCH_FLAG_NONE"     Value="0x00000000" />
//            </Flag>
//        </Variable>
//
//        <!-- TOUCH_MASK -->
//        <Variable Name="TOUCH_MASK" Type="Alias" Base="UINT32">
//            <Flag>
//                <Set Name="TOUCH_MASK_NONE"             Value="0x00000000" />
//                <Set Name="TOUCH_MASK_CONTACTAREA"      Value="0x00000001" />
//                <Set Name="TOUCH_MASK_ORIENTATION"      Value="0x00000002" />
//                <Set Name="TOUCH_MASK_PRESSURE"         Value="0x00000004" />
//            </Flag>
//        </Variable>
//
//        <!-- POINTER_TOUCH_INFO -->
//        <Variable Name="POINTER_TOUCH_INFO" Type="Struct">
//            <Field Type="POINTER_INFO"      Name="pointerInfo" />
//            <Field Type="TOUCH_FLAGS"       Name="touchFlags" />
//            <Field Type="TOUCH_MASK"        Name="touchMask" />
//            <Field Type="RECT"              Name="rcContact" />
//            <Field Type="RECT"              Name="rcContactRaw" />
//            <Field Type="UINT32"            Name="orientation" />
//            <Field Type="UINT32"            Name="pressure" />
//        </Variable>
//        <Variable Name="POINTER_TOUCH_INFO*"        Type="Pointer" Base="POINTER_TOUCH_INFO" />
//        <Variable Name="const POINTER_TOUCH_INFO*"  Type="Pointer" Base="POINTER_TOUCH_INFO" />
//
//        <!-- CROSS_SLIDE_THRESHOLD -->
//        <Variable Name="CROSS_SLIDE_THRESHOLD" Type="Alias" Base="UINT">
//            <Enum>
//                <Set Name="CROSS_SLIDE_THRESHOLD_SELECT_START"          Value="0x00000000" />
//                <Set Name="CROSS_SLIDE_THRESHOLD_SPEED_BUMP_START"      Value="0x00000001" />
//                <Set Name="CROSS_SLIDE_THRESHOLD_SPEED_BUMP_END"        Value="0x00000002" />
//                <Set Name="CROSS_SLIDE_THRESHOLD_REARRANGE_START"       Value="0x00000003" />
//            </Enum>
//        </Variable>
//
//        <!-- INERTIA_PARAMETER -->
//        <Variable Name="INERTIA_PARAMETER" Type="Alias" Base="UINT">
//            <Enum>
//                <Set Name="INERTIA_PARAMETER_TRANSLATION_DECELERATION"        Value="0x00000001" />
//                <Set Name="INERTIA_PARAMETER_TRANSLATION_DISPLACEMENT"        Value="0x00000002" />
//                <Set Name="INERTIA_PARAMETER_ROTATION_DECELERATION"           Value="0x00000003" />
//                <Set Name="INERTIA_PARAMETER_ROTATION_ANGLE"                  Value="0x00000004" />
//                <Set Name="INERTIA_PARAMETER_EXPANSION_DECELERATION"          Value="0x00000005" />
//                <Set Name="INERTIA_PARAMETER_EXPANSION_EXPANSION"           Value="0x00000006" />
//            </Enum>
//        </Variable>
//
//        <!-- INTERACTION_STATE -->
//        <Variable Name="INTERACTION_STATE" Type="Alias" Base="UINT">
//            <Enum>
//                <Set Name="INTERACTION_STATE_IDLE"                  Value="0x00000000" />
//                <Set Name="INTERACTION_STATE_IN_INTERACTION"        Value="0x00000001" />
//                <Set Name="INTERACTION_STATE_POSSIBLE_DOUBLE_TAP"   Value="0x00000002" />
//            </Enum>
//        </Variable>
//        <Variable Name="INTERACTION_STATE*" Type="Pointer" Base="INTERACTION_STATE" />
//
//        <!-- INTERACTION_CONTEXT_PROPERTY -->
//        <Variable Name="INTERACTION_CONTEXT_PROPERTY" Type="Alias" Base="UINT">
//            <Enum>
//                <Set Name="INTERACTION_CONTEXT_PROPERTY_MEASUREMENT_UNITS"          Value="0x00000001" />
//                <Set Name="INTERACTION_CONTEXT_PROPERTY_INTERACTION_UI_FEEDBACK"    Value="0x00000002" />
//                <Set Name="INTERACTION_CONTEXT_PROPERTY_FILTER_POINTERS"            Value="0x00000003" />
//            </Enum>
//        </Variable>
//
//        <!-- CROSS_SLIDE_PARAMETER -->
//        <Variable Name="CROSS_SLIDE_PARAMETER" Type="Struct">
//            <Field Type="CROSS_SLIDE_THRESHOLD"     Name="threshold" />
//            <Field Type="float"                     Name="distance" />
//        </Variable>
//        <Variable Name="CROSS_SLIDE_PARAMETER*" Type="Pointer" Base="CROSS_SLIDE_PARAMETER" />
//
//        <!-- MOUSE_WHEEL_PARAMETER -->
//        <Variable Name="MOUSE_WHEEL_PARAMETER" Type="Alias" Base="UINT">
//            <Enum>
//                <Set Name="MOUSE_WHEEL_PARAMETER_CHAR_TRANSLATION_X"        Value="0x00000001" />
//                <Set Name="MOUSE_WHEEL_PARAMETER_CHAR_TRANSLATION_Y"        Value="0x00000002" />
//                <Set Name="MOUSE_WHEEL_PARAMETER_DELTA_SCALE"               Value="0x00000003" />
//                <Set Name="MOUSE_WHEEL_PARAMETER_DELTA_ROTATION"            Value="0x00000004" />
//                <Set Name="MOUSE_WHEEL_PARAMETER_PAGE_TRANSLATION_X"        Value="0x00000005" />
//                <Set Name="MOUSE_WHEEL_PARAMETER_PAGE_TRANSLATION_Y"        Value="0x00000006" />
//            </Enum>
//        </Variable>
//
//        <!-- INTERACTION_ID -->
//        <Variable Name="INTERACTION_ID" Type="Alias" Base="UINT">
//            <Enum>
//                <Set Name="INTERACTION_ID_NONE"             Value="0x00000000" />
//                <Set Name="INTERACTION_ID_MANIPULATION"     Value="0x00000001" />
//                <Set Name="INTERACTION_ID_TAP"              Value="0x00000002" />
//                <Set Name="INTERACTION_ID_SECONDARY_TAP"    Value="0x00000003" />
//                <Set Name="INTERACTION_ID_HOLD"             Value="0x00000004" />
//                <Set Name="INTERACTION_ID_DRAG"             Value="0x00000005" />
//                <Set Name="INTERACTION_ID_CROSS_SLIDE"      Value="0x00000006" />
//            </Enum>
//        </Variable>
//
//        <!-- INTERACTION_CONFIGURATION_FLAGS -->
//        <Variable Name="INTERACTION_CONFIGURATION_FLAGS" Type="Alias" Base="UINT">
//            <Flag>
//                <Set Name="INTERACTION_CONFIGURATION_FLAG_NONE" Value="0x00000000" />
//            </Flag>
//        </Variable>
//
//        <!-- INTERACTION_CONTEXT_CONFIGURATION -->
//        <Variable Name="INTERACTION_CONTEXT_CONFIGURATION" Type="Struct">
//            <Field Type="INTERACTION_ID"                    Name="interactionId" />
//            <Field Type="INTERACTION_CONFIGURATION_FLAGS"   Name="enable" />
//        </Variable>
//        <Variable Name="INTERACTION_CONTEXT_CONFIGURATION*"         Type="Pointer" Base="INTERACTION_CONTEXT_CONFIGURATION" />
//        <Variable Name="const INTERACTION_CONTEXT_CONFIGURATION*"   Type="Pointer" Base="INTERACTION_CONTEXT_CONFIGURATION" />
//
//        <!-- PEN_FLAGS -->
//        <Variable Name="PEN_FLAGS" Type="Alias" Base="UINT32">
//            <Flag>
//                <Set Name="PEN_FLAG_NONE"       Value="0x00000000" />
//                <Set Name="PEN_FLAG_BARREL"     Value="0x00000001" />
//                <Set Name="PEN_FLAG_INVERTED"   Value="0x00000002" />
//                <Set Name="PEN_FLAG_ERASER"     Value="0x00000004" />
//            </Flag>
//        </Variable>
//
//        <!-- PEN_MASK -->
//        <Variable Name="PEN_MASK" Type="Alias" Base="UINT32">
//            <Flag>
//                <Set Name="PEN_MASK_NONE"       Value="0x00000000" />
//                <Set Name="PEN_MASK_PRESSURE"   Value="0x00000001" />
//                <Set Name="PEN_MASK_ROTATION"   Value="0x00000002" />
//                <Set Name="PEN_MASK_TILT_X"     Value="0x00000004" />
//                <Set Name="PEN_MASK_TILT_Y"     Value="0x00000008" />
//            </Flag>
//        </Variable>
//
//        <!-- POINTER_PEN_INFO -->
//        <Variable Name="POINTER_PEN_INFO" Type="Struct">
//            <Field Type="POINTER_INFO"      Name="pointerInfo" />
//            <Field Type="PEN_FLAGS"         Name="penFlags" />
//            <Field Type="PEN_MASK"          Name="penMask" />
//            <Field Type="UINT32"            Name="pressure" />
//            <Field Type="UINT32"            Name="rotation" />
//            <Field Type="INT32"             Name="tiltX" />
//            <Field Type="INT32"             Name="tiltY" />
//        </Variable>
//        <Variable Name="POINTER_PEN_INFO*" Type="Pointer" Base="POINTER_PEN_INFO" />
//
//        <!-- TOUCH_HIT_TESTING_INPUT -->
//        <Variable Name="TOUCH_HIT_TESTING_INPUT" Type="Struct">
//            <Field Type="UINT32"    Name="pointerId" />
//            <Field Type="POINT"     Name="point" />
//            <Field Type="RECT"      Name="boundingBox" />
//            <Field Type="RECT"      Name="nonOccludedBoundingBox" />
//            <Field Type="UINT32"    Name="orientation" />
//        </Variable>
//        <Variable Name="const TOUCH_HIT_TESTING_INPUT*" Type="Pointer" Base="TOUCH_HIT_TESTING_INPUT" />
//
//        <!-- TOUCH_HIT_TESTING_PROXIMITY_EVALUATION -->
//        <Variable Name="TOUCH_HIT_TESTING_PROXIMITY_EVALUATION" Type="Struct">
//            <Field Type="UINT16"    Name="score" />
//            <Field Type="POINT"     Name="adjustedPoint" />
//        </Variable>
//        <Variable Name="TOUCH_HIT_TESTING_PROXIMITY_EVALUATION*"        Type="Pointer" Base="TOUCH_HIT_TESTING_PROXIMITY_EVALUATION" />
//        <Variable Name="const TOUCH_HIT_TESTING_PROXIMITY_EVALUATION*"  Type="Pointer" Base="TOUCH_HIT_TESTING_PROXIMITY_EVALUATION" />
//
//        <!-- INPUT_MESSAGE_DEVICE_TYPE -->
//        <Variable Name="INPUT_MESSAGE_DEVICE_TYPE" Type="Alias" Base="UINT">
//            <Enum>
//                <Set Name="IMDT_UNAVAILABLE"    Value="0x00000000" />
//                <Set Name="IMDT_KEYBOARD"       Value="0x00000001" />
//                <Set Name="IMDT_MOUSE"          Value="0x00000002" />
//                <Set Name="IMDT_TOUCH"          Value="0x00000004" />
//                <Set Name="IMDT_PEN"            Value="0x00000008" />
//            </Enum>
//        </Variable>
//
//        <!-- INPUT_MESSAGE_ORIGIN_ID -->
//        <Variable Name="INPUT_MESSAGE_ORIGIN_ID" Type="Alias" Base="UINT">
//            <Enum>
//                <Set Name="IMO_UNAVAILABLE"     Value="0x00000000" />
//                <Set Name="IMO_HARDWARE"        Value="0x00000001" />
//                <Set Name="IMO_INJECTED"        Value="0x00000002" />
//                <Set Name="IMO_SYSTEM"          Value="0x00000004" />
//            </Enum>
//        </Variable>
//
//        <!-- INPUT_MESSAGE_SOURCE -->
//        <Variable Name="INPUT_MESSAGE_SOURCE" Type="Struct">
//            <Field Type="INPUT_MESSAGE_DEVICE_TYPE"     Name="deviceType" />
//            <Field Type="INPUT_MESSAGE_ORIGIN_ID"       Name="originId" />
//        </Variable>
//        <Variable Name="INPUT_MESSAGE_SOURCE*" Type="Pointer" Base="INPUT_MESSAGE_SOURCE" />
//
//        <!-- POINTER_DEVICE_TYPE -->
//        <Variable Name="POINTER_DEVICE_TYPE" Type="Alias" Base="UINT">
//            <Enum>
//                <Set Name="POINTER_DEVICE_TYPE_INTEGRATED_PEN"      Value="0x00000001" />
//                <Set Name="POINTER_DEVICE_TYPE_EXTERNAL_PEN"        Value="0x00000002" />
//                <Set Name="POINTER_DEVICE_TYPE_TOUCH"               Value="0x00000003" />
//            </Enum>
//        </Variable>
//
//        <!-- POINTER_DEVICE_INFO -->
//        <Variable Name="POINTER_DEVICE_INFO" Type="Struct">
//            <Field Type="DWORD"                                         Name="displayOrientation" />
//            <Field Type="HANDLE"                                        Name="device" />
//            <Field Type="POINTER_DEVICE_TYPE"                           Name="pointerDeviceType" />
//            <Field Type="HMONITOR"                                      Name="monitor" />
//            <Field Type="ULONG"                                         Name="startingCursorId" />
//            <Field Type="USHORT"                                        Name="maxActiveContacts" />
//            <Field Type="WCHAR [POINTER_DEVICE_PRODUCT_STRING_MAX]"     Name="productString" />
//        </Variable>
//        <Variable Name="POINTER_DEVICE_INFO*" Type="Pointer" Base="POINTER_DEVICE_INFO" />
//
//        <!-- POINTER_DEVICE_CURSOR_TYPE -->
//        <Variable Name="POINTER_DEVICE_CURSOR_TYPE" Type="Alias" Base="UINT">
//            <Enum>
//                <Set Name="POINTER_DEVICE_CURSOR_TYPE_UNKNOWN"      Value="0x00000000" />
//                <Set Name="POINTER_DEVICE_CURSOR_TYPE_TIP"          Value="0x00000001" />
//                <Set Name="POINTER_DEVICE_CURSOR_TYPE_ERASER"       Value="0x00000002" />
//            </Enum>
//        </Variable>
//
//        <!-- POINTER_DEVICE_CURSOR_INFO -->
//        <Variable Name="POINTER_DEVICE_CURSOR_INFO" Type="Struct">
//            <Field Type="UINT32"                        Name="cursorId" />
//            <Field Type="POINTER_DEVICE_CURSOR_TYPE"    Name="cursor" />
//        </Variable>
//        <Variable Name="POINTER_DEVICE_CURSOR_INFO*" Type="Pointer" Base="POINTER_DEVICE_CURSOR_INFO" />
//
//        <!-- POINTER_DEVICE_PROPERTY -->
//        <Variable Name="POINTER_DEVICE_PROPERTY" Type="Struct">
//            <Field Type="INT32"         Name="logicalMin" />
//            <Field Type="INT32"         Name="logicalMax" />
//            <Field Type="INT32"         Name="physicalMin" />
//            <Field Type="INT32"         Name="physicalMax" />
//            <Field Type="UINT32"        Name="unit" />
//            <Field Type="UINT32"        Name="unitExponent" />
//            <Field Type="USHORT"        Name="usagePageId" />
//            <Field Type="USHORT"        Name="usageId" />
//        </Variable>
//        <Variable Name="POINTER_DEVICE_PROPERTY*" Type="Pointer" Base="POINTER_DEVICE_PROPERTY" />
//
//        <!-- [TIMERV_COALESCING] -->
//        <Variable Name="[TIMERV_COALESCING]" Type="Alias" Base="ULONG">
//            <Display Name="ULONG" />
//            <Enum>
//                <Set Name="TIMERV_DEFAULT_COALESCING"   Value="0" />
//                <Set Name="TIMERV_NO_COALESCING"        Value="0xFFFFFFFF" />
//            </Enum>
//        </Variable>
//
//        <!-- FEEDBACK_TYPE -->
//        <Variable Name="FEEDBACK_TYPE" Type="Alias" Base="UINT">
//            <Enum>
//                <Set Name="FEEDBACK_TOUCH_CONTACTVISUALIZATION"     Value="1" />
//                <Set Name="FEEDBACK_PEN_BARRELVISUALIZATION"        Value="2" />
//                <Set Name="FEEDBACK_PEN_TAP"                        Value="3" />
//                <Set Name="FEEDBACK_PEN_DOUBLETAP"                  Value="4" />
//                <Set Name="FEEDBACK_PEN_PRESSANDHOLD"               Value="5" />
//                <Set Name="FEEDBACK_PEN_RIGHTTAP"                   Value="6" />
//                <Set Name="FEEDBACK_TOUCH_TAP"                      Value="7" />
//                <Set Name="FEEDBACK_TOUCH_DOUBLETAP"                Value="8" />
//                <Set Name="FEEDBACK_TOUCH_PRESSANDHOLD"             Value="9" />
//                <Set Name="FEEDBACK_TOUCH_RIGHTTAP"                 Value="10" />
//                <Set Name="FEEDBACK_GESTURE_PRESSANDTAP"            Value="11" />
//            </Enum>
//        </Variable>
//
//        <!-- DEVICE_NOTIFY_SUBSCRIBE_PARAMETERS -->
//        <Variable Name="DEVICE_NOTIFY_SUBSCRIBE_PARAMETERS" Type="Struct">
//            <Field Type="PDEVICE_NOTIFY_CALLBACK_ROUTINE"   Name="Callback" />
//            <Field Type="PVOID"                             Name="Context" />
//        </Variable>
//        <Variable Name="PDEVICE_NOTIFY_SUBSCRIBE_PARAMETERS" Type="Pointer" Base="DEVICE_NOTIFY_SUBSCRIBE_PARAMETERS" />
//
//        <!-- [DDE_INITIALIZE_FLAGS] -->
//        <Variable Name="[DDE_INITIALIZE_FLAGS]" Type="Alias" Base="DWORD">
//            <Display Name="DWORD" />
//            <Flag>
//                <Set Name="APPCLASS_STANDARD"               Value="0x00000000" />
//                <Set Name="APPCLASS_MONITOR"                Value="0x00000001" />
//                <Set Name="APPCMD_CLIENTONLY"               Value="0x00000010" />
//                <Set Name="APPCMD_FILTERINITS"              Value="0x00000020" />
//                <Set Name="CBF_FAIL_SELFCONNECTIONS"        Value="0x00001000" />
//                <Set Name="CBF_FAIL_CONNECTIONS"            Value="0x00002000" />
//                <Set Name="CBF_FAIL_ADVISES"                Value="0x00004000" />
//                <Set Name="CBF_FAIL_EXECUTES"               Value="0x00008000" />
//                <Set Name="CBF_FAIL_POKES"                  Value="0x00010000" />
//                <Set Name="CBF_FAIL_REQUESTS"               Value="0x00020000" />
//                <Set Name="CBF_FAIL_ALLSVRXACTIONS"         Value="0x0003f000" />
//                <Set Name="CBF_SKIP_CONNECT_CONFIRMS"       Value="0x00040000" />
//                <Set Name="CBF_SKIP_REGISTRATIONS"          Value="0x00080000" />
//                <Set Name="CBF_SKIP_UNREGISTRATIONS"        Value="0x00100000" />
//                <Set Name="CBF_SKIP_DISCONNECTS"            Value="0x00200000" />
//                <Set Name="CBF_SKIP_ALLNOTIFICATIONS"       Value="0x003c0000" />
//                <Set Name="MF_HSZ_INFO"                     Value="0x01000000" />
//                <Set Name="MF_SENDMSGS"                     Value="0x02000000" />
//                <Set Name="MF_POSTMSGS"                     Value="0x04000000" />
//                <Set Name="MF_CALLBACKS"                    Value="0x08000000" />
//                <Set Name="MF_ERRORS"                       Value="0x10000000" />
//                <Set Name="MF_LINKS"                        Value="0x20000000" />
//                <Set Name="MF_CONV"                         Value="0x40000000" />
//            </Flag>
//        </Variable>
//
//        <!-- [MSGFLT_ACTION] -->
//        <Variable Name="[MSGFLT_ACTION]" Type="Alias" Base="DWORD">
//            <Display Name="DWORD" />
//            <Enum>
//                <Set Name="MSGFLT_RESET"        Value="0" />
//                <Set Name="MSGFLT_ALLOW"        Value="1" />
//                <Set Name="MSGFLT_DISALLOW"     Value="2" />
//            </Enum>
//        </Variable>
//
//        <!-- [CWP_FLAGS] -->
//        <Variable Name="[CWP_FLAGS]" Type="Alias" Base="UINT">
//            <Display Name="UINT" />
//            <Flag>
//                <Set Name="CWP_ALL"                 Value="0x0000" />
//                <Set Name="CWP_SKIPINVISIBLE"       Value="0x0001" />
//                <Set Name="CWP_SKIPDISABLED"        Value="0x0002" />
//                <Set Name="CWP_SKIPTRANSPARENT"     Value="0x0004" />
//            </Flag>
//        </Variable>
//
//        <!-- [MDITILE_TILE] -->
//        <Variable Name="[MDITILE_TILE]" Type="Alias" Base="UINT">
//            <Display Name="UINT" />
//            <Flag>
//                <Set Name="MDITILE_VERTICAL"        Value="0x0000" />
//                <Set Name="MDITILE_HORIZONTAL"      Value="0x0001" />
//                <Set Name="MDITILE_SKIPDISABLED"    Value="0x0002" />
//            </Flag>
//        </Variable>
//
//        <!-- [MDITILE_CASCADE] -->
//        <Variable Name="[MDITILE_CASCADE]" Type="Alias" Base="UINT">
//            <Display Name="UINT" />
//            <Flag>
//                <Set Name="MDITILE_SKIPDISABLED"    Value="0x0002" />
//                <Set Name="MDITILE_ZORDER"          Value="0x0004" />
//            </Flag>
//        </Variable>
//
//        <!-- [GWFS_FLAGS] -->
//        <Variable Name="[GWFS_FLAGS]" Type="Alias" Base="DWORD">
//            <Display Name="DWORD" />
//            <Flag>
//                <Set Name="GWFS_INCLUDE_ANCESTORS" Value="0x00000001" />
//            </Flag>
//        </Variable>
//
//        <!-- Dialog Boxes -->
//        <!-- CreateDialog is a macro -->
//        <!-- CreateDialogIndirect is a macro -->
//        <Category Name="Windows Application UI Development/Dialog Boxes" />
//        <Api Name="CreateDialogIndirectParam" BothCharset="True">
//            <Param Type="HINSTANCE" Name="hInstance" />
//            <Param Type="LPCDLGTEMPLATE" Name="lpTemplate" />
//            <Param Type="HWND" Name="hWndParent" />
//            <Param Type="DLGPROC" Name="lpDialogFunc" />
//            <Param Type="LPARAM" Name="lParamInit" />
//            <Return Type="HWND" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="CreateDialogParam" BothCharset="True">
//            <Param Type="HINSTANCE" Name="hInstance" />
//            <Param Type="LPCTSTR" Name="lpTemplateName" />
//            <Param Type="HWND" Name="hWndParent" />
//            <Param Type="DLGPROC" Name="lpDialogFunc" />
//            <Param Type="LPARAM" Name="lParamInit" />
//            <Return Type="HWND" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="DefDlgProc" BothCharset="True">
//            <Param Type="HWND" Name="hDlg" />
//            <Param Type="[WinMsg]" Name="Msg" />
//            <Param Type="WPARAM" Name="wParam" />
//            <Param Type="LPARAM" Name="lParam" />
//            <Return Type="LRESULT" />
//        </Api>
//        <!-- DialogBox is a macro -->
//        <!-- DialogBoxIndirect is a macro -->
//        <Api Name="DialogBoxIndirectParam" BothCharset="True">
//            <Param Type="HINSTANCE" Name="hInstance" />
//            <Param Type="LPCDLGTEMPLATE" Name="hDialogTemplate" />
//            <Param Type="HWND" Name="hWndParent" />
//            <Param Type="DLGPROC" Name="lpDialogFunc" />
//            <Param Type="LPARAM" Name="dwInitParam" />
//            <Return Type="INT_PTR" />
//            <Success Return="NotEqual" Value="-1" />
//        </Api>
//        <Api Name="DialogBoxParam" BothCharset="True">
//            <Param Type="HINSTANCE" Name="hInstance" />
//            <Param Type="LPCTSTR" Name="lpTemplateName" />
//            <Param Type="HWND" Name="hWndParent" />
//            <Param Type="DLGPROC" Name="lpDialogFunc" />
//            <Param Type="LPARAM" Name="dwInitParam" />
//            <Return Type="INT_PTR" />
//            <Success Return="NotEqual" Value="-1" />
//        </Api>
//        <Api Name="EndDialog">
//            <Param Type="HWND" Name="hDlg" />
//            <Param Type="INT_PTR" Name="nResult" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="GetDialogBaseUnits">
//            <Return Type="LONG" />
//        </Api>
//        <Api Name="GetDlgCtrlID">
//            <Param Type="HWND" Name="hwndCtl" />
//            <Return Type="int" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="GetDlgItem">
//            <Param Type="HWND" Name="hDlg" />
//            <Param Type="int" Name="nIDDlgItem" />
//            <Return Type="HWND" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="GetDlgItemInt">
//            <Param Type="HWND" Name="hDlg" />
//            <Param Type="int" Name="nIDDlgItem" />
//            <Param Type="BOOL*" Name="lpTranslated" />
//            <Param Type="BOOL" Name="bSigned" />
//            <Return Type="UINT" />
//            <!-- TODO: Success Condition is based in *lpTranslated -->
//        </Api>
//        <Api Name="GetDlgItemText" BothCharset="True">
//            <Param Type="HWND" Name="hDlg" />
//            <Param Type="int" Name="nIDDlgItem" />
//            <Param Type="LPTSTR" Name="lpString" />
//            <Param Type="int" Name="nMaxCount" />
//            <Return Type="UINT" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="GetNextDlgGroupItem">
//            <Param Type="HWND" Name="hDlg" />
//            <Param Type="HWND" Name="hCtl" />
//            <Param Type="BOOL" Name="bPrevious" />
//            <Return Type="HWND" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="GetNextDlgTabItem">
//            <Param Type="HWND" Name="hDlg" />
//            <Param Type="HWND" Name="hCtl" />
//            <Param Type="BOOL" Name="bPrevious" />
//            <Return Type="HWND" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="IsDialogMessage" BothCharset="True">
//            <Param Type="HWND" Name="hDlg" />
//            <Param Type="LPMSG" Name="lpMsg" />
//            <Return Type="BOOL" />
//            <Success />
//        </Api>
//        <Api Name="MapDialogRect">
//            <Param Type="HWND" Name="hDlg" />
//            <Param Type="LPRECT" Name="lpRect" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="MessageBox" BothCharset="True">
//            <Param Type="HWND" Name="hWnd" />
//            <Param Type="LPCTSTR" Name="lpText" />
//            <Param Type="LPCTSTR" Name="lpCaption" />
//            <Param Type="[MessageBoxType]" Name="uType" />
//            <Return Type="[MessageBoxResult]" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="MessageBoxEx" BothCharset="True">
//            <Param Type="HWND" Name="hWnd" />
//            <Param Type="LPCTSTR" Name="lpText" />
//            <Param Type="LPCTSTR" Name="lpCaption" />
//            <Param Type="[MessageBoxType]" Name="uType" />
//            <Param Type="WORD" Name="wLanguageId" />
//            <Return Type="[MessageBoxResult]" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="MessageBoxIndirect" BothCharset="True">
//            <Param Type="const LPMSGBOXPARAMS" Name="lpMsgBoxParams" />
//            <Return Type="int" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="MessageBoxTimeout" BothCharset="True">
//            <Param Type="HWND" Name="hWnd" />
//            <Param Type="LPCTSTR" Name="lpText" />
//            <Param Type="LPCTSTR" Name="lpCaption" />
//            <Param Type="[MessageBoxType]" Name="uType" />
//            <Param Type="WORD" Name="wLanguageId" />
//            <Param Type="[WaitTimeout]" Name="dwMilliseconds" />
//            <Return Type="[MessageBoxResult]" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="SendDlgItemMessage" BothCharset="True">
//            <Param Type="HWND" Name="hDlg" />
//            <Param Type="int" Name="nIDDlgItem" />
//            <Param Type="[WinMsg]" Name="Msg" />
//            <Param Type="WPARAM" Name="wParam" />
//            <Param Type="LPARAM" Name="lParam" />
//            <Return Type="LRESULT" />
//        </Api>
//        <Api Name="SetDlgItemInt">
//            <Param Type="HWND" Name="hDlg" />
//            <Param Type="int" Name="nIDDlgItem" />
//            <Param Type="UINT" Name="uValue" />
//            <Param Type="BOOL" Name="bSigned" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="SetDlgItemText" BothCharset="True">
//            <Param Type="HWND" Name="hDlg" />
//            <Param Type="int" Name="nIDDlgItem" />
//            <Param Type="LPCTSTR" Name="lpString" />
//            <Return Type="BOOL" />
//        </Api>
//        <!-- Messages and Message Queues - TODO: Incomplete -->
//        <Category Name="Windows Application UI Development/Windows and Messages/Messages and Message Queues" />
//        <Api Name="BroadcastSystemMessage">
//            <Param Type="DWORD" Name="dwFlags" />
//            <Param Type="LPDWORD" Name="lpdwRecipients" />
//            <Param Type="UINT" Name="uiMessage" />
//            <Param Type="WPARAM" Name="wParam" />
//            <Param Type="LPARAM" Name="lParam" />
//            <Return Type="long" />
//            <Success Return="Greater" Value="0" />
//        </Api>
//        <Api Name="BroadcastSystemMessageEx" BothCharset="True">
//            <Param Type="DWORD" Name="dwFlags" />
//            <Param Type="LPDWORD" Name="lpdwRecipients" />
//            <Param Type="UINT" Name="uiMessage" />
//            <Param Type="WPARAM" Name="wParam" />
//            <Param Type="LPARAM" Name="lParam" />
//            <Param Type="PBSMINFO" Name="pBSMInfo" />
//            <Return Type="long" />
//            <Success Return="Greater" Value="0" />
//        </Api>
//        <Api Name="DispatchMessage" BothCharset="True">
//            <Param Type="const MSG*" Name="lpmsg" />
//            <Return Type="LRESULT" />
//        </Api>
//        <Api Name="GetInputState">
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="GetMessage" BothCharset="True">
//            <Param Type="LPMSG" Name="lpMsg" />
//            <Param Type="HWND" Name="hWnd" />
//            <Param Type="UINT" Name="wMsgFilterMin" />
//            <Param Type="UINT" Name="wMsgFilterMax" />
//            <Return Type="[BOOL_NUMBER]" />
//            <Success Return="NotEqual" Value="-1" />
//        </Api>
//        <Api Name="GetMessageExtraInfo">
//            <Return Type="LPARAM" />
//        </Api>
//        <Api Name="GetMessagePos">
//            <Return Type="DWORD" />
//        </Api>
//        <Api Name="GetMessageTime">
//            <Return Type="LONG" />
//        </Api>
//        <Api Name="GetQueueStatus">
//            <Param Type="[QueueStatusFlag]" Display="UINT" Name="flags" />
//            <Return Type="DWORD" />
//        </Api>
//        <Api Name="InSendMessage">
//            <Return Type="BOOL" />
//            <Success />
//        </Api>
//        <Api Name="InSendMessageEx">
//            <Param Type="LPVOID" Name="lpReserved" />
//            <Return Type="DWORD" />
//        </Api>
//        <Api Name="PeekMessage" BothCharset="True">
//            <Param Type="LPMSG" Name="lpMsg" />
//            <Param Type="HWND" Name="hWnd" />
//            <Param Type="UINT" Name="wMsgFilterMin" />
//            <Param Type="UINT" Name="wMsgFilterMax" />
//            <Param Type="[PeekMessageFlag]" Name="wRemoveMsg" />
//            <Return Type="BOOL" />
//            <Success />
//        </Api>
//        <Api Name="PostMessage" BothCharset="True">
//            <Param Type="HWND" Name="hWnd" />
//            <Param Type="[WinMsg]" Name="Msg" />
//            <Param Type="WPARAM" Name="wParam" />
//            <Param Type="LPARAM" Name="lParam" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="PostQuitMessage">
//            <Param Type="int" Name="nExitCode" />
//            <Return Type="VOID" />
//        </Api>
//        <Api Name="PostThreadMessage" BothCharset="True">
//            <Param Type="DWORD" Name="idThread" />
//            <Param Type="[WinMsg]" Name="Msg" />
//            <Param Type="WPARAM" Name="wParam" />
//            <Param Type="LPARAM" Name="lParam" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="RegisterWindowMessage" BothCharset="True">
//            <Param Type="LPCTSTR" Name="lpString" />
//            <Return Type="UINT" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="ReplyMessage">
//            <Param Type="LRESULT" Name="lResult" />
//            <Return Type="BOOL" />
//            <Success />
//        </Api>
//        <Api Name="SendMessage" BothCharset="True">
//            <Param Type="HWND" Name="hWnd" />
//            <Param Type="[WinMsg]" Name="Msg" />
//            <Param Type="WPARAM" Name="wParam" />
//            <Param Type="LPARAM" Name="lParam" />
//            <Return Type="LRESULT" />
//        </Api>
//        <Api Name="SendMessageCallback" BothCharset="True">
//            <Param Type="HWND" Name="hWnd" />
//            <Param Type="[WinMsg]" Name="Msg" />
//            <Param Type="WPARAM" Name="wParam" />
//            <Param Type="LPARAM" Name="lParam" />
//            <Param Type="SENDASYNCPROC" Name="lpCallBack" />
//            <Param Type="ULONG_PTR" Name="dwData" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="SendMessageTimeout" BothCharset="True">
//            <Param Type="HWND" Name="hWnd" />
//            <Param Type="[WinMsg]" Name="Msg" />
//            <Param Type="WPARAM" Name="wParam" />
//            <Param Type="LPARAM" Name="lParam" />
//            <Param Type="[SendMessageTimeoutFlags]" Name="fuFlags" />
//            <Param Type="UINT" Name="uTimeout" />
//            <Param Type="PDWORD_PTR" Name="lpdwResult" />
//            <Return Type="LRESULT" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="SendNotifyMessage" BothCharset="True">
//            <Param Type="HWND" Name="hWnd" />
//            <Param Type="[WinMsg]" Name="Msg" />
//            <Param Type="WPARAM" Name="wParam" />
//            <Param Type="LPARAM" Name="lParam" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="SetMessageExtraInfo">
//            <Param Type="LPARAM" Name="lParam" />
//            <Return Type="LPARAM" />
//        </Api>
//        <Api Name="TranslateMessage">
//            <Param Type="const MSG*" Name="lpMsg" />
//            <Return Type="BOOL" />
//            <Success />
//        </Api>
//        <Api Name="WaitMessage">
//            <Return Type="BOOL" />
//        </Api>
//
//        <!-- Processes and Threads -->
//        <!-- Process -->
//        <Category Name="System Services/Processes and Threads/Process" />
//        <Api Name="GetGuiResources">
//            <Param Type="[ProcessHandle]" Name="hProcess" />
//            <Param Type="DWORD" Name="uiFlags" />
//            <Return Type="DWORD" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="IsImmersiveProcess">
//            <Param Type="HANDLE" Name="hProcess" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="SetProcessRestrictionExemption">
//            <Param Type="BOOL" Name="fEnableExemption" />
//            <Return Type="BOOL" />
//        </Api>
//
//        <!-- Thread -->
//        <Category Name="System Services/Processes and Threads/Thread" />
//        <Api Name="AttachThreadInput">
//            <Param Type="DWORD" Name="idAttach" />
//            <Param Type="DWORD" Name="idAttachTo" />
//            <Param Type="BOOL" Name="fAttach" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="WaitForInputIdle">
//            <Param Type="[ProcessHandle]" Name="hProcess" />
//            <Param Type="[WaitTimeout]" Name="dwMilliseconds" />
//            <Return Type="DWORD" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//
//        <!-- WOW64 -->
//        <Category Name="System Services/Processes and Threads/WOW64" />
//        <Api Name="IsWow64Message">
//            <Return Type="BOOL" />
//            <Success />
//        </Api>
//
//        <!-- Job Object -->
//        <Category Name="System Services/Processes and Threads/Job Object" />
//        <Api Name="UserHandleGrantAccess">
//            <Param Type="HANDLE" Name="hUserHandle" />
//            <Param Type="HANDLE" Name="hJob" />
//            <Param Type="BOOL" Name="bGrant" />
//            <Return Type="BOOL" />
//        </Api>
//
//        <!-- Windows -->
//        <Category Name="Windows Application UI Development/Windows and Messages/Windows" />
//        <Api Name="AdjustWindowRect">
//            <Param Type="LPRECT" Name="lpRect" />
//            <Param Type="[WindowStyle]" Name="dwStyle" />
//            <Param Type="BOOL" Name="bMenu" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="AdjustWindowRectEx">
//            <Param Type="LPRECT" Name="lpRect" />
//            <Param Type="[WindowStyle]" Name="dwStyle" />
//            <Param Type="BOOL" Name="bMenu" />
//            <Param Type="[WindowExStyle]" Name="dwExStyle" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="AllowActivateDetachQueuesSetFocus">
//            <Return Type="VOID" />
//        </Api>
//        <Api Name="AllowSetForegroundWindow">
//            <Param Type="DWORD" Name="dwProcessId" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="AnimateWindow">
//            <Param Type="HWND" Name="hwnd" />
//            <Param Type="DWORD" Name="dwTime" />
//            <Param Type="[AnimateWindowFlags]" Name="dwFlags" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="AnyPopup">
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="ArrangeIconicWindows">
//            <Param Type="HWND" Name="hWnd" />
//            <Return Type="UINT" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="BeginDeferWindowPos">
//            <Param Type="int" Name="nNumWindows" />
//            <Return Type="HDWP" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="BringWindowToTop">
//            <Param Type="HWND" Name="hWnd" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="CalculatePopupWindowPosition">
//            <Param Type="const POINT*" Name="anchorPoint" />
//            <Param Type="const SIZE*" Name="windowSize" />
//            <Param Type="[TrackPopupMenuFlags]" Name="flags" />
//            <Param Type="RECT*" Name="excludeRect" />
//            <Param Type="RECT*" Name="popupWindowPosition" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="CascadeWindows">
//            <Param Type="HWND" Name="hwndParent" />
//            <Param Type="[MDITILE_CASCADE]" Name="wHow" />
//            <Param Type="const RECT*" Name="lpRect" />
//            <Param Type="UINT" Name="cKids" />
//            <Param Type="const HWND*" Name="lpKids" Count="cKids" />
//            <Return Type="WORD" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="ChangeWindowMessageFilter">
//            <Param Type="[WinMsg]" Name="message" />
//            <Param Type="[WindowMessageFilterEnum]" Name="dwFlag" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="ChangeWindowMessageFilterEx">
//            <Param Type="HWND" Name="hWnd" />
//            <Param Type="[WinMsg]" Name="message" />
//            <Param Type="[MSGFLT_ACTION]" Name="action" />
//            <Param Type="PCHANGEFILTERSTRUCT" Name="pChangeFilterStruct" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="ChildWindowFromPoint">
//            <Param Type="HWND" Name="hWndParent" />
//            <Param Type="POINT" Name="Point" />
//            <Return Type="HWND" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="ChildWindowFromPointEx">
//            <Param Type="HWND" Name="hwndParent" />
//            <Param Type="POINT" Name="pt" />
//            <Param Type="[CWP_FLAGS]" Name="uFlags" />
//            <Return Type="HWND" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="CloseWindow">
//            <Param Type="HWND" Name="hWnd" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="CreateWindow" BothCharset="True">
//            <Param Type="LPCTSTR" Name="lpClassName" />
//            <Param Type="LPCTSTR" Name="lpWindowName" />
//            <Param Type="DWORD" Name="dwStyle" />
//            <Param Type="[CreateWindow_CW]" Name="x" />
//            <Param Type="[CreateWindow_CW]" Name="y" />
//            <Param Type="[CreateWindow_CW]" Name="nWidth" />
//            <Param Type="[CreateWindow_CW]" Name="nHeight" />
//            <Param Type="HWND" Name="hWndParent" />
//            <Param Type="HMENU" Name="hMenu" />
//            <Param Type="HINSTANCE" Name="hInstance" />
//            <Param Type="LPVOID" Name="lpParam" />
//            <Return Type="HWND" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="CreateWindowEx" BothCharset="True">
//            <Param Type="[WindowExStyle]" Name="dwExStyle" />
//            <Param Type="LPCTSTR" Name="lpClassName" />
//            <Param Type="LPCTSTR" Name="lpWindowName" />
//            <Param Type="[WindowStyle]" Name="dwStyle" />
//            <Param Type="[CreateWindow_CW]" Name="x" />
//            <Param Type="[CreateWindow_CW]" Name="y" />
//            <Param Type="[CreateWindow_CW]" Name="nWidth" />
//            <Param Type="[CreateWindow_CW]" Name="nHeight" />
//            <Param Type="HWND" Name="hWndParent" />
//            <Param Type="HMENU" Name="hMenu" />
//            <Param Type="HINSTANCE" Name="hInstance" />
//            <Param Type="LPVOID" Name="lpParam" />
//            <Return Type="HWND" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="DeferWindowPos">
//            <Param Type="HDWP" Name="hWinPosInfo" />
//            <Param Type="HWND" Name="hWnd" />
//            <Param Type="[HwndInsertAfterEnum]" Name="hWndInsertAfter" />
//            <Param Type="int" Name="x" />
//            <Param Type="int" Name="y" />
//            <Param Type="int" Name="cx" />
//            <Param Type="int" Name="cy" />
//            <Param Type="[SetWindowPosFlags]" Name="uFlags" />
//            <Return Type="HDWP" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="DeregisterShellHookWindow">
//            <Param Type="HWND" Name="hWnd" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="DestroyWindow">
//            <Param Type="HWND" Name="hWnd" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="EndDeferWindowPos">
//            <Param Type="HDWP" Name="hWinPosInfo" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="EndTask">
//            <Param Type="HWND" Name="hWnd" />
//            <Param Type="BOOL" Name="fShutDown" />
//            <Param Type="BOOL" Name="fForce" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="EnumChildWindows">
//            <Param Type="HWND" Name="hWndParent" />
//            <Param Type="WNDENUMPROC" Name="lpEnumFunc" />
//            <Param Type="LPARAM" Name="lParam" />
//            <Return Type="BOOL" />
//            <Success />
//        </Api>
//        <Api Name="EnumThreadWindows">
//            <Param Type="DWORD" Name="dwThreadId" />
//            <Param Type="WNDENUMPROC" Name="lpfn" />
//            <Param Type="LPARAM" Name="lParam" />
//            <Return Type="BOOL" />
//            <Success />
//        </Api>
//        <Api Name="EnumWindows">
//            <Param Type="WNDENUMPROC" Name="lpEnumFunc" />
//            <Param Type="LPARAM" Name="lParam" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="FindWindow" BothCharset="True">
//            <Param Type="LPCTSTR" Name="lpClassName" />
//            <Param Type="LPCTSTR" Name="lpWindowName" />
//            <Return Type="HWND" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="FindWindowEx" BothCharset="True">
//            <Param Type="HWND" Name="hwndParent" />
//            <Param Type="HWND" Name="hwndChildAfter" />
//            <Param Type="LPCTSTR" Name="lpszClass" />
//            <Param Type="LPCTSTR" Name="lpszWindow" />
//            <Return Type="HWND" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="GetAltTabInfo" BothCharset="True">
//            <Param Type="HWND" Name="hwnd" />
//            <Param Type="int" Name="iItem" />
//            <Param Type="PALTTABINFO" Name="pati" />
//            <Param Type="LPTSTR" Name="pszItemText" />
//            <Param Type="UINT" Name="cchItemText" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="GetAncestor">
//            <Param Type="HWND" Name="hwnd" />
//            <Param Type="[GetAncestorEnum]" Name="gaFlags" />
//            <Return Type="HWND" />
//        </Api>
//        <Api Name="GetClientRect">
//            <Param Type="HWND" Name="hWnd" />
//            <Param Type="LPRECT" Name="lpRect" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="GetDesktopWindow">
//            <Return Type="HWND" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="GetForegroundWindow">
//            <Return Type="HWND" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="GetGUIThreadInfo">
//            <Param Type="DWORD" Name="idThread" />
//            <Param Type="LPGUITHREADINFO" Name="lpgui" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="GetLastActivePopup">
//            <Param Type="HWND" Name="hWnd" />
//            <Return Type="HWND" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="GetLayeredWindowAttributes">
//            <Param Type="HWND" Name="hwnd" />
//            <Param Type="COLORREF*" Name="pcrKey" />
//            <Param Type="BYTE*" Name="pbAlpha" />
//            <Param Type="[LayeredWindowAttribute*]" Name="pdwFlags" />
//            <Return Type="BOOL" />
//        </Api>
//        <!-- GetNextWindow is a macro -->
//        <Api Name="GetParent">
//            <Param Type="HWND" Name="hWnd" />
//            <Return Type="HWND" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="GetProcessDefaultLayout">
//            <Param Type="DWORD*" Name="pdwDefaultLayout" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="GetShellWindow">
//            <Return Type="HWND" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="GetTitleBarInfo">
//            <Param Type="HWND" Name="hwnd" />
//            <Param Type="PTITLEBARINFO" Name="pti" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="GetTopWindow">
//            <Param Type="HWND" Name="hWnd" />
//            <Return Type="HWND" />
//        </Api>
//        <Api Name="GetWindow">
//            <Param Type="HWND" Name="hWnd" />
//            <Param Type="[GetWindowEnum]" Name="uCmd" />
//            <Return Type="HWND" />
//        </Api>
//        <Api Name="GetWindowDisplayAffinity">
//            <Param Type="HWND" Name="hWnd" />
//            <Param Type="DWORD*" Name="dwAffinity" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="GetWindowInfo">
//            <Param Type="HWND" Name="hwnd" />
//            <Param Type="PWINDOWINFO" Name="pwi" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="GetWindowModuleFileName" BothCharset="True">
//            <Param Type="HWND" Name="hwnd" />
//            <Param Type="LPTSTR" Name="lpszFileName" />
//            <Param Type="UINT" Name="cchFileNameMax" />
//            <Return Type="UINT" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="GetWindowPlacement">
//            <Param Type="HWND" Name="hWnd" />
//            <Param Type="WINDOWPLACEMENT*" Name="lpwndpl" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="GetWindowRect">
//            <Param Type="HWND" Name="hWnd" />
//            <Param Type="LPRECT" Name="lpRect" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="GetWindowText" BothCharset="True">
//            <Param Type="HWND" Name="hWnd" />
//            <Param Type="LPTSTR" Name="lpString" OutputOnly="True" />
//            <Param Type="int" Name="nMaxCount" />
//            <Return Type="int" />
//        </Api>
//        <Api Name="GetWindowTextLength" BothCharset="True">
//            <Param Type="HWND" Name="hWnd" />
//            <Return Type="int" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="GetWindowThreadProcessId">
//            <Param Type="HWND" Name="hWnd" />
//            <Param Type="LPDWORD" Name="lpdwProcessId" />
//            <Return Type="DWORD" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="InternalGetWindowText">
//            <Param Type="HWND" Name="hWnd" />
//            <Param Type="LPWSTR" Name="lpString" OutputOnly="True" />
//            <Param Type="int" Name="nMaxCount" />
//            <Return Type="int" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="IsChild">
//            <Param Type="HWND" Name="hWndParent" />
//            <Param Type="HWND" Name="hWnd" />
//            <Return Type="BOOL" />
//            <Success />
//        </Api>
//        <Api Name="IsGUIThread">
//            <Param Type="BOOL" Name="bConvert" />
//            <Return Type="BOOL" />
//            <Success />
//        </Api>
//        <Api Name="IsHungAppWindow">
//            <Param Type="HWND" Name="hWnd" />
//            <Return Type="BOOL" />
//            <Success />
//        </Api>
//        <Api Name="IsIconic">
//            <Param Type="HWND" Name="hWnd" />
//            <Return Type="BOOL" />
//            <Success />
//        </Api>
//        <Api Name="IsProcessDPIAware">
//            <Return Type="BOOL" />
//            <Success />
//        </Api>
//        <Api Name="IsWindow">
//            <Param Type="HWND" Name="hWnd" />
//            <Return Type="BOOL" />
//            <Success />
//        </Api>
//        <Api Name="IsWindowUnicode">
//            <Param Type="HWND" Name="hWnd" />
//            <Return Type="BOOL" />
//            <Success />
//        </Api>
//        <Api Name="IsWindowVisible">
//            <Param Type="HWND" Name="hWnd" />
//            <Return Type="BOOL" />
//            <Success />
//        </Api>
//        <Api Name="IsZoomed">
//            <Param Type="HWND" Name="hWnd" />
//            <Return Type="BOOL" />
//            <Success />
//        </Api>
//        <Api Name="LockSetForegroundWindow">
//            <Param Type="[LockSetForegroundWindowCode]" Name="uLockCode" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="LogicalToPhysicalPoint">
//            <Param Type="HWND" Name="hWnd" />
//            <Param Type="LPPOINT" Name="lpPoint" />
//            <Return Type="void" />
//        </Api>
//        <Api Name="MoveWindow">
//            <Param Type="HWND" Name="hWnd" />
//            <Param Type="int" Name="X" />
//            <Param Type="int" Name="Y" />
//            <Param Type="int" Name="nWidth" />
//            <Param Type="int" Name="nHeight" />
//            <Param Type="BOOL" Name="bRepaint" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="OpenIcon">
//            <Param Type="HWND" Name="hWnd" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="PhysicalToLogicalPoint">
//            <Param Type="HWND" Name="hWnd" />
//            <Param Type="LPPOINT" Name="lpPoint" />
//            <Return Type="void" />
//        </Api>
//        <Api Name="RealChildWindowFromPoint">
//            <Param Type="HWND" Name="hwndParent" />
//            <Param Type="POINT" Name="ptParentClientCoords" />
//            <Return Type="HWND" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="RealGetWindowClass">
//            <Param Type="HWND" Name="hwnd" />
//            <Param Type="LPTSTR" Name="pszType" />
//            <Param Type="UINT" Name="cchType" />
//            <Return Type="UINT" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="RegisterShellHookWindow">
//            <Param Type="HWND" Name="hWnd" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="SetForegroundWindow">
//            <Param Type="HWND" Name="hWnd" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="SetLayeredWindowAttributes">
//            <Param Type="HWND" Name="hwnd" />
//            <Param Type="COLORREF" Name="crKey" />
//            <Param Type="BYTE" Name="bAlpha" />
//            <Param Type="[LayeredWindowAttribute]" Name="dwFlags" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="SetParent">
//            <Param Type="HWND" Name="hWndChild" />
//            <Param Type="HWND" Name="hWndNewParent" />
//            <Return Type="HWND" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="SetProcessDefaultLayout">
//            <Param Type="DWORD" Name="dwDefaultLayout" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="SetProcessDPIAware">
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="SetWindowDisplayAffinity">
//            <Param Type="HWND" Name="hWnd" />
//            <Param Type="DWORD" Name="dwAffinity" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="SetWindowPlacement">
//            <Param Type="HWND" Name="hWnd" />
//            <Param Type="WINDOWPLACEMENT*" Name="lpwndpl" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="SetWindowPos">
//            <Param Type="HWND" Name="hWnd" />
//            <Param Type="[HwndInsertAfterEnum]" Name="hWndInsertAfter" />
//            <Param Type="int" Name="X" />
//            <Param Type="int" Name="Y" />
//            <Param Type="int" Name="cx" />
//            <Param Type="int" Name="cy" />
//            <Param Type="[SetWindowPosFlags]" Name="uFlags" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="SetWindowText" BothCharset="True">
//            <Param Type="HWND" Name="hWnd" />
//            <Param Type="LPCTSTR" Name="lpString" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="ShowOwnedPopups">
//            <Param Type="HWND" Name="hWnd" />
//            <Param Type="BOOL" Name="fShow" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="ShowWindow">
//            <Param Type="HWND" Name="hWnd" />
//            <Param Type="[ShowWindowCmd]" Name="nCmdShow" />
//            <Return Type="BOOL" />
//            <Success />
//        </Api>
//        <Api Name="ShowWindowAsync">
//            <Param Type="HWND" Name="hWnd" />
//            <Param Type="int" Name="nCmdShow" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="SoundSentry">
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="SwitchToThisWindow">
//            <Param Type="HWND" Name="hWnd" />
//            <Param Type="BOOL" Name="fAltTab" />
//            <Return Type="VOID" />
//        </Api>
//        <Api Name="TileWindows">
//            <Param Type="HWND" Name="hwndParent" />
//            <Param Type="[MDITILE_TILE]" Name="wHow" />
//            <Param Type="RECT*" Name="lpRect" />
//            <Param Type="UINT" Name="cKids" />
//            <Param Type="const HWND*" Name="lpKids" Count="cKids" />
//            <Return Type="WORD" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="UpdateLayeredWindow">
//            <Param Type="HWND" Name="hwnd" />
//            <Param Type="HDC" Name="hdcDst" />
//            <Param Type="POINT*" Name="pptDst" />
//            <Param Type="SIZE*" Name="psize" />
//            <Param Type="HDC" Name="hdcSrc" />
//            <Param Type="POINT*" Name="pptSrc" />
//            <Param Type="COLORREF" Name="crKey" />
//            <Param Type="BLENDFUNCTION*" Name="pblend" />
//            <Param Type="[UpdateLayeredWindowFlags]" Name="dwFlags" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="UpdateLayeredWindowIndirect">
//            <Param Type="HWND" Name="hwnd" />
//            <Param Type="const UPDATELAYEREDWINDOWINFO*" Name="pULWInfo" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="WindowFromPhysicalPoint">
//            <Param Type="POINT" Name="Point" />
//            <Return Type="HWND" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="WindowFromPoint">
//            <Param Type="POINT" Name="Point" />
//            <Return Type="HWND" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <!-- System Shutdown -->
//        <Category Name="System Services/Windows System Information/System Shutdown" />
//        <Api Name="ExitWindowsEx">
//            <Param Type="[EWX_FLAGS]" Name="uFlags" />
//            <Param Type="[SHTDN_REASON]" Name="dwReason" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="LockWorkStation">
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="ShutdownBlockReasonCreate">
//            <Param Type="HWND" Name="hWnd" />
//            <Param Type="LPCWSTR" Name="pwszReason" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="ShutdownBlockReasonDestroy">
//            <Param Type="HWND" Name="hWnd" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="ShutdownBlockReasonQuery">
//            <Param Type="HWND" Name="hWnd" />
//            <Param Type="LPWSTR" Name="pwszBuff" />
//            <Param Type="DWORD*" Name="pcchBuff" />
//            <Return Type="BOOL" />
//        </Api>
//        <!-- Bitmaps -->
//        <Category Name="Graphics and Gaming/Legacy Graphics/Windows GDI/Bitmaps" />
//        <Api Name="LoadBitmap" BothCharset="True">
//            <Param Type="HINSTANCE" Name="hInstance" />
//            <Param Type="[LoadBitmapString/LPCTSTR]" Name="lpBitmapName" />
//            <Return Type="HBITMAP" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <!-- Brushes -->
//        <Category Name="Graphics and Gaming/Legacy Graphics/Windows GDI/Brushes" />
//        <Api Name="GetSysColorBrush">
//            <Param Type="[SysColorIndex]" Name="nIndex" />
//            <Return Type="HBRUSH" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <!-- Buttons -->
//        <Category Name="Windows Application UI Development/Windows Controls/Control Library/Buttons" />
//        <Api Name="CheckDlgButton">
//            <Param Type="HWND" Name="hDlg" />
//            <Param Type="int" Name="nIDButton" />
//            <Param Type="[ButtonState]" Name="uCheck" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="CheckRadioButton">
//            <Param Type="HWND" Name="hDlg" />
//            <Param Type="int" Name="nIDFirstButton" />
//            <Param Type="int" Name="nIDLastButton" />
//            <Param Type="int" Name="nIDCheckButton" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="IsDlgButtonChecked">
//            <Param Type="HWND" Name="hDlg" />
//            <Param Type="int" Name="nIDButton" />
//            <Return Type="[ButtonState]" />
//        </Api>
//        <!-- Carets -->
//        <Category Name="Windows Application UI Development/Menus and Other Resources/Carets" />
//        <Api Name="CreateCaret">
//            <Param Type="HWND" Name="hWnd" />
//            <Param Type="HBITMAP" Name="hBitmap" />
//            <Param Type="int" Name="nWidth" />
//            <Param Type="int" Name="nHeight" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="DestroyCaret">
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="GetCaretBlinkTime">
//            <Return Type="UINT" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="GetCaretPos">
//            <Param Type="LPPOINT" Name="lpPoint" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="HideCaret">
//            <Param Type="HWND" Name="hWnd" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="SetCaretBlinkTime">
//            <Param Type="UINT" Name="uMSeconds" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="SetCaretPos">
//            <Param Type="int" Name="X" />
//            <Param Type="int" Name="Y" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="ShowCaret">
//            <Param Type="HWND" Name="hWnd" />
//            <Return Type="BOOL" />
//        </Api>
//        <!-- Clipbpard -->
//        <Category Name="Windows Application UI Development/Data Exchange/Clipboard" />
//        <Api Name="AddClipboardFormatListener">
//            <Param Type="HWND" Name="hwnd" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="ChangeClipboardChain">
//            <Param Type="HWND" Name="hWndRemove" />
//            <Param Type="HWND" Name="hWndNewNext" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="CloseClipboard">
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="CountClipboardFormats">
//            <Return Type="int" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="EmptyClipboard">
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="EnumClipboardFormats">
//            <Param Type="UINT" Name="format" />
//            <Return Type="UINT" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="GetClipboardData">
//            <Param Type="[ClipboardFormat]" Name="uFormat" />
//            <Return Type="HANDLE" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="GetClipboardFormatName" BothCharset="True">
//            <Param Type="UINT" Name="format" />
//            <Param Type="LPTSTR" Name="lpszFormatName" OutputOnly="True" />
//            <Param Type="int" Name="cchMaxCount" />
//            <Return Type="int" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="GetClipboardOwner">
//            <Return Type="HWND" />
//        </Api>
//        <Api Name="GetClipboardSequenceNumber">
//            <Return Type="DWORD" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="GetClipboardViewer">
//            <Return Type="HWND" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="GetOpenClipboardWindow">
//            <Return Type="HWND" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="GetPriorityClipboardFormat">
//            <Param Type="UINT*" Name="paFormatPriorityList" />
//            <Param Type="int" Name="cFormats" />
//            <Return Type="int" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="GetUpdatedClipboardFormats">
//            <Param Type="PUINT" Name="lpuiFormats" />
//            <Param Type="UINT" Name="cFormats" />
//            <Param Type="PUINT" Name="pcFormatsOut" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="IsClipboardFormatAvailable">
//            <Param Type="[ClipboardFormat]" Name="format" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="OpenClipboard">
//            <Param Type="HWND" Name="hWndNewOwner" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="RegisterClipboardFormat" BothCharset="True">
//            <Param Type="LPCTSTR" Name="lpszFormat" />
//            <Return Type="UINT" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="RemoveClipboardFormatListener">
//            <Param Type="HWND" Name="hwnd" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="SetClipboardData">
//            <Param Type="[ClipboardFormat]" Name="uFormat" />
//            <Param Type="HANDLE" Name="hMem" />
//            <Return Type="HANDLE" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="SetClipboardViewer">
//            <Param Type="HWND" Name="hWndNewViewer" />
//            <Return Type="HWND" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <!-- ComboBox -->
//        <Category Name="Windows Application UI Development/Windows Controls/Control Library/ComboBox" />
//        <Api Name="DlgDirListComboBox" BothCharset="True">
//            <Param Type="HWND" Name="hDlg" />
//            <Param Type="LPTSTR" Name="lpPathSpec" />
//            <Param Type="int" Name="nIDComboBox" />
//            <Param Type="int" Name="nIDStaticPath" />
//            <Param Type="UINT" Name="uFiletype" />
//            <Return Type="int" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="DlgDirSelectComboBoxEx" BothCharset="True">
//            <Param Type="HWND" Name="hDlg" />
//            <Param Type="LPTSTR" Name="lpString" />
//            <Param Type="int" Name="nCount" />
//            <Param Type="int" Name="nIDComboBox" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="GetComboBoxInfo">
//            <Param Type="HWND" Name="hwndCombo" />
//            <Param Type="PCOMBOBOXINFO" Name="pcbi" />
//            <Return Type="BOOL" />
//        </Api>
//        <!-- Coordinate Space and Transformation -->
//        <Category Name="Graphics and Gaming/Legacy Graphics/Windows GDI/Coordinate Spaces and Transformations" />
//        <Api Name="ClientToScreen">
//            <Param Type="HWND" Name="hWnd" />
//            <Param Type="LPPOINT" Name="lpPoint" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="MapWindowPoints">
//            <Param Type="HWND" Name="hWndFrom" />
//            <Param Type="HWND" Name="hWndTo" />
//            <Param Type="LPPOINT" Name="lpPoints" />
//            <Param Type="UINT" Name="cPoints" />
//            <Return Type="int" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="ScreenToClient">
//            <Param Type="HWND" Name="hWnd" />
//            <Param Type="LPPOINT" Name="lpPoint" />
//            <Return Type="BOOL" />
//        </Api>
//        <!-- Cursors -->
//        <Category Name="Windows Application UI Development/Menus and Other Resources/Cursors" />
//        <Api Name="ClipCursor">
//            <Param Type="const RECT*" Name="lpRect" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="CopyCursor">
//            <Param Type="HCURSOR" Name="pcur" />
//            <Return Type="HCURSOR" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="CreateCursor">
//            <Param Type="HINSTANCE" Name="hInst" />
//            <Param Type="int" Name="xHotSpot" />
//            <Param Type="int" Name="yHotSpot" />
//            <Param Type="int" Name="nWidth" />
//            <Param Type="int" Name="nHeight" />
//            <Param Type="const VOID*" Name="pvANDPlane" />
//            <Param Type="const VOID*" Name="pvXORPlane" />
//            <Return Type="HCURSOR" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="DestroyCursor">
//            <Param Type="HCURSOR" Name="hCursor" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="GetClipCursor">
//            <Param Type="LPRECT" Name="lpRect" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="GetCursor">
//            <Return Type="HCURSOR" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="GetCursorInfo">
//            <Param Type="PCURSORINFO" Name="pci" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="GetCursorPos">
//            <Param Type="LPPOINT" Name="lpPoint" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="GetPhysicalCursorPos">
//            <Param Type="LPPOINT" Name="lpPoint" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="LoadCursor" BothCharset="True">
//            <Param Type="HINSTANCE" Name="hInstance" />
//            <Param Type="[LoadCursorString/LPCTSTR]" Name="lpCursorName" />
//            <Return Type="HCURSOR" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="LoadCursorFromFile" BothCharset="True">
//            <Param Type="LPCTSTR" Name="lpFileName" />
//            <Return Type="HCURSOR" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="SetCursor">
//            <Param Type="HCURSOR" Name="hCursor" />
//            <Return Type="HCURSOR" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="SetCursorPos">
//            <Param Type="int" Name="X" />
//            <Param Type="int" Name="Y" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="SetPhysicalCursorPos">
//            <Param Type="int" Name="X" />
//            <Param Type="int" Name="Y" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="SetSystemCursor">
//            <Param Type="HCURSOR" Name="hcur" />
//            <Param Type="[CursorId]" Name="id" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="ShowCursor">
//            <Param Type="BOOL" Name="bShow" />
//            <Return Type="int" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <!-- Device Context -->
//        <Category Name="Graphics and Gaming/Legacy Graphics/Windows GDI/Device Contexts" />
//        <Api Name="ChangeDisplaySettings" BothCharset="True">
//            <Param Type="DEVMODE*" Name="lpDevMode" />
//            <Param Type="DWORD" Name="dwflags" />
//            <Return Type="LONG" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="ChangeDisplaySettingsEx" BothCharset="True">
//            <Param Type="LPCTSTR" Name="lpszDeviceName" />
//            <Param Type="DEVMODE*" Name="lpDevMode" />
//            <Param Type="HWND" Name="hwnd" />
//            <Param Type="DWORD" Name="dwflags" />
//            <Param Type="LPVOID" Name="lParam" />
//            <Return Type="LONG" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="EnumDisplayDevices" BothCharset="True">
//            <Param Type="LPCTSTR" Name="lpDevice" />
//            <Param Type="DWORD" Name="iDevNum" />
//            <Param Type="PDISPLAY_DEVICE" Name="lpDisplayDevice" />
//            <Param Type="[EnumDisplayDevicesFlags]" Name="dwFlags" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="EnumDisplaySettings" BothCharset="True">
//            <Param Type="LPCTSTR" Name="lpszDeviceName" />
//            <Param Type="[EnumDisplaySettingsEnum]" Name="iModeNum" />
//            <Param Type="DEVMODE*" Name="lpDevMode" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="EnumDisplaySettingsEx" BothCharset="True">
//            <Param Type="LPCTSTR" Name="lpszDeviceName" />
//            <Param Type="DWORD" Name="iModeNum" />
//            <Param Type="DEVMODE*" Name="lpDevMode" />
//            <Param Type="DWORD" Name="dwFlags" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="GetDC">
//            <Param Type="HWND" Name="hWnd" />
//            <Return Type="HDC" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="GetDCEx">
//            <Param Type="HWND" Name="hWnd" />
//            <Param Type="HRGN" Name="hrgnClip" />
//            <Param Type="[DCExFlags]" Name="flags" />
//            <Return Type="HDC" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="ReleaseDC">
//            <Param Type="HWND" Name="hWnd" />
//            <Param Type="HDC" Name="hDC" />
//            <Return Type="int" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <!-- Device Management -->
//        <Category Name="Devices/Device Management" />
//        <Api Name="RegisterDeviceNotification" BothCharset="True">
//            <Param Type="HANDLE" Name="hRecipient" />
//            <Param Type="LPVOID" Name="NotificationFilter" />
//            <Param Type="[DeviceNotificationFlags]" Name="Flags" />
//            <Return Type="HDEVNOTIFY" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="UnregisterDeviceNotification">
//            <Param Type="HDEVNOTIFY" Name="Handle" />
//            <Return Type="BOOL" />
//        </Api>
//        <!-- Dynamic Data Exchange -->
//        <Category Name="Windows Application UI Development/Data Exchange/Dynamic Data Exchange" />
//        <Api Name="DdeSetQualityOfService">
//            <Param Type="HWND" Name="hwndClient" />
//            <Param Type="const SECURITY_QUALITY_OF_SERVICE*" Name="pqosNew" />
//            <Param Type="PSECURITY_QUALITY_OF_SERVICE" Name="pqosPrev" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="FreeDDElParam">
//            <Param Type="UINT" Name="msg" />
//            <Param Type="LPARAM" Name="lParam" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="ImpersonateDdeClientWindow">
//            <Param Type="HWND" Name="hWndClient" />
//            <Param Type="HWND" Name="hWndServer" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="PackDDElParam">
//            <Param Type="UINT" Name="msg" />
//            <Param Type="UINT_PTR" Name="uiLo" />
//            <Param Type="UINT_PTR" Name="uiHi" />
//            <Return Type="LPARAM" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="ReuseDDElParam">
//            <Param Type="LPARAM" Name="lParam" />
//            <Param Type="UINT" Name="msgIn" />
//            <Param Type="UINT" Name="msgOut" />
//            <Param Type="UINT_PTR" Name="uiLo" />
//            <Param Type="UINT_PTR" Name="uiHi" />
//            <Return Type="LPARAM" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="UnpackDDElParam">
//            <Param Type="UINT" Name="msg" />
//            <Param Type="LPARAM" Name="lParam" />
//            <Param Type="PUINT_PTR" Name="puiLo" />
//            <Param Type="PUINT_PTR" Name="puiHi" />
//            <Return Type="BOOL" />
//        </Api>
//        <!-- Dynamic Data Exchange Management -->
//        <Category Name="Windows Application UI Development/Data Exchange/Dynamic Data Exchange Management Library (DDEML)" />
//        <Api Name="DdeAbandonTransaction">
//            <Param Type="DWORD" Name="idInst" />
//            <Param Type="HCONV" Name="hConv" />
//            <Param Type="DWORD" Name="idTransaction" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="DdeAccessData">
//            <Param Type="HDDEDATA" Name="hData" />
//            <Param Type="LPDWORD" Name="pcbDataSize" />
//            <Return Type="LPBYTE" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="DdeAddData">
//            <Param Type="HDDEDATA" Name="hData" />
//            <Param Type="LPBYTE" Name="pSrc" />
//            <Param Type="DWORD" Name="cb" />
//            <Param Type="DWORD" Name="cbOff" />
//            <Return Type="HDDEDATA" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="DdeClientTransaction">
//            <Param Type="LPBYTE" Name="pData" />
//            <Param Type="DWORD" Name="cbData" />
//            <Param Type="HCONV" Name="hConv" />
//            <Param Type="HSZ" Name="hszItem" />
//            <Param Type="UINT" Name="wFmt" />
//            <Param Type="UINT" Name="wType" />
//            <Param Type="DWORD" Name="dwTimeout" />
//            <Param Type="LPDWORD" Name="pdwResult" />
//            <Return Type="HDDEDATA" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="DdeCmpStringHandles">
//            <Param Type="HSZ" Name="hsz1" />
//            <Param Type="HSZ" Name="hsz2" />
//            <Return Type="int" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="DdeConnect">
//            <Param Type="DWORD" Name="idInst" />
//            <Param Type="HSZ" Name="hszService" />
//            <Param Type="HSZ" Name="hszTopic" />
//            <Param Type="PCONVCONTEXT" Name="pCC" />
//            <Return Type="HCONV" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="DdeConnectList">
//            <Param Type="DWORD" Name="idInst" />
//            <Param Type="HSZ" Name="hszService" />
//            <Param Type="HSZ" Name="hszTopic" />
//            <Param Type="HCONVLIST" Name="hConvList" />
//            <Param Type="PCONVCONTEXT" Name="pCC" />
//            <Return Type="HCONVLIST" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="DdeCreateDataHandle">
//            <Param Type="DWORD" Name="idInst" />
//            <Param Type="LPBYTE" Name="pSrc" />
//            <Param Type="DWORD" Name="cb" />
//            <Param Type="DWORD" Name="cbOff" />
//            <Param Type="HSZ" Name="hszItem" />
//            <Param Type="UINT" Name="wFmt" />
//            <Param Type="UINT" Name="afCmd" />
//            <Return Type="HDDEDATA" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="DdeCreateStringHandle" BothCharset="True">
//            <Param Type="DWORD" Name="idInst" />
//            <Param Type="LPTSTR" Name="psz" />
//            <Param Type="[CODE_PAGE|int]" Name="iCodePage" />
//            <Return Type="HSZ" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="DdeDisconnect">
//            <Param Type="HCONV" Name="hConv" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="DdeDisconnectList">
//            <Param Type="HCONVLIST" Name="hConvList" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="DdeEnableCallback">
//            <Param Type="DWORD" Name="idInst" />
//            <Param Type="HCONV" Name="hConv" />
//            <Param Type="UINT" Name="wCmd" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="DdeFreeDataHandle">
//            <Param Type="HDDEDATA" Name="hData" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="DdeFreeStringHandle">
//            <Param Type="DWORD" Name="idInst" />
//            <Param Type="HSZ" Name="hsz" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="DdeGetData">
//            <Param Type="HDDEDATA" Name="hData" />
//            <Param Type="LPBYTE" Name="pDst" />
//            <Param Type="DWORD" Name="cbMax" />
//            <Param Type="DWORD" Name="cbOff" />
//            <Return Type="DWORD" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="DdeGetLastError">
//            <Param Type="DWORD" Name="idInst" />
//            <Return Type="UINT" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="DdeImpersonateClient">
//            <Param Type="HCONV" Name="hConv" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="DdeInitialize" BothCharset="True">
//            <Param Type="LPDWORD" Name="pidInst" />
//            <Param Type="PFNCALLBACK" Name="pfnCallback" />
//            <Param Type="[DDE_INITIALIZE_FLAGS]" Name="afCmd" />
//            <Param Type="DWORD" Name="ulRes" />
//            <Return Type="UINT" />
//            <Success Return="Equal" Value="0" />
//        </Api>
//        <Api Name="DdeKeepStringHandle">
//            <Param Type="DWORD" Name="idInst" />
//            <Param Type="HSZ" Name="hsz" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="DdeNameService">
//            <Param Type="DWORD" Name="idInst" />
//            <Param Type="UINT" Name="hsz1" />
//            <Param Type="UINT" Name="hsz2" />
//            <Param Type="UINT" Name="afCmd" />
//            <Return Type="HDDEDATA" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="DdePostAdvise">
//            <Param Type="DWORD" Name="idInst" />
//            <Param Type="HSZ" Name="hszTopic" />
//            <Param Type="HSZ" Name="hszItem" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="DdeQueryConvInfo">
//            <Param Type="HCONV" Name="hConv" />
//            <Param Type="DWORD" Name="idTransaction" />
//            <Param Type="PCONVINFO" Name="pConvInfo" />
//            <Return Type="UINT" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="DdeQueryNextServer">
//            <Param Type="HCONVLIST" Name="hConvList" />
//            <Param Type="HCONV" Name="hConvPrev" />
//            <Return Type="HCONV" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="DdeQueryString" BothCharset="True">
//            <Param Type="DWORD" Name="idInst" />
//            <Param Type="HSZ" Name="hsz" />
//            <Param Type="LPTSTR" Name="psz" />
//            <Param Type="DWORD" Name="cchMax" />
//            <Param Type="[CODE_PAGE|int]" Name="iCodePage" />
//            <Return Type="DWORD" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="DdeReconnect">
//            <Param Type="HCONV" Name="hConv" />
//            <Return Type="HCONV" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="DdeSetUserHandle">
//            <Param Type="HCONV" Name="hConv" />
//            <Param Type="DWORD" Name="id" />
//            <Param Type="DWORD_PTR" Name="hUser" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="DdeUnaccessData">
//            <Param Type="HDDEDATA" Name="hData" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="DdeUninitialize">
//            <Param Type="DWORD" Name="idInst" />
//            <Return Type="BOOL" />
//        </Api>
//        <!-- Error Handling -->
//        <Category Name="Diagnostics/Debugging and Error Handling/Error Handling" />
//        <Api Name="FlashWindow">
//            <Param Type="HWND" Name="hWnd" />
//            <Param Type="BOOL" Name="bInvert" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="FlashWindowEx">
//            <Param Type="PFLASHWINFO" Name="pfwi" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="MessageBeep">
//            <Param Type="UINT" Name="uType" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="SetLastErrorEx">
//            <Param Type="[ERROR_CODE]" Name="dwErrCode" />
//            <Param Type="[SET_LAST_ERROR_EX_TYPE]" Name="dwType" />
//            <Return Type="void" />
//        </Api>
//        <!-- Filled Shapes -->
//        <Category Name="Graphics and Gaming/Legacy Graphics/Windows GDI/Filled Shapes" />
//        <Api Name="FillRect">
//            <Param Type="HDC" Name="hDC" />
//            <Param Type="const RECT*" Name="lprc" />
//            <Param Type="HBRUSH" Name="hbr" />
//            <Return Type="int" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="FrameRect">
//            <Param Type="HDC" Name="hDC" />
//            <Param Type="const RECT*" Name="lprc" />
//            <Param Type="HBRUSH" Name="hbr" />
//            <Return Type="int" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="InvertRect">
//            <Param Type="HDC" Name="hDC" />
//            <Param Type="const RECT*" Name="lprc" />
//            <Return Type="BOOL" />
//        </Api>
//        <!-- Font and Text -->
//        <Category Name="Graphics and Gaming/Legacy Graphics/Windows GDI/Fonts and Text" />
//        <Api Name="DrawText" BothCharset="True">
//            <Param Type="HDC" Name="hDC" />
//            <Param Type="LPCTSTR" Name="lpchText" />
//            <Param Type="int" Name="nCount" />
//            <Param Type="LPRECT" Name="lpRect" />
//            <Param Type="[DrawTextFlags]" Display="UINT" Name="uFormat" />
//            <Return Type="int" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="DrawTextEx" BothCharset="True">
//            <Param Type="HDC" Name="hdc" />
//            <Param Type="LPTSTR" Name="lpchText" />
//            <Param Type="int" Name="cchText" />
//            <Param Type="LPRECT" Name="lprc" />
//            <Param Type="[DrawTextFlags]" Display="UINT" Name="dwDTFormat" />
//            <Param Type="LPDRAWTEXTPARAMS" Name="lpDTParams" />
//            <Return Type="int" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="GetTabbedTextExtent" BothCharset="True">
//            <Param Type="HDC" Name="hDC" />
//            <Param Type="LPCTSTR" Name="lpString" />
//            <Param Type="int" Name="nCount" />
//            <Param Type="int" Name="nTabPositions" />
//            <Param Type="const LPINT" Name="lpnTabStopPositions" />
//            <Return Type="DWORD" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="TabbedTextOut" BothCharset="True">
//            <Param Type="HDC" Name="hDC" />
//            <Param Type="int" Name="X" />
//            <Param Type="int" Name="Y" />
//            <Param Type="LPCTSTR" Name="lpString" />
//            <Param Type="int" Name="nCount" />
//            <Param Type="int" Name="nTabPositions" />
//            <Param Type="const LPINT" Name="lpnTabStopPositions" />
//            <Param Type="int" Name="nTabOrigin" />
//            <Return Type="LONG" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <!-- Hooks -->
//        <Category Name="Windows Application UI Development/Windows and Messages/Hooks" />
//        <Api Name="CallMsgFilter" BothCharset="True">
//            <Param Type="LPMSG" Name="lpMsg" />
//            <Param Type="int" Name="nCode" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="CallNextHookEx">
//            <Param Type="HHOOK" Name="hhk" />
//            <Param Type="int" Name="nCode" />
//            <Param Type="WPARAM" Name="wParam" />
//            <Param Type="LPARAM" Name="lParam" />
//            <Return Type="LRESULT" />
//        </Api>
//        <Api Name="SetWindowsHookEx" BothCharset="True">
//            <Param Type="[WindowsHook]" Name="idHook" />
//            <Param Type="HOOKPROC" Name="lpfn" />
//            <Param Type="HINSTANCE" Name="hMod" />
//            <Param Type="DWORD" Name="dwThreadId" />
//            <Return Type="HHOOK" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="UnhookWindowsHookEx">
//            <Param Type="HHOOK" Name="hhk" />
//            <Return Type="BOOL" />
//        </Api>
//        <!-- Icons -->
//        <Category Name="Windows Application UI Development/Menus and Other Resources/Icons" />
//        <Api Name="CopyIcon">
//            <Param Type="HICON" Name="hIcon" />
//            <Return Type="HICON" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="CreateIcon">
//            <Param Type="HINSTANCE" Name="hInstance" />
//            <Param Type="int" Name="nWidth" />
//            <Param Type="int" Name="nHeight" />
//            <Param Type="BYTE" Name="cPlanes" />
//            <Param Type="BYTE" Name="cBitsPixel" />
//            <Param Type="const BYTE*" Name="lpbANDbits" />
//            <Param Type="const BYTE*" Name="lpbXORbits" />
//            <Return Type="HICON" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="CreateIconFromResource">
//            <Param Type="PBYTE" Name="presbits" />
//            <Param Type="DWORD" Name="dwResSize" />
//            <Param Type="BOOL" Name="fIcon" />
//            <Param Type="DWORD" Name="dwVer" />
//            <Return Type="HICON" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="CreateIconFromResourceEx">
//            <Param Type="PBYTE" Name="pbIconBits" />
//            <Param Type="DWORD" Name="cbIconBits" />
//            <Param Type="BOOL" Name="fIcon" />
//            <Param Type="DWORD" Name="dwVersion" />
//            <Param Type="int" Name="cxDesired" />
//            <Param Type="int" Name="cyDesired" />
//            <Param Type="UINT" Name="uFlags" />
//            <Return Type="HICON" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="CreateIconIndirect">
//            <Param Type="PICONINFO" Name="piconinfo" />
//            <Return Type="HICON" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="DestroyIcon">
//            <Param Type="HICON" Name="hIcon" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="DrawIcon">
//            <Param Type="HDC" Name="hDC" />
//            <Param Type="int" Name="X" />
//            <Param Type="int" Name="Y" />
//            <Param Type="HICON" Name="hIcon" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="DrawIconEx">
//            <Param Type="HDC" Name="hdc" />
//            <Param Type="int" Name="xLeft" />
//            <Param Type="int" Name="yTop" />
//            <Param Type="HICON" Name="hIcon" />
//            <Param Type="int" Name="cxWidth" />
//            <Param Type="int" Name="cyWidth" />
//            <Param Type="UINT" Name="istepIfAniCur" />
//            <Param Type="HBRUSH" Name="hbrFlickerFreeDraw" />
//            <Param Type="[DrawIconFlags]" Name="diFlags" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="GetIconInfo">
//            <Param Type="HICON" Name="hIcon" />
//            <Param Type="PICONINFO" Name="piconinfo" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="GetIconInfoEx" BothCharset="True">
//            <Param Type="HICON" Name="hIcon" />
//            <Param Type="PICONINFOEX" Name="piconinfoex" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="LoadIcon" BothCharset="True">
//            <Param Type="HINSTANCE" Name="hInstance" />
//            <Param Type="[LoadIconString/LPCTSTR]" Name="lpIconName" />
//            <Return Type="HICON" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="LookupIconIdFromDirectory">
//            <Param Type="PBYTE" Name="presbits" />
//            <Param Type="BOOL" Name="fIcon" />
//            <Return Type="int" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="LookupIconIdFromDirectoryEx">
//            <Param Type="PBYTE" Name="presbits" />
//            <Param Type="BOOL" Name="fIcon" />
//            <Param Type="int" Name="cxDesired" />
//            <Param Type="int" Name="cyDesired" />
//            <Param Type="[LRFlags]" Name="Flags" />
//            <Return Type="int" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="PrivateExtractIcons" BothCharset="True">
//            <Param Type="LPCTSTR" Name="lpszFile" />
//            <Param Type="int" Name="nIconIndex" />
//            <Param Type="int" Name="cxIcon" />
//            <Param Type="int" Name="cyIcon" />
//            <Param Type="HICON*" Name="phicon" />
//            <Param Type="UINT*" Name="piconid" />
//            <Param Type="UINT" Name="nIcons" />
//            <Param Type="[LRFlags]" Name="flags" />
//            <Return Type="UINT" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <!-- Keyboard Accelerators -->
//        <Category Name="Windows Application UI Development/Menus and Other Resources/Keyboard Accelerators" />
//        <Api Name="CopyAcceleratorTable" BothCharset="True">
//            <Param Type="HACCEL" Name="hAccelSrc" />
//            <Param Type="LPACCEL" Name="lpAccelDst" />
//            <Param Type="int" Name="cAccelEntries" />
//            <Return Type="int" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="CreateAcceleratorTable" BothCharset="True">
//            <Param Type="LPACCEL" Name="lpaccl" />
//            <Param Type="int" Name="cEntries" />
//            <Return Type="HACCEL" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="DestroyAcceleratorTable">
//            <Param Type="HACCEL" Name="hAccel" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="LoadAccelerators" BothCharset="True">
//            <Param Type="HINSTANCE" Name="hInstance" />
//            <Param Type="LPCTSTR" Name="lpTableName" />
//            <Return Type="HACCEL" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="TranslateAccelerator" BothCharset="True">
//            <Param Type="HWND" Name="hWnd" />
//            <Param Type="HACCEL" Name="hAccTable" />
//            <Param Type="LPMSG" Name="lpMsg" />
//            <Return Type="int" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <!-- Keyboard Input -->
//        <Category Name="Windows Application UI Development/User Interaction/Keyboard and Mouse Input/Keyboard Input" />
//        <Api Name="ActivateKeyboardLayout">
//            <Param Type="[KeyboardLayoutHandle]" Name="hkl" />
//            <Param Type="[KeyboardLayoutFlags]" Name="Flags" />
//            <Return Type="HKL" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="BlockInput">
//            <Param Type="BOOL" Name="fBlockIt" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="EnableWindow">
//            <Param Type="HWND" Name="hWnd" />
//            <Param Type="BOOL" Name="bEnable" />
//            <Return Type="BOOL" />
//            <Success />
//        </Api>
//        <Api Name="GetActiveWindow">
//            <Return Type="HWND" />
//        </Api>
//        <Api Name="GetAsyncKeyState">
//            <Param Type="[VirtKeyCode]" Display="int" Name="vKey" />
//            <Return Type="SHORT" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="GetFocus">
//            <Return Type="HWND" />
//        </Api>
//        <Api Name="GetKBCodePage">
//            <Return Type="UINT" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="GetKeyboardLayout">
//            <Param Type="DWORD" Name="idThread" />
//            <Return Type="HKL" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="GetKeyboardLayoutList">
//            <Param Type="int" Name="nBuff" />
//            <Param Type="HKL*" Name="lpList" />
//            <Return Type="UINT" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="GetKeyboardLayoutName" BothCharset="True">
//            <Param Type="LPTSTR" Name="pwszKLID" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="GetKeyboardState">
//            <Param Type="PBYTE" Name="lpKeyState" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="GetKeyNameText" BothCharset="True">
//            <Param Type="LONG" Name="lParam" />
//            <Param Type="LPTSTR" Name="lpString" />
//            <Param Type="int" Name="nSize" />
//            <Return Type="int" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="GetKeyState">
//            <Param Type="[VirtKeyCode]" Display="int" Name="nVirtKey" />
//            <Return Type="SHORT" />
//        </Api>
//        <Api Name="GetLastInputInfo">
//            <Param Type="PLASTINPUTINFO" Name="plii" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="IsWindowEnabled">
//            <Param Type="HWND" Name="hWnd" />
//            <Return Type="BOOL" />
//            <Success />
//        </Api>
//        <Api Name="keybd_event">
//            <Param Type="BYTE" Name="bVk" />
//            <Param Type="BYTE" Name="bScan" />
//            <Param Type="DWORD" Name="dwFlags" />
//            <Param Type="ULONG_PTR" Name="dwExtraInfo" />
//            <Return Type="VOID" />
//        </Api>
//        <Api Name="LoadKeyboardLayout" BothCharset="True">
//            <Param Type="LPCTSTR" Name="pwszKLID" />
//            <Param Type="[KeyboardLayoutFlags]" Name="Flags" />
//            <Return Type="HKL" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="MapVirtualKey" BothCharset="True">
//            <Param Type="UINT" Name="uCode" />
//            <Param Type="[MapVirtualKeyType]" Name="uMapType" />
//            <Return Type="UINT" />
//        </Api>
//        <Api Name="MapVirtualKeyEx" BothCharset="True">
//            <Param Type="UINT" Name="uCode" />
//            <Param Type="[MapVirtualKeyType]" Name="uMapType" />
//            <Param Type="HKL" Name="dwhkl" />
//            <Return Type="UINT" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="OemKeyScan">
//            <Param Type="WORD" Name="wOemChar" />
//            <Return Type="DWORD" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="RegisterHotKey">
//            <Param Type="HWND" Name="hWnd" />
//            <Param Type="int" Name="id" />
//            <Param Type="UINT" Name="fsModifiers" />
//            <Param Type="UINT" Name="vk" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="SendInput">
//            <Param Type="UINT" Name="nInputs" />
//            <Param Type="LPINPUT" Name="pInputs" />
//            <Param Type="int" Name="cbSize" />
//            <Return Type="UINT" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="SetActiveWindow">
//            <Param Type="HWND" Name="hWnd" />
//            <Return Type="HWND" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="SetFocus">
//            <Param Type="HWND" Name="hWnd" />
//            <Return Type="HWND" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="SetKeyboardState">
//            <Param Type="LPBYTE" Name="lpKeyState" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="ToAscii">
//            <Param Type="UINT" Name="uVirtKey" />
//            <Param Type="UINT" Name="uScanCode" />
//            <Param Type="PBYTE" Name="lpKeyState" />
//            <Param Type="LPWORD" Name="lpChar" />
//            <Param Type="UINT" Name="uFlags" />
//            <Return Type="int" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="ToAsciiEx">
//            <Param Type="UINT" Name="uVirtKey" />
//            <Param Type="UINT" Name="uScanCode" />
//            <Param Type="PBYTE" Name="lpKeyState" />
//            <Param Type="LPWORD" Name="lpChar" />
//            <Param Type="UINT" Name="uFlags" />
//            <Param Type="HKL" Name="dwhkl" />
//            <Return Type="int" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="ToUnicode">
//            <Param Type="UINT" Name="wVirtKey" />
//            <Param Type="UINT" Name="wScanCode" />
//            <Param Type="const PBYTE" Name="lpKeyState" />
//            <Param Type="LPWSTR" Name="pwszBuff" />
//            <Param Type="int" Name="cchBuff" />
//            <Param Type="UINT" Name="wFlags" />
//            <Return Type="int" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="ToUnicodeEx">
//            <Param Type="UINT" Name="wVirtKey" />
//            <Param Type="UINT" Name="wScanCode" />
//            <Param Type="const PBYTE" Name="lpKeyState" />
//            <Param Type="LPWSTR" Name="pwszBuff" />
//            <Param Type="int" Name="cchBuff" />
//            <Param Type="UINT" Name="wFlags" />
//            <Param Type="HKL" Name="dwhkl" />
//            <Return Type="int" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="UnloadKeyboardLayout">
//            <Param Type="HKL" Name="hkl" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="UnregisterHotKey">
//            <Param Type="HWND" Name="hWnd" />
//            <Param Type="int" Name="id" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="VkKeyScan" BothCharset="True">
//            <Param Type="TCHAR" Name="ch" />
//            <Return Type="SHORT" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="VkKeyScanEx" BothCharset="True">
//            <Param Type="TCHAR" Name="ch" />
//            <Param Type="HKL" Name="dwhkl" />
//            <Return Type="SHORT" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <!-- List Box -->
//        <Category Name="Windows Application UI Development/Windows Controls/Control Library/List Box" />
//        <Api Name="DlgDirList" BothCharset="True">
//            <Param Type="HWND" Name="hDlg" />
//            <Param Type="LPTSTR" Name="lpPathSpec" />
//            <Param Type="int" Name="nIDListBox" />
//            <Param Type="int" Name="nIDStaticPath" />
//            <Param Type="UINT" Name="uFileType" />
//            <Return Type="int" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="DlgDirSelectEx" BothCharset="True">
//            <Param Type="HWND" Name="hDlg" />
//            <Param Type="LPTSTR" Name="lpString" />
//            <Param Type="int" Name="nCount" />
//            <Param Type="int" Name="nIDListBox" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="GetListBoxInfo">
//            <Param Type="HWND" Name="hwnd" />
//            <Return Type="DWORD" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <!-- Menus -->
//        <Category Name="Windows Application UI Development/Menus and Other Resources/Menus" />
//        <Api Name="AppendMenu" BothCharset="True">
//            <Param Type="HMENU" Name="hMenu" />
//            <Param Type="UINT" Name="uFlags" />
//            <Param Type="UINT_PTR" Name="uIDNewItem" />
//            <Param Type="LPCTSTR" Name="lpNewItem" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="CheckMenuItem">
//            <Param Type="HMENU" Name="hmenu" />
//            <Param Type="UINT" Name="uIDCheckItem" />
//            <Param Type="[CheckMenuItemFlag]" Name="uCheck" />
//            <Return Type="DWORD" />
//            <Success Return="NotEqual" Value="-1" />
//        </Api>
//        <Api Name="CheckMenuRadioItem">
//            <Param Type="HMENU" Name="hmenu" />
//            <Param Type="UINT" Name="idFirst" />
//            <Param Type="UINT" Name="idLast" />
//            <Param Type="UINT" Name="idCheck" />
//            <Param Type="[MenuCommandPosFlag]" Name="uFlags" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="CreateMenu">
//            <Return Type="HMENU" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="CreatePopupMenu">
//            <Return Type="HMENU" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="DeleteMenu">
//            <Param Type="HMENU" Name="hMenu" />
//            <Param Type="UINT" Name="uPosition" />
//            <Param Type="[MenuCommandPosFlag]" Name="uFlags" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="DestroyMenu">
//            <Param Type="HMENU" Name="hMenu" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="DrawMenuBar">
//            <Param Type="HWND" Name="hWnd" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="EnableMenuItem">
//            <Param Type="HMENU" Name="hMenu" />
//            <Param Type="UINT" Name="uIDEnableItem" />
//            <Param Type="[EnableMenuItemFlag]" Name="uEnable" />
//            <Return Type="[EnableMenuItemResult]" />
//            <Success Return="NotEqual" Value="-1" />
//        </Api>
//        <Api Name="EndMenu">
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="GetMenu">
//            <Param Type="HWND" Name="hWnd" />
//            <Return Type="HMENU" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="GetMenuBarInfo">
//            <Param Type="HWND" Name="hwnd" />
//            <Param Type="[ObjectIdEnum]" Name="idObject" />
//            <Param Type="LONG" Name="idItem" />
//            <Param Type="PMENUBARINFO" Name="pmbi" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="GetMenuCheckMarkDimensions">
//            <Return Type="LONG" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="GetMenuDefaultItem">
//            <Param Type="HMENU" Name="hMenu" />
//            <Param Type="UINT" Name="fByPos" />
//            <Param Type="[GetMenuDefaultItemFlags]" Name="gmdiFlags" />
//            <Return Type="UINT" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="GetMenuInfo">
//            <Param Type="HMENU" Name="hmenu" />
//            <Param Type="LPCMENUINFO" Name="lpcmi" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="GetMenuItemCount">
//            <Param Type="HMENU" Name="hMenu" />
//            <Return Type="int" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="GetMenuItemID">
//            <Param Type="HMENU" Name="hMenu" />
//            <Param Type="int" Name="nPos" />
//            <Return Type="UINT" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="GetMenuItemInfo" BothCharset="True">
//            <Param Type="HMENU" Name="hMenu" />
//            <Param Type="UINT" Name="uItem" />
//            <Param Type="BOOL" Name="fByPosition" />
//            <Param Type="LPMENUITEMINFO" Name="lpmii" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="GetMenuItemRect">
//            <Param Type="HWND" Name="hWnd" />
//            <Param Type="HMENU" Name="hMenu" />
//            <Param Type="UINT" Name="uItem" />
//            <Param Type="LPRECT" Name="lprcItem" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="GetMenuState">
//            <Param Type="HMENU" Name="hMenu" />
//            <Param Type="UINT" Name="uId" />
//            <Param Type="[MenuCommandPosFlag]" Name="uFlags" />
//            <Return Type="UINT" />
//            <Success Return="NotEqual" Value="-1" />
//        </Api>
//        <Api Name="GetMenuString" BothCharset="True">
//            <Param Type="HMENU" Name="hMenu" />
//            <Param Type="UINT" Name="uIDItem" />
//            <Param Type="LPTSTR" Name="lpString" OutputOnly="True" />
//            <Param Type="int" Name="nMaxCount" />
//            <Param Type="UINT" Name="uFlag" />
//            <Return Type="int" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="GetSubMenu">
//            <Param Type="HMENU" Name="hMenu" />
//            <Param Type="int" Name="nPos" />
//            <Return Type="HMENU" />
//        </Api>
//        <Api Name="GetSystemMenu">
//            <Param Type="HWND" Name="hWnd" />
//            <Param Type="BOOL" Name="bRevert" />
//            <Return Type="HMENU" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="HiliteMenuItem">
//            <Param Type="HWND" Name="hwnd" />
//            <Param Type="HMENU" Name="hmenu" />
//            <Param Type="UINT" Name="uItemHilite" />
//            <Param Type="UINT" Name="uHilite" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="InsertMenu" BothCharset="True">
//            <Param Type="HMENU" Name="hMenu" />
//            <Param Type="UINT" Name="uPosition" />
//            <Param Type="[InsertMenuFlags]" Name="uFlags" />
//            <Param Type="UINT_PTR" Name="uIDNewItem" />
//            <Param Type="LPCTSTR" Name="lpNewItem" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="InsertMenuItem" BothCharset="True">
//            <Param Type="HMENU" Name="hMenu" />
//            <Param Type="UINT" Name="uItem" />
//            <Param Type="BOOL" Name="fByPosition" />
//            <Param Type="LPCMENUITEMINFO" Name="lpmii" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="IsMenu">
//            <Param Type="HMENU" Name="hMenu" />
//            <Return Type="BOOL" />
//            <Success />
//        </Api>
//        <Api Name="LoadMenu" BothCharset="True">
//            <Param Type="HINSTANCE" Name="hInstance" />
//            <Param Type="LPCTSTR" Name="lpMenuName" />
//            <Return Type="HMENU" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="LoadMenuIndirect" BothCharset="True">
//            <Param Type="CONST MENUTEMPLATE*" Name="lpMenuTemplate" />
//            <Return Type="HMENU" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="MenuItemFromPoint">
//            <Param Type="HWND" Name="hWnd" />
//            <Param Type="HMENU" Name="hMenu" />
//            <Param Type="POINT" Name="ptScreen" />
//            <Return Type="int" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="ModifyMenu" BothCharset="True">
//            <Param Type="HMENU" Name="hMnu" />
//            <Param Type="UINT" Name="uPosition" />
//            <Param Type="UINT" Name="uFlags" />
//            <Param Type="UINT_PTR" Name="uIDNewItem" />
//            <Param Type="LPCTSTR" Name="lpNewItem" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="RemoveMenu">
//            <Param Type="HMENU" Name="hMenu" />
//            <Param Type="UINT" Name="uPosition" />
//            <Param Type="[MenuCommandPosFlag]" Name="uFlags" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="SetMenu">
//            <Param Type="HWND" Name="hWnd" />
//            <Param Type="HMENU" Name="hMenu" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="SetMenuDefaultItem">
//            <Param Type="HMENU" Name="hMenu" />
//            <Param Type="UINT" Name="uItem" />
//            <Param Type="UINT" Name="fByPos" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="SetMenuInfo">
//            <Param Type="HMENU" Name="hmenu" />
//            <Param Type="LPCMENUINFO" Name="lpcmi" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="SetMenuItemBitmaps">
//            <Param Type="HMENU" Name="hMenu" />
//            <Param Type="UINT" Name="uPosition" />
//            <Param Type="UINT" Name="uFlags" />
//            <Param Type="HBITMAP" Name="hBitmapUnchecked" />
//            <Param Type="HBITMAP" Name="hBitmapChecked" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="SetMenuItemInfo" BothCharset="True">
//            <Param Type="HMENU" Name="hMenu" />
//            <Param Type="UINT" Name="uItem" />
//            <Param Type="BOOL" Name="fByPosition" />
//            <Param Type="LPMENUITEMINFO" Name="lpmii" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="TrackPopupMenu">
//            <Param Type="HMENU" Name="hMenu" />
//            <Param Type="[TrackPopupMenuFlags]" Name="uFlags" />
//            <Param Type="int" Name="x" />
//            <Param Type="int" Name="y" />
//            <Param Type="int" Name="nReserved" />
//            <Param Type="HWND" Name="hWnd" />
//            <Param Type="CONST RECT*" Name="prcRect" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="TrackPopupMenuEx">
//            <Param Type="HMENU" Name="hmenu" />
//            <Param Type="[TrackPopupMenuFlags]" Name="fuFlags" />
//            <Param Type="int" Name="x" />
//            <Param Type="int" Name="y" />
//            <Param Type="HWND" Name="hwnd" />
//            <Param Type="LPTPMPARAMS" Name="lptpm" />
//            <Return Type="BOOL" />
//        </Api>
//        <!-- Mouse Input -->
//        <Category Name="Windows Application UI Development/User Interaction/Keyboard and Mouse Input/Mouse Input" />
//        <Api Name="DragDetect">
//            <Param Type="HWND" Name="hwnd" />
//            <Param Type="POINT" Name="pt" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="GetCapture">
//            <Return Type="HWND" />
//        </Api>
//        <Api Name="GetDoubleClickTime">
//            <Return Type="UINT" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="GetMouseMovePointsEx">
//            <Param Type="UINT" Name="cbSize" />
//            <Param Type="LPMOUSEMOVEPOINT" Name="lppt" />
//            <Param Type="LPMOUSEMOVEPOINT" Name="lpptBuf" />
//            <Param Type="int" Name="nBufPoints" />
//            <Param Type="DWORD" Name="resolution" />
//            <Return Type="int" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="mouse_event">
//            <Param Type="DWORD" Name="dwFlags" />
//            <Param Type="DWORD" Name="dx" />
//            <Param Type="DWORD" Name="dy" />
//            <Param Type="DWORD" Name="dwData" />
//            <Param Type="ULONG_PTR" Name="dwExtraInfo" />
//            <Return Type="VOID" />
//        </Api>
//        <Api Name="ReleaseCapture">
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="SetCapture">
//            <Param Type="HWND" Name="hWnd" />
//            <Return Type="HWND" />
//        </Api>
//        <Api Name="SetDoubleClickTime">
//            <Param Type="UINT" Name="uInterval" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="SwapMouseButton">
//            <Param Type="BOOL" Name="fSwap" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="TrackMouseEvent">
//            <Param Type="LPTRACKMOUSEEVENT" Name="lpEventTrack" />
//            <Return Type="BOOL" />
//        </Api>
//        <!-- Multiple Display Monitors -->
//        <Category Name="Graphics and Gaming/Legacy Graphics/Windows GDI/Multiple Display Monitors" />
//        <Api Name="EnumDisplayMonitors">
//            <Param Type="HDC" Name="hdc" />
//            <Param Type="LPCRECT" Name="lprcClip" />
//            <Param Type="MONITORENUMPROC" Name="lpfnEnum" />
//            <Param Type="LPARAM" Name="dwData" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="GetMonitorInfo" BothCharset="True">
//            <Param Type="HMONITOR" Name="hMonitor" />
//            <Param Type="LPMONITORINFO" Name="lpmi" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="MonitorFromPoint">
//            <Param Type="POINT" Name="pt" />
//            <Param Type="[MonitorFlags]" Name="dwFlags" />
//            <Return Type="HMONITOR" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="MonitorFromRect">
//            <Param Type="LPCRECT" Name="lprc" />
//            <Param Type="[MonitorFlags]" Name="dwFlags" />
//            <Return Type="HMONITOR" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="MonitorFromWindow">
//            <Param Type="HWND" Name="hwnd" />
//            <Param Type="[MonitorFlags]" Name="dwFlags" />
//            <Return Type="HMONITOR" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <!-- Multiple Document Interface -->
//        <Category Name="Windows Application UI Development/Windows and Messages/Multiple Document Interface" />
//        <Api Name="CreateMDIWindow" BothCharset="True">
//            <Param Type="LPCTSTR" Name="lpClassName" />
//            <Param Type="LPCTSTR" Name="lpWindowName" />
//            <Param Type="DWORD" Name="dwStyle" />
//            <Param Type="int" Name="X" />
//            <Param Type="int" Name="Y" />
//            <Param Type="int" Name="nWidth" />
//            <Param Type="int" Name="nHeight" />
//            <Param Type="HWND" Name="hWndParent" />
//            <Param Type="HINSTANCE" Name="hInstance" />
//            <Param Type="LPARAM" Name="lParam" />
//            <Return Type="HWND" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="DefFrameProc" BothCharset="True">
//            <Param Type="HWND" Name="hWnd" />
//            <Param Type="HWND" Name="hWndMDIClient" />
//            <Param Type="UINT" Name="uMsg" />
//            <Param Type="WPARAM" Name="wParam" />
//            <Param Type="LPARAM" Name="lParam" />
//            <Return Type="LRESULT" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="DefMDIChildProc" BothCharset="True">
//            <Param Type="HWND" Name="hWnd" />
//            <Param Type="UINT" Name="uMsg" />
//            <Param Type="WPARAM" Name="wParam" />
//            <Param Type="LPARAM" Name="lParam" />
//            <Return Type="LRESULT" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="TranslateMDISysAccel">
//            <Param Type="HWND" Name="hWndClient" />
//            <Param Type="LPMSG" Name="lpMsg" />
//            <Return Type="BOOL" />
//        </Api>
//        <!-- Painting and Drawing -->
//        <Category Name="Graphics and Gaming/Legacy Graphics/Windows GDI/Painting and Drawing" />
//        <Api Name="BeginPaint">
//            <Param Type="HWND" Name="hwnd" />
//            <Param Type="LPPAINTSTRUCT" Name="lpPaint" />
//            <Return Type="HDC" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="DrawAnimatedRects">
//            <Param Type="HWND" Name="hwnd" />
//            <Param Type="int" Name="idAni" />
//            <Param Type="const RECT*" Name="lprcFrom" />
//            <Param Type="const RECT*" Name="lprcTo" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="DrawCaption">
//            <Param Type="HWND" Name="hwnd" />
//            <Param Type="HDC" Name="hdc" />
//            <Param Type="LPCRECT" Name="lprc" />
//            <Param Type="UINT" Name="uFlags" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="DrawEdge">
//            <Param Type="HDC" Name="hdc" />
//            <Param Type="LPRECT" Name="qrc" />
//            <Param Type="[BorderEdge]" Name="edge" />
//            <Param Type="[BorderFlag]" Name="grfFlags" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="DrawFocusRect">
//            <Param Type="HDC" Name="hDC" />
//            <Param Type="const RECT*" Name="lprc" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="DrawFrameControl">
//            <Param Type="HDC" Name="hdc" />
//            <Param Type="LPRECT" Name="lprc" />
//            <Param Type="UINT" Name="uType" />
//            <Param Type="UINT" Name="uState" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="DrawState" BothCharset="True">
//            <Param Type="HDC" Name="hdc" />
//            <Param Type="HBRUSH" Name="hbr" />
//            <Param Type="DRAWSTATEPROC" Name="lpOutputFunc" />
//            <Param Type="LPARAM" Name="lData" />
//            <Param Type="WPARAM" Name="wData" />
//            <Param Type="int" Name="x" />
//            <Param Type="int" Name="y" />
//            <Param Type="int" Name="cx" />
//            <Param Type="int" Name="cy" />
//            <Param Type="[DrawStateFlags]" Name="fuFlags" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="EndPaint">
//            <Param Type="HWND" Name="hWnd" />
//            <Param Type="const PAINTSTRUCT*" Name="lpPaint" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="ExcludeUpdateRgn">
//            <Param Type="HDC" Name="hDC" />
//            <Param Type="HWND" Name="hWnd" />
//            <Return Type="[WindowRegion]" />
//        </Api>
//        <Api Name="GetUpdateRect">
//            <Param Type="HWND" Name="hWnd" />
//            <Param Type="LPRECT" Name="lpRect" />
//            <Param Type="BOOL" Name="bErase" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="GetUpdateRgn">
//            <Param Type="HWND" Name="hWnd" />
//            <Param Type="HRGN" Name="hRgn" />
//            <Param Type="BOOL" Name="bErase" />
//            <Return Type="[WindowRegion]" />
//        </Api>
//        <Api Name="GetWindowDC">
//            <Param Type="HWND" Name="hWnd" />
//            <Return Type="HDC" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="GetWindowRgn">
//            <Param Type="HWND" Name="hWnd" />
//            <Param Type="HRGN" Name="hRgn" />
//            <Return Type="[WindowRegion]" />
//        </Api>
//        <Api Name="GetWindowRgnBox">
//            <Param Type="HWND" Name="hWnd" />
//            <Param Type="LPRECT" Name="lprc" />
//            <Return Type="[WindowRegion]" />
//        </Api>
//        <Api Name="GrayString" BothCharset="True">
//            <Param Type="HDC" Name="hDC" />
//            <Param Type="HBRUSH" Name="hBrush" />
//            <Param Type="GRAYSTRINGPROC" Name="lpOutputFunc" />
//            <Param Type="LPARAM" Name="lpData" />
//            <Param Type="int" Name="nCount" />
//            <Param Type="int" Name="X" />
//            <Param Type="int" Name="Y" />
//            <Param Type="int" Name="nWidth" />
//            <Param Type="int" Name="nHeight" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="InvalidateRect">
//            <Param Type="HWND" Name="hWnd" />
//            <Param Type="const RECT*" Name="lpRect" />
//            <Param Type="BOOL" Name="bErase" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="InvalidateRgn">
//            <Param Type="HWND" Name="hWnd" />
//            <Param Type="HRGN" Name="hRgn" />
//            <Param Type="BOOL" Name="bErase" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="LockWindowUpdate">
//            <Param Type="HWND" Name="hWndLock" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="PaintDesktop">
//            <Param Type="HDC" Name="hdc" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="RedrawWindow">
//            <Param Type="HWND" Name="hWnd" />
//            <Param Type="const RECT*" Name="lprcUpdate" />
//            <Param Type="HRGN" Name="hrgnUpdate" />
//            <Param Type="[RedrawWindowFlags]" Name="flags" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="SetWindowRgn">
//            <Param Type="HWND" Name="hWnd" />
//            <Param Type="HRGN" Name="hRgn" />
//            <Param Type="BOOL" Name="bRedraw" />
//            <Return Type="int" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="UpdateWindow">
//            <Param Type="HWND" Name="hWnd" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="ValidateRect">
//            <Param Type="HWND" Name="hWnd" />
//            <Param Type="const RECT*" Name="lpRect" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="ValidateRgn">
//            <Param Type="HWND" Name="hWnd" />
//            <Param Type="HRGN" Name="hRgn" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="WindowFromDC">
//            <Param Type="HDC" Name="hDC" />
//            <Return Type="HWND" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <!-- Power Management -->
//        <Category Name="System Services/Power Management" />
//        <Api Name="RegisterPowerSettingNotification">
//            <Param Type="HANDLE" Name="hRecipient" />
//            <Param Type="LPCGUID" Name="PowerSettingGuid" />
//            <Param Type="[DeviceNotificationFlags]" Name="Flags" />
//            <Return Type="HPOWERNOTIFY" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="UnregisterPowerSettingNotification">
//            <Param Type="HPOWERNOTIFY" Name="Handle" />
//            <Return Type="BOOL" />
//        </Api>
//        <!-- Printing and Print Spooler -->
//        <Category Name="Documents and Printing/Printing/GDI Print" />
//        <Api Name="PrintWindow">
//            <Param Type="HWND" Name="hwnd" />
//            <Param Type="HDC" Name="hdcBlt" />
//            <Param Type="UINT" Name="nFlags" />
//            <Return Type="BOOL" />
//        </Api>
//        <!-- Raw Input -->
//        <Category Name="Windows Application UI Development/User Interaction/Keyboard and Mouse Input/Raw Input" />
//        <Api Name="DefRawInputProc">
//            <Param Type="PRAWINPUT*" Name="paRawInput" Count="nInput" />
//            <Param Type="INT" Name="nInput" />
//            <Param Type="UINT" Name="cbSizeHeader" />
//            <Return Type="LRESULT" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="GetRawInputBuffer">
//            <Param Type="PRAWINPUT" Name="pData" />
//            <Param Type="PUINT" Name="pcbSize" />
//            <Param Type="UINT" Name="cbSizeHeader" />
//            <Return Type="UINT" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="GetRawInputData">
//            <Param Type="HRAWINPUT" Name="hRawInput" />
//            <Param Type="UINT" Name="uiCommand" />
//            <Param Type="LPVOID" Name="pData" />
//            <Param Type="PUINT" Name="pcbSize" />
//            <Param Type="UINT" Name="cbSizeHeader" />
//            <Return Type="UINT" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="GetRawInputDeviceInfo" BothCharset="True">
//            <Param Type="HANDLE" Name="hDevice" />
//            <Param Type="UINT" Name="uiCommand" />
//            <Param Type="LPVOID" Name="pData" />
//            <Param Type="PUINT" Name="pcbSize" />
//            <Return Type="UINT" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="GetRawInputDeviceList">
//            <Param Type="PRAWINPUTDEVICELIST" Name="pRawInputDeviceList" />
//            <Param Type="PUINT" Name="puiNumDevices" />
//            <Param Type="UINT" Name="cbSize" />
//            <Return Type="UINT" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="GetRegisteredRawInputDevices">
//            <Param Type="PRAWINPUTDEVICE" Name="pRawInputDevices" />
//            <Param Type="PUINT" Name="puiNumDevices" />
//            <Param Type="UINT" Name="cbSize" />
//            <Return Type="UINT" />
//            <Success Return="NotEqual" Value="-1" />
//        </Api>
//        <Api Name="RegisterRawInputDevices">
//            <Param Type="PCRAWINPUTDEVICE" Name="pRawInputDevices" Count="uiNumDevices" />
//            <Param Type="UINT" Name="uiNumDevices" />
//            <Param Type="UINT" Name="cbSize" />
//            <Return Type="BOOL" />
//        </Api>
//        <!-- Rectangles -->
//        <Category Name="Graphics and Gaming/Legacy Graphics/Windows GDI/Rectangles" />
//        <Api Name="CopyRect" ErrorFunc="">
//            <Param Type="LPRECT" Name="lprcDst" />
//            <Param Type="const RECT*" Name="lprcSrc" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="EqualRect">
//            <Param Type="const RECT*" Name="lprc1" />
//            <Param Type="const RECT*" Name="lprc2" />
//            <Return Type="BOOL" />
//            <Success />
//        </Api>
//        <Api Name="InflateRect">
//            <Param Type="LPRECT" Name="lprc" />
//            <Param Type="int" Name="dx" />
//            <Param Type="int" Name="dy" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="IntersectRect">
//            <Param Type="LPRECT" Name="lprcDst" />
//            <Param Type="const RECT*" Name="lprcSrc1" />
//            <Param Type="const RECT*" Name="lprcSrc2" />
//            <Return Type="BOOL" />
//            <Success />
//        </Api>
//        <Api Name="IsRectEmpty">
//            <Param Type="const RECT*" Name="lprc" />
//            <Return Type="BOOL" />
//            <Success />
//        </Api>
//        <Api Name="OffsetRect">
//            <Param Type="LPRECT" Name="lprc" />
//            <Param Type="int" Name="dx" />
//            <Param Type="int" Name="dy" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="PtInRect">
//            <Param Type="const RECT*" Name="lprc" />
//            <Param Type="POINT" Name="pt" />
//            <Return Type="BOOL" />
//            <Success />
//        </Api>
//        <Api Name="SetRect">
//            <Param Type="LPRECT" Name="lprc" />
//            <Param Type="int" Name="xLeft" />
//            <Param Type="int" Name="yTop" />
//            <Param Type="int" Name="xRight" />
//            <Param Type="int" Name="yBottom" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="SetRectEmpty">
//            <Param Type="LPRECT" Name="lprc" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="SubtractRect">
//            <Param Type="LPRECT" Name="lprcDst" />
//            <Param Type="const RECT*" Name="lprcSrc1" />
//            <Param Type="const RECT*" Name="lprcSrc2" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="UnionRect">
//            <Param Type="LPRECT" Name="lprcDst" />
//            <Param Type="const RECT*" Name="lprcSrc1" />
//            <Param Type="const RECT*" Name="lprcSrc2" />
//            <Return Type="BOOL" />
//            <Success />
//        </Api>
//        <!-- Resources -->
//        <Category Name="Windows Application UI Development/Menus and Other Resources/Resources" />
//        <Api Name="CopyImage">
//            <Param Type="HANDLE" Name="hImage" />
//            <Param Type="[ImageType]" Name="uType" />
//            <Param Type="int" Name="cxDesired" />
//            <Param Type="int" Name="cyDesired" />
//            <Param Type="[LRFlags]" Name="fuFlags" />
//            <Return Type="HANDLE" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="LoadImage" BothCharset="True">
//            <Param Type="HINSTANCE" Name="hinst" />
//            <Param Type="[LoadImageString/LPCTSTR]" Name="lpszName" />
//            <Param Type="[ImageType]" Name="uType" />
//            <Param Type="int" Name="cxDesired" />
//            <Param Type="int" Name="cyDesired" />
//            <Param Type="[LRFlags]" Name="fuLoad" />
//            <Return Type="HANDLE" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <!-- Scroll Bar -->
//        <Category Name="Windows Application UI Development/Windows Controls/Control Library/Scroll Bars" />
//        <Api Name="EnableScrollBar">
//            <Param Type="HWND" Name="hWnd" />
//            <Param Type="UINT" Name="wSBflags" />
//            <Param Type="UINT" Name="wArrows" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="GetScrollBarInfo">
//            <Param Type="HWND" Name="hwnd" />
//            <Param Type="[ObjectIdEnum]" Name="idObject" />
//            <Param Type="PSCROLLBARINFO" Name="psbi" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="GetScrollInfo">
//            <Param Type="HWND" Name="hwnd" />
//            <Param Type="[SBType]" Name="fnBar" />
//            <Param Type="LPSCROLLINFO" Name="lpsi" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="GetScrollPos">
//            <Param Type="HWND" Name="hWnd" />
//            <Param Type="[SBType]" Name="nBar" />
//            <Return Type="int" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="GetScrollRange">
//            <Param Type="HWND" Name="hWnd" />
//            <Param Type="[SBType]" Name="nBar" />
//            <Param Type="LPINT" Name="lpMinPos" />
//            <Param Type="LPINT" Name="lpMaxPos" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="ScrollDC">
//            <Param Type="HDC" Name="hDC" />
//            <Param Type="int" Name="dx" />
//            <Param Type="int" Name="dy" />
//            <Param Type="const RECT*" Name="lprcScroll" />
//            <Param Type="const RECT*" Name="lprcClip" />
//            <Param Type="HRGN" Name="hrgnUpdate" />
//            <Param Type="LPRECT" Name="lprcUpdate" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="ScrollWindow">
//            <Param Type="HWND" Name="hWnd" />
//            <Param Type="int" Name="XAmount" />
//            <Param Type="int" Name="YAmount" />
//            <Param Type="const RECT*" Name="lpRect" />
//            <Param Type="const RECT*" Name="lpClipRect" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="ScrollWindowEx">
//            <Param Type="HWND" Name="hWnd" />
//            <Param Type="int" Name="dx" />
//            <Param Type="int" Name="dy" />
//            <Param Type="const RECT*" Name="prcScroll" />
//            <Param Type="const RECT*" Name="prcClip" />
//            <Param Type="HRGN" Name="hrgnUpdate" />
//            <Param Type="LPRECT" Name="prcUpdate" />
//            <Param Type="[ScrollWindowFlags]" Name="flags" />
//            <Return Type="int" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="SetScrollInfo">
//            <Param Type="HWND" Name="hwnd" />
//            <Param Type="[SBType]" Name="fnBar" />
//            <Param Type="LPCSCROLLINFO" Name="lpsi" />
//            <Param Type="BOOL" Name="fRedraw" />
//            <Return Type="int" />
//        </Api>
//        <Api Name="SetScrollPos">
//            <Param Type="HWND" Name="hWnd" />
//            <Param Type="[SBType]" Name="nBar" />
//            <Param Type="int" Name="nPos" />
//            <Param Type="BOOL" Name="bRedraw" />
//            <Return Type="int" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="SetScrollRange">
//            <Param Type="HWND" Name="hWnd" />
//            <Param Type="[SBType]" Name="nBar" />
//            <Param Type="int" Name="nMinPos" />
//            <Param Type="int" Name="nMaxPos" />
//            <Param Type="BOOL" Name="bRedraw" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="ShowScrollBar">
//            <Param Type="HWND" Name="hWnd" />
//            <Param Type="[SBType]" Name="wBar" />
//            <Param Type="BOOL" Name="bShow" />
//            <Return Type="BOOL" />
//        </Api>
//        <!-- Strings -->
//        <Category Name="Windows Application UI Development/Menus and Other Resources/Strings" />
//        <Api Name="CharLower" BothCharset="True">
//            <Param Type="LPTSTR" Name="lpsz" />
//            <Return Type="LPTSTR" />
//        </Api>
//        <Api Name="CharLowerBuff" BothCharset="True">
//            <Param Type="LPTSTR" Name="lpsz" />
//            <Param Type="DWORD" Name="cchLength" />
//            <Return Type="DWORD" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="CharNext" BothCharset="True">
//            <Param Type="LPCTSTR" Name="lpsz" />
//            <Return Type="LPTSTR" />
//        </Api>
//        <Api Name="CharNextExA">
//            <Param Type="[CodePageEnum]" Display="WORD" Name="CodePage" />
//            <Param Type="LPCSTR" Name="lpCurrentChar" />
//            <Param Type="DWORD" Name="dwFlags" />
//            <Return Type="LPSTR" />
//        </Api>
//        <Api Name="CharPrev" BothCharset="True">
//            <Param Type="LPCTSTR" Name="lpszStart" />
//            <Param Type="LPCTSTR" Name="lpszCurrent" />
//            <Return Type="LPTSTR" />
//        </Api>
//        <Api Name="CharPrevExA">
//            <Param Type="[CodePageEnum]" Display="WORD" Name="CodePage" />
//            <Param Type="LPCSTR" Name="lpStart" />
//            <Param Type="LPCSTR" Name="lpCurrentChar" />
//            <Param Type="DWORD" Name="dwFlags" />
//            <Return Type="LPSTR" />
//        </Api>
//        <Api Name="CharToOem" BothCharset="True">
//            <Param Type="LPCTSTR" Name="lpszSrc" />
//            <Param Type="LPSTR" Name="lpszDst" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="CharToOemBuff" BothCharset="True">
//            <Param Type="LPCTSTR" Name="lpszSrc" />
//            <Param Type="LPSTR" Name="lpszDst" />
//            <Param Type="DWORD" Name="cchDstLength" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="CharUpper" BothCharset="True">
//            <Param Type="LPTSTR" Name="lpsz" />
//            <Return Type="LPTSTR" />
//        </Api>
//        <Api Name="CharUpperBuff" BothCharset="True">
//            <Param Type="LPTSTR" Name="lpsz" />
//            <Param Type="DWORD" Name="cchLength" />
//            <Return Type="DWORD" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="IsCharAlpha" BothCharset="True">
//            <Param Type="TCHAR" Name="ch" />
//            <Return Type="BOOL" />
//            <Success />
//        </Api>
//        <Api Name="IsCharAlphaNumeric" BothCharset="True">
//            <Param Type="TCHAR" Name="ch" />
//            <Return Type="BOOL" />
//            <Success />
//        </Api>
//        <Api Name="IsCharLower" BothCharset="True">
//            <Param Type="TCHAR" Name="ch" />
//            <Return Type="BOOL" />
//            <Success />
//        </Api>
//        <Api Name="IsCharUpper" BothCharset="True">
//            <Param Type="TCHAR" Name="ch" />
//            <Return Type="BOOL" />
//            <Success />
//        </Api>
//        <Api Name="LoadString" BothCharset="True">
//            <Param Type="HINSTANCE" Name="hInstance" />
//            <Param Type="UINT" Name="uID" />
//            <Param Type="LPTSTR" Name="lpBuffer" OutputOnly="True" />
//            <Param Type="int" Name="nBufferMax" />
//            <Return Type="int" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="OemToChar" BothCharset="True">
//            <Param Type="LPCSTR" Name="lpszSrc" />
//            <Param Type="LPTSTR" Name="lpszDst" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="OemToCharBuff" BothCharset="True">
//            <Param Type="LPCTSTR" Name="lpszSrc" />
//            <Param Type="LPTSTR" Name="lpszDst" />
//            <Param Type="DWORD" Name="cchDstLength" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="wsprintf" BothCharset="True" VarArgs="True">
//            <Param Type="LPTSTR" Name="lpOut" OutputOnly="True" />
//            <Param Type="LPCTSTR" Name="lpFmt" />
//            <Return Type="int" />
//        </Api>
//        <Api Name="wvsprintf" BothCharset="True">
//            <Param Type="LPTSTR" Name="lpOutput" />
//            <Param Type="LPCTSTR" Name="lpFmt" />
//            <Param Type="va_list" Name="arglist" />
//            <Return Type="int" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//
//        <!-- Synchronization/Wait -->
//        <Category Name="System Services/Synchronization/Wait" />
//        <Api Name="MsgWaitForMultipleObjects">
//            <Param Type="DWORD" Name="nCount" />
//            <Param Type="const HANDLE*" Name="pHandles" Count="nCount" />
//            <Param Type="BOOL" Name="bWaitAll" />
//            <Param Type="[WaitTimeout]" Name="dwMilliseconds" />
//            <Param Type="[QueueStatusFlag]" Name="dwWakeMask" />
//            <Return Type="[WAIT_RESULT]" />
//        </Api>
//        <Api Name="MsgWaitForMultipleObjectsEx">
//            <Param Type="DWORD" Name="nCount" />
//            <Param Type="const HANDLE*" Name="pHandles" Count="nCount" />
//            <Param Type="[WaitTimeout]" Name="dwMilliseconds" />
//            <Param Type="[QueueStatusFlag]" Name="dwWakeMask" />
//            <Param Type="[MsgWaitForMultipleObjectsFlags]" Name="dwFlags" />
//            <Return Type="[WAIT_RESULT]" />
//        </Api>
//
//        <!-- System Information -->
//        <Api Name="GetKeyboardType">
//            <Param Type="int" Name="nTypeFlag" />
//            <Return Type="int" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Category Name="System Services/Windows System Information/System Information" />
//        <Api Name="GetSysColor">
//            <Param Type="[SysColorIndex]" Name="nIndex" />
//            <Return Type="DWORD" />
//        </Api>
//        <Api Name="GetSystemMetrics" ErrorFunc="">
//            <Param Type="[SystemMetricIndex]" Name="nIndex" />
//            <Return Type="int" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="SetSysColors">
//            <Param Type="int" Name="cElements" />
//            <Param Type="const INT*" Name="lpaElements" />
//            <Param Type="const COLORREF*" Name="lpaRgbValues" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="SystemParametersInfo" BothCharset="True">
//            <Param Type="[SystemParametersInfoEnum]" Name="uiAction" />
//            <Param Type="UINT" Name="uiParam" />
//            <Param Type="PVOID" Name="pvParam" />
//            <Param Type="[SystemParametersInfoFlags]" Name="fWinIni" />
//            <Return Type="BOOL" />
//        </Api>
//
//        <!-- Timers -->
//        <Category Name="Windows Application UI Development/Windows and Messages/Timers" />
//        <Api Name="KillTimer">
//            <Param Type="HWND" Name="hWnd" />
//            <Param Type="UINT_PTR" Name="uIDEvent" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="SetCoalescableTimer">
//            <Param Type="HWND" Name="hwnd" />
//            <Param Type="UINT_PTR" Name="nIDEvent" />
//            <Param Type="UINT" Name="uElapse" />
//            <Param Type="TIMERPROC" Name="lpTimerFunc" />
//            <Param Type="[TIMERV_COALESCING]" Name="uToleranceDelay" />
//            <Return Type="UINT_PTR" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="SetTimer">
//            <Param Type="HWND" Name="hWnd" />
//            <Param Type="UINT_PTR" Name="nIDEvent" />
//            <Param Type="UINT" Name="uElapse" />
//            <Param Type="TIMERPROC" Name="lpTimerFunc" />
//            <Return Type="UINT_PTR" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//
//        <!-- Window Classes -->
//        <Category Name="Windows Application UI Development/Windows and Messages/Window Classes" />
//        <Api Name="GetClassInfo" BothCharset="True">
//            <Param Type="HINSTANCE" Name="hInstance" />
//            <Param Type="LPCTSTR" Name="lpClassName" />
//            <Param Type="LPWNDCLASS" Name="lpWndClass" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="GetClassInfoEx" BothCharset="True">
//            <Param Type="HINSTANCE" Name="hinst" />
//            <Param Type="LPCTSTR" Name="lpszClass" />
//            <Param Type="LPWNDCLASSEX" Name="lpwcx" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="GetClassLong" BothCharset="True">
//            <Param Type="HWND" Name="hWnd" />
//            <Param Type="[ClassLongIndex]" Name="nIndex" />
//            <Return Type="DWORD" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="GetClassName" BothCharset="True">
//            <Param Type="HWND" Name="hWnd" />
//            <Param Type="LPTSTR" Name="lpClassName" OutputOnly="True" />
//            <Param Type="int" Name="nMaxCount" />
//            <Return Type="int" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="GetClassWord">
//            <Param Type="HWND" Name="hWnd" />
//            <Param Type="[ClassLongIndex]" Name="nIndex" />
//            <Return Type="WORD" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="GetWindowLong" BothCharset="True">
//            <Param Type="HWND" Name="hWnd" />
//            <Param Type="[WindowLongIndex]" Name="nIndex" />
//            <Return Type="LONG" />
//        </Api>
//        <Api Name="RegisterClass" BothCharset="True">
//            <Param Type="CONST WNDCLASS*" Name="lpWndClass" />
//            <Return Type="ATOM" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="RegisterClassEx" BothCharset="True">
//            <Param Type="CONST WNDCLASSEX*" Name="lpwcx" />
//            <Return Type="ATOM" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="SetClassLong" BothCharset="True">
//            <Param Type="HWND" Name="hWnd" />
//            <Param Type="[ClassLongIndex]" Name="nIndex" />
//            <Param Type="LONG" Name="dwNewLong" />
//            <Return Type="DWORD" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="SetClassWord">
//            <Param Type="HWND" Name="hWnd" />
//            <Param Type="[ClassLongIndex]" Name="nIndex" />
//            <Param Type="WORD" Name="wNewWord" />
//            <Return Type="WORD" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="SetWindowLong" BothCharset="True">
//            <Param Type="HWND" Name="hWnd" />
//            <Param Type="[WindowLongIndex]" Name="nIndex" />
//            <Param Type="LONG" Name="dwNewLong" />
//            <Return Type="LONG" />
//        </Api>
//        <Api Name="UnregisterClass" BothCharset="True">
//            <Param Type="LPCTSTR" Name="lpClassName" />
//            <Param Type="HINSTANCE" Name="hInstance" />
//            <Return Type="BOOL" />
//        </Api>
//        <!-- Window Procedures -->
//        <Category Name="Windows Application UI Development/Windows and Messages/Window Procedures" />
//        <Api Name="CallWindowProc" BothCharset="True">
//            <Param Type="WNDPROC" Name="lpPrevWndFunc" />
//            <Param Type="HWND" Name="hWnd" />
//            <Param Type="[WinMsg]" Name="Msg" />
//            <Param Type="WPARAM" Name="wParam" />
//            <Param Type="LPARAM" Name="lParam" />
//            <Return Type="LRESULT" />
//        </Api>
//        <Api Name="DefWindowProc" BothCharset="True">
//            <Param Type="HWND" Name="hWnd" />
//            <Param Type="[WinMsg]" Name="Msg" />
//            <Param Type="WPARAM" Name="wParam" />
//            <Param Type="LPARAM" Name="lParam" />
//            <Return Type="LRESULT" />
//        </Api>
//        <!-- Window Properties -->
//        <Category Name="Windows Application UI Development/Windows and Messages/Window Properties" />
//        <Api Name="EnumProps" BothCharset="True">
//            <Param Type="HWND" Name="hWnd" />
//            <Param Type="PROPENUMPROC" Name="lpEnumFunc" />
//            <Return Type="int" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="EnumPropsEx" BothCharset="True">
//            <Param Type="HWND" Name="hWnd" />
//            <Param Type="PROPENUMPROCEX" Name="lpEnumFunc" />
//            <Param Type="LPARAM" Name="lParam" />
//            <Return Type="int" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="GetProp" BothCharset="True">
//            <Param Type="HWND" Name="hWnd" />
//            <Param Type="LPCTSTR" Name="lpString" />
//            <Return Type="HANDLE" />
//        </Api>
//        <Api Name="RemoveProp" BothCharset="True">
//            <Param Type="HWND" Name="hWnd" />
//            <Param Type="LPCTSTR" Name="lpString" />
//            <Return Type="HANDLE" />
//        </Api>
//        <Api Name="SetProp" BothCharset="True">
//            <Param Type="HWND" Name="hWnd" />
//            <Param Type="LPCTSTR" Name="lpString" />
//            <Param Type="HANDLE" Name="hData" />
//            <Return Type="BOOL" />
//        </Api>
//        <!-- Window Stations and Desktops -->
//        <Category Name="Windows Environment Development/Window Stations and Desktops" />
//        <Api Name="CloseWindowStation">
//            <Param Type="HWINSTA" Name="hWinSta" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="CreateWindowStation" BothCharset="True">
//            <Param Type="LPCTSTR" Name="lpwinsta" />
//            <Param Type="[CreateWindowStationFlags]" Name="dwFlags" />
//            <Param Type="[WindowStationAccessRights]" Name="dwDesiredAccess" />
//            <Param Type="LPSECURITY_ATTRIBUTES" Name="lpsa" />
//            <Return Type="HWINSTA" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="EnumWindowStations" BothCharset="True">
//            <Param Type="WINSTAENUMPROC" Name="lpEnumFunc" />
//            <Param Type="LPARAM" Name="lParam" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="GetProcessWindowStation">
//            <Return Type="HWINSTA" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="GetUserObjectInformation" BothCharset="True">
//            <Param Type="HANDLE" Name="hObj" />
//            <Param Type="[UserObjectInformationEnum]" Name="nIndex" />
//            <Param Type="PVOID" Name="pvInfo" PostLength="lpnLengthNeeded" />
//            <!-- TODO: PostLength="nLength" - Note that if we use nLength,
//            too much data is captured. However, some applications do not use
//            lpnLengthNeeded, in which case data is not displayed.
//            We will leave it up to the end user to enable this. -->
//            <Param Type="DWORD" Name="nLength" />
//            <Param Type="LPDWORD" Name="lpnLengthNeeded" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="OpenWindowStation" BothCharset="True">
//            <Param Type="LPTSTR" Name="lpszWinSta" />
//            <Param Type="BOOL" Name="fInherit" />
//            <Param Type="[WindowStationAccessRights]" Name="dwDesiredAccess" />
//            <Return Type="HWINSTA" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="SetProcessWindowStation">
//            <Param Type="HWINSTA" Name="hWinSta" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="CloseDesktop">
//            <Param Type="HDESK" Name="hDesktop" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="CreateDesktop" BothCharset="True">
//            <Param Type="LPCTSTR" Name="lpszDesktop" />
//            <Param Type="LPCTSTR" Name="lpszDevice" />
//            <Param Type="LPDEVMODE" Name="pDevmode" />
//            <Param Type="[DesktopFlags]" Name="dwFlags" />
//            <Param Type="[DESKTOP_ACCESS_MASK]" Name="dwDesiredAccess" />
//            <Param Type="LPSECURITY_ATTRIBUTES" Name="lpsa" />
//            <Return Type="HDESK" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="CreateDesktopEx" BothCharset="True">
//            <Param Type="LPCTSTR" Name="lpszDesktop" />
//            <Param Type="LPCTSTR" Name="lpszDevice" />
//            <Param Type="LPDEVMODE" Name="pDevmode" />
//            <Param Type="[DesktopFlags]" Name="dwFlags" />
//            <Param Type="[DESKTOP_ACCESS_MASK]" Name="dwDesiredAccess" />
//            <Param Type="LPSECURITY_ATTRIBUTES" Name="lpsa" />
//            <Param Type="ULONG" Name="ulHeapSize" />
//            <Param Type="PVOID" Name="pvoid" />
//            <Return Type="HDESK" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="EnumDesktops" BothCharset="True">
//            <Param Type="HWINSTA" Name="hwinsta" />
//            <Param Type="DESKTOPENUMPROC" Name="lpEnumFunc" />
//            <Param Type="LPARAM" Name="lParam" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="EnumDesktopWindows">
//            <Param Type="HDESK" Name="hDesktop" />
//            <Param Type="WNDENUMPROC" Name="lpfn" />
//            <Param Type="LPARAM" Name="lParam" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="GetThreadDesktop">
//            <Param Type="DWORD" Name="dwThreadId" />
//            <Return Type="HDESK" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="OpenDesktop" BothCharset="True">
//            <Param Type="LPTSTR" Name="lpszDesktop" />
//            <Param Type="[DesktopFlags]" Name="dwFlags" />
//            <Param Type="BOOL" Name="fInherit" />
//            <Param Type="[DESKTOP_ACCESS_MASK]" Name="dwDesiredAccess" />
//            <Return Type="HDESK" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="OpenInputDesktop">
//            <Param Type="[DesktopFlags]" Name="dwFlags" />
//            <Param Type="BOOL" Name="fInherit" />
//            <Param Type="[DESKTOP_ACCESS_MASK]" Name="dwDesiredAccess" />
//            <Return Type="HDESK" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="SetThreadDesktop">
//            <Param Type="HDESK" Name="hDesktop" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="SetUserObjectInformation" BothCharset="True">
//            <Param Type="HANDLE" Name="hObj" />
//            <Param Type="[UserObjectInformationEnum]" Name="nIndex" />
//            <Param Type="PVOID" Name="pvInfo" />
//            <Param Type="DWORD" Name="nLength" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="SwitchDesktop">
//            <Param Type="HDESK" Name="hDesktop" />
//            <Return Type="BOOL" />
//        </Api>
//        <!-- Shell -->
//        <Category Name="Windows Environment Development/Windows Shell" />
//        <Api Name="GetMenuContextHelpId">
//            <Param Type="HMENU" Name="hmenu" />
//            <Return Type="DWORD" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="GetWindowContextHelpId">
//            <Param Type="HWND" Name="hwnd" />
//            <Return Type="DWORD" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="SetMenuContextHelpId">
//            <Param Type="HMENU" Name="hmenu" />
//            <Param Type="DWORD" Name="dwContextHelpId" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="SetWindowContextHelpId">
//            <Param Type="HWND" Name="hwnd" />
//            <Param Type="DWORD" Name="dwContextHelpId" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="WinHelp" BothCharset="True">
//            <Param Type="HWND" Name="hWndMain" />
//            <Param Type="LPCTSTR" Name="lpszHelp" />
//            <Param Type="UINT" Name="uCommand" />
//            <Param Type="ULONG_PTR" Name="dwData" />
//            <Return Type="BOOL" />
//        </Api>
//        <!-- Authorization -->
//        <Category Name="Security and Identity/Authorization/Low-level Access Control" />
//        <Api Name="GetUserObjectSecurity">
//            <Param Type="HANDLE" Name="hObj" />
//            <Param Type="PSECURITY_INFORMATION" Name="pSIRequested" />
//            <Param Type="PSECURITY_DESCRIPTOR" Name="pSD" />
//            <Param Type="DWORD" Name="nLength" />
//            <Param Type="LPDWORD" Name="lpnLengthNeeded" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="SetUserObjectSecurity">
//            <Param Type="HANDLE" Name="hObj" />
//            <Param Type="PSECURITY_INFORMATION" Name="pSIRequested" />
//            <Param Type="PSECURITY_DESCRIPTOR" Name="pSID" />
//            <Return Type="BOOL" />
//        </Api>
//        <!-- Active Accessibility User Interface -->
//        <Category Name="Windows Application UI Development/Accessibility/Windows Automation/Microsoft Active Accessibility/Active Accessibility User Interface Services/Client" />
//        <Api Name="SetWinEventHook">
//            <Param Type="UINT" Name="eventMin" />
//            <Param Type="UINT" Name="eventMax" />
//            <Param Type="HMODULE" Name="hmodWinEventProc" />
//            <Param Type="WINEVENTPROC" Name="lpfnWinEventProc" />
//            <Param Type="DWORD" Name="idProcess" />
//            <Param Type="DWORD" Name="idThread" />
//            <Param Type="[WinEventFlags]" Name="dwflags" />
//            <Return Type="HWINEVENTHOOK" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="UnhookWinEvent">
//            <Param Type="HWINEVENTHOOK" Name="hWinEventHook" />
//            <Return Type="BOOL" />
//        </Api>
//        <Category Name="Windows Application UI Development/Accessibility/Windows Automation/Microsoft Active Accessibility/Active Accessibility User Interface Services/Server" />
//        <Api Name="IsWinEventHookInstalled">
//            <Param Type="DWORD" Name="event" />
//            <Return Type="BOOL" />
//            <Success />
//        </Api>
//        <Api Name="NotifyWinEvent">
//            <Param Type="DWORD" Name="event" />
//            <Param Type="HWND" Name="hwnd" />
//            <Param Type="[ObjectIdEnum]" Name="idObject" />
//            <Param Type="LONG" Name="idChild" />
//            <Return Type="void" />
//        </Api>
//        <!-- Windows Touch Input -->
//        <Category Name="Windows Application UI Development/User Interaction/Windows Touch/Windows Touch Input" />
//        <Api Name="CloseTouchInputHandle">
//            <Param Type="HTOUCHINPUT" Name="hTouchInput" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="GetTouchInputInfo">
//            <Param Type="HTOUCHINPUT" Name="hTouchInput" />
//            <Param Type="UINT" Name="cInputs" />
//            <Param Type="PTOUCHINPUT" Name="pInputs" />
//            <Param Type="int" Name="cbSize" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="IsTouchWindow">
//            <Param Type="HWND" Name="hWnd" />
//            <Param Type="PULONG" Name="pulFlags" />
//            <Return Type="BOOL" />
//            <Success />
//        </Api>
//        <Api Name="RegisterTouchWindow">
//            <Param Type="HWND" Name="hWnd" />
//            <Param Type="ULONG" Name="ulFlags" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="UnregisterTouchWindow">
//            <Param Type="HWND" Name="hWnd" />
//            <Return Type="BOOL" />
//        </Api>
//        <!-- Windows Touch Gestures -->
//        <Category Name="Windows Application UI Development/User Interaction/Windows Touch/Windows Touch Gestures" />
//        <Api Name="CloseGestureInfoHandle">
//            <Param Type="HGESTUREINFO" Name="hGestureInfo" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="GetGestureExtraArgs">
//            <Param Type="HGESTUREINFO" Name="hGestureInfo" />
//            <Param Type="UINT" Name="cbExtraArgs" />
//            <Param Type="PBYTE" Name="pExtraArgs" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="GetGestureInfo">
//            <Param Type="HGESTUREINFO" Name="hGestureInfo" />
//            <Param Type="PGESTUREINFO" Name="pGestureInfo" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="GetGestureConfig">
//            <Param Type="HWND" Name="hwnd" />
//            <Param Type="DWORD" Name="dwReserved" />
//            <Param Type="DWORD" Name="dwFlags" />
//            <Param Type="PUINT" Name="pcIDs" />
//            <Param Type="PGESTURECONFIG" Name="pGestureConfig" />
//            <Param Type="UINT" Name="cbSize" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="SetGestureConfig">
//            <Param Type="HWND" Name="hwnd" />
//            <Param Type="DWORD" Name="dwReserved" />
//            <Param Type="UINT" Name="cIDs" />
//            <Param Type="PGESTURECONFIG" Name="pGestureConfig" />
//            <Param Type="UINT" Name="cbSize" />
//            <Return Type="BOOL" />
//        </Api>
//
//        <!-- Undocumented (UnDoc'd) -->
//        <Category Name="Undocumented (UnDoc'd)" OnlineHelp="UnDoc'd-user32" />
//        <Api Name="DesktopHasWatermarkText" Ordinal="2000">
//            <Return Type="BOOL" />
//            <Success />
//        </Api>
//        <Api Name="FrostCrashedWindow">
//            <Param Type="HWND" Name="hwndToReplace" />
//            <Param Type="HWND" Name="hwndErrorReportOwnerWnd" />
//            <Return Type="HWND" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="GetSendMessageReceiver">
//            <Param Type="DWORD" Name="threadId" />
//            <Return Type="HWND" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="GetWindowCompositionAttribute">
//            <Param Type="HWND" Name="hwnd" />
//            <Param Type="WINCOMPATTRDATA*" Name="pAttrData" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="GetWindowMinimizeRect">
//            <Param Type="HWND" Name="hwndToQuery" />
//            <Param Type="RECT*" Name="pRect" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="GhostWindowFromHungWindow">
//            <Param Type="HWND" Name="hwndGhost" />
//            <Return Type="HWND" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="HungWindowFromGhostWindow">
//            <Param Type="HWND" Name="hwndGhost" />
//            <Return Type="HWND" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="IsSETEnabled">
//            <Return Type="BOOL" />
//            <Success />
//        </Api>
//        <Api Name="IsServerSideWindow">
//            <Param Type="HWND" Name="hwnd" />
//            <Return Type="BOOL" />
//            <Success />
//        </Api>
//        <Api Name="IsThreadDesktopComposited">
//            <Return Type="BOOL" />
//            <Success />
//        </Api>
//        <Api Name="IsWindowInDestroy">
//            <Param Type="HWND" Name="hwnd" />
//            <Return Type="BOOL" />
//            <Success />
//        </Api>
//        <Api Name="MB_GetString">
//            <Param Type="int" Name="strId" />
//            <Return Type="LPCWSTR" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="NtUserSetChildWindowNoActivate" Ordinal="2005">
//            <Param Type="HWND" Name="hwndChild" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="QuerySendMessage">
//            <Param Type="MSG*" Name="pMsg" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="SetWindowCompositionAttribute">
//            <Param Type="HWND" Name="hwnd" />
//            <Param Type="WINCOMPATTRDATA*" Name="pAttrData" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="UpdateWindowTransform">
//            <Param Type="HWND" Name="hwnd" />
//            <Param Type="D3DMATRIX*" Name="pMatrix" />
//            <Param Type="DWORD" Name="unk" />
//            <Return Type="BOOL" />
//        </Api>
//
//        <!-- Touch Injection -->
//        <Category Name="Windows Application UI Development/User Interaction/Touch Injection" />
//        <Api Name="InitializeTouchInjection">
//            <Param Type="UINT32" Name="maxCount" />
//            <Param Type="[TOUCH_FEEDBACK_MODE]" Name="dwMode" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="InjectTouchInput">
//            <Param Type="UINT32" Name="count" />
//            <Param Type="const POINTER_TOUCH_INFO*" Name="contacts" />
//            <Return Type="BOOL" />
//        </Api>
//
//        <!-- Interaction Context -->
//        <Category Name="Windows Application UI Development/User Interaction/Interaction Context" />
//        <Api Name="AddPointerInteractionContext">
//            <Param Type="HINTERACTIONCONTEXT" Name="interactionContext" />
//            <Param Type="UINT32" Name="pointerId" />
//            <Return Type="HRESULT" />
//        </Api>
//        <Api Name="BufferPointerPacketsInteractionContext">
//            <Param Type="HINTERACTIONCONTEXT" Name="interactionContext" />
//            <Param Type="UINT32" Name="entriesCount" />
//            <Param Type="const POINTER_INFO*" Name="pointerInfo" />
//            <Return Type="HRESULT" />
//        </Api>
//        <Api Name="CreateInteractionContext">
//            <Param Type="HINTERACTIONCONTEXT*" Name="interactionContext" />
//            <Return Type="HRESULT" />
//        </Api>
//        <Api Name="DestroyInteractionContext">
//            <Param Type="HINTERACTIONCONTEXT" Name="interactionContext" />
//            <Return Type="HRESULT" />
//        </Api>
//        <Api Name="GetCrossSlideParameterInteractionContext">
//            <Param Type="HINTERACTIONCONTEXT" Name="interactionContext" />
//            <Param Type="CROSS_SLIDE_THRESHOLD" Name="threshold" />
//            <Param Type="float*" Name="distance" />
//            <Return Type="HRESULT" />
//        </Api>
//        <Api Name="GetInertiaParameterInteractionContext">
//            <Param Type="HINTERACTIONCONTEXT" Name="interactionContext" />
//            <Param Type="INERTIA_PARAMETER" Name="inertiaParameter" />
//            <Param Type="float*" Name="value" />
//            <Return Type="HRESULT" />
//        </Api>
//        <Api Name="GetInteractionConfigurationInteractionContext">
//            <Param Type="HINTERACTIONCONTEXT" Name="interactionContext" />
//            <Param Type="UINT32" Name="configurationCount" />
//            <Param Type="INTERACTION_CONTEXT_CONFIGURATION*" Name="configuration" />
//            <Return Type="HRESULT" />
//        </Api>
//        <Api Name="GetMouseWheelParameterInteractionContext">
//            <Param Type="HINTERACTIONCONTEXT" Name="interactionContext" />
//            <Param Type="MOUSE_WHEEL_PARAMETER" Name="parameter" />
//            <Param Type="float*" Name="value" />
//            <Return Type="HRESULT" />
//        </Api>
//        <Api Name="GetPropertyInteractionContext">
//            <Param Type="HINTERACTIONCONTEXT" Name="interactionContext" />
//            <Param Type="INTERACTION_CONTEXT_PROPERTY" Name="contextProperty" />
//            <Param Type="UINT32*" Name="value" />
//            <Return Type="HRESULT" />
//        </Api>
//        <Api Name="GetStateInteractionContext">
//            <Param Type="HINTERACTIONCONTEXT" Name="interactionContext" />
//            <Param Type="const POINTER_INFO*" Name="pointerInfo" />
//            <Param Type="INTERACTION_STATE*" Name="state" />
//            <Return Type="HRESULT" />
//        </Api>
//        <Api Name="ProcessBufferedPacketsInteractionContext">
//            <Param Type="HINTERACTIONCONTEXT" Name="interactionContext" />
//            <Return Type="HRESULT" />
//        </Api>
//        <Api Name="ProcessInertiaInteractionContext">
//            <Param Type="HINTERACTIONCONTEXT" Name="interactionContext" />
//            <Return Type="HRESULT" />
//        </Api>
//        <Api Name="ProcessPointerFramesInteractionContext">
//            <Param Type="HINTERACTIONCONTEXT" Name="interactionContext" />
//            <Param Type="UINT32" Name="entriesCount" />
//            <Param Type="UINT32" Name="pointerCount" />
//            <Param Type="const POINTER_INFO*" Name="pointerInfo" Count="entriesCount" />
//            <Return Type="HRESULT" />
//        </Api>
//        <Api Name="RegisterOutputCallbackInteractionContext">
//            <Param Type="HINTERACTIONCONTEXT" Name="interactionContext" />
//            <Param Type="INTERACTION_CONTEXT_OUTPUT_CALLBACK" Name="outputCallback" />
//            <Param Type="void*" Name="clientData" />
//            <Return Type="HRESULT" />
//        </Api>
//        <Api Name="RemovePointerInteractionContext">
//            <Param Type="HINTERACTIONCONTEXT" Name="interactionContext" />
//            <Param Type="UINT32" Name="pointerId" />
//            <Return Type="HRESULT" />
//        </Api>
//        <Api Name="ResetInteractionContext">
//            <Param Type="HINTERACTIONCONTEXT" Name="interactionContext" />
//            <Return Type="HRESULT" />
//        </Api>
//        <Api Name="SetCrossSlideParametersInteractionContext">
//            <Param Type="HINTERACTIONCONTEXT" Name="interactionContext" />
//            <Param Type="UINT32" Name="parameterCount" />
//            <Param Type="CROSS_SLIDE_PARAMETER*" Name="crossSlideParameters" />
//            <Return Type="HRESULT" />
//        </Api>
//        <Api Name="SetInertiaParameterInteractionContext">
//            <Param Type="HINTERACTIONCONTEXT" Name="interactionContext" />
//            <Param Type="INERTIA_PARAMETER" Name="inertiaParameter" />
//            <Param Type="float" Name="value" />
//            <Return Type="HRESULT" />
//        </Api>
//        <Api Name="SetInteractionConfigurationInteractionContext">
//            <Param Type="HINTERACTIONCONTEXT" Name="interactionContext" />
//            <Param Type="UINT32" Name="configurationCount" />
//            <Param Type="const INTERACTION_CONTEXT_CONFIGURATION*" Name="configuration" />
//            <Return Type="HRESULT" />
//        </Api>
//        <Api Name="SetMouseWheelParameterInteractionContext">
//            <Param Type="HINTERACTIONCONTEXT" Name="interactionContext" />
//            <Param Type="MOUSE_WHEEL_PARAMETER" Name="parameter" />
//            <Param Type="float" Name="value" />
//            <Return Type="HRESULT" />
//        </Api>
//        <Api Name="SetPivotInteractionContext">
//            <Param Type="HINTERACTIONCONTEXT" Name="interactionContext" />
//            <Param Type="float" Name="x" />
//            <Param Type="float" Name="y" />
//            <Param Type="float" Name="radius" />
//            <Return Type="HRESULT" />
//        </Api>
//        <Api Name="SetPropertyInteractionContext">
//            <Param Type="HINTERACTIONCONTEXT" Name="interactionContext" />
//            <Param Type="INTERACTION_CONTEXT_PROPERTY" Name="contextProperty" />
//            <Param Type="UINT32" Name="value" />
//            <Return Type="HRESULT" />
//        </Api>
//        <Api Name="StopInteractionContext">
//            <Param Type="HINTERACTIONCONTEXT" Name="interactionContext" />
//            <Return Type="HRESULT" />
//        </Api>
//
//        <!-- Pointer Input Messages and Notifications -->
//        <Category Name="Windows Application UI Development/User Interaction/Pointer Input Messages and Notifications" />
//        <Api Name="EnableMouseInPointer">
//            <Param Type="BOOL" Name="fEnable" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="GetPointerCursorId">
//            <Param Type="UINT32" Name="pointerId" />
//            <Param Type="UINT32*" Name="cursorId" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="GetPointerFrameInfo">
//            <Param Type="UINT32" Name="pointerId" />
//            <Param Type="UINT32*" Name="pointerCount" />
//            <Param Type="POINTER_INFO*" Name="pointerInfo" PostCount="pointerCount" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="GetPointerFrameInfoHistory">
//            <Param Type="UINT32" Name="pointerId" />
//            <Param Type="UINT32*" Name="entriesCount" />
//            <Param Type="UINT32*" Name="pointerCount" />
//            <Param Type="POINTER_INFO*" Name="pointerInfo" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="GetPointerFramePenInfo">
//            <Param Type="UINT32" Name="pointerId" />
//            <Param Type="UINT32*" Name="pointerCount" />
//            <Param Type="POINTER_PEN_INFO*" Name="penInfo" PostCount="pointerCount" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="GetPointerFramePenInfoHistory">
//            <Param Type="UINT32" Name="pointerId" />
//            <Param Type="UINT32*" Name="entriesCount" />
//            <Param Type="UINT32*" Name="pointerCount" />
//            <Param Type="POINTER_PEN_INFO*" Name="penInfo" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="GetPointerFrameTouchInfo">
//            <Param Type="UINT32" Name="pointerId" />
//            <Param Type="UINT32*" Name="pointerCount" />
//            <Param Type="POINTER_TOUCH_INFO*" Name="touchInfo" PostCount="pointerCount" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="GetPointerFrameTouchInfoHistory">
//            <Param Type="UINT32" Name="pointerId" />
//            <Param Type="UINT32*" Name="entriesCount" />
//            <Param Type="UINT32*" Name="pointerCount" />
//            <Param Type="POINTER_TOUCH_INFO*" Name="touchInfo" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="GetPointerInfo">
//            <Param Type="UINT32" Name="pointerId" />
//            <Param Type="POINTER_INFO*" Name="pointerInfo" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="GetPointerInfoHistory">
//            <Param Type="UINT32" Name="pointerId" />
//            <Param Type="UINT32*" Name="entriesCount" />
//            <Param Type="POINTER_INFO*" Name="pointerInfo" PostCount="entriesCount" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="GetPointerPenInfo">
//            <Param Type="UINT32" Name="pointerId" />
//            <Param Type="POINTER_PEN_INFO*" Name="penInfo" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="GetPointerPenInfoHistory">
//            <Param Type="UINT32" Name="pointerId" />
//            <Param Type="UINT32*" Name="entriesCount" />
//            <Param Type="POINTER_PEN_INFO*" Name="penInfo" PostCount="entriesCount" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="GetPointerTouchInfo">
//            <Param Type="UINT32" Name="pointerId" />
//            <Param Type="POINTER_TOUCH_INFO*" Name="touchInfo" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="GetPointerTouchInfoHistory">
//            <Param Type="UINT32" Name="pointerId" />
//            <Param Type="UINT32*" Name="entriesCount" />
//            <Param Type="POINTER_TOUCH_INFO*" Name="touchInfo" PostCount="entriesCount" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="GetPointerType">
//            <Param Type="UINT32" Name="pointerId" />
//            <Param Type="POINTER_INPUT_TYPE*" Name="pointerType" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="GetUnpredictedMessagePos">
//            <Return Type="DWORD" />
//        </Api>
//        <Api Name="IsMouseInPointerEnabled">
//            <Return Type="BOOL" />
//            <Success />
//        </Api>
//        <Api Name="SkipPointerFrameMessages">
//            <Param Type="UINT32" Name="pointerId" />
//            <Return Type="BOOL" />
//        </Api>
//
//        <!-- Touch Hit Testing -->
//        <Category Name="Windows Application UI Development/User Interaction/Touch Hit Testing" />
//        <Api Name="EvaluateProximityToPolygon">
//            <Param Type="UINT32" Name="numVertices" />
//            <Param Type="const POINT*" Name="controlPolygon" />
//            <Param Type="const TOUCH_HIT_TESTING_INPUT*" Name="pHitTestingInput" />
//            <Param Type="TOUCH_HIT_TESTING_PROXIMITY_EVALUATION*" Name="pProximityEval" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="EvaluateProximityToRect">
//            <Param Type="const RECT*" Name="controlBoundingBox" />
//            <Param Type="const TOUCH_HIT_TESTING_INPUT*" Name="pHitTestingInput" />
//            <Param Type="TOUCH_HIT_TESTING_PROXIMITY_EVALUATION*" Name="pProximityEval" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="PackTouchHitTestingProximityEvaluation">
//            <Param Type="const TOUCH_HIT_TESTING_INPUT*" Name="pHitTestingInput" />
//            <Param Type="const TOUCH_HIT_TESTING_PROXIMITY_EVALUATION*" Name="pProximityEval" />
//            <Return Type="LRESULT" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="RegisterTouchHitTestingWindow">
//            <Param Type="HWND" Name="hwnd" />
//            <Param Type="ULONG" Name="value" />
//            <Return Type="BOOL" />
//        </Api>
//
//        <!-- Input Source Identification -->
//        <Category Name="Windows Application UI Development/User Interaction/Input Source Identification" />
//        <Api Name="GetCIMSSM">
//            <Param Type="INPUT_MESSAGE_SOURCE*" Name="inputMessageSource" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="GetCurrentInputMessageSource">
//            <Param Type="INPUT_MESSAGE_SOURCE*" Name="inputMessageSource" />
//            <Return Type="BOOL" />
//        </Api>
//
//        <!-- Pointer Device Input Stack -->
//        <Category Name="Windows Application UI Development/User Interaction/Pointer Device Input Stack" />
//        <Api Name="GetPointerDevice">
//            <Param Type="HANDLE" Name="device" />
//            <Param Type="POINTER_DEVICE_INFO*" Name="pointerDevice" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="GetPointerDeviceCursors">
//            <Param Type="HANDLE" Name="device" />
//            <Param Type="UINT32*" Name="cursorCount" />
//            <Param Type="POINTER_DEVICE_CURSOR_INFO*" Name="deviceCursors" PostCount="cursorCount" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="GetPointerDeviceProperties">
//            <Param Type="HANDLE" Name="device" />
//            <Param Type="UINT32*" Name="propertyCount" />
//            <Param Type="POINTER_DEVICE_PROPERTY*" Name="pointerProperties" PostCount="propertyCount" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="GetPointerDeviceRects">
//            <Param Type="HANDLE" Name="device" />
//            <Param Type="RECT*" Name="pointerDeviceRect" />
//            <Param Type="RECT*" Name="displayRect" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="GetPointerDevices">
//            <Param Type="UINT32" Name="deviceCount" />
//            <Param Type="POINTER_DEVICE_INFO*" Name="pointerDevices" PostCount="deviceCount" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="GetRawPointerDeviceData">
//            <Param Type="UINT32" Name="pointerId" />
//            <Param Type="UINT32" Name="historyCount" />
//            <Param Type="UINT32" Name="propertiesCount" />
//            <Param Type="POINTER_DEVICE_PROPERTY*" Name="pProperties" PostCount="propertiesCount" />
//            <Param Type="LONG*" Name="pValues" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="RegisterPointerDeviceNotifications">
//            <Param Type="HWND" Name="window" />
//            <Param Type="BOOL" Name="notifyRange" />
//            <Return Type="BOOL" />
//        </Api>
//
//        <!-- Power Management -->
//        <Category Name="System Services/Power Management" />
//        <Api Name="RegisterSuspendResumeNotification">
//            <Param Type="PDEVICE_NOTIFY_SUBSCRIBE_PARAMETERS" Name="hRecipient" />
//            <Param Type="[POWER_NOTIFICATION_FLAGS]" Name="Flags" />
//            <Return Type="HPOWERNOTIFY" />
//            <Success Return="NotEqual" Value="0" />
//        </Api>
//        <Api Name="UnregisterSuspendResumeNotification">
//            <Param Type="HPOWERNOTIFY" Name="RegistrationHandle" />
//            <Return Type="BOOL" />
//        </Api>
//
//        <!-- Input Feedback Configuration -->
//        <Category Name="Windows Application UI Development/User Interaction/Input Feedback Configuration" />
//        <Api Name="GetWindowFeedbackSetting">
//            <Param Type="HWND" Name="hwnd" />
//            <Param Type="FEEDBACK_TYPE" Name="feedback" />
//            <Param Type="[GWFS_FLAGS]" Name="dwFlags" />
//            <Param Type="UINT32*" Name="pSize" />
//            <Param Type="VOID*" Name="config" Length="pSize" />
//            <Return Type="BOOL" />
//        </Api>
//        <Api Name="SetWindowFeedbackSetting">
//            <Param Type="HWND" Name="hwnd" />
//            <Param Type="FEEDBACK_TYPE" Name="feedback" />
//            <Param Type="DWORD" Name="dwFlags" />
//            <Param Type="UINT32" Name="size" />
//            <Param Type="const VOID*" Name="configuration" Length="size" />
//            <Return Type="BOOL" />
//        </Api>
//
//    </Module>
//</ApiMonitor>
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
//Windows API - Window Functions
//
//GetParent& Lib "user32" (Byval hWnd As Long)
//GetWindow& Lib "user32" (Byval hWnd As Long, Byval wCmd As Long)
//GetWindowLong& Lib "user32" Alias "GetWindowLongA" (Byval hWnd As Long, Byval wIndx As Long)
//GetTopWindow& Lib "user32" (Byval hwnd As Long)
//GetActiveWindow& Lib "user32" Alias "GetActiveWindow" ()
//GetLastActivePopup& Lib "user32" (Byval hwnd As Long)
//GetForegroundWindow& Lib "user32" ()
//GetWindowTextLength& Lib "user32" Alias "GetWindowTextLengthA" (Byval hwnd As Long)
//GetWindowText& Lib "user32" Alias "GetWindowTextA" (Byval hwnd As Long, Byval lpstring As String, Byval lpstrlen As Long)
//GetDesktopWindow& Lib "user32" ()
//GetFocus& Lib "user32" ()
//GetWindowThreadProcessId& Lib "user32" (Byval hWnd As Long, lpdwProcessId As Long)
//SetTopWindow& Lib "user32" Alias "SetForegroundWindow" (Byval Hwnd As Long)
//SetActiveWindow& Lib "user32" (Byval Hwnd As Long)
//SetFocusAPI& Lib "user32" Alias "SetFocus" (Byval hwnd As Long)
//SetCapture& Lib "user32" (Byval hwnd As Long)
//SetForegroundWindow& Lib "user32" (Byval hwnd As Long)
//FindWindow& Lib "user32" Alias "FindWindowA" (Byval lpclassname As String, Byval lpwindowname As String)
//FindWindowClass& Lib "user32" Alias "FindWindowA" (Byval lpclassname As String, Byval dummy As Long )
//FindWindowName& Lib "user32" Alias "FindWindowA" (Byval dummy As Long, Byval lpwindowname As String)
//AnyPopup& Lib "user32" ()
//ShowWindow& Lib "user32" Alias "ShowWindow" (Byval Hwnd As Long, Byval nCmdShow As Long)
//IsIcon& Lib "user32" Alias "IsIconic" (Byval Hwnd As Long)
//UpdateWindow& Lib "user32" (Byval Hwnd As Long)
//
//Windows API - Menu Functions
//GetCursorPos& Lib "user32" Alias "GetCursorPos" (lpPoint As POINTAPI)
//CreatePopupMenu& Lib "user32" Alias "CreatePopupMenu" ()
//AppendMenu& Lib "user32" Alias "AppendMenuA" (Byval hMenu As Long, Byval wFlags As Long, Byval wIDNewItem As Integer, Byval lpNewItem As Any)
//TrackPopupMenu& Lib "user32" Alias "TrackPopupMenu" (Byval hMenu As Long, Byval wFlags As Long, Byval x As Long, Byval y As Long, Byval nReserved As Long, Byval hwnd As Long, lprc As Rect)
//DestroyMenu& Lib "user32" Alias "DestroyMenu" (Byval hMenu As Long)
//GetMessage& Lib "user32" Alias "GetMessageA" (lpMsg As MSG, Byval hwnd As Long, Byval wMsgFilterMin As Long, Byval wMsgFilterMax As Long)
//
//Windows API - Others
//SendMessage& Lib "user32" Alias "SendMessageA" (Byval Hwnd As Long, Byval Msg As Long, Byval wParam As Long, lParam As Long)
//SendMessageTimeOut& Lib "user32" Alias "SendMessageTimeOut" (Byval hwnd As Long, Byval msg As Long, Byval wparam As Long, Byval lparam As Long, Byval fuflags As Long, utimeout As Long, lpresult As Long)
//GetClassName& Lib "user32" Alias "GetClassNameA" (Byval hwnd As Long, Byval lpclassname As String, Byval nmaxcount As Long)
//GetOpenFileName& Lib "comdlg32.dll" Alias "GetOpenFileNameA" (OPENFILENAME As tagOPENFILENAME)
//GetSaveFileName& Lib "comdlg32.dll" Alias "GetSaveFileNameA" (OPENFILENAME As tagOPENFILENAME
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
