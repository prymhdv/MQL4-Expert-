//+------------------------------------------------------------------+
//|                                                     Exporter.mqh |
//|                                                    A pourya 2021 |
//|                                                @prymhdvgmail.com |
//+------------------------------------------------------------------+
#property copyright "A pourya 2021"
#property link      "@prymhdvgmail.com"
#property version   "1.00"
#property strict
//======================================================================================================
//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
//======================================================================================================
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(MQL4)\Include\Controls\Dialog.mqh> CAppDialog Dialog;///

//+------------------------------------------------------------------+
//|             Class ExportControler     BEGIN-END                  |
//+------------------------------------------------------------------+
class ExportControler
{
public://Constructors Member
          void          ExportControler::ExportControler();
          void          ExportControler::~ExportControler();
          string        ExportControler::m_IniFileName;//
//==========================================================
//public://Data Member
//==========================================================
//public://Data Key Member
//==========================================================
//public://Data Key Member ClickingCount
//==========================================================
public://Functions Member
          string        ExportControler::ExportBars(ENUM_TIMEFRAMES period, int maxBars);
          string        ExportControler::PeriodToStr(ENUM_TIMEFRAMES period);
          void          ExportControler::SendTelegramMessage();
          bool          ExportControler::SendMailX(string  subject, string  some_text);
          bool          ExportControler::SendEmail(string sender, string receiver, string subject, string message);
          bool          ExportControler::SendFTPX(string  subject, string  some_text);
          bool          ExportControler::RunExport();

          void          ExportControler::IniFileSave();

