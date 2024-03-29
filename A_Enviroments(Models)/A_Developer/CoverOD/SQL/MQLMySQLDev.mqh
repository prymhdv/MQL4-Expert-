//+------------------------------------------------------------------+
//||   ||||||||||                     DataBase_SQL.mqh              ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOD\SQL\MQLMySQL_ClassForm.mqh>
//#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOD\SQL\MQLMySQL_FuncForm.mqh>
#property strict
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
struct Cd_MySql_Dev_DATAS
{         Cd_MySql_Dev_DATAS() {};
          ~Cd_MySql_Dev_DATAS() {};
          string pHost;
          string pUser;
          string pPassword;
          string pDatabase;
          int pPort;
          string pSocket;
          int pClientFlag;

};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class Cd_MySql_Dev : public Cd_MySql
{

public:
          Cd_MySql_Dev()  {Cd_MySql::SQLTrace = 1; };
          ~Cd_MySql_Dev() {};
          string name;
          int    ConnectionHandel;
          bool   IsExcuteed;
          string DescReadIni;
          string INI;
          Cd_MySql_Dev_DATAS DATAS;

          void SetData(string pHost, string pUser, string pPassword, string pDatabase, int pPort, string pSocket, int pClientFlag)
          {         DATAS.pHost                 = pHost;
                    DATAS.pUser                 = pUser;
                    DATAS.pPassword             = pPassword;
                    DATAS.pDatabase             = pDatabase;
                    DATAS.pPort                 = pPort ;
                    DATAS.pSocket               = pSocket ;
                    DATAS.pClientFlag           = pClientFlag;
                    //
          }
          void MainProgress(int ModeAct, string Exe, string TableName = "", string TableCMD = "")
          {         //
                    //Print("--------------------------------------------");
                    //Print("--------------------------------------------");
                    //Print("----------------Start MySql:----------------");
                    //Print("----------------Call_Version MySql:----------------");
                    //if(ModeAct == 0)Call_Version();
                    //Print("----------------Call_ReadIni MySql:----------------");
                    //if(ModeAct == 1)Call_ReadIni();//SetData("127.0.0.1", "root", "mt44", "mydb_MT4_Quartz", 3306, "0", 0);
                    //Print("----------------Call_Connect MySql:----------------");
                    //if(ModeAct == 1)Call_Connect();
                    //00MySqlExecute("CREATE TABLE `test_table` (id int, code varchar(50), start_date datetime)");
                    //00MySqlExecute("DELETE TABLE `test_table`");
                    //Print("----------------Call_Disconnect MySql:----------------");
                    //if(ModeAct == -1)Call_Disconnect();
                    //Print("----------------End MySql:----------------");
                    //Print("--------------------------------------------");
                    //Print("--------------------------------------------");
                    if(ModeAct == 0)    { Call_Version(); }
                    if(ModeAct == 1)    {Call_Disconnect();     Call_ReadIni();         Call_Connect(); }
                    if(ModeAct == 2)    {Call_Execute("CREATE TABLE `" + TableName + "` " + TableCMD);  } ///progress you want Create table  //"CREATE TABLE `test_table` (id int, code varchar(50), start_date datetime)"      (id int, code varchar(50), start_date datetime)"
                    if(ModeAct == -2)   {Call_Execute("DROP TABLE IF EXISTS `" + TableName + "`");      }///progress you want drop table //"DROP TABLE IF EXISTS `" + TableName + "`"
                    if(ModeAct == 3)    {Call_Execute("INSERT INTO `" + TableName + "`" + TableCMD);    }///progress you want select table   "INSERT INTO `test_table` (id, code, start_date) VALUES (1,\'EURUSD\',\'2014.01.01 00:00:01\');";
                    if(ModeAct == 5)    {Call_Execute(Exe);                                             }///progress you want select table
                    if(ModeAct == -1)   {Call_Disconnect();}
                    if(ModeAct == 11)
                    {         Call_Execute("DROP TABLE IF EXISTS `test_table`");
                              Call_Execute("CREATE TABLE `test_table` (id int, code varchar(50), start_date datetime)");//
                              Call_Execute("DROP TABLE IF EXISTS `test_table`");
                    }
                    //
          }
          void Call_ReadIni()                   { if(!ExtractINI())       {Print("__MYSQL__NOT READINI"); }}
          void Call_Connect()                   { ConnectionHandel        =       Connect(DATAS.pHost, DATAS.pUser, DATAS.pPassword, DATAS.pDatabase, DATAS.pPort, DATAS.pSocket, DATAS.pClientFlag); if(ConnectionHandel == -1) {Print("__MYSQL__NOT CONNECT"); }}
          void Call_Disconnect()                {                                 Disconnect(ConnectionHandel);}
          void Call_Version()                   {                                 Print(VersionX());}//--worked well
          void Call_Execute(string pQuery)      { IsExcuteed              =       Execute(ConnectionHandel, pQuery);   if(IsExcuteed) {Print("__MYSQL__NOT EXCUTE"); }}
          bool ExtractINI()
          {         //ReadIni("C:\\Users\\Quartz\\AppData\\Roaming\\MetaQuotes\\Terminal\\63603D13555081059CD774AC70BBC63B\\MQL4\\Experts\\MyConnection.ini", "MYSQL", "Server");
                    INI = TerminalInfoString(TERMINAL_DATA_PATH) + "\\MQL4\\Experts\\MyConnection.ini";// Print(__FUNCTION__, "   ", INI);//TERMINAL_PATH==  C:\Program Files (x86)\FIBO Group\MQL4\Experts\MyConnection.ini
                    // reading database credentials from INI file
                    DATAS.pHost         = GetReadIni(INI, "MYSQL", "Host");                             //"127.0.0.1"must install mysql app on win use server service from windows
                    DATAS.pUser         = GetReadIni(INI, "MYSQL", "User");                             //"root";    must install mysql app on win
                    DATAS.pPassword     = GetReadIni(INI, "MYSQL", "Password");                         //"mt44";    must install mysql app on win
                    DATAS.pDatabase     = GetReadIni(INI, "MYSQL", "Database");                         //"world";   must install mysql app on win
                    DATAS.pPort         = (int)StringToInteger(ReadIni(INI, "MYSQL", "Port"));          // 3306;     must install mysql app on win
                    DATAS.pSocket       = GetReadIni(INI, "MYSQL", "Socket");                           //"0";       must install mysql app on win
                    DATAS.pClientFlag   = (int)StringToInteger(ReadIni(INI, "MYSQL", "ClientFlag"));    //CLIENT_MULTI_STATEMENTS;   //ClientFlag = CLIENT_MULTI_STATEMENTS; //
                    return true;//
          }
          void test();
          void test2(); };



