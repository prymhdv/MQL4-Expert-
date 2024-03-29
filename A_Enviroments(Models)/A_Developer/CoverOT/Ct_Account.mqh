//+------------------------------------------------------------------+
//|                                            Ct_Account.mqh |
//|                                                    A pourya 2021 |
//|                                                @prymhdvgmail.com |
//+------------------------------------------------------------------+
#property copyright "A pourya 2021"
#property link      "@prymhdvgmail.com"
#property version   "1.00"
#property strict
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Bases\.BaseWall.mqh> //---Check Dependency--(ErrorsManager)
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\B_MQL\CoverOT\tMqlAccount.mqh>


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
struct Std_Account_Margin
{

          //---Account Data FreeMarginCheck
          double                        FreeCheck;      //AccountFreeMarginCheck( string  symbol, int cmd, double  volume );
          double                        RemainsSell;    //=AccountFreeMarginCheck(_Symbol, OP_SELL, PutLotsO)//Returns free margin that remains after the specified order has been opened at the current price on the current account
          double                        RemainsBuy;     //=AccountFreeMarginCheck(_Symbol, OP_BUY, PutLotsO)
          //--
          bool                          IsRemainsSell;  //=AccountFreeMarginCheck(_Symbol, OP_SELL, PutLotsO)>0//Returns free margin that remains after the specified order has been opened at the current price on the current account
          bool                          IsRemainsBuy;   //=AccountFreeMarginCheck(_Symbol, OP_BUY, PutLotsO) >= 0//Returns free margin that remains after the specified order has been opened at the current price on the current account
};
struct Std_Account_Leverage
{         //---Leverage
          bool                          Key;// = AccountLeverage();
          int                           Val;// = AccountLeverage();
          string                        Desc;
          //---
};
struct Std_Account
{         //---
          double Size;
          double                        margi;
          string                        keyWord;
          bool                          DoTrade;
          bool                          keepTrend;
          //---Money Data
          bool                          moneyOut;
          double                        EquityInp;
          double                        EquityAmount;//
          double                        EquityFixed;//
          //---
          Std_Account_Margin            Margin;
          Std_Account_Leverage          Leverage;
          //---
          int                           StopOutLevelVal;
          string                        StopOutLevelDesc;
          //---naming
          double                        dbl_;// AccountInfoDouble( int  property_id );
          long                          int_;// AccountInfoInteger( int  property_id );
          string                        str_;// AccountInfoString(int  property_id );
          //---info
          ENUM_ACCOUNT_TRADE_MODE       Type;             //(ENUM_ACCOUNT_TRADE_MODE)AccountInfoInteger(ACCOUNT_TRADE_MODE);//--- Demo, contest or real account
          string                        Trade_Mode;       //--- Demo, contest or real account   //--- Now transform the value of  the enumeration into an understandable form
          ENUM_ACCOUNT_STOPOUT_MODE     StopOut_Mode;     // = (ENUM_ACCOUNT_STOPOUT_MODE)AccountInfoInteger(ACCOUNT_MARGIN_SO_MODE);//--- Stop Out is set in percentage or money
          double                        Margin_Call;      // = AccountInfoDouble(ACCOUNT_MARGIN_SO_CALL);//--- Get the value of the levels when Margin Call and Stop Out occur
          double                        StopOut;          // = AccountInfoDouble(ACCOUNT_MARGIN_SO_SO)
          //---
          //---
};
//+------------------------------------------------------------------+
//|             Class C_BANK::     BEGIN                             | ///////Money Manager////////          ///////Money Manager////////
//+------------------------------------------------------------------+
class Ct_Account   //---dependency havy to St_Size of trade
{
private:
          //====================================================================
public:
          void                          Ct_Account();
          void                          ~Ct_Account() { /*if(Capitan_DeinitErrorCatching)________________________________________________________Xerorr.SuperviserX(_LastError, "-Ct_Account Error",  __LINE__, __FUNCTION__);*/}; //
          bool                          Update(St_Size &tdSize1, double f_Equity_Fixed_Inp);
          bool                          UPDATED;
          St_MqlAccount                 _Mql_;
          Std_Account                   Account_Data;
public:    //====================================================================

          string                        AccountStopoutLevelDesc();

          double                        AccountExchangeRate(string symbol);
          double                        AccountCurrencyToQuoteCurrency(double risk_in_account_currencyCom) {         return risk_in_account_currencyCom;}; //
          bool                          QuoteCurrencyToAccountCurrency(int valuCom = 1) {         return true;}; //

