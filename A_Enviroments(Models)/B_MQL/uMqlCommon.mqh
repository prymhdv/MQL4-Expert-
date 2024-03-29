//+------------------------------------------------------------------+
//|                                                       Su_MqlCommon.mqh |
//|                                                    A pourya 2021 |
//|                                                @prymhdvgmail.com |
//+------------------------------------------------------------------+
#property copyright "A pourya 2021"
#property link      "@prymhdvgmail.com"
#property version   "1.00"
#property strict
struct Ss_MessageBox
{         /*message box =============================================================================
          MQL4 Reference  /  Constants, Enumerations and Structures  /  Input/Output Constants / MessageBox  ???????????
          Constants of the MessageBox Dialog Window
          This section contains return codes of the MessageBox() function. If a message window has a Cancel button, the function returns IDCANCEL,
          in case if the ESC key or the Cancel button is pressed. If there is no Cancel button in the message window,
          the pressing of ESC does not give any effect.
          Constant              Value           Description
          IDOK                  1               "OK" button has been pressed
          IDCANCEL              2               "Cancel" button has been pressed
          IDABORT               3               "Abort" button has been pressed
          IDRETRY               4               "Retry" button has been pressed
          IDIGNORE              5               "Ignore" button has been pressed
          IDYES                 6               "Yes" button has been pressed
          IDNO                  7               "No" button has been pressed
          IDTRYAGAIN            10              "Try Again" button has been pressed
          IDCONTINUE            11              "Continue" button has been pressed
          The main flags of the MessageBox() function define contents and behavior of the dialog window.
          This value can be a combination of the following flag groups:
          Constant              Value                   Description
          MB_OK                 0x00000000              Message window contains only one button: OK. Default
          MB_OKCANCEL           0x00000001              Message window contains two buttons: OK and Cancel
          MB_ABORTRETRYIGNORE   0x00000002              Message window contains three buttons: Abort, Retry and Ignore
          MB_YESNOCANCEL        0x00000003              Message window contains three buttons: Yes, No and Cancel
          MB_YESNO              0x00000004              Message window contains two buttons: Yes and No
          MB_RETRYCANCEL        0x00000005              Message window contains two buttons: Retry and Cancel
          MB_CANCELTRYCONTINUE  0x00000006              Message window contains three buttons: Cancel, Try Again, Continue
          To display an icon in the message window it is necessary to specify additional flags:
          Constant              Value                   Description
          MB_ICONSTOP,          0x00000010              The STOP sign icon
          MB_ICONERROR,         0x00000010              The STOP sign icon
          MB_ICONHAND           0x00000010              The STOP sign icon
          MB_ICONQUESTION       0x00000020              The question sign icon
          MB_ICONEXCLAMATION,   0x00000030              The exclamation/warning sign icon
          MB_ICONWARNING        0x00000030              The exclamation/warning sign icon
          MB_ICONINFORMATION,   0x00000040              The encircled i sign
          MB_ICONASTERISK       0x00000040              The encircled i sign
          Default buttons are defined by the following flags:
          Constant              Value                   Description
          MB_DEFBUTTON1         0x00000000              The first button MB_DEFBUTTON1 - is default, if the other buttons MB_DEFBUTTON2, MB_DEFBUTTON3, or MB_DEFBUTTON4 are not specified
          MB_DEFBUTTON2         0x00000100              The second button is default
          MB_DEFBUTTON3         0x00000200              The third button is default
          MB_DEFBUTTON4         0x00000300              The fourth button is default
          * ==============================================================================
          */
};
struct St_TesterStatistics
{

