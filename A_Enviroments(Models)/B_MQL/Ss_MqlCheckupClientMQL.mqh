 //+------------------------------------------------------------------+ 
//||   ||||||||||                 Ss_MqlCheckupClientMQL.mqh        || 
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             ||| 
//||   ||||||||||             HTTPS: www.Oprymhdv.com               || 
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Bases\.BaseWall.mqh> 
//+------------------------------------------------------------------+
//|             Class C_MULTIVARIABLE     BEGIN-END                  |
//+------------------------------------------------------------------+
class Ss_MqlCheckupClientMQL
{         /*
          *
          *
          * Running MQL4 Program Properties
          * To obtain information about the currently running mql4 program, constants from ENUM_MQL_INFO_INTEGER and ENUM_MQL_INFO_STRING are used.
          * For function MQLInfoInteger
          * ==============================================================================================================================================================================
          ENUM_MQL_INFO_INTEGER  MQLInfoInteger()
          * ===============================================================================================================================================================================
          Identifier                      Description                                                                                           Type
          * ===============================================================================================================================================================================
          * MQL_CODEPAGE                  Codepage used by an MQL4 program to output and convert
                                           strings (Print, PrintFormat, Alert, MessageBox, SendFTP, SendMail, SendNotification, etc.)           Codepage constant
          * MQL_PROGRAM_TYPE              Type of the MQL4 program                                                                              ENUM_PROGRAM_TYPE
          * MQL_DLLS_ALLOWED              The permission to use DLL for the given executed program                                              bool
          * MQL_TRADE_ALLOWED             The permission to trade for the given executed program                                                bool
          * MQL_SIGNALS_ALLOWED           The permission to modify the Signals for the given executed program                                   bool
          * MQL_DEBUG                     The flag, that indicates the debug mode                                                               bool
          * MQL_PROFILER                  The flag, that indicates the program operating in the code profiling mode                             bool
          * MQL_TESTER                    The flag, that indicates the tester process                                                           bool
          * MQL_OPTIMIZATION              The flag, that indicates the optimization process                                                     bool
          * MQL_VISUAL_MODE               The flag, that indicates the visual tester process                                                    bool
          * MQL_FRAME_MODE                The flag, that indicates the Expert Advisor operating in gathering optimization result frames mode    bool
          * MQL_LICENSE_TYPE              Type of license of the EX4 module. The license refers to the EX4 module, from which a request
          *                               is made using MQLInfoInteger(MQL_LICENSE_TYPE).                                                       ENUM_LICENSE_TYPE
          * ==============================================================================================================================================================================
          ENUM_MQL_INFO_STRING  MQLInfoString()
          * ===============================================================================================================================================================================
          Identifier                      Description                                                                                           Type
          * ===============================================================================================================================================================================
          * MQL_PROGRAM_NAME              Name of the MQL4-program executed                                                                     string
          * MQL_PROGRAM_PATH              Path for the given executed program                                                                   string
          * ===============================================================================================================================================================================
          * ENUM_PROGRAM_TYPE             PROGRAM_SCRIPT Script         PROGRAM_EXPERT Expert           PROGRAM_INDICATOR Indicator
          * ===============================================================================================================================================================================
          * ENUM_LICENSE_TYPE
          * LICENSE_FREE A free unlimited version
          * LICENSE_DEMO A trial version of a paid product from the Market. It works only in the strategy tester
          * LICENSE_FULL A purchased licensed version allows at least 5 activations. The number of activations is specified by seller. Seller may increase the allowed number of activations
          * LICENSE_TIME A version with limited term license
          *
          * ===============================================================================================================================================================================
          * Codepage constant
          * CP_ACP   0   The current Windows ANSI code page.
          * CP_OEMCP   1  The current system OEM code page.
          * CP_MACCP  2   The current system Macintosh code page.
          * Note: This value is mostly used in earlier created program codes and is of no use now, since modern Macintosh computers use Unicode for encoding.
          * CP_THREAD_ACP    3  The Windows ANSI code page for the current thread.
          * CP_SYMBOL 42  Symbol code page
          * CP_UTF7  65000  UTF-7 code page.
          * CP_UTF8   65001   UTF-8 code page.
          * ===============================================================================================================================================================================
          *
          *
          *
          *
          *
          *
          *
          *
          *
          *
          *
          *
          *
          *
          *
          *
          *
          *
          *
          *
          *
          */
//====================================================================
private:
//====================================================================
public:
          void                  Ss_MqlCheckupClientMQL();
          //void                  ~Ss_MqlCheckupClientMQL() {   /* Alert("Deinit: ", __FUNCSIG__, __LINE__);*/ }
          void                  ~Ss_MqlCheckupClientMQL() {RunCallFunction--; ________________________________________________________Xerorr.SuperviserX(_LastError, "-Ss_MqlCheckupClientMQL-Error",  __LINE__, __FUNCTION__); }
          bool                  Update();
          bool                  UPDATED;
//====================================================================
          string                CODEPAGE_TYPEDec();
          string                PROGRAM_TYPEDec();
//====================================================================
          int                   CODEPAGE;
          bool                  DEBUG;
          bool                  DLLS_ALLOWED;
          bool                  FORWARD;
          bool                  FRAME_MODE;
          ENUM_LICENSE_TYPE     LICENSE_TYPE;
          bool                  MEMORY_LIMIT;
          bool                  MEMORY_USED;
          bool                  OPTIMIZATION;
          bool                  PROFILER;
          ENUM_PROGRAM_TYPE     PROGRAM_TYPE;
          bool                  SIGNALS_ALLOWED;
          bool                  TESTER;
          bool                  TRADE_ALLOWED;
          bool                  VISUAL_MODE;
          //=============================
          string                PROGRAM_NAME;
          string                PROGRAM_PATH;
//====================================================================
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Ss_MqlCheckupClientMQL::Ss_MqlCheckupClientMQL()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ERROR-Error",  __LINE__, __FUNCTION__); //|
          RunCallFunction++;//=========================================================|
          Update();//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Ss_MqlCheckupClientMQL::Update()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "C_UTILITIES  Error",  __LINE__, __FUNCTION__); //|
          UPDATED = false;
          //=============================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "C_UTILITIES  Error",  __LINE__, __FUNCTION__); //|
          //CODEPAGE              = MQLInfoInteger(MQL_CODEPAGE);
          ________________________________________________________Xerorr.SuperviserX(_LastError, "C_UTILITIES  Error",  __LINE__, __FUNCTION__); //|
          DEBUG                 = MQLInfoInteger(MQL_DEBUG);
          DLLS_ALLOWED          = MQLInfoInteger(MQL_DLLS_ALLOWED);
          FORWARD               = MQLInfoInteger(MQL_FORWARD);
          FRAME_MODE            = MQLInfoInteger(MQL_FRAME_MODE);
          LICENSE_TYPE          = (ENUM_LICENSE_TYPE)MQLInfoInteger(MQL_LICENSE_TYPE);
          MEMORY_LIMIT          = MQLInfoInteger(MQL_MEMORY_LIMIT);
          MEMORY_USED           = MQLInfoInteger(MQL_MEMORY_USED);
          OPTIMIZATION          = MQLInfoInteger(MQL_OPTIMIZATION);
          PROFILER              = MQLInfoInteger(MQL_PROFILER);
          PROGRAM_TYPE          = (ENUM_PROGRAM_TYPE)MQLInfoInteger(MQL_PROGRAM_TYPE);
          SIGNALS_ALLOWED       = MQLInfoInteger(MQL_SIGNALS_ALLOWED);
          TESTER                = MQLInfoInteger(MQL_TESTER);
          TRADE_ALLOWED         = MQLInfoInteger(MQL_TRADE_ALLOWED);
          VISUAL_MODE           = MQLInfoInteger(MQL_VISUAL_MODE);
          //=============================
          PROGRAM_NAME          = MQLInfoString(MQL_PROGRAM_NAME);
          PROGRAM_PATH          = MQLInfoString(MQL_PROGRAM_PATH);
          //=============================
          //==========================================================
          // SYS Timer Cheackup Start Ss_MqlCheckupClientMQL App Enviroments<<<<<<<<<<|
          //==========================================================
          //
          UPDATED = true;
          //
          //==========================================================
          // SYS Timer Cheackup End Ss_MqlCheckupClientMQL App Enviroments<<<<<<<<<<<<|
          //==========================================================
          if(!this.UPDATED)              {Alert("Dev_Checkup_Mql.UPDATED: ", this.UPDATED);}
          ________________________________________________________Xerorr.SuperviserX(_LastError, "C_UTILITIES  Error",  __LINE__, __FUNCTION__); //|
          return UPDATED ; //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+PROGRAM_TYPE
string Ss_MqlCheckupClientMQL::PROGRAM_TYPEDec()
{         ENUM_PROGRAM_TYPE mql_program = (ENUM_PROGRAM_TYPE)MQLInfoInteger(MQL_PROGRAM_TYPE);
          string PROGRAM_TYPEDec = "";
          switch(PROGRAM_TYPE)
          {         case PROGRAM_SCRIPT:        {PROGRAM_TYPEDec = "PROGRAM_SCRIPT";    Print(__FILE__ + " is script"); break; }
                    case PROGRAM_EXPERT:        {PROGRAM_TYPEDec = "PROGRAM_EXPERT";    Print(__FILE__ + " is Expert Advisor"); break; }
                    case PROGRAM_INDICATOR:     {PROGRAM_TYPEDec = "PROGRAM_INDICATOR"; Print(__FILE__ + " is custom indicator"); break; }
                    default:                    {PROGRAM_TYPEDec = "PROGRAM_default";   Print("MQL4 program type value is ", mql_program);} //
          } //
          return PROGRAM_TYPEDec;//
}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string Ss_MqlCheckupClientMQL::CODEPAGE_TYPEDec()
{         CODEPAGE = MQLInfoInteger(MQL_CODEPAGE);
          string CODEPAGEDec = "";
          switch(CODEPAGE)
          {         case CP_ACP:                {CODEPAGEDec = "CP_ACP";        Print(__FILE__ + " CODEPAGE is CP_ACP 0 The current Windows ANSI code page."); break; }
                    case CP_OEMCP:              {CODEPAGEDec = "CP_OEMCP";      Print(__FILE__ + " CODEPAGE is CP_OEMCP 1 The current system OEM code page."); break; }
                    case CP_MACCP:              {CODEPAGEDec = "CP_MACCP";      Print(__FILE__ + " CODEPAGE is CP_MACCP 2 The current system Macintosh code page."); break; }
                    case CP_THREAD_ACP:         {CODEPAGEDec = "CP_THREAD_ACP"; Print(__FILE__ + " CODEPAGE is CP_THREAD_ACP 3 The Windows ANSI code page for the current thread."); break; }
                    case CP_SYMBOL:             {CODEPAGEDec = "CP_SYMBOL";     Print(__FILE__ + " CODEPAGE is CP_SYMBOL 42  Symbol code page"); break; }
                    case CP_UTF7:               {CODEPAGEDec = "CP_UTF7";       Print(__FILE__ + " CODEPAGE is CP_UTF7  65000  UTF - 7 code page."); break; }
                    case CP_UTF8:               {CODEPAGEDec = "CP_UTF8";       Print(__FILE__ + " CODEPAGE is CP_UTF8   65001   UTF - 8 code page.."); break; }
                    default:                    {CODEPAGEDec = "default";       Print("MQL4 program CODEPAGE type value is ", CODEPAGE);} //
          } //
          return CODEPAGEDec;//
}
//+------------------------------------------------------------------+
//|             Class C_MULTIVARIABLE     BEGIN-END                  |
//+------------------------------------------------------------------+
