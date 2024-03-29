//+------------------------------------------------------------------+
//||   ||||||||||            tMqlAccount.mqh                        ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    |||
//|||  ||   |||||             Email: @prymhdvgmail.com             ||| tMqlAccount 0 errors, 0 warnings, 1 msec elapsed           1         1
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class St_MqlAccount
{         /* =========================================================================================================================================
          * Account Information
          * Functions that return parameters of the current account.
          * =========================================================================================================================================
          * Function      Action
          * =========================================================================================================================================
          * AccountInfoDouble             Returns a value of double type of the corresponding account property  double  AccountInfoDouble( int  property_id );
          * AccountInfoInteger            Returns a value of integer type (bool, int or long) of                long    AccountInfoInteger( int  property_id );
          *                               the corresponding account property
          * AccountInfoString             Returns a value string type corresponding account property            string  AccountInfoString(int  property_id );
          * AccountBalance                Returns balance value of the current account                          double  AccountBalance();
          * AccountCredit                 Returns credit value of the current account                           double  AccountCredit();
          * AccountCompany                Returns the brokerage company name where the current                  string  AccountCompany();
          *                               account was registered
          * AccountCurrency               Returns currency name of the current account                          string  AccountCurrency();
          * AccountEquity                 Returns equity value of the current account                           double  AccountEquity();
          * AccountFreeMargin             Returns free margin value of the current account                      double  AccountFreeMargin();
          * AccountFreeMarginCheck        Returns free margin that remains after the specified position has     double  AccountFreeMarginCheck( string  symbol, int cmd, double  volume );
          *                               been opened at the current price on the current account
          * AccountFreeMarginMode         Calculation mode of free margin allowed to open orders on             double  AccountFreeMarginMode();
          *                               the current account
          * AccountLeverage               Returns leverage of the current account                               int  AccountLeverage();
          * AccountMargin                 Returns margin value of the current account                           double  AccountMargin();
          * AccountName                   Returns the current account name                                      string  AccountName();
          * AccountNumber                 Returns the current account number                                    int  AccountNumber();
          * AccountProfit                 Returns profit value of the current account                           double  AccountProfit();
          * AccountServer                 Returns the connected server name                                     string  AccountServer();
          * AccountStopoutLevel           Returns the value of the Stop Out level                               int  AccountStopoutLevel();
          * AccountStopoutMode            Returns the calculation mode for the Stop Out level                   int  AccountStopoutMode();
          * ========================================================================================================================================
          * ENUM_ACCOUNT_INFO_DOUBLE
          * Identifier                    Description                                             Type
          * ========================================================================================================================================
          * ACCOUNT_BALANCE               Account balance in the deposit currency                 double
          * ACCOUNT_CREDIT                Account credit in the deposit currency                  double
          * ACCOUNT_PROFIT                Current profit of an account in the deposit currency    double
          * ACCOUNT_EQUITY                Account equity in the deposit currency                  double
          * ACCOUNT_MARGIN                Account margin used in the deposit currency             double
          * ACCOUNT_MARGIN_FREE           Free margin of an account in the deposit currency       double
          * ACCOUNT_MARGIN_LEVEL          Account margin level in percents                        double
          * ACCOUNT_MARGIN_SO_CALL        Margin call level. Depending on the set
          *                               ACCOUNT_MARGIN_SO_MODE is expressed in percents or
          *                               in the deposit currency                                 double
          * ACCOUNT_MARGIN_SO_SO          Margin stop out level. Depending on the set
          *                               ACCOUNT_MARGIN_SO_MODE is expressed in percents or
          *                               in the deposit currency                                 double
          * ACCOUNT_MARGIN_INITIAL        Not supported                                           double
          * ACCOUNT_MARGIN_MAINTENANCE    Not supported                                           double
          * ACCOUNT_ASSETS                Not supported                                           double
          * ACCOUNT_LIABILITIES           Not supported                                           double
          * ACCOUNT_COMMISSION_BLOCKED    Not supported                                           double
          * ========================================================================================================================================
          * ENUM_ACCOUNT_INFO_INTEGER
          * Identifier                    Description                                             Type
          * ACCOUNT_LOGIN                 Account number                                          long
          * ACCOUNT_TRADE_MODE            Account trade mode                                      ENUM_ACCOUNT_TRADE_MODE
          * ACCOUNT_LEVERAGE              Account leverage                                        long
          * ACCOUNT_LIMIT_ORDERS          Maximum allowed number of open positions and active
          *                               pending orders (in total), 0 — unlimited                int
          * ACCOUNT_MARGIN_SO_MODE        Mode for setting the minimal allowed margin             ENUM_ACCOUNT_STOPOUT_MODE
          * ACCOUNT_TRADE_ALLOWED         Allowed trade for the current account                   bool
          * ACCOUNT_TRADE_EXPERT          Allowed trade for an Expert Advisor                     bool
          * ========================================================================================================================================
          * ENUM_ACCOUNT_INFO_STRING
          * Identifier                    Description                                             Type
          * ACCOUNT_NAME                  Client name                                             string
          * ACCOUNT_SERVER                Trade server name                                       string
          * ACCOUNT_CURRENCY              Account currency                                        string
          * ACCOUNT_COMPANY               Name of a company that serves the account               string
          * ======================================================================================================================================
          * ENUM_ACCOUNT_TRADE_MODE
          * Identifier                    Description
          * ACCOUNT_TRADE_MODE_DEMO       Demo account
          * ACCOUNT_TRADE_MODE_CONTEST    Contest account
          * ACCOUNT_TRADE_MODE_REAL       Real account
          * //======================================================================================================================================
          * ENUM_ACCOUNT_STOPOUT_MODE
          * Identifier                    Description
          * ACCOUNT_STOPOUT_MODE_PERCENT  Account stop out mode in percents
          * ACCOUNT_STOPOUT_MODE_MONEY    Account stop out mode in money
          * ======================================================================================================================================
          */
public: //---MQL Account Data store GetFrom SolidFunctions
          double                        Balance;                                 //AccountBalance();
          double                        Credit;                                  //AccountCredit();
          string                        Company;                                 //AccountCompany();
          string                        Currency;                                //AccountCurrency();
          double                        Equity;                                  //AccountEquity();
          double                        FreeMargin;                              //AccountFreeMargin();
          double                        FreeMarginCheck;                         //AccountFreeMarginCheck( string  symbol, int cmd, double  volume );
          double                        FreeMarginMode;                          //AccountFreeMarginMode();
          int                           Leverage;                                //AccountLeverage();
          double                        Margin;                                  //AccountMargin();
          string                        Name;                                    //AccountName();
          int                           Number;                                  //AccountNumber(); //login
          double                        Profit;                                  //AccountProfit();
          string                        Server;                                  //AccountServer();
          int                           StopOutLevel;                            //AccountStopoutLevel();
          int                           StopOutMode;                             //AccountStopoutMode();
public: //---MQL Account Data store GetFrom ENUM_ACCOUNT_INFO_DOUBLE Functions
          double                        ACCOUNT_BALANCE_double;                  //Account balance in the deposit currency                 double
          double                        ACCOUNT_CREDIT_double;                   //Account credit in the deposit currency                  double
          double                        ACCOUNT_PROFIT_doublel;                  //Current profit of an account in the deposit currency    double
          double                        ACCOUNT_EQUITY_double;                   //Account equity in the deposit currency                  double
          double                        ACCOUNT_MARGIN_double;                   //Account margin used in the deposit currency             double
          double                        ACCOUNT_MARGIN_FREE_double;              //Free margin of an account in the deposit currency       double
          double                        ACCOUNT_MARGIN_LEVEL_double;             //Account margin level in percents                        double
          double                        ACCOUNT_MARGIN_SO_CALL_double;           //Margin call level. Depending on the set ACCOUNT_MARGIN_SO_MODE is expressed in percents or in the deposit currency        double                               double
          double                        ACCOUNT_MARGIN_SO_SO_double;             //Margin stop out level. Depending on the set ACCOUNT_MARGIN_SO_MODE is expressed in percents or in the deposit currency    double                                double
          //* double                    ACCOUNT_MARGIN_INITIAL_dbl               //Not supported                                           double
          //* double                    ACCOUNT_MARGIN_MAINTENANCE_dbl           //Not supported                                           double
          //* double                    ACCOUNT_ASSETS_dbl                       //Not supported                                           double
          //* double                    ACCOUNT_LIABILITIES_dbl                  //Not supported                                           double
          //* double                    ACCOUNT_COMMISSION_BLOCKED_dbl           //Not supported                                           double
public: //---MQL Account Data store GetFrom ENUM_ACCOUNT_INFO_INTEGER Functions
          long                          ACCOUNT_LOGIN_int;                       //Account number                                          long
          ENUM_ACCOUNT_TRADE_MODE       ACCOUNT_TRADE_MODE_int;                  //Account trade mode                                      ENUM_ACCOUNT_TRADE_MODE
          long                          ACCOUNT_LEVERAGE_int;                    //Account leverage                                        long
          int                           ACCOUNT_LIMIT_ORDERS_int;                //Maximum allowed number of open positions and active pending orders (in total), 0 — unlimited         int
          ENUM_ACCOUNT_STOPOUT_MODE     ACCOUNT_MARGIN_SO_MODE_int;              //Mode for setting the minimal allowed margin             ENUM_ACCOUNT_STOPOUT_MODE
          bool                          ACCOUNT_TRADE_ALLOWED_int;               //Allowed trade for the current account                   bool //   Trade Allowe dACCOUNT;//
          bool                          ACCOUNT_TRADE_EXPERT_int;                //Allowed trade for an Expert Advisor                     bool //   Trade Allowed Expert
public: //---MQL Account Data store GetFrom ENUM_ACCOUNT_INFO_STRING Functions
          string                        ACCOUNT_NAME_string;                     //Client name                                             string
          string                        ACCOUNT_SERVER_string;                   //Trade server name                                       string
          string                        ACCOUNT_CURRENCY_string;                 //Account currency                                        string
          string                        ACCOUNT_COMPANY_string;                  //Name of a company that serves the account               string
public: //---MQL Account Data store GetFrom ENUM_ACCOUNT_TRADE_MODE Functions
          //ENUM_ACCOUNT_TRADE_MODE       ACCOUNT_TRADE_MODE_enum;
public: //---MQL Account Data store GetFrom ENUM_ACCOUNT_STOPOUT_MODE Functions
          //ENUM_ACCOUNT_STOPOUT_MODE     ACCOUNT_STOPOUT_MODE_enum;
//======================================================================================================================================
public:  //--MQL Account Constructors
          void St_MqlAccount()  {Currency = "?";}
          void ~St_MqlAccount() {Currency = "?";}
public:  //--MQL Account update data base
          bool UPDATED;
          bool Update()
          {         UPDATED = false;
                    //---functions by dbl type=============================================
                    ACCOUNT_BALANCE_double             = AccountInfoDouble(ACCOUNT_BALANCE);           //Account balance in the deposit currency                 double
                    ACCOUNT_CREDIT_double              = AccountInfoDouble(ACCOUNT_CREDIT);            //Account credit in the deposit currency                  double
                    ACCOUNT_PROFIT_doublel             = AccountInfoDouble(ACCOUNT_PROFIT);            //Current profit of an account in the deposit currency    double
                    ACCOUNT_EQUITY_double              = AccountInfoDouble(ACCOUNT_EQUITY);            //Account equity in the deposit currency                  double
                    ACCOUNT_MARGIN_double              = AccountInfoDouble(ACCOUNT_MARGIN);            //Account margin used in the deposit currency             double
                    ACCOUNT_MARGIN_FREE_double         = AccountInfoDouble(ACCOUNT_MARGIN_FREE);       //Free margin of an account in the deposit currency       double
                    ACCOUNT_MARGIN_LEVEL_double        = AccountInfoDouble(ACCOUNT_MARGIN_LEVEL);      //Account margin level in percents                        double
                    ACCOUNT_MARGIN_SO_CALL_double      = AccountInfoDouble(ACCOUNT_MARGIN_SO_CALL);    //Margin call level. Depending on the set ACCOUNT_MARGIN_SO_MODE is expressed in percents or in the deposit currency        double   //--- Get the value of the levels when Margin Call and Stop Out occur                             double
                    ACCOUNT_MARGIN_SO_SO_double        = AccountInfoDouble(ACCOUNT_MARGIN_SO_SO);      //Margin stop out level. Depending on the set ACCOUNT_MARGIN_SO_MODE is expressed in percents or in the deposit currency    double                                double
                    //---functions by int type =============================================
                    ACCOUNT_LOGIN_int                  = AccountInfoInteger(ACCOUNT_LOGIN);            //Account number    same as //AccountNumber();                                                  long
                    ACCOUNT_TRADE_MODE_int             = (ENUM_ACCOUNT_TRADE_MODE)AccountInfoInteger(ACCOUNT_TRADE_MODE);          //Account trade mode                                                ENUM_ACCOUNT_TRADE_MODE
                    ACCOUNT_LEVERAGE_int               = AccountInfoInteger(ACCOUNT_LEVERAGE);         //Account leverage                                                                              long
                    ACCOUNT_LIMIT_ORDERS_int           = (int)AccountInfoInteger(ACCOUNT_LIMIT_ORDERS);     //Maximum allowed number of open positions and active pending orders (in total), 0 — unlimited  int
                    ACCOUNT_MARGIN_SO_MODE_int         = (ENUM_ACCOUNT_STOPOUT_MODE)AccountInfoInteger(ACCOUNT_MARGIN_SO_MODE);    //Mode for setting the minimal allowed margin                       ENUM_ACCOUNT_STOPOUT_MODE
                    ACCOUNT_TRADE_ALLOWED_int          = AccountInfoInteger(ACCOUNT_TRADE_ALLOWED);    //Allowed trade for the current account                                                         bool
                    ACCOUNT_TRADE_EXPERT_int           = AccountInfoInteger(ACCOUNT_TRADE_EXPERT);     //Allowed trade for an Expert Advisor                                                           bool   //InvestorAllowed trade for an Expert Advisor
                    //---functions by str type =============================================
                    ACCOUNT_NAME_string                = AccountInfoString(ACCOUNT_NAME);      //Client name                           //AccountName();        string
                    ACCOUNT_SERVER_string              = AccountInfoString(ACCOUNT_SERVER);    //Trade server name                     //AccountServer();      string
                    ACCOUNT_CURRENCY_string            = AccountInfoString(ACCOUNT_CURRENCY);  //Account currency                      //AccountCurrency();    string
                    ACCOUNT_COMPANY_string             = AccountInfoString(ACCOUNT_COMPANY);   //CompanyName that serves the account   //AccountCompany();     string
                    //---functions solid =============================================
                    Balance                            = AccountBalance();
                    Credit                             = AccountCredit();
                    Company                            = AccountCompany();
                    Currency                           = AccountCurrency();
                    Equity                             = AccountEquity();
                    FreeMargin                         = AccountFreeMargin();
                    //---DevLayer-- FreeMarginCheck                    = _AccountFreeMarginCheck(string symbol, int cmd, double volume);// AccountFreeMarginCheck( string  symbol, int cmd, double  volume );
                    FreeMarginMode                     = AccountFreeMarginMode();
                    Leverage                           = AccountLeverage();
                    Margin                             = AccountMargin();
                    Name                               = AccountName();
                    Number                             = AccountNumber(); //login
                    Profit                             = AccountProfit();
                    Server                             = AccountServer();
                    StopOutLevel                       = AccountStopoutLevel();
                    StopOutMode                        = AccountStopoutMode();
                    //==========================================================
                    // SYS Timer Cheackup Start C_WINUSER32 App Enviroments<<<<|
                    //==========================================================
                    //
                    UPDATED = true;
                    //
                    //==========================================================
                    // SYS Timer Cheackup End C_WINUSER32 App Enviroments<<<<<<|
                    //==========================================================
                    return UPDATED;//
          }
          //======================================================================================================================================
public: //---MQL Account Function call
          double        _AccountInfoDouble(int property_id)                             { return AccountInfoDouble(property_id );}
          long          _AccountInfoInteger(int  property_id)                           { return AccountInfoInteger(property_id);}
          string        _AccountInfoString(int property_id )                            { return AccountInfoString(property_id);}
          double        _AccountBalance()                                               { return AccountBalance();}
          double        _AccountCredit()                                                { return AccountCredit();}
          string        _AccountCompany()                                               { return AccountCompany();}
          string        _AccountCurrency()                                              { return AccountCurrency();}
          double        _AccountEquity()                                                { return AccountEquity();}
          double        _AccountFreeMargin()                                            { return AccountFreeMargin();}
          double        _AccountFreeMarginCheck(string symbol, int cmd, double volume)  { return AccountFreeMarginCheck(symbol, cmd, volume);}
          double        _AccountFreeMarginMode()                                        { return AccountFreeMarginMode();}
          int           _AccountLeverage()                                              { return AccountLeverage();}
          double        _AccountMargin()                                                { return AccountMargin();}
          string        _AccountName()                                                  { return AccountName();}
          int           _AccountNumber()                                                { return AccountNumber();}
          double        _AccountProfit()                                                { return AccountProfit();}
          string        _AccountServer()                                                { return AccountServer();}
          int           _AccountStopoutLevel()                                          { return AccountStopoutLevel();}
          int           _AccountStopoutMode()                                           { return AccountStopoutMode();}
          //======================================================================================================================================


};
//+------------------------------------------------------------------+
//||   ||||||||||            tMqlAccount.mqh                        ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