          /* ==============================================================================
          MQL4 Reference  /  Common Functions / TesterStatistics  ???????????
          TesterStatistics
          The function returns the value of the specified statistical parameter calculated based on testing results.
          double  TesterStatistics(   ENUM_STATISTICS statistic_id // ID );
          Parameters
          statistic_id          [in]   The ID of the statistical parameter from the ENUM_STATISTICS enumeration.
          Return Value          The value of the statistical parameter from testing results.
          Note                  The function can be called inside OnTester() or OnDeinit() in the tester. In other cases the result is undefined.
          //+--------------------------------------------------------------------------------------+
          //| ENUM_STATISTICS   double  TesterStatistics( ENUM_STATISTICS statistic_id // ID );    |
          //+--------------------------------------------------------------------------------------+
          MQL4 Reference  /  Constants, Enumerations and Structures  /  Environment State / Testing Statistics  ???????????
          Testing Statistics
          After the testing is over, different parameters of the trading results statistics are calculated.
          The values of the parameters can be obtained using the TesterStatistics() function, by specifying the parameter ID from the ENUM_STATISTICS enumeration.
          Although two types of parameters (int and double) are used for calculating statistics, the function returns all values in the double form.
           All the statistic values of the double type are expressed in the deposit currency by default, unless otherwise specified.
          ENUM_STATISTICS
          ==============================================================================
          ID                            Description of a statistic parameter                                                    Type
          STAT_INITIAL_DEPOSIT          The value of the initial deposit                                                        double
          STAT_PROFIT                   Net profit after testing, the sum of STAT_GROSS_PROFIT and
                                        STAT_GROSS_LOSS (STAT_GROSS_LOSS is always less than or equal to zero)                  double
          STAT_GROSS_PROFIT             Total profit, the sum of all profitable (positive) trades.
                                        The value is greater than or equal to zero                                              double
          STAT_GROSS_LOSS               Total loss, the sum of all negative trades.
                                        The value is less than or equal to zero                                                 double
          STAT_MAX_PROFITTRADE          Maximum profit – the largest value of all profitable trades.
                                        The value is greater than or equal to zero                                              double
          STAT_MAX_LOSSTRADE            Maximum loss – the lowest value of all losing trades.
                                        The value is less than or equal to zero                                                 double
          STAT_CONPROFITMAX             Maximum profit in a series of profitable trades.
                                        The value is greater than or equal to zero                                              double
          STAT_CONPROFITMAX_TRADES      The number of trades that have formed
                                        STAT_CONPROFITMAX (maximum profit in a series of profitable trades)                     int
          STAT_MAX_CONWINS              The total profit of the longest series of profitable trades                             double
          STAT_MAX_CONPROFIT_TRADES     The number of trades in the longest series of profitable trades STAT_MAX_CONWINS        int
          STAT_CONLOSSMAX               Maximum loss in a series of losing trades. The value is less than or equal to zero      double
          STAT_CONLOSSMAX_TRADES        The number of trades that have formed STAT_CONLOSSMAX
                                        (maximum loss in a series of losing trades)                                             int
          STAT_MAX_CONLOSSES            The total loss of the longest series of losing trades                                   double
          STAT_MAX_CONLOSS_TRADES       The number of trades in the longest series of losing trades STAT_MAX_CONLOSSES          int
          STAT_BALANCEMIN               Minimum balance value                                                                   double
          STAT_BALANCE_DD               Maximum balance drawdown in monetary terms. In the process of trading,
                                        a balance may have numerous drawdowns; here the largest value is taken                  double
          STAT_BALANCEDD_PERCENT        Balance drawdown as a percentage that was recorded at the moment of
                                        the maximum balance drawdown in monetary terms (STAT_BALANCE_DD).                       double
          STAT_BALANCE_DDREL_PERCENT    Maximum balance drawdown as a percentage. In the process of trading,
                                        a balance may have numerous drawdowns, for each of which the relative drawdown
                                        value in percents is calculated. The greatest value is returned                         double
          STAT_BALANCE_DD_RELATIVE      Balance drawdown in monetary terms that was recorded at the moment of
                                        the maximum balance drawdown as a percentage (STAT_BALANCE_DDREL_PERCENT).              double
          STAT_EQUITYMIN                Minimum equity value                                                                    double
          STAT_EQUITY_DD                Maximum equity drawdown in monetary terms. In the process of trading,
                                        numerous drawdowns may appear on the equity; here the largest value is taken            double
          STAT_EQUITYDD_PERCENT         Drawdown in percent that was recorded at the moment of the maximum equity
                                        drawdown in monetary terms (STAT_EQUITY_DD).                                            double
          STAT_EQUITY_DDREL_PERCENT     Maximum equity drawdown as a percentage. In the process of trading,
                                        an equity may have numerous drawdowns, for each of which the relative
                                        drawdown value in percents is calculated. The greatest value is returned                double
          STAT_EQUITY_DD_RELATIVE       Equity drawdown in monetary terms that was recorded at the moment of
                                        the maximum equity drawdown in percent (STAT_EQUITY_DDREL_PERCENT).                     double
          STAT_EXPECTED_PAYOFF          Expected payoff                                                                         double
          STAT_PROFIT_FACTOR            Profit factor, equal to  the ratio of STAT_GROSS_PROFIT/STAT_GROSS_LOSS.
                                        If STAT_GROSS_LOSS=0, the profit factor is equal to DBL_MAX                             double
          STAT_MIN_MARGINLEVEL          Minimum value of the margin level                                                       double
          STAT_CUSTOM_ONTESTER          The value of the calculated custom optimization criterion returned by
                                        the OnTester() function                                                                 double
          STAT_TRADES                   The number of trades                                                                    int
          STAT_PROFIT_TRADES            Profitable trades                                                                       int
          STAT_LOSS_TRADES              Losing trades                                                                           int
          STAT_SHORT_TRADES             Short trades                                                                            int
          STAT_LONG_TRADES              Long trades                                                                             int
          STAT_PROFIT_SHORTTRADES       Profitable short trades                                                                 int
          STAT_PROFIT_LONGTRADES        Profitable long trades                                                                  int
          STAT_PROFITTRADES_AVGCON      Average length of a profitable series of trades                                         int
          STAT_LOSSTRADES_AVGCON        Average length of a losing series of trades                                             int
          * ==============================================================================
           */

