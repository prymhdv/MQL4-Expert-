//+------------------------------------------------------------------+
//||   ||||||||||            tDevMarketSymbol.mqh                   ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\B_MQL\.B_MQL.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOT\Trade_Data_Structs.mqh>
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class Ct_Market_Symbol//---Oprating MqlSymbol data
{         //+------------------------------------------------------------------+
          //|       Constructors        Constructors        Constructors       |
          //+------------------------------------------------------------------+
public:
          void                          Ct_Market_Symbol();
          void                          ~Ct_Market_Symbol() {};
          //+------------------------------------------------------------------+
          //|        UpdateAll            UpdateAll           UpdateAll        |
          //+------------------------------------------------------------------+
public:
          bool                          UPDATEDAll;
          bool                          UpdateAll() {UPDATEDAll = false; UpdateSymbol(); UpdateMarket(); return UPDATEDAll = true;}
          //+------------------------------------------------------------------+
          //|         Dependency         Dependency         Dependency         |                 -- _Mql_.Symbol_TRADE_TICK_SIZE
          //+------------------------------------------------------------------+ ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_LOTSTEP -- _Mql_.Market_LOTSTEP
public:
          St_MqlMarketSymbol            _Mql_;  //Whois to update
          St_DevSymbol                  DevSymbol;        //--- DevSymbol.Current

          //===============================================================
          double                        sub_multiplicator();
          //===============================================================
          void                          SetSymbolCurrent() { StSymbol.Current = DevSymbol.Current = DevSymbol.Inp = _Symbol;/*NULL;*/ }
          //---
          bool                          IsSymbolAvailable(string f_Symbol, bool f_marketWatch = false); // financial instrument // search area // (false - on the server)// (true - in the Market Watch window)
          bool                          SymbolFind(const string _Symb);
          bool                          LoadAllAvailableHistory(string m_Symbol, ENUM_TIMEFRAMES m_TimeFrame);
          string                        SymbolTypeDesc();
//=======================================================================
          void                          CalculateSymbolLeverage
          (const double Market_PROFITCALCMODE,
           const double Market_TICKSIZE,
           const double Market_LOTSIZE,
           const string Symbol_CURRENCY_PROFIT,
           const double Symbol_TRADE_TICK_VALUE,
           const string Account_Currency,
           St_PositionData_Leverage &PositionData_Leverage_
          );
//=======================================================================
          double                        CalculateAdjustment(const string Account_Currency, const string Symbol_CURRENCY_PROFIT, const ENUM_PROFIT_LOSS calc_mode, string profit_currencyCom = "");
          string                        GetSymbolByCurrencies(const string base_currency, const string profit_currencyCom, const uint symbol_type);
          bool                          FindDoubleReferenceSymbol(const string Account_Currency, const string cross_currency, const string profit_currency, string &ref_symbol, bool &ref_mode, string &add_ref_symbol, bool &add_ref_mode);
          double                        GetCurrencyCorrectionCoefficient(ENUM_PROFIT_LOSS calc_mode, bool ref_mode, MqlTick &tick);//
//=======================================================================
          void                          GetSwapData(const string SymbolIn,    const string Account_Currency,    const string Symbol_CURRENCY_PROFIT,    const double Market_TICKSIZE,    const double Market_LOTSIZE);
          void                          CalculatePortfolioRisk(const string SymbolIn, const string Account_Currency, const string Symbol_CURRENCY_PROFIT);
//=======================================================================
public: //Symbol functions
          //+------------------------------------------------------------------+
          //|        UpdateSymbol       UpdateSymbol       UpdateSymbol        |
          //+------------------------------------------------------------------+
          bool                          UpdateSymbol();
          bool                          UPDATEDSymbol;

public:   //Market functions
          //+------------------------------------------------------------------+
          //|        UpdateMarket       UpdateMarket       UpdateMarket        |
          //+------------------------------------------------------------------+
          bool                          UpdateMarket();
          bool                          UPDATEDMarket;
          //---
          string                        Status;
          int                           Market_LOTSTEP_DIGITS;
          //-------------------------------------------
          bool                          lasttickinfo();
          MqlTick                       last_MqlTick; //1.3 get last tick info
          //---
          bool                          IsMarket_TICKNew;
          bool                          GetMarket_TICKNew();
          void                          sub_printdetails();
//===================================================================
          bool                          Is_Live;
          bool                          Is_Running;//KeyRunMarket = KeyTRADE_ALLOWED_MQL && KeyTRADE_ALLOWED_Terminal && KeyConnected && KeyTRADEALLOWED_symbol && ! KeyOffDayTimeLocal ; //
//===================================================================
          double                        SPREAD_Array[30];                                   // Store spreads for the last 30 tics
          //=================================================MarketInfo///   double  MarketInfo( string symbol, int type );
          double                        GetProperties(int ModeCom = -1, bool AllOrOne = false);
          //==================================================
          bool                          Is_Fractional;//the symbol fraction pip or pipet
          double                        POINT_PIP;// = 0;
          double                        POINT_PIPf(){return PipPoint(NULL);};// = 0;
          double                        Curr_PointValue;// = 0;validPoint
          double                        Curr_PipValue;//
          double                        PipPoint(string Currency = NULL);//GetPipPoint
          double                        PointValueByTickSize(string symbol, string FuncCom = "__FUNCSIG__");/////Orchards
          //--------------------------------
          int                           GetSlippage(string Currency, int SlippagePips);
          int                           Slippage;// = 0;


//===================================================================
//===================================================================
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Ct_Market_Symbol::Ct_Market_Symbol()
{         RunCallFunction++;
//===============================================
          SetSymbolCurrent();  ///--for starting change
          PositionData_Leverage.Leverage_Custom      = 0;
          PositionData_Leverage.Leverage_Symbol      = 1;
//===============================================
          _Mql_.Symbol_CURRENCY_PROFIT            = "?";
          _Mql_.Symbol_CURRENCY_BASE              = "?";
          //---
          PositionData.OutputPipValue           = "";
          //---
          PositionData_Swap.SwapsTripleDay                   = "?";
          PositionData_Swap.OutputSwapsType                  = "Unknown";
          PositionData_Swap.OutputSwapsDailyLongLot          = "?";
          PositionData_Swap.OutputSwapsDailyShortLot         = "?";
          PositionData_Swap.OutputSwapsDailyLongPS           = "?";
          PositionData_Swap.OutputSwapsDailyShortPS          = "?";
          PositionData_Swap.OutputSwapsYearlyLongLot         = "?";
          PositionData_Swap.OutputSwapsYearlyShortLot        = "?";
          PositionData_Swap.OutputSwapsYearlyLongPS          = "?";
          PositionData_Swap.OutputSwapsYearlyShortPS         = "?";
          PositionData_Swap.OutputSwapsCurrencyDailyLot      = "";
          PositionData_Swap.OutputSwapsCurrencyDailyPS       = "";
          PositionData_Swap.OutputSwapsCurrencyYearlyLot     = "";
          PositionData_Swap.OutputSwapsCurrencyYearlyPS      = "";
          //-----------------------------------------
          PositionData_Swap.ReferenceSymbol                  = NULL;
          PositionData_Swap.SwapConversionSymbol             = "";
          PositionData_Swap.AdditionalReferenceSymbol        = NULL;
//===============================================
          // --- number of financial instruments
          int totalMarketWatch                  = SymbolsTotal ( true );  // in the Market window
          int totalGeneral                      = SymbolsTotal ( false ); // on the account
//===============================================
          UpdateAll(); //
}
//+------------------------------------------------------------------+
//| SymbolFind                                                       |
//+------------------------------------------------------------------+
bool Ct_Market_Symbol::SymbolFind(const string _Symb)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-ChartController Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          bool result = false;
          for(int i = 0; i < SymbolsTotal(false); i++)  ///from Brockers Selected
          {         if(_Symb == SymbolName(i, false))   ///true only symbols in market watch
                    {         result = true;            //SymbolFound
                              break;                    //
                    } //
          }//
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-ChartController Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          return(result); //
}//


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool  Ct_Market_Symbol::LoadAllAvailableHistory(string m_Symbol, ENUM_TIMEFRAMES m_TimeFrame)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "UtilitiesController Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          //----LoadAllAvailableHistory Loading all available history for the symbol: %s (%s) has been successful
          bool m_Verbose;
          long currID = ChartID();
          ResetLastError();
          long ID = ChartOpen(m_Symbol, m_TimeFrame);
          if(ID == 0)
          {         if(m_Verbose) printf("Opening the chart %s, %s failed ; Error: %s (%d)", m_Symbol, EnumToString(m_TimeFrame), ErrorDescription(_LastError), _LastError);
                    return(false);//
          }
          ChartRedraw(ID);
          ChartSetInteger(currID, CHART_BRING_TO_TOP, true);
          ChartRedraw(currID);
          ResetLastError();
          if(!ChartSetInteger(ID, CHART_AUTOSCROLL, false))
          {         if(m_Verbose)
                              printf("Switching off the autoscroll on the chart %s, %s failed ; Error: %s (%d)", m_Symbol, EnumToString(m_TimeFrame), ErrorDescription(_LastError), _LastError);
                    return(false);//
          }
          ChartRedraw(ID);
          ResetLastError();
          if(!ChartSetInteger(ID, CHART_SCALE, 0))
          {         if(m_Verbose)
                              printf("Setting the scale on the chart %s, %s failed ; Error: %s (%d)", m_Symbol, EnumToString(m_TimeFrame), ErrorDescription(_LastError), _LastError);
                    return(false); //
          }
          ChartRedraw(ID);
          //================================================================Returns information about the state of historical data. There are 2 variants of function calls.
          int jump = 1000, countBars = 0, count = 0;
          bool res = false;
          uint start = GetTickCount(), timeout = 4000, ms;  //---milisecound 4*1000
          do
          {         ResetLastError();
                    res = ChartNavigate(ID, CHART_BEGIN, (-jump) * res);
                    if(!res)
                    {         if(m_Verbose)printf("Navigate on the chart %s, %s failed ; Error: %s (%d)", m_Symbol, EnumToString(m_TimeFrame), ErrorDescription(_LastError), _LastError); }
                    ChartRedraw(ID);
                    Sleep(30);
                    if(countBars == SeriesInfoInteger(m_Symbol, m_TimeFrame, SERIES_BARS_COUNT)) count++;
                    else count = 0;
                    res &= count < 7;
                    countBars = (int)SeriesInfoInteger(m_Symbol, m_TimeFrame, SERIES_BARS_COUNT);
                    ms = GetTickCount() - start; //
          }
          while(res && ms < timeout && !IsStopped());
          //================================================================
          ChartClose(ID);
          if(m_Verbose) printf("Loading all available history for the symbol: %s (%s) has been successful", m_Symbol, EnumToString(m_TimeFrame));
          ________________________________________________________Xerorr.SuperviserX(_LastError, "UtilitiesController Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          return(true);//
}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string  Ct_Market_Symbol::SymbolTypeDesc()
{         string Desc;///
          double SymbolTypeValuIN = MarketInfo(Symbol(), MODE_PROFITCALCMODE); //     Profit calculation mode. 0 - Forex; 1 - CFD; 2 - Futures
          if(SymbolTypeValuIN == 0) Desc = "Forex"; //
          if(SymbolTypeValuIN == 1) Desc = "CFD"; //
          if(SymbolTypeValuIN == 2) Desc = "Futures"; //
          return Desc;//
}
//+-----------------------------------------------------------------------------------+
//| Calculates necessary adjustments for cases when CURRENCY_PROFIT != AccountCurrency.|
//| Optional parameter profit_currencyCom for when calculating adjustment for positions  |
//| in other symbols (for Risk tab).                                                  |
//+-----------------------------------------------------------------------------------+
double  Ct_Market_Symbol::CalculateAdjustment(
          const string Account_Currency,
          const string Symbol_CURRENCY_PROFIT,
          const ENUM_PROFIT_LOSS calc_mode,
          string profit_currencyCom = ""
)
{         //--------------------------------------------
          string        ref_symbol      = NULL,         add_ref_symbol  = NULL;
          bool          ref_mode        = false,        add_ref_mode    = false;
          double        add_coefficient = 1; // Might be necessary for correction coefficient calculation if two pairs are used for profit currency to account currency conversion. This is handled differently in MT5 version.
          //--------------------------------------------
          if (profit_currencyCom == "") // Calculating adjustment for current symbol.
          {         // Use global variables.
                    ref_symbol                  = PositionData_Swap.ReferenceSymbol;
                    profit_currencyCom          = Symbol_CURRENCY_PROFIT;
                    ref_mode                    = PositionData_Swap.ReferenceSymbolMode;
                    add_ref_symbol              = PositionData_Swap.AdditionalReferenceSymbol; // Additional symbol variable is combined with normal ReferenceSymbol to store two symbols for 2-pair conversion.
                    add_ref_mode                = PositionData_Swap.AdditionalReferenceSymbolMode; //
          }
          if (ref_symbol == NULL) // Either first run or non-current symbol.
          {         ref_symbol  = GetSymbolByCurrencies(profit_currencyCom, Account_Currency, FOREX_SYMBOLS_ONLY);
                    if (ref_symbol == NULL) ref_symbol = GetSymbolByCurrencies(profit_currencyCom, Account_Currency, NONFOREX_SYMBOLS_ONLY);
                    ref_mode = true;
                    // Failed.
                    if (ref_symbol == NULL)
                    {         // Reversing currencies.
                              ref_symbol = GetSymbolByCurrencies(Account_Currency, profit_currencyCom, FOREX_SYMBOLS_ONLY);
                              if (ref_symbol == NULL) ref_symbol = GetSymbolByCurrencies(Account_Currency, profit_currencyCom, NONFOREX_SYMBOLS_ONLY);
                              ref_mode = false; }
                    if (ref_symbol == NULL)
                    {         // The condition checks whether we are caclulating conversion coefficient for the chart's symbol or for some other.
                              // The error output is OK for the current symbol only because it won't be repeated ad infinitum.
                              // It should be avoided for non-chart symbols because it will just flood the log.
                              if (profit_currencyCom == Symbol_CURRENCY_PROFIT) Print("Couldn't detect proper currency pair for adjustment calculation. Profit currency: ", profit_currencyCom, ". Account currency: ", Account_Currency, ". Trying to find a possible two-symbol combination.");
                              if ((FindDoubleReferenceSymbol(Account_Currency, "USD", profit_currencyCom, ref_symbol, ref_mode, add_ref_symbol, add_ref_mode)) // USD should work in 99.9% of cases.
                                                  || (FindDoubleReferenceSymbol(Account_Currency, "EUR", profit_currencyCom, ref_symbol, ref_mode, add_ref_symbol, add_ref_mode)) // For very rare cases.
                                                  || (FindDoubleReferenceSymbol(Account_Currency, "GBP", profit_currencyCom, ref_symbol, ref_mode, add_ref_symbol, add_ref_mode)) // For extremely rare cases.
                                                  || (FindDoubleReferenceSymbol(Account_Currency, "JPY", profit_currencyCom, ref_symbol, ref_mode, add_ref_symbol, add_ref_mode))) // For extremely rare cases.
                              {         if (profit_currencyCom == Symbol_CURRENCY_PROFIT) Print("Converting via ", ref_symbol, " and ", add_ref_symbol, "."); }
                              else
                              {         Print("Adjustment calculation critical failure. Failed both simple and two-pair conversion methods.");
                                        return 1; } //
                    } //
          }
          if (profit_currencyCom == Symbol_CURRENCY_PROFIT) // It was calculation for the current symbol.
          {         // Remember for future uses.
                    PositionData_Swap.ReferenceSymbol                = ref_symbol;
                    PositionData_Swap.ReferenceSymbolMode            = ref_mode;
                    PositionData_Swap.AdditionalReferenceSymbol      = add_ref_symbol;
                    PositionData_Swap.AdditionalReferenceSymbolMode  = add_ref_mode; //
          }
          if (add_ref_symbol != NULL) // If two reference pairs are used.
          {         // Calculate just the additional symbol's coefficient and then use it in final return's multiplication.
                    MqlTick tick;
                    SymbolInfoTick(add_ref_symbol, tick);
                    add_coefficient = GetCurrencyCorrectionCoefficient(calc_mode, add_ref_mode, tick); //
          }
          MqlTick tick;
          SymbolInfoTick(ref_symbol, tick);
          return GetCurrencyCorrectionCoefficient(calc_mode, ref_mode, tick) * add_coefficient;//
}
//+------------------------------------------------------------------+
//| Calculates symbol leverage value based on required margin        |
//| and current rates.                                               |
//+------------------------------------------------------------------+
void  Ct_Market_Symbol::CalculateSymbolLeverage(
          const double Market_PROFITCALCMODE,
          const double Market_TICKSIZE,
          const double Market_LOTSIZE,
          const string Symbol_CURRENCY_PROFIT,
          const double Symbol_TRADE_TICK_VALUE,
          const string Account_Currency,
          St_PositionData_Leverage &PositionData_Leverage_)
{
//======================================================================
          double tickValue;
          double lotValue;
          double marginValue;
          //-------------------------------------------------
          if (Market_PROFITCALCMODE == 1)
          {         tickValue = Market_TICKSIZE * Market_LOTSIZE; // Apparently, it is more accurate than taking TICKVALUE directly in some cases.
                    //-------------------------------------------------
                    // If profit currency is different from account currency.
                    //-------------------------------------------------
                    if (Symbol_CURRENCY_PROFIT != Account_Currency) {tickValue *=  CalculateAdjustment(Account_Currency, Symbol_CURRENCY_PROFIT, Loss); } //
          }
          else tickValue = Symbol_TRADE_TICK_VALUE;
          //-------------------------------------------------
          if ((Market_TICKSIZE == 0) || (tickValue == 0)) return;
          //-------------------------------------------------
          lotValue        = _Mql_.__SymbolInfoDouble(DevSymbol.Current, SYMBOL_ASK) / Market_TICKSIZE * tickValue; //---for last changed no laging SymbolInfoDouble(Symbol(), SYMBOL_ASK)
          //-------------------------------------------------
          if (PositionData_Margin.PreHedgingPositionMargin == 0) return;
          //-------------------------------------------------
          marginValue = PositionData_Margin.PreHedgingPositionMargin;
          //-------------------------------------------------
          if ((PositionData_Margin.OriginalPreHedgingPositionMargin > 0) && (PositionData_Leverage_.Leverage_Custom > 0)) marginValue = PositionData_Margin.OriginalPreHedgingPositionMargin; // Recalculate margin using the original leverage, not the custom leverage.
          //-------------------------------------------------
          PositionData_Leverage.Leverage_Symbol         = lotValue / marginValue * PositionData.OutputPositionSize;//
          //-------------------------------------------------
}
//+----------------------------------------------------------------------------+
//| Returns a currency pair with specified base currency and profit currency.  |
//| Can skip symbols based on their type to improve performance in some cases. |
//+----------------------------------------------------------------------------+
string  Ct_Market_Symbol::GetSymbolByCurrencies(const string base_currency, const string profit_currency, const uint symbol_type)
{         // Cycle through all symbols.
          for (int s = 0; s < SymbolsTotal(false); s++)
          {         // Get symbol name by number.
                    string symbolname = SymbolName(s, false);
                    string b_cur;
                    // Normal case - Forex pairs:
                    if (MarketInfo(symbolname, MODE_PROFITCALCMODE) == 0)
                    {         if (symbol_type == NONFOREX_SYMBOLS_ONLY) continue; // Avoid checking symbols of a wrong type.
                              // Get its base currency.
                              b_cur = SymbolInfoString(symbolname, SYMBOL_CURRENCY_BASE); //
                    }
                    else // Weird case for brokers that set conversion pairs as CFDs.
                    {         if (symbol_type == FOREX_SYMBOLS_ONLY) continue; // Avoid checking symbols of a wrong type.
                              // Get its base currency as the initial three letters - prone to huge errors!
                              b_cur = StringSubstr(symbolname, 0, 3); //
                    }
                    // Get its profit currency.
                    string p_cur = SymbolInfoString(symbolname, SYMBOL_CURRENCY_PROFIT);
                    // If the currency pair matches both currencies, select it in Market Watch and return its name.
                    if ((b_cur == base_currency) && (p_cur == profit_currency))
                    {         // Select if necessary.
                              if (!(bool)SymbolInfoInteger(symbolname, SYMBOL_SELECT)) SymbolSelect(symbolname, true);
                              return symbolname; }//
          }
          return NULL; //
}
//+----------------------------------------------------------------------------+
//| Finds reference symbols using 2-pair method.                               |
//| Results are returned via reference parameters.                             |
//| Returns true if found the pairs, false otherwise.                          |
//+----------------------------------------------------------------------------+
bool  Ct_Market_Symbol::FindDoubleReferenceSymbol(const string Account_Currency, const string cross_currency, const string profit_currency, string & ref_symbol, bool & ref_mode, string & add_ref_symbol, bool & add_ref_mode)
{         // A hypothetical example for better understanding:
          // The trader buys CAD/CHF.
          // Account_.Currency is known = SEK.
          // cross_currency = USD.
          // profit_currency = CHF.
          // I.e., we have to buy dollars with francs (using the Ask price) and then sell those for SEKs (using the Bid price).
          ref_symbol = GetSymbolByCurrencies(cross_currency, Account_Currency, FOREX_SYMBOLS_ONLY);
          if (ref_symbol == NULL) ref_symbol = GetSymbolByCurrencies(cross_currency, Account_Currency, NONFOREX_SYMBOLS_ONLY);
          ref_mode = true; // If found, we've got USD/SEK.
          // Failed.
          if (ref_symbol == NULL)
          {         // Reversing currencies.
                    ref_symbol = GetSymbolByCurrencies(Account_Currency, cross_currency, FOREX_SYMBOLS_ONLY);
                    if (ref_symbol == NULL) ref_symbol = GetSymbolByCurrencies(Account_Currency, cross_currency, NONFOREX_SYMBOLS_ONLY);
                    ref_mode = false; // If found, we've got SEK/USD.
          }
          if (ref_symbol == NULL)
          {         Print("Error. Couldn't detect proper currency pair for 2-pair adjustment calculation. Cross currency: ", cross_currency, ". Account currency: ", Account_Currency, ".");
                    return false; }
          add_ref_symbol = GetSymbolByCurrencies(cross_currency, profit_currency, FOREX_SYMBOLS_ONLY);
          if (add_ref_symbol == NULL) add_ref_symbol = GetSymbolByCurrencies(cross_currency, profit_currency, NONFOREX_SYMBOLS_ONLY);
          add_ref_mode = false; // If found, we've got USD/CHF. Notice that mode is swapped for cross/profit compared to cross/acc, because it is used in the opposite way.
          // Failed.
          if (add_ref_symbol == NULL)
          {         // Reversing currencies.
                    add_ref_symbol = GetSymbolByCurrencies(profit_currency, cross_currency, FOREX_SYMBOLS_ONLY);
                    if (add_ref_symbol == NULL) add_ref_symbol = GetSymbolByCurrencies(profit_currency, cross_currency, NONFOREX_SYMBOLS_ONLY);
                    add_ref_mode = true; // If found, we've got CHF/USD. Notice that mode is swapped for profit/cross compared to acc/cross, because it is used in the opposite way.
          }
          if (add_ref_symbol == NULL)
          {         Print("Error. Couldn't detect proper currency pair for 2-pair adjustment calculation. Cross currency: ", cross_currency, ". Chart's pair currency: ", profit_currency, ".");
                    return false; }
          return true;//
}
//+------------------------------------------------------------------+
//| Get profit correction coefficient based on profit currency,      |
//| calculation mode (profit or loss), reference pair mode (reverse  |
//| or direct), and current prices.                                  |
//+------------------------------------------------------------------+
double  Ct_Market_Symbol::GetCurrencyCorrectionCoefficient(ENUM_PROFIT_LOSS calc_mode, bool ref_mode, MqlTick & tick)
{         if ((tick.ask == 0) || (tick.bid == 0)) return(-1); // Data is not yet ready.
          if (calc_mode == Loss)
          {         // Reverse quote.
                    if (ref_mode)
                    {         // Using Buy price for reverse quote.
                              return(tick.ask); }
                    // Direct quote.
                    else
                    {         // Using Sell price for direct quote.
                              return(1 / tick.bid); } //
          }
          else if (calc_mode == Profit)
          {         // Reverse quote.
                    if (ref_mode)
                    {         // Using Sell price for reverse quote.
                              return(tick.bid); }
                    // Direct quote.
                    else
                    {         // Using Buy price for direct quote.
                              return(1 / tick.ask); }//
          }
          return(-1); //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double  Ct_Market_Symbol::sub_multiplicator()
{
// Calculate lot multiplicator for Account Currency. Assumes that account currency is any of the 8 majors.
// If the account currency is of any other currency, then calculate the multiplicator as follows:
// If base-currency is USD then use the BID-price for the currency pair USDXXX; or if the
// counter currency is USD the use 1 / BID-price for the currency pair XXXUSD,
// where XXX is the abbreviation for the account currency. The calculated lot-size should
// then be multiplied with this multiplicator.
          double multiplicator = 1.0;
          int length;
          string appendix = "";
          if ( AccountCurrency() == "USD" )return ( multiplicator );
          length = StringLen ( Symbol() );
          if ( length != 6 )appendix = StringSubstr ( Symbol(), 6, length - 6 );
          if ( AccountCurrency() == "EUR" )multiplicator = 1.0 / MarketInfo ( "EURUSD" + appendix, MODE_BID );
          if ( AccountCurrency() == "GBP" )multiplicator = 1.0 / MarketInfo ( "GBPUSD" + appendix, MODE_BID );
          if ( AccountCurrency() == "AUD" )multiplicator = 1.0 / MarketInfo ( "AUDUSD" + appendix, MODE_BID );
          if ( AccountCurrency() == "NZD" )multiplicator = 1.0 / MarketInfo ( "NZDUSD" + appendix, MODE_BID );
          if ( AccountCurrency() == "CHF" )multiplicator = MarketInfo ( "USDCHF" + appendix, MODE_BID );
          if ( AccountCurrency() == "JPY" )multiplicator = MarketInfo ( "USDJPY" + appendix, MODE_BID );
          if ( AccountCurrency() == "CAD" )multiplicator = MarketInfo ( "USDCAD" + appendix, MODE_BID );
          if ( multiplicator == 0 )multiplicator = 1.0; // If account currency is neither of EUR, GBP, AUD, NZD, CHF, JPY or CAD we assumes that it is USD
          return ( multiplicator ); //
}
//================
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool  Ct_Market_Symbol::IsSymbolAvailable( string f_Symbol, /* financial instrument*/ bool f_marketWatch = false ) // search area:// (false - on the server)// (true - in the Market Watch window)
{         for ( int i = SymbolsTotal(f_marketWatch) - 1 ; i >= 0 ; i--) if (f_Symbol == SymbolName(i, f_marketWatch))return true;
          return  false ; //
//Examples of using functions
//1) Check availability of AUDNZD on the trading server:        IsSymbolAvailable ( "AUDNZD" );IsSymbolAvailable ( "AUDNZD.F" );//fractional///
//2) Check availability of AUDNZD in Market Watch window only:  IsSymbolAvailable ( "AUDNZD" , true );
}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double   Ct_Market_Symbol::PointValueByTickSize(string symbol, string FuncCom = "__FUNCSIG__")
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADEPANEL Error",  __LINE__, __FUNCTION__); //|
//====================================PointValueByTickSize
          double PipValueAmount                 = 10;//from symbol bace currency if is usd///
          double tickSize                       = MarketInfo(symbol, MODE_TICKSIZE);       //= SymbolInfoDouble(symbol, SYMBOL_TRADE_TICK_SIZE); //
          double tickValue                      = MarketInfo(symbol, MODE_TICKVALUE);      //= SymbolInfoDouble(symbol, SYMBOL_TRADE_TICK_VALUE); //; //
          double point                          = MarketInfo(symbol, MODE_POINT);          //= SymbolInfoDouble(symbol, SYMBOL_POINT); //; //
          if(point == 0)        point           = 0.0001;               // set to non-fractional
          double                ticksPerPoint   = tickSize / point;     // every Point value by Ticksize//
          if(ticksPerPoint == 0)ticksPerPoint   = 0.0001;               // set to non-fractional
          double                pointValue      = tickValue / ticksPerPoint; //Alert("<pointValue: ", pointValue, "<Point: ", Point, "<tickSize: ", tickSize, "<tickValue: ", tickValue); //
          //PrintFormat("===tickSize=%f  ,tickValue=%f  ,point=%f   ,ticksPerPoint=%f  ,pointValue=%f===", tickSize, tickValue, point, ticksPerPoint, pointValue); //
          //           tickSize=0.001000  //,tickValue=0.100000 //,point=0.010000  //,ticksPerPoint=0.100000  ,pointValue=1.000000
          if(true)
          {         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADEPANEL Error",  __LINE__, __FUNCTION__); //|
                    string Curr_AccountCurrency = AccountCurrency();
                    if(Curr_AccountCurrency == "")Curr_AccountCurrency = "AccountCurrency?"; //
                    //PrintFormat("===Base currency is (%s)====ValuePerPoint for %s is (%f)===" + FuncCom, Curr_AccountCurrency, symbol, pointValue);//string symbol//must existed in market watch
                    ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADEPANEL Error",  __LINE__, __FUNCTION__); //|
          }
//====================================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADEPANEL Error",  __LINE__, __FUNCTION__); //|
          return (pointValue);//
//====================================
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double  Ct_Market_Symbol::GetProperties(int ModeCom = -1, bool AllOrOne = false)
{         //Alert(Selected,ModeCom);
          double result = -1;//________________________________________________________Xerorr.SuperviserX(_LastError, "-C_CHART Error",  __LINE__, __FUNCTION__); //|
//========================================================
          if(!AllOrOne) { return MarketInfo(DevSymbol.Current, ModeCom); }; //
          if(AllOrOne)
                    if(Dev_Checkup_Terminal._Mql_.CONNECTED)//SymbolSet
                    {         //------------------------------------------------------------------------------------------------------
                              _Mql_.Market_LOTSIZE         = GetProperties(MODE_LOTSIZE); //contract size?/>>10,000$ = 1lot
                              _Mql_.Market_LOTSTEP         = GetProperties(MODE_LOTSTEP);
                              _Mql_.Market_MINLOT          = GetProperties(MODE_MINLOT);
                              _Mql_.Market_MAXLOT          = GetProperties(MODE_MAXLOT);
                              _Mql_.Market_STOPLEVEL       = GetProperties(MODE_STOPLEVEL);//For tp/sl
                              _Mql_.Market_TICKVALUE       = GetProperties(MODE_TICKVALUE);//For tp/sl
                              _Mql_.Market_TICKSIZE        = GetProperties(MODE_TICKSIZE);//For tp/sl
                              _Mql_.Market_DIGITS          = (int)GetProperties(MODE_DIGITS);//For tp/sl );
                              _Mql_.Market_SPREAD          = (int)GetProperties(MODE_SPREAD);//For tp/sl );
                              //Alert("__LotSize:", Symbol_LotSize, "__LotStep:", Symbol_LotStep, "__MinLot:",Symbol_MinLot, "__MaxLot:", Symbol_MaxLot, "__MinStop:", Symbol_MinStop, "__TickValue:", Symbol_TickValue, "__TickSize:", Symbol_TickSize);//
                    }
          //---
          {         //cheking
                    if(_Mql_.Market_MAXLOT         == NULL)        _Mql_.Market_MAXLOT        = 5;    /*Alert("MaxLot: ", MaxLot);*/
                    if(_Mql_.Market_MINLOT         == NULL)        _Mql_.Market_MINLOT        = 0.01;
                    if(_Mql_.Market_LOTSTEP        == NULL)        _Mql_.Market_LOTSTEP       = 0.01; //when account mini
                    if(_Mql_.Market_TICKVALUE      == NULL)        _Mql_.Market_TICKVALUE     = 0.1;  //>>> need to check
                    result = +2; //
          }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_CHART Error",  __LINE__, __FUNCTION__); //|
          return result;//
}
//+------------------------------------------------------------------+//PipPoint
//|                                                                  |_9_
//+------------------------------------------------------------------+// //endx
double  Ct_Market_Symbol::PipPoint(string Currency = NULL )//PointsPerPip by digit//OnePipPointCordinate
{         /**
          * determine the pip multiplier (1 or 10) depending on how many
          * digits the EURUSD symbol has. This is done by first
          * finding the exact name of this symbol in the symbols.raw
          * file (it could be EURUSDm or EURUSDiam or any other stupid name
          * the broker comes up with only to break other people's code)
          * and then usig MarketInfo() for determining the digits.
          * ========================================================= * Method 1 - Points
          * 1 pip is a change of value by 0.0001 (non-JPY pairs)
          * 1 pipette is a change of value of 0.00001 (non-JPY pairs)
          * So, if the EUR/USD currency pair rate changes from 1.0980 to 1.0995, it means that the price has increased by 15 pips
          * =========================================================
          * Function to calculate the decimal places.
          * Digits is a native variable in MetaTrader, which is assumes the value
          * of a number of digits after the point in a quote.
          */
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_CHART Error",  __LINE__, __FUNCTION__); //|
          Curr_PointValue = Point;  //Alert("_Curr_PointValue: ", Curr_PointValue); //
          Curr_PipValue   = Point;
          double CalcPipPoint = 0;//
          //Alert("Currency: ", Currency); //
          string suffix = StringSubstr(Currency, 6);///zero is one elements
          ________________________________________________________Xerorr.SuperviserX(_LastError, "StringSubstr-C_CHART Error",  __LINE__, __FUNCTION__); //|
          double CalcDigits = (int)MarketInfo(Currency + suffix, MODE_DIGITS); ResetLastError(); //symbol///check fractional //
          //Alert("_Curr_PointValue: ", Curr_PointValue, "_CalcDigits: ", CalcDigits); //.////calcdigit is zero.
          //=======================================================.
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_CHART Error",  __LINE__, __FUNCTION__); //|
          if(true)//is Points Xauusd or Yen?
          {         if          (CalcDigits == 0)                    {CalcDigits   = (int)MarketInfo(Currency, MODE_DIGITS); }
                    if          (CalcDigits == 2 || CalcDigits == 3) {CalcPipPoint = 0.010; }////ct_XAUUSD///YEN currency     One Pip 0.010
                    else if     (CalcDigits == 4 || CalcDigits == 5) {CalcPipPoint = 0.00010;}////other currency           One Pip 0.00010
          }
          //Alert("_Curr_PointValue: ", Curr_PointValue, "_CalcDigits: ", CalcDigits); //..////calcdigit is two.
          if(false)
          {         double SymPoint;
                    if (Point == 0.00001) SymPoint = 0.0001; //5 digits
                    else if (Point == 0.001) SymPoint = 0.01; //3 digits
                    else SymPoint = Point; //Normal
                    return(0);  ///
          } //
          if(false)
          {         // If there are 3 or fewer digits (JPY, for example), then return 0.01, which is the pip value.
                    if (Digits <= 3)
                    {         return(0.01); }
                    // If there are 4 or more digits, then return 0.0001, which is the pip value.
                    else if (Digits >= 4)
                    {         return(0.0001); }
                    // In all other cases, return 0.
                    else return(0); //
          }
          if(false)
          {         int d = Digits;
                    switch(d)
                    {         case 2 : {return(Point); break;}
                              case 4 : {return(Point); break;}
                              case 3 : {return(Point * 10); break;}
                              case 5 : {return(Point * 10); break;}
                              default : { return d; } //
                    } // I just come up with this. Untested but should be ok/robust. To be used to replace Point for trade parameters calculations.
          }//
//=======================================================
          if(true)//is Points Fractional?
          {         if          (CalcDigits == 0)                       {Curr_PipValue = 1  * Point;}
                    if          (Digits == 3 || Digits == 5)            {Is_Fractional = true;  Curr_PipValue = 10 * Point;} ////ct_XAUUSD///YEN currency
                    if          (Digits == 2 || Digits == 4)            {Is_Fractional = false; Curr_PipValue = 1  * Point;} ////ct_XAUUSD///YEN currency
          }//
//=======================================================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_CHART Error",  __LINE__, __FUNCTION__); //|
          return(POINT_PIP = CalcPipPoint); //
}
//+------------------------------------------------------------------+// 
//|                                                                  |_10_
//+------------------------------------------------------------------+
int  Ct_Market_Symbol::GetSlippage(string Currency, int SlippagePips)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_CHART Error",  __LINE__, __FUNCTION__); //|
          int CalcSlippage = 0;//
          double CalcDigits = MarketInfo(Currency, MODE_DIGITS);
          //=======================================================>>>///ct_XAUUSD.F are  fractional...
          if     (CalcDigits == 2 || CalcDigits == 4) {CalcSlippage = SlippagePips;}////ct_XAUUSD///YEN currency
          else if(CalcDigits == 3 || CalcDigits == 5) {CalcSlippage = SlippagePips * 10;}////other currency
          //=======================================================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_CHART Error",  __LINE__, __FUNCTION__); //|
          return(Slippage = CalcSlippage); //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool  Ct_Market_Symbol::lasttickinfo()//gone global// MqlTick last_tick0; //1.3 get last tick info
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_CHART Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          static int oo = 0;
          static int ooo = 0;
          if(SymbolInfoTick(Symbol(), last_MqlTick))
          {         /*Print(last_tick.time, ": Bid = ", last_tick.bid, " Ask = ", last_tick.ask, "  Volume = ", last_tick.volume = oo++, ": Last = ", last_tick.last = ooo++);*/}
//=========================================================|
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_CHART Error",  __LINE__, __FUNCTION__); return true;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool  Ct_Market_Symbol::GetMarket_TICKNew()
{
//=========================================================|
          //---progress to know what is new tick value of OnTick()
          //IsMarket_TICKNew ? ;
//=========================================================|
          return IsMarket_TICKNew; //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Ct_Market_Symbol::UpdateMarket()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "C_UTILITIES  Error",  __LINE__, __FUNCTION__); //|
          UPDATEDMarket = false;
          //---
          _Mql_.UpdateMarket(DevSymbol.Current);    
          //----------------------------------
          Market_LOTSTEP_DIGITS      = Utilities.CountDecimalPlaces(_Mql_.Market_LOTSTEP);
          if (!ct_Drive.TDD.ct_Size.CalculateUnadjustedPositionSize) Market_LOTSTEP_DIGITS = Utilities.CountDecimalPlaces(_Mql_.Market_LOTSTEP);
          else Market_LOTSTEP_DIGITS = 2;
          //----------------------------------
          MarginForOneLot = _Mql_.Market_MARGINREQUIRED;//
          //----------------------------------
          //----------------------------------
          Is_Live = ct_Series_Base.IsRefreshRate; //RefreshRates() == false
          //---
          GetProperties(-1, true);// new all income symbol prop
          //RefreshRate();
          lasttickinfo();
          //
          PipPoint(DevSymbol.Current);  //PointValueByTickSize(DevSymbol.Current,__FUNCSIG__);
          //
          GetSlippage(DevSymbol.Current, Slippage = 10);
          //---
          Is_Running = Dev_Checkup_Mql._Mql_.TRADE_ALLOWED         &&
                       Dev_Checkup_Terminal._Mql_.TRADE_ALLOWED    &&
                       Dev_Checkup_Terminal._Mql_.CONNECTED        &&
                       ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_TRADEALLOWED &&
                       !Dev_Calender.OffDayTimeLocal ; //
          //----
          //---Alert("Is Run Market: ", Is_Running, "    Dev_Checkup_Mql._Mql_.TRADE_ALLOWED: ", Dev_Checkup_Mql._Mql_.TRADE_ALLOWED, "    Dev_Checkup_Terminal._Mql_.TRADE_ALLOWED: ", Dev_Checkup_Terminal._Mql_.TRADE_ALLOWED, "    Dev_Checkup_Terminal._Mql_.CONNECTED: ", Dev_Checkup_Terminal._Mql_.CONNECTED, "    ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_TRADEALLOWED: ", ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_TRADEALLOWED, "    !Dev_Calender.OffDayTimeLocal: ", ! Dev_Calender.OffDayTimeLocal ); //
          Is_Running ? Status = "AutoTrading: Ok" : Status = "AutoTrading: No"; ////KeyAllow && KeyCONNECT &&
          //==========================================================
          // SYS Timer Cheackup Start C_WINUSER32 App Enviroments<<<<|
          //==========================================================
          //
          UPDATEDMarket = true;
          //
          //==========================================================
          // SYS Timer Cheackup End C_WINUSER32 App Enviroments<<<<<<|
          //==========================================================
          return UPDATEDMarket;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Ct_Market_Symbol::UpdateSymbol()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_BANK Error",  __LINE__, __FUNCTION__);//
          UPDATEDSymbol                       = false;
//=======================================================================
          ///----Symbol in market watch
          DevSymbol.SymbolsTotalCount = _Mql_.__SymbolsTotal(false);
          DevSymbol.SymbolsTotalOn    = _Mql_.__SymbolsTotal(true);
          DevSymbol.SymbolsTotalOff   = DevSymbol.SymbolsTotalCount - DevSymbol.SymbolsTotalOn;
//----------------------------------------------------------------
          SetSymbolCurrent();                                 ///---#1
          //---
          _Mql_.UpdateSymbol(DevSymbol.Current);                ///---#2
          //---
          {         PositionData_Swap.SwapsTripleDay       = EnumToString(_Mql_.Symbol_SWAP_ROLLOVER3DAYS);
                    string lowercase_part                  = StringSubstr(PositionData_Swap.SwapsTripleDay, 1); StringToLower(lowercase_part);
                    PositionData_Swap.SwapsTripleDay       = CharToString((uchar)PositionData_Swap.SwapsTripleDay[0]) + lowercase_part; //
          }
          //==========================================================
          // SYS Timer Cheackup Start C_WINUSER32 App Enviroments<<<<|
          //==========================================================
          //
          UPDATEDSymbol                       = true;
          //
          //==========================================================
          // SYS Timer Cheackup End C_WINUSER32 App Enviroments<<<<<<|
          //==========================================================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_CHART Error",  __LINE__, __FUNCTION__); //|
          return UPDATEDSymbol;//
}
//+------------------------------------------------------------------+
//| // Print out broker details and other info                       |
//+------------------------------------------------------------------+
void  Ct_Market_Symbol::sub_printdetails()
{         //--------------------------
          string       Configuration                                               = "==== Configuration ====";
          bool         ReverseTrade                                                = false; // If TRUE, then trade in opposite direction
          int                    Magic                                                                 = -1;     // If set to a number less than 0 it will calculate MagicNumber automatically
          string       OrderCmt                                                    = "XMT-Scalper 2.46"; // Trade comments that appears in the Trade and Account History tab
          bool         ECN_Mode                                                    = false;  // True for brokers that don't accept SL and TP to be sent at the same time as the order
          bool         Debug                                                       = false;  // Print huge log files with info, only for debugging purposes
          bool         Verbose                                                     = false;  // Additional information printed in the chart
//-----------------------------
          double G_balance = 0;                   // Balance for this EA
          double Array_spread[30];      // Store spreads for the last 30 tics
          double LotSize_ = 0;                               // Lotsize
          double Highest = 0;                                // LotSize indicator value
          double Lowest = 0;                                             // Lowest indicator value
          double StopLevel = 0;                               // Broker StopLevel
          double StopOut = 0;                                  // Broker stoput percentage
          double LotStep_ = 0;                                  // Broker _Mql_.Market_LOTSTEP
          double Avg_tickspermin = 0;                // Used for simulation of latency during backtests
          double MarginFree = 0;         // Free margin in percentage
          //--------------------------------------------
          int LotBase;                                                // Amount of money in base currency for 1 lot
          LotBase = (int)MarketInfo ( Symbol(), MODE_LOTSIZE ); //
          double       StopLoss                                                    = 60;     // StopLoss from as many points. Default 60 (= 6 pips)
          double       TakeProfit                                                            = 100; // TakeProfit from as many points. Default 100 (= 10 pip)
          double       AddPriceGap                                                 = 0; // Additional price gap in points added to SL and TP in order to avoid Error 130
          double       TrailingStart                                               = 20;     // Start trailing profit from as so many points.
          //----------------------------------------------
          string margintext;
          string stopouttext;
          string fixedlots;
          int type;
          int freemarginmode;
          int stopoutmode;
          double newsl;
          newsl = MathMax ( StopLoss, 10 );
          type = IsDemo() + IsTesting();
          freemarginmode = AccountFreeMarginMode();
          stopoutmode = AccountStopoutMode();
          if ( freemarginmode == 0 )
                    margintext = "that floating profit/loss is not used for calculation.";
          else if ( freemarginmode == 1 )
                    margintext = "both floating profit and loss on open positions.";
          else if ( freemarginmode == 2 )
                    margintext = "only profitable values, where current loss on open positions are not included.";
          else if ( freemarginmode == 3 )
                    margintext = "only loss values are used for calculation, where current profitable open positions are not included.";
          if ( stopoutmode == 0 )
                    stopouttext = "percentage ratio between margin and equity.";
          else if ( stopoutmode == 1 )
                    stopouttext = "comparison of the free margin level to the absolute value.";
          if ( MoneyManagement == TRUE )
                    fixedlots = " (automatically calculated lots).";
          if ( MoneyManagement == false )
                    fixedlots = " (fixed manual lots).";
          Print ( "Broker name: ", AccountCompany() );
          Print ( "Broker server: ", AccountServer() );
          Print ( "Account type: ", StringSubstr ( "RealDemoTest", 4 * type, 4) );
          Print ( "Initial account equity: ", AccountEquity(), " ", AccountCurrency() );
          Print ( "Broker digits: ", BrokerDigits);
          Print ( "Broker StopLevel / freezelevel (max): ", StopLevel );
          Print ( "Broker StopOut level: ", StopOut, "%" );
          Print ( "Broker Point: ", DoubleToStr ( Point, BrokerDigits ), " on ", AccountCurrency() );
          Print ( "Broker account Leverage in percentage: ", Leverage );
          Print ( "Broker credit value on the account: ", AccountCredit() );
          Print ( "Broker account margin: ", AccountMargin() );
          Print ( "Broker calculation of free margin allowed to open positions considers " + margintext );
          Print ( "Broker calculates StopOut level as " + stopouttext );
          Print ( "Broker requires at least ", MarginForOneLot, " ", AccountCurrency(), " in margin for 1 lot." );
          Print ( "Broker set 1 lot to trade ", LotBase, " ", AccountCurrency() );
          Print ( "Broker minimum allowed LotSize: ", MinLots );
          Print ( "Broker maximum allowed LotSize: ", MaxLots );
          Print ( "Broker allow lots to be resized in ", LotStep_, " steps." );
          Print ( "Risk: ", Risk, "%" );
          Print ( "Risk adjusted LotSize: ", DoubleToStr ( LotSize_, 2 ) + fixedlots );//
}


//+------------------------------------------------------------------+
//| Gets info on overnight swaps.                                    |
//+------------------------------------------------------------------+
void  Ct_Market_Symbol::GetSwapData(const string SymbolIn, const string Account_Currency, const string Symbol_CURRENCY_PROFIT, const double Market_TICKSIZE, const double Market_LOTSIZE)
{
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
          int           swap_type       = (int)MarketInfo(SymbolIn, MODE_SWAPTYPE);
          double        swap_long       = MarketInfo(SymbolIn, MODE_SWAPLONG);
          double        swap_short      = MarketInfo(SymbolIn, MODE_SWAPSHORT);
          double        swap_long_1_lot = EMPTY_VALUE, swap_short_1_lot = EMPTY_VALUE;
          //+------------------------------------------------------------------+
          //|                                                                  |
          //+------------------------------------------------------------------+
          switch(swap_type)
          {         case 0:// Pips
                    {         double tick_value;
                              double tick_value_long;
                              double tick_value_short;
                              //----------------------
                              if ((PositionData_Swap.ProfitCalcMode == 1) || ((PositionData_Swap.ProfitCalcMode == 2) && (Symbol_CURRENCY_PROFIT != Account_Currency))) // CFD or Futures with different account currency.
                              {         //------------------------------------------------
                                        if (PositionData_Swap.ProfitCalcMode == 2)      tick_value = MarketInfo(SymbolIn, MODE_TICKVALUE); // Futures, but will still have to be adjusted by CCC.
                                        else                                            tick_value = Market_TICKSIZE * Market_LOTSIZE; // Apparently, it is more accurate than taking TICKVALUE directly in some cases.
                                        //-------------------------------------------------
                                        tick_value_long         = tick_value;
                                        tick_value_short        = tick_value;
                                        //+------------------------------------------------------------------+
                                        //|                                                                  |
                                        //+------------------------------------------------------------------+
                                        // If profit currency is different from account currency.
                                        if (Symbol_CURRENCY_PROFIT != Account_Currency)
                                        {         //-------------------------
                                                  // Adjust the unit cost.
                                                  double CCC;
                                                  //-------------------------
                                                  if (tick_value_long > 0)              CCC =   CalculateAdjustment(Account_Currency, Symbol_CURRENCY_PROFIT, Profit); // Positive swap - pip value based profit calcution.
                                                  else if (tick_value_long < 0)         CCC =   CalculateAdjustment(Account_Currency, Symbol_CURRENCY_PROFIT, Loss); // Negative swap - pip value based loss calcution.
                                                  else CCC = 0;
                                                  //-------------------------
                                                  tick_value_long *= CCC;
                                                  //-------------------------
                                                  if (tick_value_short > 0)             CCC =   CalculateAdjustment(Account_Currency, Symbol_CURRENCY_PROFIT, Profit); // Positive swap - pip value based profit calcution.
                                                  else if (tick_value_short < 0)        CCC =   CalculateAdjustment(Account_Currency, Symbol_CURRENCY_PROFIT, Loss); // Negative swap - pip value based loss calcution.
                                                  else CCC = 0;
                                                  //-------------------------
                                                  tick_value_short *= CalculateAdjustment(Account_Currency, Symbol_CURRENCY_PROFIT, OP_SELL);; //
                                                  //-------------------------
                                        } //
                              }
                              else
                              {         tick_value              = MarketInfo(SymbolIn, MODE_TICKVALUE); // Same currency futures or Forex.
                                        tick_value_long         = tick_value;
                                        tick_value_short        = tick_value; //
                              }
                              //+------------------------------------------------------------------+
                              //|                                                                  |
                              //+------------------------------------------------------------------+
                              PositionData_Swap.OutputSwapsType = "Pips";
                              swap_long_1_lot = swap_long * tick_value_long;
                              swap_short_1_lot = swap_short * tick_value_short; //
                    }
                    break;
                    //+------------------------------------------------------------------+
                    //|                                                                  |
                    //+------------------------------------------------------------------+
                    case 1:// Base currency
                    {         string base_currency = SymbolInfoString(SymbolIn, SYMBOL_CURRENCY_BASE);
                              PositionData_Swap.OutputSwapsType = "Base currency (" + base_currency + ")";
                              // Simple case:
                              if (Account_Currency == base_currency)
                              {         swap_long_1_lot = swap_long;
                                        swap_short_1_lot = swap_short; //
                              }
                              // Need to find the current BAS/ACC or ACC/BAS rate.
                              else
                              {         if (Account_Currency == Symbol_CURRENCY_PROFIT) // Simple case - use Symbol rates for conversion:
                                        {         if (sets.EntryType == Instant)
                                                  {         swap_long_1_lot = swap_long * Bid;
                                                            swap_short_1_lot = swap_short * Bid; //
                                                  }
                                                  // For pending orders, we may use the pending order's open price for calculation.
                                                  else
                                                  {         swap_long_1_lot = swap_long * sets.EntryLevel;
                                                            swap_short_1_lot = swap_short * sets.EntryLevel; //
                                                  } //
                                        }
                                        // Go through Market Watch trying to find the currency pair with both base_currency and Account_.Currency in it.
                                        else
                                        {         if (PositionData_Swap.SwapConversionSymbol == "") // Hasn't been found yet.
                                                  {         // Number of symbols in Market Watch (even if they are not visible there).
                                                            int symbols_total = SymbolsTotal(false);
                                                            for (int i = 0; i < symbols_total; i++)
                                                            {         string symbol = SymbolName(i, false);
                                                                      if (MarketInfo(symbol, MODE_PROFITCALCMODE) != 0) continue;
                                                                      string base_currency_s = SymbolInfoString(symbol, SYMBOL_CURRENCY_BASE);
                                                                      string profit_currency_s = SymbolInfoString(symbol, SYMBOL_CURRENCY_PROFIT);
                                                                      // Found BAS/ACC currency pair.
                                                                      if (((base_currency_s == base_currency) && (profit_currency_s == Account_Currency))
                                                                                          // Found ACC/BAS currency pair.
                                                                                          || ((base_currency_s == Account_Currency) && (profit_currency_s == base_currency)))
                                                                      {         PositionData_Swap.SwapConversionSymbol = symbol;
                                                                                break; //
                                                                      }//
                                                            }//
                                                  }
                                                  if (PositionData_Swap.SwapConversionSymbol != "") // Already found.
                                                  {         string base_currency_s = SymbolInfoString(PositionData_Swap.SwapConversionSymbol, SYMBOL_CURRENCY_BASE);
                                                            string profit_currency_s = SymbolInfoString(PositionData_Swap.SwapConversionSymbol, SYMBOL_CURRENCY_PROFIT);
                                                            SymbolSelect(PositionData_Swap.SwapConversionSymbol, true);
                                                            // It is a BAS/ACC currency pair.
                                                            if ((base_currency_s == base_currency) && (profit_currency_s == Account_Currency))
                                                            {         double bid = SymbolInfoDouble(PositionData_Swap.SwapConversionSymbol, SYMBOL_BID);
                                                                      // Symbol not yet synced.
                                                                      if (!bid) break;
                                                                      // Symbol is synchronized and can be used for swap calculation.
                                                                      swap_long_1_lot = swap_long * bid;
                                                                      swap_short_1_lot = swap_short * bid;
                                                                      break;//
                                                            }
                                                            // It is an ACC/BAS currency pair.
                                                            else if ((base_currency_s == Account_Currency) && (profit_currency_s == base_currency))
                                                            {         double ask = SymbolInfoDouble(PositionData_Swap.SwapConversionSymbol, SYMBOL_ASK);
                                                                      // Symbol not yet synced.
                                                                      if (!ask) break;
                                                                      // Symbol is synchronized and can be used for swap calculation.
                                                                      swap_long_1_lot = swap_long / ask;
                                                                      swap_short_1_lot = swap_short / ask;
                                                                      break;//
                                                            } //
                                                  }//
                                        } //
                              } //
                    }
                    break;
                    //+------------------------------------------------------------------+
                    //|                                                                  |
                    //+------------------------------------------------------------------+
                    case 2:// Interest - based on price during rollover.
                    {         double symbol_cost_1_lot_profit, symbol_cost_1_lot_loss;
                              PositionData_Swap.OutputSwapsType = "Interest";
                              // Calculate it by pending order's price.
                              // If Forex or futures (same currency), current formula should be OK.
                              if ((PositionData_Swap.ProfitCalcMode != 1) && ((PositionData_Swap.ProfitCalcMode != 2) || (Symbol_CURRENCY_PROFIT != Account_Currency))) // Not CFD and (not futures or account currency same as profit currency).
                              {         if (sets.EntryType == Pending) symbol_cost_1_lot_loss = SymbolInfoDouble(SymbolIn, SYMBOL_TRADE_TICK_VALUE) * sets.EntryLevel / Market_TICKSIZE;
                                        // Calculate it by current price of contract - it is impossible to determine potential future price.
                                        else symbol_cost_1_lot_loss = SymbolInfoDouble(SymbolIn, SYMBOL_TRADE_TICK_VALUE) * SymbolInfoDouble(SymbolIn, SYMBOL_ASK) / Market_TICKSIZE;
                                        symbol_cost_1_lot_profit = symbol_cost_1_lot_loss;//
                              }
                              // If CFD and profit currency = account currency, then contract_size * price.
                              // If CFD and profit currency != account currency, then contract_size * price using adjustment.
                              else // CFD.
                              {         if (sets.EntryType == Pending)
                                        {         if (PositionData_Swap.ProfitCalcMode == 2) symbol_cost_1_lot_loss = SymbolInfoDouble(SymbolIn, SYMBOL_TRADE_TICK_VALUE) * sets.EntryLevel / Market_TICKSIZE;
                                                  else symbol_cost_1_lot_loss   = Market_LOTSIZE * sets.EntryLevel; //
                                        }
                                        // Calculate it by current price of contract - it is impossible to determine potential future price.
                                        else
                                        {         if (PositionData_Swap.ProfitCalcMode == 2) symbol_cost_1_lot_loss = SymbolInfoDouble(SymbolIn, SYMBOL_TRADE_TICK_VALUE) * SymbolInfoDouble(SymbolIn, SYMBOL_ASK) / Market_TICKSIZE;
                                                  else symbol_cost_1_lot_loss   = Market_LOTSIZE * SymbolInfoDouble(SymbolIn, SYMBOL_ASK); //
                                        }
                                        if (Symbol_CURRENCY_PROFIT != Account_Currency)
                                        {         double CCC_loss               =  CalculateAdjustment(Account_Currency, Symbol_CURRENCY_PROFIT, Loss);
                                                  double CCC_profit             =  CalculateAdjustment(Account_Currency, Symbol_CURRENCY_PROFIT, Profit);
                                                  // Adjust the unit cost.
                                                  symbol_cost_1_lot_profit      = symbol_cost_1_lot_loss * CCC_profit;
                                                  symbol_cost_1_lot_loss        = symbol_cost_1_lot_loss * CCC_loss; //
                                        }
                                        else symbol_cost_1_lot_profit = symbol_cost_1_lot_loss; //
                              }
                              // Percentage per 360 days.
                              if (swap_long > 0) swap_long_1_lot = swap_long * symbol_cost_1_lot_profit / 100 / 360; // Positive swap - pip value based profit calcution.
                              else if (swap_long < 0) swap_long_1_lot = swap_long * symbol_cost_1_lot_loss / 100 / 360; // Negative swap - pip value based loss calcution.
                              else swap_long_1_lot = 0;
                              if (swap_short > 0) swap_short_1_lot = swap_short * symbol_cost_1_lot_profit / 100 / 360; // Positive swap - pip value based profit calcution.
                              else if (swap_short < 0) swap_short_1_lot = swap_short * symbol_cost_1_lot_loss / 100 / 360; // Negative swap - pip value based loss calcution.
                              else swap_short_1_lot = 0;
                              // Stupid fix for strange cases when swap is given not in percentage points but in coefficient (?).
                              if (MathAbs(swap_long) < 0.1)
                              {         swap_long_1_lot *= 1000;
                                        swap_short_1_lot *= 1000; //
                              }
                              break; //
                    }
                    //+------------------------------------------------------------------+
                    //|                                                                  |
                    //+------------------------------------------------------------------+
                    case 3:// Account currency.
                              PositionData_Swap.OutputSwapsType = Account_Currency;
                              swap_long_1_lot = swap_long;
                              swap_short_1_lot = swap_short;
                              break;
                    default:
                              break; //
          }
          //+------------------------------------------------------------------+
          //|                                                                  |
          //+------------------------------------------------------------------+
          if ((swap_long_1_lot != EMPTY_VALUE) && (swap_short_1_lot != EMPTY_VALUE))
          {         PositionData_Swap.OutputSwapsDailyLongLot             = Utilities.FormatDouble(DoubleToString(swap_long_1_lot, 2));
                    PositionData_Swap.OutputSwapsDailyShortLot            = Utilities.FormatDouble(DoubleToString(swap_short_1_lot, 2));
                    PositionData_Swap.OutputSwapsCurrencyDailyLot         = Account_Currency + " per lot";
                    PositionData_Swap.OutputSwapsDailyLongPS              = Utilities.FormatDouble(DoubleToString(swap_long_1_lot *  PositionData.OutputPositionSize, 2));
                    PositionData_Swap.OutputSwapsDailyShortPS             = Utilities.FormatDouble(DoubleToString(swap_short_1_lot * PositionData.OutputPositionSize, 2));
                    PositionData_Swap.OutputSwapsCurrencyDailyPS          = Account_Currency + " per PS (" + DoubleToString(PositionData.OutputPositionSize, 2) + ")";
                    PositionData_Swap.OutputSwapsYearlyLongLot            = Utilities.FormatDouble(DoubleToString(swap_long_1_lot * 360, 2));
                    PositionData_Swap.OutputSwapsYearlyShortLot           = Utilities.FormatDouble(DoubleToString(swap_short_1_lot * 360, 2));
                    PositionData_Swap.OutputSwapsCurrencyYearlyLot        = Account_Currency + " per lot";
                    PositionData_Swap.OutputSwapsYearlyLongPS             = Utilities.FormatDouble(DoubleToString(swap_long_1_lot * 360 *  PositionData.OutputPositionSize, 2));
                    PositionData_Swap.OutputSwapsYearlyShortPS            = Utilities.FormatDouble(DoubleToString(swap_short_1_lot * 360 * PositionData.OutputPositionSize, 2));
                    PositionData_Swap.OutputSwapsCurrencyYearlyPS         = Account_Currency + " per PS (" + DoubleToString(PositionData.OutputPositionSize, 2) + ")"; //
          }//
}

//+------------------------------------------------------------------+
//| Calculates risk size and position size. Sets object values.      |
//+------------------------------------------------------------------+
void   Ct_Market_Symbol::CalculatePortfolioRisk(const string SymbolIn, const string Account_Currency, const string Symbol_CURRENCY_PROFIT)
{         PositionData_Portfolio.LossMoney = 0;
          PositionData_Portfolio.RewardMoney = 0;
          double volume = 0;
          int total = OrdersTotal();
          for (int i = 0; i < total; i++)
          {         double PipsLoss = 0;
                    double PipsReward = 0;
                    // Select an order.
                    if (!OrderSelect(i, SELECT_BY_POS)) continue;
                    // Skip orders in other symbols if the ignore checkbox is ticked.
                    if ((OrderSymbol() != SymbolIn) && (sets.IgnoreOtherSymbols)) continue;
                    //--------------------------------------------------------------------------------------------------------------------
                    // Buy
                    if ((OrderType() == ORDER_TYPE_BUY) || (((OrderType() == ORDER_TYPE_BUY_LIMIT) || (OrderType() == ORDER_TYPE_BUY_STOP)) && (sets.CountPendingOrders)))
                    {         if (OrderStopLoss() == 0)
                              {         // Losing all the current value.
                                        if (!sets.IgnoreOrdersWithoutStopLoss) PipsLoss = OrderOpenPrice(); }
                              else
                              {         PipsLoss = OrderOpenPrice() - OrderStopLoss(); }
                              if (OrderTakeProfit() == 0)
                              {         // Potential reward is infinite.
                                        if (!sets.IgnoreOrdersWithoutStopLoss) PipsReward = DBL_MAX; }
                              else
                              {         PipsReward = OrderTakeProfit() - OrderOpenPrice(); }
                              volume += OrderLots(); //
                    }
                    //--------------------------------------------------------------------------------------------------------------------
                    // Sell
                    else if ((OrderType() == ORDER_TYPE_SELL) || (((OrderType() == ORDER_TYPE_SELL_LIMIT) || (OrderType() == ORDER_TYPE_SELL_STOP)) && (sets.CountPendingOrders)))
                    {         if (OrderStopLoss() == 0)
                              {         // Potential loss is infinite.
                                        if (!sets.IgnoreOrdersWithoutStopLoss) PipsLoss = DBL_MAX; }
                              else
                              {         PipsLoss = OrderStopLoss() - OrderOpenPrice(); }
                              if (OrderTakeProfit() == 0)
                              {         // Gaining all way down.
                                        if (!sets.IgnoreOrdersWithoutStopLoss) PipsReward = OrderOpenPrice(); }
                              else
                              {         PipsReward = OrderOpenPrice() - OrderTakeProfit(); }
                              volume += OrderLots(); //
                    }
                    //--------------------------------------------------------------------------------------------------------------------
                    if ((PipsLoss != DBL_MAX) && (PositionData_Portfolio.LossMoney != DBL_MAX))
                    {         double TickSize_local = MarketInfo(OrderSymbol(), MODE_TICKSIZE);
                              double UnitCost;
                              // If Symbol is CFD.
                              if ((int)MarketInfo(OrderSymbol(), MODE_PROFITCALCMODE) == 1)
                                        UnitCost = TickSize_local * SymbolInfoDouble(OrderSymbol(), SYMBOL_TRADE_CONTRACT_SIZE);
                              else UnitCost = MarketInfo(OrderSymbol(), MODE_TICKVALUE); // Non-CFD.
                              if ((int)MarketInfo(OrderSymbol(), MODE_PROFITCALCMODE) != 0) // Non-Forex might need to be adjusted.
                              {         // If profit currency is different from account currency.
                                        string symbol_profit_currency = SymbolInfoString(OrderSymbol(), SYMBOL_CURRENCY_PROFIT);
                                        //--------------------------------------------------------------------------------------------------------------------
                                        if (symbol_profit_currency != Account_Currency)
                                        {         /*ENUM_ORDER_TYPE dir = (ENUM_ORDER_TYPE)OrderType();
                                                  if ((dir == ORDER_TYPE_BUY_LIMIT) || (dir == ORDER_TYPE_BUY_STOP)) dir = OP_BUY;
                                                  else if ((dir == ORDER_TYPE_SELL_LIMIT) || (dir == ORDER_TYPE_SELL_STOP)) dir = OP_SELL;*/
                                                  if (symbol_profit_currency == Symbol_CURRENCY_PROFIT) symbol_profit_currency = ""; // Same as global symbol - reference pair has already been found probably.
                                                  // Adjust the unit cost.
                                                  UnitCost *= CalculateAdjustment(Account_Currency, Symbol_CURRENCY_PROFIT, Loss, symbol_profit_currency);; //
                                        } //
                              }
                              //--------------------------------------------------------------------------------------------------------------------
                              if (TickSize_local == 0) { Print("Cannot retrieve tick size for ", OrderSymbol(), ". Looks like the instrument is no longer available. Calculation may not be accurate."); }
                              else
                              {         // If account currency == pair's base currency, adjust UnitCost to future rate (SL). Works only for Forex pairs.
                                        if ((Account_Currency == SymbolInfoString(OrderSymbol(), SYMBOL_CURRENCY_BASE)) && ((int)MarketInfo(OrderSymbol(), MODE_PROFITCALCMODE) == 0))
                                        {         double current_rate = 1, future_rate = 1;
                                                  ct_Series_Base.RefreshRate();
                                                  //--------------------------------------------------------------------------------------------------------------------
                                                  if ((OrderType() == ORDER_TYPE_BUY) || (OrderType() == ORDER_TYPE_BUY_LIMIT) || (OrderType() == ORDER_TYPE_BUY_STOP))
                                                  {         current_rate        = SymbolInfoDouble(OrderSymbol(), SYMBOL_ASK);
                                                            future_rate         = current_rate - PipsLoss; }
                                                  else if ((OrderType() == ORDER_TYPE_SELL) || (OrderType() == ORDER_TYPE_SELL_LIMIT) || (OrderType() == ORDER_TYPE_SELL_STOP))
                                                  {         current_rate        = SymbolInfoDouble(OrderSymbol(), SYMBOL_BID);
                                                            future_rate         = current_rate + PipsLoss; }
                                                  if (OrderOpenPrice() == PipsLoss) PositionData_Portfolio.LossMoney = DBL_MAX; // Zero divide prevention + more accurate potential loss reporting.
                                                  else UnitCost *= (current_rate / future_rate); }
                                        if (PositionData_Portfolio.LossMoney != DBL_MAX) PositionData_Portfolio.LossMoney += OrderLots() * PipsLoss * UnitCost / TickSize_local; //
                              }//
                              //--------------------------------------------------------------------------------------------------------------------
                    }
                    else {PositionData_Portfolio.LossMoney = DBL_MAX; } // Infinite loss.
                    //--------------------------------------------------------------------------------------------------------------------
                    if ((PipsReward != DBL_MAX) && (PositionData_Portfolio.RewardMoney != DBL_MAX))
                    {         double TickSize_local = MarketInfo(OrderSymbol(), MODE_TICKSIZE);
                              double UnitCost;
                              //--------------------------------------------------------------------------------------------------------------------
                              // If Symbol is CFD.
                              if ((int)MarketInfo(OrderSymbol(), MODE_PROFITCALCMODE) == 1)
                                        UnitCost = TickSize_local * SymbolInfoDouble(OrderSymbol(), SYMBOL_TRADE_CONTRACT_SIZE);
                              else UnitCost = MarketInfo(OrderSymbol(), MODE_TICKVALUE); // Non-CFD.
                              //--------------------------------------------------------------------------------------------------------------------
                              if ((int)MarketInfo(OrderSymbol(), MODE_PROFITCALCMODE) != 0) // Non-Forex might need to be adjusted.
                              {         // If profit currency is different from account currency.
                                        string symbol_profit_currency = SymbolInfoString(OrderSymbol(), SYMBOL_CURRENCY_PROFIT);
                                        if (symbol_profit_currency != Account_Currency)
                                        {         /*ENUM_ORDER_TYPE dir = (ENUM_ORDER_TYPE)OrderType();
                                                  if ((dir == ORDER_TYPE_BUY_LIMIT) || (dir == ORDER_TYPE_BUY_STOP)) dir = OP_BUY;
                                                  else if ((dir == ORDER_TYPE_SELL_LIMIT) || (dir == ORDER_TYPE_SELL_STOP)) dir = OP_SELL;*/
                                                  if (symbol_profit_currency == Symbol_CURRENCY_PROFIT) symbol_profit_currency = ""; // Same as global symbol - reference pair has already been found probably.
                                                  // Adjust the unit cost.
                                                  UnitCost *= CalculateAdjustment(Account_Currency, Symbol_CURRENCY_PROFIT, Profit, symbol_profit_currency); //
                                        } //
                              }
                              //--------------------------------------------------------------------------------------------------------------------
                              if (TickSize_local == 0) {Print("Cannot retrieve tick size for ", OrderSymbol(), ". Looks like the instrument is no longer available. Calculation may not be accurate."); }
                              else
                              {         // If account currency == pair's base currency, adjust UnitCost to future rate (TP). Works only for Forex pairs.
                                        if ((Account_Currency == SymbolInfoString(OrderSymbol(), SYMBOL_CURRENCY_BASE)) && ((int)MarketInfo(OrderSymbol(), MODE_PROFITCALCMODE) == 0))
                                        {         double current_rate = 1, future_rate = 1;
                                                  ct_Series_Base.RefreshRate();
                                                  if ((OrderType() == ORDER_TYPE_BUY) || (OrderType() == ORDER_TYPE_BUY_LIMIT) || (OrderType() == ORDER_TYPE_BUY_STOP))
                                                  {         current_rate        = SymbolInfoDouble(OrderSymbol(), SYMBOL_ASK);
                                                            future_rate         = current_rate + PipsReward; }
                                                  else if ((OrderType() == ORDER_TYPE_SELL) || (OrderType() == ORDER_TYPE_SELL_LIMIT) || (OrderType() == ORDER_TYPE_SELL_STOP))
                                                  {         current_rate        = SymbolInfoDouble(OrderSymbol(), SYMBOL_BID);
                                                            future_rate         = current_rate - PipsReward; }
                                                  if (OrderOpenPrice() == PipsReward) PositionData_Portfolio.RewardMoney = DBL_MAX; // Zero divide prevention + more accurate potential profit reporting.
                                                  else UnitCost *= (current_rate / future_rate); //
                                        }
                                        if (PositionData_Portfolio.RewardMoney != DBL_MAX) PositionData_Portfolio.RewardMoney += OrderLots() * PipsReward * UnitCost / TickSize_local; //
                              } //
                    }
                    else {PositionData_Portfolio.RewardMoney = DBL_MAX; }  // Infinite profit. //
                    //--------------------------------------------------------------------------------------------------------------------
          }
          //--------------------------------------------------------------------------------------------------------------------
// If account size did not load yet.
          if (ct_Drive.TDD.ct_Account.Account_Data.Size == 0) return;
          if (PositionData_Portfolio.LossMoney == DBL_MAX)   PositionData_RiskReward.PLM     = "      Infinity";
          else                                  PositionData_RiskReward.PLM     = Utilities.FormatDouble(DoubleToString(PositionData_Portfolio.LossMoney, 2));
          if (PositionData_Portfolio.LossMoney == DBL_MAX)   PositionData_RiskReward.CPR     = "      Infinity";
          else                                  PositionData_RiskReward.CPR     = Utilities.FormatDouble(DoubleToString(PositionData_Portfolio.LossMoney / ct_Drive.TDD.ct_Account.Account_Data.Size * 100, 2));
          if (PositionData_Portfolio.LossMoney == DBL_MAX)   PositionData_RiskReward.PPMR    = "      Infinity";
          else                                  PositionData_RiskReward.PPMR    = Utilities.FormatDouble(DoubleToString(PositionData_Portfolio.LossMoney + PositionData_RiskReward.OutputRiskMoney, 2));
          if (PositionData_Portfolio.LossMoney == DBL_MAX)   PositionData_RiskReward.PPR     = "      Infinity";
          else                                  PositionData_RiskReward.PPR     = Utilities.FormatDouble(DoubleToString((PositionData_Portfolio.LossMoney + PositionData_RiskReward.OutputRiskMoney) / ct_Drive.TDD.ct_Account.Account_Data.Size * 100, 2));
          if (PositionData_Portfolio.RewardMoney == DBL_MAX) PositionData_RiskReward.PRM     = "      Infinity";
          else                                  PositionData_RiskReward.PRM     = Utilities.FormatDouble(DoubleToString(PositionData_Portfolio.RewardMoney, 2));
          if (PositionData_Portfolio.RewardMoney == DBL_MAX) PositionData_RiskReward.CPRew   = "      Infinity";
          else                                  PositionData_RiskReward.CPRew   = Utilities.FormatDouble(DoubleToString(PositionData_Portfolio.RewardMoney / ct_Drive.TDD.ct_Account.Account_Data.Size * 100, 2));
          if ((PositionData_Portfolio.RewardMoney == DBL_MAX) || (PositionData_RiskReward.OutputReward == 0))        PositionData_RiskReward.PPMRew = "      Infinity";
          else                                                                  PositionData_RiskReward.PPMRew = Utilities.FormatDouble(DoubleToString(PositionData_Portfolio.RewardMoney + PositionData_RiskReward.OutputReward, 2));
          if ((PositionData_Portfolio.RewardMoney == DBL_MAX) || (PositionData_RiskReward.OutputReward == 0))        PositionData_RiskReward.PPRew = "      Infinity";
          else                                                                  PositionData_RiskReward.PPRew = Utilities.FormatDouble(DoubleToString((PositionData_Portfolio.RewardMoney + PositionData_RiskReward.OutputReward) / ct_Drive.TDD.ct_Account.Account_Data.Size * 100, 2));
          PositionData_RiskReward.CPL = Utilities.FormatDouble(DoubleToString(volume, (int)MarketInfo(SymbolIn, MODE_DIGITS)), (int)MarketInfo(SymbolIn, MODE_DIGITS));
          PositionData_RiskReward.PPL = Utilities.FormatDouble(DoubleToString(volume + PositionData.OutputPositionSize, (int)MarketInfo(SymbolIn, MODE_DIGITS)), (int)MarketInfo(SymbolIn, MODE_DIGITS)); //
}
//+------------------------------------------------------------------+
//|                         Pip Point                                |9
//+------------------------------------------------------------------+
double PipPointGlobla(string Currency)
{         double CalcPoint = 0;
          double CalcDigits = MarketInfo(Currency, MODE_DIGITS);
          if(CalcDigits == 2 || CalcDigits == 3)        CalcPoint = 0.01;
          else if(CalcDigits == 4 || CalcDigits == 5)   CalcPoint = 0.0001;
          return(CalcPoint); //
}
//+------------------------------------------------------------------+
//|                         Get Slippage                             |10
//+------------------------------------------------------------------+
int GetSlippageGlobla(string Currency, int SlippagePips)
{         int CalcSlippage = 0;
          double CalcDigits = MarketInfo(Currency, MODE_DIGITS);
          if(CalcDigits == 2 || CalcDigits == 4)        CalcSlippage = SlippagePips;
          else if(CalcDigits == 3 || CalcDigits == 5)   CalcSlippage = SlippagePips * 10;
          return(CalcSlippage); //
}
//+------------------------------------------------------------------+
//|             Class MyRoboTrader     BEGIN                         |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void  _SymbolsArrayDigits ()
{         string SymbolsArray [] = { "GBPUSD", "USDCHF", "USDJPY", "EURJPY", "GOLD" };// --- array with symbols
          for ( int i = ArraySize (SymbolsArray) - 1 ; i >= 0 ; i--)// --- find and display the quotation precision for each symbol
          {         string DigitsSymbol = DoubleToString ( MarketInfo (SymbolsArray [i], MODE_DIGITS ), 0);
                    Print ( "For", SymbolsArray [i], "price accuracy =", DigitsSymbol, "decimals." );//
          } //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int symbolIndexinList(int  index = 0 )
{
// ---
          ;
          bool selectedMW = true ;
          bool selectedGL = false ;
// --- find the name of the financial instrument in the Market window
          string symbolMW = SymbolName (index, selectedMW);
// --- find the name of the financial instrument in the general account list
          string symbolGL = SymbolName (index, selectedGL);
// --- display the results
          Print ( "In MarketWatch financial instrument with index", index, "=", symbolMW);
          Print ( "In general list financial instrument with index", index, "=", symbolGL);
          return index;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void  _9OnStart ()
{
// --- put GOLD in the Market window
          bool switchOn_GOLD = SymbolSelect ( "GOLD", true );
// ---
          if (switchOn_GOLD == true )
                    Print ( "You've successfully placed GOLD in the Market window." );
          else
                    Print ( "Could not put GOLD in Market window!",
                            "Error =", GetLastError ());
// --- put NoSymbol in the Market window
          bool switchOn_NoSymbol = SymbolSelect ("NoSymbol", true );
// ---
          if (switchOn_NoSymbol == true )
                    Print ( "Successfully put NoSymbol in the Market window." );
          else
                    Print ( "Could not put NoSymbol in Market window!",
                            "Error =", GetLastError ());
// --- remove USDCHF from the Market window
          bool switchOff_USDCHF = SymbolSelect ( "USDCHF", false );
// ---
          if (switchOff_USDCHF == true )
                    Print ("You have successfully removed USDCHF from the Marketplace window." );
          else
                    Print ( "Could not remove USDCHF from Market window.",
                            "Error =", GetLastError ()); //
}
//+------------------------------------------------------------------+
//||   ||||||||||            tDevMarketSymbol.mqh                   ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