//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void Cd_MySql_Dev::test()
{         string Host, User, Password, Database, Socket; // database credentials
          int Port, ClientFlag;
          int DB; // database identifier
          Print (VersionX());
          //===================================================================================================
          INI = TerminalInfoString(TERMINAL_DATA_PATH) + "\\MQL4\\Experts\\MyConnection.ini";
          // reading database credentials from INI file
          Host = GetReadIni(INI, "MYSQL", "Host");
          User = GetReadIni(INI, "MYSQL", "User");
          Password = GetReadIni(INI, "MYSQL", "Password");
          Database = GetReadIni(INI, "MYSQL", "Database");
          Port     = (int)StringToInteger(GetReadIni(INI, "MYSQL", "Port"));
          Socket   = GetReadIni(INI, "MYSQL", "Socket");
          ClientFlag = CLIENT_MULTI_STATEMENTS; //(int)StringToInteger(ReadIni(INI, "MYSQL", "ClientFlag"));
          Print ("Host: ", Host, ", User: ", User, ", Database: ", Database);
          //===================================================================================================
          // open database connection
          Print ("Connecting...");
          DB =  Connect(Host, User, Password, Database, Port, Socket, ClientFlag);
          if (DB == -1) { Print ("Connection failed! Error: " + MySqlErrorDescription); }
          else { Print ("Connected! DBID#", DB);}
          //===================================================================================================
          {         string Query;
                    Query = "DROP TABLE IF EXISTS `test_table`";
                    Execute(DB, Query);
                    Query = "CREATE TABLE `test_table` (id int, code varchar(50), start_date datetime)";
                    if ( Execute(DB, Query))
                    {         Print ("Table `test_table` created.");
                              // Inserting data 1 row
                              Query = "INSERT INTO `test_table` (id, code, start_date) VALUES (" + (string)AccountInfoInteger(ACCOUNT_LOGIN) + ",\'ACCOUNT\',\'" + TimeToString(TimeLocal(), TIME_DATE | TIME_SECONDS) + "\')";
                              if ( Execute(DB, Query))
                              {         Print ("Succeeded: ", Query); //
                              }
                              else
                              {         Print ("Error: ", MySqlErrorDescription);
                                        Print ("Query: ", Query); //
                              }
                              // multi-insert
                              Query =  "INSERT INTO `test_table` (id, code, start_date) VALUES (1,\'EURUSD\',\'2014.01.01 00:00:01\');";
                              Query += "INSERT INTO `test_table` (id, code, start_date) VALUES (2,\'EURJPY\',\'2014.01.02 00:02:00\');";
                              Query += "INSERT INTO `test_table` (id, code, start_date) VALUES (3,\'USDJPY\',\'2014.01.03 03:00:00\');";
                              if ( Execute(DB, Query))
                              {         Print ("Succeeded! 3 rows has been inserted by one query."); //
                              }
                              else
                              {         Print ("Error of multiple statements: ", MySqlErrorDescription); //
                              } //
                    }
                    else
                    {         Print ("Table `test_table` cannot be created. Error: ", MySqlErrorDescription);//
                    }//
          }
          //===================================================================================================
          {         // executing SELECT statement
                    string Query;
                    int    i, Cursor, Rows;
                    int      vId;
                    string   vCode;
                    datetime vStartTime;
                    Query = "SELECT id, code, start_date FROM `test_table`";
                    Print ("SQL> ", Query);
                    Cursor =  CursorOpen(DB, Query);
                    if (Cursor >= 0)
                    {         Rows =  CursorRows(Cursor);
                              Print (Rows, " row(s) selected.");
                              //Print ("Rows affected: ",  RowsAffected(DB)); // just to compare with MySqlCursorRows
                              for (i = 0; i < Rows; i++)
                                        if ( CursorFetchRow(Cursor))
                                        {         vId =  GetFieldAsInt(Cursor, 0); // id
                                                  vCode =  GetFieldAsString(Cursor, 1); // code
                                                  vStartTime =  GetFieldAsDatetime(Cursor, 2); // start_time
                                                  Print ("ROW[", i, "]: id = ", vId, ", code = ", vCode, ", start_time = ", TimeToStr(vStartTime, TIME_DATE | TIME_SECONDS)); //
                                        }
                              CursorClose(Cursor); // NEVER FORGET TO CLOSE CURSOR !!!
                    }
                    else
                    {         Print ("Cursor opening failed. Error: ", MySqlErrorDescription); } //
          }
          //===================================================================================================
          {         string Query;
                    int Cursor1, Cursor2, Cursor3, Cursor4;
                    Query = "SELECT * FROM `test_table` LIMIT 1";
                    Cursor1 =  CursorOpen(DB, Query);
                    if (Cursor1 >= 0) {Print ("Cursor 1 was opened.");}
                    else {Print ("Cursor 1 failed. Error: ", MySqlErrorDescription);}
                    Cursor2 =  CursorOpen(DB, Query);
                    if (Cursor2 >= 0) {Print ("Cursor 2 was opened.");}
                    else {Print ("Cursor 2 failed. Error: ", MySqlErrorDescription);}
                    Cursor3 =  CursorOpen(DB, Query);
                    if (Cursor3 >= 0) {Print ("Cursor 3 was opened.");}
                    else {Print ("Cursor 3 failed. Error: ", MySqlErrorDescription);}
                    Cursor4 =  CursorOpen(DB, Query);
                    if (Cursor4 >= 0) {Print ("Cursor 4 was opened.");}
                    else {Print ("Cursor 4 failed. Error: ", MySqlErrorDescription);}
                    Print ("Closing cursors...");
                    CursorClose(Cursor1);
                    CursorClose(Cursor2);
                    CursorClose(Cursor3);
                    CursorClose(Cursor4);
                    Print ("Passed!");//
          }
          //===================================================================================================
          Disconnect(DB);
          Print ("Disconnected. Script done!");//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Cd_MySql_Dev::test2()
{         string Host, User, Password, Database, Socket; // database credentials
          int Port, ClientFlag;
          int DB; // database identifier
          Print (VersionX());
          INI = TerminalInfoString(TERMINAL_PATH) + "\\MQL4\\Experts\\MyConnection.ini";
          // reading database credentials from INI file
          Host = GetReadIni(INI, "MYSQL", "Host");
          User = GetReadIni(INI, "MYSQL", "User");
          Password = GetReadIni(INI, "MYSQL", "Password");
          Database = GetReadIni(INI, "MYSQL", "Database");
          Port     = (int)StringToInteger(GetReadIni(INI, "MYSQL", "Port"));
          Socket   = GetReadIni(INI, "MYSQL", "Socket");
          ClientFlag = (int)StringToInteger(GetReadIni(INI, "MYSQL", "ClientFlag"));
          Print ("Host: ", Host, ", User: ", User, ", Database: ", Database);
          // open database connection
          Print ("Connecting...");
          DB =  Connect(Host, User, Password, Database, Port, Socket, ClientFlag);
          if (DB == -1) { Print ("Connection failed! Error: " + MySqlErrorDescription); return; }
          else { Print ("Connected! DBID#", DB);}
          // executing SELECT statement
          string Query;
          int    i, Cursor, Rows;
          int      vId;
          string   vCode;
          datetime vStartTime;
          Query = "SELECT id, code, start_date FROM `test_table`";
          Print ("SQL> ", Query);
          Cursor =   CursorOpen(DB, Query);
          if (Cursor >= 0)
          {         Rows =   CursorRows(Cursor);
                    Print (Rows, " row(s) selected.");
                    for (i = 0; i < Rows; i++)
                              if (  CursorFetchRow(Cursor))
                              {         vId =   GetFieldAsInt(Cursor, 0); // id
                                        vCode =  GetFieldAsString(Cursor, 1); // code
                                        vStartTime =   GetFieldAsDatetime(Cursor, 2); // start_time
                                        Print ("ROW[", i, "]: id = ", vId, ", code = ", vCode, ", start_time = ", TimeToString(vStartTime, TIME_DATE | TIME_SECONDS)); //
                              }
                    CursorClose(Cursor); // NEVER FORGET TO CLOSE CURSOR !!!
          }
          else
          {         Print ("Cursor opening failed. Error: ", MySqlErrorDescription); }
          Disconnect(DB);
          Print ("Disconnected. Script done!"); //
}
//+------------------------------------------------------------------+
/*

v// Preparing a SQL query to insert data (3 rows in one query)
string SQL;
SQL = "INSERT INTO EURUSD(Ask,Bid) VALUES (1.3601,1.3632);";
SQL = SQL + "INSERT INTO EURUSD(Ask,Bid) VALUES (1.3621,1.3643);";
SQL = SQL + "INSERT INTO EURUSD(Ask,Bid) VALUES (1.3605,1.3629);";






*/
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