          double        STAT_INITIAL_DEPOSIT_double;
          double        STAT_PROFIT_double;
          double        STAT_GROSS_PROFIT_double;
          double        STAT_GROSS_LOSS_double;
          double        STAT_MAX_PROFITTRADE_double;
          double        STAT_MAX_LOSSTRADE_double;
          double        STAT_CONPROFITMAX_double;
          int           STAT_CONPROFITMAX_TRADES_int;
          double        STAT_MAX_CONWINS_double;
          int           STAT_MAX_CONPROFIT_TRADES_int;
          double        STAT_CONLOSSMAX_double;
          int           STAT_CONLOSSMAX_TRADES_int;
          double        STAT_MAX_CONLOSSES_double;
          int           STAT_MAX_CONLOSS_TRADES_int;
          double        STAT_BALANCEMIN_double;
          double        STAT_BALANCE_DD_double;
          double        STAT_BALANCEDD_PERCENT_double;
          double        STAT_BALANCE_DDREL_PERCENT_double;
          double        STAT_BALANCE_DD_RELATIVE_double;
          double        STAT_EQUITYMIN_double;
          double        STAT_EQUITY_DD_double;
          double        STAT_EQUITYDD_PERCENT_double;
          double        STAT_EQUITY_DDREL_PERCENT_double;
          double        STAT_EQUITY_DD_RELATIVE_double;
          double        STAT_EXPECTED_PAYOFF_double;
          double        STAT_PROFIT_FACTOR_double;
          double        STAT_MIN_MARGINLEVEL_double;
          double        STAT_CUSTOM_ONTESTER_double;
          int           STAT_TRADES_int;
          int           STAT_PROFIT_TRADES_int;
          int           STAT_LOSS_TRADES_int;
          int           STAT_SHORT_TRADES_int;
          int           STAT_LONG_TRADES_int;
          int           STAT_PROFIT_SHORTTRADES_int;
          int           STAT_PROFIT_LONGTRADES_int;
          int           STAT_PROFITTRADES_AVGCON_int;
          int           STAT_LOSSTRADES_AVGCON_int;


};
//+------------------------------------------------------------------+
//|             Class SoundController     BEGIN                      |
//+------------------------------------------------------------------+
struct Su_MqlCommon
{         /* ==============================================================================================
           Common Functions
           General-purpose functions not included into any specialized group are listed here.
           * ==============================================================================================
           Function              Action
           Alert                 Displays a message in a separate window
           CheckPointer          Returns the type of the object pointer
           Comment               Outputs a comment in the left top corner of the chart
           CryptEncode           Transforms the data from array with the specified method
           CryptDecode           Performs the inverse transformation of the data from array
           DebugBreak            Program breakpoint in debugging
           ExpertRemove          Stops Expert Advisor and unloads it from the chart
           GetPointer            Returns the object pointer
           GetTickCount          Returns the number of milliseconds that have elapsed since the system was started
           GetMicrosecondCount   Returns the number of microseconds that have elapsed since the start of MQL4-program
           MessageBox            Creates, displays a message box and manages it
           PeriodSeconds         Returns the number of seconds in the period
           PlaySound             Plays a sound file
           Print                 Displays a message in the log
           PrintFormat           Formats and prints the sets of symbols and values in a log file in accordance with a preset format
           ResetLastError        Sets the value of a predetermined variable _LastError to zero
           ResourceCreate        Creates an image resource based on a data set
           ResourceFree          Deletes dynamically created resource (freeing the memory allocated for it)
           ResourceReadImage     Reads data from the graphical resource created by ResourceCreate() function or saved in EX4 file during compilation
           ResourceSave          Saves a resource into the specified file
           SendFTP               Sends a file at the address specified in the settings window of the "FTP" tab
           SendMail              Sends an email at the address specified in the settings window of the "Email" tab
           SendNotification      Sends push notifications to mobile terminals, whose MetaQuotes ID are specified in the "Notifications" tab
           Sleep                 Suspends execution of the current Expert Advisor or script within a specified interval
           TerminalClose         Commands the terminal to complete operation
           TesterStatistics      It returns the value of a specified statistic calculated based on testing results
           TranslateKey          Returns a Unicode character by a virtual key code
           WebRequest            Sends HTTP request to the specified server
           ZeroMemory            Resets a variable passed to it by reference. The variable can be of any type, except for classes and structures that have constructors.
          * ==============================================================================================
           Checking Object Pointer
           The CheckPointer() function is used for checking the type of the object pointer. The function returns a value of the ENUM_POINTER_TYPE enumeration.
           If an incorrect pointer is used, the program execution will be immediately terminated.
           Objects created by the new() operator are of POINTER_DYNAMIC type. The delete() operator can and should be used only for such pointers.
           All other pointers are of POINTER_AUTOMATIC type, which means that this object has been created automatically by the mql4 program environment.
           Such objects are deleted automatically after being used.
           ENUM_POINTER_TYPE
           Constant              Description
           POINTER_INVALID   Incorrect pointer
           POINTER_DYNAMIC   Pointer of the object created by the new() operator
           POINTER_AUTOMATIC   Pointer of any objects created automatically (not using new())
          * ==============================================================================================
          */
private:
//===================================================================
public:
          void                  Su_MqlCommon::Su_MqlCommon() {};
          void                  Su_MqlCommon::~Su_MqlCommon() {};
          bool                  Su_MqlCommon::UPDATED;
          bool                  Su_MqlCommon::Update()
          {         UPDATED = false;
                    //===================================================================
                    //Alert("TickCountLast: ", TickCountLast);
                    //CheckPointer();
                    //Comment("")
                    //---
                    //CryptEncode()
                    //CryptDecode()
                    //---
                    //DebugBreak()
                    //ExpertRemove()
                    //---
                    //GetPointer()
                    //GetTickCount() GetTickCount_int = GetTickCount();
                    //GetMicrosecondCount()
                    //MessageBox()
                    //PeriodSeconds()
                    //PlaySound()
                    //Print()
                    //PrintFormat()
                    //---
                    //ResetLastError()
                    //ResourceCreate()
                    //ResourceFree()
                    //ResourceReadImage()
                    //ResourceSave()
                    //---
                    //SendFTP()
                    //SendMail()
                    //SendNotification()
                    //---
                    //Sleep()
                    //TerminalClose()                 //bool          TerminalClose(int ret_code                      /* closing code of the client terminal*/);
                    //TesterStatistics()          //double        TesterStatistics(ENUM_STATISTICS statistic_id);
                    //---
                    //TranslateKey()              //short         TranslateKey(int  key_code                      /* key code for receiving a Unicode character*/);
                    //---
                    //WebRequest()
                    //ZeroMemory();               //void          ZeroMemory(void &variable                       /* reset variable*/);//initialize by zero values);
                    //===================================================================
                    UPDATED = true;
                    if(!this.UPDATED)             {Alert("this.UPDATED: ", this.UPDATED);}
                    return UPDATED; ///
          }

//===================================================================
          ///---Terminal IO DataBase
          bool                  Su_MqlCommon::IsAlert;
          bool                  Su_MqlCommon::IsPrint;
          bool                  Su_MqlCommon::IsComment;
          bool                  Su_MqlCommon::IsPlaySound;
          ///---Pointer DataBase
          ENUM_POINTER_TYPE     Su_MqlCommon::ENUM_POINTER_TYPE_int;                //-- POINTER_INVALID | POINTER_DYNAMIC | POINTER_AUTOMATIC ---\\
          void*                 Su_MqlCommon::GetPointer_voidPointer;
          ///---Crypt DataBase
          int                   Su_MqlCommon::CryptEncode_int;
          int                   Su_MqlCommon::CryptDecode_int;
          ///--- Dev Keyboard
          short                 Su_MqlCommon::TranslateKey_short;
          ///--- Dev Debug
          bool                  Su_MqlCommon::IsDebugBreak;
          bool                  Su_MqlCommon::IsExpertRemove;
          bool                  Su_MqlCommon::IsTerminalClose;
          ///---Dev Memory
          bool                  Su_MqlCommon::IsZeroMemory;
          ///--- Dev Time Took DataBase
          uint                  Su_MqlCommon::GetTickCount_int;   //  GetTickCount();
          bool                  Su_MqlCommon::IsSleep;
          ///---Dev Test
          double                Su_MqlCommon::TesterStatistics_double;
          ///---WinForm
          int                   Su_MqlCommon::MessageBox_int;
          ///---Chart
          int                   Su_MqlCommon::PeriodSeconds_int;
          ulong                 Su_MqlCommon::GetMicrosecondCount_int;
          ///---Error
          bool                  Su_MqlCommon::IsResetLastError;
          bool                  Su_MqlCommon::IsSetUserError;
          ///---Resource
          bool                  Su_MqlCommon::IsResourceCreate;
          bool                  Su_MqlCommon::IsResourceCreateArray;
          bool                  Su_MqlCommon::IsResourceFree;
          bool                  Su_MqlCommon::IsResourceFreeArray;
          bool                  Su_MqlCommon::IsResourceSave;
          ///---Net  SendNotification
          bool                  Su_MqlCommon::IsSendFTP;
          bool                  Su_MqlCommon::IsSendMail;
          bool                  Su_MqlCommon::IsSendNotification;
          ///---Net Web
          int                   Su_MqlCommon::WebRequest_referer_int;
          int                   Su_MqlCommon::WebRequest_headers_int;
//===================================================================
//===================================================================
          ///---Terminal IO Alarm
          bool                  Su_MqlCommon::_Alert(string argument)                                   {Alert(argument); return IsAlert = true;};
          ///---Terminal IO Print
          bool                  Su_MqlCommon::_Print(string argument)                                   {Print(argument); return IsPrint = true;};
          void                  Su_MqlCommon::_PrintFormat(string format_string)                        {PrintFormat(format_string); } //values of simple types