          void          ExportControler::IniFileLoad(void);
          string        ExportControler::IniFileName(void) const;
          bool          ExportControler::DeleteSettingsFile(string m_FileName);//
//==========================================================
};//Export;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void ExportControler::ExportControler()
{         RunCallFunction++; ________________________________________________________Xerorr.SuperviserX(_LastError, "-ExportControler Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          if(0)
          {         int handle = FileOpen("file.csv", FILE_CSV | FILE_WRITE, ";");
                    if(handle > 0)
                    {         // table column headers recording
                              FileWrite(handle, "Time;Open;High;Low;Close;Volume");
                              // data recording
                              for(int i = 0; i < Bars; i++)
                                        FileWrite(handle, Time[i], Open[i], High[i], Low[i], Close[i], Volume[i]);
                              FileClose(handle);//
                    }//
          }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-ExportControler Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void ExportControler::~ExportControler()
{         ///
          ///
          ///this.RunExport();
          if(Capitan_DeinitErrorCatching)________________________________________________________Xerorr.SuperviserX(_LastError, "-ExportControler Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool ExportControler:: RunExport()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-ExportControler Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          Comment("Loading...");
          int maxBars = MathMin(TerminalInfoInteger(TERMINAL_MAXBARS), 100000);
          string comment = "";
          ENUM_TIMEFRAMES periods[] = {PERIOD_M1, PERIOD_M5, PERIOD_M15, PERIOD_M30, PERIOD_H1, PERIOD_H4, PERIOD_D1 };
          for(int p = 0; p < ArraySize(periods); p++)
          {         comment += ExportBars(periods[p], maxBars) + "\n";
                    //Comment(comment);
          }
          comment += "Ready";
          //Comment(comment);
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-ExportControler Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return true; //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string ExportControler::ExportBars(ENUM_TIMEFRAMES period, int maxBars)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-ExportControler Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          MqlRates  rates_array[];
          ArraySetAsSeries(rates_array, true);
          int bars = CopyRates(_Symbol, period, 0, maxBars, rates_array);
          string fileName = _Symbol + PeriodToStr(period) + ".csv";
          string comment = "";
          if(bars > 1)
          {         int filehandle = FileOpen(fileName, FILE_WRITE | FILE_CSV);
                    for(int i = bars - 1; i >= 0; i--)
                    {         FileWrite(filehandle,
                                        TimeToString(rates_array[i].time, TIME_DATE),
                                        TimeToString(rates_array[i].time, TIME_MINUTES),
                                        rates_array[i].open,
                                        rates_array[i].high,
                                        rates_array[i].low,
                                        rates_array[i].close,
                                        rates_array[i].tick_volume); }
                    FileFlush(filehandle);
                    FileClose(filehandle);
                    comment = "File exported: " + fileName + ", " + IntegerToString(bars) + " bars"; }
          else
          {         comment = "Error with exporting: " + fileName; }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-ExportControler Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return (comment);//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string ExportControler::PeriodToStr(ENUM_TIMEFRAMES period)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-ExportControler Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          string strper;
          switch(period)
          {         case PERIOD_M1  : strper = "1";      break;
                    case PERIOD_M5  : strper = "5";      break;
                    case PERIOD_M15 : strper = "15";     break;
                    case PERIOD_M30 : strper = "30";     break;
                    case PERIOD_H1  : strper = "60";     break;
                    case PERIOD_H4  : strper = "240";    break;
                    case PERIOD_D1  : strper = "1440";   break;
                    case PERIOD_W1  : strper = "10080";  break;
                    case PERIOD_MN1 : strper = "302400"; break;
                    default : strper = ""; }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-ExportControler Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return (strper); //
}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void ExportControler::SendTelegramMessage()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-ExportControler Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          string token = "xxxxxxxxxxxxxxxxxxxxxxxxxxxx"; //get your token from @BotFather
          string chat_id = "xxxxxxxxxx"; //get your chat id from @userinfobot
          string message = "Salam A pourya 2021"; //your message
          string cookie = NULL, headers;
          char post[], result[];
          int res;
          //=====================================
//--- to enable access to the server, you should add URL "https://api.telegram.org"
//--- in the list of allowed URLs (Main Menu->Tools->Options, tab "Expert Advisors"):
          string base_url = "https://api.telegram.org";
          string url = base_url + "/bot" + token + "/sendMessage?chat_id=" + chat_id + "&text=" + message;
          //=====================================
//--- Reset the last error code
          ResetLastError();
          //=====================================
          int timeout = 2000; //--- Timeout below 1000 (1 sec.) is not enough for slow Internet connection
          res = WebRequest("GET", url, cookie, NULL, timeout, post, 0, result, headers);
          //=====================================
//--- Checking errors
          if(res == -1)
          {         int error_code = GetLastError();
                    string error_msg = ErrorDescription(error_code);
                    Print("Error in WebRequest. Error code: ", error_code, " Error: ", error_msg);
                    if(error_code == 4060)
                    {         //--- Perhaps the URL is not listed, display a message about the necessity to add the address
                              MessageBox("Add the address '" + base_url + "' in the list of allowed URLs on tab 'Expert Advisors'", "Error", MB_ICONERROR); ///
                    }
                    else
                    {         MessageBox("Access to the server is not possible.\nError: " + error_msg + "\nCode: " + (string)error_code, "Error", MB_ICONERROR);///
                    } ///
          }
          else
          {         //--- Load successfully
                    MessageBox("The message sent successfully.\nResult: " + CharArrayToString(result), "Success", MB_ICONINFORMATION);///
                    ///
          } //
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-ExportControler Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool ExportControler::SendMailX(string  subject, string  some_text)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-ExportControler Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          //Sends an email at the address specified in the settings window of the "Email" tab.
          //string  subject,       // header
          //string  some_text      // email text
          bool result = SendMail(subject, some_text); //
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-ExportControler Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return result; //
          ///
}

//
////+------------------------------------------------------------------+
////|                                                                  |
////+------------------------------------------------------------------+
//bool ExportControler::SendEmail(string sender, string receiver, string subject, string message)
//{         /**
//           * Verschickt eine E-Mail.
//           *
//           * @param  string sender   - E-Mailadresse des Senders    (default: der in der Konfiguration angegebene Standard-Sender)
//           * @param  string receiver - E-Mailadresse des Empfängers (default: der in der Konfiguration angegebene Standard-Empfänger)
//           * @param  string subject  - Subject der E-Mail
//           * @param  string message  - Body der E-Mail
//           *
//           * @return bool - Erfolgsstatus: TRUE, wenn die E-Mail zum Versand akzeptiert wurde (nicht, ob sie versendet wurde);
//           *                               FALSE andererseits
//           */
//          string filesDir = GetMqlFilesPath() + "\\";
//          // Validierung
//          // Sender
//          string _sender = StrTrim(sender);
//          if (!StringLen(_sender))
//          {         string section = "Mail";
//                    string key     = "Sender";
//                    _sender = GetConfigString(section, key);
//                    if (!StringLen(_sender))             return(!catch("SendEmail(1)  missing global/local configuration [" + section + "]->" + key,                                 ERR_INVALID_CONFIG_VALUE));
//                              if (!StrIsEmailAddress(_sender))     return(!catch("SendEmail(2)  invalid global/local configuration [" + section + "]->" + key + " = " + DoubleQuoteStr(_sender), ERR_INVALID_CONFIG_VALUE)); }
//          else if (!StrIsEmailAddress(_sender))   return(!catch("SendEmail(3)  invalid parameter sender = " + DoubleQuoteStr(sender), ERR_INVALID_PARAMETER));
//          sender = _sender;
//          // Receiver
//          string _receiver = StrTrim(receiver);
//          if (!StringLen(_receiver))
//          {         section   = "Mail";
//                    key       = "Receiver";
//                    _receiver = GetConfigString(section, key);
//                    if (!StringLen(_receiver))           return(!catch("SendEmail(4)  missing global/local configuration [" + section + "]->" + key,                                   ERR_INVALID_CONFIG_VALUE));
//                              if (!StrIsEmailAddress(_receiver))   return(!catch("SendEmail(5)  invalid global/local configuration [" + section + "]->" + key + " = " + DoubleQuoteStr(_receiver), ERR_INVALID_CONFIG_VALUE)); }
//          else if (!StrIsEmailAddress(_receiver)) return(!catch("SendEmail(6)  invalid parameter receiver = " + DoubleQuoteStr(receiver), ERR_INVALID_PARAMETER));
//          receiver = _receiver;
//          // Subject
//          string _subject = StrTrim(subject);
//          if (!StringLen(_subject))               return(!catch("SendEmail(7)  invalid parameter subject = " + DoubleQuoteStr(subject), ERR_INVALID_PARAMETER));
//          _subject = StrReplace(StrReplace(StrReplace(_subject, "\r\n", "\n"), "\r", " "), "\n", " ");          // Linebreaks mit Leerzeichen ersetzen
//          _subject = StrReplace(_subject, "\"", "\\\"");                                                        // Double-Quotes in email-Parametern escapen
//          _subject = StrReplace(_subject, "'", "'\"'\"'");                                                      // Single-Quotes im bash-Parameter escapen
//          // bash -lc 'email -subject "single-quote:'"'"' double-quote:\" pipe:|" ...'
//          // Message (kann leer sein): in temporärer Datei speichern, wenn nicht leer
//          message = StrTrim(message);
//          string message.txt = CreateTempFile(filesDir, "msg");
//          if (StringLen(message) > 0)
//          {         int hFile = FileOpen(StrRightFrom(message.txt, filesDir), FILE_BIN | FILE_WRITE);                  // FileOpen() benötigt einen MQL-Pfad
//                    if (hFile < 0)  return(!catch("SendEmail(8)->FileOpen()"));
//                    int bytes = FileWriteString(hFile, message, StringLen(message));
//                    FileClose(hFile);
//                    if (bytes <= 0) return(!catch("SendEmail(9)->FileWriteString() => " + bytes + " written")); }
//          // benötigte Executables ermitteln: Bash und Mailclient
//          string bash = GetConfigString("System", "Bash");
//          if (!IsFileA(bash)) return(!catch("SendEmail(10)  bash executable not found: " + DoubleQuoteStr(bash), ERR_FILE_NOT_FOUND));
//          // TODO: absoluter Pfad => direkt testen
//          // TODO: relativer Pfad => Systemverzeichnisse und $PATH durchsuchen
//          string sendmail = GetConfigString("Mail", "Sendmail");
//          if (!StringLen(sendmail))
//          {         // TODO: - kein Mailclient angegeben: Umgebungsvariable $SENDMAIL auswerten
//                    //       - sendmail suchen
//                    return(!catch("SendEmail(11)  missing global/local configuration [Mail]->Sendmail", ERR_INVALID_CONFIG_VALUE)); }
//          // Notes:
//          // ------
//          //  - Redirection in der Befehlszeile ist ein Shell-Feature und erfordert eine Shell als ausführendes Programm (direkter
//          //    Client-Aufruf mit Umleitung ist nicht möglich).
//          //  - Redirection mit cmd.exe funktioniert nicht, wenn umgeleiteter Output oder übergebene Parameter Sonderzeichen
//          //    enthalten: cmd /c echo hello \n world | {program} => Fehler
//          //  - Bei Verwendung der Shell als ausführendem Programm steht jedoch der Exit-Code nicht zur Verfügung (muß vorerst in
//          //    Kauf genommen werden).
//          //  - Alternative ist die Verwendung von CreateProcess() und direktes Schreiben/Lesen von STDIN/STDOUT. In diesem Fall muß
//          //    der Versand jedoch in einem eigenen Thread erfolgen, wenn er nicht blockieren soll.
//          //
//          // Cleancode email
//          // ---------------
//          //  - https://github.com/deanproxy/eMail
//          //  - gibt keinen Exit-Code zurück
//          //  - validiert die übergebenen Adressen nicht
//          //
//          // Befehlszeile für Shell-Aufruf zusammensetzen
//          message.txt     = StrReplace(message.txt, "\\", "/");
//          string mail.log = StrReplace(filesDir + "mail.log", "\\", "/");
//          string cmdLine  = sendmail + " -subject \"" + _subject + "\" -from-addr \"" + sender + "\" \"" + receiver + "\" < \"" + message.txt + "\" >> \"" + mail.log + "\" 2>&1; rm -f \"" + message.txt + "\"";
//          cmdLine  = bash + " -lc '" + cmdLine + "'";
//          // (5) Shell-Aufruf
//          int result = WinExec(cmdLine, SW_HIDE);   // SW_SHOW | SW_HIDE
//          if (result < 32) return(!catch("SendEmail(13)->kernel32::WinExec(cmdLine=\"" + cmdLine + "\")  " + ShellExecuteErrorDescription(result), ERR_WIN32_ERROR + result));
//          if (IsLogInfo()) logInfo("SendEmail(14)  Mail to " + receiver + " transmitted: \"" + subject + "\"");
//          return(!catch("SendEmail(15)"));//
//          ///
//}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool ExportControler::SendFTPX(string  subject, string  some_text)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-ExportControler Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          //Sends an email at the address specified in the settings window of the "Email" tab.
          //string  filename,          // file to be send by ftp
          //string  ftp_path = NULL    // ftp catalog
          bool result = SendFTP(subject, some_text); //
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-ExportControler Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return result; //
          ///
}


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
struct dataStruct
{         datetime   open;
          string     symb;
          string     type;
          double     lots;
          double     price;
          double     stoploss; //
};

dataStruct arr_[];
double bar_data[][2];
void OnStart_01()
{         int i = 0;
          int num_data = 0;
          ResetLastError();
          int file_handle = FileOpen("Myfxbookdata.csv", FILE_READ | FILE_CSV, ',');
          if(file_handle != INVALID_HANDLE)
          {         while(!FileIsEnding(file_handle))
                    {         num_data++;
                              ArrayResize(arr_, i + 1, 100);
                              arr_[i].open = FileReadDatetime(file_handle);
                              arr_[i].symb = FileReadString(file_handle);
                              arr_[i].type = FileReadString(file_handle);
                              arr_[i].lots = FileReadNumber(file_handle);
                              arr_[i].price = FileReadNumber(file_handle);
                              arr_[i].stoploss = FileReadNumber(file_handle);
                              if(arr_[i].symb == ChartSymbol())
                              {         int bar = iBarShift(NULL, 0, arr_[i].open);
                                        Print(i, "   Time = ", TimeToStr(arr_[i].open) + "   Bar = ", bar);
                                        ArrayResize(bar_data, i + 1, 100);
                                        Print("Array size = ", ArraySize(bar_data));
                                        bar_data[i][0] = bar;
                                        bar_data[i][1] = arr_[i].lots;
                                        Sleep(200);
                                        i++; } }
                    FileClose(file_handle); }
          else
          {         //PrintFormat("Failed to open file, Error code = %d", GetLastError());
          } //
}
//+------------------------------------------------------------------+
//| Bypasses the bug in program name detection in Dialog.mqh.        |
//+------------------------------------------------------------------+
void ExportControler::IniFileSave()
{         int handle = FileOpen(m_IniFileName, FILE_WRITE | FILE_BIN | FILE_ANSI);
          if (handle != INVALID_HANDLE)
          {         Dialog.Save(handle);
                    FileClose(handle); } //
}

//+------------------------------------------------------------------+
//| Bypasses the bug in program name detection in Dialog.mqh.        |
//+------------------------------------------------------------------+
void ExportControler::IniFileLoad(void)
{         int handle = FileOpen(m_IniFileName, FILE_READ | FILE_BIN | FILE_ANSI);
          if (handle != INVALID_HANDLE)
          {         Dialog.Load(handle);
                    FileClose(handle); }
          //InitObjects(); // Sets panel elements that changed based on changes in input parameters, overwriting the INI settings.
}

//+-------------------------------------------------------------------+
//| Extends CAppDialog::IniFileName() to use our custom ini filename. |
//+-------------------------------------------------------------------+
string ExportControler::IniFileName(void) const
{         string name = m_IniFileName;
          StringReplace(name, ".dat", ""); // Remove extension from our IniFileName.
          return(name);//
}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool ExportControler::DeleteSettingsFile(string m_FileName)
{         if (!FileIsExist(m_FileName))
          {         Print("No settings file to delete.");
                    return false; }
          Print("Trying to delete settings file.");
          if (!FileDelete(m_FileName))
          {         Print("Failed to delete file: " + m_FileName + ". Error: " + IntegerToString(GetLastError()));
                    return false; }
          Print("Deleted settings file successfully.");
          return true; //
}
//+------------------------------------------------------------------+
//|             Class ExportControler     BEGIN-END                  |
//+------------------------------------------------------------------+
//======================================================================================================
//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
//======================================================================================================
/*
#property strict

#include <arrays/arrayobj.mqh>
#include <files/file.mqh>

class MyFxBookOrder : public CObject {
protected:
   ENUM_TIMEFRAMES   m_barshift_tf;
   int               m_shift;
public:
   datetime       open_time;
   string         symbol;
   string         type;
   double         lots;
   double         price;
   double         stoploss;
public:
                  MyFxBookOrder():m_barshift_tf(WRONG_VALUE),m_shift(-1){}
   int            bar(ENUM_TIMEFRAMES tf=PERIOD_CURRENT);
};
int MyFxBookOrder::bar(ENUM_TIMEFRAMES tf=PERIOD_CURRENT) {
   if (tf == m_barshift_tf && m_shift >= 0)
      return m_shift;
   m_shift = iBarShift(this.symbol, tf, this.open_time);
   m_barshift_tf = tf;
   return m_shift;
}



class MyFxBookOrderArray : public CArrayObj
{
public:
   MyFxBookOrder  *operator[](int i) { return this.At(i); }
   bool           load_csv(string file_name, string filter_symbol=NULL);
};
bool MyFxBookOrderArray::load_csv(string file_name, string filter_symbol=NULL) {
   CFile f;
   if (f.Open(file_name, FILE_READ|FILE_CSV, ',') == INVALID_HANDLE)
      return false;
   int file_handle = f.Handle();
   while (!f.IsEnding()) {
      MyFxBookOrder *order = new MyFxBookOrder();
      order.open_time = FileReadDatetime(file_handle);
      order.symbol = FileReadString(file_handle);
      order.type = FileReadString(file_handle);
      order.lots = FileReadNumber(file_handle);
      order.price = FileReadNumber(file_handle);
      order.stoploss = FileReadNumber(file_handle);
      if (filter_symbol == NULL || filter_symbol == order.symbol) {
         if (!this.Add(order))
            return false;
      }  else {
         delete order;
      }
   }
   return true;
}



void OnStart()
{
   MyFxBookOrderArray orders;
   if (orders.load_csv("Myfxbookdata.csv", _Symbol)) {
      for (int i=0; i<orders.Total(); i++) {
         MyFxBookOrder *order = orders[i];
         printf("index[%d], bar=%d, time=%s, lots=%.2f",
            i, order.bar(), TimeToString(order.open_time), order.lots
         );
      }
   }
}

//+-----------------------+
//| Working with settings |
//|+----------------------+
bool QCPositionSizeCalculator::SaveSettingsOnDisk()
{         Print("Trying to save settings to file: " + m_FileName + ".");
          int fh;
          fh = FileOpen(m_FileName, FILE_CSV | FILE_WRITE);
          if (fh == INVALID_HANDLE)
          {         Print("Failed to open file for writing: " + m_FileName + ". Error: " + IntegerToString(GetLastError()));
                    return false; }
// ct_Order does not matter.
          FileWrite(fh, "EntryType");
          FileWrite(fh, IntegerToString(sets.EntryType));
          FileWrite(fh, "EntryLevel");
          FileWrite(fh, DoubleToString(sets.EntryLevel, _Digits));
          FileWrite(fh, "StopLossLevel");
          FileWrite(fh, DoubleToString(sets.StopLossLevel, _Digits));
          FileWrite(fh, "TakeProfitLevel");
          FileWrite(fh, DoubleToString(sets.TakeProfitLevel, _Digits));
          FileWrite(fh, "Risk");
          FileWrite(fh, DoubleToString(sets.Risk, 2));
          FileWrite(fh, "MoneyRisk");
          FileWrite(fh, DoubleToString(sets.MoneyRisk, 2));
          FileWrite(fh, "CommissionPerLot");
          FileWrite(fh, DoubleToString(sets.CommissionPerLot, 2));
          FileWrite(fh, "CustomBalance");
          FileWrite(fh, DoubleToString(sets.CustomBalance, 2));
          FileWrite(fh, "UseMoneyInsteadOfPercentage");
          FileWrite(fh, IntegerToString(sets.UseMoneyInsteadOfPercentage));
          FileWrite(fh, "RiskFromPositionSize");
          FileWrite(fh, IntegerToString(sets.RiskFromPositionSize));
          if (sets.RiskFromPositionSize)
          {         FileWrite(fh, "PositionSize");
                    FileWrite(fh, DoubleToString(sets.PositionSize, LotStep_digits)); }
          FileWrite(fh, "AccountButton");
          FileWrite(fh, IntegerToString(sets.AccountButton));
          FileWrite(fh, "CountPendingOrders");
          FileWrite(fh, IntegerToString(sets.CountPendingOrders));
          FileWrite(fh, "IgnoreOrdersWithoutStopLoss");
          FileWrite(fh, IntegerToString(sets.IgnoreOrdersWithoutStopLoss));
          FileWrite(fh, "IgnoreOtherSymbols");
          FileWrite(fh, IntegerToString(sets.IgnoreOtherSymbols));
          FileWrite(fh, "ShowLines");
          FileWrite(fh, IntegerToString(sets.ShowLines));
          FileWrite(fh, "SelectedTab");
          FileWrite(fh, IntegerToString(sets.SelectedTab));
          FileWrite(fh, "CustomLeverage");
          FileWrite(fh, IntegerToString(sets.CustomLeverage));
          FileWrite(fh, "MagicNumber");
          FileWrite(fh, IntegerToString(sets.MagicNumber));
          FileWrite(fh, "ScriptCommentary");
          FileWrite(fh, sets.ScriptCommentary);
          FileWrite(fh, "DisableTradingWhenLinesAreHidden");
          FileWrite(fh, IntegerToString(sets.DisableTradingWhenLinesAreHidden));
// Multiple TPs in use.
          if (ScriptTakePorfitsNumber > 1)
          {         for (int i = 0; i < ScriptTakePorfitsNumber; i++)
                    {         FileWrite(fh, "ScriptTP_" + IntegerToString(i));
                              FileWrite(fh, DoubleToString(sets.ScriptTP[i], _Digits));
                              FileWrite(fh, "ScriptTPShare_" + IntegerToString(i));
                              FileWrite(fh, IntegerToString(sets.ScriptTPShare[i])); } }
          FileWrite(fh, "MaxSlippage");
          FileWrite(fh, IntegerToString(sets.MaxSlippage));
          FileWrite(fh, "MaxSpread");
          FileWrite(fh, IntegerToString(sets.MaxSpread));
          FileWrite(fh, "MaxEntrySLDistance");
          FileWrite(fh, IntegerToString(sets.MaxEntrySLDistance));
          FileWrite(fh, "MinEntrySLDistance");
          FileWrite(fh, IntegerToString(sets.MinEntrySLDistance));
          FileWrite(fh, "MaxPositionSize");
          FileWrite(fh, DoubleToString(sets.MaxPositionSize, LotStep_digits));
          FileWrite(fh, "StopLoss");
          FileWrite(fh, IntegerToString(sets.StopLoss));
          FileWrite(fh, "TakeProfit");
          FileWrite(fh, IntegerToString(sets.TakeProfit));
          FileWrite(fh, "TradeDirection");
          FileWrite(fh, IntegerToString(sets.TradeDirection));
          FileWrite(fh, "SubtractPositions");
          FileWrite(fh, IntegerToString(sets.SubtractPositions));
          FileWrite(fh, "SubtractPendingOrders");
          FileWrite(fh, IntegerToString(sets.SubtractPendingOrders));
          FileWrite(fh, "ATRPeriod");
          FileWrite(fh, IntegerToString(sets.ATRPeriod));
          FileWrite(fh, "ATRMultiplierSL");
          FileWrite(fh, DoubleToString(sets.ATRMultiplierSL, 2));
          FileWrite(fh, "ATRMultiplierTP");
          FileWrite(fh, DoubleToString(sets.ATRMultiplierTP, 2));
          FileWrite(fh, "ATRTimeframe");
          FileWrite(fh, IntegerToString(sets.ATRTimeframe));
          FileWrite(fh, "WasSelectedEntryLine");
          FileWrite(fh, IntegerToString(sets.WasSelectedEntryLine));
          FileWrite(fh, "WasSelectedStopLossLine");
          FileWrite(fh, IntegerToString(sets.WasSelectedStopLossLine));
          FileWrite(fh, "WasSelectedTakeProfitLine");
          FileWrite(fh, IntegerToString(sets.WasSelectedTakeProfitLine));
// Multiple TPs in use.
          if (ScriptTakePorfitsNumber > 1)
          {         for (int i = 0; i < ScriptTakePorfitsNumber - 1; i++)
                    {         FileWrite(fh, "WasSelectedAdditionalTakeProfitLine_" + IntegerToString(i));
                              FileWrite(fh, IntegerToString(sets.WasSelectedAdditionalTakeProfitLine[i])); } }
          FileWrite(fh, "DoNotApplyStopLoss");
          FileWrite(fh, IntegerToString(sets.DoNotApplyStopLoss));
          FileWrite(fh, "DoNotApplyTakeProfit");
          FileWrite(fh, IntegerToString(sets.DoNotApplyTakeProfit));
          FileWrite(fh, "AskForConfirmation");
          FileWrite(fh, IntegerToString(sets.AskForConfirmation));
          FileWrite(fh, "IsPanelMinimized");
          FileWrite(fh, IntegerToString(sets.IsPanelMinimized));
          FileWrite(fh, "TPLockedOnSL");
          FileWrite(fh, IntegerToString(sets.TPLockedOnSL));
// These are not part of settings but are panel-related input parameters.
// When indicator is reloaded due to its input parameters change, these should be compared to the new values.
// If the value is changed, it should be updated in the panel too.
// Is indicator reloading due to the input parameters change?
          if (GlobalVariableGet("PSC-" + IntegerToString(ChartID()) + "-Parameters") > 0)
          {         FileWrite(fh, "Parameter_DefaultTradeDirection");
                    FileWrite(fh, IntegerToString(DefaultTradeDirection));
                    FileWrite(fh, "Parameter_DefaultSL");
                    FileWrite(fh, IntegerToString(DefaultSL));
                    FileWrite(fh, "Parameter_DefaultTP");
                    FileWrite(fh, IntegerToString(DefaultTP));
                    FileWrite(fh, "Parameter_DefaultShowLines");
                    FileWrite(fh, IntegerToString(DefaultShowLines));
                    FileWrite(fh, "Parameter_DefaultLinesSelected");
                    FileWrite(fh, IntegerToString(DefaultLinesSelected));
                    FileWrite(fh, "Parameter_DefaultATRPeriod");
                    FileWrite(fh, IntegerToString(DefaultATRPeriod));
                    FileWrite(fh, "Parameter_DefaultATRMultiplierSL");
                    FileWrite(fh, DoubleToString(DefaultATRMultiplierSL, 2));
                    FileWrite(fh, "Parameter_DefaultATRMultiplierTP");
                    FileWrite(fh, DoubleToString(DefaultATRMultiplierTP, 2));
                    FileWrite(fh, "Parameter_DefaultATRTimeframe");
                    FileWrite(fh, IntegerToString(DefaultATRTimeframe));
                    FileWrite(fh, "Parameter_DefaultEntryType");
                    FileWrite(fh, IntegerToString(DefaultEntryType));
                    FileWrite(fh, "Parameter_DefaultCommission");
                    FileWrite(fh, DoubleToString(DefaultCommission, 2));
                    FileWrite(fh, "Parameter_DefaultAccountButton");
                    FileWrite(fh, IntegerToString(DefaultAccountButton));
                    FileWrite(fh, "Parameter_CustomBalance");
                    FileWrite(fh, DoubleToString(CustomBalance));
                    FileWrite(fh, "Parameter_DefaultRisk");
                    FileWrite(fh, DoubleToString(DefaultRisk, 2));
                    FileWrite(fh, "Parameter_DefaultMoneyRisk");
                    FileWrite(fh, DoubleToString(DefaultMoneyRisk, 2));
                    FileWrite(fh, "Parameter_DefaultCountPendingOrders");
                    FileWrite(fh, IntegerToString(DefaultCountPendingOrders));
                    FileWrite(fh, "Parameter_DefaultIgnoreOrdersWithoutStopLoss");
                    FileWrite(fh, IntegerToString(DefaultIgnoreOrdersWithoutStopLoss));
                    FileWrite(fh, "Parameter_DefaultIgnoreOtherSymbols");
                    FileWrite(fh, IntegerToString(DefaultIgnoreOtherSymbols));
                    FileWrite(fh, "Parameter_DefaultCustomLeverage");
                    FileWrite(fh, IntegerToString(DefaultCustomLeverage));
                    FileWrite(fh, "Parameter_DefaultMagicNumber");
                    FileWrite(fh, IntegerToString(DefaultMagicNumber));
                    FileWrite(fh, "Parameter_DefaultCommentary");
                    FileWrite(fh, DefaultCommentary);
                    FileWrite(fh, "Parameter_DefaultDisableTradingWhenLinesAreHidden");
                    FileWrite(fh, IntegerToString(DefaultDisableTradingWhenLinesAreHidden));
                    FileWrite(fh, "Parameter_DefaultMaxSlippage");
                    FileWrite(fh, IntegerToString(DefaultMaxSlippage));
                    FileWrite(fh, "Parameter_DefaultMaxSpread");
                    FileWrite(fh, IntegerToString(DefaultMaxSpread));
                    FileWrite(fh, "Parameter_DefaultMaxEntrySLDistance");
                    FileWrite(fh, IntegerToString(DefaultMaxEntrySLDistance));
                    FileWrite(fh, "Parameter_DefaultMinEntrySLDistance");
                    FileWrite(fh, IntegerToString(DefaultMinEntrySLDistance));
                    FileWrite(fh, "Parameter_DefaultMaxPositionSize");
                    FileWrite(fh, DoubleToString(DefaultMaxPositionSize, 2));
                    FileWrite(fh, "Parameter_DefaultSubtractOPV");
                    FileWrite(fh, IntegerToString(DefaultSubtractOPV));
                    FileWrite(fh, "Parameter_DefaultSubtractPOV");
                    FileWrite(fh, IntegerToString(DefaultSubtractPOV));
                    FileWrite(fh, "Parameter_DefaultDoNotApplyStopLoss");
                    FileWrite(fh, IntegerToString(DefaultDoNotApplyStopLoss));
                    FileWrite(fh, "Parameter_DefaultDoNotApplyTakeProfit");
                    FileWrite(fh, IntegerToString(DefaultDoNotApplyTakeProfit));
                    FileWrite(fh, "Parameter_DefaultAskForConfirmation");
                    FileWrite(fh, IntegerToString(DefaultAskForConfirmation));
                    FileWrite(fh, "Parameter_DefaultPanelPositionCorner");
                    FileWrite(fh, IntegerToString(DefaultPanelPositionCorner));
                    FileWrite(fh, "Parameter_DefaultPanelPositionX");
                    FileWrite(fh, IntegerToString(DefaultPanelPositionX));
                    FileWrite(fh, "Parameter_DefaultPanelPositionY");
                    FileWrite(fh, IntegerToString(DefaultPanelPositionY));
                    FileWrite(fh, "Parameter_DefaultTPLockedOnSL");
                    FileWrite(fh, IntegerToString(DefaultTPLockedOnSL));
                    // Not a part of sets, but needed for proper deletion of unnecessary additional TP lines.
                    FileWrite(fh, "Parameter_ScriptTakePorfitsNumber");
                    FileWrite(fh, IntegerToString(ScriptTakePorfitsNumber)); }
          FileClose(fh);
          Print("Saved settings successfully.");
          return true; }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool QCPositionSizeCalculator::LoadSettingsFromDisk()
{         Print("Trying to load settings from file.");
          if (!FileIsExist(m_FileName))
          {         Print("No settings file to load.");
                    return false; }
          int fh;
          fh = FileOpen(m_FileName, FILE_CSV | FILE_READ);
          if (fh == INVALID_HANDLE)
          {         Print("Failed to open file for reading: " + m_FileName + ". Error: " + IntegerToString(GetLastError()));
                    return false; }
          while (!FileIsEnding(fh))
          {         string var_name = FileReadString(fh);
                    string var_content = FileReadString(fh);
                    if (var_name == "EntryType")
                              sets.EntryType = (ENTRY_TYPE)StringToInteger(var_content);
                    else if (var_name == "EntryLevel")
                              sets.EntryLevel = StringToDouble(var_content);
                    else if (var_name == "StopLossLevel")
                              sets.StopLossLevel = StringToDouble(var_content);
                    else if (var_name == "TakeProfitLevel")
                              sets.TakeProfitLevel = StringToDouble(var_content);
                    else if (var_name == "Risk")
                              sets.Risk = StringToDouble(var_content);
                    else if (var_name == "MoneyRisk")
                              sets.MoneyRisk = StringToDouble(var_content);
                    else if (var_name == "CommissionPerLot")
                              sets.CommissionPerLot = StringToDouble(var_content);
                    else if (var_name == "CustomBalance")
                              sets.CustomBalance = StringToDouble(var_content);
                    else if (var_name == "UseMoneyInsteadOfPercentage")
                              sets.UseMoneyInsteadOfPercentage = (bool)StringToInteger(var_content);
                    else if (var_name == "RiskFromPositionSize")
                              sets.RiskFromPositionSize = (bool)StringToInteger(var_content);
                    else if ((var_name == "PositionSize") && (sets.RiskFromPositionSize))
                    {         sets.PositionSize = StringToDouble(var_content);
                              OutputPositionSize = sets.PositionSize; }
                    else if (var_name == "AccountButton")
                              sets.AccountButton = (ACCOUNT_BUTTON)StringToInteger(var_content);
                    else if (var_name == "CountPendingOrders")
                              sets.CountPendingOrders = (bool)StringToInteger(var_content);
                    else if (var_name == "IgnoreOrdersWithoutStopLoss")
                              sets.IgnoreOrdersWithoutStopLoss = (bool)StringToInteger(var_content);
                    else if (var_name == "IgnoreOtherSymbols")
                              sets.IgnoreOtherSymbols = (bool)StringToInteger(var_content);
                    else if (var_name == "ShowLines")
                              sets.ShowLines = (bool)StringToInteger(var_content);
                    else if (var_name == "SelectedTab")
                              sets.SelectedTab = (TABS)StringToInteger(var_content);
                    else if (var_name == "CustomLeverage")
                              sets.CustomLeverage = (int)StringToInteger(var_content);
                    else if (var_name == "MagicNumber")
                              sets.MagicNumber = (int)StringToInteger(var_content);
                    else if (var_name == "ScriptCommentary")
                              sets.ScriptCommentary = var_content;
                    else if (var_name == "DisableTradingWhenLinesAreHidden")
                              sets.DisableTradingWhenLinesAreHidden = (bool)StringToInteger(var_content);
                    // Multiple TPs.
                    else if ((ScriptTakePorfitsNumber > 1) && (StringSubstr(var_name, 0, 9) == "ScriptTP_"))
                    {         int i = (int)StringToInteger(StringSubstr(var_name, 9)); // This TP's number.
                              if (i > ScriptTakePorfitsNumber - 1) continue; // Cannot accommodate so many.
                              sets.ScriptTP[i] = StringToDouble(var_content); }
                    else if ((ScriptTakePorfitsNumber > 1) && (StringSubstr(var_name, 0, 14) == "ScriptTPShare_"))
                    {         int i = (int)StringToInteger(StringSubstr(var_name, 14)); // This TP Share's number.
                              if (i > ScriptTakePorfitsNumber - 1) continue; // Cannot accommodate so many.
                              sets.ScriptTPShare[i] = (int)StringToInteger(var_content); }
                    else if (var_name == "MaxSlippage")
                              sets.MaxSlippage = (int)StringToInteger(var_content);
                    else if (var_name == "MaxSpread")
                              sets.MaxSpread = (int)StringToInteger(var_content);
                    else if (var_name == "MaxEntrySLDistance")
                              sets.MaxEntrySLDistance = (int)StringToInteger(var_content);
                    else if (var_name == "MinEntrySLDistance")
                              sets.MinEntrySLDistance = (int)StringToInteger(var_content);
                    else if (var_name == "MaxPositionSize")
                              sets.MaxPositionSize = StringToDouble(var_content);
                    else if (var_name == "TradeDirection")
                              sets.TradeDirection = (TRADE_DIRECTION)StringToInteger(var_content);
                    else if (var_name == "StopLoss")
                              sets.StopLoss = (int)StringToInteger(var_content);
                    else if (var_name == "TakeProfit")
                              sets.TakeProfit = (int)StringToInteger(var_content);
                    else if (var_name == "SubtractPositions")
                              sets.SubtractPositions = (bool)StringToInteger(var_content);
                    else if (var_name == "SubtractPendingOrders")
                              sets.SubtractPendingOrders = (bool)StringToInteger(var_content);
                    else if (var_name == "ATRPeriod")
                              sets.ATRPeriod = (int)StringToInteger(var_content);
                    else if (var_name == "ATRMultiplierSL")
                              sets.ATRMultiplierSL = StringToDouble(var_content);
                    else if (var_name == "ATRMultiplierTP")
                              sets.ATRMultiplierTP = StringToDouble(var_content);
                    else if (var_name == "ATRTimeframe")
                              sets.ATRTimeframe = (ENUM_TIMEFRAMES)StringToInteger(var_content);
                    else if (var_name == "WasSelectedEntryLine")
                              sets.WasSelectedEntryLine = (bool)StringToInteger(var_content);
                    else if (var_name == "WasSelectedStopLossLine")
                              sets.WasSelectedStopLossLine = (bool)StringToInteger(var_content);
                    else if (var_name == "WasSelectedTakeProfitLine")
                              sets.WasSelectedTakeProfitLine = (bool)StringToInteger(var_content);
                    // Multiple TPs.
                    else if ((ScriptTakePorfitsNumber > 1) && (StringSubstr(var_name, 0, 36) == "WasSelectedAdditionalTakeProfitLine_"))
                    {         int i = (int)StringToInteger(StringSubstr(var_name, 36)); // This TP's number.
                              if (i > ScriptTakePorfitsNumber - 2) continue; // Cannot accommodate so many.
                              sets.WasSelectedAdditionalTakeProfitLine[i] = StringToInteger(var_content); }
                    else if (var_name == "DoNotApplyStopLoss")
                              sets.DoNotApplyStopLoss = (bool)StringToInteger(var_content);
                    else if (var_name == "DoNotApplyTakeProfit")
                              sets.DoNotApplyTakeProfit = (bool)StringToInteger(var_content);
                    else if (var_name == "AskForConfirmation")
                              sets.AskForConfirmation = (bool)StringToInteger(var_content);
                    else if (var_name == "IsPanelMinimized")
                              sets.IsPanelMinimized = (bool)StringToInteger(var_content);
                    else if (var_name == "TPLockedOnSL")
                              sets.TPLockedOnSL = (bool)StringToInteger(var_content);
                    // Is indicator reloading due to the input parameters change?
                    if (GlobalVariableGet("PSC-" + IntegerToString(ChartID()) + "-Parameters") > 0)
                    {         // These are not part of settings but are panel-related input parameters.
                              // When indicator is reloaded due to its input parameters change, these should be compared to the new values.
                              // If the value is changed, it should be updated in the panel too.
                              if (var_name == "Parameter_DefaultTradeDirection")
                              {         if ((TRADE_DIRECTION)StringToInteger(var_content) != DefaultTradeDirection) sets.TradeDirection = DefaultTradeDirection; }
                              else if (var_name == "Parameter_DefaultShowLines")
                              {         if ((bool)StringToInteger(var_content) != DefaultShowLines) sets.ShowLines = DefaultShowLines; }
                              else if (var_name == "Parameter_DefaultSL")
                              {         if (StringToInteger(var_content) != DefaultSL)
                                        {         // Will be set to actual value via Initialization().
                                                  sets.StopLossLevel = 0;
                                                  sets.StopLoss = 0; } }
                              else if (var_name == "Parameter_DefaultTP")
                              {         if (StringToInteger(var_content) != DefaultTP)
                                        {         // Will be set to actual value via Initialization().
                                                  sets.TakeProfitLevel = 0;
                                                  sets.TakeProfit = 0; } }
                              else if (var_name == "Parameter_DefaultLinesSelected")
                              {         if ((bool)StringToInteger(var_content) != DefaultLinesSelected)
                                        {         if (DefaultLinesSelected) LinesSelectedStatus = 1; // Flip lines to selected.
                                                  else LinesSelectedStatus = 2; // Flip lines to unselected.
                                                  // Actual flipping happens inside Initialization() function.
                                        }
                                        else LinesSelectedStatus = 0; // No change.
                              }
                              else if (var_name == "Parameter_DefaultATRPeriod")
                              {         if (StringToInteger(var_content) != DefaultATRPeriod) sets.ATRPeriod = DefaultATRPeriod; }
                              else if (var_name == "Parameter_DefaultATRMultiplierSL")
                              {         if (StringToDouble(var_content) != DefaultATRMultiplierSL) sets.ATRMultiplierSL = DefaultATRMultiplierSL; }
                              else if (var_name == "Parameter_DefaultATRMultiplierTP")
                              {         if (StringToDouble(var_content) != DefaultATRMultiplierTP) sets.ATRMultiplierTP = DefaultATRMultiplierTP; }
                              else if (var_name == "Parameter_DefaultATRTimeframe")
                              {         if ((ENUM_TIMEFRAMES)StringToInteger(var_content) != DefaultATRTimeframe) sets.ATRTimeframe = DefaultATRTimeframe; }
                              else if (var_name == "Parameter_DefaultEntryType")
                              {         if ((ENTRY_TYPE)StringToInteger(var_content) != DefaultEntryType) sets.EntryType = DefaultEntryType; }
                              else if (var_name == "Parameter_DefaultCommission")
                              {         if (StringToDouble(var_content) != DefaultCommission) sets.CommissionPerLot = DefaultCommission; }
                              else if (var_name == "Parameter_DefaultAccountButton")
                              {         if ((ACCOUNT_BUTTON)StringToInteger(var_content) != DefaultAccountButton) sets.AccountButton = DefaultAccountButton; }
                              else if (var_name == "Parameter_CustomBalance")
                              {         if (StringToDouble(var_content) != CustomBalance) sets.CustomBalance = CustomBalance; }
                              else if (var_name == "Parameter_DefaultRisk")
                              {         if (StringToDouble(var_content) != DefaultRisk) sets.Risk = DefaultRisk; }
                              else if (var_name == "Parameter_DefaultMoneyRisk")
                              {         if ((StringToDouble(var_content) != DefaultMoneyRisk) && (DefaultMoneyRisk > 0))
                                        {         sets.MoneyRisk = DefaultMoneyRisk;
                                                  sets.UseMoneyInsteadOfPercentage = true; }
                                        else sets.UseMoneyInsteadOfPercentage = false; }
                              else if (var_name == "Parameter_DefaultCountPendingOrders")
                              {         if ((bool)StringToInteger(var_content) != DefaultCountPendingOrders) sets.CountPendingOrders = DefaultCountPendingOrders; }
                              else if (var_name == "Parameter_DefaultIgnoreOrdersWithoutStopLoss")
                              {         if ((bool)StringToInteger(var_content) != DefaultIgnoreOrdersWithoutStopLoss) sets.IgnoreOrdersWithoutStopLoss = DefaultIgnoreOrdersWithoutStopLoss; }
                              else if (var_name == "Parameter_DefaultIgnoreOtherSymbols")
                              {         if ((bool)StringToInteger(var_content) != DefaultIgnoreOtherSymbols) sets.IgnoreOtherSymbols = DefaultIgnoreOtherSymbols; }
                              else if (var_name == "Parameter_DefaultCustomLeverage")
                              {         if (StringToInteger(var_content) != DefaultCustomLeverage) sets.CustomLeverage = DefaultCustomLeverage; }
                              else if (var_name == "Parameter_DefaultMagicNumber")
                              {         if (StringToInteger(var_content) != DefaultMagicNumber) sets.MagicNumber = DefaultMagicNumber; }
                              else if (var_name == "Parameter_DefaultCommentary")
                              {         if (var_content != DefaultCommentary) sets.ScriptCommentary = DefaultCommentary; }
                              else if (var_name == "Parameter_DefaultDisableTradingWhenLinesAreHidden")
                              {         if ((bool)StringToInteger(var_content) != DefaultDisableTradingWhenLinesAreHidden) sets.DisableTradingWhenLinesAreHidden = DefaultDisableTradingWhenLinesAreHidden; }
                              else if (var_name == "Parameter_DefaultMaxSlippage")
                              {         if (StringToInteger(var_content) != DefaultMaxSlippage) sets.MaxSlippage = DefaultMaxSlippage; }
                              else if (var_name == "Parameter_DefaultMaxSpread")
                              {         if (StringToInteger(var_content) != DefaultMaxSpread) sets.MaxSpread = DefaultMaxSpread; }
                              else if (var_name == "Parameter_DefaultMaxEntrySLDistance")
                              {         if (StringToInteger(var_content) != DefaultMaxEntrySLDistance) sets.MaxEntrySLDistance = DefaultMaxEntrySLDistance; }
                              else if (var_name == "Parameter_DefaultMinEntrySLDistance")
                              {         if (StringToInteger(var_content) != DefaultMinEntrySLDistance) sets.MinEntrySLDistance = DefaultMinEntrySLDistance; }
                              else if (var_name == "Parameter_DefaultMaxPositionSize")
                              {         if (StringToDouble(var_content) != DefaultMaxPositionSize) sets.MaxPositionSize = DefaultMaxPositionSize; }
                              else if (var_name == "Parameter_DefaultSubtractOPV")
                              {         if ((bool)StringToInteger(var_content) != DefaultSubtractOPV) sets.SubtractPositions = DefaultSubtractOPV; }
                              else if (var_name == "Parameter_DefaultSubtractPOV")
                              {         if ((bool)StringToInteger(var_content) != DefaultSubtractPOV) sets.SubtractPendingOrders = DefaultSubtractPOV; }
                              else if (var_name == "Parameter_DefaultDoNotApplyStopLoss")
                              {         if ((bool)StringToInteger(var_content) != DefaultDoNotApplyStopLoss) sets.DoNotApplyStopLoss = DefaultDoNotApplyStopLoss; }
                              else if (var_name == "Parameter_DefaultDoNotApplyTakeProfit")
                              {         if ((bool)StringToInteger(var_content) != DefaultDoNotApplyTakeProfit) sets.DoNotApplyTakeProfit = DefaultDoNotApplyTakeProfit; }
                              else if (var_name == "Parameter_DefaultAskForConfirmation")
                              {         if ((bool)StringToInteger(var_content) != DefaultAskForConfirmation) sets.AskForConfirmation = DefaultAskForConfirmation; }
                              // These three only trigger panel repositioning (default position changed via the input parameters deliberately).
                              else if (var_name == "Parameter_DefaultPanelPositionCorner")
                              {         if ((ENUM_BASE_CORNER)StringToInteger(var_content) != DefaultPanelPositionCorner) Dont_Move_the_Panel_to_Default_Corner_X_Y = false; }
                              else if (var_name == "Parameter_DefaultPanelPositionX")
                              {         if (StringToInteger(var_content) != DefaultPanelPositionX) Dont_Move_the_Panel_to_Default_Corner_X_Y = false; }
                              else if (var_name == "Parameter_DefaultPanelPositionY")
                              {         if (StringToInteger(var_content) != DefaultPanelPositionY) Dont_Move_the_Panel_to_Default_Corner_X_Y = false; }
                              else if (var_name == "Parameter_DefaultTPLockedOnSL")
                              {         if (StringToInteger(var_content) != DefaultTPLockedOnSL) sets.TPLockedOnSL = DefaultTPLockedOnSL; }
                              // Not a part of sets, but needed for proper deletion of unnecessary additional TP lines.
                              else if (var_name == "Parameter_ScriptTakePorfitsNumber")
                              {         if (StringToInteger(var_content) > ScriptTakePorfitsNumber) // Only if new input parameter value is lower, which means fewer TP lines.
                                        {         int old_STPN = (int)StringToInteger(var_content);
                                                  for (int i = old_STPN - 1; i >= ScriptTakePorfitsNumber; i--)
                                                            ObjectDelete(ChartID(), ObjectPrefix + "TakeProfitLine" + IntegerToString(i)); // Delete remaining additional TP lines.
                                        } } } }
          FileClose(fh);
          Print("Loaded settings successfully.");
// Is indicator reloading due to the input parameters change? Delete the flag variable.
          if (GlobalVariableGet("PSC-" + IntegerToString(ChartID()) + "-Parameters") > 0) GlobalVariableDel("PSC-" + IntegerToString(ChartID()) + "-Parameters");
          return true; }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool QCPositionSizeCalculator::DeleteSettingsFile()
{         if (!FileIsExist(m_FileName))
          {         Print("No settings file to delete.");
                    return false; }
          Print("Trying to delete settings file.");
          if (!FileDelete(m_FileName))
          {         Print("Failed to delete file: " + m_FileName + ". Error: " + IntegerToString(GetLastError()));
                    return false; }
          Print("Deleted settings file successfully.");
          return true; //
}

//+------------------------------------------------------------------+
*/
//+------------------------------------------------------------------+
