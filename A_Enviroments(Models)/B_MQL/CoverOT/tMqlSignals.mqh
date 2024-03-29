//+------------------------------------------------------------------+
//|                                                 Ct_MqlSIGNALS.mqh |
//|                                                    A pourya 2021 |
//|                                                @prymhdvgmail.com |
//+------------------------------------------------------------------+
#property copyright "A pourya 2021"
#property link      "@prymhdvgmail.com"
#property version   "1.00"
#property strict
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class Ct_MqlSIGNALS
{         /*
          * ============================================================================================================================================
          * MQL4 Reference / Trade Signals
          * Trade Signals
          * This is the group of functions intended for managing trade signals. The functions allow:
          * •get information about trade signals, available for copying,
          * •get and set the signal copy settings,
          * •subscribe and unsubscribe to the signal copying using MQL4 language functions.
          * Function                      Action                                                                           Calling
          * ============================================================================================================================================
          * SignalBaseGetDouble           Returns the value of double type property for selected signal                    double SignalBaseGetDouble ( ENUM_SIGNAL_BASE_DOUBLE  property_id);
          * SignalBaseGetInteger          Returns the value of integer type property for selected signal                   long   SignalBaseGetInteger( ENUM_SIGNAL_BASE_INTEGER property_id);
          * SignalBaseGetString           Returns the value of string type property for selected signal                    string SignalBaseGetString ( ENUM_SIGNAL_BASE_STRING  property_id);
          * SignalBaseSelect              Selects a signal from signals, available in terminal for further working with it bool   SignalBaseSelect    ( int index );
          * SignalBaseTotal               Returns the total amount of signals, available in terminal                       int    SignalBaseTotal     ();
          * SignalInfoGetDouble           Returns the value of double type property of signal copy settings                double SignalInfoGetDouble (  ENUM_SIGNAL_INFO_DOUBLE  property_id);
          * SignalInfoGetInteger          Returns the value of integer type property of signal copy settings               long   SignalInfoGetInteger( ENUM_SIGNAL_INFO_INTEGER property_id);
          * SignalInfoGetString           Returns the value of string type property of signal copy settings                string SignalInfoGetString (  ENUM_SIGNAL_INFO_STRING  property_id);
          * SignalInfoSetDouble           Sets the value of double type property of signal copy settings                   bool   SignalInfoSetDouble (  ENUM_SIGNAL_INFO_DOUBLE  property_id, double value);
          * SignalInfoSetInteger          Sets the value of integer type property of signal copy settings                  bool   SignalInfoSetInteger( ENUM_SIGNAL_INFO_INTEGER property_id, long   value );
          * SignalSubscribe               Subscribes to the trading signal                                                 bool   SignalSubscribe     ( long signal_id );
          * SignalUnsubscribe             Cancels subscription                                                             bool   SignalUnsubscribe   ();
          * ============================================================================================================================================
          *
          * MQL4 Reference  /  Constants, Enumerations and Structures  /  Trade Constants / Signal Properties  ???????????
          * Signal Properties
          * The following enumerations are used when working with trading signals and signal copy settings.
          * //======================================================
          * Enumeration of double type properties of the trading signal:
          * ENUM_SIGNAL_BASE_DOUBLE
          * ID                          Description
          * SIGNAL_BASE_BALANCE         Account balance
          * SIGNAL_BASE_EQUITY          Account equity
          * SIGNAL_BASE_GAIN  Account gain
          * SIGNAL_BASE_MAX_DRAWDOWN   Account maximum drawdown
          * SIGNAL_BASE_PRICE  Signal subscription price
          * SIGNAL_BASE_ROI  Return on Investment (%)
          * //======================================================
          * Enumeration of integer type properties of the trading signal:
          * ENUM_SIGNAL_BASE_INTEGER
          * ID                            Description
          * SIGNAL_BASE_DATE_PUBLISHED    Publication date (date when it become available for subscription)
          * SIGNAL_BASE_DATE_STARTED      Monitoring starting date
          * SIGNAL_BASE_ID                Signal ID
          * SIGNAL_BASE_LEVERAGE          Account leverage
          * SIGNAL_BASE_PIPS              Profit in pips
          * SIGNAL_BASE_RATING            Position in rating
          * SIGNAL_BASE_SUBSCRIBERS       Number of subscribers
          * SIGNAL_BASE_TRADES            Number of trades
          * SIGNAL_BASE_TRADE_MODE        Account type (0-real, 1-demo, 2-contest)
          * //======================================================
          * Enumeration of string type properties of the trading signal:
          * ENUM_SIGNAL_BASE_STRING
          * ID                            Description
          * SIGNAL_BASE_AUTHOR_LOGIN      Author login
          * SIGNAL_BASE_BROKER            Broker name (company)
          * SIGNAL_BASE_BROKER_SERVER     Broker server
          * SIGNAL_BASE_NAME              Signal name
          * SIGNAL_BASE_CURRENCY          Signal base currency
          * //======================================================
          * Enumeration of double type properties of the signal copy settings:
          * ENUM_SIGNAL_INFO_DOUBLE
          * ID                            Description
          * SIGNAL_INFO_EQUITY_LIMIT      Minimum equity value, below which trade copying is stopped automatically and all orders opened by subscription are closed
          * SIGNAL_INFO_SLIPPAGE          Allowable subscription when copying deals, in spreads
          * SIGNAL_INFO_VOLUME_PERCENT    Percentage of volume conversion when copying deals, r/o
          * //======================================================
          * Enumeration of integer type properties of the signal copy settings:
          * ENUM_SIGNAL_INFO_INTEGER
          * ID                                    Description
          * SIGNAL_INFO_CONFIRMATIONS_DISABLED    The flag enables synchronization without confirmation dialog
          * SIGNAL_INFO_COPY_SLTP                 Copy Stop Loss and Take Profit flag
          * SIGNAL_INFO_DEPOSIT_PERCENT           Percentage of trading account funds used when following providers' signals (in %)
          * SIGNAL_INFO_ID                        Signal id, r/o
          * SIGNAL_INFO_SUBSCRIPTION_ENABLED      "Copy trades by subscription" permission flag
          * SIGNAL_INFO_TERMS_AGREE               "Agree to terms of use of Signals service" flag, r/o
          * //======================================================
          * Enumeration of string type properties of the signal copy settings:
          * ENUM_SIGNAL_INFO_STRING
          * ID                            Description
          * SIGNAL_INFO_NAME              Signal name, r/o
          * //======================================================
          *
          *
          *
          *
          *
          *
          *
          *
          * ============================================================================================================================================
          */
private:

public:
          void  Ct_MqlSIGNALS::Ct_MqlSIGNALS() {};
          void  Ct_MqlSIGNALS::~Ct_MqlSIGNALS() {};
          void  Ct_MqlSIGNALS::Update();
public://data members

};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Ct_MqlSIGNALS::Update()
{         int total = SignalBaseTotal();//--- get total amount of signals in the terminal
          for(int i = 0; i < total; i++)//--- select the signal by index//--- process all signals
          {         if(SignalBaseSelect(i))//--- get signal properties
                    {         long      id         = SignalBaseGetInteger(SIGNAL_BASE_ID);         // signal id
                              long      pips       = SignalBaseGetInteger(SIGNAL_BASE_PIPS);       // profit in pips
                              long      subscr     = SignalBaseGetInteger(SIGNAL_BASE_SUBSCRIBERS); // number of subscribers
                              string    name       = SignalBaseGetString(SIGNAL_BASE_NAME);        // signal name
                              double    price      = SignalBaseGetDouble(SIGNAL_BASE_PRICE);       // signal price
                              string    curr       = SignalBaseGetString(SIGNAL_BASE_CURRENCY);    // signal currency
                              if(price == 0.0 && pips > 0 && subscr > 0)
                              {         //PrintFormat("id=%d, name=\"%s\", currency=%s, pips=%d, subscribers=%d", id, name, curr, pips, subscr); //  //--- print all profitable free signals with subscribers
                              } //
                    }
                    else
                    {         //PrintFormat("Error in call of SignalBaseSelect. Error code=%d", GetLastError());//
                    } //
          } //
}
//+------------------------------------------------------------------+