          ///---Terminal IO ChartWin Comment
          bool                  Su_MqlCommon::_Comment(string argument)                                 { Comment(argument); return IsComment = true; };
          bool                  Su_MqlCommon::IsCommentReverse()                                        { return IsComment ? false : true;}
          ///---Terminal IO Sound
          bool                  Su_MqlCommon::_PlaySound(string  filename)                              {return IsPlaySound = PlaySound(filename) ? true : false ;};

          ///---Pointer
          template<typename tobject>
          ENUM_POINTER_TYPE     Su_MqlCommon::_CheckPointer( tobject* anyobject )                       {return CheckPointer(anyobject );}
          template<typename tany_class>
          void*                 Su_MqlCommon::_GetPointer(tany_class anyobject)                         {return GetPointer(anyobject)};
          ///---Crypt
          int                   Su_MqlCommon::_CryptEncode(ENUM_CRYPT_METHOD method, const uchar& data_source_array[], const uchar& key[], uchar& result_destination_array[]) {return CryptEncode( method, data_source_array, key, result_destination_array);}
          int                   Su_MqlCommon::_CryptDecode(ENUM_CRYPT_METHOD method, const uchar& data_source_array[], const uchar& key[], uchar& result_destination_array[]) {return CryptDecode( method, data_source_array, key, result_destination_array);}
          ///--- Dev Keyboard
          short                 Su_MqlCommon::_TranslateKey(int key_code_receiving_Unicode_character)                           {return TranslateKey_short = TranslateKey( key_code_receiving_Unicode_character);};