          string                        GetCurrency();
          string                        CurrencyDesc;

}; //>>>AccountControllerX;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
Ct_Account::Ct_Account()
{         /*RunCallFunction++; ________________________________________________________Xerorr.SuperviserX(_LastError, "-Ct_Account Error",  __LINE__, __FUNCTION__); //|*/
          //=========================================================|
          Account_Data.EquityAmount = -1; //
          Account_Data.EquityFixed = -1; ///
          GetCurrency();//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Ct_Account::Update(St_Size &tdSize1, double f_Equity_Fixed_Inp)
{         //---
          //-------------------------------
          Account_Data.EquityFixed = f_Equity_Fixed_Inp; ///
          //-------------------------------
          Dev_Checkup_Mql.Update();
          if(tdSize1.Curr_Lots != 0)
          {         /*---DevLayer From MqlLayer---*///_Mql_.FreeMarginCheck = _Mql_._AccountFreeMarginCheck(string symbol, int cmd, double volume); // AccountFreeMarginCheck( string  symbol, int cmd, double  volume );
                    ///---off ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_CHART Error",  __LINE__, __FUNCTION__); //|
                    Account_Data.Margin.RemainsSell       = _Mql_._AccountFreeMarginCheck(_Symbol, OP_SELL, tdSize1.Curr_Lots);
                    Account_Data.Margin.RemainsBuy        = _Mql_._AccountFreeMarginCheck(_Symbol, OP_BUY, tdSize1.Curr_Lots);
                    //-----------------------------------------------------------------checking & Setting
                    Account_Data.Margin.IsRemainsSell     = Account_Data.Margin.RemainsSell  > 0;
                    Account_Data.Margin.IsRemainsBuy      = Account_Data.Margin.RemainsBuy  > 0;
                    ///---off ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_CHART Error",  __LINE__, __FUNCTION__); //|
                    // Calculate margin required for 1 lot
          } //
          Account_Data.Leverage.Desc        = (string)_Mql_.Leverage;
          Account_Data.StopOutLevelDesc    = AccountStopoutLevelDesc();
          //-----------------------------------------------------------------------------------------------------------------------------
          {         Account_Data.Type                = _Mql_.ACCOUNT_TRADE_MODE_int;//--- Demo, contest or real account
                    switch(Account_Data.Type)
                    {         case  ACCOUNT_TRADE_MODE_DEMO:    Account_Data.Trade_Mode = "demo"; break;
                              case  ACCOUNT_TRADE_MODE_CONTEST: Account_Data.Trade_Mode = "contest"; break;
                              default:                          Account_Data.Trade_Mode = "real"; break;//ACCOUNT_TRADE_MODE_REAL
                    }//
          }//
          //-----------------------------------------------------------------------------------------------------------------------------
          if (_Mql_.Currency == "RUR") _Mql_.Currency = "RUB";// // A rough patch for cases when account currency is set as RUR instead of RUB.
          // Out of money
          if ( AccountEquity() <= 0.0 ) { Account_Data.moneyOut = true;   if(0)Comment ( "ERROR -- Account Equity is " + DoubleToStr ( MathRound ( AccountEquity() ), 0 ) ); }
          else                          { Account_Data.moneyOut = false; }
          //PrintFormat("The account of the client '%s' #%d %s opened in '%s' on the server '%s'", Name, Number, Trade_Mode, Company, Server); //--- Show brief account information
          //PrintFormat("Account currency - %s, MarginCall and StopOut levels are set in %s", Currency, (StopOut_Mode == ACCOUNT_STOPOUT_MODE_PERCENT) ? "percentage" : " money");
          //PrintFormat("MarginCall=%G, StopOut=%G", Margin_Call, StopOut); ///
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
};

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+.
string  Ct_Account::AccountStopoutLevelDesc()
{         int level = Account_Data.StopOutLevelVal = AccountStopoutLevel(); string Desc = ""; //
          if(AccountStopoutMode() == 0) { Desc = "StopOut level = " + (string)level + "%" ; /* Print(Desc);*/}
          else                          { Desc = "StopOut level = " + (string)level + " " + AccountCurrency(); /*Print(Desc);*/}
          return Desc;//
}

//+------------------------------------------------------------------+
/// Gets the Account Exchange Rate
/// AccountExchangeRate = AccountCurrency / QuotedCurrency
/// It serves to convert the profit of a deal in account currency.
/// This code has to be improved!
//+------------------------------------------------------------------+
double Ct_Account::AccountExchangeRate(string symbol)
{         if (StringLen(symbol) != 6)
                    return (1);
          string accCurrency    = AccountCurrency();
          string baseCurrency   = StringSubstr(symbol, 0, 3);
          string quotedCurrency = StringSubstr(symbol, 3, 3);
          if (accCurrency == quotedCurrency)
                    return (1);
          else if (accCurrency == baseCurrency)
                    return (MarketInfo(symbol, MODE_BID));
          else
          {         string pair = StringConcatenate(accCurrency, quotedCurrency);
                    double rate = MarketInfo(pair, MODE_BID);
                    int LastError = GetLastError();
                    if (LastError == 4106)
                    {         pair = StringConcatenate(quotedCurrency, accCurrency);
                              rate = MarketInfo(pair, MODE_BID);
                              LastError = GetLastError();
                              if (LastError == 0)
                                        rate = 1 / rate;
                              else
                                        rate = 1;//
                    }
                    else if (LastError != 0)
                              rate = 1;
                    return (rate);//
          }
          return (1);//
}
//+------------------------------------------------------------------+
//| AccountCurrency                                                  |
//+------------------------------------------------------------------+
string Ct_Account::GetCurrency()
{         //---off ________________________________________________________Xerorr.SuperviserX(_LastError, "-ChartController Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          string txt = "";
          if(AccountCurrency() == "AUD")txt = "$";
          if(AccountCurrency() == "CAD")txt = "$";
          if(AccountCurrency() == "CHF")txt = "Fr.";
          if(AccountCurrency() == "EUR")txt = "€";
          if(AccountCurrency() == "GBP")txt = "£";
          if(AccountCurrency() == "JPY")txt = "¥";
          if(AccountCurrency() == "NZD")txt = "$";
          if(AccountCurrency() == "USD")txt = "$";
          if(txt == "")txt = "$";
          return(CurrencyDesc = txt);
          //---off ________________________________________________________Xerorr.SuperviserX(_LastError, "-ChartController Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