          ///--- Dev Debug
          bool                  Su_MqlCommon::_DebugBreak()                                             {DebugBreak(); return IsDebugBreak = true;};
          bool                  Su_MqlCommon::_ExpertRemove()                                           {ExpertRemove(); return IsExpertRemove = true;};
          bool                  Su_MqlCommon::_TerminalClose(int ret_code_client_terminal_closing_code) {return IsTerminalClose = TerminalClose(ret_code_client_terminal_closing_code);};
          ///---Dev Memory
          template<typename tvoid>
          bool                  Su_MqlCommon::_ZeroMemory(tvoid & variable_reset)                       {ZeroMemory(variable_reset); return IsZeroMemory = true; };
          ///---Dev Test
          double                Su_MqlCommon::_TesterStatistics( ENUM_STATISTICS statistic_id)          {return TesterStatistics_double = TesterStatistics(statistic_id);};

          ///--- Dev Time Took
          uint                  Su_MqlCommon::_GetTickCount() {return GetTickCount_int = GetTickCount();}; //---returns the number of milliseconds that elapsed since the system start.
          //--- Get the spent time in milliseconds uint time = GetTickCount(now)-GetTickCount(start);
          bool                  Su_MqlCommon::_Sleep(int milliseconds_interval)                         { IsSleep = true; Sleep( milliseconds_interval); return IsSleep; };

          ///---WinForm
          int                   Su_MqlCommon::_MessageBox(string messagetext, string caption_box_header = NULL, int flags_defines_set_buttons_in_the_box = 0 ) {return MessageBox_int = MessageBox( messagetext, caption_box_header, flags_defines_set_buttons_in_the_box);}
          ///---Chart
          int                   Su_MqlCommon::_PeriodSeconds(ENUM_TIMEFRAMES chartperiod = PERIOD_CURRENT)      {return PeriodSeconds_int = PeriodSeconds(chartperiod);}
          ulong                 Su_MqlCommon::_GetMicrosecondCount()                                            {return GetMicrosecondCount_int = GetMicrosecondCount();};

          ///---Error
          bool                  Su_MqlCommon::_ResetLastError()                                                 {ResetLastError();                      return IsResetLastError = true;};
          bool                  Su_MqlCommon::_SetUserError( ushort user_error_number )                         {SetUserError(user_error_number);       return IsSetUserError = true;};

          ///---Resource
          bool                  Su_MqlCommon::_ResourceCreate(const string resource_name, const string path_relative_path_to_the_fil) {return IsResourceCreate = ResourceCreate(resource_name, path_relative_path_to_the_fil);};
          bool                  Su_MqlCommon::_ResourceCreate(const string resource_name, const uint& Data_set_as_an_array[], uint img_width, uint img_height, uint data_xoffset_upper_left_corner_image, uint data_yoffset_upper_left_corner_image, uint data_width_total_width_image_based_data_set, ENUM_COLOR_FORMAT color_format_processing_method)
          {         return IsResourceCreateArray = ResourceCreate(resource_name, Data_set_as_an_array, img_width, img_height, data_xoffset_upper_left_corner_image, data_yoffset_upper_left_corner_image, data_width_total_width_image_based_data_set, color_format_processing_method);}
          bool                  Su_MqlCommon::_ResourceFree( const string  resource_name)                       {return IsResourceFree = ResourceFree(resource_name);};
          bool                  Su_MqlCommon::_ResourceFree(const string resource_name_graphical_resource_name_for_reading, uint& data_array_for_receiving_data_from_the_resource [], uint& receiving_width, uint& receiving_height)
          {         return IsResourceFreeArray = ResourceReadImage( resource_name_graphical_resource_name_for_reading, data_array_for_receiving_data_from_the_resource, receiving_width, receiving_height);}
          bool                  Su_MqlCommon::_ResourceSave( const string resource_name, const string file_name) {return IsResourceSave = ResourceSave(resource_name, file_name);}
          ///---Net
          bool                  Su_MqlCommon::_SendFTP(string filename_send_by_ftp, string ftp_path_ftp_catalog = NULL )        {return IsSendFTP               = SendFTP(filename_send_by_ftp, ftp_path_ftp_catalog = NULL );};
          bool                  Su_MqlCommon::_SendMail(string subject_header, string  some_text_email)                         {return IsSendMail              = SendMail(subject_header, some_text_email);};
          bool                  Su_MqlCommon::_SendNotification(string text_notification)                                       {return IsSendNotification      = SendNotification(text_notification);};
          ///---Net Web
          int                   Su_MqlCommon::_WebRequest(const string method_HTTP, const string url, const string cookie, const string referer, int timeout, const char &data_array_of_the_HTTP_message_body[], int data_size_array_size_in_bytes, char &result_array_containing_server_response_data[], string &result_headers_server_response)
          {         return WebRequest_referer_int = WebRequest( method_HTTP, url, cookie, referer, timeout, data_array_of_the_HTTP_message_body, data_size_array_size_in_bytes, result_array_containing_server_response_data, result_headers_server_response);};
          int                   Su_MqlCommon::_WebRequest( const string method_HTTP, const string url, const string headers, int timeout, const char &data_array_of_the_HTTP_message_body[], char &result_array_containing_server_response_data[], string &result_headers_server_response)
          {         return WebRequest_headers_int = WebRequest( method_HTTP, url, headers, timeout, data_array_of_the_HTTP_message_body, result_array_containing_server_response_data, result_headers_server_response);};
          //======================================================================================================================================================================================================================
//===================================================================
};

//+------------------------------------------------------------------+
//|             Class SoundController     BEGIN                      |
//+------------------------------------------------------------------+
